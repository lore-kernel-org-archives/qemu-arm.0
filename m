Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp179989njc;
        Thu, 18 Jul 2024 18:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVA9QabVpGTYhemrI4GOTKWLsu69+I/+zW+nQJnP55zoqodxmvkF5l+9GdIdtSlM/lKcb7PbcNI4elRoPBDO5kQcaeoXa20
X-Google-Smtp-Source: AGHT+IEiEO0RUTKrC+iudbahrCumXBJbu6zHuUvmz+dYSxD4c7XbY0CKq1l13d463F/a0gMEHW3S
X-Received: by 2002:ac8:590d:0:b0:447:ed6d:db79 with SMTP id d75a77b69052e-44f96819d34mr33131821cf.0.1721351311856;
        Thu, 18 Jul 2024 18:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351311; cv=none;
        d=google.com; s=arc-20160816;
        b=IX/olaGqYNH10BeGEAbXNWvImsDwjZa0fXfYbttIUBMS1Ra83D95zFWGTQKOgC1XNt
         kl/W5l+/RYM9562bjtA4XvJQEWTgq/C3moR3YQW4FdvP/zkRVqsA0OD6sHWsYwZW8Ino
         PCP7epDeApoFudkZ0t/psohG/GtlfMaloLCui8OLMq8/VGAknTJ+0EyBHR67C85fSquD
         ghu5OkMqj2kmQmT4eQ8BmcdDKrNj1pz1+r4HeFs/z5mE4aOcd+/7gfQmoNLOGoM9f6i3
         JTdw7XkPmgVGRpxJ03tWaEMpCSb8w8zXJ+p4jrCNI3FBKdnPeBhVGO9cRhPl+7gU8TBI
         jmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lffTC77hfuBCBlcm53ysSfFxUjHJ9OXDuax++3VtjJ0=;
        fh=qjFy40K+ZQaomz0djLvfgk0/gq57yB0/W8d5nzdAVZA=;
        b=Mt69DG0Ngk0MghyOJDLdehfU5HWHb6IeyasbdLI65YiMKAaGDl2dRN3mB19jqGt6Qk
         5kC4ijyCYwwLUIfcEiHK4Rz/gSmvC/uod4WenrGwya+j2lAW8qD8xv5UZ4fOpakZRIn+
         T0XdKc/US+qJfIBUpYKu5atN3t+FdwZeKBstCjB6yjEVSANjJaQkrIUqIM3uaoXjOYc0
         m/9WtSEkzlzLSEE9ocoYjKYS2cEbOm8/LG0ExEjqwBmpAtGqJKTRnsWOBKby9kZLmlXe
         enGaVQ7ZIPPkkvfekL19IljYcaxCMYxbR9rbJtyiXechNM1EhMSH6edsftjkPNc1+aDY
         9RkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gftxvehN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccf9063si4633001cf.150.2024.07.18.18.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gftxvehN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6R-0004On-7t; Thu, 18 Jul 2024 21:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5l-0002tH-UI
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:29 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5j-0000jL-QA
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1fc587361b6so14217105ad.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351242; x=1721956042; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lffTC77hfuBCBlcm53ysSfFxUjHJ9OXDuax++3VtjJ0=;
 b=gftxvehNrfN5FV6jZov2DcfkBumsBw37zrftGYDBZ1J8NhUQDznwtS41HFALXN/gCQ
 dG4V4vw52P+NKd/Za7IR1HG49ZqOBxeWpr9qlAXg+n3WMZ3GsCZlb9P86FNASAlVkws9
 zi+qUE9W4VIjV0qFao2npxR63DAFsS5TuMhYa/bTocAyAvIu/Dh+yTcLc1D8u/Wi3UGn
 buZXhtLWoDJeBR7ZfuLUSGFVrp2s7FTgtYjyQ6b5qvJ53WPB8G2cYuSKoUePB+4HW2lm
 NcBbnDLd8WisInBv5LpYXbuDFuv6MNFG+AKqTyikIusHhd2mgXT6EkT/yggj8O0CXWTj
 Znww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351242; x=1721956042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lffTC77hfuBCBlcm53ysSfFxUjHJ9OXDuax++3VtjJ0=;
 b=UzdVgdPMSAQkrPfqVvafZgxjfrpnudGqf26saaHEoxx/ysRavAHR6i64tyk1UbUph1
 vWzh+TNeADOBl9/KdujKAS+ttcq2otkz577XrSNv1WHid1hOS+jaj3eQPrOwDnhsZxf4
 Yk5kNao/ulK3EbVKEVjf5GNv58fxnOJ9B5vP6QZgA3H3CVlMCCMC05nu1G85ATMIsLz7
 cBm6doD41WlxbCMnrH8UJM/NY/IPVWW+SCOgUzb2C+8Y5lG+QzEJ4MFSVBppE3EqXWNg
 Gf0YgVAJXMz5kR/W3RePZujbgwZBDqXYVGx66UVZtU+MM+2c7Fq+zpniuQ41eMH8qXxQ
 XaHg==
