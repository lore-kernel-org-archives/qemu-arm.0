Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19644njj;
        Wed, 30 Apr 2025 23:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMEflqGWOPn3oz1TWglsbqBzRxEnyJg8u48AxXXPIG81WGjuIKKuINNrPN03okhSlToJLR2rrwg/8sUA==@linaro.org
X-Received: by 2002:a05:6a00:188b:b0:730:927c:d451 with SMTP id d2e1a72fcca58-740492600d1mr1992592b3a.20.1746080652405;
        Wed, 30 Apr 2025 23:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080652; cv=none;
        d=google.com; s=arc-20240605;
        b=GlC8hc1bvkWgibdMJF8R8waVhXwE0KoXb9PO1xdkLf9itq9EasEMG3DutndNds0qau
         EwffnTYIV2A6eJwIL8B5mvKrPjYxo8Tzyejr72Gi8xC8zWYbLRXJPotnSeVb9H5sNS/m
         +GdwAWkF02JNaCsCph+XGQnESXqOYRXq72TZghw+hnDcv6sb8olMdzv9QSdMaSzQBby7
         VV8J/GQg6yj/oyLd6xnfpEE9ed7v/j7vlyBNmN9iFwFRA77Y1cjWy6tFl1HGXlKMyM8h
         di0d7p/Dg7Iunl1liSv9fr55SxVZg3OasrYeCs3FOLvjFAyvoU+Hfk1+0cwZwqRJgFRM
         WpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=miCfOFxcLwOy1CTNdjQhs14VDpxTa+yf7od3eWjLkPI=;
        fh=wKI31QW0QR8iwZd1lXS/J7g19cJ4X2lDOviL544srkI=;
        b=GEq2pPUwTGHyFWUJv9BV56UvkVghI4BfbVWyEmM1KcxS6rcPUm5l+Eigw3RizDkvL7
         ztWl64FNHfhQ+PlywQTDESFuu80VCrPws7Fw2Njn3jdbExtoPHjxdD7O4aXlRwZ4jUuk
         NlkQM4haUQqE0dIo8zrAwe0rNe5djXcAVbVrnoKPgxQ/Pa9xR3dX69p0+7jqNyI5NKoi
         iHCjDLMSoT0Dfgyrz4KW9KJixr9LG0BKRrlszFuSc/egXz02BzkmRAa9fA72mQLm5+lU
         Y5KcMMlG0NeFOaXVw3y0ptarcxGCf7excZBmCHd97cq0XrUPBHkHqgWPh4WFz4ut84Ol
         XBsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBX+LoRT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e9312sor64448b3a.8.2025.04.30.23.24.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBX+LoRT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080652; x=1746685452; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miCfOFxcLwOy1CTNdjQhs14VDpxTa+yf7od3eWjLkPI=;
        b=MBX+LoRTxAVzM77/YzRRdOWJmiydbkFXkgQ5pMrtN7bWxRvD7WrsPyLqOCVcW6e70f
         ZZ9MunFXoZliwaCqpXiBP3gyySZHBe28SH49AU8U+bcBr9g7yPPODMb0rjNSOaexjz2z
         Q3OwYP/geV1wduJcqlql69GDXPXt1uBOtVVNJsntbPO1jPoMr1AvH+G/m1aJBye42Zuf
         uqOUD3BfGYlF/xi+8nTtFXqyVHrkkM9UUO+Yh9twnam2NphZwAX64w+pw2aY1ayxxMWn
         sj3cQyyonCUhy9zMrHtmmukaVC7FYS6nA11i966/QbznFuCUlhNr+AY+KubocX5MPDjU
         v43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080652; x=1746685452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miCfOFxcLwOy1CTNdjQhs14VDpxTa+yf7od3eWjLkPI=;
        b=QOQxzUFqHanVCIHcfw1MqqTUat+aeaFnTg7mi4cCHpnpWfX/g9iFMqyrS62j3jaI/L
         fs15+4ga5fuvgGy56SpSeSuI6+dosXkF6pTBCISidyGjXa54pp6xlhMcI4bTY0d/a1ry
         jRkOmeNMGqQ+pI0rXhKCp2nc1e/Mt+zMQUu+qcB7gvn5UkfRhxW0DEV5iKM0fNmutHbl
         +LM8wNYWXsLyEyG//JJnASaJZDPSkhXZAuoKMn1p570j/FDf7/GyXVI+PPPs+uq97tWP
         zGqpbgiQXa15PiidpFfblTFOyuhBalbPGWomJy8n2rP3S+piG4Mcl7K/SBX9STaO1wn5
         1WHA==
X-Forwarded-Encrypted: i=1; AJvYcCUackVwE7pOOJKUQvM2PdymmeIioYIdk50ofvVOuNeB7Wm0zr+6G2AIJEVuPkTMnRj+zG951JEKFFcFyg==@linaro.org
X-Gm-Message-State: AOJu0Yy9leVNTy16ydDvHc52LkUCJ0raXYmqBhccH04HAcBvyeoY48IX
	RsjfObiN3U99DIH8aMrHOhaibI/bGGe1T2SLOIuaalTWfd+WUA65lpctBxRuiQcQug==
X-Gm-Gg: ASbGncuHP3ggJZP81tXlfPATjcVZXzSIR3q8LZkxxHNrKIDPzQVyNS92r3w4r/Va+4S
	YJaBxn+jPwPXQX7C1VIB4W8n3eoakebqzVMFueweOuq/lC7ZJfX+4DqQiiR7ejN9Wh12OJs7K5I
	BoqMK0xhRJbVevQugFh+kQvhlnXQaZxMcElQDyZmkkOJv6WTMCgL6x6iImVzbClNdyb3GSdrCay
	kHHIYWbuPAteV77JMpDwsLuxfigb/V4boesWZjcwIXQVC+XR+ibBDXOdCe0pTBUc1hxIzQhHyt+
	+7OanUUZ8p+QIgVTGnNncle9u+3A5y0Wh4RZ8ppH
X-Google-Smtp-Source: AGHT+IE4iNMjCRGNXv/fseoNykwPT2G0LRq1qk1LIkgMA+iLCoJoZ7bKEIOylarNXH7Ek9PQxpdm2g==
X-Received: by 2002:a05:6a00:188b:b0:730:927c:d451 with SMTP id d2e1a72fcca58-740492600d1mr1992567b3a.20.1746080652023;
        Wed, 30 Apr 2025 23:24:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:11 -0700 (PDT)
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
Subject: [PATCH v3 23/33] target/arm/helper: compile file twice (user, system)
Date: Wed, 30 Apr 2025 23:23:34 -0700
Message-ID: <20250501062344.2526061-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nkFqRhDLIuKO

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 48a6bf59353..c8c80c3f969 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'helper.c',
   'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 ))
 arm_user_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -39,6 +39,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
