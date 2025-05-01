Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19680njj;
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWokVrT3gtDtOF+bJ3gaxcmwU8W3167A/cxirD97/OjqfGprty0k6yGT+cvgKhXO5BmM7kWBWqqKirnvQ==@linaro.org
X-Received: by 2002:a05:6a00:3cc1:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7404919f639mr2133781b3a.5.1746080655166;
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080655; cv=none;
        d=google.com; s=arc-20240605;
        b=NOpZwLU1rbiBo/Qx+mR87FQydm8mXvmoWq3WfwCx8snlfVDp+m8EJFVycZoqG3TYzt
         Ltm1KaPT4Zbs7egjyF78mOdErWX4weTNneNhD2LgonkDI2cGMPInwWd0VM6c3QaJR1jw
         5FmDYWiRxazn84R7aDm4PwQ7J2M5MVE/5xxnlojRf5XyAX7NOhgzGmD8c3Cza2stiO46
         64XQFTa3b5l5qiiZePItPsdZ/7E6pv1G7WkRT0ymFB6M8Rj+4KpM9IYNm23cQGRGgJ5/
         DeQ56Sy96ryjpX3b3XcDM1tnR1dgM+dl0VUoJQKguVQhrFI7Dz9X8ECse9L1fXHme9r2
         gbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fFKnCJEsWbUz8XpZfd99k3cLIjXrE+Y/dzrUU3M9eY4=;
        fh=Yvm2ePnfl8pPRDcEDqW/zwsDD10akRhxmjjqyD4dcXc=;
        b=FmbtVFjdm2wVAlcjqpp7RTafKCLCOxEh9YnSQwMfmYhPNsrwgwhk52Smba3I5j98Yv
         jSKaZ/7Sdc/B/YrbWPrW2VGvNndNw8b6aU4gj5bm9PXzoBdnAAZ3uW3FNSheADawKHiX
         s9IJm7JvMir4U1cVzried+r34EExUDp9l803E7Eetsl3xDFVbtn+CQot15fvFcSaVrOM
         X3WgXk3BHRE1xe0l0a+j82WOYeirlMzmQ4l72v2PN71NiUmSoNKi9fPsMYZeYqvn6CIi
         emGMvkb1+wDPoJ3cZX5KaiHCZLGksauEUTXdGdb1tmppGyvrPji2z+oVK/zNsjucVDKN
         hcHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S5Tg0ytQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea306bsor119377b3a.2.2025.04.30.23.24.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S5Tg0ytQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080655; x=1746685455; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFKnCJEsWbUz8XpZfd99k3cLIjXrE+Y/dzrUU3M9eY4=;
        b=S5Tg0ytQKWgDKStPP8hKPie2G4VBE8lrcCDFPj4V4Ykn3b1BgICbcrVNTn2ONYtALK
         DDqO/xzdsY8yy72Xg5jNOADPaTepfETMxr7QXU1mqByvXo6cYm0jMk4pkOhyo7KrUmVk
         IJarB1+t38Ebb2i2AeiMxdiKam9ObEDg7IIv/N6pAjnWPUYRVvN4WUeF3TjqULLU4f5+
         XgEWzY9kBMQ7XEbcXpLwVUC3b1N1g90NH0/bF2x0F/cdnETyRc4pA58BfOM6vFDKAmu0
         4YnZovnYnjogY088zQ6iERORPRhVfxj+mO106imdCpYguz06YPqEKaSrIGiOYndn+7ws
         4anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080655; x=1746685455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFKnCJEsWbUz8XpZfd99k3cLIjXrE+Y/dzrUU3M9eY4=;
        b=ZOekxjKXjsxvoh8wYsMSGegm0+T6OwQgcBqHzyXO4CtiE6SzAUWSf5GbNJmLuI7CEy
         dwp3D0AZDyNCl1/KiJXh5NidxrVTdrDQyGb390Wi/LngHNFkJNlFCJJPGmP2iXu3/Eoh
         4o/Ag/Ft92qtJCl/kctqHNR+yg2srx8AOCQVilBj57GJK2eiebzceBRD67WeaAk+HcOc
         OoFhlG2f+a5dCA1b2Uwbn85e0fUr+gpB783gBXV3rncvgHndVMI5SPDcUE/50vdedkH7
         RTvI2HirLVIGZebURB317Ya9RDggELHPfHkXASJxTe+caf2Epl71RwxKsVfvt8C1gWNt
         hX+g==
X-Forwarded-Encrypted: i=1; AJvYcCXRvSHOnt4meujneCo12fAECsucKEHECbducQc/T4+av8j8vmkWk8GzHtCzTg5sCgi2hMnRTmP0q559sw==@linaro.org
X-Gm-Message-State: AOJu0Yy9RQe7wTvfauicnswCs6eFM4VU7XefF2YfDILoJzGsZzyxT2ZH
	Em8e/dAsw1bVzxNTOfjUzcG3LwiabyuZKDg+lp9pPme4gEAGrwR14P25r+g3V3eTmA==
X-Gm-Gg: ASbGncu2eMiZ5qBHEJ1OsCls9Ut/oxZg2Ytf0TEKdcUvV8O990myXEBtV7Bu/dpV5mc
	+7Ubt00VhyqDDsHfh4FNfMrjxDRxwQVh8Wt45eql65mjO0Yqs+1UwNCk6SBSfi4cNi47SpP1h1T
	NxXzz8QmMW9/CiaMY5M/inoZ8ZxNzWbllKPhhRSMdKIkdPLkGThMyJIga97sneS10Dbc3eAoxBK
	b9pslBMpJe6yBw8OhftA1GErIWOK1H/mxhS7KsfJNlPWGe/UrZEvyUx34CD/PsiDlkQiELL00lt
	LKtJ3xPNeXKGr07rhDXreilEL486rgk/1xBrcBCV
X-Google-Smtp-Source: AGHT+IHRt4EsN5RAvnHPj8pBa6/Pz1ailx/SIo7/AvzZvxJwjfgrzXqyG2+jW/OA7KvO7RhZpbUhTw==
X-Received: by 2002:a05:6a00:2d1c:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-7404924ee9cmr2371669b3a.18.1746080654733;
        Wed, 30 Apr 2025 23:24:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:14 -0700 (PDT)
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
Subject: [PATCH v3 26/33] target/arm/arch_dump: compile file once (system)
Date: Wed, 30 Apr 2025 23:23:37 -0700
Message-ID: <20250501062344.2526061-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O94Ww6jAh5nn

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 06d479570e2..95a2b077dd6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
+  'arch_dump.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
