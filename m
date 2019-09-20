Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1946995wrp;
        Thu, 19 Sep 2019 21:56:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy519zYMGlO7FM2DTAkRGalqXgair7JmB0OZWoxVZQdsWudtyuiVPJ5lX3GFbcJUC5IHa48
X-Received: by 2002:a37:4d83:: with SMTP id a125mr1705833qkb.111.1568955383884;
        Thu, 19 Sep 2019 21:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955383; cv=none;
        d=google.com; s=arc-20160816;
        b=dg6IcVXwICG3qXbS1CV/0iqJPkNb2wQcDJdblpnEDMPuONjL3B5IPw6TSJM+GqQTds
         uyknjukFA7cOHZosSBmjPcMCIn46GmsmDM7wIxtqM6B/MGDYyYR0duNF/bWAD7PWJ/Dl
         Gr2eRVC6PVBWMRN8+BuLb0Dk35R31VUZjTqBmRUCT8gePMfeMjWQ25Nem0cz1B1xVZZa
         EhcZHGZ7o1aErQ0Gm7tKDC30D6H7DL0TadB40nor4c8RR62uK7ck8Etiuky+/WwW4qOI
         97EAI0/CEgddz5NiTHuuQmWUwFyafR1foRtvjyW4s0liHmJwWzro8VqNELv4n8BBI1P+
         CWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6/hI1t9pBCVpJTnR1y3IoHPCRw7/S+KvSWuUbiyLS6A=;
        b=AmMZZ1eNDKujrwuCaoretVI/v8Q3yACE/s02ka37CHsCX25pW7IJA+Yo2jP7nObss3
         h6ttWUtxR6TIXkcaSMAS7Tf0kvVYbSwtmOC/qlTdrckLPUlI0IoYdaNr6ZMILGCQsCaB
         7RK1SiYUCsmTIynOvbxGtN6funrfJMmFhSP8u9DANGLMP4oIlgA53mUsJep40+6IBwv+
         LjVo0z9r1+BL9O+p6Bc3W7cQRaGmjTT7vB+a+t63DXMjlscrf9ZAkgCrVPvj5T5w5N0w
         ahbjiHpvTdhQtzcgbwIJgyroKyl8k5cizIAtLOjoqwii54trraIESXa4oNpR4sf0SRli
         X7Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=WMF3EC5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si1278320qko.7.2019.09.19.21.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 21:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=WMF3EC5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBAxz-0007ar-6t
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 00:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwN-0006rO-Px
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:54:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAsD-0000ea-0e
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:50:25 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAsC-0000dR-TR; Fri, 20 Sep 2019 00:50:24 -0400
Received: by mail-qt1-x844.google.com with SMTP id w14so2780099qto.9;
 Thu, 19 Sep 2019 21:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6/hI1t9pBCVpJTnR1y3IoHPCRw7/S+KvSWuUbiyLS6A=;
 b=WMF3EC5oo1SMOntJMxy7yVDrQiJBYxb6PRHUAVwod5x13uDugtT9Ei7YxbAiqZIFFm
 YpwPfjz4DMGEg/GjnAjSHwWB7X8tqvtG/Yoo6/i2xoJ54VdmM98l79CtuZwe2pisFs/x
 s2lIr1kzcoBTAbRHmTZ9QeugVIZvZj/XGtfAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6/hI1t9pBCVpJTnR1y3IoHPCRw7/S+KvSWuUbiyLS6A=;
 b=IiBZTQNz7AtA+hYg/bhAFJ/vZ7Bb3aT1KPP2tV7VSzBb1ucLwN2RyDwwiigu6sa5uq
 ACybEsXGj/KK+MJtjMzqmoPetj9jEIi3W/5mL7aDTkkFiD21IqwU6+iO08OXx1/fcTE0
 zQtfyxLGiae8gFONXffCA6/gcD4hZfX3d7N8U9QEHF7StQZr9YRtaB8xx92B3zVPXeWd
 h65VC+9SCT2US8iPxeyf+9lB13WFGS2kxibk+gGKIy6dqJqponnL0BGdRKkoiKnljqTv
 Y8t5b5JvWJd+8t65far3XsrcdFE+5z2mRv8rrV0f+Z6mfTDly0gjTiUN5C1A4XAQQTo3
 i2FA==
X-Gm-Message-State: APjAAAV1aGoQmQCgz+E17/kjb2LrDVFpM6PLEoFXLuxtuupfHYL2+hwL
 TU22Q3RFCyzWrJUZUAPh2IO4bo7Fz/7PcB/kHyM=
X-Received: by 2002:ad4:42c8:: with SMTP id f8mr11236135qvr.94.1568955024075; 
 Thu, 19 Sep 2019 21:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-21-clg@kaod.org>
In-Reply-To: <20190919055002.6729-21-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:50:12 +0000
Message-ID: <CACPK8XcPX5zRuJYDWquTrbwW8ZrYsqAeOo1bza1HbWcdDA00Zw@mail.gmail.com>
Subject: Re: [PATCH 20/21] aspeed: add support for the Aspeed MII controller
 of the AST2600
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: URtrWB39TKZO

On Thu, 19 Sep 2019 at 05:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2600 SoC has an extra controller to set the PHY registers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
