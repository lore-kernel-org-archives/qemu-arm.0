Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3056741dye;
        Tue, 1 Jul 2025 03:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXs++wIG3nV3f2M+H2Ow7pbTroqaQebloAoAYfjBe2+If7sTGCECsitGl47TxrRrIPV8IRaE4N2ldiQng==@linaro.org
X-Google-Smtp-Source: AGHT+IEJw695XLw2UOON/5d/5Dvr1tqw9vx6bfkX9ykJHql8cyziLcjzyNQ86HCCWG+BvsdBoVo5
X-Received: by 2002:ad4:5c89:0:b0:6ff:16da:99b4 with SMTP id 6a1803df08f44-6fffdcff50cmr232957376d6.13.1751366068236;
        Tue, 01 Jul 2025 03:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751366068; cv=none;
        d=google.com; s=arc-20240605;
        b=NafI01K8ehQ6zi6sMt9DvamhID6lQBAkPFEwl6lxvOZBlMyDu1ODPRxNiaM88RB0mV
         3IC/TCWT76zpUKUvEmYN7/TA9nYv8fBaSMrljzdY8xb3Uou2qbbSPSHaGZDBC2TpE6Re
         simzhUOs9sGaV5OWvVGuuBIS1wU5aUs7b7K/IsY3Gl0PZ8NH2+vQCtHvefzgXoV3ZfUg
         e6RB9Twhnkb9KjkUPu3eCZYiiXEw8SHWV5eAGB5+G3VTrrDczzdkaLVxoWH9BCbLKoCA
         piCEghk5Fqj2DiSMNJR8KDtQBCvnSg0es6qqBkQWgMglXlaI1gxtFRipw8iUJUhMEHhJ
         ikNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u8gx/O/oVNZBpyXKxn932jEFKdRih4fkiB4W5c1ZnaU=;
        fh=YY9nUc5w24cMHuHgTFjcuo3GC73LQtyUYEufVd64Hvs=;
        b=Zspqyq7A2Ri06QR2ni9Awx/aRdiyqyFqRiDL1S7XOeiS9JuG9qo1EtXmkMgbDWDKrW
         nea20UhkdreWVXmaTTk7yovMcHA9sXXPMWENt/vuzZNFk4opyA70pxGu3AMCb1kcfM/W
         /FiU3e8llHwgyqOkMairJWrGmx152H3LKJZ3aOKqJt2hknqXxxjyD6OZOvAxMailWih5
         USm7wP+ut0VTgHsDGgi4jMbtwV/YUKXTL8Tk4ARGO2fnLvAiKykXYocOnhA1jGq9Z0dz
         6lpVvEpT+9FVYbyWXXksM+aiQOfFJtH6tK3XGBSALpN455d4Obp+H1N98M6OiNytAc4A
         qqsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhx7cDbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77287443si120752566d6.98.2025.07.01.03.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 03:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhx7cDbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWYJ6-0005g8-8S; Tue, 01 Jul 2025 06:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIq-0005ON-9I; Tue, 01 Jul 2025 06:33:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIj-0002Lh-3h; Tue, 01 Jul 2025 06:33:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23526264386so27804335ad.2; 
 Tue, 01 Jul 2025 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751365996; x=1751970796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8gx/O/oVNZBpyXKxn932jEFKdRih4fkiB4W5c1ZnaU=;
 b=fhx7cDbnrTCotSbyjIltOlkWQAmRVbdxpTvudkMX6b/wAQ31a9hfmHxOtSopv3LXGm
 UBwVGaKCbqWCQeYyOf7ATWVrfcRwRBayIpVkuEe0Rt6Fv7mYXNlGVOg/z6LdcmUyQs7D
 BfKYa8kf18wN4qHVsQ0n1f8UJKj5Tr2dGaXltyuvedX3jGvYIz/v3vaWKOAZT3RfWMQt
 TE+Jiuxm9JPrK/RPDNOyC0KxKawcFaANRHrAknakNxI+L9PgkDsUkoL1MRS2TFMSovWq
 QXvQj1og1O/8kP/FxAK+FOeCS1JrcVRZAhxN1HKd5VgiT3W5quq9SM/DedGEfIS4TKVp
 uqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751365996; x=1751970796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8gx/O/oVNZBpyXKxn932jEFKdRih4fkiB4W5c1ZnaU=;
 b=tdVCJvXSh+fXTuUOvvsR2+6/5bYSe4+CepNjlSeSGYudN98GC5xhk5mhdEQIL6NGlw
 pQr9v/J/vSju3l8L4EcbUqQ9y8UU2xWzLEC/hGSxyYewfC32ig06MF9YshokzAocXqzE
 R+bnywy7KPUb4hA7zwzGR7fPGPLpNwG/E6LGxL8mqQ7LAnSRSVrgRq5Hx35EQ3k+DVC4
 7pH007jU7402X0iFm4y1rdMvc9Fz95lGe5Bb+P/hnWf9JFXsK41LeG9sKs4yh7N0lc5U
 pGGyP3gLqH2AM80p62g8aHgP8NgZ/m/w/qzz0CJZh7ukgEMfvQAFKCTdvTvX2UAduPLp
 3lLw==
X-Gm-Message-State: AOJu0YwBwhLlKJA6GM6D+hCB76pNATf0Jh1WSiVo5NZ6tuprAqEjMBb5
 Ac/TWvy7LzTM2ZueUvJw9Lrj6atgF2tkd5hfa63VQdeZvN69muMWNWZEp+OXKPdcWFE=
