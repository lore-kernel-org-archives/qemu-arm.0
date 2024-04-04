Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp422617eju;
        Thu, 4 Apr 2024 10:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYjnQQ3ffQDz/NjKR4ApWOfBTCkMI8O4H9zmLL/ndCaieOjWyuoCrHddtEP8bzdZ2ycTvOM+CaMon+vzqO7qVoVI3otPFq
X-Google-Smtp-Source: AGHT+IH9lSOx6qF1DqHghAmWgaflsc+aXJ+whUF2AcoPnBtsIU4dQavVgyEsLUqZvwoV+3bR+Q0i
X-Received: by 2002:ad4:5bec:0:b0:699:2dbc:b767 with SMTP id k12-20020ad45bec000000b006992dbcb767mr2698750qvc.10.1712252454533;
        Thu, 04 Apr 2024 10:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712252454; cv=none;
        d=google.com; s=arc-20160816;
        b=hME23KTkLjNJ1A3SI1cn6lyMILIGhdpsQDIbak7qf3dAMfVC9sR4m7WcizTBhCXd5V
         6l5Z27s6ICvVCA/cmrBahmEJw6biEdziPRiTroFIwcCnhEmE0udFgnn/otZCt0qtluz5
         /fUxAL0EXt22jfEvC3Qo8GJi2TcRLm0WLzpdMmsEw5hhXb/kQiV0g03CRO5JRf8HyMaQ
         BLemHd80n4xEYb7o3PpAxjC4Ad1NfemDtVoYyKusS0+ZSqlAe1yrpq3yGnfdvrOJyF4q
         9/9ag60a89YfKne/pRu/CdahZc9CBMA89L1iHNpZ3coWl25y4zy2nsUJ/weam+Ide6Bv
         AJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:mime-version:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=rl46i3DrBjDfPSGCGKqwQP2SynTZKyWMkmvHAmen0b4=;
        fh=UrAKaIUCC7pIAa6bqoKtfqVaCElCyc7TyCo9LuiuuAw=;
        b=IjXLRBSRGereJiXsUBfeJ54yqOgir/LnGzF+tsSKjGa+pd2ATZWNrBci919ozfbGJ1
         OGAHHFTvnxCcHcQ9kwib13IfrenUXFu8WhYiZN5ftz694LgjbW8re7Ce11R364vTvPsp
         HBHjkuK8CvzeG4Wz6PHGMXN9O8XW9uMiW4naZVjsXj3am3wKr0nF69UA+lErAuvC8ZIj
         Be6nOPy0Dgdl3DGcWXuKSkmhguERESilZ95rQf6TGI0nEyPi0e4/823KKE8sYQQSgXH0
         cfJP5IP2M1sHKlkLaX8axCl/CDjx97hLfm+aMZ42/ZbbPatDiJrYXM1fyyUKHHfdK00+
         V4oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=DnyI+FMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a0cf142000000b006991cb7d7fasi5967864qvl.420.2024.04.04.10.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 10:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=DnyI+FMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsR4o-0003kn-8t; Thu, 04 Apr 2024 13:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ptosi@google.com>) id 1rsQ4m-0006ux-DI
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 12:36:32 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ptosi@google.com>) id 1rsQ4k-0000SH-Lr
 for qemu-arm@nongnu.org; Thu, 04 Apr 2024 12:36:32 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56dc9955091so1370765a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Apr 2024 09:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712248588; x=1712853388; darn=nongnu.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rl46i3DrBjDfPSGCGKqwQP2SynTZKyWMkmvHAmen0b4=;
 b=DnyI+FMf+xKGDr+/20DIyLDiytDCsBx4xP88oA+Ke0jWAo/xv2QmxipTzKa+dMXFN5
 //FKqNjYBEnepMhsLW64MNDvLDKrfvAL4Y38wff0ZVO3MhipdhoIrem7rpYZCbV3wb4w
 K3geyMi/qF87ghDR+uH6gJSb5p1YoWJeBabzzQhBi1OVuTMqXuqL5CHLm14dVJTh+lWi
 YjJ+0AAASPZwNTRVA2RnfF1nAQePPampsTzasAwnv2gl/EqnYoziWY4s0qrql8cBKCkE
 CdYO2Cs0FVCnxt58dtD3Pz9hMOBuOAjwUMWCmq5Nt3cCaY6JbMJzZ0P3j4twcvuTqGGM
 2GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712248588; x=1712853388;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rl46i3DrBjDfPSGCGKqwQP2SynTZKyWMkmvHAmen0b4=;
 b=pn30FwTeMiXqF9krIqrxwX17lrXnoM80phtimsyhuNPT9eN1fOs+YbFVxSOS3nMmxM
 z/GIn4uwZmsawbtAmBl+u0T52d5y2prNjDwvWMPGPBw97uYoKQ8XnBFynsLE4jytzp8S
 ce/QQiqO0fEFbs2noXT8agSKz813Ask3QZI2NqrliPWmK2BHs4YLN7XVEp0oKEyR8Kpv
 evIb53ZhBeb+doSmuRzdXsbEeCvlz/hxNGS+IOcqaTBC0LtiXGIqsKZkaJ5fD+t+EYYF
 vDRvXDwzdzn++69i75CU0rSSW6Jr5mYzVe8mo0X4lMj2AYXlb3NPNq3LFtsAZ7SHksUK
 8Yyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9tGiTNw+5I0WM/n28tRPwVrM2f2IPlf1sxPM6QUt1dr/97QhQ4K8df0elHSyy4SHVtXm1/2MC37963sDhxsJ1wmQ3
