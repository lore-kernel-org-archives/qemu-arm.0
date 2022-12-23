Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp309827ejb;
        Fri, 23 Dec 2022 02:48:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXti4MIWiME1lMTEtEiSjguJUy2mMTerqvnsp8sx1L8N4efoM3DOxMfPKukiKQBuIHBUB6IZ
X-Received: by 2002:a05:622a:1f10:b0:3a9:82a1:fb16 with SMTP id ca16-20020a05622a1f1000b003a982a1fb16mr11522149qtb.20.1671792500539;
        Fri, 23 Dec 2022 02:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671792500; cv=none;
        d=google.com; s=arc-20160816;
        b=SthDhC+sNl2F72Fl6sQg6Q664G/ucrkPbigv/wBztUzXd5ncS0QW54cmKiyOXER2ic
         OxYaJ5IJO71u6bYBq7lyMGCGc9vicUQaN7x5/tjxgyTrTQTMA0qXG8axqEZaNAV+t+Ea
         /oKUVs5I/V/R6kYUiZ3TmGEfw/NakDSl48SRwH0gaiBxC+O8Gt3C/tNUXAoFEdxj1GaL
         nu2r1HXkeY4RrDqCWTdKM9EIEStp8vK1z6Fw1qOtE5hfjIKnY2d6a9UEq70ibnCJ6sZX
         JtYrJOsuHy4pebxXnTxbDqYybhupnUbu4wUFqRKwiobNJ4hWFF+nu5QoQMK4U046EqtE
         sMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=VaPdoLhBE0KvIEW39PuY41HCBksEZwCL4O6dMha7OaA=;
        b=t2XGRwDRgQg0WZeLLNm0F/lsVuynobusID610EiPh3gKnw1AgYITZdtMZLFtGM/etr
         HUCEZzcc0EAj0om13M5OZtgFY9SjNA+Q96PHWxSoAaj+hPJR0ds2vF26y5bWaPYrC6Zz
         GywQbBFr+T1pY4k2IEiWH53/RlkSurbZEKMFULfhfU63Kqj8LKX7wC42Gr/CXVH0/PIN
         +4OoI9UOOIA9G6yUMdKRrfSm5JBov/PPdEUAuGc2PYx9Lh9pvElrVohNY2o4X5DqxgZF
         pQ+dgv2G4wBpL4vsbYcUcenMkUh0IQyXX3r+5ns4j+lmy4aB0qNAFrGw1PzXrwNVhAnI
         HmfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HRD2bqfZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t194-20020a3746cb000000b006fef6145bc0si973377qka.355.2022.12.23.02.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Dec 2022 02:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HRD2bqfZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8faf-0007Zq-OJ; Fri, 23 Dec 2022 05:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p8fae-0007ZP-Qi; Fri, 23 Dec 2022 05:47:48 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p8fac-0001kv-Qr; Fri, 23 Dec 2022 05:47:48 -0500
Received: by mail-ej1-x630.google.com with SMTP id ud5so11230690ejc.4;
 Fri, 23 Dec 2022 02:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaPdoLhBE0KvIEW39PuY41HCBksEZwCL4O6dMha7OaA=;
 b=HRD2bqfZVRg0HOdlcH8mwgLXCHiWBngpnZnNZApNszkHlSF8pyRfvRikmd5alBUMmh
 FpJmCXHzzqFyJwY0xqOkJwG3QRz+obJJEHaThfxWFtcfjz16thqpHpOempPkx9Q3N6f5
 6tpqknV7bQKLhPhfYspulCgpNTaFa0aiEl0Uu8jEcXN7QSSFvwMye4OVt0ygQLY8jpis
 mO3TA3k+yrT1wlf2CNUUgGzl7tJGHpQdD/VH0cexrS0JaMD3de+7UhQfgVv+hDozJMBq
 4DxVf+mXQyklrEaWs3FiAsKFhggvSUPzamIB8mLwxleqFTtLQpg5Mxdxl7GKO23iMAry
 RcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VaPdoLhBE0KvIEW39PuY41HCBksEZwCL4O6dMha7OaA=;
 b=g58tGgCKn4YQYesrbFm5gawznkOP/XmAtzAKkNw8c3/jMs7ee1p3SorgeUkAJgAc/q
 IPQV0L+GPQsml63xYWQYSOocngdiZk97x2vC5XpcrPDYJiPHkr33ROiu2684pm2izWGR
 4BlUa4W/8+nndTTR/OSI8/djezsHoWj7oMKrDGF1TXKKxMeds+c+ubYuPZGpD82a5npJ
 mgaTp7//zOFOxzoJ4U2JUQ6ggfgDDQfZKuE0BClbPD7OaUHv/Tz+J55E+4OuPlIKR35j
 PAJFOLLz6VYttaMJs1VE5zJGenKLzWrUi0I9yWB5s9MRU3JlaLlyzfdRq6u2K7tiKWFe
 5abg==
X-Gm-Message-State: AFqh2kqUD35uA/PVm1X4FXAeyuJbz/3tXMPjV0P2l+vDSqgofmDFGdV7
 ehkMGz1igboKovhXPVsB6Ro=
X-Received: by 2002:a17:907:7e83:b0:7c0:e6d8:7770 with SMTP id
 qb3-20020a1709077e8300b007c0e6d87770mr8448852ejc.74.1671792464492; 
 Fri, 23 Dec 2022 02:47:44 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-080-075.89.14.pool.telefonica.de.
 [89.14.80.75]) by smtp.gmail.com with ESMTPSA id
 j8-20020aa7de88000000b0046856c307d0sm1364391edv.5.2022.12.23.02.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:47:44 -0800 (PST)
Date: Fri, 23 Dec 2022 10:47:39 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
CC: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu, edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH v2 4/4] docs/devel: Rules on #include in headers
In-Reply-To: <20221222120813.727830-5-armbru@redhat.com>
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-5-armbru@redhat.com>
Message-ID: <3400786A-51BD-43D6-A6E4-4EE0A91D1C4E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rMcUysHQ/6W3



Am 22=2E Dezember 2022 12:08:13 UTC schrieb Markus Armbruster <armbru@redh=
at=2Ecom>:
>Rules for headers were proposed a long time ago, and generally liked:
>
>    Message-ID: <87h9g8j57d=2Efsf@blackfin=2Epond=2Esub=2Eorg>
>    https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2016-03/msg03345=
=2Ehtml
>
>Wortk them into docs/devel/style=2Erst=2E
>
>Suggested-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Markus Armbruster <armbru@redhat=2Ecom>
>---
> docs/devel/style=2Erst | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/docs/devel/style=2Erst b/docs/devel/style=2Erst
>index 7ddd42b6c2=2E=2E68aa776930 100644
>--- a/docs/devel/style=2Erst
>+++ b/docs/devel/style=2Erst
>@@ -293,6 +293,13 @@ that QEMU depends on=2E
> Do not include "qemu/osdep=2Eh" from header files since the =2Ec file wi=
ll have
> already included it=2E
>=20
>+Headers should normally include everything they need beyond osdep=2Eh=2E
>+If exceptions are needed for some reason, they must be documented in
>+the header=2E  If all that's needed from a header is typedefs, consider
>+putting those into qemu/typedefs=2Eh instead of including the header=2E
>+
>+Cyclic inclusion is forbidden=2E
>+

Nice!

I wonder if these should be bullet points like in your mail from 2016=2E I=
 found them crystal clear since they looked like a todo list for review=2E

Feel free to respin=2E Either way:

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

> C types
> =3D=3D=3D=3D=3D=3D=3D
>=20
