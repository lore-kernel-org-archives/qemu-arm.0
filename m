Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1528379ejb;
        Thu, 7 Dec 2023 03:11:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbN3HricgPRBTyEdVa9IG3ip8I9Gs1PMzbwvj7o5u21Ls51cZJv96Pm716xz/avWV3tvzk
X-Received: by 2002:a05:622a:13cc:b0:418:1d4f:995c with SMTP id p12-20020a05622a13cc00b004181d4f995cmr2686261qtk.55.1701947467943;
        Thu, 07 Dec 2023 03:11:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701947467; cv=none;
        d=google.com; s=arc-20160816;
        b=KAH1HP5pXTBQsNnDXfGK76vaVBKo9/kl05NcjW+nll5mtEfrRqxC8VR5sJkfzHWSnM
         CHtmbUlZ+Mem2jmptUkVcrOosrne571NgofjDFBNydC63GUiVCrwdp51/nMXJ0j+DvOn
         QPl7NfQ0/FmnvX034xRKR2GIPGKQcGCdzxjqdSIvDja1KsXDIkYr4QfkJEXAQ3vYbAH+
         bCN/LOOf3FkfEF/rqlF+jddJ4gebdX/4JibIDz0hHKnr7pizpfA7W4fz75irMuAadKaH
         kIYTT4tKKdI5HvTHDa66w5sFWqjKKHKV6xR5zdePJFdqpOLDxpgG2Rnn7fY3lhucaEcO
         9DJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dXjSCK34R3h3M/dmvhhSfTZBGg4aHS/PwIXNQt3mFHo=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=br3ZZoQvN3cENaJxlIZI4p0NgFCIToJZrNo4eHID5hZ1lXqoYw2VIhtoByUCAzKB4e
         Z8KBGAyEazT93sl/dx1NSbBLRWzrm7VHW1yN5meRoDh2FzwtUHL5yxbHw5TWD+QeaoHP
         CwS5ZyRD47aB33ZRqW2RKyIbheWE/0DFuXr4hR7gzClJWyO9T7C8m/E6EhrCU1WXWI/g
         nglA1MW2D/8wcnjb1xAoPE+IHcuGVQet0/Jcivn8bbjvls2AG8xWZISLYPSAEwDQquhQ
         f/40TKv+zSDIbt5SPi2I49wFAiX/+qFxAOWYfErJpnHAi/JO8A5Bg6pCB8NFtvbPeoQz
         AA9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCi6Avti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb15-20020a05622a1f8f00b00423707e09fasi1207798qtb.651.2023.12.07.03.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 03:11:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCi6Avti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBCHS-0002fm-V6; Thu, 07 Dec 2023 06:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBCHO-0002eu-SM
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 06:10:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBCHM-0004fZ-Dr
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 06:10:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3334d9b57adso560018f8f.1
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 03:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701947450; x=1702552250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dXjSCK34R3h3M/dmvhhSfTZBGg4aHS/PwIXNQt3mFHo=;
 b=xCi6Avti5xKEQm9LD9/SfZn/y2orBbrDkWY8PCl2PyFh+dD01GFD1BMxW0rlc3BVJy
 NtFMiz5OkmEf6i9rVtX0kZes/PXAdqcG6hkODhDU7bwrQPTc1vRhC99bjnTtv7A3ae3c
 gAw4Acd8ruucS9yKDlsXfeAVEiTGWkT7PBY7KZxv197oxrMRPWyhcCfvOMJIeU/rbusK
 /t9hVGqfBQjOQPAhRAL57iOK9/bMvCSfMqHeXpydgXfFOs/uLVI5eXeFBzlMDRJ+YP8x
 4jkaY9QLOB+YSMlxOwQGyJenC8nXWx+cNI4xVKWLPllhz0op6J9cuBsqVMdfqDGF/6cb
 4S8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701947450; x=1702552250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXjSCK34R3h3M/dmvhhSfTZBGg4aHS/PwIXNQt3mFHo=;
 b=abuUnzXkXIGJQFsD+1GAaRO+NelHeGfInYw/GA/HscpgpEPVOTL0TPkyX4jZoetkQz
 9kya6Swda9EYYvtZX9pqpCYpzg134W164d+gd3eQ0pnfyT/MEXZY7IoAF3DsjdkbjPJO
 V7IGrAEr6w5d0OaAplYi2zxVmBTHHFuU0R0kllWCz2wf5hWFAQLs1zuEZReDHO4OtWXi
 wQqP/0AJZMAbPPsnyw6s17TEZMz8fxJ1ove7ldjzxuNMnQWmeLbAbwLFV5FBYsJpbWfS
 rdBzB3ZW8RS/RPnBBgc2UKNKcX5jjNGy+PBuOIpETWZ0RmGphGjraqjtEjNYMVEGSBHX
 Lkpw==
X-Gm-Message-State: AOJu0Yy0vmoFyFry0Bsg20t4UIrHr1A3xekWgH9A/bPfkmGX91MwoKtV
 gx6YoRUagbv8oftIp0zfAa0fLA==
X-Received: by 2002:adf:fac2:0:b0:333:2fd2:816a with SMTP id
 a2-20020adffac2000000b003332fd2816amr1413317wrs.135.1701947450369; 
 Thu, 07 Dec 2023 03:10:50 -0800 (PST)
Received: from m1x-phil.lan ([176.187.202.111])
 by smtp.gmail.com with ESMTPSA id
 dh8-20020a0560000a8800b00334b3208700sm1163670wrb.49.2023.12.07.03.10.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Dec 2023 03:10:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/arm: Restrict ARM_FEATURE_PMU to system emulation
Date: Thu,  7 Dec 2023 12:10:48 +0100
Message-ID: <20231207111048.50568-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: Csb/ekBrFYgq

ARM Performance Monitor Unit is not reachable from user
emulation, restrict it to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 51f57fd5b4..60cf747fd6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1410,6 +1410,7 @@ static Property arm_cpu_pmsav7_dregion_property =
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
 
+#ifndef CONFIG_USER_ONLY
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1432,6 +1433,7 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
     }
     cpu->has_pmu = value;
 }
+#endif
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
 {
@@ -1592,12 +1594,12 @@ void arm_cpu_post_init(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property);
     }
-#endif
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
         cpu->has_pmu = true;
         object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }
+#endif
 
     /*
      * Allow user to turn off VFP and Neon support, but only for TCG --
-- 
2.41.0

