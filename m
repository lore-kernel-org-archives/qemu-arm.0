Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1265391lfk;
        Sun, 17 Apr 2022 10:45:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCny0PwIGE3uHIdqkCEU+rKN6w0pNLL+NieJ6T2BTXhyYjmLgkJkNWZ1ycugU5AHuQssEM
X-Received: by 2002:a05:6214:260e:b0:446:4518:7445 with SMTP id gu14-20020a056214260e00b0044645187445mr5430103qvb.101.1650217511178;
        Sun, 17 Apr 2022 10:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650217511; cv=none;
        d=google.com; s=arc-20160816;
        b=sZSPeaLkGmhnrXHb6Ej3fiacr0SE+UmHUNWrfzvdEmyAmjmM81EDEAj5Z4utEJm+Vw
         +/+fYHnw5U68uNP02k7J68pw03mRWR0m6BM87gHzY80ijXkkfZv2mjNseLQycKa+DM1M
         SUoPPhtZoGfXW6wfaiS3uMlT4WJMbT95canDll5A5ihARLS03p/v6q0x8d3nxAZUh4q0
         n4jghXFFLB0zKoeWAgy8Tta2CbNPj8d9J8tFAoANgHMPXHbV5bNuBcMQoBJQv927fB6J
         7l5o90nhpOIL129ok+BwraJrsrbDb3juGYrHSvhXLoJrZEb67DdhvyHtkT4wuwIVuxxf
         Kcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KMJqWCFFQ/5jg8W4iYwme8tmF7Vde2zNGH6ujSmTVXA=;
        b=y+Iucp+upHznQ0FMZhuo4Jt8MJyYMvh7a9jTFb8pvhy7O9GRDbgSmPRqrNyvS1Jb6t
         XPWrL/RhgGe4/mKcpluVdoRViS7MSJMl9Jc5Pq6CsrbTZDEUU4HAlnXppQvSShknNhZ7
         Mt2jdwDVa7cclcGvIJWAi2Hr+GWWe99Dw4cSOrDYAKkwCQf8nSOOnyH7hps/F61tTTyM
         /vOKyxU8v99Oy7hhYzDWlKeFG9c0Prz/qnub4AOOnU4rKXIr9eoDoMDakaqhfUCbVV7R
         UjdqwPYhacoYlQFJkYauf10ukjVrabZ5N+OQ+mhkfWuXzmuSFBUhNJ0CTHfO3dVAHonx
         Z8DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E/DaA9Jz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020ac87ecf000000b002ebce4e076asi2200188qtj.204.2022.04.17.10.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E/DaA9Jz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng8xR-0000fW-Va
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8ws-0000dk-Ty
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:35 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wq-0003E6-Kz
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:34 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s137so14959316pgs.5
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMJqWCFFQ/5jg8W4iYwme8tmF7Vde2zNGH6ujSmTVXA=;
 b=E/DaA9JzIYarK2hn6C1lG8rNsmjSrAw+ocrr0LWL51dOfsELU+1qvo5RgJIot+fiuj
 KHYJtb1F6HI4u4ovM0HqOpymS0h8wIAo5Rbrvm2X5p75VSAC6u/1Ondk9ZSV5ktdF90N
 UzZxhIN7fnvViDvRsHMtvM+p8g1Iej1WCErU2dAZdhrSnYJWJR8skVmWRAhwFbxp2sJr
 dEWCyN807QKZFm+l1GUeruZL8Nat1I1rmMqSfo1wDoiF/vtLuwjZAzeTRIuipAOZydCK
 znrQ/aP8t+tb1qZCBVeVCGAg1dhfpw/kbntQcJUHZBhBQqJpl2R2tkSUOZUY8ut1fmZR
 Md3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMJqWCFFQ/5jg8W4iYwme8tmF7Vde2zNGH6ujSmTVXA=;
 b=JoPsmpXOZjm3k2BFHS1G2WqxMRwBZZQ4O32nfQd68hJoc8XwpKJP7Qdg0SB0tBlWVq
 g49ZrfHF0ZNzE2tnBhVzW1fXJz7qDUBy5JV8ILcuHk3qmmfy4+yA3+K2L9uo1DhU9RdW
 L8TdUNW8ZDB++xpseuHylCrZVyVXS9ILT061QLRwKzaoxrSt4ZuLJ5R3KzVL2gb0vhUr
 eyMB7+cB33J+gkvVkfe42JyNG6324YTXmkPu/xiw4BSGd1cM/gVaTknQo9uWMreibiZ6
 Evkgn3el3mQLBcAlczV19aM2b2RSwDmfym2O/PoLMRoePsQtHjVjt4utsKe7cZguC96Z
 ClAw==
