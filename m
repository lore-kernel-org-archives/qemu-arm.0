Received: by 10.223.172.38 with SMTP id v35csp75181wrc;
        Thu, 7 Sep 2017 04:07:59 -0700 (PDT)
X-Received: by 10.55.48.8 with SMTP id w8mr3168652qkw.139.1504782479147;
        Thu, 07 Sep 2017 04:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504782479; cv=none;
        d=google.com; s=arc-20160816;
        b=wIj3P1UsyJ4QlwIJL1r/erz5I5iWZ455YQTd6MEYPrRqlNYn4RwcP7BYKAjK7wmfNH
         iUosAEgGV47b+yYFCEj9X0v7quQTlTbSi4fd9FI1G3azYCkhlXQy1EVpqWdu9V9i/Zun
         WCHxH5vOGNy2S12dtCwlvXy5VGRYql5b6a4e0IqCMBLYa+paY37TrqQSy7IS7FY6kVDE
         zucKYWxaWDHQRfqB2rCSJPjBEc8W6WMTzZiA9ePIhxaWoFXDJaksaPp00u1j/enSFwRw
         ARNaEWkQY6FeZQANYb/d5JNhvlcisZ4puivMREIVceXbaqrho4eNyrs9sHiCmd9KlrNP
         +a4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1zEmG980jIl/60KRmbH12kkVtbD97UrI9Z31w37QtBU=;
        b=FGQDkiybwkDGHi2haNj2+VMvLQLg9jr5/qfHainwiVI6jPbvoTDzQOe/m7vYbFw4ev
         aMd/YvVs+MoTWy1aJh6wbfi6xJDtN8X9VwIL5SCBMI7S4Xy5cegJiNMq78g4tZC/yi3o
         zJo7LTlhF5BUzJR9jXnFSe8s7GeQeRXDaPbQS2t/+KTNblFuwn1LumSFemaRvMMxUkLm
         V//RK218EWDfIt/XTVAvc/2AaclRvLSrcqV7+Cqn9h3n7+UO0uxcjFF/Q83ZhU+K1MMH
         COY//awH332JiMAR81KBJjIwnPuW8SGS/9QJ9DVT9rMgp2Jb+ZFSVcJ2BLGYJES1ffdb
         KJqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a/tbk73z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si2605599qkc.549.2017.09.07.04.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 04:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a/tbk73z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpuf6-0006Xk-RU
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 07:07:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpuew-0006Te-Gf
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 07:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpuer-0007EB-SD
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 07:07:46 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:33044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpuer-0007Cw-Lm
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 07:07:41 -0400
Received: by mail-wr0-x231.google.com with SMTP id a43so18740588wrc.0
	for <qemu-arm@nongnu.org>; Thu, 07 Sep 2017 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1zEmG980jIl/60KRmbH12kkVtbD97UrI9Z31w37QtBU=;
	b=a/tbk73zBYvmhMeQyBrxkycz+pMwek5yViP8LCgOIGj7l9G9ASg+5wS11mvsj2wYfY
	iDy0usB1UfuYazj0bIUDC9dYrZ8rVm3AFqQwmSphsIE9D+xcm02FEyKy1+fnEkWRdim8
	VBgnWnb+k16CbyQtP9FIXJCWjHReiTMpP2muo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1zEmG980jIl/60KRmbH12kkVtbD97UrI9Z31w37QtBU=;
	b=eZtI6b3x51btfTDdgeyKT3WBv+JHY0LPITZPdyh+9C/x71Tg0CpNjES2Y7T5BW2Np+
	ZfX4M7ql0tBmU/mprskecwljMnkFsT6P18jSZABSoNvbp2SKCkyFmU8vpA+1DxjhCeOp
	1M1P0qMg8eYbsMZu6LMQJbQvae0M0vmCMv6X1gzLb/1LLv4tv6NdbLtI+5RT3+j0zOLz
	GPZVy+Nv7TJh/INkXPseY/1Fgnl2NF5hNNVFIRuvc/VUNWwmRe9h2V7L89UQvCQCa0wR
	T2JQUG0rbC9ImIupQsAgBwdsRrgheAwgYi+bg3GrcoLA5JDhbs20q7CH/XnlLa64fKUJ
	Bizg==
X-Gm-Message-State: AHPjjUgUbkGePhUIpUStDxqR+LIxg13q04sIyc5TaVK1oVycsztE6d0i
	s8RIwphFTeiuvNggDbq/IleEv95Qhkra
X-Google-Smtp-Source: ADKCNb5JTTE2KU5asaJmPw9xZO2Pvk+FaFR1yqLGHtSXYF2SJFN0FA4afXwPQs7pKvBsL3TG0yEmwptBha6+TkmdxdI=
X-Received: by 10.223.135.250 with SMTP id c55mr1597047wrc.11.1504782460521;
	Thu, 07 Sep 2017 04:07:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Thu, 7 Sep 2017 04:07:19 -0700 (PDT)
In-Reply-To: <20170905211232.11092-1-portia.stephens@xilinx.com>
References: <20170905211232.11092-1-portia.stephens@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 12:07:19 +0100
Message-ID: <CAFEAcA9WOZcVkBqZp9f0dLvWVEyzHbcX9hqMm2Z-cNOk3=ZTVg@mail.gmail.com>
To: Portia Stephens <portia.stephens@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [PATCH] target/arm: Add Jazelle feature
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	stephensportia@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NdhF1mJ4U1Jd

On 5 September 2017 at 22:12, Portia Stephens
<portia.stephens@xilinx.com> wrote:
> This adds the Jazelle execution state as a feature if ARM_FEATURE_V6 is
> set or if the processor is arm926 or arm1026. This fixes the issue that any
> BXJ instruction will result in an illegal_op. BXJ instructions will now
> check if the architecture supports ARM_FEATURE_JAZELLE.
>
> Signed-off-by: Portia Stephens <portia.stephens@xilinx.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks, applied to target-arm.next. I tweaked the text of the comment
and the commit message a little to make it clearer that all the JAZELLE
feature bit does is indicate support for the "trivial Jazelle"
implementation, not the full thing.

thanks
-- PMM
