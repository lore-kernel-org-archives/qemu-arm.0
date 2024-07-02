Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2262092njm;
        Tue, 2 Jul 2024 16:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWI/0jCWj8uJzlf/2VX1vDH9ZnWxsq8TQ1DSCE1LNSLTQn7RvngHmXmVxCwAgyzVjMMeyTjVDSFuLL+oHAHalbpQ0FCtv/v
X-Google-Smtp-Source: AGHT+IEZBvL1xglwVbJaqRO+WmBRkdsOKZpCgQtY+N/jdxOPFFqMg2l8AMguG9N55zMY6eOlDFOQ
X-Received: by 2002:a05:622a:14d2:b0:446:3c0b:c37d with SMTP id d75a77b69052e-44662e6a811mr142858101cf.44.1719963784154;
        Tue, 02 Jul 2024 16:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719963784; cv=none;
        d=google.com; s=arc-20160816;
        b=dGMKt6vb0LemnrvA84g8WkTZRGrkNt5TgXcqN6T2o3kMT2ohHSRv8BcaL3Tgixxulj
         Dcn8KykrNZF16GHbZ8ZMqbMDV3u8l8Kq58MSA8CM0AgAV45WrBPSv8mTEomBYfYN9gPh
         24WpstpOrZR09doHl+dZf/q+66/+KjRvm2WQz9qqrniVRSmcZ7Ly543t57s2UJrwT+bc
         onVfOMj9wHVpU6/SX/5T0QDXL6G2xzgJSMLthYDPaPBnZquWKSQhmbrefOPBvHM0zBgg
         RwsZNl91yIU1NMayiUl8zI4xsRo9PEv4fP48C+aLyiiVLH/VQMWlzoj9oZArqjfU08hS
         pPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GwtkDEQSe1rF7ol2hwOawpAhY63WerL1vNoE65OHhNw=;
        fh=Fz3OM3AGXo6S/XDNq12jK+U+cl8IKdGchX/2GB3YVy0=;
        b=doNIrTc969f2vwba4I61hku9YDdLW3cn9gBsQsgJHkJjN41XXY0cuXJpkQHnSzgtnZ
         ST36vq5/OQVNL1ZSsqIDhr0MbQFM+0TXOkVP3xr6G82tyzp4AgOyLL3rmT76UXmneL0I
         r51o3XL8AJMCS4o2TnULYdTXNwf1iB4ci2Y2V5vahYVD39fiRvBWcgVFj69DUadVm92d
         Zm1gPjYkO//8KFVG7IPvRvNQnXg15yHW10bAFj670ykoQ0+sJmg0sniPe4OZP2CoEyqj
         iS2LXWSvPJDkmgObxj1KlLbZ9Do9FqhaaLk73FUMSERx/DmYcSQC2iAg4a21xFHHKLli
         Ev+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ysXTxB4b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446512cc3a9si111534801cf.135.2024.07.02.16.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 16:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ysXTxB4b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOn8g-0007q0-0N; Tue, 02 Jul 2024 19:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOn8V-0007mc-Rp
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 19:42:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOn8L-0006N1-8d
 for qemu-devel@nongnu.org; Tue, 02 Jul 2024 19:42:11 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1f6a837e9a3so20790785ad.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2024 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719963719; x=1720568519; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwtkDEQSe1rF7ol2hwOawpAhY63WerL1vNoE65OHhNw=;
 b=ysXTxB4bkgw0sR27syT0Hz/gco+NJBS3zOKv0hTKunkISc6Qqa7PLnrq8eG8TDJfY+
 dYekmK0/u7GTpif7C1tIVRIC931mZ/8i/idZDPYDDZ06ox46+FE81hyjzsII79yeyXLw
 Z25lKm6Py1BHWyVRYwzYldXODh+rstujVWyYIBMggwgnKeLdzJK+EKfWCMNZYa4O39fT
 MNVfUgwCWdariqVwmhYugDZgfNPKi2g87joqnOi7L16OY5MNChx1ly+V+8trvoyeoieR
 4Se3lmdNpm51wNpP9SbyQSZvtiOr+ZLbuQ+5tf1G1zu2PKgNFPg+7WFbgiufAK+uTZlG
 miLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719963719; x=1720568519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwtkDEQSe1rF7ol2hwOawpAhY63WerL1vNoE65OHhNw=;
 b=KbZrGMjGGxStiRsssNJ3N0jldFDrpiZpEH8X6n21E0AhvYwGbbgbeaJysLoPEkvtFG
 tKaR1RhTzHylBTyxGWtxeGV5jirN0wz7hib10x6rtIXL2LFGcCOBhU8axoWun9OeH/m7
 6MIJf1yqVOr5CWeIAGhOYuouM5BXWaNDxBGC/OUODiti/TGCIkQWP9iShd6N1VIakfJ8
 UjZVhZhjl4A7NXLgX0W6MB2dnq7AQ7JnKgLZsaZZJA/YPPyAa0VImiblrBv1wEYXwzsA
 Z2JLKNZCwDtLp0rEJ79amXIKol6YRqjQL2lCwb0zpfDhfyj812pP2J8DecOgL1cfk9DX
 iq1Q==
