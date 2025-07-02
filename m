Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3738523dye;
        Wed, 2 Jul 2025 04:20:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVI+WX4rCI7NtTtPYN9Mag7wfB+vYgiLsxqAFZCq39lBMo3Vks2TP7Qm/XaYxo0HlK8lWoA/BIf89ghVw==@linaro.org
X-Google-Smtp-Source: AGHT+IHUxtDglu5qsQMgy59uc9U32LZb39n71enploQqN+MM0m/BPrAuirQTV382sIHIV+4cUExm
X-Received: by 2002:a05:6214:4386:b0:6fb:62aa:2a04 with SMTP id 6a1803df08f44-702b1a6a3d3mr26162256d6.12.1751455253213;
        Wed, 02 Jul 2025 04:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455253; cv=none;
        d=google.com; s=arc-20240605;
        b=VlezJwscRISf/+zwhkrX/Sswc9rWdyDHFsQNmF3EjKaTDJPrQgEzRXfJCoe47BJnhf
         jYozYLWWUTgVc50VGPUFQT4P4wtxH0QkA0lv7EaXSYp1fZNH/jVbL/0i/AqJ5+HKw+Ku
         DDKnoG2VZWzKrBxfS3JQ52vjOnhSuXu9UTP+yvcDH6doUKKUPZyGp3ukF5a25/6QLzRw
         dC3mHD+CYQDUGj0MvAwp8CKbD7Yo4Z7qTlZjpgTh0fX65UsXDuTmUkpzXCRPCOgqoh4w
         K18qxWrvyinfE40VepnvH9LDjDKh4kLo4oXqKH5N7e0dRlOHFZiOuRHmPys7oKeNCvaG
         0e6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gYbMvV6JPX7BYsIi9SkdULx5qyOjMhaqmvcgcL63Ea0=;
        fh=3YXMNfZgjOXTIH5owjrZcObJ4gH4dU3j44+SP6j7Ewg=;
        b=cqRa1WQ8pHmGZDCtvx/2uN9+LMYXCF8HKgOYv6D5inGw6G57YR9EctkKyrM/v/0GUl
         mspYPAKz+z5VEXaufPeAMsrY3WVsoW1tLllErEKgd9U58F47gRLW9ixemWIIUdYRoPyV
         XcftvT7AlrtlZqv982lhwaGfIsnbVr6lWkmiV5UPCIyKzceNV/F5dXpHBkk/ym1r0ZuG
         53fvU2ffQOAuM7oO7I0p8gyCTouI72JviRObugLFuMUOWH44Jg1UlOB6VBgtuvyo2g/R
         XUZhnevfnmpsnRYmBT28IoGPyB8htQRo24MFCe0VQjzv3JrtBiTPpbXSx9vnIpD6YKJz
         fWYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nFmHCkRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77288980si141681046d6.101.2025.07.02.04.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nFmHCkRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWvW2-0007fv-UF; Wed, 02 Jul 2025 07:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvW1-0007fT-2u; Wed, 02 Jul 2025 07:20:37 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVu-0002QH-DO; Wed, 02 Jul 2025 07:20:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-313154270bbso4542196a91.2; 
 Wed, 02 Jul 2025 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455228; x=1752060028; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYbMvV6JPX7BYsIi9SkdULx5qyOjMhaqmvcgcL63Ea0=;
 b=nFmHCkRfeImCW3nsygA0Da4YlmQi3JXCgQP1Sk09Sv+dZ/s33PkbZSoE1gX4ZFl0cY
 QQRFBYsoCwmyGAdIDvQT7gy3gKEeS/15JZKxglhj+GhZ5y+E9IvndBcSZUwWo8sv4B+p
 lDElaxsLiPkI8eWYU05Z4J4dqQ6zp9BQrbrEdq329nrjK56yznvAPDL48SOlFTAtVWHG
 RpKHuDh0zwOPGUTsPLxxmjHEB8/FE8BE/P0YiDP9F8laTcfjBVn/1gzno/XRm82D9Fup
 Z9tkZ1wr4wUZ7Y4/Rjh3oAkXBMgknp9a4mmQDFIO7jp2iiA9nxbJkmqP7F80JYKW9gfn
 RzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455228; x=1752060028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYbMvV6JPX7BYsIi9SkdULx5qyOjMhaqmvcgcL63Ea0=;
 b=VKk0ZzT00nkN7PYZNChbdOxcZgmGSJzaDrbdUw3edg5B/3MDCpgbH4oBCGwuYuBLjc
 WV0gM8eg2Wn2jVB2DYSyYyRFnxVcu3qrDlQ/CfRq8DWX0k80BEdQ9RKlUMC6y0D6tr8W
 P3ptYH8iDsW/yKov0MGXf1sg+9ee8MzRIgfbgZ/fMB8YAM00ufKDou9/kKRUAzvakQQW
 L7o6YD+8L5AR1RYD53wZuZZXAW93a5vCJqeqD/dHSELAugWpZG26Roai+DXj7xOmSrnt
 UqwGUPhto/U8U3wWRsU1bBU4CQE0VV/6BvNeV6fb9rT6pauOpSS/4mk9ZBkDGbUZQQxR
 cWIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlN0Xkg0SSz3vcQni754keKnSX3GQc/RLAa0qH35mTJG5GtBiDivUeqHktnTnygSyoPb9But30WQ==@nongnu.org
