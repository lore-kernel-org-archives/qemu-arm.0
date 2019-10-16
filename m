Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7015040wrm;
        Wed, 16 Oct 2019 04:30:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMijUy26Xj+qgxuaGyKRJi++MC8Ah4dMPpZh8GNrH+8aLtFghQKg8PiGKNJDC8ekfROv9N
X-Received: by 2002:a0c:f787:: with SMTP id s7mr41694668qvn.221.1571225444132;
        Wed, 16 Oct 2019 04:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571225444; cv=none;
        d=google.com; s=arc-20160816;
        b=gxeMcAEmjPe3f/mwaX/xEmSGs5aQ3x+WVpLL6johdqwbJYrTF6FdZ6mzvpsLtmEhCs
         x1YEALxsJwI8ZNtxQOejHBHFhrhITRcd89QuHA2D5tRtaXNwEs9LieerTbf7YcVBAXd1
         Z51Afs2L1LZzV8rMP1tfKrjlcYzwSB36s4TY1U3KIc7Ys3942BuqrFxQrzSEn8gRRmuR
         nj8au8Fjb1enuv0FIAcGqMjB8MTmLG6k5NGUn9ioeIocz9HL/aPmcCp2bPWokpKQyyyX
         lhhwyAasY1aKv8w9ckRaLUvYOdJlIPDAyb+v4VErmBwe0pTAbwEusNhX0gactJNTwXVi
         6PXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ezbudHyz+ciaLuc8AlZnUmQoDFo0/hkA2HkcuRJ623o=;
        b=hvp7tWebIxGLTKqppYz5tbGJQei9qV3cEmp03hXqLKddvzUOZ5j17c73h959jC2cZW
         RGdzzX0n2L/oPZvzFU8+esEFYykDmSsstnuXmpPGBW2kssZdVtgo05H25K8KW5cfCCuR
         UH0rjf1XwTBTIm/dSGCA1Odq5bMy1yzFhGPZ5tprkU8tfyVIn7eGz1oMFaUgzltBg6jY
         Fg45pV474J0jN7uBlQNGo2Hwwx+oMO3vktoq3f2ZVNuTCZXMGVmeFaKWPEkvu2/ADU+B
         LE/0tZzHiGAAigdwJdp6VP984TALuRGr0/BVMdCp/AL6+i8YrdENLxyVzSfdwR7jeUG4
         gJ6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=FALOGVTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si2209317qkk.321.2019.10.16.04.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 04:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=FALOGVTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKhVr-0002Sd-IA
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 07:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQE-00061Q-8e
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQD-0003nC-Ab
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:24:54 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:37870)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKhQD-0003n6-6j; Wed, 16 Oct 2019 07:24:53 -0400
Received: by mail-qk1-x744.google.com with SMTP id u184so22373274qkd.4;
 Wed, 16 Oct 2019 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ezbudHyz+ciaLuc8AlZnUmQoDFo0/hkA2HkcuRJ623o=;
 b=FALOGVTVO2eaiS9HFLoXHHIsVVyOhxgs/SSzjOWuKS3L1xyYQIOrSXkGmQ8hx0LPQ/
 TMNBiTuuM//5Buri6xaws0AwERSbaUi1D/B3jhqox+ne++cObsYDrNIlgi7kFjIpPydx
 4li9tgFAzovFdrZHo+KTxECfMfyuzMJdvElak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ezbudHyz+ciaLuc8AlZnUmQoDFo0/hkA2HkcuRJ623o=;
 b=I+C/dKIjRFuyl4fY4WScIcFTN7UG0CwUJSa4bJ37yOpctq2CPgkxxLl8PRtjYIXmAd
 QPR6FOHvjmre2IPh3gBFnPdpPQtWlcBBskPzaICkyUXvnISMb2IYa2C+DH5ccJrkMgK9
 oSuYHaTMrqJ6/9B6rn3qNICbbr2a/0Qs4wNAekXbufrgl1l1PKWUxEaycsz01XT4Emxi
 nn+Qiv86GWQbSn5SFqAVA/ZhvGwtqXeAduJuZsYSXRmoJ/PlilC7swSahksmxLcRC/nK
 fdRPzGb/fMGpNXWz6jyLd2jHrLzSsKFz6x32qzY6FiRQ9SPh1tTGOHazveUlqSDeK6UH
 P4Jg==
X-Gm-Message-State: APjAAAXUtLCL396XF+Eb3VltQAt+T1hY8y0PFDoAUIBt9Ej57t2a1Crm
 TX+6LVGfywydq27UjpoD7dC3h0tbFHTlFvtCycY=
X-Received: by 2002:ae9:e30d:: with SMTP id v13mr39741353qkf.208.1571225092489; 
 Wed, 16 Oct 2019 04:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-4-clg@kaod.org>
In-Reply-To: <20191016085035.12136-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Oct 2019 11:24:40 +0000
Message-ID: <CACPK8XcUv+wj3Jv02YGrLW49nSWcW_h_7h+TUL6SEqpnwZb1kA@mail.gmail.com>
Subject: Re: [PATCH 3/5] aspeed: Add a DRAM memory region at the SoC level
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHXaPyopjg4j

On Wed, 16 Oct 2019 at 08:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, we link the DRAM memory region to the FMC model (for DMAs)
> through a property alias at the SoC level. The I2C model will need a
> similar region for DMA support, add a DRAM region property at the SoC
> level for both model to use.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
