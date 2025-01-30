Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp65079njl;
        Wed, 29 Jan 2025 20:06:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUldVwn4xU64lcLe7T+AIWWG4p0KT0FOqrOa2kfSbrwSjJ1qMyMIyvufqZHM24noj/5eDdMrvrjeUNweg==@linaro.org
X-Google-Smtp-Source: AGHT+IFaE92h5Frq3sgwGDlbn5auIjQxC+92LfZPOaxaiFF9ZtdZlJhg7IFinopg7aAk65l8dB12
X-Received: by 2002:a05:620a:280d:b0:7b6:c2bf:3eeb with SMTP id af79cd13be357-7bffcc36e1fmr625109785a.0.1738209983683;
        Wed, 29 Jan 2025 20:06:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738209983; cv=none;
        d=google.com; s=arc-20240605;
        b=TCnTpohJlFk9fzAoja8lUghW6Gc1pAq1KXZRGLMvVPGP/ebPg/TK/90Bmmpy1b296P
         r5hyXdUFJCzwjb/x87O6VZEk5ZOvEr9V6d/0peooSl880SE8GKKD2x41PFn/0cdnsTUw
         7YUBfYf2kBT6EsUopLxykhLC7OnMQpZu22fvZQ9ULfLmpr88qCBTYq3sVl+tj7AiFopn
         EaU70o3vial3BVnMVu7VQvnNd5wfI0zbri/58qCRgGhslf8mCklqCBUHYgN7ytMN1VNi
         bFYskHvQBuc+H/EGCzwnDDNAeHRdkhmYfXBtylWtyVahSvyBiIZJgnchyKTw3p0F0YDQ
         eDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=lRW4xmauVAzJq/V1EL2szV83WG7F+jbac36gaALUJCw=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=Ut1HpBa5Y3Bwf+/TTU+6M633VTllhfL2IaB2npKRZek3zFqs6spzE9INngX1z2ffeM
         WwMVGZWCS+QyaoyIKriNxfS+qx837lM4LD8ykKkY4C06kksy/w8yiy5f37CCBRg+7W4P
         +ggN7xLurf2iqQ7djk/tJOxNuDxd8Jr+de/obtBgYz8iYx7Md5HRwF3IYO/6AfgwBO4N
         N2+V2hvwxPiBYHoWvKRkrtdbWFEFVbAk6WOse1N66C6QfxU9JtERvWLyAalU1ZiX+K5R
         mQ6L0sc5G4F8N5p8gNq5aOQWXskH/AguAHg4HxbwJzDNWw3TEaqRDlYnwqMUfm/m/9Sm
         9CZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Ug7Oeyox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a9250f0si85943785a.515.2025.01.29.20.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 20:06:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Ug7Oeyox;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdLoN-0003Qk-Ar; Wed, 29 Jan 2025 23:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLoB-0003Q7-ID; Wed, 29 Jan 2025 23:05:39 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tdLo7-0003r4-G4; Wed, 29 Jan 2025 23:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738209928;
 bh=lRW4xmauVAzJq/V1EL2szV83WG7F+jbac36gaALUJCw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Ug7OeyoxWAmvrMAtjmLhvlxMv/wSF19s8e18tv5LCtIi3+AEtuEIEkqIEQp3FBLye
 Ls55C8aX0W+Gb5zrgwXas/bVfSbIoi845DpBeMxNjV5z0jSGLlvlxSGRSTiL53pPYj
 sc01w0ULT1Hz/0huqDig8K8bQ9ZJIeZrccB//qNNI9z9VoW5YxBxjr+xErKCzTrrfq
 1Q9hY23k6Obh1LQwsgZ6dsECpQdDmPYqVgs2v6jycjxkJhF4gqWgXs8onJdptaTEU8
 zuGp2upE8DMHgTZBiZPDzrXM1AZwh95VOxA9KoDTU/c5wcCV/Rcy82Lp3KkQdkKny7
 kPzJUYb3R1t2g==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 168617383B;
 Thu, 30 Jan 2025 12:05:26 +0800 (AWST)
Message-ID: <64382a15c40b33fcfeeecee5489e0a034313b7ec.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 11/18] hw/misc/aspeed_scu: Add Support for
 AST2700/AST2750 A1 Silicon Revisions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 30 Jan 2025 14:35:25 +1030
In-Reply-To: <20250121070424.2465942-12-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-12-jamin_lin@aspeedtech.com>
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
X-TUID: bjcumWsvJJer

On Tue, 2025-01-21 at 15:04 +0800, Jamin Lin wrote:
> Added new definitions for AST2700_A1_SILICON_REV and
> AST2750_A1_SILICON_REV to
> identify the A1 silicon revisions.
>=20
> Update "aspeed_ast2700_scu_reset" to set the silicon_rev field in the
> SCU
> registers.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
> =C2=A0hw/misc/aspeed_scu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 3 +++
> =C2=A0include/hw/misc/aspeed_scu.h | 2 ++
> =C2=A02 files changed, 5 insertions(+)
>=20
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index bac1441b06..f049a9fd96 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -559,6 +559,8 @@ static uint32_t aspeed_silicon_revs[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0 AST2700_A0_SILICON_REV,
> =C2=A0=C2=A0=C2=A0=C2=A0 AST2720_A0_SILICON_REV,
> =C2=A0=C2=A0=C2=A0=C2=A0 AST2750_A0_SILICON_REV,
> +=C2=A0=C2=A0=C2=A0 AST2700_A1_SILICON_REV,
> +=C2=A0=C2=A0=C2=A0 AST2750_A1_SILICON_REV,
> =C2=A0};
> =C2=A0
> =C2=A0bool is_supported_silicon_rev(uint32_t silicon_rev)
> @@ -938,6 +940,7 @@ static void aspeed_ast2700_scu_reset(DeviceState
> *dev)
> =C2=A0=C2=A0=C2=A0=C2=A0 AspeedSCUClass *asc =3D ASPEED_SCU_GET_CLASS(dev=
);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 memcpy(s->regs, asc->resets, asc->nr_regs * 4);
> +=C2=A0=C2=A0=C2=A0 s->regs[AST2700_SILICON_REV] =3D s->silicon_rev;

Has s->silicon_rev been set?

Should we now remove the AST2700_SILICON_REV entry from asc->resets?

This seems like a fix regardless. Perhaps separate it from the addition
of the new silicon IDs?

> =C2=A0}
> =C2=A0
> =C2=A0static void aspeed_2700_scu_class_init(ObjectClass *klass, void
> *data)
> diff --git a/include/hw/misc/aspeed_scu.h
> b/include/hw/misc/aspeed_scu.h
> index 356be95e45..684b48b722 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -54,6 +54,8 @@ struct AspeedSCUState {
> =C2=A0#define AST2700_A0_SILICON_REV=C2=A0=C2=A0 0x06000103U
> =C2=A0#define AST2720_A0_SILICON_REV=C2=A0=C2=A0 0x06000203U
> =C2=A0#define AST2750_A0_SILICON_REV=C2=A0=C2=A0 0x06000003U
> +#define AST2700_A1_SILICON_REV=C2=A0=C2=A0 0x06010103U
> +#define AST2750_A1_SILICON_REV=C2=A0=C2=A0 0x06010003U

These look fine.

Andrew

> =C2=A0
> =C2=A0#define ASPEED_IS_AST2500(si_rev)=C2=A0=C2=A0=C2=A0=C2=A0 ((((si_re=
v) >> 24) & 0xff) =3D=3D
> 0x04)
> =C2=A0