X-Gm-Message-State: AOJu0YzLQDEOlpkz4NC+/H6EpkUNnObQYGCcyY0oHfzmxXDhy4tS1cyP
 T27zynKPDGyUJtpDwJ/h1Xt9cWfE+d+b1edHw2oHRAVo+pJvCJt4NErCY8W92hXV9Wg=
X-Gm-Gg: ASbGncu9kljFpxUKxwOJKqSYsS+nRbel9ZgPKDTE5+G7WNPzS18U/yogbY/5oBmJ7rW
 qMxhAf5FVyQko30UhuDuqruCrispF8w3U7RlW2WQxyAaoZ3hvH0V3EOVda8RRTML/wRA2RSmhfp
 PcJiYG595NYFbVBAYJVC+2YM3hTH3wu1fNV3DAWwWbQvgFPNzfmzUitIzneeW4LNJlmemQItxeO
 loqkTf6FfVmqWMaodO48KKux0tPkygU9f98mT7hpMUx9ezOWMKC4si6/DDEhO2Uq0yQYu7Xcvtx
 pSkfYWUKXcOG9/7uSBce1nGc9P9njQOXzbDgngCIjdMBFbz2lQTyYYaaTIkaBtduggGC5nJEZvE
 K+4Bc0Vcu4Cu2tPCdvya7Ja8x7UAvPsWzDJUDkfUUvmE=
X-Received: by 2002:a17:90b:1fcf:b0:311:d28a:73ef with SMTP id
 98e67ed59e1d1-31a90b480f7mr4532578a91.10.1751455227934; 
 Wed, 02 Jul 2025 04:20:27 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-318c1523351sm14112844a91.48.2025.07.02.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:27 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 07/12] target/arm: Fix VSTR_SG helper store alignment checks
Date: Wed,  2 Jul 2025 20:49:49 +0930
Message-ID: <20250702111954.128563-8-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pj1-x102e.google.com
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
X-TUID: ZpmHKpaNBtTX

This patch adds alignment checks in the store operations in the VSTR_SG
instructions.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 0d609668b5..60e61ee538 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -245,7 +245,7 @@ DO_VSTR(vstrh_w, MO_TEUW, 2, stw, 4, int32_t)
     }
 
 /* We know here TYPE is unsigned so always the same as the offset type */
