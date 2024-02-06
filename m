Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1530831ejb;
        Mon, 5 Feb 2024 19:06:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE77BDwRe9QevtEU2qg9+Bg7gueEl5kbMqpESrq800ncXHYCzoVOLwdxvCeVmRUKjjwHld
X-Received: by 2002:a05:6214:e45:b0:68c:6cc5:5159 with SMTP id o5-20020a0562140e4500b0068c6cc55159mr1404632qvc.2.1707188795851;
        Mon, 05 Feb 2024 19:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707188795; cv=none;
        d=google.com; s=arc-20160816;
        b=NMYKG6IfN6Zdh/17YuSxqxhzmv80iZW7HgHFKQEZcxmf0pjAYfN4fUkvhqsEI7/o16
         byfUWuCreS/icIHcFtKbX/kXFjCOhHb1lRWl16CK1tyjlFZAS2anYlei8GAfN2z9Ot1Z
         hajDh39l4AGVkULzVucbzozrZESTS4Rc0gNFapBPPci6aadi/LCpvSmcTKMSqkOuJcrl
         8+TYx6jddElX9MTFrFgdrxxaZsRRvJ2fZiHe1F4A6REn0rwCyZQ5tGWz1aVvPAN+/VZe
         nfvHjinc0uOrIvaGh19BEEFZ7dzevi/b9gBq8+mvs1G08cox2rRdOuaqg+9DUbmdUrh/
         Ygpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AqRQXC9e1yIrSAcLNE1gvR7WQ2p8XFPS+9BATHPSGv4=;
        fh=6oOBiSWdtOgp+PHZKu7ckf1uK4vs13jV7NOUU86Za+E=;
        b=l6MnttZUJWXuk9Pfe6H0bqJciVfBTSx3QkJH2Ih5I4a/uWVeOQKzJ0u28VclWbbFM6
         ovUKBirPNzxVmiqq4oRWgCnDY94Z727ZME/1U9b62t1DWeiU85H0YZYPAYQMa0/xnDQ7
         dwGmEGqO23lguHUD+ycZOplkjW4ym1ZpjrJlD6DRVBr0Z0RxXUB2Iab1xVLL9pjP81hG
         52Ckksk7ivM25lN0yN87UKJ70qNYNM40JZFgrpYz3bzjKEzyMQ8kJNLUwFdXdXvQ4+jH
         WyKUJYoCZaef8ifzb9aDjf3qe70QsCpxEYUO+RNF+zKTpDxaxeB77gj6pWQD4xntsFjQ
         Wt6A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAzSzR8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCU5drRbtGrllUbbnIQxsXXHp60/n26H5egO+XE4mxnD6jhmL2wwgkdm2WvJgxyKraZXJvv8cIMdD1HmjGT8hUJ7KWDnt3LA
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020a05621414ea00b0068caf67a43asi1113041qvw.204.2024.02.05.19.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 19:06:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAzSzR8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXBmU-0006uu-DS; Mon, 05 Feb 2024 22:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmS-0006sn-Tr
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:52 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmQ-0003EI-3l
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:52 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6daf694b439so395017b3a.1
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 19:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707188738; x=1707793538; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqRQXC9e1yIrSAcLNE1gvR7WQ2p8XFPS+9BATHPSGv4=;
 b=mAzSzR8QPg97G3Y+N95tjnHJQoY6EiI1KX3esKCT+y0QBXkrnlKRYMPMhdB0IIdfAF
 Hp57b1zl0L7hmkW1Ebt/npDOvkY8YCjgub391hHdoejbk1WQNTrkZVFwxwGUKG4sGwYd
 0V1vEb+ZRdPbvNxW7qRzbyOYqF/3ZaoeaWPpaLM9AcFcTAmeI+xGkxvCDMshLmLCrFEY
 cXPNWDK0Ob/B0C0Ris2ziipU5qxFkipeDLLmTKE2zeOzhvSZUEjSzJx7xmbSpqVyZbx2
 lJubaBamTsVNu0eu+CQxhfepSoA4xhXjr4s3+CYBb5l2K4xWmVpPUKu6ph4J43SsLlWP
 TN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707188738; x=1707793538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqRQXC9e1yIrSAcLNE1gvR7WQ2p8XFPS+9BATHPSGv4=;
 b=srWDqqBcQ7+Fm4I2PYi0HPdh4aJyjgJ+H52Tn6nOUIy1qn9GGGedT4rNjG9da/ax2U
 2rUgSWcXzqQv5NSvbH/A7ePllzt9GY0sGhvw5Xd15IzFEFLlYolthmuHK8f7uljGpxPz
 ibeORUL1cbJUDQTu9VMKH1LtCEaUdNpXHQmubb8os2wBZb07+1OLlEfrK2Na7YP96pVg
 bkzd5aEcZthC1mJMX62xIcYyb5+NLPeq4D8+X20OdplLqNjWFprPH4bTzlO+JqX1zMYJ
 lYk4KhB96LQApjnHhUpyfJiCfjhr3Ynn24TcoAHr2f3riHoBmhn4xqcqvluOfKXqD/ob
 hMlw==
