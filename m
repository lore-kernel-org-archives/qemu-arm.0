Received: by 10.28.71.27 with SMTP id u27csp793583wma;
        Fri, 23 Feb 2018 08:33:42 -0800 (PST)
X-Google-Smtp-Source: AG47ELuo1TpeOvG+NlIP+DKUsCYNMt7ko8nbiPA/xFRKMU1Pu065Qoo/1tI8uOpn92uahhZ8PfJk
X-Received: by 2002:a25:650b:: with SMTP id z11-v6mr1503614ybb.201.1519403622558;
        Fri, 23 Feb 2018 08:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519403622; cv=none;
        d=google.com; s=arc-20160816;
        b=E6ZGCi79JjQe1fhsI95/O8/xzvUIG/Leq0V0shNaNt94OQ36PtevTwmVigCSyW8ivC
         S5RIrPpOvfXtGH/J+Sw0dVvGViW36hrTWM7P/4ZSwZFUwt0LVANBAip6Ra+n/4Afvbis
         xAJRY78F34k2IeesMk2+dY1pKh1JeQ3vRMW+KW4g2j4SD4yhi57l3niCRBNoIxLQ2cI6
         TeXD5puZujIaVEPJtGvtEdGEwf6e6VJch9FuWkWk1M6uTiU0+K0r6PeOPs6hG1zzcvgQ
         EMzvtdx3nGgK4l9jpINE9/HoDgCAzcaeuN/Yp3iDx3XzefdM0Vvwr28K2xZ7SaxGOWZC
         y0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Cfl5xXlpnPB3ch3cEQDX6L1PExzH5v5i3s+7X6F2Yq4=;
        b=vMkm808TsFAyw6PJyx+BeyARRnGTf3Lf13/C/IZ1Qx+sAixU2gPUXQhLhdf/ggVp4u
         fK487x0F3LsM/tduwTnVsSudb+DfD+7jOus71n78md0r8wUTZIIDIiXuDaEA5Idc3lr2
         o2078Ma2v7iWmktCS1CZ7fnz8R3aaSlDpdAegymkXEBbTPbV5XiPvM7JpHGtXBqiUGdI
         ushvWnv4R5BhGE61xHR0baCiOtbrL+nr8ym+IWbUsGnN+ULWSKQJQ5FipA8rvZGcGCKV
         UtNE5BMD4t1XZ8P5W84MuN+PpTcvBauJK9uANxpAtkauaCLCdh4wombesBfzDZAJp5J2
         l5pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E7j8564d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u7si460386ywi.146.2018.02.23.08.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:33:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E7j8564d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGI1-0003h3-Vn
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:33:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGGz-00032r-Bl
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 11:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGGy-0001cx-G9
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 11:32:37 -0500
Received: from mail-pl0-x22d.google.com ([2607:f8b0:400e:c01::22d]:32933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGGy-0001bt-98
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 11:32:36 -0500
Received: by mail-pl0-x22d.google.com with SMTP id c11-v6so1761109plo.0
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Cfl5xXlpnPB3ch3cEQDX6L1PExzH5v5i3s+7X6F2Yq4=;
	b=E7j8564dZIw1dGIUJLDYMu0MnSEeWXxYIZN5lcR+bmFff1G/8COp6s+JMDT1p5JPGX
	Gy6LedSdhBAPWVoiLPIgf/vr+5XSOFS2OGhRfD2JqWM72LpC7inOF9u8TqkxeT5aUEoE
	U0bCDXTPwef7f6OZpcdzHnfVEvkgnAweD99fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Cfl5xXlpnPB3ch3cEQDX6L1PExzH5v5i3s+7X6F2Yq4=;
	b=SwqsMuAucVc/DrFstDjC/7oR4JU0DBAXJRuNGZAE73+hvMScZ0ty1bWgxOoK04zxI0
	7QGiZhRMsxtTUacn2gtgLGArnvpaExFVAU+DStrQ4RnpM9I/+CuKoeXFTqHTudIyVf2C
	fiQiX7QcMPgirk0t1aAVuvJ2NG28ArAmm81+8cYQqS29CeeNNwUtve8230OKv46Qik7g
	I4kbxWbs6slEOoTuDfLeqCbNDibjQwGT3iNY6Gfk9HAm2gFFY1ezxy883WoQhg1I163Y
	wKDvqXVrio4D93ucgGpnhSUpHl9Kfd0KJqRetkv+SJCaBn2TbTA1Ap2PBGbLdCvemfFK
	/uQw==
X-Gm-Message-State: APf1xPCBrRAcGEcNDvkIVi9NkL5EUQ1TXPTE7iTL9qsMSeSwZZpJnvem
	nlYvcGb/91drOVqfG66EOYJb7N3GnYFRGDFaDBOB13jE
X-Received: by 2002:a17:902:a515:: with SMTP id
	s21-v6mr2220695plq.393.1519403555409; 
	Fri, 23 Feb 2018 08:32:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 08:32:14 -0800 (PST)
In-Reply-To: <20180217182323.25885-38-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 16:32:14 +0000
Message-ID: <CAFEAcA_QLFNN7pRo2ebw0_YOC59wHp59kMdXZ=18OG+kfkic8A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22d
Subject: Re: [Qemu-arm] [PATCH v2 37/67] target/arm: Implement SVE Integer
 Compare - Immediate Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 24LKY9YcReDN

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 44 +++++++++++++++++++++++
>  target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 63 +++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 23 ++++++++++++
>  4 files changed, 218 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
