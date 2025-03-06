Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1162351njm;
        Wed, 5 Mar 2025 16:08:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQIgw4aIHCWJfDjNjC07BwJ1nNhY3gwIozDD58gtxg4tWJKvXJ7ZjbzTyeVpQlvidL7eOEKuOIK+dRZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGXFsGlqUlPtO3KqFrA/S004drsjrz23W8pL7VAb/sMbPuuSaZrrDShTXVqvgdItDgTBhqB
X-Received: by 2002:a05:620a:2606:b0:7c3:d707:5ebf with SMTP id af79cd13be357-7c3d8eaeeb4mr786738285a.42.1741219714770;
        Wed, 05 Mar 2025 16:08:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741219714; cv=none;
        d=google.com; s=arc-20240605;
        b=C4Lcy7EM1/orwrIyX0bPgnnPZwa35GceRrMsKcgi8VL+WOLYnE2qdjJZN+wvPXTnNy
         8tzJ6F1Kc/D+IFTSjYQCX4YupwsZdfdILmofQWLuS9HM83OsQgECOjTVUvMrkwYq0j+4
         m7GWKA9+qbzTfjIsnP5V2T1CSRG3QTrGzJM4XejKoRWnbuHXZ0a6edZ7tcW510UZYSo3
         3qmKGjNxQiCMzp1e8cTx6bSA3sBZMnsV+2v7yYpXKfuyze2zTsJbDJjMZXLk3O3H7ViJ
         fWBJS6VnwYD0jYwQRr9VXBZOUgChlDQNoga3YCjexFMEq+WPd6wBKHRTRkQwkESp2vb/
         01mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:mime-version:in-reply-to:date
         :dkim-signature;
        bh=UyjiFGUgfhIevwFcnNYqsTxfpyZqsh+g52PkrRzwRGo=;
        fh=zvw5eB6SKqf2O6gOEpiZ5wJxSNorNP0kUdChjo0ltHs=;
        b=FTD7JVNQnQDIzpIrUicYZiElWs/hBD3Ghokpk+SDJZ2l2Vcm9LKqz4lxj+waQ8M/uu
         SFauZcoNWOiHZN1Cf0L/+PGYzIftv+fpN6zGtBLQ0/BZCpw6IWuQq3gw3jmjIT1PsXSw
         9vu37N3LwdFkf35XXHbwlRz911r1RDW/cWoGTX7y+ratC6pgmp6Z0YjjQGBtMMimlQ+r
         7ZyPj+WAovh7SoUDdZAZSo05F8NC9tbl0MBdodC05YRyJFcPMQLMPtSNfbYkE1bucCbT
         qj+b+ihZ8bPo6j5fG1wZWL/olkBFyYOxBXdXwOj0KUWIjuPtYpDyh5KfH+KXH2U4bsFw
         Tbfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=e0Fk6GHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e550ebf0si16544485a.333.2025.03.05.16.08.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 16:08:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=e0Fk6GHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpymw-0001V0-5s; Wed, 05 Mar 2025 19:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dOfIZwwKCKsYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1tpyml-0001Mc-Lj
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:08:24 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dOfIZwwKCKsYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1tpymj-000725-W5
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:08:23 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ff69646218so33355a91.3
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 16:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741219700; x=1741824500; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=UyjiFGUgfhIevwFcnNYqsTxfpyZqsh+g52PkrRzwRGo=;
 b=e0Fk6GHFJMipGibu9Z2Xi0c14FTh1ZmRq9+BAT2xFVydyoIMgBZt722peMRYLaQmqY
 mabshmbkAqKtzT4lqwZ80zaXYFSW6xfKunvP7gzOeLd0VUUg42TCp8GRt46ZzUQx9tTo
 eY18V4LGj+kn6MMMYznRenpwM4imTlfywBjFtGAIEa7zPgv2ct3uzkQer/JajUokpY42
 FnNecZjz6o1NCg/EE+5Kh6ISNRL3Vh8gnfftMIjhl4l0nWewM9zcE6+j3+S7a1GGJArV
 rAlLy5kTtWXRzRulMM4I77s4aM613KiilII1oG+y9Xb/+QmvnvqIjLYhoGy7focc3PFm
 2nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219700; x=1741824500;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UyjiFGUgfhIevwFcnNYqsTxfpyZqsh+g52PkrRzwRGo=;
 b=KJzH2eXNvOEnzcYYUe1EYEj4ZtAubLdreA7TgROhSJUgHRDQZSYqDpfV9eXk5oMH15
 wB9IwcXkzQnL6gDOWSAaspKwxl7k/OZhAoAap4MQs8tHwnuNmZpp/Pvp/rXKEgoFNGBu
 erWXVliabZhfzUMaYnqdlriVmv66DZ/aUEXBIuEbktrxBHPlP+21O2yuuA2vPiLVahgl
 clTomicqruHzDrs8m3rOlFAp3FARz+izHl72YgG//S/2yot6ZhyTQ3SUzYf3YK4exPec
 Hk04ttWQiPiuUeLKhO8r/0PMuFbdjKDCcYnYJOEOHqTs4j1Eo/lolQDw0zpEo7B7v/lA
 LguA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy38OzcgnwcM/Jjz6hpSo+CO2hbALn7uyY4fhBTutp+A/mlrRe9oV3W2pBTX5UPfACqTpakqKotQ==@nongnu.org