X-Gm-Message-State: AOJu0YwoOQ8j0FPTVAVGvlVA5nuS2+p2D2hzNIvGc0MOt3aFVekP8ppE
 l326OXc7AmP+TmYviqT13DXfYuC5h0JLzoKFVwnHK9V7v4ZCUbYrZBOlzNFTquGfrDVxlpv0gvq
 4
X-Received: by 2002:a17:902:e54f:b0:1f7:1655:825c with SMTP id
 d9443c01a7336-1fadbca1794mr82220985ad.36.1719963718703; 
 Tue, 02 Jul 2024 16:41:58 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15993c5sm90403755ad.244.2024.07.02.16.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 16:41:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, iii@linux.ibm.com,
 david@redhat.com, balaton@eik.bme.hu
Subject: [PATCH 1/2] accel/tcg: Introduce memset_ra, memmove_ra
Date: Tue,  2 Jul 2024 16:41:54 -0700
Message-Id: <20240702234155.2106399-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702234155.2106399-1-richard.henderson@linaro.org>
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: b1H06X3r/cm7

Add wrappers that set and clear helper_retaddr around the
host memory operation.  This cannot fail for system mode,
but might raise SIGSEGV for user mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 40 ++++++++++++++++++++++++++++++++++++++++
 accel/tcg/user-exec.c   | 22 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 71009f84f5..baf4f9367d 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -379,4 +379,44 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
                         MMUAccessType access_type, int mmu_idx);
 #endif
 
+/**
+ * memset_ra:
+ * @p: host pointer
+ * @c: data
+ * @n: length
+ * @ra: unwind return address
+ *
+ * Like system memset(p,c,n), except manages @ra for the calling
+ * helper in the event of a signal.  To be used with the result
+ * of tlb_vaddr_to_host to resolve the host pointer.
+ */
+#ifdef CONFIG_USER_ONLY
+void *memset_ra(void *p, int c, size_t n, uintptr_t ra);
+#else
+static inline void *memset_ra(void *p, int c, size_t n, uintptr_t ra)
+{
+    return memset(p, c, n);
+}
+#endif
+
+/**
+ * memmove_ra:
+ * @d: host destination pointer
+ * @s: host source pointer
+ * @n: length
+ * @ra: unwind return address
+ *
+ * Like system memmove(d,s,n), except manages @ra for the calling
+ * helper in the event of a signal.  To be used with the result of
+ * tlb_vaddr_to_host to resolve the host pointer.
+ */
+#ifdef CONFIG_USER_ONLY
+void *memmove_ra(void *d, const void *s, size_t n, uintptr_t ra);
+#else
+static inline void *memmove_ra(void *d, const void *s, size_t n, uintptr_t ra)
+{
+    return memmove(d, s, n);
+}
+#endif
+
 #endif /* CPU_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 80d24540ed..a73da42e3a 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -1289,3 +1289,25 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
 #define DATA_SIZE 16
 #include "atomic_template.h"
 #endif
+
+void *memset_ra(void *p, int c, size_t n, uintptr_t ra)
+{
+    void *r;
+
+    set_helper_retaddr(ra);
+    r = memset(p, c, n);
+    clear_helper_retaddr();
+
+    return r;
+}
+
+void *memmove_ra(void *d, const void *s, size_t n, uintptr_t ra)
+{
+    void *r;
+
+    set_helper_retaddr(ra);
+    r = memmove(d, s, n);
+    clear_helper_retaddr();
+
+    return r;
+}
-- 
2.34.1