X-Gm-Message-State: AOAM533JNbYyRf46DP0dJiEmOcvfqoWFVvsngUQ4RJ2/u1/CNjs30Jn5
 aGQvzTrQRFmIECfay0tFWdYMww==
X-Received: by 2002:a05:6a00:2148:b0:4fa:92f2:bae3 with SMTP id
 o8-20020a056a00214800b004fa92f2bae3mr8391283pfk.69.1650217471292; 
 Sun, 17 Apr 2022 10:44:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/60] target/arm: Update ISAR fields for ARMv8.8
Date: Sun, 17 Apr 2022 10:43:28 -0700
Message-Id: <20220417174426.711829-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hVPEeDKl0xpR

Update isar fields per ARM DDI0487 H.a.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Add ID_AA64DFR0.HPMN0
---
 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23879de5fa..9a29a4a215 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1933,6 +1933,7 @@ FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
 FIELD(ID_MMFR5, ETS, 0, 4)
+FIELD(ID_MMFR5, NTLBPA, 4, 4)
 
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
@@ -1985,6 +1986,16 @@ FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
 FIELD(ID_AA64ISAR1, BF16, 44, 4)
 FIELD(ID_AA64ISAR1, DGH, 48, 4)
 FIELD(ID_AA64ISAR1, I8MM, 52, 4)
+FIELD(ID_AA64ISAR1, XS, 56, 4)
+FIELD(ID_AA64ISAR1, LS64, 60, 4)
+
+FIELD(ID_AA64ISAR2, WFXT, 0, 4)
+FIELD(ID_AA64ISAR2, RPRES, 4, 4)
+FIELD(ID_AA64ISAR2, GPA3, 8, 4)
+FIELD(ID_AA64ISAR2, APA3, 12, 4)
+FIELD(ID_AA64ISAR2, MOPS, 16, 4)
+FIELD(ID_AA64ISAR2, BC, 20, 4)
+FIELD(ID_AA64ISAR2, PAC_FRAC, 24, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -2007,6 +2018,10 @@ FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
+FIELD(ID_AA64PFR1, SME, 24, 4)
+FIELD(ID_AA64PFR1, RNDR_TRAP, 28, 4)
+FIELD(ID_AA64PFR1, CSV2_FRAC, 32, 4)
+FIELD(ID_AA64PFR1, NMI, 36, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -2033,6 +2048,11 @@ FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
 FIELD(ID_AA64MMFR1, TWED, 32, 4)
 FIELD(ID_AA64MMFR1, ETS, 36, 4)
+FIELD(ID_AA64MMFR1, HCX, 40, 4)
+FIELD(ID_AA64MMFR1, AFP, 44, 4)
+FIELD(ID_AA64MMFR1, NTLBPA, 48, 4)
+FIELD(ID_AA64MMFR1, TIDCP1, 52, 4)
+FIELD(ID_AA64MMFR1, CMOW, 56, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -2059,7 +2079,10 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, TRACEBUFFER, 44, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
+FIELD(ID_AA64DFR0, BRBE, 52, 4)
+FIELD(ID_AA64DFR0, HPMN0, 60, 4)
 
 FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
 FIELD(ID_AA64ZFR0, AES, 4, 4)
@@ -2081,6 +2104,7 @@ FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
 FIELD(ID_DFR1, MTPMU, 0, 4)
+FIELD(ID_DFR1, HPMN0, 4, 4)
 
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
-- 
2.25.1

