Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1036367ejc;
        Mon, 22 Aug 2022 10:15:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4vamY0wcWhWWO/a6PXayfoB/LaEGyv10OrM7ZKcu2/4aOyMzxJmYB8mTSApcxL/+QrJ6Qj
X-Received: by 2002:ad4:5227:0:b0:496:6b98:eb8e with SMTP id r7-20020ad45227000000b004966b98eb8emr16581435qvq.7.1661188542072;
        Mon, 22 Aug 2022 10:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661188542; cv=none;
        d=google.com; s=arc-20160816;
        b=e/CYZqE+5JE7z3b+CMzALuvP7tawgsr23JKwPh85VLB8RHVrflBHDaZ/kDXBriqI3J
         ObZv3AVkeZCQJFkbCdeXKDPFILO9/RMipBSMI6GKO1xBgBxU8j1ahPpm3RGHYLWwcWwC
         0pJPI45cx873L05YQf9ZDBiUaCDBM8uGDb8/Mrg8FJE0XQ/5wyVav3eKO5lU17bi9Gwj
         mcuyfEJqTd2IAtPWDBxBScHikUcXpMpJeQZrY3Ff6+sBVJLXavRRb6kW5XXA9z6nZYsp
         ed9I7OJHmwnCn26hHX9/gRconHeT3mVsliX+++FPZXhGQFi1e8i63pUEDp7R5y94DIaa
         SQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
        b=E7tCk7oSakXJwqyUDvhogTv9NpbDc3CF0CVQBVDrCdNenx1sfjFqIQ62yW+ahgQZ22
         2XPothVJtrE3HR/NWrrZ2MoASAU1n8HQ4d/77Q5Dv6ZbNoV4E7K1vqhxpR7EO4jz1MvS
         6hHg/VGr/PpYFYHdyb6o6WujIZBeHuZlpHKZhSpUnYdpMc0OJDmCyhCCf5B+ImsIKLVv
         KJRqaQmbBoy+3xmVzBnkkydPjyfxVeZZ1wpjgmNVw5wMK3tvYlKbzleniT8mCvfJJa21
         /bUStb9hV3ZWzWW0mzJ93q+UAyggSVO4GgEmLrejnB9ihiULQLnWTJnxHqeMWWA1xghy
         HlBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GP2UHDeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm12-20020a05622a250c00b0034301116dcasi4727219qtb.114.2022.08.22.10.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GP2UHDeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQB1Z-0003Am-HX
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Og-0004dV-Vc
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oe-0001bb-1w
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso11662640pjj.4
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=GP2UHDeqVxGGLUq+DQ0rv8QWikrXA3M84uvtu5h5jcN9Rq27Ret1xxxCYCsGmfYM1z
 HmJCmxyU0d+/c8gDhbRrm4BlnOR2YsdqTW4Taz2Ha6Y6e4NoqIa/nunD3mQWaQMCXf++
 T1CRNhbq3mVZPFSGaAK7kh1Lm0xntsxldY1tmzurA7gOoYFR7npvApfscIoGDjWxGLnW
 pkHl2KerNDJNGtN1dYP+9nRknQa774glW1omwoIvQafkOnE+Ik2eX3JiRcrF1e9PVVjB
 DU1cuyq9i3EI72bLNR/PG0sdQg5+fLw8CEuIJ36Ur/WXwvDyt+Uy1oCQQZO/bU43oDGz
 MMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=r4H4HnEiSxTxAlAThlvxpc1/hTtjoxViMjX5cu96gGHA1S+gF3ayERsjaisCtiwtWU
 057i1hIldz3vmk3pttpxSf1hCD1s/wbi5xiaPLnZKhifn3xrmYcbNfmbvzG/gUfkp4cm
 D/sVVmNmD6fZ22KMkgTwnGevEW2M/o8Nyq4u5MI00ybfIf+x91eQN4x70hTcdl9X7awI
 9veDjTLlFCys4WteuWQUHe5nUL2wCpwMwKXm5viRDjPGxF0MhdUI5fqKHyCxLw0A6qaM
 /VAttagW8h3JvWHt9Nv5kYstPkx2QaV+lrCexAcM5/xBKVhuQf7TyMGSeh6Rg4Q29OX1
 AItQ==
X-Gm-Message-State: ACgBeo3N4vffzmGLjPOeuJqPnjwKx0XiAZe4+Kn+W06lo4lL+ktRxu7I
 tQs3bg2wM5yYJzRwReK3DsLHWgLj9z/4uw==
X-Received: by 2002:a17:902:c086:b0:172:c7cd:bab0 with SMTP id
 j6-20020a170902c08600b00172c7cdbab0mr14512682pld.60.1661182282774; 
 Mon, 22 Aug 2022 08:31:22 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 44/66] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 22 Aug 2022 08:27:19 -0700
Message-Id: <20220822152741.1617527-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ztCXrcvI3Hk

Copy attrs and sharability, into the TLB.  This will eventually
be used by S1_ptw_translate to report stage1 translation failures,
and by do_ats_write to fill in PAR_EL1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  | 8 ++++++++
 target/arm/tlb_helper.c | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 08681828ac..118ca0e5c0 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,14 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+
+/*
+ * Cache the attrs and sharability fields from the page table entry.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA  \
+     uint8_t pte_attrs;           \
+     uint8_t shareability;
+
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 49601394ec..353edbeb1d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             arm_tlb_mte_tagged(&res.f.attrs) = true;
         }
 
+        res.f.pte_attrs = res.cacheattrs.attrs;
+        res.f.shareability = res.cacheattrs.shareability;
+
         tlb_set_page_full(cs, mmu_idx, address, &res.f);
         return true;
     } else if (probe) {
-- 
2.34.1

