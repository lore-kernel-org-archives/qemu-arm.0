Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19715njj;
        Wed, 30 Apr 2025 23:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/FultEwoIV2Ka3ZWwW2hlzuipv1diMUoxiyoBuGVR4MPk31BwQgDQgoc46qNPf/KDzZ6QgqUlNe113A==@linaro.org
X-Received: by 2002:a05:6a00:2286:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74038ab964dmr9076618b3a.23.1746080659480;
        Wed, 30 Apr 2025 23:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080659; cv=none;
        d=google.com; s=arc-20240605;
        b=YoD7XpYXc1QlAiEO40BeDprw94/Y0hvbnbweCGT3ft9/VWjfF0QmZ6ncjvdeRarhAM
         YDY09yTaVYmTStxIjpOZEnBmkVvb5qvSN39gAte8F4j33rzgxfgHa5/PBpB8YiKELDiz
         C9bq8xwdrPbyU2qas5NIJuTwkaZJBdYZm771ZT2iwjzROoJ/vQxLcOIGEdN+afTD6Kua
         dcqDbSXLpPUYBBfuAk1+ti64pAyy8r+EetIMf70pK/Lm6bTiV4KLXWXOznPb5lpjn8Fh
         65i5pxJOdcA8kDFiNtvlqSBX0rcLKfETKccETpPv6/O6vqpzgc1yyImJnyvxQhfX98jV
         eYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=smxeq8t77rmr1khTGCWgeqn2IHOGcCtHx62ulud5haY=;
        fh=jS7wvezIPPx8aqOb63Ewo5Q9XWkf5Xn3JBB3v30d3Kg=;
        b=hWbpvVkXC+77cIR3frWstar882H4PHIJn8nlbkF0ReRiTnf+ZCcq06QrAKPhxjEQLz
         OR/BDirjqV8s7mB0Ltr3H9i5hreQpbYC+KOpouSQmKi/BPeylo/bDzmz6Ce1ZrE5bJPq
         AJrte21xq/6Wr0a6K2FrfTdQxpH4Fmg4LnZSoJ3ReHB+7LAqumYyeLJyhBIpU5deuhe3
         wKn0osyBZ9zPu6UMsCKV1tDWjxoJeoOlWkfRTF0+Pqjkk7qrWLXBWNIZaTNthO+XFzrF
         FXTuaKpALpbS60uBACTtSJ/t7vLOrolcGnfjIhtPRt72S4/yDEgztu7dceMFNQjR5vy3
         Y80w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jsDnx/nT";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef150e8sor73431b3a.4.2025.04.30.23.24.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jsDnx/nT";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080659; x=1746685459; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smxeq8t77rmr1khTGCWgeqn2IHOGcCtHx62ulud5haY=;
        b=jsDnx/nTy1yUhk521NWUFAho6tDslyLPNsZ3XfIh+kGFydU444iNKVIpWUlMbJwPx+
         mLm/qF6ELXXtvWGMlySA0iQZ0pgFiGuqkOrAiwtqYOpmi2bBkC54nsvemJkoIt5HLDTj
         MOXxhM+OVW2BERtXCkxLmVaP+LxDYTL5bmKFXgu+Eq9c1SXm2Xie7zswnC07nDjN2U5c
         0eRKL6tbryY5EzBYvLhWXqkP6XvvzkAPzvkRvs0/a3do5mCQ3bzJbm/voJJ7qTJA1WOX
         atGqH6AsuBxqikXcbS62BFz2jCDv31VAipQIfGQ4+g1VBzoWIYe4yL/bOYd3i/Q4/k9e
         VT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080659; x=1746685459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smxeq8t77rmr1khTGCWgeqn2IHOGcCtHx62ulud5haY=;
        b=YCmKtFhFbwsAQUFu2CHdQ6OnblQdhTasWtKsFTcPb8p8FOLeJ+8gK9NYTv1zNNCJAS
         5gkHvIERqC55+XOmQbbfiis9O2oMf+9JP0dMBe591sYoXNzcDavSoCdKlfWAOns8WMGM
         SXiYxnze+wrJeQkdPHCEUD7W31BA5HnHq2YtMSb9vSx1+nfW/1ums5yD2Zwj44Gpyf+o
         KUUTYB8YEJ2l5G5Dyk+EQanrBYTzEC5Z62Myz4SGfA9qniY79ko0JP+IbZ/AKLkDCHjH
         sPjl/qfbvTEvh1SMBDX8kgDudYdA1MqKsVRSbLrMDIv3UUVf0sPQ+pmvSYPZCq8mf9sS
         KZuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7aZZ5qAKz1KzUZOJ26LU6Zqo17Ame6paliXS/7Ln8f3yXr4Ne2aYaKXxGmSdlOr5XTOUTjrxUqxO2bQ==@linaro.org
X-Gm-Message-State: AOJu0Yxm7DWg8dYoYD/cKJhWltBiD8k0VYEdLsW+wPzYUm81CJ1YWYsH
	BTvPq9l+Tf+3p6cU7SfsI764xs+ezPI2zDzr7pVbnL/qo+/R4HGy9njVA/CHawqQEw==
X-Gm-Gg: ASbGncuHYVN9BxxIu1cZ1W6Fq4vRJt4xxFm1OUrOcbVhsSA0K7g8PyKfhp7iUmSWuLh
	0TtkCwoTWVCVvApmlbUBhC0bwibpb8Kmm49hW02gzquLkiOP/gGTAIuIRPS+q0nt0cVOfSPnVnN
	IEm72+2s0lCPPVNBAi38p9o4LO4Os2cEO+oEamzTWa87lWRycr06bSO4H4KtCdj+6zj6aME/yHe
	w8lPTcMKfL1QPjekbmJVgKZ3prZrjNeMQuGLYKSu5L3/YXLyU08wrnQYbXrnFCMYIWWlcWHSWVq
	GoAjnl90ECI7vTAs6Z/l5dbIimeIGW4ylyZhswvq
X-Google-Smtp-Source: AGHT+IHG4UGGkkz608m5AZZyK3bj7kb6xgjT5nZou0FUnCfiy2hpqLLhUwXRyD5HV3onb5k4znr43Q==
X-Received: by 2002:a05:6a00:1942:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-74038959453mr7648202b3a.1.1746080659119;
        Wed, 30 Apr 2025 23:24:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 31/33] target/arm/ptw: compile file once (system)
Date: Wed, 30 Apr 2025 23:23:42 -0700
Message-ID: <20250501062344.2526061-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1zeW1o0n62mu

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6e0327b6f5b..151184da71c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,7 +17,6 @@ arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
-  'ptw.c',
 ))
 
 arm_user_ss = ss.source_set()
@@ -40,6 +39,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'ptw.c',
   'vfp_fpscr.c',
 ))
 
-- 
2.47.2
