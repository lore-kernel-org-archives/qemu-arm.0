Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074437njc;
        Mon, 30 Sep 2024 00:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoNQ8kA68lGDFrav2sqdzX1hqhUBlrnY58Esx9gRa9YSE7bw6s9CPfiXaxURfBbCIYjIDwo3EfD74GCA==@linaro.org
X-Received: by 2002:adf:fe47:0:b0:374:c616:54b2 with SMTP id ffacd0b85a97d-37cd5a8c968mr9289536f8f.19.1727681762686;
        Mon, 30 Sep 2024 00:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681762; cv=none;
        d=google.com; s=arc-20240605;
        b=TajCv2uB1LfEpgXyCDr71o28AK3WeYqmvg4gqGO5COo3DNYMxMA8hqL8OlxyM2+WFc
         wgZNS3meWjTIb8tCkKxu/u/42ovoV5gh9SnVmdbxabswzxxqCwSUCHd6a+DfENKeps46
         EXwoepml8GkotisGI5vw8LEBP9iqQ2gGro0PmMXyAlFYjL3SFRzD5B6aO7aypL3QZX+O
         pc9dE94SL+VMotX+gM2xIGRhqZR08RqtpqdvYKzmozDFW/N3yaEwO5x6Up3QZGTulzJ7
         B106lqq0J+r4xenDkgz4wivan0SXc+5cK22kh3vohgTdK0Qpfkl+8Icy6lPFfNZDxrFQ
         cjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zn1QOBKpxwHC7pwp1nDkwIemv7qUJthxbF0WBocU5ZE=;
        fh=k/rYUCfGgFgNTSfb/hpdO4U0roQcmTzOj8q6h7+epco=;
        b=IpDlHcs75zCEy790xexMWiqWsGAWu7KVB87VMUSf5/86oQZnTN9Ef6IY0BgT7mQHxc
         P1WB/PGdU4oGHZn4w5s7TfMkTPFzgUaM1rgp3Laynb8blUPOBR/hB5jRaO6XqSI4u732
         1aM16naBRtYAE0+l7MXDAx4N/87jC5R+rPwA4QoauDdvGfcGhEk5pru732F6XgryXgzG
         FIzi8x6irYM/1DAWe+rfeFUuPGNuwo7yYgJWFuomp/eXogi1ogrqSut9KzYGySHUDBdb
         8YYZWhuSyQBKlhItYRt3+e0t80qlwgHuWI9ed1pUO3nefPaTCLPa4B6X1qh2fvEyJ4oP
         /EtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9RiRfVL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5c82cdefsor27043195e9.10.2024.09.30.00.36.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9RiRfVL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681762; x=1728286562; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zn1QOBKpxwHC7pwp1nDkwIemv7qUJthxbF0WBocU5ZE=;
        b=e9RiRfVLOqh725UPZVRBDoIPu2K1glFY8MgeyNWoUjmsQEfbeUT8S5XLvke38UvZvg
         K4RpBC0uxUtesLTxdDvf7rHxVw1+tWKvyOQCO/n6FAVMH7zEBWYZu/CF9EeDeTf+8d59
         DDxkGWCvVD3YqAEPCeMXsa0Y1eL595YAflFUXUjrMCEyEiYJD10PjN5fia0OjV2u+TEr
         nioUU6B6TOX/GHUBZgrJIMUnwBH0R7Lkz5+2qkIGdme5G7HMh7CtoIa2mHEqcfT/3g68
         q3R3g5Oo4ptas8mP3Cktv0hx9Z6WVpf6p/GzEhM1K9cvNBmQTloSgNNysYEs5Z72w6BQ
         LAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681762; x=1728286562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zn1QOBKpxwHC7pwp1nDkwIemv7qUJthxbF0WBocU5ZE=;
        b=REuXPscTgkwjEaDShg650u//LQhLALwR4Dkv2dKO7Yw6lJVjzWsaiE2D+kfuulhlQz
         NF7DAkBTFtJGFCGDmtLhlkOAqjLWGtHWbHxwoOLQ7nomuj29eNJnLh0TX4mdw2UPvEPC
         CA99zhQ1TDDZbYcKKaRRsOaAn79nS3ut7RrvBVwzGyFh8FYgsml9VWiVa2Q9ijHxe/NB
         nC94VWL8cOTnsEBnPgbgUk0cqesnl5DYEs+WUkVOfjeGe0P/qU7+DSLHK68oXJYfBFJy
         zsLv2cIbdQARcJm43h+bCrGcGwI4A5n+BHJ8CvCIEXMaQBO9r4s7avzr+3Xuoc8G9XW5
         +TmA==
X-Forwarded-Encrypted: i=1; AJvYcCVClJe4hzFc5mXoF0hPgBSQTCnWwxBsMjnAbWF+Wa1tjREkUzF4cGyJo5QzrGJWvpy6Bl95XMCJhG0KYw==@linaro.org
X-Gm-Message-State: AOJu0YwaP7CcdrixSMdc01ByHo/sN4Orc3NnPAJ26uLTfoqkOnWkhETA
	b3KbS/h75S2s1SqOegNYnK/Gxo15gSySdRyw6NRFZNxkxW9Bh1rwz10uFR7NBU5Mqw==
X-Google-Smtp-Source: AGHT+IF/2ju8dp/hlgQNQQYphCSWWra4wcESmtISLsZng/9+YCPMt/FRqGKyK9eINYIKLWFa++fX7A==
X-Received: by 2002:a5d:414c:0:b0:37c:cfbb:d357 with SMTP id ffacd0b85a97d-37cd5aa681cmr10399551f8f.30.1727681762102;
        Mon, 30 Sep 2024 00:36:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd565e881sm8323063f8f.44.2024.09.30.00.35.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:36:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by stl_endian_p()
Date: Mon, 30 Sep 2024 09:34:45 +0200
Message-ID: <20240930073450.33195-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pK/HD4r14d1o

Replace a pair of memcpy() + tswap32() by stl_endian_p(),
which also swap the value using target endianness.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/xtfpga.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 228f00b045..521fe84b01 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -438,11 +438,9 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             const size_t boot_sz = TARGET_BIG_ENDIAN ? sizeof(boot_be)
                                                      : sizeof(boot_le);
             uint8_t *boot = TARGET_BIG_ENDIAN ? boot_be : boot_le;
-            uint32_t entry_pc = tswap32(entry_point);
-            uint32_t entry_a2 = tswap32(tagptr);
 
-            memcpy(boot + 4, &entry_pc, sizeof(entry_pc));
-            memcpy(boot + 8, &entry_a2, sizeof(entry_a2));
+            stl_endian_p(TARGET_BIG_ENDIAN, boot + 4, entry_point);
+            stl_endian_p(TARGET_BIG_ENDIAN, boot + 8, tagptr);
             cpu_physical_memory_write(env->pc, boot, boot_sz);
         }
     } else {
-- 
2.45.2
