Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3738842dye;
        Wed, 2 Jul 2025 04:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuhTKKMcf8Yp3bagyeCaBk0Oe0XqJm8Vz9CB9rHkKohZxcCZ53EMYK2D0hPjROc6ji4HmBq65opTq4mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDMDe23ED2/1Xnx5662Oox0VZaUpSY1PFyNRYngSSuY615b/iGVcgh94hYEFBt7oBCBXab
X-Received: by 2002:ac8:588c:0:b0:4a7:22fd:682f with SMTP id d75a77b69052e-4a9768b75d8mr44747101cf.3.1751455289557;
        Wed, 02 Jul 2025 04:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455289; cv=none;
        d=google.com; s=arc-20240605;
        b=OXKP9gHknIQGmVc3ADR4eGUR/kEcA9WsS3vgWc7jFI9MC3PqaWtATsauojlaUIY7Sk
         RYrRzxKOxuZc4JYW427hr/zxXuSvEI4iUZOzmaBxlfNUocGy0OQ32x8AwWTvYBCfMUoU
         ehGR1pH5OB0Xddeb60G90cx/UG+1Mfp2EUWVSIuMF2WuTq6Pv3kvv4GL/MB5HiGupgMV
         db/jrxeiTgzRXPEkPsOxXVcqfY3YrDu4Yw8z+dS+3EU8u5fyTu/zbvnOIdg/xHwIQ3q3
         IScc7vi8FriJDq7vF2ruzzFfrpDeulDVlocpFghPDvEXC31tmKHIl0FEv5dQ7ltaE2xg
         2xoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TmGCorEGQlW7KnyvSorg2owRSTnel+NvEASPcPe6Kxg=;
        fh=4ashi8I7zHaMj0ihGqBh0F5o36fvTrNa1lXBm5sanYE=;
        b=GibPAvhiuInyjWaKJVKtox3E83z8EpmBj2mYJp+QZkLVB4pEiztB+cqutc4deR0E4R
         vLxZZyj9iWlNTl4zrkmWVpV/CByFef48tddfYYIk7txifYWVilp7hYxUMKW009LzPnCb
         ognuLOoegqiri3/YoJeusivQRrJCjepctSlKNCqgjMRd2QtXI20pbTV1Ncmbf8HAaLBt
         /6eH/eQtNpaG3wZ9dXqlf0Qrs/kzohlftwpXvlyYdVQXPtJu4XSxYRz8P98NnGXEXDlq
         +Q1R8qQQ6jbenRI1uQ8sO4ebrKKffyc4zc0uebJZaymjBs8E/qj0hGLI0YqPTTYDY6Pl
         NaFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2lUAlP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc57c1f8si127629911cf.666.2025.07.02.04.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2lUAlP8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWvWU-0007zd-SW; Wed, 02 Jul 2025 07:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvWB-0007hU-Fy; Wed, 02 Jul 2025 07:20:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvW5-0002Rp-3f; Wed, 02 Jul 2025 07:20:47 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so6290216b3a.2; 
 Wed, 02 Jul 2025 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455236; x=1752060036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmGCorEGQlW7KnyvSorg2owRSTnel+NvEASPcPe6Kxg=;
 b=d2lUAlP81WBhp8W8Wc1V6ByYcDfla6Dl9zcxRfa3EexWsCerNwJOcnStFU4h3+Sr9t
 5Gx9Y43zNN/sGE5qLcuygTyWZrAnteM7rusfAruO2aapvhqqQGavnvf0eqQwY1dqZlrH
 arevpDLZQoJuFRh5D4CT706JBBRGf+pfZVAz2ONaRUPv9LE20Mjw4LgghWYXiKLtf8lJ
 0+urCn0Q6nL59/t9RdI7gPPppQD/hZRptEVc2O/1jxu3c1BH14y3FVBcd/foso/1P9Iz
 aYJWDAXtYsUUWiWZiHz8dMbiMkoibXtxsEXtzmvJFziPtwCRmDYd9iL2bZxsFnN0vjjh
 n/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455236; x=1752060036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TmGCorEGQlW7KnyvSorg2owRSTnel+NvEASPcPe6Kxg=;
 b=P6WqysNOBofEocU9nQQQExehdJnfMsR4KRqQP3KO+C78t+nYmsPBkfr4qODZ987Iep
 t5lG2WRUpk8emt+nB6sVq1f6+b21xLbydx/KpfxW8fjbN+fViy5hJ6fNl5u60gbv0H8c
 Kt6/mIrmmJCTMiAcPMQ/RAjRN5RdH8CE84q31V+0dshlHvKEPVUB9s49X0EBMmcz+B2j
 qz9pOsxCWZlzbjzcpnpcoAhyqjmfiDw6n6U6Qy6ANFSx2TQUtqBb6VGZwDKulS2BLjGr
 Hd2ii3MVBniCgmB74sMn313/FEL2xJx/XupS/x0lCc2Owf2uJ57O76NTp5MIdhDnVAoD
 SKoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVdQJR7sb28Ih4bndry2agczO1HO3XjZQ9A0tx1DRzMXBnEjwL3fitYjPzO9dEwoRLIOpNnmqsbw==@nongnu.org
