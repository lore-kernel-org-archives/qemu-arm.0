Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp610392ejx;
        Thu, 3 Nov 2022 06:04:53 -0700 (PDT)
X-Received: by 2002:a05:6402:1bda:b0:464:4eb2:8c25 with SMTP id ch26-20020a0564021bda00b004644eb28c25mr854676edb.278.1667480691708;
        Thu, 03 Nov 2022 06:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667480691; cv=none;
        d=google.com; s=arc-20160816;
        b=r0f3wKranE8kl9BNTcKeMfRF3+72FOlG+FJgXQ/xYVXA6s2oUNOTbIyNHVW02HWSWY
         O230LFYdwjo3F6LXpR5dJxg/2zzeVZ88/D+8K1+hBhsLJFzDaZRZERT1DWChkK7d+1O5
         ZZvabtcqBC2bMrjhAWsf0erfzrIdyLnm8mahKD3QJ/z9QkqVj+xZj6onD17CX8N4xsGk
         CimF5CSunrcgervEZNUj8xwcLqGf3QRgkKgsUMwKGFaEDGVvaiwnodC/Fbm/bEY5FTSC
         nCiOetfoMELK2TZSYf3DVS8o/7Lhp29DPMXWMoTPCyiBmq3txD2+TiJasyK2WoIl5/0A
         21qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IOpVOJyrnVHlGh0dX07tUmAHtpOMZf1I7Z/TA9A3UCI=;
        b=jssGru8+0gy8YXq847qR1zkxZ/gk72KT1zkRuOabkYVPk4EdjrGGcmqVOaLtF2Y/fO
         B1WnTrOtw0BrdSIlinfJIEMuU9t9/9Ah4H3UqM6PeYIwUVziBJGkHfC8UfVqV1m5yJKH
         1Bvz//6dyU4FKMDPE5DNdte0ix1sx6FJyrzRhT9q3s4bjRd5xltNih3c5/E0w/gTjoB6
         PXG2inHx3KrK1EYeCZaRUEZgQhcHO65v0ngfbsSCsjLNesKjYGYwDcLStAeIbgsyR/oe
         DUkmmOVELQ7+IHyprDumVbxwK7ZsZJM7+N6+OXViGnD4+C3hWaR+piAXFdIMJjTdy51N
         vPrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlA4FWMj;
       spf=pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jerome.forissier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jerome.forissier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hg11-20020a1709072ccb00b0078d50f96e7bsor602846ejc.3.2022.11.03.06.04.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Nov 2022 06:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlA4FWMj;
       spf=pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jerome.forissier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOpVOJyrnVHlGh0dX07tUmAHtpOMZf1I7Z/TA9A3UCI=;
        b=MlA4FWMj3k5TklxiTZ1DAnDRIVSfwKR2+e0f4dWEmppKtqcEMvusX3pjLv/gbSc4RE
         +NvIE6+zaTaG7+Mb8VVLfPqxqHV/pnbGgx/PkzEhkzRu68hGXK24+eVSJaHMk5XqLX6c
         UCVhIe4kDIyqB1wH4ovityjwTZKjTUT1C1yAU19zdG3x7tdPFh7Hd0piL8XxjGfhmzcn
         Tex1kwOGjzkeYiiAgbr2VdLZVAnMD9uYvkGRiSNXbY+1aaUXlOvS22yK0GBcXzmVz5jY
         fXkbQI0laqpf2GZHFAtF74Df2MeJ57cpgBjgOh2r8seL2AX15WTtC8rPBxQ2YOXeul11
         8yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IOpVOJyrnVHlGh0dX07tUmAHtpOMZf1I7Z/TA9A3UCI=;
        b=zt3Ub64vZHAtCPZLhXGRREH08o6IS04WGkW4Q+oiI83FD43guqxYkmD+ZprTEKnAHz
         llVYpUEx/gQx9m94rQCXK+f9IUpNzWBMPHpwfcrypcr6WvgLrstAKipiUkAPFTQ719ZF
         p71eOLtbFLWj1WfNdrADuJN2bMAEHkweh8s3RKzhh+GTUrI3PqIWMbKUyrZWcN9INOsM
         9RGc6sFmBMwDJ69k0LU1p9yAmxuSX007FHnNMdLAc8Dg5QEX16qDWVm6JJNgNU3r3Tf3
         q6vNJCx51aYH3bmF7Q9U9MHVT7kyVwqNa60uSMKPg3k/MtZurD6krZRA73EkqDab6n4+
         KXLA==
X-Gm-Message-State: ACrzQf22eUBh24x43vnZafbe4qnLViCxYFL34h1rVgG1kjFMBwEowpVF
	3uGExLxgfSPZ6NgJjg9WMsCiYhllcTbEZpjlwO4=
X-Google-Smtp-Source: AMsMyM6PnZMpznlmll0Y4M04ZQ9I7RUr/5Ml80mZQVJaMiCYGWtaZkUSZQ3KWcWBnkrl79e5a/K5mQ==
X-Received: by 2002:a17:906:195b:b0:7ae:108:9729 with SMTP id b27-20020a170906195b00b007ae01089729mr8583221eje.604.1667480691093;
        Thu, 03 Nov 2022 06:04:51 -0700 (PDT)
Return-Path: <jerome.forissier@linaro.org>
Received: from ?IPV6:2a01:e0a:3cb:7bb0:9acd:f850:f866:6c14? ([2a01:e0a:3cb:7bb0:9acd:f850:f866:6c14])
        by smtp.gmail.com with ESMTPSA id bt22-20020a0564020a5600b00461c1804cdasm515662edb.3.2022.11.03.06.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:04:50 -0700 (PDT)
Message-ID: <c6494e10-eab6-039d-7c83-5ba6262c4841@linaro.org>
Date: Thu, 3 Nov 2022 14:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@linaro.org>
Subject: Possible regression caused by "target/arm: Add ptw_idx to
 S1Translate"
To: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: vMxOjsKuL0Mf

Hi,

I am troubleshooting a regression that seems related to commit
48da29e485af ("target/arm: Add ptw_idx to S1Translate"), at least that's
what git bisect says.

The following hunk looks weird to me:

@@ -1263,7 +1260,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        ptw->in_secure = !nstable;
+        if (!nstable) {
+            /*
+             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
+             * Assert that the non-secure idx are even, and relative order.
+             */
+            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
+            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
+            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
+            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
+            ptw->in_ptw_idx &= ~1;
+            ptw->in_secure = false;
+        }
         descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;


Indeed when nstable == false it will set ptw->in_secure = false when
it would be set to true before. Should the test be 'if (nstable)'
instead?

That being said, inverting the test does not fix the regression, so I'm
tracing further.

Thanks,
-- 
Jerome
