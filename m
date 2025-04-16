Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178833njc;
        Wed, 16 Apr 2025 01:15:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1145:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-73c267003b0mr1291007b3a.9.1744791334565;
        Wed, 16 Apr 2025 01:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791334; cv=none;
        d=google.com; s=arc-20240605;
        b=Ox+FtJojHZLqFkTFt3EfjyMX2pf+UDycgEQz502goRPTtWsRqFbUm/ojWnmcqN2EWF
         3FYMd27h1ZLYTWgH+pBdZErZ98m1M3Z/S5kSnx+lSpXP8g6x+WNHELdujH48wZNJ/Ll4
         1JDjWoxJnWJ3/xZvxAuqHHI0kyg7Smb/Rf+m8Vdq4/YiKe8U5u16TX+mhYo1oIOy8L3n
         4XMZNXkuloH91ECFbLT1AOuE2mT1Hh0Aq18hP+H6c2h6+31Kbs+ET/ZuSx/1NxRRf0c7
         fUlUZ77hI9fMCzX3kaW6TkcVNTgxNg6ELICgoCWkbZhNotz9s0oM2x1svhBWhtUx8bIg
         yfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fFdycMSzFipz9Zxr0ZH3h/HarCGC0DbvNHYJF0RN1dM=;
        fh=AaGdOgjFvAa0wcKdz0+LghEGvTZannZbeUdltkNXatU=;
        b=WKeLqT3TxuXCZctvsiIoJ8rqRWxbHS+AC+CRkFO6GV9ntO2fuSkFa4e1Ow2Rz2w+W9
         Brg0AOUy2j51HJFyS04sN/e/hRqUmP1HLPN6M+iFjjen7mj9WaNAh7NkZLe4VbqZvwVV
         8yk77LK9TPzW/y6MvN+XuAlJJOKan+pKdzwKZdgqertl0z8VBXBxmP2dtS9qI0h2g07R
         OOenqkipT6F9AMxwdB9apBPuo84mAOb7FhktVm8N1KxQJlDoP1gOCdp8UprMGM0tS+WP
         hV5g5uv4gnu2WcTPhydC+k/9WlUFFayKOuZfD+VU0QLe1Elf+LixV3JZgzyxSKJMAwn9
         z6SA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXZVrmFG;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d44bc1sor13537973b3a.1.2025.04.16.01.15.34
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXZVrmFG;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791334; x=1745396134; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFdycMSzFipz9Zxr0ZH3h/HarCGC0DbvNHYJF0RN1dM=;
        b=NXZVrmFGa3nsSD0AxPphf/dKonn+9RJfq+zxG4EKTlqwBtdwYBiPWiiX7Kg3qSYoZG
         oEDD4FAwnYKbiyp/D/RiglYY86giI0/QSjgb/4E85DIzRy042YcsjK+OLYCKT43NVeXY
         7JhCoA6hKutQsU2l3jxvvKVICyYv7jIKkaRyKM/pYYjVx1G9Mbha9bERQq1a08WFoE13
         yfrFip3mV0XDkIepA86WODNIovAQ4AqLLj4jJlYGZOufPXN2SSfu4Ddy9qo1Gwe0sm7R
         frN6qcDvvS3iKOY9cK9GltYB59C2qRg9S3wya4kbzwJerB7ELjSWPVIBqS33+ZtK40k2
         CsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791334; x=1745396134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFdycMSzFipz9Zxr0ZH3h/HarCGC0DbvNHYJF0RN1dM=;
        b=abnQNst08goMtlygv4zrKQ14zUT9I9nAyo9+DzJkxMnTa3fGp23G60hRuaPlZ1EoK7
         wl1OI6xupTvlglYUtMsLt4U5gqLIaE2p2HS1ZbdqWsvtq665EJ36KlEvZL2pLwBzH6s/
         UwOK4OPF8ZxiPGNyFIdOXt0g9Q0UxYWOnWzhU/rOeLWMPjF5hB8aMIN5iT4dHf0E2w6B
         A8aU/RqcqBikKgqGr5FEwRe1wUgynGu3HI5tWjjP9z2T20wHsNHXS17SW+6v5cmX7AMY
         HFNif5wQuL/AHU0WOSygCMdWHwL5oMkWxLdBeZoStdMcQ5NyXji4wormrUM74K0wgi+E
         N4+A==
