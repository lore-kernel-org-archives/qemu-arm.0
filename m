Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp919828lfm;
        Fri, 26 Jun 2020 16:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwylOe2lK+zqJvGMj4CkSQlyS5jCftjZ1LDkvzWZwGsW9jU89eFAX9RlmNu2bXKV2VcPON1
X-Received: by 2002:a5b:7c1:: with SMTP id t1mr8539474ybq.158.1593215812633;
        Fri, 26 Jun 2020 16:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593215812; cv=none;
        d=google.com; s=arc-20160816;
        b=UdglEGXQ6gZ57jeu84sW3Z94SHwNiCd5hp+Xd2TVGJB/Bg/feBny1kwMor2VEDW0xJ
         Jcifob6TuCBECHmdiIztGZwWSxBiHrbUU3aLsbaN/trk5U+2olNpU7HZrPNnBc0gyOEn
         rrym5aYXx0j1Ik8NTiKs54wAjinlH6I7iVDrt8yxHeErVc1DTJ/ZtEw69A7Kr+7mVHvf
         QMgTJamZS1wqocCyuSiw/xxbE5uzuxLbQrisMizJtHLegbs0EPEhZ/CpqtCgaSVxBxhP
         JCO/AEEyvWHAjgkdPq4y4pU4CuYpCy1+EyUkH4ji64g4/Z7CWL+MF83GhMXkgfd/6qBG
         VUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=x4zl2op1cKzABpWzOJ32Kyt+vBmeWcDSoujgoCFMWWI=;
        b=r6LwiBoRp37AYExpIuoajatHmL8N4x2BkfXhugUujjXU12CmqjwFh9Lm56iL4JaRRS
         k6jL2Y/hrbJkIJNbIpNSGEaz+shHaC6XWzH2wgdsPYuT57+7PGI+TzSvUKKkbTi/hdu7
         t6y9vE+2/lvLSl88wa+Rb88Sqz9CO6lJyhImrGzkSlBq66zcktuooMm9+De9L+UwWFL6
         mwXMxoiaxdfcNVdwd4OvD1wvI+3MCR73yvIiNkPqT4F6A6qSfIaNeWzknPyVjxdqBvU0
         JZNqQt4eVTosl2YESD0KxZbC3WNxRNbkJvMXL6sp6ooiEimXC2rugUgCa/TLbsaaIYAL
         Gbig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=H007Eekr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k186si27240434ybf.383.2020.06.26.16.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 16:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=H007Eekr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joyDD-0000mH-W5
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 19:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_Yr2XgsKCuoTeWUZZQYaQZSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--hskinnemoen.bounces.google.com>)
 id 1joyC9-0007Vv-R9
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:45 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:36088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_Yr2XgsKCuoTeWUZZQYaQZSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--hskinnemoen.bounces.google.com>)
 id 1joyC7-0001zD-6i
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:45 -0400
Received: by mail-yb1-xb49.google.com with SMTP id b14so5009009ybq.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 16:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=x4zl2op1cKzABpWzOJ32Kyt+vBmeWcDSoujgoCFMWWI=;
 b=H007Eekr4nxYx+JrtGJipS7TImIcKYmXoGWfkxCdgDVdNJXDzcwR3rOjqGdLWjecR1
 13MJku1OOdVTmKvAnLEUIEgeTk7xsdqVY7muLIv0GvNkMjl7bXrOMF68mICUBg07YHq4
 ecw9IFEW3TyxrcuUFWbaQsUlqoF+9kGKR8uEvWHk6E0/FUX4jpEq1BRNR327SpUvro1V
 RifiXJngQAxIUmiHffmAqlybs+J+UO1PfInHLFJgM4s5+uzWazMTtzwYRfSAs5TtxLAf
 2MOrogVeHS6iPtE96Bc1BQI/IUWAJ/5aZMv0cY2wmk5t+xqCOS7/zBHrJIBBWbyM5ocT
 iJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=x4zl2op1cKzABpWzOJ32Kyt+vBmeWcDSoujgoCFMWWI=;
 b=lPT93d/ClT7LwIneWzrFrPh5N6ZrWAGDGcXS+GxHX95W7FoJsJdFQTshWaaAYiFo8w
 ofVBN41hkwFsHULtCp7LFqEPKactDxy991kr8/nATliTpJzzvapntLkVW/9B62s5RFVv
 UIcSqdX9wLHAsiGTxQ5OyBMSjwpwKJfImxGGdwFJ1SaYY5iIHODZA4LCNcs29extEp6l
 Eh4gljmC9i5uN0tu/+5LrPNHMd8WLGpj0oiVP72U6n5QoO91YlGuTWJcRsagQqzoHIEb
 hSRg26gu0eCE9MGPhPPvp5kXe7niKRMiloYqVVVoYmTqfEzj2FVAsdj2MbsAxjbPhvPO
 YFXg==
X-Gm-Message-State: AOAM533waTquIiBNW7dXwcXsp7Ov4eB+M19rJCaRssQ7QGnCYwMce4cT
 v3FL3x3YUTipKjnZTaEwJFIdSxM52gjF5B4YmQ==
X-Received: by 2002:a25:dfd2:: with SMTP id w201mr4967433ybg.230.1593215741673; 
 Fri, 26 Jun 2020 16:55:41 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:08 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 01/12] npcm7xx: Add config symbol
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3_Yr2XgsKCuoTeWUZZQYaQZSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BakCgdhGFJZi

Add a config symbol for the NPCM7xx BMC SoC family that subsequent
patches can use in Makefiles.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Acked-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/arm/Kconfig                  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 8fc09a4a51..9a94ebd0be 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,6 +27,7 @@ CONFIG_GUMSTIX=y
 CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
+CONFIG_NPCM7XX=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a224a6351..a31d0d282f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -354,6 +354,14 @@ config XLNX_VERSAL
     select VIRTIO_MMIO
     select UNIMP
 
+config NPCM7XX
+    bool
+    select A9MPCORE
+    select ARM_GIC
+    select PL310  # cache controller
+    select SERIAL
+    select UNIMP
+
 config FSL_IMX25
     bool
     select IMX
-- 
2.27.0.212.ge8ba1cc988-goog