X-Gm-Gg: ASbGncs3wgR0iziD14FRPkh/TV155Zcb8Rr4HSmbWqCVVE3zRZ8TzdmGEoeLxf9+6Tm
 D6vVjvygV7IzskDm3gr9EEBO92WJfN/Svnt/e94408WaUyOn494g7xyWLUYVjD1ZGIeJR17m3Go
 rbXRIt5p/F8DO/8EDOnO8ETZ2FzhYiRLv+zvREOt7bTU0NTds5r17OkWZtbB3yi0JhzGoPF1axN
 XKzhnKkHwFbgpl7+32mkJRpW9KC3ci4zearJYaenF9Ba7K6Dg4mdyOGVxjtbfPNWr+CAZ/ehzfj
 LltqhukZff4y4DAbU11vDrCi+pWjNr76qjGTopkONvL/xNIG5+ucMzuJ1vVm74e0wPvBv6mJ1/c
 FUDdw7fz/uiQZ70fuSCII91djUzb/Efrq3IkmxVZOVeM=
X-Received: by 2002:a17:902:d607:b0:235:129a:175f with SMTP id
 d9443c01a7336-23ac46527famr260661515ad.34.1751365995661; 
 Tue, 01 Jul 2025 03:33:15 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23acb2f2183sm109168435ad.75.2025.07.01.03.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:33:15 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v2 07/12] target/arm: Fix VSTR_SG helper store alignment checks
Date: Tue,  1 Jul 2025 20:01:54 +0930
Message-ID: <20250701103159.62661-8-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: rAImgq0P0yIs

This patch adds alignment checks in the store operations in the VSTR_SG
instructions.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index f1e9c87e6a..5b04fa4425 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -277,13 +277,15 @@ DO_VSTR(vstrh_w, 2, w, 4, int32_t)
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned e;                                                     \
         uint32_t addr;                                                  \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MFLAG(STTYPE) | MO_ALIGN, mmu_idx);\
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
             }                                                           \
             addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
             if (mask & 1) {                                             \
-                cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
+                cpu_st##STTYPE##_mmu(env, addr, d[H##ESIZE(e)], oi, GETPC()); \
             }                                                           \
             if (WB) {                                                   \
                 m[H##ESIZE(e)] = addr;                                  \
@@ -336,6 +338,8 @@ DO_VSTR(vstrh_w, 2, w, 4, int32_t)
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned e;                                                     \
         uint32_t addr;                                                  \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
@@ -343,7 +347,7 @@ DO_VSTR(vstrh_w, 2, w, 4, int32_t)
             addr = ADDRFN(base, m[H4(e & ~1)]);                         \
             addr += 4 * (e & 1);                                        \
             if (mask & 1) {                                             \
-                cpu_stl_data_ra(env, addr, d[H4(e)], GETPC());          \
+                cpu_stl_mmu(env, addr, d[H4(e)], oi, GETPC());          \
             }                                                           \
             if (WB && (e & 1)) {                                        \
                 m[H4(e & ~1)] = addr - 4;                               \
@@ -375,22 +379,22 @@ DO_VLDR_SG(vldrh_sg_os_uw, w, 4, uint32_t, uint32_t, ADDR_ADD_OSH, false)
 DO_VLDR_SG(vldrw_sg_os_uw, l, 4, uint32_t, uint32_t, ADDR_ADD_OSW, false)
 DO_VLDR64_SG(vldrd_sg_os_ud, ADDR_ADD_OSD, false)
 
-DO_VSTR_SG(vstrb_sg_ub, stb, 1, uint8_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrb_sg_uh, stb, 2, uint16_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrb_sg_uw, stb, 4, uint32_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrh_sg_uh, stw, 2, uint16_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrh_sg_uw, stw, 4, uint32_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrw_sg_uw, stl, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_ub, b, 1, uint8_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_uh, b, 2, uint16_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_uw, b, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrh_sg_uh, w, 2, uint16_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrh_sg_uw, w, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrw_sg_uw, l, 4, uint32_t, ADDR_ADD, false)
 DO_VSTR64_SG(vstrd_sg_ud, ADDR_ADD, false)
 
-DO_VSTR_SG(vstrh_sg_os_uh, stw, 2, uint16_t, ADDR_ADD_OSH, false)
-DO_VSTR_SG(vstrh_sg_os_uw, stw, 4, uint32_t, ADDR_ADD_OSH, false)
-DO_VSTR_SG(vstrw_sg_os_uw, stl, 4, uint32_t, ADDR_ADD_OSW, false)
+DO_VSTR_SG(vstrh_sg_os_uh, w, 2, uint16_t, ADDR_ADD_OSH, false)
+DO_VSTR_SG(vstrh_sg_os_uw, w, 4, uint32_t, ADDR_ADD_OSH, false)
+DO_VSTR_SG(vstrw_sg_os_uw, l, 4, uint32_t, ADDR_ADD_OSW, false)
 DO_VSTR64_SG(vstrd_sg_os_ud, ADDR_ADD_OSD, false)
 
 DO_VLDR_SG(vldrw_sg_wb_uw, l, 4, uint32_t, uint32_t, ADDR_ADD, true)
 DO_VLDR64_SG(vldrd_sg_wb_ud, ADDR_ADD, true)
-DO_VSTR_SG(vstrw_sg_wb_uw, stl, 4, uint32_t, ADDR_ADD, true)
+DO_VSTR_SG(vstrw_sg_wb_uw, l, 4, uint32_t, ADDR_ADD, true)
 DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
 
 /*
-- 
2.48.1