-#define DO_VSTR_SG(OP, STTYPE, ESIZE, TYPE, ADDRFN, WB)                 \
+#define DO_VSTR_SG(OP, MFLAG, STTYPE, ESIZE, TYPE, ADDRFN, WB)          \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
                           uint32_t base)                                \
     {                                                                   \
@@ -255,13 +255,15 @@ DO_VSTR(vstrh_w, MO_TEUW, 2, stw, 4, int32_t)
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned e;                                                     \
         uint32_t addr;                                                  \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MFLAG | MO_ALIGN, mmu_idx);        \
         for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
             }                                                           \
             addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
             if (mask & 1) {                                             \
-                cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
+                cpu_##STTYPE##_mmu(env, addr, d[H##ESIZE(e)], oi, GETPC()); \
             }                                                           \
             if (WB) {                                                   \
                 m[H##ESIZE(e)] = addr;                                  \
@@ -314,6 +316,8 @@ DO_VSTR(vstrh_w, MO_TEUW, 2, stw, 4, int32_t)
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned e;                                                     \
         uint32_t addr;                                                  \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
             if (!(eci_mask & 1)) {                                      \
                 continue;                                               \
@@ -321,7 +325,7 @@ DO_VSTR(vstrh_w, MO_TEUW, 2, stw, 4, int32_t)
             addr = ADDRFN(base, m[H4(e & ~1)]);                         \
             addr += 4 * (e & 1);                                        \
             if (mask & 1) {                                             \
-                cpu_stl_data_ra(env, addr, d[H4(e)], GETPC());          \
+                cpu_stl_mmu(env, addr, d[H4(e)], oi, GETPC());          \
             }                                                           \
             if (WB && (e & 1)) {                                        \
                 m[H4(e & ~1)] = addr - 4;                               \
@@ -357,22 +361,22 @@ DO_VLDR_SG(vldrw_sg_os_uw, MO_TEUL, uint32_t, ldl, 4,
            uint32_t, uint32_t, ADDR_ADD_OSW, false)
 DO_VLDR64_SG(vldrd_sg_os_ud, ADDR_ADD_OSD, false)
 
-DO_VSTR_SG(vstrb_sg_ub, stb, 1, uint8_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrb_sg_uh, stb, 2, uint16_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrb_sg_uw, stb, 4, uint32_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrh_sg_uh, stw, 2, uint16_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrh_sg_uw, stw, 4, uint32_t, ADDR_ADD, false)
-DO_VSTR_SG(vstrw_sg_uw, stl, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_ub, MO_UB, stb, 1, uint8_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_uh, MO_UB, stb, 2, uint16_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrb_sg_uw, MO_UB, stb, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrh_sg_uh, MO_TEUW, stw, 2, uint16_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrh_sg_uw, MO_TEUW, stw, 4, uint32_t, ADDR_ADD, false)
+DO_VSTR_SG(vstrw_sg_uw, MO_TEUL, stl, 4, uint32_t, ADDR_ADD, false)
 DO_VSTR64_SG(vstrd_sg_ud, ADDR_ADD, false)
 
-DO_VSTR_SG(vstrh_sg_os_uh, stw, 2, uint16_t, ADDR_ADD_OSH, false)
-DO_VSTR_SG(vstrh_sg_os_uw, stw, 4, uint32_t, ADDR_ADD_OSH, false)
-DO_VSTR_SG(vstrw_sg_os_uw, stl, 4, uint32_t, ADDR_ADD_OSW, false)
+DO_VSTR_SG(vstrh_sg_os_uh, MO_TEUW, stw, 2, uint16_t, ADDR_ADD_OSH, false)
+DO_VSTR_SG(vstrh_sg_os_uw, MO_TEUW, stw, 4, uint32_t, ADDR_ADD_OSH, false)
+DO_VSTR_SG(vstrw_sg_os_uw, MO_TEUL, stl, 4, uint32_t, ADDR_ADD_OSW, false)
 DO_VSTR64_SG(vstrd_sg_os_ud, ADDR_ADD_OSD, false)
 
 DO_VLDR_SG(vldrw_sg_wb_uw, MO_TEUL, uint32_t, ldl, 4, uint32_t, uint32_t, ADDR_ADD, true)
 DO_VLDR64_SG(vldrd_sg_wb_ud, ADDR_ADD, true)
-DO_VSTR_SG(vstrw_sg_wb_uw, stl, 4, uint32_t, ADDR_ADD, true)
+DO_VSTR_SG(vstrw_sg_wb_uw, MO_TEUL, stl, 4, uint32_t, ADDR_ADD, true)
 DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
 
 /*
-- 
2.48.1

