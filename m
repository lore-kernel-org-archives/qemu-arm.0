Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp790573lff;
        Fri, 6 Dec 2019 06:07:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEqiFgvYAUDcJHZzsoOXA6+yi1dn0Hza0/wEk47/swXgTXi4+NmErIvw0nQNpCLEuiXv24
X-Received: by 2002:a9d:7757:: with SMTP id t23mr11129706otl.315.1575641229742;
        Fri, 06 Dec 2019 06:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575641229; cv=none;
        d=google.com; s=arc-20160816;
        b=AChlhfITNQw5VB4lffY5fb+YzCw2RHiImr4w1dB79INm8r3im+frt9fK0T6BYIJU9I
         zBAfLuRi2aWRpT+9AfJRhEPr7LD/Kw0mcQ774GeFAaBXB29doygfJKw3xgaf0YLl7/rf
         yg9zxNRPeCKwJd8gHtMQVA0W9MuUz/LVnUAGUDtiuOxscosLtD15/Dsy5C2XwBgaoGvx
         Ki2G9oxshHeNV8WXdp80KC1QiF19ZBT2JLF8uGw9a5WFhDu40hcVExJXWEoD21ybhNy2
         lflNwpxJD3s69bdsYEm8Nq5ftBvfK/NMSd8bjLUPAH7CdovhUPPbVYe44MfcfdEgCBbW
         eDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cYXyl8AMCk5ToB9fyPwohHN+Sd1sgQsQirBd7UyHPFk=;
        b=IA6BMI0dOlNbr3h6NFK8jO2Vo665LMGfbxA4tU5BMKd/BJUpanm8K8GMg+/oq8fvAf
         G/kj3D5nQTpNKhsOuaiOy5rmY149k3s4/FeyZFxrTVUFk8zhkz+ff43hoZ29K3LVIRyA
         /skjH6DDUT2SXfNJbT2FjBd8FAkZ2bnOnqoENIeEWUFoTKKENmcrpxK3w53oeTVbzRli
         gHNmLUJBToZHR47Wv00M2QqJyC8l6A5cKr9vEJG3rqHirFj5qDEzOjkEvpKs98s3O5R+
         Iq5EdHpsJXISWdgo0B5Gh+GhtPnsTx+4EvXYCGlGXi4eHrlj/X9u+CfHwmXdCmap929X
         mUGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HpckPagM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si6594583otj.82.2019.12.06.06.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 06:07:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HpckPagM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idEGC-0000kN-W2
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 09:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEG4-0000js-ST
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:07:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEG3-0006Yc-Fe
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:07:00 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38756)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEG3-0006Ws-9G
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:06:59 -0500
Received: by mail-oi1-f196.google.com with SMTP id b8so6256768oiy.5
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2019 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cYXyl8AMCk5ToB9fyPwohHN+Sd1sgQsQirBd7UyHPFk=;
 b=HpckPagMtDVfW21+RGXHGUL3MffnE2Q0RVPX5nHcCmDwveTkYH5y59BkHJgbYEi0UL
 fcGmF5HmxJjfJcgjCRtZhDy+XIYk1ja+JfuFb8LBrAGiea4FlPe1xiTxjKnWINy6xhb6
 LGxbDKpprGMd5zS+/q78/l6iDLCwL1rxW7Ld1NvVbKJ7pKD6m72ZuFSNRMPTEXSK6rNf
 DQk5haXynfV2fKy0k1SPPHnqyvUZZWammFwbuL3OKrTIAvtiSsOCqLZ63O0ts2amUHG4
 /OXIfBr73MDOYl7OxgMJW/kut1/HpKDxLyBBAaOCaNvMinOvRBD30QFGeWyF2JjiPoBp
 eXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cYXyl8AMCk5ToB9fyPwohHN+Sd1sgQsQirBd7UyHPFk=;
 b=lGXNm4SLucmDfsylWoL/JGGLiusMW4/64rhaac6AI0SwuOH9PLpK2sJSvVYOHohc/K
 NHiZfcX1QafIRFRvxiLkWZeomlo+4HmPoDH9PAkGxbthRlzxYlfG9bunuXFbViNDpkvg
 +27FI8SYesb7LKNmH2uEPEui1/9Q2oYQ/dTy2hljk4dithVzXYlLvkunEGLO0/iHRQs/
 eyhO9x6ppZiZjaNTwjPM2CEKBvWdkrrtKlULHQWhLr7zF2nZh+8qt7Z0AmKyc9F8Tr4H
 rPhUTlR+cTsSrZUIN+SZqhK2GXrfODKL0sxie5sCC8spjogv+HSNdArz7ttvVe2QbL0V
 tn9A==
X-Gm-Message-State: APjAAAVW559jVj2YbXUranB6bGgNtwnw2ZCdk1jMK8zntf4s8/JoS9sX
 nQ6+WAIk43ZwttnnFrl9d1OdO0GDFxgaobsHXT1IeT1y
X-Received: by 2002:aca:edd5:: with SMTP id l204mr12409527oih.98.1575637968500; 
 Fri, 06 Dec 2019 05:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20191119141211.25716-1-clg@kaod.org>
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 13:12:37 +0000
Message-ID: <CAFEAcA9GANxjJ1yJ7Wvaj1Yt=7QXc6_A32wa9gayfcupAfme7w@mail.gmail.com>
Subject: Re: [PATCH 00/17] aspeed: extensions and fixes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.196
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xK2WmaCmzKf3

On Tue, 19 Nov 2019 at 14:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hi,
>
> Here is a series adding :
>
>  - support for pool buffer transfers in the I2C controller
>  - fixes for the AST2600 and for the SMC controller
>  - a new Tacoma BMC board using the AST2600 SoC.
>  - misc small cleanups

Applied to target-arm.next for 5.0; thanks.

-- PMM
