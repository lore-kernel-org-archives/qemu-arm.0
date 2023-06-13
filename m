Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp535914ejb;
        Tue, 13 Jun 2023 06:35:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5N2IY4SuPiVQPWLcywzJDhnxLvEssPR8FOQBx2oxKY+OZtZHJwxRXtUB8vYqCjTCgCJi55
X-Received: by 2002:a05:6358:c122:b0:127:f810:a78a with SMTP id fh34-20020a056358c12200b00127f810a78amr5967865rwb.20.1686663350963;
        Tue, 13 Jun 2023 06:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686663350; cv=none;
        d=google.com; s=arc-20160816;
        b=hdyg+D8Bep1OsHiAIddw9SYZ0S0VtSmZ7BgjnOxxna61RQZyoHjQ2VBt8L6y9GQ50s
         9JfcwnkcVLdS2JTmgweSeHpzRvvcnsFhtMWkDfi1njEdRck5x3PCA+/UTCLsE0HGD5dt
         FUoORMdRtoMNnHauFBV97+r/5RQ0WgYdBqWD8EOfEW8rEhgTXVzCpYmHKzawRvppFSq/
         jjczWt6N2JfKeic79zqdwf3MF7BcxXCHdrL4uSl7HhzRqEmLzXYcsmZL1J1bz5+Jiv7k
         S7aMPYwkqrklC1KIcMU5cAXrMVXGhoue85vMVOYOUfLsSjrXkMEn8z2Cag7KrbL+CHtE
         PqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3Tb5v+lWJ9rEaZ4+W83mDQQpTQklHgjD+Pw7euu9oDg=;
        b=mp+27ZxW7+BJF9AEc811yUd/JDBzvaTgbwX9A1hsjV1O+tUFV2zdeOAmrAKoc0nOS6
         GSRsR64I3yVUfhxq06xr10E6pGDtp7L3DK28oZuJxPRGtnKOHe5k/OSNKFOPNPLYbe2Y
         uQQea8I/CM6xk1hVutjoMbDN6qrkXSwr+g2vK+9qMAh2AGhG6kQKHj+bkIwmzIsHBrzK
         hLXz4qsu1/XAhUuOlu8AM2zkqjXFYSvtoZPO94lSiBJp0zPJ1NhmANlJPpEpEjunXjPo
         y0hiu+h7V4RXU4GLdQq3gPTxfKvPsksmJVTKxfH9xwpIkbakNU1xlrzPDI3dBWMG6Nn9
         70xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JBigAMzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020ac85b13000000b003f4de49bbe2si744873qtw.382.2023.06.13.06.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 06:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JBigAMzy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q94Aj-0006mx-EI; Tue, 13 Jun 2023 09:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Ai-0006jF-9e
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:34:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Ag-00026A-5K
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:34:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so811169466b.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663293; x=1689255293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Tb5v+lWJ9rEaZ4+W83mDQQpTQklHgjD+Pw7euu9oDg=;
 b=JBigAMzyWSWYE5PtdiDjqzMLzI0cRipqVI40HGyZ4/YkbvjM88Yd1SHnEIoKYOVb3T
 tSUdtey/yVoM7GwjISgn7Lxbp7KcuU2lClpJOQ5KaupQstA7l2tHmS9W2hcCC1ZvzaGj
 2xV13Zi+fgV0J0Wrbtqz0qjjWauma6y2z8+BX1FCO+eKj3oW8tzuNTFavmAvTDumsvdD
 EaHFDvMQIlLg1flwo0aHw5jy1s92+jGrjjesjYpxlyQvTOoWVXTMKArYPhX+x8p3FzuE
 CWC+/e1OPxpdAN6oNYtHo/0o5G8bRmk761HUreAEL8lNhZvXFS2/6tAFeKsBiAl8N3f7
 5XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663293; x=1689255293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Tb5v+lWJ9rEaZ4+W83mDQQpTQklHgjD+Pw7euu9oDg=;
 b=Th3jti30DcW1s3JSlxBiD0cfqn7FQWSHsHRO3mpxQS6wLhcIASmV6KBLqsIHOb4GxN
 juGKodxop+9OIiOEyiBfyclTF5ETqS4gbaFUhdCik2z1gzB4NnkIahiHPZ+iEKsT269u
 4fURHxraKhX7wVAJOr6xw95DjoR2AU2ReL6eOT0SxytvfLY+IAQ2ACvppjZgr6mPzGpk
 5/Hi/tlQs/P8LGP17HuBL2tpdYEbK52Qo9mZCxgNhSMiGzQWzES6Rvn/8wf2QEGpV9zF
 iJ9kAjxoiQw4xAsic+Gkx+0hIRetlneEWAs1YXQW6lS5V9jEltQmUCtEt4uXXONx4MF6
 B0rg==
X-Gm-Message-State: AC+VfDyfRZ1uF8TYtXPToJs5gJiPgHhum48pzFC5phusVrUcncOOtWxw
 qSsySnGpo7LAfhHxTcOckLLiKA==
X-Received: by 2002:a17:907:78c:b0:96a:ee54:9f20 with SMTP id
 xd12-20020a170907078c00b0096aee549f20mr11508239ejb.37.1686663292728; 
 Tue, 13 Jun 2023 06:34:52 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709066d5500b00978897577c6sm6624320ejt.44.2023.06.13.06.34.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:34:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/9] target/i386: Simplify i386_tr_init_disas_context()
Date: Tue, 13 Jun 2023 15:33:39 +0200
Message-Id: <20230613133347.82210-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FrgylHyDIAoF

Since cpu_mmu_index() is well-defined for user-only,
we can remove the surrounding #ifdef'ry entirely.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5cf14311a6..08c4cab73f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6914,10 +6914,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cc_op_dirty = false;
     dc->popl_esp_hack = 0;
     /* select memory access functions */
-    dc->mem_index = 0;
-#ifdef CONFIG_SOFTMMU
     dc->mem_index = cpu_mmu_index(env, false);
-#endif
     dc->cpuid_features = env->features[FEAT_1_EDX];
     dc->cpuid_ext_features = env->features[FEAT_1_ECX];
     dc->cpuid_ext2_features = env->features[FEAT_8000_0001_EDX];
-- 
2.38.1

