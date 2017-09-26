Received: by 10.223.172.38 with SMTP id v35csp3778033wrc;
        Tue, 26 Sep 2017 09:37:26 -0700 (PDT)
X-Received: by 10.200.4.169 with SMTP id s41mr15918363qtg.132.1506443846343;
        Tue, 26 Sep 2017 09:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506443846; cv=none;
        d=google.com; s=arc-20160816;
        b=R79h9EKpAIPjSnDfY6riYmxiUZoyae/6/E117OpFxW/3dzRSj+s6TQRiOi8vfsunZG
         CVvkHUs3M8k2fyLqDh96WQLJLQSh2UyvbUCL2fCHUWCtS0SIqXHAHkQ+F/8++Fcz+cXB
         Xvk3kTCwdkHR6gdmcZj+szOyN2E4WDG5EGMk5dmIBxxjTriJYgLnAPa3Uc7Ft4UhkyR/
         Gjal1UX0oTrldlGDndGC1OukO5xZmidZrF0jgcO4KNk949d9sraenxYGmZWsLix7t89G
         NDRQZY2TflKnR2JssCYyVj97fUIO3yiWZnU14sp6EO8QhU9aZ4el4ZrsSfp8kC4ai3q4
         xK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PFYh+xz8uKHVqDvmLIoVgLWxjnTRcomloMUXpiVK4aM=;
        b=Evw3tmHdOXwgK/VhR1XGGW3JZyAN8kJZZMnpxzVmtxQJNke0VxeSTfftY4fuECo4sU
         h5V8pkbrFs0BZ29Bu0tavOEl2c9SnkX97nKTwSINphRdapSLErBseooFww1IBU6kqa7r
         RDARkMbcnd3IbTHW5Lui/E+jhJDOFU1cCWJujEzfCIMSHdYz3wXHr5MOqo41MJKdHcSj
         xvhVAdbbXjXjvfXVzBQSZT8Epk6qqj36QoL6OfTZofLzTPIBKRfVoPGBsiVICgTm2kv2
         5kLjj9ZL+tPrlYDsAH2UsVfwwROltloeb+aaJ7B4zw8XCwEgXfgtSguLWlRYgw2axV8a
         PN7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XrRT5bij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h16si1112592qtk.307.2017.09.26.09.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 09:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XrRT5bij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwsrM-0007Dq-2N
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 12:37:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dwsrE-0007De-Sy
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 12:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dwsrE-0008M6-3O
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 12:37:16 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:45372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dwsrD-0008La-TD; Tue, 26 Sep 2017 12:37:16 -0400
Received: by mail-wm0-x241.google.com with SMTP id q124so9848308wmb.0;
	Tue, 26 Sep 2017 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=PFYh+xz8uKHVqDvmLIoVgLWxjnTRcomloMUXpiVK4aM=;
	b=XrRT5bijks18Ia6D4tjqoZpAoae4JY/JumcMu607f34DM+15GryWOl8TG/Vzt4HHxA
	JGZj2XTT/gr96Pz8ueetI6GhLP6ye62ztkTOKcGQ/26pjMJnn52/k+1dfUrS69qg+D8z
	190S47NwynBAHNDPRRWbAJcfAxNSlZbaBfz5shGtIluiIJ0tO8gF/afaxXgYQpL7BNYF
	SjShX/PnOD6zGloshnj6X1zyGqMbgBspiNF2gG3fpbIhvEa3qBnHpvuvlYuQn1qSgC+A
	OsakriHpsR+8+IBh6P+ytPWG6F6nwjE1xZQeYFKI2MBWiFxnM4kzJhfK6cStcUxhaMbO
	guRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=PFYh+xz8uKHVqDvmLIoVgLWxjnTRcomloMUXpiVK4aM=;
	b=bicNMl2DVFmmDaqVoDrkgL9+776L3UlXpVvAf+lTkDlUht1MbKzXXPYq8PGry4EthV
	h3U4MYwrhQYlaMNt2xyt7F8mqq712TSWNH/G18IJD0Mz44PF3ySd3+uHwQZhtym5CKJ9
	wFc/kkMJix5Z4VOQd9tRsNvskb70yz0Jpbx0V4XdVAxZq30zQoRgMTXih4sm+DvePQfr
	lhAntAABio6IhQyIhaNfG/HPoayedB6V1Rs0tD087BTefn+2ZsJbqydggvBkLaHpix+s
	1XKE+/THeXvt+76VjWmpu6afUDf1jIJjIYHHFSGoIsdt+U4L7uSJvYfXrG6a6nmwT39x
	VoGQ==
X-Gm-Message-State: AHPjjUgl42cJNdgsHXoKfzv3PWCeQHJGcWjSqEak5/7w5nN+02gYkZox
	F0UQcLS0C06mT3TjZsFKz9Rswd6m4itMEVd2lhs=
X-Google-Smtp-Source: AOwi7QD7c3TXInPeyAVIxgRRofVa5VfR8ghMNU23MCjBxMcrYj0fpnzCrJBaVkPlo6m6dw/VyX79PlBf3cdFASEWtAM=
X-Received: by 10.28.130.130 with SMTP id e124mr3394151wmd.75.1506443834662;
	Tue, 26 Sep 2017 09:37:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Tue, 26 Sep 2017 09:36:44 -0700 (PDT)
In-Reply-To: <1506441116-16627-1-git-send-email-thuth@redhat.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Sep 2017 09:36:44 -0700
X-Google-Sender-Auth: 9XvMltVAiXQPDLJ2TRTe2IqgHlc
Message-ID: <CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark the
 "xlnx, zynqmp" device with user_creatable = false
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XOHbBmSmGCuY

On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
> The device uses serial_hds in its realize function and thus can't be
> used twice. Apart from that, the comma in its name makes it quite hard
> to use for the user anyway, since a comma is normally used to separate
> the device name from its properties when using the "-device" parameter
> or the "device_add" HMP command.

Is it worth changing the name now then as well?

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 2b27daf..d4b6560 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -440,6 +440,8 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
>
>      dc->props = xlnx_zynqmp_props;
>      dc->realize = xlnx_zynqmp_realize;
> +    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo xlnx_zynqmp_type_info = {
> --
> 1.8.3.1
>
>
