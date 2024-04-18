Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952679ejd;
        Thu, 18 Apr 2024 12:26:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjmyifxNfKZEWFPwkmdvIibpEoGmcATUpWLdx6x7+0P4O4uOhC7xCcZKZ6oOhr3IAfjXr67A/i38gJcLbAdim9x0t1EucN
X-Received: by 2002:a05:6512:1c8:b0:516:d1f0:600f with SMTP id f8-20020a05651201c800b00516d1f0600fmr6062lfp.16.1713468408605;
        Thu, 18 Apr 2024 12:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468408; cv=none;
        d=google.com; s=arc-20160816;
        b=jL9drt1fMgvAFgl5xybKprLhyk1M+YFxATXJEtW/KAO3YzKr9+3U+HqhLxagqIyFtd
         T670zNDQblhsnzpQ0oIa1iPA6C/b5c5ma0MOozrkDpSKXzY7TOs33ck7mFRYRwtkPY9A
         5sYcRLRW+gz6u1b03vm73rDFNF7+JxP/mnyBlaLwHPi7MK/7rRsMhbbGt3CnvAQB56Me
         fwRr9/cutCVeZjzWUG/ONiYP1OFMa6VWb8REbFkTr/okScuBs82EgFSrIYl0Efkear95
         /q62wipVre/ASwksfU0O0f6do6a0+y1zhwkq5Bn5vUCv9NbOsmsxSF4DuB4lydgIfcRA
         Pi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KYZzt8h+xfLtt/f9EJkGkN8nzUXLIiHe8tAqM2sJg8A=;
        fh=5puZ7VWgB0J0XAicAKy2/LM0uOggGlkE+Uab7cD78sg=;
        b=oDsvsG2onit+mnkyEStqW9h4qwlFoseQnc9LzeY371FxXr3TwGTBDoeqQGsZiwLoDJ
         aydbWP9ehTjaC6Z1J77DP/mG3mGY1gjtzm+FB9kfXbn+9n+DB4QVjbZpICbSMLwhPCZC
         Xcx5kC6WJaRwtMtDjxhnno5n5BYL4zdCT+DRmlZ+vULf8JVlI9woVtQF53i/N0i8s9wm
         o0Dmtr5G53yg/EQWwcdeP2PvvLabUdR96+oeney7W7kZLWBxHNA4ceR19n+5Co49f1Pm
         Tnz9cCEfc5xIh2M2R0G7B77VcGUxY5XwkvWwpDUKOgvZTU7GV4xjLzwJTpScolEQROmI
         YyUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Biw9iiiy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kl20-20020a170907995400b00a5228837383sor736457ejc.15.2024.04.18.12.26.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Biw9iiiy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468408; x=1714073208; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYZzt8h+xfLtt/f9EJkGkN8nzUXLIiHe8tAqM2sJg8A=;
        b=Biw9iiiyuIgu35zNivSKSieBlD/GXKcJwtFAvNKDoNUjlQXYAwb/ZYlTQqSt86I4ll
         Dr8YSBtnT8JKMVEXFViVNcsh4kNvtydaYtL5+WuxjE6iFoK/1S+g35QcdeTsgzvyWWRL
         xbyi3nN2wfQED/tWxd3e4Tfpu81jugNRJzN7gepOtOgTJot1Z0q3V9Z+qRGZvEHDVxEU
         LrelEmzjUKu3PuxT434hlobZwWb6O+6AMG3SDsssAklhmjnuqUnOKbWKDdwEeVqxbVii
         l7JpWVaQe2MSyq6D+/WD8eqxIEOP2FBe0KcGBFbFEnNxOEKEUxO/Qb0RsryUWr7zAat4
         r8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468408; x=1714073208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYZzt8h+xfLtt/f9EJkGkN8nzUXLIiHe8tAqM2sJg8A=;
        b=VSN5EIw5aGNL+P4s9KoMIU/8wxkDDzSYQEwGzlZ9VVpcF1Z554o/qbCLPDuZ7ptmBS
         PwpL2q5CWHhhRUv3lmc1g67RXCNXwBTsKbYZduEUFO+ZlDyAanr98NH1BOVRE3hA2zrs
         oSgh0lnj7ArDrT1LaPy992nHhi3iBGz4HUZRaJkAUgZidfZYQ+Hy0a5Oc4FNrk92Ssfu
         f4vgHt37OnWoI7gdTMTflKWzA75YrnMCdPsSTmREwz1508fblKe4iCGb1E5bQPnKSbpT
         Q8Z7WfUXkOv8EIN++fdNBS7v+1OTHCZ8EFV2d2/RyviPWTLpluMWcMkhgKw6QFDYQlzo
         Spbg==
X-Forwarded-Encrypted: i=1; AJvYcCVzZb+fDv3a/Wf36UTC6kIcdfnN6m+TXGBupuyHN5fQGvADh2r5PrCsRAxPKpUK3ly49XWNltgYgrdFOtaoA83m5emF644b
X-Gm-Message-State: AOJu0YyZqOA7PLQn08eiOzTJed/jSZNePltaZu425yUgGnQzPwcoCZUr
	71k7q/CNnYMcdCLU4fjxdsPVCA9niY0267LWR7PJzoNL9htF4UnTPNKKuF/yOd3Iug==
X-Google-Smtp-Source: AGHT+IGGSoNOPuz4j2WvvNGODM+4AEJcNNx0Thxm9FrMRXdYVHLgsSyAWa6ZsVOCsEkdfnN1Xh2oBQ==
X-Received: by 2002:a17:906:34da:b0:a52:2e08:207e with SMTP id h26-20020a17090634da00b00a522e08207emr43995ejb.77.1713468408261;
        Thu, 18 Apr 2024 12:26:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b00a47423b4c33sm1255791ejt.128.2024.04.18.12.26.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:47 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 13/24] target/sparc: Replace abi_ulong by uint32_t for TARGET_ABI32
Date: Thu, 18 Apr 2024 21:25:12 +0200
Message-ID: <20240418192525.97451-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WKKsGYH/UjQQ

We have abi_ulong == uint32_t for the 32-bit ABI.
Use the generic type to avoid to depend on the
"exec/user/abitypes.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/gdbstub.c b/target/sparc/gdbstub.c
index 07ea81ab5f..ec0036e9ef 100644
--- a/target/sparc/gdbstub.c
+++ b/target/sparc/gdbstub.c
@@ -108,7 +108,7 @@ int sparc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 #if defined(TARGET_ABI32)
-    abi_ulong tmp;
+    uint32_t tmp;
 
     tmp = ldl_p(mem_buf);
 #else
-- 
2.41.0
