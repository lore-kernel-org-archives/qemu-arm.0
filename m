Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1249975wrm;
        Fri, 18 Oct 2019 11:10:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8bZ510mUqovnMv/LBWe9kcWkH+LZJbSavPWIgWaizvPp8/omsSpHkvybXUzQoqY3/VQ2o
X-Received: by 2002:a50:fe0f:: with SMTP id f15mr10882114edt.89.1571422215462;
        Fri, 18 Oct 2019 11:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571422215; cv=none;
        d=google.com; s=arc-20160816;
        b=xgNd2A1butu6bdWvZU0D76kpjfGb7sPPlFAc5402j7FsBX5MCbPbx4CisJEqlqGpoJ
         NvJMVkMBtLyUSolkFLjPZR/eU7VaMZoskp/VOVTAY7vKaBILZrfG3HLJy30kZL3rd3VN
         xu+Iac4stCzmHbCNT7yFA3eA0NFDSppJAKVMF8DWLsG1wbw/z3w0FgVZhxRM9H/oiBIL
         KU1LOCmWtQ2HoClnPNR6ImOE04ggeobpQfpOFteDKa67JWcjkMV48hSyV1ZrUrXj2qAI
         FYR7zn0EEQdxWswAD81JNp4o/Ib4u79OyoRIe5ul9jRN/QDUqfx+R1pbpagwaRBB9933
         FSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
        b=VfMhOYtuY8wEMgOwB7RqZo6FXHyQBwWmV816c7FnJ1Snit6/KnK0GaHGB5UnY/32Lx
         IyTho+/B758DlNejyHO8zFadDf2vobRoM+vBs/oXSWQRjvMsLW0OdgnV9ee+2oETPo0J
         GUKW4DJdYP/DmeBfjroXSSpASs3CFKAAf83/AF7OfS66oh9ujUcULZASBHB3aFPo5/+A
         jFOLmL+tTs9oaHR6/B914p4fK0WEgO4z4OJNw3K6OFcwOptcS3Ip4tP4FjP4N5hQ56TQ
         +YMNyM84xCw3LSs1oNp8eWEMQUX6y9VJClF9tAlhIk99hylmQUfH5NnkaTBHdQLFhDBG
         gVNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SNMbParS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pv13si4007318ejb.79.2019.10.18.11.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SNMbParS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWha-0008UD-HQ
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ4-0006ld-4S
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ1-0005Xl-Qa
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:54 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40069)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ1-0005Wq-0d
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:51 -0400
Received: by mail-pg1-x541.google.com with SMTP id e13so3750237pga.7
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
 b=SNMbParSoCGF7WYBp3B8k5/vpmixY7ksuS18lVNemz2GZPYdU1q4SLEZ3ccNRRRfmo
 pqgShOKXVlAxY94DrdCeiqMAxvUOZpUPf4F0BDFvqEDSDP9KS5EcqUn9sRioOFpdnRyl
 ytbmSy2RJONilmLS3nU5rmxUn/7dPyt86YaMZqT4ggKNerRCXGkKiTuUI4OX52VE1N9v
 RVdAaJeEr+OHeET0kRH4F8VuqTn/Y73EPVL/NsVy+afUAyLrjvEf3m5yG7YLt9mzxTAT
 dVLWRMHVzmrzd3htQCSqon1g0C3jaXzxPCZ42vTOcOj7r4G5zV0wGIStZnUAHnHMYW1p
 fRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIwXZuVFcex8c2gsnRtwJL32LXPTCWgJCQzC/Gsa6O8=;
 b=ZOIZhy8AVd1S14sVYZLaubFZTKoTyj+gvTMTYfG4Jsp6ANwE9f1eOtROZ9iUVm9g8c
 EpW+3r3Jd6IiW4JzPfg9eLVaGID75vAr6P3wE8VpVa07GhAZlAjQFuTMBpxQ5YdieJYo
 XLmXrvMuZDq7lDHP3K5OQ491Dg4x1qZuzhCy1mWwOMroUsiQooxPGEw6JVHDKnvGiY9C
 7mvpyjc2ZPy25FeA7RKcpFw7rLgYZQ+06OLl+aCcjYtettKTJYlTOlRlZUJ9wxsUN4se
 m/hYtpGeQ8+cbRNMD5M9rpM6fmmZqz5zPcHgYtLvCC93MczsWLhdYV8CzLoFs03N26ph
 3zfg==
X-Gm-Message-State: APjAAAXV10oSS2TXhd39CTwFHsEBMka63ch7wLIfdyYmy4YUeGt5Zwzd
 PLPJ2L+F2PGi1xFqbLxcHTdNDn7Aa1M=
X-Received: by 2002:a17:90a:86c2:: with SMTP id
 y2mr12391573pjv.105.1571420689679; 
 Fri, 18 Oct 2019 10:44:49 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/22] target/arm: Hoist store to cs_base in
 cpu_get_tb_cpu_state
Date: Fri, 18 Oct 2019 10:44:23 -0700
Message-Id: <20191018174431.1784-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1oiX8iEZ13Cc

By performing this store early, we avoid having to save and restore
the register holding the address around any function calls.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f7d3f257d..37424e3d4d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11225,6 +11225,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     uint32_t flags, pstate_for_ss;
 
+    *cs_base = 0;
     flags = rebuild_hflags_internal(env);
 
     if (is_a64(env)) {
@@ -11298,7 +11299,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags;
-    *cs_base = 0;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.17.1

