Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492831ejo;
        Mon, 11 Dec 2023 13:22:21 -0800 (PST)
X-Received: by 2002:a05:6000:181b:b0:336:2548:2e29 with SMTP id m27-20020a056000181b00b0033625482e29mr791599wrh.50.1702329741332;
        Mon, 11 Dec 2023 13:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329741; cv=none;
        d=google.com; s=arc-20160816;
        b=KRX6ch2hHR7w7T7HJwKazw14Ch0tTdLS1diWMS1NOnWRdk8vC5jAOZ9CnzavdTrt8M
         eTZKOIILgAgQ5u/mOXM08JEIr1U+bU2cgLmp036U8puhkF74TSEEQ2WsnkvXQ+X00uqC
         osdcGUZ7Ltp6GlPk/4Yy+JPbHbpToFfJ6tt5YhzjCP8omfmiDe5TGUn5x8WISf7SOLqV
         y6g8/FLBqzHb0TrNw+DIjkm2IxNkkdBR5FZyUuCqrkVKBiNu+z2U7wOoi8HZkvFXYVnk
         ptIUpXox5qgraJNGWFR6HEeHu4m3jKFZ2Z4tvUdv2sbTOahYgRGqeUiR5TENdShE8dy5
         kGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=31p8j5Jt1hoDV9F+fYTdM7YWxOI6Tic5VBGPVB9TKlo=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=phfAlK4ki6k6VNKm98q7MyZ5j+O40QkDgWnSA0Hjc3TnQl+gaqfrjW5xF0CZ39pAeE
         +gFtbzGptpa2Ys/g0MRA4JaFi4+KHutcMSZJ1zas23RXmqiHnsSb5XJteOPORb8Sfnm2
         ENkyUm2uBJQXNsGDoRK2xM8+HjLl4OMV8QfUHVQanuP+o7DvTeQTd3NiVrNHp+Fk9Ecv
         PB5Et6AB2I6s12rNZLgZuh4DnkC7urhuaODGLHmf5D45r10f/FAmrP1QbewTQGrixJWp
         imUNmEzANYShMod/Oxealo43211uNcbPODGsApanCbFLt8htMH/RENBNLkCtfntjp4yK
         05cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mH9HrhKl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qn3-20020a170907870300b00a1b633ff430sor2041216ejc.19.2023.12.11.13.22.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mH9HrhKl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329741; x=1702934541; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31p8j5Jt1hoDV9F+fYTdM7YWxOI6Tic5VBGPVB9TKlo=;
        b=mH9HrhKl5E1k8mwHEO0t+Mc86iL+dh8sb9RBbYhpbDIR2cKakdxfI7GV8kPdy52POv
         rNRYpfo/ifdNPL/4APvxamyXLNus7WOhEhZPRhKeUl8BqQAG26th05hAVgXERTWO5nNN
         0WnrJqc07VgjluCyAAfTozjFyCadY+RzvyZ3OFSCAi8T1epHS+4pKeJRhJRwZiXvKluI
         bmuEAEaiS5QP9SL3WY3DCqt32+tyXKmYIDkSdBvliUpDQh58QcHsL5hk7fZ3//ZVHXIW
         WkTFLdaPTlK6MFIdM2DIEHoKoIpbc1FPwdIn5IpTFP3t16ilCGc50XoTJBvtUx9fxah2
         269A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329741; x=1702934541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31p8j5Jt1hoDV9F+fYTdM7YWxOI6Tic5VBGPVB9TKlo=;
        b=lMRdxuFgp2u/GlWAirCAIHR9UYyGhZERVkk85BHGqgjQ9KjbZ1Tu37tWTjgulE9Ikw
         gPeh9FIkzpMoQ/iGIGxQu86WpooiOrcZusKwGh869R5Y9b7Ixf1fSbYBK3mSX+elApJ8
         hw2oh/liyFRV5d+CasjcM2NDcCxCmGGF4XApil+qVrSDdRotO49XKaYWn6G++Ma9Buob
         aeJiD7mQ86yZxSi4hAgQFFBNMZmEIH4r9slF5RD54AWa62qUl4P9kF4nd7FqQHqnrKgO
         QRNYMfFmDhIG3NnpRoRG+JU/zeIc+46bSSVdLMDEsg1uqRDr+JECY2OW2lYZsjAYkbLL
         /CgQ==
X-Gm-Message-State: AOJu0YytHqOZ+ZTA6duRb5weSl4E2lyrlO+erCJveUVm/4srHYD+ppZF
	RVHbaoZitcSJyLfRbdn/NjaxENDp
X-Google-Smtp-Source: AGHT+IEmyjseetZ6MABzDolM2F1vBB3vF3EY9+Y9NrS2c3NXJni7DdLVf2NG0DPdko7jlFhqGhfwLQ==
X-Received: by 2002:aa7:c513:0:b0:54c:a689:2d8c with SMTP id o19-20020aa7c513000000b0054ca6892d8cmr3367204edq.69.1702329741047;
        Mon, 11 Dec 2023 13:22:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id l12-20020a056402230c00b0054c7aee67acsm4014017eda.97.2023.12.11.13.22.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/24] exec/cpu-all: Reduce 'qemu/rcu.h' header inclusion
Date: Mon, 11 Dec 2023 22:19:53 +0100
Message-ID: <20231211212003.21686-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vGgzFTYfcNSz

"exec/cpu-all.h" doesn't need definitions from "qemu/rcu.h",
however "exec/ram_addr.h" does.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h  | 1 -
 include/exec/ram_addr.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b1e293a08f..2d568ae4f0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,7 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/rcu.h"
 
 /* some important defines:
  *
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 90676093f5..aab7d6c57c 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -25,6 +25,7 @@
 #include "sysemu/tcg.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
+#include "qemu/rcu.h"
 
 extern uint64_t total_dirty_pages;
 
-- 
2.41.0
