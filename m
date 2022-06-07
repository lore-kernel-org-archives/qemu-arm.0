Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2429741lfb;
        Tue, 7 Jun 2022 14:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd3ejSW+jceJAPIvgdm6Gjs3Ksy7qA6GVKSqzNTltgJP1jGU8OfYdpDgYZbrdvPiSCahbt
X-Received: by 2002:a05:620a:d86:b0:6a6:5dc8:d34c with SMTP id q6-20020a05620a0d8600b006a65dc8d34cmr21060750qkl.269.1654637741152;
        Tue, 07 Jun 2022 14:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637741; cv=none;
        d=google.com; s=arc-20160816;
        b=rEJ9Ep3xOQk/wDHyC3fjUiJ7fQmd6CXyIUrWQinFV8NHc0/tf/XGtYtLbHPD9AmbJh
         l22IOG5liJ3d2HTq5sJ324PSY2NZYgHV7yQoCIijDOyQXqxNhBHyYYakwJmeZ2bRUHtz
         iE7q2rb3gX/GP2gMdX/ktzbbwgEGKCfi1opG0vEPaXvH81b/cs5r8WDDQXuD1CyU6Iu3
         WZS6YIqV0TFJHEslYIN2tWDVxru7NJxRFJG5DWhWfqDqoCBhdgmQ105J81t5TYWmjvB0
         0dwLwpoWJSHNzxcXLUL0ibecyuLM4nz9Cf2//Wyt8OoI20GFvhrIcOJicvtSmZuQsqBe
         HN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
        b=Oze9jjI045lSBax5jRr33goaGY3GSWThpASVsWMxayes+a01HaydySxGgMlRxDAup2
         YOmSV+Ze0KsqCib9N7gukVPvK1VTjjEMAeXG5raD7zSY9XD1rpss41TF17iLaPYpThyy
         STSPxUgPPiss1Fo7+kPJfphesikCKnoRKa3d55JQrzoBzo0DlI+m84sLsNUc6EwtN/1+
         It2nkuR4X9W5azo8CfXLXqZ38PY4k8wisvDk4m0AJSZ4eHbSOz6m12z7PW/o9SwpHSBj
         bHCMyDIMD03Vb9cb8BZnt2+FEjR4UQwNUoywad64jbK6Dn1g3EGEMYGCft+AYATZA41u
         9hXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aAdi6OLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05622a00c700b002f93a3c1c22si9492qtw.268.2022.06.07.14.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aAdi6OLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygrT-0005fn-Hc
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfws-00076l-AE
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwl-0008Jy-Oh
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:10 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so21880484pjl.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=aAdi6OLy5ihMNxfNDGO5IJIJCakxrBcB5R4b9BIwohKqVkxTl72/7P/hqgjBBA5RVK
 hUjbsulSvIggcZpz6qAjncqQSareUG28d/l2Qxe43ePoBoJgI5GFBTlzpWxNFcqYE1Ql
 uMfjC2lg+CKuHDiOhjHVY/Su2UOJ7Rx2GFVUaC2qK1TaupezCuf0iAuOjX4Z67Th+Nuu
 NhgzUmtUnlWdsgPDBccN0Kr/fLDA+3vKbZycsejsA9t3rrzKU4az3vub6YMbOMHBmewA
 US2A0zYsbyOtZnoX0Kj2mKg+6DGbA/YyRYvRUiNsJzI+QH3hptfAtD0tKtpeFDYiqgOj
 AV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=4qwXdtXKqtzQ/ed0qVZv35t+KpJvCjHS/r9FWJ8UmHAWP8AIqG2HyxrCAS5y2FPH6R
 p96/ELXr1W5v4KHwUuxBuwB2Kvlbmuf/vm43GqPqo76mbUKDlyrtXF1luPwcITSm4NqG
 7Kfam+sl61K8GqwP9qZV1G/gb5i94P2dWzW2AJmUOPGgTaTl7Ig0qT+Tl4D5FWAlUTQC
 E87aXvxsmuPUjta/mhEMJ9vQOa7VmRVNOJFnh1ld+jtJQoW+goAjmr5tvDi+I3nLRUKq
 7NS+ImFiE+vQVYqN4t66Oh+IyIP+ZsMkzp4HCty3EI7ymnUIGsfE9myyWhWyRwnU3uTy
 aqEA==
X-Gm-Message-State: AOAM532isupqDZG41Sh1F6p9VA17yjpwtRfNjrku3RD7en/yL+6TKj5L
 TFObw/rtGUnkxmsikAuTOFy1+Q==
X-Received: by 2002:a17:902:eb85:b0:167:987e:2686 with SMTP id
 q5-20020a170902eb8500b00167987e2686mr3781103plg.33.1654634222450; 
 Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 59/71] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Tue,  7 Jun 2022 13:32:54 -0700
Message-Id: <20220607203306.657998-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TpyC8oa3JzCQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1

