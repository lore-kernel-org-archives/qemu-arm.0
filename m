Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp938215nji;
        Wed, 16 Oct 2024 14:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvyT8Y/09GStELtggBozBpm8mS9FM0kOElLDHFs+Z6fp2nXalwk+35ATEBWG7bERCYS7dk28tuE9wrnA==@linaro.org
X-Google-Smtp-Source: AGHT+IGhSm7wED5AhBCzc+OpNN08OI6hwQLlTBGUvlJkZrXGp64D04dUYPPCTNI8nSmADVjEw32u
X-Received: by 2002:a05:622a:598f:b0:460:8fe2:c04c with SMTP id d75a77b69052e-4608fe2c0fdmr56103151cf.21.1729113879402;
        Wed, 16 Oct 2024 14:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729113879; cv=none;
        d=google.com; s=arc-20240605;
        b=XDzrGUUm1jlFeINqVOb0VB9QSFkbxXCv/aLskG1St952FgHKV4m/EZtfvEc8eqr/sH
         5dFEJoADC7aWaEJ1hSiimFcn0v+4B9VgB/kdKZcAms3PuZuM2X4mS0qqKrSqwSb+MoYw
         nzGVqLq+uShvQkBNZMj1sP5lbVZqWu5nc428OOH2Crl6zSXHIvYT8PzopC4CgbigRnGe
         3HxSts7fdtnhmDn+37/4LbRsxv6xXRYI9ZxUl1p1NFthdzF1t3Vh++6By1oRBai2vbej
         /2G/u/YvEvGd7YqSSbOgnRKNz2G4Kxnf30J4DkJf1rk30LaKSD0TlW4Mtb+qdo3dq3aq
         EgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7V7VO+tsKceMvp6RylfNFS9ZDwLOpBaFsdLb0+3aNAs=;
        fh=iV/wa/EGzwekPs9SIy8f7XZbk0+azreCjNfifMvkeEI=;
        b=Wq/ZT7rwP1lgTEFWLbt6VdyvY+SgXPh8gfdq/rpH2XlIs+SIRnivYAZg6I51UPmBjh
         L02aLBzz9Mdg77CcoLYH9RIaukG70v1saDYBfyEk8GAkuDJAF6AB0IGLRhJSvm9p/MpJ
         7E2+NufT99x36CNP2jqlM6T5L8K4WO7YrTmtkJgGNglpy0FwuvuB39nO3JJZGkPzzkeC
         WADfrN7Qezi0wd/lOFTYf9vmmt3+6LHdONGRzSyPfAQTwdRlCGtHMhsI+S8PsL5m4ors
         o3kYrJ8BQoVu1rgWU+WSMeUEpzgrGYv2wDp1GtL53P4I3PcIolhVjpHpjtzlR4oV8hMV
         wSmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nLiTtyhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4607b49da7asi46252011cf.402.2024.10.16.14.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2024 14:24:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nLiTtyhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1BVH-00026U-Im; Wed, 16 Oct 2024 17:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t1BVF-00025i-RG; Wed, 16 Oct 2024 17:24:21 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t1BVE-00012f-76; Wed, 16 Oct 2024 17:24:21 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a0084f703so32656366b.3; 
 Wed, 16 Oct 2024 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729113857; x=1729718657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7V7VO+tsKceMvp6RylfNFS9ZDwLOpBaFsdLb0+3aNAs=;
 b=nLiTtyhIbQFU7htwZagwzGAce8uZyDZW1hX0bKQu0jl776kfiZQusZ/DicdRYdQt4K
 v5ke1t4+4RsD7amrMmsAASzLYWB4mZpwH13GI472EXWSKBF1Q/n3Vqd3lldYeHByA1pq
 1xrlD5IHr845d8bQ4bYeEbnL/FM94eB3XcCki5wNcg61WJf12mD8JKcKyXktwxPBUkiE
 PL5HQFHAFOP6bOPmJbsbzwsI2JTQlOELNqS41kqC8UY6OUcV5tIYNnf+4XWyWrwvSy49
 E78tvM45r1JvOi6ubxSABDWg6laMF3mQ1tPRAfEXT7pHBbx1x7YPedKaskS185Th7C0e
 gPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729113857; x=1729718657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7V7VO+tsKceMvp6RylfNFS9ZDwLOpBaFsdLb0+3aNAs=;
 b=Xy52x7J2eXP9kJ2eDRRCdP0Ai96AG2M38boMJ1hc0wDNHfT968kZNW0r4LTgL1qHnX
 JvFNGLmu0rNlM1sA/99jHKpc73COCpPT+Tq2+0f4O9AmoiLo6onVz7II119rVTXDV/y8
 9PEkvGghDFcPlETE4RX3jerV0WBsCq1h6xThwfvZVvqpujJhEreTiDisWw4DxSpTmDcn
 f/H76I6H2vlrfZ1Irv1SaZ3lgwCeP079Ih7FfAYJUpJrsnh0vRiqyDPEqsUcOHyH/OXn
 MuqiOWBijEw9VXicNQJbc+yQf4LjrVP+DVGhkPs0AY/eUBJ8l+CziGkXw0fVQGBSv7Nr
 fhJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjI8TkoR4ixBxE0zXqFk5GKYnhoiIIt1phmcYD4xg0hkvjI+aOOXChZp7cCqu9MNvaBqHQzqIrQg==@nongnu.org
