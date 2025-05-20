Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475110njc;
        Tue, 20 May 2025 05:52:34 -0700 (PDT)
X-Received: by 2002:a17:90b:528d:b0:2fa:15ab:4de7 with SMTP id 98e67ed59e1d1-30e830ebd92mr28757627a91.12.1747745553801;
        Tue, 20 May 2025 05:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745553; cv=none;
        d=google.com; s=arc-20240605;
        b=L8C8PJULpCfJvrlarSR5M/ODTcJdKcw9lZk+B432hbUZTZe13QafjKkz4CYqv+o/qt
         0DOGekZCCV0xkiEWieIm1+Kgf8bqxa323NlwxWV/QJFp3NRxP6+8Lshfw+CzLcezO+SZ
         Yz7TkOkIWwdeLKaRE5igSxyE2NtbBssh+GfjOHLPiQB0BodzhT+v95T9vnoF8cl2Rw9Q
         QXHefV1CgnMK3szzkZdPNYDS3QU7DmzrMmF5/Rzwj3ZOoYw2IY0YBv0RkYadWGGYnki1
         8eMiwDBiFPNiaG2WFwAK9NE2IAZ8mUK0QzlxnMHEpFGTsPWPyacbcU3Q6TeYAqnuWPJs
         IyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NZx+To6+GeRUeSP4cgenq374zNADHJo0hk3kjG6JK1E=;
        fh=tkhApB5hmxIO1yw03s3ejQH6kFZrwULyt47JL/x2OH4=;
        b=VKFmRJ4q0Dz1qEvpwcY3uziFo25Nvc7nEQ5U0trlbU57rirfDTaZqIpqJp8iCwinBd
         qli766VhGWA9+UWcxHoCY1wuq376UNo4SNmaeagQTVsHFehSf27OYkqBH8XgSwgGlPoN
         Mi1uyiPLpTgFehYKhBm1k+cVJ+wEFjRO9M5bJPyyUn3b6oIow2/p0vnHsSfjNq0ipA46
         gyC+Fhk+9T86BnMT4hieV2PtwianLgfHTZHFRLETb0mVETsr1oOM+O40SZ2lRk1Szym9
         y28q4zupkYEzAMqyK6ZOQ7AWu5Bb5YK/CPZvwT51iZZitQTIVzPY/tlL8ds0b4NAhFw3
         UXHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y32y7zOI;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e8575cdddsor5102738a91.3.2025.05.20.05.52.33
        (Google Transport Security);
        Tue, 20 May 2025 05:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y32y7zOI;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745553; x=1748350353; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZx+To6+GeRUeSP4cgenq374zNADHJo0hk3kjG6JK1E=;
        b=Y32y7zOIwlvlGSBxq8tDnOd1uPHqOOFM7TnyXMTcPIcgJV4LVsdxy6BTiP1fZb4jWT
         MjbY7iLBe1Bd6RLmeyXDZ59dnGL/2HZfS17qXExOcy3sGEV/xh4G0iG9rM6Axc3Gw0wI
         OdxvFjy47lhcFLzSsQaQUJlRgBtUpg6QkdVkqC1tLwJasnZSw6owKodoYb5bFLtzMUOE
         ZdUzsngQr8jPim8Up8ZgcelIIywjpQ8jW7Kr4rb7qArfWiaslNVAk7Frym6oo/TAQdO9
         B3UAG5iVglmtgiv0+KuvaRfEf5tW4lbpfvkf04K8n37yIpRdtUcT0Fyb67LuIMNb686K
         0sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745553; x=1748350353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZx+To6+GeRUeSP4cgenq374zNADHJo0hk3kjG6JK1E=;
        b=afdKYA6YmBwtfUVghw4GUf7U3Yj7rKwWDbEvp2KYPK1NqREvDLr7vqJcQ+IdhgqQiU
         eGUQJexTtLllQcqxZo1BcKdYaYDvGrMatI+rEB1vPCiXnbG7RNYaaUn/zN6z+9ZjC4WD
         /olMNI9EeS99Jol0OVTKBmGCY5ihA8K5t9xPNUV0qR9fNRl37KAmMkjrjvCZJFVCLcgN
         omVb+RpuqwSjn9WOclcP/LZHr6Bih5bue81e97pMzgy8mC1V4KXVDgOf5kqsU+6iArfp
         TOPfLzLe9ntO2ou4wu9FC78M81ETobEcmkumftdb7JTgc7bsO4aWfkhF5nTV6hmoYv42
         xP5A==
