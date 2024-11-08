Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4928488njc;
        Fri, 8 Nov 2024 05:57:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWBHj9eXcd50sTRprp/ie5DystspPkm/FEowstBsRcMX86RGkrbajbJe575reu65T5Y5k3m6mbRrcg7TQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFbvkNTz0Bxkuy+FFz87i4kzxtaiLZeZzFSlT1k46Rd3Ls9Z3IQxI2nt37XqPIInG8TjQ2A
X-Received: by 2002:a05:6358:8495:b0:1aa:c492:1d34 with SMTP id e5c5f4694b2df-1c641f6769cmr209254055d.23.1731074222725;
        Fri, 08 Nov 2024 05:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731074222; cv=none;
        d=google.com; s=arc-20240605;
        b=OquLbUF7QYvnThF9jILveLyLdGZrpT9GpAEp0YuiG2kBVgVEcIUTLnhhMyUD4vE4IW
         9we2tC5LHbQsN1Qg4j23vidwa1uQUE/+IkirxcY1wVtTQt/yqN1JIQhBmSYmKQd18VH6
         /U0fb8hlfYRZkR/Jd6tVZtcKNbm1zjoo7LavgLFXt5ys/pIWO9xPh+kanEMkzE+581Ix
         zbsWPCy92DtzolvYb5WXvyRcjKYt8FQFGgqwxIJpmmYhKPjt/zb9owsJURr31A+D4qT/
         0ltut8IkLHIGbTM3jTgZPPS6Y38E5zHrbddYUi4Ocz4PFK7Gm2Ys30reT3sIea0+MPwV
         9maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ex0BO5YRCNbi8d1FC06nwvlcIyISeLFk+giHOrmeeb0=;
        fh=k8fK8Vo0erLBF7xXkzdevqESi4GzcEmwRsxb4YK8iG0=;
        b=GBowJbgQ8LaVBqkq8Pd+UVtK3y5UNzXjUB//rGinIlKrnC9867WSscGJN4fY7YrVtS
         /ps1wb6QiOIzJ6DMTwnUElGO0N/yphYo0G5ck/r+QKm0n88g+BEMqUnC/gbQfQ5BfxXn
         PLuG4uIzH7PJC+bnm+fgdICC+8BKShbnnUUdN7AyLcGP2EZee4pe9SakNw36sEmzQL7q
         9G6o6Q4pIOv1b17cZZ7+8TDvAaS8tZPk9BGqbXs96froT6C2TtiV9O3cjP88AQxv6hgC
         fbUy0tanEQ32ecZrrolpjuPv12IfN18JkkHjux3HLsa2dThczNOKUMmE0LkGd2P2NEHz
         288g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOOWz7jp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39666633esi45221056d6.361.2024.11.08.05.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 05:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOOWz7jp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t9PTn-0001A1-QC; Fri, 08 Nov 2024 08:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t9PTl-000160-ES
 for qemu-devel@nongnu.org; Fri, 08 Nov 2024 08:56:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t9PTj-0005kO-RB
 for qemu-devel@nongnu.org; Fri, 08 Nov 2024 08:56:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so25511675e9.1
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2024 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731074206; x=1731679006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ex0BO5YRCNbi8d1FC06nwvlcIyISeLFk+giHOrmeeb0=;
 b=XOOWz7jp2PzHKmP5d+1blJRgB7N+8HluqVOEv7WL6476ugDkUI48C2tXOLz1oJn/QD
 HbHboxKByvCQ/M7SKZTJgjpsPM76mD0hiZvva1vwxZ5s/Y131zfK0wFb3/u2OBmsJ1QO
 p8tkWlaoosBGGLxSF98rrF/tpygjKUCB06A+LNtPVTiylLIUrAOsU7EkHb3WVutOrnfO
 /0Ck9Rv3P1rSQBXqe3yfOmsmcn5I9r9XS2w3/bCGU3oM4IXLRRpY6DFN5uJUD2nnfAvx
 VEPm1SWfhU8wCazUhkjOsZoiO7vM8c2jXJS9r7oQSOlT8XF4KtXNiVgTwzsEpOdKAhuD
 KGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731074206; x=1731679006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ex0BO5YRCNbi8d1FC06nwvlcIyISeLFk+giHOrmeeb0=;
 b=mqqbCQ8JA3nJeis/FTO7022d1NwabcoQdtcUZSzwcCR0sOFhO/568gxG7NTBsOf0Cd
 xPywg5KyYJwNVggYxAOoraDHcJNFTM50KSZaayjoFmc5Ml3K0mWnDns4tFKs8w/iNYyP
 BkzGjDnhbZSk4kXC9re76N6+ewojlZmUDVloYcw0moaG+99f0rbX7tGOKzo5rtB3ZSVV
 MgP33GKYP3CsDMGEOlVTkrBWHRBA8iCKv1+Ws8oOMCLio9FuwhHxxtLcuJ434Jwj7Oow
 Ez0n43Qgxv0vw2EDJNlxY07LjMx/BDSxqmmfDwVuqkjnijIq6mORQN2//SEu1l49q/4p
 u3EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT1Pc1ycwEaI+mhqEFlXVQG3PAv+Ipt42rtgbGwyvbLWygVhcGb4L60rSBYWWF8pR8gfcs4fT5t/9/@nongnu.org