X-Gm-Message-State: AOJu0YxRc0R2dNawCF48YJmgyd8QeC/NwNobi3z4TvAWQvsvC16FyIaM
 VRrkof+qcKtHKgXKfm2Cr4sWfvIC38hL07WanUsKVrOiTeyY22YcXNEfjQ==
X-Received: by 2002:a17:907:f148:b0:a99:f1aa:a71f with SMTP id
 a640c23a62f3a-a9a34d3cd85mr474036866b.11.1729113856989; 
 Wed, 16 Oct 2024 14:24:16 -0700 (PDT)
Received: from archlinux.. (dynamic-077-191-025-143.77.191.pool.telefonica.de.
 [77.191.25.143]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29750a9asm218005766b.88.2024.10.16.14.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 14:24:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/5] Consolidate lan9118 phy implementations
Date: Wed, 16 Oct 2024 23:24:02 +0200
Message-ID: <20241016212407.139390-1-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bIctePf4jUAc

hw/net/imx_fec and hw/net/lan9118 implement the same Ethernet PHY with simi=
lar=0D
but not quite the same code. This series consolidates the implementations i=
nto=0D
one to fix code duplication. It then continues to make the code more readab=
le by=0D
reusing some existing constants.=0D
=0D
Having a dedicated module for the PHY allows it to be reused in even furthe=
r=0D
device models.=0D
=0D
Testing done:=0D
* Run my usual sabrelite load and verify that network works.=0D
* Build and run Buildroot's qemu_arm_vexpress_defconfig which includes lan9=
118=0D
  and check on serial console that IP address gets assigned.=0D
=0D
v2:=0D
* QOM'ify + mention boards whose migratability will be broken (Peter)=0D
=0D
Bernhard Beschow (5):=0D
  hw/resettable: Add SOFT reset type=0D
  hw/net/lan9118: Extract lan9118_phy=0D
  hw/net/lan9118_phy: Reuse in imx_fec and consolidate implementations=0D
  hw/net/lan9118_phy: Reuse MII constants=0D
  hw/net/lan9118_phy: Add missing 100 mbps full duplex advertisement=0D
=0D
 include/hw/net/imx_fec.h     |   9 +-=0D
 include/hw/net/lan9118_phy.h |  36 ++++++=0D
 include/hw/net/mii.h         |   6 +=0D
 include/hw/resettable.h      |   1 +=0D
 hw/net/imx_fec.c             | 146 +++---------------------=0D
 hw/net/lan9118.c             | 137 ++++------------------=0D
 hw/net/lan9118_phy.c         | 215 +++++++++++++++++++++++++++++++++++=0D
 hw/net/Kconfig               |   5 +=0D
 hw/net/meson.build           |   1 +=0D
 hw/net/trace-events          |  10 +-=0D
 10 files changed, 311 insertions(+), 255 deletions(-)=0D
 create mode 100644 include/hw/net/lan9118_phy.h=0D
 create mode 100644 hw/net/lan9118_phy.c=0D
=0D
-- =0D
2.47.0=0D
=0D
