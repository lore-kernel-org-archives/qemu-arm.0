Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5599859wro;
        Tue, 30 Oct 2018 06:42:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dfAATbydHUZj81824raD+5V6/4AofXPwGRM2EM5XX9cAUn+U8sfy4coIc39bVh1DhZoIer
X-Received: by 2002:ac8:901:: with SMTP id t1-v6mr2176848qth.335.1540906945037;
        Tue, 30 Oct 2018 06:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540906945; cv=none;
        d=google.com; s=arc-20160816;
        b=dYsI/1sN3iUGGG4NGGPcJIV7j5gu+xzuwQshCYAF3UUXfXlVmRpcQd/+sDYk3bjAMG
         9QRl4x4t6Zbmb+JSec/nbynO8EwgvvH3Zfz12TzACtH8O5ZrJOiE9DDi/S3QdJLjWL/N
         QzsO9qgMnNHwd2P/xmDiyQpYBoxzfimTDf4+p9FaTKuym5RU8EwKMTR2K/1f+471tjmL
         8KjDZn0nb4RPZjq0kMvfSi/3Pu3RGldxQZWtb4dnFz5sz5ux7yJFDQj2ozsgZ+3py+2M
         zUsTJLCyEUgUjkAWLzfcbQDPrb63uBgkZqiXcorJsEGtmk7ioOenhRgeeSSLEbefIIBe
         B+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=U+ZpxlBlUlh90Una4x7wQkF/+r/5WMtVjb+elbgBAvc=;
        b=DW1ENy+3auOQTNWe8euC+DxAAu5OQEo3qNG8yq3DDijycSATNQcOr9W7ZTCrcNL/ye
         rQpwr2zrOc+3BQXrOmMLpURBNNGbZLhUBrx7v081MQbE7gAqkkKAD0H3oMZH3eD8TtVB
         Nx3Z4euoEsjFXuGAT1pUt8fOGuMiwsJwv3lHxT8ZG4S7P99B44rmwqT10ymE8ntYPcIM
         yutd+1UFBRQ5AzdGcoK2mY2IQT4lVAPVbtsfPhdHId3oL6l0dXS766aLVlxX0cM4D2VN
         f/hKcQacOp/U78f9cN6NnWsK474x7eWNlHQrswmijZvTSDG4ziGsWNJ380o1NPBYu0tJ
         rptQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CFppDPQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q49-v6si11405073qtc.339.2018.10.30.06.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 06:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CFppDPQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHUHo-0001SU-D4
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 09:42:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUHT-0001Pr-6N
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 09:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUHQ-0004lv-T3
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 09:42:03 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHUHN-0004cw-9d
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 09:41:58 -0400
Received: by mail-ot1-x341.google.com with SMTP id p23so11078614otf.11
	for <qemu-devel@nongnu.org>; Tue, 30 Oct 2018 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U+ZpxlBlUlh90Una4x7wQkF/+r/5WMtVjb+elbgBAvc=;
	b=CFppDPQtETwWfbbKPcby+3p5/f3p7ezsXcazGIt4V9lQfNqi+aEhCj9n56bwJNzNhk
	BrdbPu5MhguKHaJL9hNktEWcY7u64nLFPO2B4C9mfdHU6J9YqJ39wNO9YLxi5Ap3T34T
	98ZFHk4O3YtbvXQJ9DwZbIaqBlyPY/w2P4quw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U+ZpxlBlUlh90Una4x7wQkF/+r/5WMtVjb+elbgBAvc=;
	b=TeVoDm1kZ1J92+pizXtsOryClJKDr/f7Wdz8bApGajTOUc/2UjYTqti56Jboixq37D
	e+9aUig1ViicUgi9j8mL61Zz3evU3sqyvqE2DUWJ3AHbrt28jCw910R0eJ0mWFdSgbgC
	La0inUeoZkbLgVnwvtXlqEMRzw+FK7dRPgPLYeraYLEhA4gf4nuZAjnTsJH2cCY0X8SI
	LVn6MZc9UA2OtvNUo8nJubRSEUMxY9xe1fbAwZ55LNoyPjcxyKQLkYnD3SAqlH5Ays85
	giIkOwH9nPY6xw0sKUjQrl8VIbkGY214DSITbbdMMoW76s611YIdR/e5rH92de9rI0US
	buqg==
X-Gm-Message-State: AGRZ1gKQVycAUCozOm33jiyatxsKKdCvtuzEw7c/pVXu3u/zy6Vfi6Du
	k0BPnRdp8Uilx37ZU+bl8uqVXHtecgaTHfeM8zyTYw==
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr10287428otl.151.1540906914821;
	Tue, 30 Oct 2018 06:41:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 06:41:34
	-0700 (PDT)
In-Reply-To: <20181029195931.8747-1-philmd@redhat.com>
References: <20181029195931.8747-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 13:41:34 +0000
Message-ID: <CAFEAcA_JXyRqy2c7C6GqGYFoDPYRmccCorP7-f2U+tDtW2ZiUg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Remove bouncing email in ARM
 ACPI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oN/49NFVRGqq

On 29 October 2018 at 19:59, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Shannon Zhao's email at Huawei is bouncing: remove it.
>
>     X-Failed-Recipients: zhaoshenglong@huawei.com
>     ** Address not found **
>     Your message wasn't delivered to zhaoshenglong@huawei.com because the=
 address couldn't be found, or is unable to receive mail.
>
> Note that the section still contains his personal email (see e59f13d76bb)=
.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66..1aa2728aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -625,7 +625,6 @@ F: hw/*/xlnx*.c
>  F: include/hw/*/xlnx*.h
>
>  ARM ACPI Subsystem
> -M: Shannon Zhao <zhaoshenglong@huawei.com>
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained



Applied to target-arm.next, thanks.

-- PMM
