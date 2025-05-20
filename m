Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476523njc;
        Tue, 20 May 2025 05:55:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4c:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-30e7d5be445mr24032777a91.35.1747745717464;
        Tue, 20 May 2025 05:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745717; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeImEfNBIbOwUT2a3teVtm3HqGLwYLiOKc3OWEeqPBNEZD+9Q/quOGN8zAVkRuHmnN
         hNPETtdK0K9vm8uG4tAsd4dpFmqz+eXFtFzaapln74UZI95pQ0LIR+Us28gaMzN636KW
         YL3Hl6KUWlBAsVTmmbRHMKFwBJyngiALSxm5f5/OJQqjk6+i7OGOZl77B2KP0tk/HVfd
         LnHq1ha13sCf+xCPHZHpzsAtpSUlcmmBhbJhKJjPj0hxYgP58kEVhwGGEVEg32OOPsUW
         Hso0mI2FTKmBf/fPdu5DGkcGWDC0AiS7lAh9jCS8SZbuHpFxSR3uHpLoRQaEsWsaQZFv
         sTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pjfIs5gITyjRMKLD5/LED/i/qyf7Ai8DnNu3qgZkijk=;
        fh=kccsKKhUy2h94BWF7xjm+SSPOQsVk70zMstvRNlqUK8=;
        b=hco9Ge1fReyugsB4PPgo+u07mXz18lujl6kGV1PD6w54tECEAWetxhx3f87LgRswSg
         ryAagcMjFKrlO5I0GN0tG/ufLaIN8Hvss+yCXwlaLcKgDIcpAFp02QMPpU6Sx/gtdtsA
         DqIiEVsyZ4YeSoy2WxhpxRMQSWg1hFdUC0hJ/apQJZxtwXPjtUXO4w4Xng/a4HO9UND3
         Y5Sx3Sk8Y8YnIAiU/3tM7Gd1du8L28SNvUq6k3UMVfVxz8uMdHfjNtKCWJ0vuwJQBtlC
         tCbkYzE2ZAGbRsWHZhAmn6dG+rcOALjyCbE+vPzgLgjYl4KSgbIA1yy/osljUxbhIyMi
         sYYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyZwTfWy;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d4835c5sor7266671a91.2.2025.05.20.05.55.17
        (Google Transport Security);
        Tue, 20 May 2025 05:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DyZwTfWy;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745717; x=1748350517; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjfIs5gITyjRMKLD5/LED/i/qyf7Ai8DnNu3qgZkijk=;
        b=DyZwTfWyUD3O85hd9zoRQWBX+iU9Nb6QWB1vJ1htEAikkZPlJ9wIM/IMhs90jzHo9Y
         8i6ulpbhHK/9ghvZelx7NHoxWoUBsEJ8iFfXenvsGh9CUfhaZ7fRoH2jz2AbMWwhp3WI
         eQp0VkqAEZsSCQ2ICfW/3iaypTFsS17/8wzBrqymwr7ppQ+YOU75Xs1C/Nx4lP5fRPlp
         sQ7TOgva3CoA+AGr2bU/gdhwpebQxbQh9qx/87QQzDAv7l7jBrcGoW//yL77n4FHCVBe
         1GckQIzi8ZbXb7t8kTmuTH8Gm/rGEnL4dn+P4kgejcGc5Uf8zl/dRL7qDWzD/ECaAnOS
         oE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745717; x=1748350517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjfIs5gITyjRMKLD5/LED/i/qyf7Ai8DnNu3qgZkijk=;
        b=l8iw/jzWkvigxwaa5TAwnVVtxHMXGJNoyx43kfv2wlYh+G9WQAtoF6Y3N0SHQNgR0R
         dds4Qhi+sfWW0zAyh7QwL59c7UgUx9WY8BTq9d/mB1qLUVj0IcY2XkjOa29aWSUeIwn3
         35m0Ooopx9UcKeiwi1D3XqXeWoGVv9yBeM4wlqLqHrbupXEV/EQj1mwegTXYL9ul3s+D
         2eafW2gF9XZLuONkWoRgoscJYFD8GvSAb2ZVFGX/eLtU9AnObl3ZIKOZ18xF0wGhnQ+w
         bLacOzHh4NXdThnxy8MbMFL5iPcXfhhggqo2OPG6PxcFcNJqWiWMzIcqMeMe7xZgWAde
         R3kg==
