Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94357njb;
        Wed, 7 May 2025 16:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDxHm3B6juXpiDL2dHuU/mtIVBJTgZM/vDPYsjkIMrQTAeAMYqGdRrO2W8HsQ5CTfW1eKxDyz4cXw53Q==@linaro.org
X-Received: by 2002:a17:903:188:b0:22e:566f:bca7 with SMTP id d9443c01a7336-22e5ea30df8mr81244475ad.17.1746661382303;
        Wed, 07 May 2025 16:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661382; cv=none;
        d=google.com; s=arc-20240605;
        b=Pe/mqMVdHvz6F0ih8PbBZ+9WBPNx/9CuhFeGyReg8J8HMrlPHbOc4JQYPDTDqaoXmz
         mfAdjiVaw1jajHNqKuowpr2PNU4qRGQOdzk6iVj3e+QRm9MfJydKwex0NZAiRujqagvz
         1RpnHh9X6qOwcn5JT7OzsFLZCJeN46SgL1taiBT6dZuRBFqRg65rjYVDhgilT+ZMV0O5
         TGA8osrQKD24HJGMv0p5k+/id1D0xV/6dP1TBmLfjfuBa1zgg8lVaYPMfkbx1aWB+ADi
         8g1iwNUK07Xu4o7Qm+p8I9bnQNRylNiXDZIdnt7yCcjAp7yFA6Cl9Zv6id4CEICINHEM
         pSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JAz2QB2SUYrr3XWzF2d2hg/x4+UA3WdNJnT5uCp92aY=;
        fh=WN9Q48b3KSN+FSJgQvqkxEKVDEZBm+9ftXMBON2Glyo=;
        b=CarT9Ibcrq8iHjLUVEucy8A6ON4NvzWsIIS1XVThFjLHV4ersobYED+FlgUGYA/DfS
         M/ex2z997jp7Sc53ZooBdSoXW7856Ea+ATXIh8Fs4FXn4/4H/Lyf65sibNRxPhzK5gB8
         HO5FvogiCUjxvloS5Z9AsEJbv/qba/Nakb6kziPf2m65Tt8pqf//LHRE/3wc35DWZ8bq
         F8Hmcf4kDZjG5YPwo+q6L3F6Z1ee4Tmf/F7jQ62WkZ2FI+k612BfwWGXvMLsqslHnwIo
         unJxQsnAm+FFH1eKSxD+n2iX5Ldk/H3Tto2jMCByf3UTJiMQ+Eq1hgdp6Otm6UHlmeQg
         LBIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSKD60VP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb171f7sor96446055ad.1.2025.05.07.16.43.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSKD60VP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661382; x=1747266182; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAz2QB2SUYrr3XWzF2d2hg/x4+UA3WdNJnT5uCp92aY=;
        b=jSKD60VPYcl+HOCW8Vz/wv0Pn2qzdFVm0wLqyY/nviJKPvDvcadqav/8YWd3I8TOil
         Q/Y48w/Kps1mSJitc2JuVg/byQzxzBTKbKSX3QtqL6gdDLK+l13jtHxPpYFYHAESl11z
         E7a2Wj+3JrAYb8oU96EcCmcQmrx+zfp/1Ovb/QGRXVg9SodxxN9QYqqcUrh1CdM5X1uw
         NIydOyVZJkTLNrjfo4jemscWVTHYQ2xEYaKI5ipheXGlZP9vYLxxBCFIiJ837IiwigoN
         a7uHrgRae+RVN7+Ri7w6XJt18ZBhxcpVoKNedt35J9+j5fXAULXIcD4Oe6fbG07IkhhO
         xqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661382; x=1747266182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAz2QB2SUYrr3XWzF2d2hg/x4+UA3WdNJnT5uCp92aY=;
        b=K8OrtJAW0/DymdI0ZE7A6ZRBh1IS8q0UL+0V7dh624ae82IvN8Y7h28fIaD3b9WRKW
         pvNOsrKcKRgWYnSWO2rEIniUiiJzjNZru03sZ/gVjjp8oOuvPftbEaQTh4DvmFaqcCZ8
         H0Y9RFlv3n+63swmheENcV0nW5Gg8B8tbPowJxwnOJl5DKxB9cmYjyDbWH2hyYqQVIqP
         pYW73GvCE7/jV9k60A9MiawoZ9XK6HJVfmO+UNlaU47v7jtWPya1ue8Oa/4UZbnVAegJ
         Ztl17OX7dpxgLxef42MFWVqDi+OrOXOWLknyaYmP8/6TZaOftryA1A9sPgEBJuJ1fa3Q
         G7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU7fDTMQMIpJAxgLu2kLj+BC9Xkh9y8cju+svs2rl4fWOoIIYaMI8RHMYNSzJFUsTR7i9uj36WmYL1Dmg==@linaro.org
X-Gm-Message-State: AOJu0YxitwfRid6BuwU30McyXesdtm212/S7MWdFXyyW3EeDDMDqKjn3
	gv3QuwSE9NiWs3dXEhIngoVt41SdVMF7/OyfsWUswDYYmUITVVwFx8LcCqF+0kp/sRCwYgFJOxj
	eZdgueIqL
X-Gm-Gg: ASbGnctbxxq0R7XEwRfi+Z6YtU9siGVMgwG2ZdO1A9bIdczfMbo3n+j63s1NvB8evLP
	HaY6ApQouJgwzHf5QwPrU67+f8Z7/XUBVvEr+wyTdBkUwsN/DPPmjYow2lH6UA7BUAVkuk5EayB
	VQlX0VgDyyw0cEOdzEwjZdxf3Q90fVb7WwdqRvlKtj/Nxlz0+J3BogHg0KVOqajvRpG3qXQ/3jq
	Sw7lhRoA3zjEFB+421vSi0w8rxhCojJc+MnRenPw0Qeqcp/PhWaFftxU1JwAzB1hlFkzjf9DthE
	zQWwGMn1QeUBtxlc6rkkz/gdnzM6j3jVg/jW9SxO
X-Google-Smtp-Source: AGHT+IE38pdekqu2nTYznWLfBCmnQUl4ZsEQS33bpVJKG/HiFUEGF9CqGv5eA2fH3TQAGtumOTQcDQ==
X-Received: by 2002:a17:903:24b:b0:223:325c:89f6 with SMTP id d9443c01a7336-22e5ea1d4cbmr90104005ad.10.1746661381800;
        Wed, 07 May 2025 16:43:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:01 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 21/49] target/arm/helper: replace target_ulong by vaddr
Date: Wed,  7 May 2025 16:42:12 -0700
Message-ID: <20250507234241.957746-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6AWFbEoEaCbp

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 941fc35d24d..2e57fa80b08 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10621,7 +10621,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
-    target_ulong addr = env->cp15.vbar_el[new_el];
+    vaddr addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int old_mode;
     unsigned int cur_el = arm_current_el(env);
-- 
2.47.2