X-Gm-Message-State: AOJu0YyE1nzO9eZsQgUPUSZBxEr8lZLGb2UXiuIWGTNKXrAdHR4PaIED
 L7vwk2JYNDRO0mAqbIx4mGX2oEuC4bD1vZoq34Bb4veS9KnYtUUdjL7gcnQUwNVz4sLzA6dbiTo
 a
X-Received: by 2002:a05:6000:79e:b0:381:d88b:2bb9 with SMTP id
 ffacd0b85a97d-381f1889e6cmr2915377f8f.51.1731074205802; 
 Fri, 08 Nov 2024 05:56:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970713sm4993529f8f.3.2024.11.08.05.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 05:56:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] hw/misc/nrf51_rng: Don't use BIT_MASK() when we mean BIT()
Date: Fri,  8 Nov 2024 13:56:44 +0000
Message-Id: <20241108135644.4007151-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UDwM4bWMiPk/

The BIT_MASK() macro from bitops.h provides the mask of a bit
within a particular word of a multi-word bit array; it is intended
to be used with its counterpart BIT_WORD() that gives the index
of the word in the array.

In nrf51_rng we are using it for cases where we have a bit number
that we know is the index of a bit within a single word (in fact, it
happens that all the bit numbers we pass to it are zero). This
happens to give the right answer, but the macro that actually
does the job we want here is BIT().

Use BIT() instead of BIT_MASK().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/nrf51_rng.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index bf1eb0cf4a1..2d67f3f766e 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -107,25 +107,25 @@ static void rng_write(void *opaque, hwaddr offset,
         break;
     case NRF51_RNG_REG_SHORTS:
         s->shortcut_stop_on_valrdy =
-                (value & BIT_MASK(NRF51_RNG_REG_SHORTS_VALRDY_STOP)) ? 1 : 0;
+                (value & BIT(NRF51_RNG_REG_SHORTS_VALRDY_STOP)) ? 1 : 0;
         break;
     case NRF51_RNG_REG_INTEN:
         s->interrupt_enabled =
-                (value & BIT_MASK(NRF51_RNG_REG_INTEN_VALRDY)) ? 1 : 0;
+                (value & BIT(NRF51_RNG_REG_INTEN_VALRDY)) ? 1 : 0;
         break;
     case NRF51_RNG_REG_INTENSET:
-        if (value & BIT_MASK(NRF51_RNG_REG_INTEN_VALRDY)) {
+        if (value & BIT(NRF51_RNG_REG_INTEN_VALRDY)) {
             s->interrupt_enabled = 1;
         }
         break;
     case NRF51_RNG_REG_INTENCLR:
-        if (value & BIT_MASK(NRF51_RNG_REG_INTEN_VALRDY)) {
+        if (value & BIT(NRF51_RNG_REG_INTEN_VALRDY)) {
             s->interrupt_enabled = 0;
         }
         break;
     case NRF51_RNG_REG_CONFIG:
         s->filter_enabled =
-                      (value & BIT_MASK(NRF51_RNG_REG_CONFIG_DECEN)) ? 1 : 0;
+                      (value & BIT(NRF51_RNG_REG_CONFIG_DECEN)) ? 1 : 0;
         break;
 
     default:
-- 
2.34.1

