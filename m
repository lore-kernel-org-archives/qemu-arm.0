Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp40520lfc;
        Tue, 2 Jun 2020 18:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpmEjcXpXWWWjZv2zjAwk0IQ61dhm2/y2Lqa9+3feQBLMUxHyDOkUO/yoHCxQlUjad4uB6
X-Received: by 2002:a25:2a42:: with SMTP id q63mr9941537ybq.360.1591147777608;
        Tue, 02 Jun 2020 18:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147777; cv=none;
        d=google.com; s=arc-20160816;
        b=xYXzatRAZnYNeI9aJCAimMFQjFev/vdgf2N0k3TQ2ZIp9gTWPJfAA/ECflejb/yzu7
         ktvbOtgsoMKJjHUy9INm4cHj5vKhNAG+wb8hMbGa4eLqrGCLAXQTVUP2Au47rCjXESHe
         /Ejgw3t0Q3wjGKj0Nl1hbjyc3R0c5Kr1A5h2brNWso+Rar3Q7lSW2xmzGifyVx9NXh/T
         3QMWs+7LLLccurzwrJKgcs3sXk45J/AbOZyBlUfdS4IiTJoi2xeLDZUlR59KDX/pryTB
         Ezpb2yZb7EoVboXoBorvzqz6gtA4DWLKvRJuNifDZyMr4ywv/G4CMQNA99XiA+leRv5y
         3yqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L5HmehI0u6Wl5CalJmhYTRnudOl8IyN54sr+tdgMFy8=;
        b=Xp7itqZfqKYSZdFIjTrryCurXF029KMjcC4JaauZX9EbmOm6wfp2VfxT1xIW6dZa47
         JtQhnrIs/Z3Z4zcVhj+dfbpVgFFuRnDJYhIsuJ6WTtXk1T5ipzXjZm5hRUeeg31R8zaz
         HOPHz9GgFKdQ8AZpg650zdaHQWm8D1eWflrZIkDhM4ec+hpy4V6qJW+UyEjiUREKklPn
         fwBmXtPZ3CT0Ep6SbWW4ajoQz6fHqhedhmaIuWxYeS+dYX6ItYu+7bV2nS0HVX1bTODw
         SnofLuzNNVKQTaOlNVnNtkdBSt+g4yHKoZSVAuqFM+mcg2PeuNj6OewqDGj+TlDaFnh/
         KKFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GQ5fwHhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si298436ybl.255.2020.06.02.18.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GQ5fwHhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIDp-0001XD-0D
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyq-00051w-CH
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:14:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyp-0003gZ-9V
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:14:08 -0400
Received: by mail-pg1-x529.google.com with SMTP id o8so541865pgm.7
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5HmehI0u6Wl5CalJmhYTRnudOl8IyN54sr+tdgMFy8=;
 b=GQ5fwHhfRmrfSQOiJOp+xitMa1bz0gG0vGhe8roDv+urgOknORAf0CBlXKE2xDBN/2
 ctgM53TJTuO+57u6u/KnPugD0jox3VSKKY798vuYy+GKSQz9lAM+d13vEba0ce1MXRaS
 L3mDKJezZ7ELO3jMVUC6jSU31XSO9edrSFAEzvwFczmAh1dRkCipTzPlnewuUbIN7rom
 30RTmE3+U3198xpc5f+PSWwZrGltaJcBXvUEkFvwmOQRK1Dc2rqZB/s9NOM+zr+XwNNa
 x0CX/vcqmfs/Yj9IO4Md/AOjWWZ9vg1Z5Baa7gPxtbIVmnLh7HzmPcMsnGr8uIg2KzYn
 +51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5HmehI0u6Wl5CalJmhYTRnudOl8IyN54sr+tdgMFy8=;
 b=WnHqgFUCVbRcy5FkUy3QGxdGS0hOh1VI2uLjELSz5hodnsH0wudbh5Xxr6e09MXI3t
 9P7Jnr1vCJylK5l8/0MIHlzw4O0NoCLGlpHk5SucUImE/nG5aAooERsXp9el44DXN2Xw
 KvBX9f1JpygfUDXLwTze3n42bt32uGzPtcc2KXbsY7ehcvGCRw+NBVTixDKZy+0dto43
 ZJaIy5C6Vt5GqB52s34PsAKw7dcj5DfWejLu7o4GLkxcEw8rLv4Ch3I4Pui+u8dky5uA
 S/9jv7XV+BWfKOQTj1AERLkhMYUvFBVyMDUtQ+n4407BycsML16WPp16OLGGJG/56oJw
 nNFA==
X-Gm-Message-State: AOAM530Uk6WZdhIvj2S3iAnb7NN7ldsKAcmwCpbTuumDtN84pE+9qRXm
 anvxrkBhX0yiK6msfhcuWd62Tg==
X-Received: by 2002:a62:7707:: with SMTP id s7mr28622157pfc.90.1591146845950; 
 Tue, 02 Jun 2020 18:14:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:14:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 36/42] target/arm: Complete TBI clearing for user-only for
 SVE
Date: Tue,  2 Jun 2020 18:13:11 -0700
Message-Id: <20200603011317.473934-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iV2VgWhFEa3H

There are a number of paths by which the TBI is still intact
for user-only in the SVE helpers.

Because we currently always set TBI for user-only, we do not
need to pass down the actual TBI setting from above, and we
can remove the top byte in the inner-most primitives, so that
none are forgotten.  Moreover, this keeps the "dirty" pointer
around at the higher levels, where we need it for any MTE checking.

Since the normal case, especially for user-only, goes through
RAM, this clearing merely adds two insns per page lookup, which
will be completely in the noise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2d2aa14b43..460a3e5937 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3966,14 +3966,16 @@ static void sve_##NAME##_host(void *vd, intptr_t reg_off, void *host)  \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    *(TYPEE *)(vd + H(reg_off)) = (TYPEM)TLB(env, addr, ra);                \
+    *(TYPEE *)(vd + H(reg_off)) =                                           \
+        (TYPEM)TLB(env, useronly_clean_ptr(addr), ra);	                    \
 }
 
 #define DO_ST_TLB(NAME, H, TYPEE, TYPEM, TLB) \
 static void sve_##NAME##_tlb(CPUARMState *env, void *vd, intptr_t reg_off,  \
                              target_ulong addr, uintptr_t ra)               \
 {                                                                           \
-    TLB(env, addr, (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                 \
+    TLB(env, useronly_clean_ptr(addr),                                      \
+        (TYPEM)*(TYPEE *)(vd + H(reg_off)), ra);                            \
 }
 
 #define DO_LD_PRIM_1(NAME, H, TE, TM)                   \
@@ -4091,6 +4093,19 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
     int flags;
 
     addr += mem_off;
+
+    /*
+     * User-only currently always issues with TBI.  See the comment
+     * above useronly_clean_ptr.  Usually we clean this top byte away
+     * during translation, but we can't do that for e.g. vector + imm
+     * addressing modes.
+     *
+     * We currently always enable TBI for user-only, and do not provide
+     * a way to turn it off.  So clean the pointer unconditionally here,
+     * rather than look it up here, or pass it down from above.
+     */
+    addr = useronly_clean_ptr(addr);
+
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
     info->flags = flags;
-- 
2.25.1