X-Gm-Message-State: AOJu0YyUE9v19g+/UOmn3T+PyHy47wo/P+Q0y4c+BmScUl9QFqhZfgFC
 59q+rXCgUZaH/hgNs0LfxKr/9EtWgO9EhNvNWuO4pEANkpfPe3RKkTsBjwVAjqM=
X-Received: by 2002:a17:902:d506:b0:1fc:327a:1f48 with SMTP id
 d9443c01a7336-1fc4e1077a8mr63280235ad.12.1721351241529; 
 Thu, 18 Jul 2024 18:07:21 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 02/12] target/arm: Use set/clear_helper_retaddr in
 helper-a64.c
Date: Fri, 19 Jul 2024 11:06:57 +1000
Message-ID: <20240719010707.1319675-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: CuYsgtLiJI2R

Use these in helper_dc_dva and the FEAT_MOPS routines to
avoid a race condition with munmap in another thread.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 0ea8668ab4..c60d2a7ec9 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -928,6 +928,8 @@ uint32_t HELPER(sqrt_f16)(uint32_t a, void *fpstp)
 
 void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 {
+    uintptr_t ra = GETPC();
+
     /*
      * Implement DC ZVA, which zeroes a fixed-length block of memory.
      * Note that we do not implement the (architecturally mandated)
@@ -948,8 +950,6 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 
 #ifndef CONFIG_USER_ONLY
     if (unlikely(!mem)) {
-        uintptr_t ra = GETPC();
-
         /*
          * Trap if accessing an invalid page.  DC_ZVA requires that we supply
          * the original pointer for an invalid page.  But watchpoints require
@@ -971,7 +971,9 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
     }
 #endif
 
+    set_helper_retaddr(ra);
     memset(mem, 0, blocklen);
+    clear_helper_retaddr();
 }
 
 void HELPER(unaligned_access)(CPUARMState *env, uint64_t addr,
@@ -1120,7 +1122,9 @@ static uint64_t set_step(CPUARMState *env, uint64_t toaddr,
     }
 #endif
     /* Easy case: just memset the host memory */
+    set_helper_retaddr(ra);
     memset(mem, data, setsize);
+    clear_helper_retaddr();
     return setsize;
 }
 
@@ -1163,7 +1167,9 @@ static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
     }
 #endif
     /* Easy case: just memset the host memory */
+    set_helper_retaddr(ra);
     memset(mem, data, setsize);
+    clear_helper_retaddr();
     mte_mops_set_tags(env, toaddr, setsize, *mtedesc);
     return setsize;
 }
@@ -1497,7 +1503,9 @@ static uint64_t copy_step(CPUARMState *env, uint64_t toaddr, uint64_t fromaddr,
     }
 #endif
     /* Easy case: just memmove the host memory */
+    set_helper_retaddr(ra);
     memmove(wmem, rmem, copysize);
+    clear_helper_retaddr();
     return copysize;
 }
 
@@ -1572,7 +1580,9 @@ static uint64_t copy_step_rev(CPUARMState *env, uint64_t toaddr,
      * Easy case: just memmove the host memory. Note that wmem and
      * rmem here point to the *last* byte to copy.
      */
+    set_helper_retaddr(ra);
     memmove(wmem - (copysize - 1), rmem - (copysize - 1), copysize);
+    clear_helper_retaddr();
     return copysize;
 }
 
-- 
2.43.0

