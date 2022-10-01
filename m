Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp470260ocs;
        Sat, 1 Oct 2022 09:54:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+YjFAHjmD9ARXNj67EgFWL87nW1Lkq4gq/OpHwse7tYli2gv9kQY2Pl2KUt6n/p9h8IID
X-Received: by 2002:a05:622a:409:b0:35d:5a1e:888d with SMTP id n9-20020a05622a040900b0035d5a1e888dmr11346044qtx.561.1664643252121;
        Sat, 01 Oct 2022 09:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664643252; cv=none;
        d=google.com; s=arc-20160816;
        b=Yp19a3Nk0nGUJj4RwQCsl4bQPjgWjbhLj3k9kYOai3Zcsn0wfdmPMH7eck8MEhL8AH
         LjzpMaNfYYYgpEyrMkH2S65wQrG0V3PBS3rMgUzl5c+1ifARTgPeP3UQ0Myoz1Cq6OXB
         6bu+gfxyR/e6/K2RTFCMeviql2XXBF1sC17Lyy/Vnhtozxd5EMhWA1N1ZEWR9Nhpe0ji
         es2XqF52CHq7qpGFUlJ3/VDL+xn2R2EBpad4sNkY1BE7a0EOgiR9FCKLXpPzeI7Ug71U
         RIhk4ttK9rtcoQzbZ4SK1Ts5CKs+ScreTLigcoibl+PA6+eu04tvpvac6GKhO87XAl/D
         WWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
        b=ZDXFtkNH9HpBlow2px4sN9iY3nXjtEYbvDq340PdN5Ny6DhE+vrtFhqq6EUc3Df1Gx
         jj4URgNchJ7pbEPyFU0ee2Za4SIePfh9b7CRTc3dslw5iM/0MqpwXlDdJdmFe93ls2oo
         22u3OD4MGUfbsmR9gSkFVLUfvvY3wlzhlRdnWirjRKF1f6O0e3/W/+xzmkDXnL4iThk/
         VbTCwJR7sAsBT3mdlipS4BbzNRLey0volhdb0n+QXk/27jv1c0FzitFnVjjuhDEElkXD
         5lBECa/T9QUYDyf7hG5o9giHH55CFwSKu2TN7y2VvBd9R6QEjI8raFPgxpGApTZcp7Hh
         q5rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4GNfkah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br39-20020a05620a462700b006cf50d02e78si3024067qkb.210.2022.10.01.09.54.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4GNfkah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefkh-0001F3-O0
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHt-0007XP-SH
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:25 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHj-0006Iw-1u
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:25 -0400
Received: by mail-qk1-x735.google.com with SMTP id k12so4536102qkj.8
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=V4GNfkahZI+n5FLCJ4JJehf9MHqoVFM1H9B45TSFxJpg3iKrJbqbHDfB82xbHbMGum
 EMF1JAFBNg0cg887Scb5FhQNohpUyXzBSzFRJG33GoYOqOlTCZLVjp0Y9lmFqiaur03C
 fqOCJiKMB0U9N8hBS74hz87DBz789ujSSr3NFSoPQXmh/00DBt2PY8+RuAqm8FMy8D+a
 ft6JTaFlAdwaeScjjeR01Rxq7uQDOaSJuXltWP9Bh5IjqpXaTcD6PdJ4kUKMokgMg38U
 Faiq0u+O6maan2RGqn5rAfvgeeztPTouWsg1QX6aPE2Si+q7KuMXM9zJvtvQWDetUKA0
 c6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ue9Nl0D44aZHstGkTsjwRG+rtSs9n3MbvqWOGp6wdbM=;
 b=IU8Cz5Ti0wisDhlxXiRp31Yz1/jKn4QmFw4tXwtbebUKweKljF39xf3IwpUOjmkWGF
 FihEo9H+b/2Qv0uoMnbwET9mfwzdTZwRtyAjqniWF9US32Sd4DtAbFxYhvnGdRhHi1zl
 0dttxNGvRpoz/ieYOVvznO6BAzFKBebxv35kjyZ5xvBqx+rEhvYOgINftknypxNM5tWH
 4oHZV7xjc5EKYe4eGhs13g2Ss0mkoVNldHyw/9BbWQXhiMRGf19xjALeCQIm2a7msuNp
 yOOuvlmnPuAzYoxuw3gSVq+bZh+Xji+4ETDi4Llb+nqAxTyTrHW060Z7vuZg7O8YSzyR
 4ZuA==
X-Gm-Message-State: ACrzQf03obBPkIQckCVuWr7Ci9yCJCIc4gmgqz9tl1hT3wvUaL86Ndnv
 KP9b44QfEcWT4vcfiQKauTKGtg==
X-Received: by 2002:a37:c443:0:b0:6ce:191a:bb60 with SMTP id
 h3-20020a37c443000000b006ce191abb60mr9578844qkm.53.1664641454395; 
 Sat, 01 Oct 2022 09:24:14 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 21/42] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Sat,  1 Oct 2022 09:22:57 -0700
Message-Id: <20221001162318.153420-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1WakF2eo2U33

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

