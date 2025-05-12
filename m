Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42917njb;
        Mon, 12 May 2025 11:05:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAO8mECBERHA/ZJe9WjStGTlBrRxl8qQs4TdoC9Vszu9Mzv+9QZs9To0IBuEa0duSpSEXsBVLzHl5W6Q==@linaro.org
X-Received: by 2002:a17:902:e88f:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22fc91a56b3mr199576695ad.51.1747073139993;
        Mon, 12 May 2025 11:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073139; cv=none;
        d=google.com; s=arc-20240605;
        b=ho5jvSeAwYiBQ/7OQvCaNpA97/7C6Lbpmlvxw7xBGbQj5r37lsV+Kcf84pgT69LzuI
         ZP89BdwVmHVELMfSGZT1AizJr7zD7bArVRpMMzBVyY++OutXO2L8ijDh3/ipqNjyw2E7
         KZpotacHr9BIr641jemK0cLXHwVeGWaVBzq962MHO1kKaxgw7CL6VOwWJHE0r3F6UYLI
         0gv+RvEbW07IzlI+eEmyThSn4sT/DF3Zzr2hvoPOeb4Oe9uPfi0hHEjqtgYeeiRliJdf
         rpKMK1HHwa+YJOPp2SR791NaEf3VhoYzr8KETC88gh3cu3zAXn7Bc1IqhUx2Y34g0xoG
         JyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        fh=p76WviDiPcV17i1l1Jz/u4HXbarMpumvEBDZ1mgI4eE=;
        b=O3/YuCgHId+u25MEFwH09639WADAcrzGyp9CP8pR1BfDC0wP01+6aw3WtDOb0a6I5W
         5NnedYveUWnHFDlzXZiTdolJ9tzxHxPRnWxtFswb6YZWl/twlJArXcAVs48XNlxhqMxK
         CaaEhA6+R8vNOvz4x0CNaKDLdhfbj6Zb0K9km009uoEp/KJdkzJQ830qUu47CTRSZzpY
         889QwvLgcPDsiVhKvW5kcMboL8z+7MJzSdwlwZvNAY+Lm9JQ+OswkxGb6TxHPXNl9C63
         STDyZb3El7J9wiRMJvi29v1i4EAe1YdIUOvDl1f6gxBrpGM0E9UwmrSIR6pDMdjJk3Hg
         LlPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2aUfYdE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5827f75sor55002235ad.1.2025.05.12.11.05.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2aUfYdE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073139; x=1747677939; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=A2aUfYdEYf3JweowaUa1VnXnAO9lmbXQThVBoDFQLysFlZNP8J+OB5dBOhmqWjaMHw
         Q80Ip8vqd6lqnrz7Wdq0QRAO0E/GXgia9THBpr7hhYm3OT4Q33f60BnecLi/RIcy1uBM
         cgDh1OzxHHXKmM4Gs22kNyeukosXOksSEWBhR/n0/3m2294ayjmTpHGiIRhD5+9Qfgsz
         eNaHJboCnjIuuJeIPr/F4JoD5OPcjkI87jFvSE0tvi+SEvsP55HPm5FGGq249KaRMaRf
         wzwdTf2qbtdV9IRI44btm47vdu1o99msogYxl2nVBDQt9KTYEUy080eECM1UUTBc6+HY
         71tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073139; x=1747677939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=GOe2qXaJia+Igeq3t6ezJWBwcn4S10PDthx6HiOqpNbQcMlEFCm7LMhUjFxBlOkNTR
         e+5S6eFs2ybUvUyEL9oAS1+APVfWB8UOcixACj6UFP1YMPzNC+m91/XKn9RDuLjtSwI9
         dRY2a/N72Zg+1FZ0RzpMRs3JJa8FQDOfSGIqfZ/AFSYd+iuL3dJdbNqD73/xHDjb/xno
         2IcmyOlIO+jG4axbzP2SOtgysZE9T1II4NiJjENTCoQvTdfHaY8JYBe/+rWaTAXG7rBN
         PBLy4kifZoknDIM9YnOFeTzY2cMzUNm5utqPUoYDs/b6ss1XuUBwgE8SkM+jjeTMdKoJ
         cg/w==
X-Forwarded-Encrypted: i=1; AJvYcCUetbJSJvgPN4GNfYq3anVk/KZEVVZ8+SkafUMRFXGw27vUADLNcju87pp5zwzhOmu1UxrPMeioWIHXMA==@linaro.org
X-Gm-Message-State: AOJu0YxcJOg344Z7XY52CbeNwjzvJBOBEsj7uy9k+sGZ059Sf+3i6TdH
	7rAqbxcuvlI6iGxUnWXULZXWbBFZaJZhWszxZ+uQybUJoJh5ejK7kIIejgndC/m/Iw==
X-Gm-Gg: ASbGncsVTFlbGXo3rn+VuAgBN2qSmWRSZ9k0J4vnY7p4RmQJGQl7azLTfUE1pvdOQeL
	rkAItPwH6bzT0OmPQDyp71PRck7szmn9Xcb3KDkQjnu0OR73hkYbcruQ8M7DxGQPjeono39yPdn
	JCKNvwSWv4j/EbnPTJMU9Llq0rVgh98KzvbaAnA8CRNq+b7cB2c/EGDIt9pYmfnVT1aprqWphDD
	0gHELZQb+7fLSk+gjJfW5JMXPnFsfCiY+UsbNzQk4T1F184eoC9dzXt9y6wTpaNHs5td88eDVHf
	O7UIDWL4YnUbpG6035eYbOk0HzavhF9cuerH/Paw7TD0ulwd3Lw=
X-Google-Smtp-Source: AGHT+IGDbYE3NZddHMNtkgUSWM+p6EAgBZsVoXhpxs4UoNfVW5VcAewVjNOY1zxjElB4McK2iuAKUw==
X-Received: by 2002:a17:903:98c:b0:22f:9f6a:7cf with SMTP id d9443c01a7336-22fc91a8c92mr188938405ad.52.1747073139445;
        Mon, 12 May 2025 11:05:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 31/48] target/arm/ptw: compile file once (system)
Date: Mon, 12 May 2025 11:04:45 -0700
Message-ID: <20250512180502.2395029-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IF2qUaXpQMwI

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
