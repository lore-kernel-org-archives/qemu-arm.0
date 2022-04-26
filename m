Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp378138lfu;
        Tue, 26 Apr 2022 10:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj/KPWlsbYBTRU3NPQAxUW1KpJu/uOPjMFCqPtVwv/51Q+QvzepbYEnjeca3X7kffNorge
X-Received: by 2002:a05:6902:28a:b0:641:12be:8ab2 with SMTP id v10-20020a056902028a00b0064112be8ab2mr22852836ybh.226.1650992729881;
        Tue, 26 Apr 2022 10:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992729; cv=none;
        d=google.com; s=arc-20160816;
        b=qihwBQ9rXs38t2UNkzeU3cyDfiRhW5WzEvwtEoM+5EuDIEix3KDLaOTCqDgW+JoP23
         ly79dv0tq3e9fUf09dWuAy+IL5z7AN8QpOHOo99mFAIdU94+0gp39O98obIfQLcJi3cK
         aD3TsD9Fs7DGYhYuhe0yYIbxQY+/pnxHhkUUT4YPIGrT+UtZ3VqT5sP60+e6JKUAvNd9
         OMnijlb+H48UY9KenecWnu4Wl1YW96iTvUMgdOv/un6UIONKX+FMnyHlDvkA27lOi4Oz
         TkLqO+BfT8UCbVuHwxQVAOavmKEZRz9ybAZQLr3FTPjjDV/udEp44BUsVn48tKQwfXoZ
         ax3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0rp6VL6sGBeO43lHZ3pVwoan89wcSSiGWaAXpPEhCP4=;
        b=IJkl28PZS7LSE2qY3FvKx/2+QHpc13RM6deHzvgHzlYQWEjQm4eO+HD6wAs0qShdNH
         jmUlSMo0Yz2SrTJddQD5QGiptu+zCXUWiB5Sgt2QyR1IDlQYIlBccGAdq7Zh/OC4XLBr
         WN073NeEGVuRXVZkYjuWCe+3VoDteyBriqOP7BOHP5+c9iXdiss3AcX5hbu3ivoe7n8b
         MO5rqMYdvEd3eQDaBeydvL1nLIffZIrl1eKGykgSNoGE8eUGrQ/h+vrwWHbX3IE4xDW8
         qn8ngbdlVQAWWHyszSGhlkVkYEe9g8LZlp/4BZ2tBh9ee5HuYqhaaMFNVv75Z14/adnw
         ttaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLpSw5Ie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a254709000000b006485925a314si6441385yba.142.2022.04.26.10.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oLpSw5Ie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOcz-0007ds-3r
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5u-000369-8l
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5r-0003uG-2c
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:17 -0400
Received: by mail-pl1-x634.google.com with SMTP id c23so30752210plo.0
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0rp6VL6sGBeO43lHZ3pVwoan89wcSSiGWaAXpPEhCP4=;
 b=oLpSw5Ie0WSnhvJ+WoiFheYwZj5N+sRohmSqMQOWGRsjJDvUMqJFdBXXn0pFduIPcb
 M2RL5exjy6PbYiKRjKjmYeJsLnnoKXspfiMId61ckh0botDw5MAtI6GDvEIlOrV3IHBO
 +0RDrUvJwZNye4nsvwpfABECuQHm9ZMJG2CH+gTW5NtdRF1RwPL6BYZvf4vItRbK9C8r
 e4+aQsTYhpV4E1t82sfYDDE3ARABRszb5VyML/QuXvaCsTwmZKj5vmIjG9T7aNaGNoMb
 XzAk3SAzq6ijEcFE7blFc0jlH0mbf/NnoRyb4osLunFs6okQ5dBDktqVyVTbjoYbRA3F
 5JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rp6VL6sGBeO43lHZ3pVwoan89wcSSiGWaAXpPEhCP4=;
 b=riI2B4/QgKGGgw93TXEsjJkGzLrC13VPQ2vvbsPa978LRHMvsXAkzVuls1DjCDdMZl
 nadpw0mzCyMz2Rv4PZciACMYuwOvuZxaadUj7zQIloR8Hi4GV4qUDG1orR7ed3NXCOmV
 pmuY355enosWdi3E+FZI2qzgrJ2jtIJplTJNVzzPbE8YzHoDoOqOmghaC2JgoJ7Tn2WX
 I1Fr3Vhs6HMXRvrJefAoL/Wxb5QKNYGH+ibzfbE5ug+RkPpxg5e23k9Ft/kAar8YeQI2
 pvRsPLnsGxf4SUJ7PLqUk8hSw3xBGnNnDpawRsG3RHbdJpyvI/mt65daRQ9KNPakcS8i
 RL9w==
X-Gm-Message-State: AOAM531tIDKquDSsr20RVK3tXu5CSJcHQPsVbK0X73Ua0WEblv4llMNr
 RO3Q4K8v9mtTvfOblalXOcAZReG12Xq1GQ==
X-Received: by 2002:a17:90b:3b46:b0:1d9:b14c:cc6d with SMTP id
 ot6-20020a17090b3b4600b001d9b14ccc6dmr4232600pjb.135.1650990672606; 
 Tue, 26 Apr 2022 09:31:12 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/47] target/arm: Use tcg_constant for v7m MRS, MSR
Date: Tue, 26 Apr 2022 09:30:26 -0700
Message-Id: <20220426163043.100432-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jwMUQ0s8eRdC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cc540f2b47..b604a820c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6369,8 +6369,8 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    tmp = tcg_const_i32(a->sysm);
-    gen_helper_v7m_mrs(tmp, cpu_env, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_mrs(tmp, cpu_env, tcg_constant_i32(a->sysm));
     store_reg(s, a->rd, tmp);
     return true;
 }
@@ -6382,10 +6382,9 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    addr = tcg_const_i32((a->mask << 10) | a->sysm);
+    addr = tcg_constant_i32((a->mask << 10) | a->sysm);
     reg = load_reg(s, a->rn);
     gen_helper_v7m_msr(cpu_env, addr, reg);
-    tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
     gen_rebuild_hflags(s, true);
-- 
2.34.1