X-Forwarded-Encrypted: i=1; AJvYcCVmVdV3cZQwS9AvXMsPJ8iW6frkBsdc9P8ujbUq9gBzVJSG5Zs1GfPjj2xTa5LZaR+TLZi5HGJq0SDG5L6mJw14TOA=@linaro.org, AJvYcCVyDruzUkZoc8uY/oGGIpO8WQ5HsDDBKo406HIyGTTIyYr+lquYKBrBsQcIfGZbq+junB7GQlQ0@linaro.org, AJvYcCWNS05YxJ0c/i/FG9sDV4BQBKSJ/KXoUTXQjA/syCnXRMi4Wb3xPvCDv4a7VA4tG0p0csqOLJMvAs8AcnwpSdgKlQ==@linaro.org, AJvYcCXYBf2QcwmCAkguH65qrLOQYEV6SP2CwNcDznn/VDjlJCEQX7QDienre5FJ/x6pZTTh7B66PE2UEy8oRbwU@linaro.org
X-Gm-Message-State: AOJu0Ywg5TKgXOkK8v0Hbwj5q/M9DLuMtLtliPbsj/JTca5BN9evICc5
	HIvgdWX6K/a3n4Y2vyjn6Fx62clmOelTIJeTzBEAwdrjVh6XbCrl
X-Gm-Gg: ASbGncuq3BmrWg9ILIaRe/sFuaiu044xOEpAPyKkCu2E3l5GjmdC/+beb7Hv7foFbse
	JVVwQKUQwiu365LfEt4FZ1EwBFvzI1lzQq3CWa0C4ioVJIQbGs2Un8xVeAlhKTPp2rLmqEcm5zk
	+/lOU+mkhj0j+LgkUpa78eZzqSins9CraiWpUafD3dTAP1kBis1IhwdEKn0hEKlQzgHoezDrfjp
	UUpk8oXNHK2Tk9WstQ/QYr0RQFuJ1RhCPwLdiHSYFc2/ik9qlD553w2oancnVWCBOPJ17en2a+O
	gStfh+4mPRmBGqCRl86uacFVKO8QubgXZ16NLBx9tuYFUzS/s8Ilvw0+pMl6gA1Nw2LQ
X-Google-Smtp-Source: AGHT+IFJGr+vW9xLmlInModOrpRdhxEYHBP65U5/zipWn3lToz5KEXtzcMWCVlmEzka/wjvIBdQPuw==
X-Received: by 2002:a05:6a00:896:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-73c267d4f79mr1287060b3a.15.1744791333882;
        Wed, 16 Apr 2025 01:15:33 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:33 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 04/19] target/arm/helper.c: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:09 +0900
Message-Id: <ea53758b9300450908497f746af1e2b43d8f941b.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1sDoEvd2cxRO

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_list_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bb445e30cd..05793a6c97 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -220,7 +220,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
     }
 }
 
-static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
+static gint cpreg_key_compare(gconstpointer a, gconstpointer b, void *d)
 {
     uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
     uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
@@ -244,7 +244,7 @@ void init_cpreg_list(ARMCPU *cpu)
     int arraylen;
 
     keys = g_hash_table_get_keys(cpu->cp_regs);
-    keys = g_list_sort(keys, cpreg_key_compare);
+    keys = g_list_sort_with_data(keys, cpreg_key_compare, NULL);
 
     cpu->cpreg_array_len = 0;
 
-- 
2.25.1
