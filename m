Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476562njc;
        Tue, 20 May 2025 05:55:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:1088:b0:1f3:33bf:6640 with SMTP id adf61e73a8af0-216218e73c1mr26351081637.18.1747745722410;
        Tue, 20 May 2025 05:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745722; cv=none;
        d=google.com; s=arc-20240605;
        b=DRP/961c4waXJGeLrFWizNT9Z6tzWLyyovuTRIVa0pWTf1lsAnIZFJuZj7x561p1Md
         pOVDwvNdsfE7EpuLz3PpqgS0l35zlOFjQVNvllOv/Ag6A749t059KwoINjIGQv8AWBsm
         dYfWPRnQN8rjy+fOxnadDIpNPZ8z4KV57MBAeNBuIH2odAMhTROw8zEw4kww4JLga/Vv
         gkrdIMEdYn1uJplObTemIw6O/7C85O5hCAFZpIWOOSuAc9mtvLJ09Y4noL4GI2ndPe40
         I1xJwjXnwrX3GHwLjNRc8D4PdAWpbFwcEcCK+ZkhqmQIX5OkL4BrqHj8vjX59VgcLKtO
         Sw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=byOBE0LXqcmVn/uVzQGaT6uRuP0TTdALhSny48CvJBE=;
        fh=QtJSqKYyWoQCKs6+GvSZS44QRq+Fr53K7V1UZZmsFws=;
        b=IU9rtOYdSmXNYd36w/pEaRt8rjsjDkog824IPBnzyiJc4zWVG01hz/D51xhpkh4MNO
         AlObHmREg6K+rojlUyKE7Rl8SBSFCsaUzMCaf2CAFFX/AczRsJJ66tZUUjbeqAqtBWgo
         8MBMfhd5DzXE53N7tFSZqHB0jDRimNpF2OWhxBLDHxDwDKlXpyGs4yPCAtfO0luTdbaZ
         vgYr2D5jwB0wxcYB2qRIWIokwf1GvgeHWmnh2nVmp0rNegyoN4zHCA+fjMhvHjPcljVL
         x8awnc15LO1WNQ0E3UdWiZAWUW9Zyh0wG6ZecOj6e3HwJYPSyxqW+XYrnrSeMVf+KPRv
         Xaww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=baIlrLWV;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb036f79sor5803163a12.3.2025.05.20.05.55.21
        (Google Transport Security);
        Tue, 20 May 2025 05:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=baIlrLWV;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745721; x=1748350521; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byOBE0LXqcmVn/uVzQGaT6uRuP0TTdALhSny48CvJBE=;
        b=baIlrLWVL5e0RQ9pZiAWjJQvlMh09vSaU2G3Tziu3uV7QECHFz3lXgl6fauEbir2VD
         PMLAi9Q9znDHu0HpkV0DmO14cVemu9Buvmn9+m1r/rVuh+JKvoXKlND6uqkw+6XHWNXQ
         saKnRFXYc718UajFzOJJ7Y3Ti+1jo21AUM5IrbLka8+hJ76Hlbf+Cy7DDFVCRE0lmwTd
         pFWGyWyj+twrCeZkks2vBDo2VBpAl5HMigmv0no29JXnwguMjDQ4MePyXRYQTq4v0DOl
         JDSbrsgFJxudaxeApw5BshG+csGpNjLhj/4Pq3obLRUs1Vo3CXnihZ8ZwFjBOnyyK6h0
         Mvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745721; x=1748350521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byOBE0LXqcmVn/uVzQGaT6uRuP0TTdALhSny48CvJBE=;
        b=jrnDCd9ifEE69L/xp3y4r7ttT2rPno/JjDXLwcRYWT6CCUc4mD7FnH+z6UZzbWhE9W
         ZpgE0XR92SdywrpQeb4pDYqoED+qHHfDbcoWeIG3pSws3bvEDezU6S4uf2KU73VOsnkn
         IjDEprFXnn5MeD6/O4ET1IZMlK0BltTG1xPxBNaMlv0pqxuz5puKk1mVDGEFkuEGHTu5
         /CPmRHfUT0NSHXNnfGd/BHjGOk3eVC/NYYDHU5KmnKsCwKjZCcAOVaQc7GfQeCbkkCwU
         b2/0J7WptxIT1IPRDJMe2tSL661O/O9cO6lVGcRFf0BsBMdt5sMca1GaXuMKR6al9G1a
         G4vg==
X-Forwarded-Encrypted: i=1; AJvYcCUQuVPZ7DknQu3M+OJx0z0NPFmvd8UvgCkaEmTRXowvFc1cvp0oxoo8eRpQ4x0Zs2EnHb50B02d7n+zURm5nJOgAg==@linaro.org, AJvYcCUgW0xoC8ia2roTqZYJWlGCeG4HK6cnnAez/xtTUZJoz2xMPh6gM2squKrUd0K9M6LOK+xKMRyHJdoYhB/2JB3Yje4=@linaro.org, AJvYcCXvXLyIx9tTg5nEcmGCzM//S1y6Oq1rwHy2AtLWao3XqtqPUvHZZRPgTi/VU4Uwtng9WBaPnDU=@linaro.org
X-Gm-Message-State: AOJu0Ywf9QS+sKPE3GKZxwbZG4ZcUyMMOHcgwp2ESDSqlFRh6POW4zl+
	cG13EMFezIhzHRnEeHabFLiBPej/QD/0cymB2420iy7ngO0UUomwrmGX
X-Gm-Gg: ASbGncvRc+FzzCjWJ7pz7j+pgImIlJZZQOK7lqGkou8oc69hzNOMu5QEl/gkajBFKwC
	C5X63p3LRAaNGINE+T/X1vFukFDr5z7yWCAzyjgULGOJJ3GKTuWEpTueaIB/7YEJava4AsUg3rJ
	WKiefskOOsSlLoU+DuNbphggNHY56VxfjYv1UmxR4xFXq2/fGouBdaMW7Vk3nCivcbhZ9EP2m4v
	1qXBE//iIKACEZiDRLAOgmm+t/ykWQXuMQIsjt4kF18+jBR553TYg2nU9P5vR/TDYR8TdTF5nQV
	HsuFoPtX6eLbeSoAz+0ze/25DTBWwo7VHT6WobeAhStjvHeb8TA=
X-Google-Smtp-Source: AGHT+IHCNeXOoJTyXF78Adx/1Dxrax03p01KnXN3FbNUlv+jV9FjmGCEvba2dD4sWsgzbjHjN7ba3Q==
X-Received: by 2002:a17:90b:1c05:b0:2ff:5ec1:6c6a with SMTP id 98e67ed59e1d1-30e7d55ba27mr27946322a91.18.1747745721589;
        Tue, 20 May 2025 05:55:21 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:55:21 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 33/33] .gitlab-ci.d: build wasm backend in CI
Date: Tue, 20 May 2025 21:51:35 +0900
Message-ID: <36a7f4334e9e08691d7496809a5d06b23de22e26.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9+9ng5rwbPWc

Check if wasm backend can be built in CI.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 248aaed137..fc42de231a 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -800,4 +800,4 @@ build-wasm:
     job: wasm-emsdk-cross-container
   variables:
     IMAGE: emsdk-wasm32-cross
-    CONFIGURE_ARGS: --static --disable-tools --enable-debug --enable-tcg-interpreter
+    CONFIGURE_ARGS: --static --disable-tools --enable-debug
-- 
2.43.0
