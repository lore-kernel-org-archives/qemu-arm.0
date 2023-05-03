Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2661161ejm;
        Wed, 3 May 2023 00:29:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4f9sGyiqeC75zhUmChtGc2iTi2oI3jeQTNzhVy4k8nkHHW34Q8E3Q9ICbQTdCgIR2tAcK2
X-Received: by 2002:a05:6214:246a:b0:5ef:59d1:8d14 with SMTP id im10-20020a056214246a00b005ef59d18d14mr9352513qvb.2.1683098954517;
        Wed, 03 May 2023 00:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098954; cv=none;
        d=google.com; s=arc-20160816;
        b=DmhonT8ACnraqGRN02CeRbzAMGfvKfhIBBWmenLNE2g9hrS4dGkigBXV4CSLkbiGPs
         +Q800bNgGgkQXRnb+tKo83Kddszjs1RnqsmJ08+i6s34tBw8mQfRPalQX2sn/TXNL+Yo
         KcN9KvcEE6HKHaEez4sDanPW87KR/VxqErtsjnMA8v9kfw8PUxoHzHF7fOxy8c+Ds9iK
         XZp6yeZSba3e+aTv8shPyn2oAaPoGYkJOGl43Cz9J6r7998KMNbeZa68TrEb4OC2FsBn
         7ktmht2i0s0YiNGGsUjciVBeoIYFzHlJsyrczM/4EjOUfn7oreWMFSXTi/I+CPE2Kmq9
         fSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
        b=ckF9O4cw38AIsaL9AIo8NlgOStO9Ner0HNTdWx3al6cgMreplttMYW5nLWTXN9N3Xe
         j29j3BS6YjNsjDpz/m0qi0KvjxYyhdR79dvVjeLXOiSAwLDDHBTEWpMz/gZQtSyKH0li
         iTUWT1RAdC0J+tWW5rcslpbTWTw5cfXZAlnYF5Ofpax4UI/+bcf6pJdpZ/kJwHir1z6u
         tnmFYEQ7ffoTxwGPnXRVFZHxByoHPwBkk5XrCLHde5TTv7Ne8cl55HtpJwVYyHTmNpCE
         1b0CN/wf6F3EeCSlft5fqUIHfRd0fIfPmI9C8X18rOxTcsRjEeGTXmRkFHm09Z0tmedj
         8jwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEoYu6rg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc30-20020a056214411e00b0060651039cb4si15303138qvb.586.2023.05.03.00.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEoYu6rg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bh-0004QQ-0O; Wed, 03 May 2023 03:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ag-0007yH-EO
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a9-0005nR-0K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso29995625e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=xEoYu6rgIF7QNrJmJ6vMWfNALnwaHb784XkbcKgFVKWar4VcaTkyqJO7HDyqCp704+
 +1F0oSztq27LXj7ABPJe0yI5iyWbCuWU8Xj5RpO3wlNf8PJYEx0CakmSFxzKqJlo/aSL
 Uxl73qkemxXGHMK92BUu0J4Z7vXmH0Z3t1jCW6DlUvYdLHN33k7/LKoowx5dBZbXls+Y
 1Gi1+ziQVU6YVFOVwrU58MOoMAVSaZS1lRtKNkusbPHTatWlATqRBPci1nb1uyhntYml
 K1SGwBeohpbaezcj5HOFgKohSQnNmPgp/1LV/Gl3NXpWSGrrDS9Y0iLQQj/KcfQy99Kq
 Dd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097639; x=1685689639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBFIqUFc75JDtrlEORyx+gi0WPPCYnPmt/oOy5jLScI=;
 b=hpaPuteTxNFgceXsx8D6qQbbzRzEeFvMBEh0RHO31aYga63MNBkqSL9KgzLA+4tm9P
 GbA6HWzKTD8xyOp3pKn9pNwmjMHcZOj3MznoCdv980zdAxikJpF26znwj99yElnnJU2W
 Wsr1jSd03ftVfQkPJ4HUzInMn1uZEnxcA8YQxIaybt8G/Solty7JsBs1+L0j29NapF6M
 JyJWh6W0J5R31ulY2ARcuLPw6QYxVornWo7ZwyphCPoKBtQo1Wv06FHcnVpFx1KHtOUe
 vQGXc4tPVo1RRCY3RldRY/uWoK5Zo1kTif78ksdxXi3Xh0AkN3qjPLbjUyBP6ZmeX+uc
 SpwA==
X-Gm-Message-State: AC+VfDzPItw4bq7cflBkSNGD9iizJ1H6fOEXNVJIMXIyzUtpipvB/lag
 h3YageTc0YJMlobFYPFAsAjXxdalcE6TofCfauE8OA==
X-Received: by 2002:a1c:4b1a:0:b0:3f3:195b:d17c with SMTP id
 y26-20020a1c4b1a000000b003f3195bd17cmr13898157wma.24.1683097639427; 
 Wed, 03 May 2023 00:07:19 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 29/57] tcg/s390x: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:28 +0100
Message-Id: <20230503070656.1746170-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: E8sjGkCrpy0q

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 968977be98..de8aed5f77 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1679,7 +1679,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_TMP0 }
 };
@@ -1716,34 +1715,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
-    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
-                                                 : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1

