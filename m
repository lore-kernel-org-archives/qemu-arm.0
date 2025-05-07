Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94495njb;
        Wed, 7 May 2025 16:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVTpmAhVspM53FuuFXrhTMDYEYGYfor4LPSrXPZSGpHWkHpr0flHLoZefZDiXHRwQC12ZNXNoy/Fz0WQ==@linaro.org
X-Received: by 2002:a17:90b:38c6:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-30aac18622dmr7696448a91.2.1746661397087;
        Wed, 07 May 2025 16:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661397; cv=none;
        d=google.com; s=arc-20240605;
        b=Ko+htiVr38AojJAoJGi0hgL/uF3a1roy52nQgy3n1Uo9conCTSkhkTkcEcXMw9ImjA
         De7iDAixV9/LvfSTFzFYct9q81IlYb8eM3D6jyfaCygAIRL13cAmncEo32CGONCNcjmY
         aCTjNCi4X/Vot33G6O7lK3Xbhxtwxb2cLxaUqo2qu1awSrAsF1MtCtl5GzOZuqE0Sy6a
         Hjb6cVJwfgNCL/SOHHA/fUK9dbwM8sl2sQ6kySSOKjpscHjdcM15WIPeqL6dSre82N7f
         Z3SQo5X/u0pYTu5jzSHQixvT1wV/hYKMzj+EjmrkouWro+8L20GxKcuCd8CMQd1ezOp5
         NsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        fh=aSrKLeVhgJB3F03g09TV0g52TapUbflNBl7RTiQdszw=;
        b=SbujYLGsUTgny5O2Bif1qy+V0q8b2K9SIoU7LobAQj3TcJ28M5HJTQEtyJBLx9hK3x
         2wUIGeRyjlAeqFQLmYroOjWJ9VUC6omijQBbK46wFXAA2FMWCU7os5MPtQNraZTN2wnt
         skv+263C0WueDIKZPJdFODo4K0CYRGYiRMWQBkl729MqMZjkfYnrdpxy5b3b4CDfa9/g
         /rcZMnRNTtEhmaZmJw9Vy3OzxBoEH5XsklkNaBSocp/jETxyXZPcrcw1k5PRiJzljTvU
         ohmTf5uewJY2Pq+/cgdAF8reqit8jV9t4C4IzcbbpUjjNGTpoLIBn1xvbIzK4tk5j8Zy
         Cl+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pxEBGDpE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30aa503b9c2sor2149258a91.6.2025.05.07.16.43.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pxEBGDpE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661396; x=1747266196; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=pxEBGDpE7iaDCI8ej6o4lvJm8yfWIxocf1AKJzHo7lhdg9/7KdG2p3enwnIz7ZJltj
         kBKj7k3hfHa23xcMzQ/Q9qTe2KB+pT6sWpFEbyw9Tb97zCZFIr4KHg99ToNDzOMaPzFF
         bxugAylJXUU2lUgrbZ8Px2ZtT8eHFyDvGxjAGTgci2xMlotTZYY2IaBNL3QtGQLmbpWk
         SS2evmB02uRJ3EdwW6NBtiu7Lm6yXOcvkqppqiqQdVNXoD6QHZx+U6TeuiI04bBPe1ek
         brymup+Te7umeaoLBjDvn65kQjItgA/gnIS/QpmV08zni68/07uzeFSUNGB/cv7j5L7P
         +aDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661396; x=1747266196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=MsCzGsOkj9d5ZlczzkVr3pjJNz1rAsSlbLu+54YNFBOe6fUbxHRxdDvlwVXU/NTWHZ
         FZGMphkfUy/f+SDoX8PU58VALYAP4VVmFLsSVH1dqZT9WaSy3AeErPp83j6QPwKUJUBy
         7ygSBP9pZ+pnuxYGHF9Yq29c3TmTZOb7cnrZHK9G7glyU9K6bAvX9JBbm1lS9E+BjAVr
         aFOg1siPtf145+wXhjJpbP9P++OIMQ5DA2bWocwBwhR7l0LbdK9+AHxlato1PsLG3JXy
         NjXAFajpwYBDQxmGoY/bahkxMTKuvxVIry4LTw0mrqTJsFEUm95CjKB4kgmOABCS11Rw
         hlRw==
X-Forwarded-Encrypted: i=1; AJvYcCUBih3wFsAMICAVLbl0XJbQiObpESA/22+7cMl5krNWoVu5S7iEh6nsQTIGlqP3ALPTmHCWB6xJnB6YNA==@linaro.org
X-Gm-Message-State: AOJu0Yxs4KEWhlK2Dq+XmvO8DvQaV6JYZ0EYy12/ZfQlZz9E5Dq/F/XS
	DwuYI5cH3X196wMTDi2/iqSzDXNESpf07GvZHRr/X1PnEFT650rFWWMIfhl5ySGQ+A==
X-Gm-Gg: ASbGncuSbmtDAnzDriGQ6c0loOg06QgRjPycClZTB83Rgp5zE/uC/vyf9hHPMqxV88j
	vyWz9iNWxVlsMAZ9tFfRnh8tvfHrw2Bpeig9woiy0RLN2MdBQ49yWK/BMtIYbOLgIPY8mocZFN/
	0UTqgiMdnjOyTWlp2/3oyDPmyn2MqOS50l4Uejr9O9sClzcWjDyr/bEOWp9aBrQyQrEmeRwzpCJ
	7kHoZzr2HiCq5Bsl+N2o+sGpA1HODQJEzh/hdOBrMzTFaDGpvtWJh+uMLsVV0mTFnNZxophHqUO
	0TWqtE2k2r448jbkChPjcAgiPVmsnmVu1qlV7z/b
X-Google-Smtp-Source: AGHT+IGbXpVTbR041CeMnGcomU3gZeDQGJYdsxW6D2UWIAmpkewY+S/xE0Eh1L5Jy7l2aT8fMDhxzA==
X-Received: by 2002:a17:90b:2d06:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30aac186270mr7642172a91.6.1746661396688;
        Wed, 07 May 2025 16:43:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:16 -0700 (PDT)
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
Subject: [PATCH v7 39/49] target/arm/machine: compile file once (system)
Date: Wed,  7 May 2025 16:42:30 -0700
Message-ID: <20250507234241.957746-40-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QSuj0r9q3RLN

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index bb1c09676d5..b404fa54863 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,7 +13,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'machine.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
@@ -39,6 +38,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'machine.c',
   'ptw.c',
   'vfp_fpscr.c',
 ))
-- 
2.47.2
