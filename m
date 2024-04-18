Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952358ejd;
        Thu, 18 Apr 2024 12:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAdSDOBH50zvFhUSuQbBFsZJQMlWoVMNgusKdS6iKijepMdDzI2fhx5M26AR9XnmRVgRHruMDnVcEw6gRguqdo4VShICAw
X-Received: by 2002:a50:d696:0:b0:571:b9ac:ff3f with SMTP id r22-20020a50d696000000b00571b9acff3fmr115624edi.5.1713468365706;
        Thu, 18 Apr 2024 12:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468365; cv=none;
        d=google.com; s=arc-20160816;
        b=XgsVfSleL61C4lKtA16ilTYri2xA4vJrh6DZ+4MSIIZBGDdf7NsHg1KNf3p4hlo4CH
         bAkzhmt4cWo+iaGo21YaXyDqpSAxoi7SMsFCkTfeTS/59EJK4lWixa8Fr24kY1tKXNYD
         sn7+e/bwMeX/nCFBU0tybTWpC/YjFsRl0MOA8K1u+ujniNFv9tRGjg7Y6YBIB4sE5TdH
         kuLqCDdips3HwQviYtuMcvuy7TU+yZ3vje/tLtyePC+cIbu/PuRKqJLoUyZFLy0Z3b3W
         3BaiVwGu+z2r3Kxu8N/CNVYkkaY20yvPWaP6+Tb366R6LNSCZNStIbkD7dpjcch7VFVG
         cDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kMOTCzZ8G1QDoqpRuDm+110xUKe36YwlxUEiY1YFvik=;
        fh=a0gkX8UrSn25albMEy0ocq2wYrFUuqIObdZjibt9Huw=;
        b=l1aVQLGFTrU19w9rx1vrIIEsC/TRndUwG8hpbYV7wLo3FnDbRn7cIVWaxnNkiMrdVg
         n/Vf+Jqj1EUssis2jbFJ1HFRuV/1YxMhSV7c/ibmmjtuGYnXp+X36bv4zKD5x89FEMNf
         2lyPhZzEykPEOdPRk/zxIFknfs2DSHvXCl7TspGry9ZMlt3InphxOeSRfoUGNJ36AZGD
         GTsUj0oK5tg2ivzBo4EabAZ891Ng2F6okWDntUkdLLnGrmi3Y3F0xBqTaG6EDo/VsWze
         gMLSJzQNMJr7OXuYBXhkyLjKif5rUIF5tsMZhWNM4K6AiZPqm7mhPDKaHwpX6Lm+nPp8
         cdrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qoPhLICL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c68-20020a509fca000000b0057083e9f3c1sor600682edf.5.2024.04.18.12.26.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qoPhLICL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468365; x=1714073165; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMOTCzZ8G1QDoqpRuDm+110xUKe36YwlxUEiY1YFvik=;
        b=qoPhLICLCBGfpr8Aq8BZ58RgkKk75UaHUf4XAkWl6fbfihpsYh4wbu561AbzdrMQ+w
         YN7fkLHT5EJw5tPEjknhp/fzKHICd/IM7hk/Pazlu26GRXUBDond+WY2LO2UTrubFidU
         NFf7a4xLTbjzmxhQ+Hm87MlLTNLSsdjRRpewPInPBxPxcqpKdPfTZDgZY6k+a7Ov49lb
         Fd9drjl3paPDcA3QVvIxu9rwZwRB7rJmQnYX2IvlQsZZVZ5yhf2AwaNLETUI1+G2Feym
         VuNb0D92zSfuxaxFCbSFhRfCreUPQwgRaY7JAlbiU9KHE8KxJmqEDz9Ms2nm3hPYTk+U
         7szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468365; x=1714073165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMOTCzZ8G1QDoqpRuDm+110xUKe36YwlxUEiY1YFvik=;
        b=lgcF5+IeGTmd0Zpg0UloUMHnVVwnViC7OmfO3hPk9yifg0vtMzOffuq9nCXYFF/UJg
         GekGqnF+2se+/fqwruglXmp44fEfS1sF4anieamNy8xEW23PMFbk7c1uIoBaegLdsOQX
         RkF2kgVLqvFKs0BAah07U3NukjFlpov3iCZssM0WR9KA04wvweIlhrME1jFZb1JuvsqY
         zYpBi04U+BrmfGGns5h3SBiu3f8dYMB3+Btuz79t10l4yt54+2No9kRAHPbXQRszNMbd
         yoyDUAOO1xU54lj49it5/j/3fNeNCVPgLUDpqqs4SsoXwvYsFyD/FAXqouF1knAFDjms
         dG+w==
X-Forwarded-Encrypted: i=1; AJvYcCVH8lCXKPYiwJ0JbQ8ABD+p+2N3McKuK5KqRgOpZckKrjdd1vdMcjrYpbeg1b21JWe0MrK4FMWNEq1FL2VYF3kdzhQxMKwE
X-Gm-Message-State: AOJu0Yxlsfge5B0rYhHzIMLyhk6OP/5FkQtKGcXP00CGKBCQt6muHlbl
	3ZUJx6WNuaki549VRxkmoGFHLhJ7J9gXcl75ftha7Bi7nDh5EPHtNQzQVEymdGmR8w==
X-Google-Smtp-Source: AGHT+IGauXFub4OFdy7tZBt9c2yQKaEln2/oxE9Uk8pxg4A6jmXoRy5XQ4BNQTCVjKmFKW2y4HZUKg==
X-Received: by 2002:a50:951a:0:b0:56e:2fb9:66d6 with SMTP id u26-20020a50951a000000b0056e2fb966d6mr107290eda.27.1713468365147;
        Thu, 18 Apr 2024 12:26:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id fj17-20020a0564022b9100b0056fe8f3eec6sm1194542edb.62.2024.04.18.12.26.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/24] exec: Have guest_addr_valid() methods take abi_ptr/size_t arguments
Date: Thu, 18 Apr 2024 21:25:05 +0200
Message-ID: <20240418192525.97451-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rp+fh0DWB/mO

abi_ulong is target specific, replace by abi_ptr which isn't.
Use size_t for the @len type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index f3c2a3ca74..63186b07e4 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -92,12 +92,12 @@ static inline void *g2h(CPUState *cs, abi_ptr x)
     return g2h_untagged(cpu_untagged_addr(cs, x));
 }
 
-static inline bool guest_addr_valid_untagged(abi_ulong x)
+static inline bool guest_addr_valid_untagged(abi_ptr x)
 {
     return x <= GUEST_ADDR_MAX;
 }
 
-static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
+static inline bool guest_range_valid_untagged(abi_ptr start, size_t len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.41.0