X-Forwarded-Encrypted: i=1; AJvYcCUzRjyRhaimE7X3XwM/OBhRrKAV8ka2rCMfdfYmV5VWASyE0AMVMirBj7SzS6KsnkjgCYo05p9MGiNEPvosKysWN/w=@linaro.org, AJvYcCWEkEXYZR777MQA/dutZbObEBUXZDgnQv7oiye4IZWGlhvBRVLXbDlZDgQQvMIt8tYq3CsvqUmQDagSeZbjP/O5gQ==@linaro.org, AJvYcCWg9Oxxk2DY9Qei4NDFEraVHbdkNaNuvn4Qz2q0nsV3/Ag6r76x/zeIJJrRjAGarbmff2vk69c=@linaro.org
X-Gm-Message-State: AOJu0YzMDcAIwi46B0VaKyTjh8BZ5B962nIbbgEsjBp34WdTdu+GJe5m
	QvCsSCuDEu5EU6rpyvWergC6Tcb+d1bNaounNncYq2RgWuwspgwIeKF1
X-Gm-Gg: ASbGncvipJXaG5MTgb9DUUXiN8fh3PEG0yezJuN0tHsw9PjbqP+9/mWiXPNBdMQGp1a
	DMAjcfaZjd+FosVSkY8ChF6GePTCLqf+XuGIPnZFzbXb4nwLXIqGlozn4VBASN7ytrRbup/rNNk
	X9nODexJBOltGAcJ31AIp9FmdfChjMWgcpd2ahbjurDI40iYNDKodiAE/NY2I2eZQcVgPrQvLvV
	B07Ydi8ymRRHl6ncQdIHz2Hk1eX9uVytGp3CiiHQmTYJiWtW9VKW925BUipOa5vQYJ+F+fuYkPJ
	YcxUw1UGJvNAQAprahM4CTNo8LmRjIytyn+cYw02VxI6qIQ5qJwFPSN9qBgjWw==
X-Google-Smtp-Source: AGHT+IHBlXaJvgNi8ZmIupZbQwe/gK71oK9VqvVg9wYGIpSs4wakRV4DDk3Cz065hGwWCWDovzWzVA==
X-Received: by 2002:a17:90b:574b:b0:30a:5a9a:9fec with SMTP id 98e67ed59e1d1-30e830c4f3emr25133773a91.7.1747745553046;
        Tue, 20 May 2025 05:52:33 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:52:32 -0700 (PDT)
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
Subject: [PATCH 03/33] meson: Enable to build wasm backend
Date: Tue, 20 May 2025 21:51:05 +0900
Message-ID: <cb60bb4543170eaf2f22ff7cdf206e84f1c80bc5.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tnGKD2Jik8uG

Now that there is a backend for WebAssembly build (/tcg/wasm32/), the
requirement of --enable-tcg-interpreter in meson.build can be removed.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 meson.build | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meson.build b/meson.build
index ad2053f968..c533243157 100644
--- a/meson.build
+++ b/meson.build
@@ -911,10 +911,6 @@ if have_tcg
     if not get_option('tcg_interpreter')
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
-  elif host_arch == 'wasm32'
-    if not get_option('tcg_interpreter')
-      error('WebAssembly host requires --enable-tcg-interpreter')
-    endif
   elif get_option('tcg_interpreter')
     warning('Use of the TCG interpreter is not recommended on this host')
     warning('architecture. There is a native TCG execution backend available')
-- 
2.43.0
