Received: by 10.25.21.156 with SMTP id 28csp320480lfv;
        Fri, 19 Aug 2016 06:04:39 -0700 (PDT)
X-Received: by 10.55.9.140 with SMTP id 134mr7910061qkj.191.1471611879507;
        Fri, 19 Aug 2016 06:04:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17si2629543qtc.32.2016.08.19.06.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 06:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bajTS-0001YW-Un
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 09:04:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bajTM-0001X3-Pj
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 09:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bajTB-000070-7k
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 09:04:31 -0400
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:33252)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bajTB-00006p-3n
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 09:04:21 -0400
Received: by mail-ua0-x22b.google.com with SMTP id 74so78607074uau.0
	for <qemu-arm@nongnu.org>; Fri, 19 Aug 2016 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UwPyA5x+BAnnyGt61ZIcI7b53ZiinrxRhwVlWKyHvRU=;
	b=Fb1Umxy5eJTWhBRyo0BxQQUiBpa85utIb+8j9QU9zPnrlY6ZUw0qK+CLzmG/bg0OvY
	cJYmheIgqH/E7qQhh++RGFMeW+rlZ33QooLxDqKv474ZTIpSc9jwzwnzpicGsCStNdGk
	NgUeVCNRdxNfDT4rLjX7cZbj3kpDYiQM95RZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UwPyA5x+BAnnyGt61ZIcI7b53ZiinrxRhwVlWKyHvRU=;
	b=AxWDLTEm4OYOx2NrNlxcFkUoCZxa7nTFufxDBh9w3k8u1cUAPXqJkImDrR+oAPKM1w
	jpWwx3HwJhul9+zEV7aBVU/qYTHFyqql3ILmfsW2VeCtl6JcwNcFMBXx3fvhxGGTT17x
	4fzuIPQdeMvC3r33Ec1XCKyUwcGRAd7bhu/szcUAreTT1Em21eWT8BGLzoRxmFNPcgnQ
	iO7t1SKovSSH7H1S+Y5q7tbXffQRxOaXSMDf8b+F2Mya9up9lopm1m/DjpgAvuojAiC+
	Zl6KO0cWz+OMS+kNjgqj2CozMTHot9rdV13f/YhM1GAqaom0SIsWBQkRXCeeM4RrxpRT
	SsRw==
X-Gm-Message-State: AEkooussvq249dVXQs4x+06Rq6wCYUAT4FPEwqfM7pMqIAc0xtwmoCr757Z3P+evNnqtM2Q0hUq9juoR04s+xKy8
X-Received: by 10.31.15.67 with SMTP id 64mr4095230vkp.37.1471611859545; Fri,
	19 Aug 2016 06:04:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Fri, 19 Aug 2016 06:03:59 -0700 (PDT)
In-Reply-To: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2016 14:03:59 +0100
Message-ID: <CAFEAcA-m6B_S7zYRE0iqbL+sR8ieJweeVDHqxgx1JB+mGywo3w@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-arm] [PATCH] block: m25p80c Fix vmstate structure name
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	rfsw-patches@mlist.nokia.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JR6ah7UQ9m7y

On 19 August 2016 at 13:30,  <marcin.krzeminski@nokia.com> wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> Change wrong name of the vmstate structure. Since this breaks
> compatibility update version and fields to 0.
>
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
>
> This patch assumes that none migrates m25p80 flash devices.
>
>  hw/block/m25p80.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 9828ee6..d29ff4c 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1189,9 +1189,9 @@ static Property m25p80_properties[] = {
>  };
>
>  static const VMStateDescription vmstate_m25p80 = {
> -    .name = "xilinx_spi",
> -    .version_id = 3,
> -    .minimum_version_id = 1,
> +    .name = "m25p80",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
>      .pre_save = m25p80_pre_save,

Are you sure that the name is part of the on-the-wire state?
I thought it wasn't, in which case this doesn't even need a
version bump, much less a version-reset-to-zero. But I could
be wrong. David, Juan, Amit?

thanks
-- PMM