X-Gm-Message-State: AOJu0Yw+eDEdP9QxmvOvqSQHUKyU0KbLC8+AatZSje6Rt010GGSNCndu
 xTZvlb2gSfN38R47aeJXuqmPNmwIzE7gj+gHvVsoTMGWwGQm7ltt/jtLQUt80bThC8Q=
X-Gm-Gg: ASbGncuittJfBHWjuzC01IpXmUd7a7abCFa3Wh0CGEjW2yyK4Wwvqu/yp4dzCXCzW4W
 v+r2PoJd9VkyVAYVVADtpynFQTXSXjqh0Ws3PiIkU+KQTi/nUaSLSZoTn6Dz3HFhY1GPQkXsinY
 cJu31M5MisHXq+OUUZ5Isr2NfDcPuYSP8Fws7GH49nx3//J5ToW6yB4ZlOgcsZ3LDx6Nbr4kE+t
 04Xtn+w3QHH7ytCMuf4I2HsEgpICWqTJE5Fic5jwk9jAtQcHSuvgDVexEPubDYBvSIwI/5vtk8k
 M4ORu4xtMxjPMILzHju+qPXawWhwpgdqARe7hJXbFbS6YIGaeq084Ag1r9E025yme7F9HSo+6dE
 7UXV3uowhYSxjMatSidPGLvR1veO2zO3RbOnZNJT//Xg=
X-Received: by 2002:a05:6a00:1995:b0:749:1c27:bcc5 with SMTP id
 d2e1a72fcca58-74b5126948bmr3175468b3a.22.1751455236063; 
 Wed, 02 Jul 2025 04:20:36 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74af541a3e4sm13688454b3a.37.2025.07.02.04.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:35 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 09/12] target/arm: Fix VLD2 helper load alignment checks
Date: Wed,  2 Jul 2025 20:49:51 +0930
Message-ID: <20250702111954.128563-10-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 3Iy60Jws5dly

This patch adds alignment checks in the load operations in the VLD2
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 86eef54426..d6e2f1ac5a 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -495,13 +495,15 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         uint8_t *qd;                                                    \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 2;                                \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             for (e = 0; e < 4; e++, data >>= 8) {                       \
                 qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + (e & 1));    \
                 qd[H1(off[beat] + (e >> 1))] = data;                    \
@@ -519,13 +521,15 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         int e;                                                          \
         uint16_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 4;                                \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             for (e = 0; e < 2; e++, data >>= 16) {                      \
                 qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + e);         \
                 qd[H2(off[beat])] = data;                               \
@@ -542,13 +546,15 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat];                                    \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + (beat & 1));    \
             qd[H4(off[beat] >> 3)] = data;                              \
         }                                                               \
-- 
2.48.1

