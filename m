Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7358787njc;
        Tue, 12 Nov 2024 06:13:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcZAboYoozNSzC1FC2iL5/zmnzv17G3iwOKKDGDkDDP4vwwzF0Vo5r/Ra5BihJC3klcGGR2D9/IwyNfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEen8bxXtXp2ERQUNqsf8mU337LLGCxF7K9hQQP4zn/rTMVB6O346jaMcx4OIW0EQfR2kdV
X-Received: by 2002:a05:622a:11c7:b0:460:9ac7:8fcd with SMTP id d75a77b69052e-46309319243mr224740971cf.1.1731420798687;
        Tue, 12 Nov 2024 06:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731420798; cv=none;
        d=google.com; s=arc-20240605;
        b=VvhyhcTw15uzBcC8pcovtaxnxJOTiirs6bKfclzEB+lsfNJa4xxo/AetKSRlC4U5iw
         O9R1uNbSc6QwpJbWkEn84aG7CwjWbphXrfBcTxuzCtydBd8qkG4HyUWYvBtXhMJTpQvM
         H5IKBpMt6JHVPaancWzm6M1DXNYNjdyP+pmfdfccqkA3xLBHMInxK61WDkOOY2bQ0NlV
         TrT4BLBuvOCClg5u9H2OrudjSvhYdlgKc47kAZC75ZzoosQK0IlVcm9+Z1nv/WtEdsin
         9sS4sXa9mHw885qQUO60FN/H0FlbQ6NJtzGiOsBp7z5RzaHfBrZou7+toFvFhz1tn9nZ
         i1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JM+EJG8uPTvGoZU+1TdInhch32L1euUCIAwGo1PQ03s=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=R0u+QpAOtDeTRrXuhqdDETE8a+Qs0og0LwEa5uFhScIEnKL4KlFPLGFvNk1Q1EUCvK
         JVN38tzMEFpgZoRTstLmP6WUyMV/NmxbS2ewIdjlNRkESoWVPIC5ps+Uljx+m9/OOXij
         BnijM0MDzwL5QCBF1OzJsdBb+c2jq7DGtYH9fwkDdw+MpmDQWxgb7uINsC2IBAsqcw/K
         Ad7oSkYxQlCVoRhnVL6fCy2lX5JvVojU/UUoxWqsp0JSSBvVvzsSGQMeTw3tide0qz4x
         uL/aj9n+R+ZHu4kbmPwR/Qr1Q5ETafcQFIKavDS8En+oTTX6+4nv2N26AfYT0808IPCh
         RJPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlxBDVAU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff61b959si143720471cf.439.2024.11.12.06.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 06:13:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlxBDVAU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tArdO-0003PO-7f; Tue, 12 Nov 2024 09:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tArdI-0003OF-Dw
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 09:12:41 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tArdG-0005dW-UC
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 09:12:40 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-723f37dd76cso5867259b3a.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731420756; x=1732025556; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JM+EJG8uPTvGoZU+1TdInhch32L1euUCIAwGo1PQ03s=;
 b=hlxBDVAUMATdgV29hKbC8bP63uChJpfylgxLcZeZR1pdU6/hxiP37TAmgaSCU4lLlI
 LqJGWBt4KUishV9xfJnkZm2ncpYVhfqCCuJ4xdZ6gM1ZfhEa6MJagkaKR8U15I3G2ifT
 Ct+EfakZJOUVcJzuhCRctWcyGTfQhDVV2PM5pEV9nSTLK5IXvKqpA7Au0MkbkxznUwLs
 Dx6SgxfXxWO5qoYcHvON0Dh6vw45rVEKTCA7yk6qr3YZXnxQmWIRT+/y3A4EZNLo4BMv
 QAOUamuqf33m32XAg/asnHImpUOL5BVjR0OzDYYqbskwsPriPKPvcYwTySqJZZKysjrK
 RS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731420756; x=1732025556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JM+EJG8uPTvGoZU+1TdInhch32L1euUCIAwGo1PQ03s=;
 b=uZeGsvYQYadJputtgK/l9igYeOBuXaDfAbDm9Vedb6F+JLgbn2BE2PGTC+ttDduMQh
 gVQG/OG2YlXga5YztNCk6la5MHCEE7FETs6J4phUa92jopYKbvpG3SrXolbEFAmDH77E
 MJ8HO4gKIdFucQj6si7FpqHPfKKN6VKIpqKLocEBYESQmvq8+qsLIJTGAWfyPwXC/ib+
 I1nXz49agKeceRBnQ30L5is4e2IWVVlgKFUfKanytjKg1cDHgHRouv5yvQTGSg8AKBjx
 Xzl0k6h0w1nNS/APBVtrMTOep/VlqRBDjpmSexOyN60rx3ihR7wkv6TKHAfDnz1xQdNl
 hhNQ==
X-Gm-Message-State: AOJu0Yy/i4dgfp41wmq1QTLLMlh3Z/l/Eu80dWv2hLUTA/4DZjNHDj+k
 3yg0vhyjrHPeaXAB0WmjZDVC6aSqs4aUGSmcLFLFfI6S7rPON4Wp3QddWoHuzQs=
X-Received: by 2002:a05:6a20:9f03:b0:1db:dafa:e9da with SMTP id
 adf61e73a8af0-1dc22a2670amr22189262637.27.1731420755869; 
 Tue, 12 Nov 2024 06:12:35 -0800 (PST)
Received: from stoup.. (wsip-24-120-228-34.lv.lv.cox.net. [24.120.228.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724549a899csm335330b3a.115.2024.11.12.06.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 06:12:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-9.2] target/arm: Drop user-only special case in sve_stN_r
Date: Tue, 12 Nov 2024 06:12:32 -0800
Message-ID: <20241112141232.321354-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wGUTZOu8dAT3

This path is reachable with plugins enabled, and provoked
with run-plugin-catch-syscalls-with-libinline.so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index f1ee0e060f..904296705c 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -6317,9 +6317,6 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
 
     flags = info.page[0].flags | info.page[1].flags;
     if (unlikely(flags != 0)) {
-#ifdef CONFIG_USER_ONLY
-        g_assert_not_reached();
-#else
         /*
          * At least one page includes MMIO.
          * Any bus operation can fail with cpu_transaction_failed,
@@ -6350,7 +6347,6 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
         return;
-#endif
     }
 
     mem_off = info.mem_off_first[0];
-- 
2.43.0