X-Forwarded-Encrypted: i=1; AJvYcCW5sXk1AYIjA2e5EPMBUG+fAZZvqOh3pYoMzih9SQUzLHTkggqbhj0EZm/dAFkI8v+o/9cIoNc=@linaro.org, AJvYcCWDJBTzUBmlvGB3VeSWrDuTAxRX/GEP+EjdVW3gLbgpDOzN+9jsjXqhkV7JVZv2GpVqh0xrU4Slaeht0v5lqgVISw==@linaro.org, AJvYcCX+NnYBNzMECjV0z9VoT7bTyOEUigobCyin0aoNBVERGKH5q70WKEr7pBNJilu3eBT2QbNF1Aw7A7pp4VqtxwcADLI=@linaro.org
X-Gm-Message-State: AOJu0YxvLpWZu4SsnpO79LDvR/54b+2gOjB/dYqTAV122VtTsdtUhoRU
	OJVYmedBqrjx7XhbGWqB5w6IU6UWOob4yBXeYOwAixvlBsR/epvfcbi6
X-Gm-Gg: ASbGncspXNUHzRb1D1CNIENYizZ+8dq24vcGfA00KNbCDAydZBg33Je7vAQJusL9H95
	ARTDsP0KYfyHOPlRGFoWw3DUFAbllrVOJhseZrJVH1um8KLtmN6nV3WWN4Z8vNq/cGIvLt5JQMN
	85KVpMc4+bCrIucIax9t0NSmWoO8jtX0MmgFm0LXreLIm1sFN487H0Sbp5CyR/Qw9aa5L/7EqnU
	UvaaTekXTfJ1j9pQlQt9FiVZhidn50SjGfJIAWy9+RxD5+YLdDzY2JfbIfB4Ow0kBzx4/LdsSd4
	EJ2+5E/2VZWTuf2cs/pKsHAIcqh68MzptTVhxVz5zoP1faYycZP7CPf3+6TIKg==
X-Google-Smtp-Source: AGHT+IFctWoCBwXZjWVIzlvOeAGpN4yYvW8TpdBxj/ko0x2Fmf9rUlfVzBwaYGHdhUFZEuZxeGUt7Q==
X-Received: by 2002:a17:90b:3505:b0:305:2d27:7c9f with SMTP id 98e67ed59e1d1-30e7d555aadmr28951571a91.16.1747745716767;
        Tue, 20 May 2025 05:55:16 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:55:16 -0700 (PDT)
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
Subject: [PATCH 32/33] meson: Propagate optimization flag for linking on Emscripten
Date: Tue, 20 May 2025 21:51:34 +0900
Message-ID: <8d969f197a9b3785fd6bca4ec57e3a42afdf62c0.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZzgrduW3iBuK

Emscripten uses the optimization flag at link time to enable optimizations
via Binaryen [1]. While meson.build currently recognizes the -Doptimization
option, it does not propagate it to the linking. This commit updates
meson.build to propagate the optimization flag to the linking when targeting
WebAssembly.

[1] https://emscripten.org/docs/optimizing/Optimizing-Code.html#how-emscripten-optimizes

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meson.build b/meson.build
index f6ed867819..91e182092d 100644
--- a/meson.build
+++ b/meson.build
@@ -869,6 +869,10 @@ elif host_os == 'openbsd'
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
+elif host_os == 'emscripten'
+  if get_option('optimization') != 'plain'
+    emulator_link_args += ['-O' + get_option('optimization')]
+  endif
 endif
 
 ###############################################
-- 
2.43.0
