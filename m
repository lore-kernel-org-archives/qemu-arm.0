Received: by 10.28.91.67 with SMTP id p64csp1200976wmb;
        Thu, 8 Mar 2018 05:06:32 -0800 (PST)
X-Google-Smtp-Source: AG47ELscxiCuvObP1i8fFbnJ974GbaSQEnYrRluPZe3YR0BkGE8L/JVZjldMFP55cfNcM/9FnjUA
X-Received: by 10.28.138.143 with SMTP id m137mr18867966wmd.85.1520514392081;
        Thu, 08 Mar 2018 05:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514392; cv=none;
        d=google.com; s=arc-20160816;
        b=gvhPqfFqlnVHc7XC8hgw8jzIJ10K8HnmHJxzE9kz1IhRJh9Xf1kd5Lo5x54ayiNDCu
         kZwlXQKfklCn4Jksz2lP3v4QzJIqepub4QzVOnKKr/hddydSWLb/OAvex1IGInqluNSd
         q6MvbfdC+RHeKg5H5Hp+M5erKckeuqZuK4DCTnBeZamrsChv7s88i12bVR21vKaIdHVe
         Ko1uc2Tgi0GV2jgeRTHp8+37ud6pNFX5BtHpLqijrt/Bw9V7G78xFtUllDlBZsExHL+A
         pjTi0xODuQT4C3yyBOEzoTFKEUuZSRtOxlWCAWhu/5C/TVI58uup8PdlOiiNHWWZVw4w
         QW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=dJz6U01+3phS1hrzCLSyo5aW74v7Fol+ieZ2/Cp207M=;
        b=Mm91MTvnmyVi0S+KfBuzk99CcvDD+gXpGtMF4CD09UYBGj3sYN4Q9D/6d4iHX+p79B
         VyQnu3vcgEpqChGBMrQubPbeJpNpC/wgk4qBeM66Q/zN+xyMzY5XbvsOA7H6At3v5Sjb
         x4kjImnuacelZlVPgxMehpBu+fl8H0rMJcE1P4UbF8q8XuaRUCKMawWd6SPZ2/2sVdaE
         jyFdHwq4njcJWPkTQxkMnTqWYLVqL5CvTCQoLMspyoy55qfBsOFQ+1fVpV1bCKxN6VKz
         ZJE2iUP2M2AbWrFgwkUJYjn+irpoRDY8bsWJ6zuZW5VOwFmuff4ods2CWSAxa1GCaAeK
         AluQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p3si15141038wrc.201.2018.03.08.05.06.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFf-0005zS-KW; Thu, 08 Mar 2018 13:06:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 5/6] hw/arm/virt: Add "max" to the list of CPU types "virt" supports
Date: Thu,  8 Mar 2018 13:06:25 +0000
Message-Id: <20180308130626.12393-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180308130626.12393-1-peter.maydell@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
X-TUID: U9sdRuR+3u2E

Allow the virt board to support '-cpu max' in the same way
it already handles '-cpu host'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dbb3c8036a..cda4b83586 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -169,6 +169,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("host"),
+    ARM_CPU_TYPE_NAME("max"),
 };
 
 static bool cpu_type_valid(const char *cpu)
-- 
2.16.2
