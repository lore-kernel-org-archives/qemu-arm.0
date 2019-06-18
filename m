Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3574753wrg;
        Tue, 18 Jun 2019 04:03:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKCuVmtpCHw5mVwMpcet3jwQSVhyxpv0I5hCv9Fvvlk0+iTl/qaou3//Yxyc9QZd/eFE6g
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr28909643wrw.8.1560855793042;
        Tue, 18 Jun 2019 04:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560855793; cv=none;
        d=google.com; s=arc-20160816;
        b=R2ID5zmP1DfNI0VMnIPqdJVhMuOeIyQLGJL2gbicYe8y/SVlzASJ5JZv3cujXi3jkD
         h+f9LfA6bd9HmzWpI67/qtipJYvVNlNsX8dynjYz/eGWmt83jJQzGplzAYpBMAP8/OAX
         InJU7NsdxkmjBxgGnUi33cNiAuam63lk0fB0LEg1a2/QiC7YKSmgB30R/Z0SDp6206A4
         7brpwF7S3bU3OPw3Kq0PiAstUNC0LbO3v+GbxbpeKYkc0NDRi4olzNR3yEg6Zi1YiGyA
         25+zbMPGUpES80+kkZqSxolBs2YMySzwPGVaJHjXzS8U7uoufC54Kw9sC5QHHbeksuD2
         faDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f8CQP83j89Nl2Th36p57uvmIreOMxHar8aEoN+/+jnk=;
        b=URSvv6Aei/yD1ZKYf5F+j2Yhppqc33AZy+y2bTnUkv++zdoTjI1c0bckIgbuC8FTda
         DB2zcir0IbHzcF+WEyvmxhx1kHyzWW9uXnCkvBpcKN1guvP6XplfWuULO2w2YxvtYoi2
         5Zn6m+8VoZCxyn+KZk8CCJ9XDf0IaaRc+Y+2CXh3BUwxL/t9YZw5FecDdPy5E0vmIAPC
         NCMCFiMaB2J3jfL0ebZDTIHESG9pK0c42tNUDFInbSU7rBfiNTdWBNl1e+C5JoimMiGd
         ZDnHlKeyt/ddrVz7t9If20V7awWwktzaYih4mQeS4dB+GlVxbnogt92i78iUWcPz2zMn
         7CuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QY7oqpfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v55si10380310edm.106.2019.06.18.04.03.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 04:03:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QY7oqpfB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdBtQ-0001GL-52
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 07:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hdBt7-0001Ek-NW
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hdBt6-0002Jk-MR
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:02:53 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40716)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hdBt4-0002FN-OH
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:02:50 -0400
Received: by mail-ot1-x342.google.com with SMTP id e8so12860387otl.7
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f8CQP83j89Nl2Th36p57uvmIreOMxHar8aEoN+/+jnk=;
 b=QY7oqpfBouT7I8sXtlFZqQNHjDlf0ox8T21AeQT935VRHML4Svm5VdxlJP6Nwpmf9Z
 fD0VGxuFDvl6/2l4i5E5KYWsJZsItp4mXDrv8cL7vGlssZDar72HcnsGWYLdQcX7HTQ7
 BOBUFpFsGWI7JtGBRa9NPuGr5MZZ3hyje9tTDRa9nYaHqTAahLWmg3HCtj0DhOXb0G/e
 kqRspsafbB9qtZpmX8vacW1Zz9obWMsBAiK5I6Lnkl98w+I7hw5elv1g25ipyu4jhYYb
 4ucfqKAOvVHVFI4Y7xJnJqJatJW9asp+tN9wdjyhPg7SZJmAC+lX3MZF/EyUsUQhZ603
 iWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8CQP83j89Nl2Th36p57uvmIreOMxHar8aEoN+/+jnk=;
 b=LzD8WIVwFeDNPLm3ymPdtrqjiYJO++qqk8Fdd9EXHLUtd0RIyp00jS6Qu9WgX3upQH
 6/DxBKFHuJ+sRDFGx/zK5Xkt3phDrFReP0/LD0sMqk/c6cL87KrHeO0wVw8ZOFB8QTtd
 nK6l6kR8cMgPC3+2WVx/jLH4hNoB118JWDpBIPq5BdnKigXJD7yRZivWmxQXNbCuaHeG
 JpLDf9nnlfAIagu1HceKczutmKyZmAfOJSfM1COUUdtRxpKbrAb+vLU6CC4dXbA8WlyS
 0BaF9fl4rGTA8lotQeho+Ew+WZtnbdJ+8y3AghD2mQ6vo4dkbfhIino1Kxl8SVikYQX3
 JzTw==
X-Gm-Message-State: APjAAAUYD4pIqDdU3Cr3rAJ8QSwit4mxtOX0PHDZa9Huvy0t4po86+KV
 vvLok/xxZSnL3kRyQZY1Vu0qgNQYKaAO1kxiRSk2mQ==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr3991972otj.97.1560855768349; 
 Tue, 18 Jun 2019 04:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190618083442.10407-1-drjones@redhat.com>
In-Reply-To: <20190618083442.10407-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 12:02:37 +0100
Message-ID: <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] hw/arm/boot: fix direct kernel boot setup
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKqxKbb+JkiC

On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
>
> We need to check ram_end, not ram_size.
>
> Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
> DTB off the end of RAM")
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index b2f93f6beff6..8a280ab3ed49 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>                               info->initrd_filename);
>                  exit(1);
>              }
> -            if (info->initrd_start + initrd_size > info->ram_size) {
> +            if (info->initrd_start + initrd_size > ram_end) {
>                  error_report("could not load initrd '%s': "
>                               "too big to fit into RAM after the kernel",
>                               info->initrd_filename);
> --
> 2.20.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I think I missed this because my test case doesn't have an
initrd -- direct kernel boot works fine if all you're
passing to QEMU is the kernel... I think we could clarify
the commit message a little:

hw/arm/boot: fix direct kernel boot with initrd

Fix the condition used to check whether the initrd fits
into RAM; this meant we were spuriously refusing to do
a direct boot of a kernel in some cases if an initrd
was also passed on the command line.

?

(if you agree I can just fix up the commit message when I apply it.)

thanks
-- PMM
