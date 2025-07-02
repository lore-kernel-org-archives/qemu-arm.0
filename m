Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3739387dye;
        Wed, 2 Jul 2025 04:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVF7gMndb8VZcTVD0kN+bljcGv267zhRfI9oMTcq/b+FX9P+ZdTYNtxZoMdWXYrynsvNDoWmVSdb5DYg==@linaro.org
X-Google-Smtp-Source: AGHT+IG/BkR6ACsXhu3exY6hhsLurb/wuo1BcVhJ95ZykgbHZwTU/uTEwzxjixaZxJBfPN1N2/YV
X-Received: by 2002:a05:620a:6190:b0:7d4:4ce0:4e7b with SMTP id af79cd13be357-7d5c472d458mr303156585a.13.1751455345293;
        Wed, 02 Jul 2025 04:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455345; cv=none;
        d=google.com; s=arc-20240605;
        b=eNzOXsmPQBI0UOb2lTFQ2P2qwjYlGBMxIbpAsyDtoKxFfGdaBaT/EvTY/YNmvAfy3y
         VfXH8isaTWwQN8FeEtAY2YWWEc43Tmq58k4uk85an7Ru+/LvbT4eFoA6M734kf6Qva2v
         cS1YnjwAB475CYfFR013bVFbv9OnhDrw+QOGY+LjmhAxEfLEGf0XNjtcYSGC4qSSeqra
         PhIJV7ymF0reFnmrqpX/jM4zuNWU7V7BZfsv1B3xnvmsd0WaUFmOgG9TdWmKSPVWuCez
         cpf/IufhmnKlDdy2MjcpaSmHLxJ5SIFGecvXvb0aaph3ll9GdymnZ+z/o+HEcF+EDPJV
         smyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CG0R9mTp11tTEY5zMYyUSL9wFDskVR0oTUKY6NSgROg=;
        fh=SE8TJx7eK6KZkk0aBYp6T82H1+ITSkL5srLJ3ptZX3A=;
        b=M9H1L+MaOn2R8X8ZweZmCngpUC+rMFbxaZkyKN0GC9eR9e/oZUxFKT04OvPM4J9E8E
         26hymoGVflqDaiqKxM05DfDBhN1dnqBmF36e5RsN7k22nAxzQRbMEaOPqfyOsX5S7Z14
         f8iL9QbspRMBxYuPo/Rim/K5YvCAI4fjV56TcEnyRS1mco6Ecx4dGxd847qjDDJ+URCZ
         /q6XCHglWxat4RLrkmtqcROwsKyqoMM7FdTptnCUazgGYLT0rcf9gHClsERaWDKlnvEP
         5H1op2dwvMRs5jydMg9HKkeBp3Gv019/KxPUvalyaFX3WlWccHesA+10K+MxGrmXJ13S
         GymA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFxQTTbQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d45fe64c69si524801885a.35.2025.07.02.04.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFxQTTbQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWvWV-00082F-SA; Wed, 02 Jul 2025 07:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvWG-0007jY-CJ; Wed, 02 Jul 2025 07:20:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvWE-0002TK-B2; Wed, 02 Jul 2025 07:20:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so6771828b3a.3; 
 Wed, 02 Jul 2025 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455244; x=1752060044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CG0R9mTp11tTEY5zMYyUSL9wFDskVR0oTUKY6NSgROg=;
 b=kFxQTTbQflh+xqpEnbQOFBWzb3dOyAWPQ6fn6dhYMzwhhfC74f14O9U7lwYT1gkQKK
 kJFAB9osKWco3Ze+FDaD7+zjuslYCpAPJGle/JcVrldIY78vnIGKwdoYc+aaBdJ0F5Yo
 eeInJ3KXrLJfgZvJTXkxhXMUf8bFHW8g2xq9LE/53oWzjyR6cKYGmRiF/vyNCEJnMf6z
 2JB+j4BpVDRbJT+8cP+qOTttS8jmO8PoJNcR9VlWal/vvW6fFEyj3l8YLpnJhN6L+FLs
 UXBaaD3pxl2smvNHHCqh/SQMwbenmeRKJx1go4tOdq2iXSyRQLQuLncOvUn3GAUrgZVz
 uG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455244; x=1752060044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CG0R9mTp11tTEY5zMYyUSL9wFDskVR0oTUKY6NSgROg=;
 b=bLjJTbA4KBstzI/eCuu4RjOMfbdr3C4wP6gzmKxRbkhdvE8FqauYC8tTMQN7AP2foH
 KzdFF5axzPrrEhXDfVruS43unuXFDxdP61DR2KLdwQVGmLOBX/sQ67ocuVBQ/3I/tMm+
 MxKkD3LCjnfXf40pOFyfKMoS+4j9mklgZFcFEX11un9jPbpnNCLbZUUnQghwq3EQ8zXE
 C+wffXBJnh3fYhcedd05y+/pv6yuJ6LRVWOFF1MJNAuXXjme29A7fEkAjCUpAkuLmv3A
 qlhNDzG8dhdnAE5y0dpIIXJ/obrRrDT3VGhvksAnRLq0FXVkzqaJEeVyykjIU5TMEC38
 cL7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFJivlMgg8RRYvjkIqrCE3I8SXY+eeng2rL90Wmrqy5X7Bp11KQs0gWIK5UodkANqXx4xvQ24c0Q==@nongnu.org