X-Gm-Message-State: AOJu0YzuO8P0c0aLiJQnE6IvmpI3S4zDl+OQLfDldQEKCSi8lGDLvjf8
 V3hxSILFGcFG4VmRYqyhgOTQhpQUF/AAm74iOm9a2L6FlNjWHPYUMboJFOvnhC+DBpoOyr77ECz
 oLAKVRf/S3Q2/wdXImhpsmrDBCw==
X-Received: from pjj3.prod.google.com ([2002:a17:90b:5543:b0:2fc:1e77:d6b6])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5688:b0:2ee:9e06:7db0 with SMTP id
 98e67ed59e1d1-2ff497a921amr8789665a91.11.1741219700056; 
 Wed, 05 Mar 2025 16:08:20 -0800 (PST)
Date: Thu,  6 Mar 2025 00:08:14 +0000
In-Reply-To: <20250304064710.2128993-7-jamin_lin@aspeedtech.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306000816.2098104-1-nabihestefan@google.com>
Subject: Re: [v5,6/6] hw/arm/aspeed_ast27x0.c Fix boot issue for AST2700
From: Nabih Estefan <nabihestefan@google.com>
To: jamin_lin@aspeedtech.com
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3dOfIZwwKCKsYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: f39ZDz10/bDL

> Currently, ASPEED_DEV_SPI_BOOT is set to "0x400000000", which is the DRAM=
 start
> address, and the QEMU loader is used to load the U-Boot binary into this =
address.
>=20
> However, if users want to install FMC flash contents as a boot ROM, the D=
RAM
> address 0x400000000 would be overwritten with Boot ROM data. This causes =
the
> AST2700 to fail to boot because the U-Boot data becomes incorrect.
>=20
> To fix this, change the ASPEED_DEV_SPI_BOOT address to "0x100000000", whi=
ch is
> the FMC0 memory-mapped start address in the AST2700.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih

> ---
>  hw/arm/aspeed_ast27x0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 92487bf229..10e1358166 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -24,7 +24,7 @@
>  #include "qemu/log.h"
> =20
>  static const hwaddr aspeed_soc_ast2700_memmap[] =3D {
> -    [ASPEED_DEV_SPI_BOOT]  =3D  0x400000000,
> +    [ASPEED_DEV_SPI_BOOT]  =3D  0x100000000,
>      [ASPEED_DEV_SRAM]      =3D  0x10000000,
>      [ASPEED_DEV_SDMC]      =3D  0x12C00000,
>      [ASPEED_DEV_SCU]       =3D  0x12C02000,
>
