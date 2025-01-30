Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp52989njl;
        Wed, 29 Jan 2025 19:28:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9HiunfgFX2qdCsMUYFrexHSVEmjgcMFjyvBXTYFbTNJz8lo1jZ3kg+vuITDbH/vmvOnibcz1AuekOzA==@linaro.org
X-Google-Smtp-Source: AGHT+IHUN1yz0HVuha5jR0CZyikhrL6M2JpZ04cAISVsLaocQw/jDb9lICyg+aByK8MnQFIKzwuC
X-Received: by 2002:a05:6214:1bc7:b0:6d8:f612:e27d with SMTP id 6a1803df08f44-6e243c64956mr90473226d6.32.1738207699353;
        Wed, 29 Jan 2025 19:28:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738207699; cv=none;
        d=google.com; s=arc-20240605;
        b=Xq5UG8hHhYC6PMozM919gOB5jjPZjhb2lIHjBgLmkdVao1hBVH8XPuEhc9qOxMy36j
         ika6idgBY0b84cp4FtDSSJ2uAZZcLiITNO/1W7wBSNA3/8nTxBqnVqMAec93UxrgwwYK
         iN0UU0CTOG+aennD9hCu1UEo7i6Mo+YLlZYFsRYUwU5AHrFq/ooiRDoLNtW+YlSkIsbd
         /ADwvSLlLqJX9DlK2ZdkPHJgoxoGDyz1lq3f0GDrKuNWItyMzxo5p3M3OYNVzgWaUNx1
         bzMr06gE7f9B4H2sSrGj7hRzpFP2MIRrF7cGrbaudh9tFvI5PDOIX4xvnSqdC2WMJ8cP
         ZR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=pgDb+adZTooHqfIslcsU8s6nscTALv9h2vLmELwsp3o=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=QGh2Bs2RvznwjFCi8QhXRkQp9ZC/TZzl2GdjxhnWgEwRPDRj6YDUi3XTHyDGatlitS
         nNDvIKnaMuG9FOqW5mazW+etwePBJ+N62dPy+rukO+w6gFHZzDDipgcMuT0FEMzuB2/t
         LWwwOSb+PjWBA43CiJoRShBzJM6o02vJWn3av2/rSTLZNDk34Tcp5MMpcLNuG4Wkz1Hr
         bonA6g3hwIYPIy641zoYrhY3+HYbf3MfS5dsTOkcpT2AiqNnHNkSStOUqAC6ETL/1ui3
         fqnrKjH+6Hz32N3xf8GXjABORQcIaCUnGRWm7rqBZOQAO4KBNL911sWZJv08UWy6eOWq
         NCAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=BmCEmDJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e25499f0dfsi5206936d6.274.2025.01.29.19.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 19:28:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=BmCEmDJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdLDq-0006qD-V6; Wed, 29 Jan 2025 22:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLDq-0006pp-0x; Wed, 29 Jan 2025 22:28:06 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLDo-0007yW-Dp; Wed, 29 Jan 2025 22:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738207680;
 bh=pgDb+adZTooHqfIslcsU8s6nscTALv9h2vLmELwsp3o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=BmCEmDJ1tqTfrUFOZiXZSyLX30P6tHMj0DuWpA4BaO7kwLtNBglAorNX8n4F804nL
 45JcvI+0Wmcu1WtrxY+zIzFu7Jz17xEAUDJQSRy0lb8jzSroandmV1ffv9SxM3mIDM
 h3LRLKH6WnE8Hn3hyIQmuxB0gB3pNRPCyhTMyOr/vKkdSDfTH3Ayhx2KFtK2VNl5HL
 hHkQXpmdnWWYt4c0q0S1EAbEY3nFrLpgavAGw+wnFUGo9MiDTt+CLfGLdCckCSeM4l
 8ZRTgmxranHrcoLa+leCjkozLMdWMr46NhG3W1D/1z8EU4YUWEyEeye0MRP4TPyeIn
 +VTEaVpxlhboQ==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 047FE73803;
 Thu, 30 Jan 2025 11:27:59 +0800 (AWST)
Message-ID: <a79adeedb42dd323f4b6dc0b02b3e4efe1edea92.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 01/18] hw/intc/aspeed: Rename INTC to INTC0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 13:57:59 +1030
In-Reply-To: <20250121070424.2465942-2-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: daTCmVs44Bxb

On Tue, 2025-01-21 at 15:04 +0800, Jamin Lin wrote:
> The design of the INTC has significant changes in the AST2700 A1. In
> the
> AST2700 A0, there was one INTC controller, whereas in the AST2700 A1,
> there were two INTC controllers: INTC0 (CPU DIE) and INTC1 (I/O DIE).
>=20
> The previous INTC model only supported the AST2700 A0 and was
> implemented for
> the INTC0 (CPU DIE). To support the future INTC1 (I/O DIE) model,
> rename INTC
> to INTC0.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
> =C2=A0hw/arm/aspeed_ast27x0.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 +--
> =C2=A0hw/intc/aspeed_intc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 90 +++++++++++++++++----------------
> --
> =C2=A0include/hw/arm/aspeed_soc.h=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0include/hw/intc/aspeed_intc.h |=C2=A0 2 +-
> =C2=A04 files changed, 50 insertions(+), 50 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 4114e15ddd..ba461fcd3c 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -56,7 +56,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_ETH2]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0 0x14060000,
> =C2=A0=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_ETH3]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0 0x14070000,
> =C2=A0=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_EMMC]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0 0x12090000,
> -=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_INTC]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0 0x12100000,
> +=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_INTC0]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0 =
0x12100000,
> =C2=A0=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_SLI]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D=C2=A0 0x12C17000,
> =C2=A0=C2=A0=C2=A0=C2=A0 [ASPEED_DEV_SLIIO]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=C2=A0 0x14C1E000,
> =C2=A0=C2=A0=C2=A0=C2=A0 [ASPEED_GIC_DIST]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D=C2=A0 0x12200000,
> @@ -372,7 +372,7 @@ static void aspeed_soc_ast2700_init(Object *obj)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 object_initialize_child(obj, "sli", &s->sli,
> TYPE_ASPEED_2700_SLI);
> =C2=A0=C2=A0=C2=A0=C2=A0 object_initialize_child(obj, "sliio", &s->sliio,
> TYPE_ASPEED_2700_SLIIO);
> -=C2=A0=C2=A0=C2=A0 object_initialize_child(obj, "intc", &a->intc,
> TYPE_ASPEED_2700_INTC);
> +=C2=A0=C2=A0=C2=A0 object_initialize_child(obj, "intc", &a->intc,
> TYPE_ASPEED_2700_INTC0);

Shouldn't we also change the propname to "intc0" (... if we're to
continue with that style of naming)?

Andrew