X-Gm-Message-State: AOJu0YysMyNUxydxgVWevoM4IG1SpVrtt4Fzc/4gKkiGSGIl9g4ZrEUH
 oFblDGDuZMGzC1Oz9juq7CkZAS6Y05XVL9MbUjmDINmUk9zOUFbaxrnHQ3GS7YRIy2U=
X-Gm-Gg: ASbGnctcSPejjSaVF1pO99t+5DsFLUdV4o6vYI6owJ8WZ1m+TpkUlgLSC16nt1O7zMr
 z9iBbaFJxAu4xoL2ZtLD/MWYGiRHWOpFR4cxhlzVAjYliBtpzKI1a2oB1PiRu1i4VGlCS1otHoP
 Izw+t01XYLeLxDAKCKkOoN5BrrEnU7vQ0UtYJ27McH6AQmHhJD6gBHk0i4AlEiiQ1Y4koV1Rt8J
 jABkKDj95nu7h6uAVdi+7u/yH44Gtj4vXE9HLDeFtybJeWXtYhsKzrnP0E0IOtAixO72tF3VEAE
 djGgypodLebQafqDpxTA7yUjHUEczV+xC/EqMmaD/doXZmaaMn2Sitm9oOWtsAiR6lCbeaHCvE/
 Jja4bBwceDE5yQDkWsAX/fpM8IOgp/RNN6nNcpJJ2ye0=
X-Received: by 2002:a05:6a21:e8a:b0:220:eef:e8f0 with SMTP id
 adf61e73a8af0-222d7e90b1dmr4775419637.23.1751455244156; 
 Wed, 02 Jul 2025 04:20:44 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74af540b25dsm13618409b3a.25.2025.07.02.04.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:43 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 11/12] target/arm: Fix VST2 helper store alignment checks
Date: Wed,  2 Jul 2025 20:49:53 +0930
Message-ID: <20250702111954.128563-12-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: yrzWrEv0xK38

This patch adds alignment checks in the store operations in the VST2
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 185f6efeab..5dd2585684 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -669,6 +669,8 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         uint8_t *qd;                                                    \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -680,7 +682,7 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
                 qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + (e & 1));    \
                 data = (data << 8) | qd[H1(off[beat] + (e >> 1))];      \
             }                                                           \
-            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+            cpu_stl_mmu(env, addr, data, oi, GETPC());                  \
         }                                                               \
     }
 
@@ -694,6 +696,8 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         int e;                                                          \
         uint16_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -705,7 +709,7 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
                 qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + e);         \
                 data = (data << 16) | qd[H2(off[beat])];                \
             }                                                           \
-            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+            cpu_stl_mmu(env, addr, data, oi, GETPC());                  \
         }                                                               \
     }
 
@@ -718,6 +722,8 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -726,7 +732,7 @@ DO_VST4W(vst43w, 6, 7, 8, 9)
             addr = base + off[beat];                                    \
             qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + (beat & 1));    \
             data = qd[H4(off[beat] >> 3)];                              \
-            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+            cpu_stl_mmu(env, addr, data, oi, GETPC());                  \
         }                                                               \
     }
 
-- 
2.48.1