X-Gm-Message-State: AOJu0YyT4PZKC8Q2GX8FfFvvxFNFZACuBLx4Zi2S4ZKFgxxL8UH72UkL
 Egs190lGz3a9W8egzHR3VMKY2xxkhqziXoTWPKd/k5J1eoUjTmqytpLg0veXTQ==
X-Received: by 2002:a17:907:60cf:b0:a4e:7d39:dff1 with SMTP id
 hv15-20020a17090760cf00b00a4e7d39dff1mr2450728ejc.8.1712248587917; 
 Thu, 04 Apr 2024 09:36:27 -0700 (PDT)
Received: from google.com (118.240.90.34.bc.googleusercontent.com.
 [34.90.240.118]) by smtp.gmail.com with ESMTPSA id
 qf31-20020a1709077f1f00b00a4df4243473sm9188609ejc.4.2024.04.04.09.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:36:27 -0700 (PDT)
Date: Thu, 4 Apr 2024 17:36:23 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Fix CNTPOFF_EL2 trap to missing EL3
Message-ID: <m3al6amhdkmsiy2f62w72ufth6dzn45xg5cz6xljceyibphnf4@ezmmpwk4tnhl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=ptosi@google.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Apr 2024 13:40:35 -0400
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
X-TUID: jrghWnAjFml4

EL2 accesses to CNTPOFF_EL2 should only ever trap to EL3 if EL3 is
present, as described by the reference manual (for MRS):

  /* ... */
  elsif PSTATE.EL == EL2 then
      if Halted() && HaveEL(EL3) && /*...*/ then
          UNDEFINED;
      elsif HaveEL(EL3) && SCR_EL3.ECVEn == '0' then
          /* ... */
      else
          X[t, 64] = CNTPOFF_EL2;

However, the existing implementation of gt_cntpoff_access() always
returns CP_ACCESS_TRAP_EL3 for EL2 accesses with SCR_EL3.ECVEn unset. In
pseudo-code terminology, this corresponds to assuming that HaveEL(EL3)
is always true, which is wrong. As a result, QEMU panics in
access_check_cp_reg() when started without EL3 and running EL2 code
accessing the register (e.g. any recent KVM booting a guest).

Therefore, add the HaveEL(EL3) check to gt_cntpoff_access().

Cc: qemu-stable@nongnu.org
Fixes: 2808d3b38a52 ("target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling")
Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f3a5b55d4..13ad90cac1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3452,7 +3452,8 @@ static CPAccessResult gt_cntpoff_access(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
 {
-    if (arm_current_el(env) == 2 && !(env->cp15.scr_el3 & SCR_ECVEN)) {
+    if (arm_current_el(env) == 2 && arm_feature(env, ARM_FEATURE_EL3) &&
+        !(env->cp15.scr_el3 & SCR_ECVEN)) {
         return CP_ACCESS_TRAP_EL3;
     }
     return CP_ACCESS_OK;
-- 
2.44.0.478.gd926399ef9-goog


-- 
Pierre
