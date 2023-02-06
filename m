Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4121667ejb;
        Mon, 6 Feb 2023 04:17:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9kM5YvIF2Qt76bro18sukZVpoD9fchDwHHgk5SPHwyprWk3svn8O8b3FuPoey71JDp/15p
X-Received: by 2002:ac8:580b:0:b0:3b8:2ce4:3e9 with SMTP id g11-20020ac8580b000000b003b82ce403e9mr37848024qtg.32.1675685853975;
        Mon, 06 Feb 2023 04:17:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675685853; cv=none;
        d=google.com; s=arc-20160816;
        b=ezQ5laYLxFMckc7+GcbixFSJr9joL48DaMrahdVXXmUDZZ+7LSwRV7qjWWA7KPTu9M
         LKI+V82YIkRHAYACWM2+8M3HmSHWJZB44jdw1Oz3TjSNQJ0gE4vSWatrXHlffXju9AV1
         eBz+osHK2vfp58n9lG3xlZyFOtVTPkWBr5oaWZSRreO459AVM2dKdYqLXVLy7qY1erJH
         dEdtRgSi7rDHQG3VwSzFrp3kWmZ0NXVGCU3KA1YlG/I4SXxc7NiH2lvejbL/2jZyLFJb
         iPwwrZunA7EZxiaGFue2PJAqb10wUbQWQbf54gZdM0/hGfX+gSbMm+8KlcWkWDnR978F
         fcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ggNkI2omzYSbcFU8obgJYTQOMlCPZdcoe7nl7q2N0Nk=;
        b=ftIhAu/7jYHyAwbJ+B/VPLmstlWFp3soJQTyMau45P5mWFxQtNCLbtXD9EAKwWC4sM
         5WsP8RQwRao7T34ku2+ZrQ+gg8tDh7nQroRtk2XMXRMYOFLUeb096P+WblYx7IyXaPup
         TJJD9FFFKN+HDK1KQ0PWtSu4md5nWfXL4YX4mev9eaz2I4drTdkKVpDMBtLIHSvIC7Sy
         VtTG8svzmzWcIjMP8/jHMOBSmWyOL9cRO7xC5KBgmP+h7NBzSGgjdKux0MxWrTE3IyiY
         PhU4qxquwG6dEBRQHbMxZ44rierqCk+oZLghYpXufkwXFPIvOFUQ39fmoczaRJ6+NW4N
         lsxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ex11dsO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a268800b00727d8ce1a36si10112099qkp.339.2023.02.06.04.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:17:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ex11dsO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0R6-0007Vj-PR; Mon, 06 Feb 2023 07:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R3-0007T4-6u
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:25 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R1-0005lr-He
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:24 -0500
Received: by mail-wr1-x433.google.com with SMTP id m14so10132996wrg.13
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggNkI2omzYSbcFU8obgJYTQOMlCPZdcoe7nl7q2N0Nk=;
 b=Ex11dsO2tAxKwwh4c0Z8lX40laNBG528soWM3BI0VsHU0RL5OX0PlULKYURkFeOuU+
 jP4jnlpuiog1hthmSjiYtquaFU4sKltJV6b+n28G/oLAtPokUBuOKN2Uaw7inm5t9TPL
 ApvPAav+tlT6ROA9xTYZoR/hY8GpgLgxvrRVoy4DQI1dh6Duon2lJolgiwvvyRdHQIJZ
 5/0iFgRuq4clAjOa5S4xTK2z6BItYL1S6/mcPU8PSCv88pZRcSXwj1pxmqr1FhiSYEki
 ojRJeQzxQiZ2C0cL1o4HLaJPQ1eyAVjNxPzOCX4q6xP104Zna5nEs7n7iD6oAbCgeE6Q
 zVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggNkI2omzYSbcFU8obgJYTQOMlCPZdcoe7nl7q2N0Nk=;
 b=Hy/fO96QZuZU0p1D1pe8sQSj+WROfWPk90iszMhgsRCoVhoz6WJSY/Ga3XOYjkAETa
 Kyw0Oo5NPHPSFu1CJczNq44GcYLhHyAKwByaVm3ny+Gjv98xzP/5qqFXcLYfY1iI0USh
 MclklGweh0gbh6pmmi9kjZ0G8nqH3LjJAIeu5zPvQ+K1VrNDzE81Pu6ijvSNpkqLjXgn
 I/dQYmAhBcYvpUy4B3iRVHvNI6OPk7gv0tOIqcUj0PGtK2zGurLvYK0O1e2yic5/7oNl
 IXeq8d67gqmcEumg4r5SpWORSqYflXkdWbCEF9iKiJzCDHlVN7qinwcDEeaqCpUVIapi
 bxuA==
X-Gm-Message-State: AO0yUKVbBS2dp+oDntZVrj+ZmNLgnOqH8H56OBbUEcz9LA+mErSqOUso
 T8T43q818uzWsdtBMMTBFmgS+w==
X-Received: by 2002:adf:c753:0:b0:2bf:ae51:807c with SMTP id
 b19-20020adfc753000000b002bfae51807cmr18681837wrh.22.1675685842110; 
 Mon, 06 Feb 2023 04:17:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm8827462wro.57.2023.02.06.04.17.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] target/arm: Restrict v7-M MMU helpers to sysemu TCG
Date: Mon,  6 Feb 2023 13:17:06 +0100
Message-Id: <20230206121714.85084-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: s7iSroZXO0Vf

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c   | 2 +-
 target/arm/m_helper.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..5dbeade787 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11774,7 +11774,7 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
-#ifndef CONFIG_TCG
+#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
     g_assert_not_reached();
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea18..1e7e4e33bd 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2854,8 +2854,6 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return tt_resp;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
@@ -2892,3 +2890,5 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
     return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1

