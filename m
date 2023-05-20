Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276539ejb;
        Sat, 20 May 2023 09:28:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46EtqPLu96FyOJolxwSUMnW7FPk5BJhu8POvQM/vXXBSI3lBPsX5j3Q9C/Jxz/37uXheZb
X-Received: by 2002:a05:6214:e8f:b0:572:6e81:ae9c with SMTP id hf15-20020a0562140e8f00b005726e81ae9cmr13710943qvb.1.1684600139567;
        Sat, 20 May 2023 09:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600139; cv=none;
        d=google.com; s=arc-20160816;
        b=eNgUUMV1lzcjveRhsIM5U5Do3dlog4X//0elBaVljiV0rkyit43uWlI65hPHZv+bAD
         XylynONCKsWcdGfr1iaGbxCdVBUeEpoYvOOtP3VXLbYrajyOBPniK1X2UTnJkDfEIm+R
         PSr9x8se74JgLf/Ib//GmIucTZbwT4ZPAAJA78QPs0+fMiMLQ8CLBEqAbGvROTMxfCvH
         2YJwdnqFtXN4Hcadq45y+qy9GW4wzQ2LR/yHCNu9WDD1EIHZ2bpbFIhMxJ6Q8UcO6pgJ
         24+ANhyXrDVg96vZVlhdcd2iHLcpNvvmjS3Ss6VTyqt2Rb6Ks9mjH1xEZBobLpUlWIEy
         miDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qaZpDDjPwlY2m7x6v9ar9hpPELeL8Q6hzaJ5d16jETI=;
        b=bobsweI0thk88tMnEtiU3UV5q8OjYJlf03r6Hc1OdEg0H275+Gu65G1sou8rdk4mvw
         OCnuvxu71MSuas+IPim04OuMrrsakeGsX4XJay+PL7YwyShD9madDKnpfMQOuIl7xooZ
         OHQmkcTQzAUQMGXInISBi3vXEeEDsJ4FjQ8u0fTkSmRa4IfL72aCdxkdV54WKQdNt+vo
         lCmj5o5ihB7XUhBZFEBNH/Q0nbfXk2N0eKh1oc186Kxv7Yaaq91usMbAQk7tHNEV9dmz
         qkhEn9hUw6sbq2/1tA4cVqu1OejPbPS0axYFDNXHkU8Qrt3+4o6qJhFUNy7KWciKJnp3
         KBEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U2/mcl5/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js8-20020a0562142aa800b00623640d2b10si1184576qvb.446.2023.05.20.09.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U2/mcl5/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PQj-0004Fb-Vq; Sat, 20 May 2023 12:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQE-0003i8-UT
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:12 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ8-0003Ap-PO
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1ae851f2a7dso11662295ad.0
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600022; x=1687192022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qaZpDDjPwlY2m7x6v9ar9hpPELeL8Q6hzaJ5d16jETI=;
 b=U2/mcl5/P+7RETzri4waiMyUilkBv7sfeUJDAQF/mdwr6jDCvTX1jwvGvtYEg+KctE
 DYUMOlvF0E9a+ifbbgo5CfvJvkRFDGhnnTE5lQZq0IDWDgSMhLrNyOI/FA/kcyDsW016
 f9YDA63+/UuJHRxMvYvUF2URHuEGGXQmSxJi//cvfrhDVKYbFNh6yAEWXj6IyQT5BuSH
 McEQnIWDL14nNfVPpoBA/JJKhrNcdMvNy8Gx53akC7aIhFFNJ13BlEwyTAOkWsPyLRMZ
 9ftWFpO2D227iLt56McjV/fdqbDUtjUCGYKwM8LEkMjsq+HiG4CANQSzFcwAB80yehlZ
 uG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600022; x=1687192022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qaZpDDjPwlY2m7x6v9ar9hpPELeL8Q6hzaJ5d16jETI=;
 b=Vvby1prHyV51PUGVb0k1UNHVPeW0qWSzfM1pb54JLH168g7r4gLriIoIPC94X1FjlC
 +6u3XnAfb3YBLbGKajHTTo3IGFYS24ZbJBzdmdyWDkEEaDCwQZl5U58lO2QsNOfnDmUt
 8h9/5dkO45t6DugX6pUNvxIDjTq9kGVKJrcij0ohTjuWq4Y2SylEOzn5OEI2xEkDeXX9
 k3wDokZTbwFgJdvdN9eX1pD1tL0A/9rLPJmA+teZMvID6TpVcAkse54fhiJYOCI6C27M
 ZwJrWV/NT4ohMfKJOtehzFyA1PX8dV+5TEWhUosNYbBaiYDfLnR0kruiFqGGJzW78ZOZ
 9Prw==
X-Gm-Message-State: AC+VfDxcKQcE+Vo1DOPfAbk3Qnq4kD24ayOiTzGnn51zCZhpMZmZpau+
 VWsl1eF0WwOWQi7SgLr3PJYifA==
X-Received: by 2002:a17:902:e74e:b0:1a9:a408:a52f with SMTP id
 p14-20020a170902e74e00b001a9a408a52fmr10584163plf.24.1684600021975; 
 Sat, 20 May 2023 09:27:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:27:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 18/27] target/s390x: Always use cpu_atomic_cmpxchgl_be_mmu in
 do_csst
Date: Sat, 20 May 2023 09:26:25 -0700
Message-Id: <20230520162634.3991009-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CiUs8Tpd4bB5

Eliminate the CONFIG_USER_ONLY specialization.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-s390x@nongnu.org
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/mem_helper.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b6cf24403c..bad789a742 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1798,13 +1798,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
             uint32_t ov;
 
             if (parallel) {
-#ifdef CONFIG_USER_ONLY
-                uint32_t *haddr = g2h(env_cpu(env), a1);
-                ov = qatomic_cmpxchg__nocheck(haddr, cv, nv);
-#else
-                MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mem_idx);
-                ov = cpu_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi, ra);
-#endif
+                ov = cpu_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi4, ra);
             } else {
                 ov = cpu_ldl_mmu(env, a1, oi4, ra);
                 cpu_stl_mmu(env, a1, (ov == cv ? nv : ov), oi4, ra);
-- 
2.34.1