X-Gm-Message-State: AOJu0YyuP238zMQ8IGxu0qDWwUsfh+zD7vqayyxDSowmveCKKDwzs0yO
 /nHtairDhRi7NJY5IZviGfGCXJpoGpzyd8mMnjqJXqS0jNnYPoMKZ7FI5o6kvBA=
X-Received: by 2002:a05:6a20:939d:b0:19c:9ea1:692b with SMTP id
 x29-20020a056a20939d00b0019c9ea1692bmr524716pzh.10.1707188738443; 
 Mon, 05 Feb 2024 19:05:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVyt1Y3IExw8JrgxPhbkw35x8dsDv1Uy4dNgqfJFktsplP9lQgtfPlq/HuYzf3kwqc2Ng3pGZnDPwdvDWOSkM9dm3tmj5z/eUo0JWCUxSaidEMIULQJMsUa3iwGy8ujQowH
Received: from stoup.. ([43.252.112.200]) by smtp.gmail.com with ESMTPSA id
 r14-20020a62e40e000000b006e025030700sm627478pfh.190.2024.02.05.19.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:05:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v2 2/6] target/arm: Fix nregs computation in do_ld_zpa
Date: Tue,  6 Feb 2024 13:05:23 +1000
Message-Id: <20240206030527.169147-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206030527.169147-1-richard.henderson@linaro.org>
References: <20240206030527.169147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: 5YmeKHJtjxJI

The field is encoded as [0-3], which is convenient for
indexing our array of function pointers, but the true
value is [1-4].  Adjust before calling do_mem_zpa.

Add an assert, and move the comment re passing ZT to
the helper back next to the relevant code.

Cc: qemu-stable@nongnu.org
Fixes: 206adacfb8d ("target/arm: Add mte helpers for sve scalar + int loads")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 296e7d1ce2..f50a426c98 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4445,11 +4445,7 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     TCGv_ptr t_pg;
     int desc = 0;
 
-    /*
-     * For e.g. LD4, there are not enough arguments to pass all 4
-     * registers as pointers, so encode the regno into the data field.
-     * For consistency, do this even for LD1.
-     */
+    assert(mte_n >= 1 && mte_n <= 4);
     if (s->mte_active[0]) {
         int msz = dtype_msz(dtype);
 
@@ -4463,6 +4459,11 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         addr = clean_data_tbi(s, addr);
     }
 
+    /*
+     * For e.g. LD4, there are not enough arguments to pass all 4
+     * registers as pointers, so encode the regno into the data field.
+     * For consistency, do this even for LD1.
+     */
     desc = simd_desc(vsz, vsz, zt | desc);
     t_pg = tcg_temp_new_ptr();
 
@@ -4600,7 +4601,7 @@ static void do_ld_zpa(DisasContext *s, int zt, int pg,
      * accessible via the instruction encoding.
      */
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, dtype, nreg, false, fn);
+    do_mem_zpa(s, zt, pg, addr, dtype, nreg + 1, false, fn);
 }
 
 static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
-- 
2.34.1

