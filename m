Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42940njb;
        Mon, 12 May 2025 11:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTADjQoHXIhBJSe3CuwtWOT2h9vvssOfaIb4eexUClE+cYOMHN545zwTLfgiD1uqfAygL1zDoRBIAufQ==@linaro.org
X-Received: by 2002:a17:902:ec8e:b0:22e:1791:2e5a with SMTP id d9443c01a7336-22fc918ff5amr247954665ad.35.1747073141714;
        Mon, 12 May 2025 11:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073141; cv=none;
        d=google.com; s=arc-20240605;
        b=fomCEn6aK/V8BM8t3Pl02dsTVoOw9yKmyyCSpTEbvnI2CYS+Pjr+Ak9wrpkEIha+qc
         u+pXgeKXmqga69JKb49pdmLoTtDzTfUO0JxSjIH2S1bmBYm2uQ7eXeZyEyQ6uYznXncZ
         IK06SQHh2CyVrK6sJ71cJzQVZO8N0skdULlVkckL5ZNal34hV09tWdbI4bNqCYUGMitG
         Oi9GTLDsopYwCF5ufRRT58mRKgrbErj2OrxPz7c765UVmWhPWlyYocYAzG1eFw5FL1Xb
         wYslizQBGw4C0NK1UfW+96Ty5ZOPdqGqho4g+c9vjPz8g2NvjWk35CoIt8eYnqX6eV/N
         UZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        fh=JPmQ2fNNkUcuTSQvPz+bec4C9qJIzW2sUogV//bSw0U=;
        b=btWlXzu9V6zrcUY9NCY2EY7IMFzP13HUfvWt2vlCStwpYgXz/AKtX3u0JTLoNCLuiL
         t853dDr+Qo6nA6ZwH1ImflkU8+fXVdwl4Dc+uuZ7lVnIePeatQcqTCRu18llbzP3WR+n
         h/v6RmAXpz4ofJg8gziEJ6OawOk4Dpo+PEZNIf4p++4AwL3BUV7TNPfr8fIzAiC+ti9d
         8cguGylV0lXg8je0UEgqT9xEjZb0orAcY7ZBjw7U7yNB+m3hI7ypiUeErCtEggIO2Bif
         vhqJe9a1BxPTTfrn0tiJXBdgl8yb6X+97a/I0e/kBWH55iMuW5JsQwp3cWRLtTTlv14P
         OTwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tpanggKU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f26cb9sor46183385ad.15.2025.05.12.11.05.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tpanggKU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073141; x=1747677941; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=tpanggKU4CabezGGzsJnnIMtnaAXoVyu05j6RUzzpgP2OE2QlyalUkA7x4tNKD33C9
         8doh9G8ucVata3VbSAZcZoPafhNXHQOyZEASkmUdzJTBJJ+GKTPmqkwnVtnjE4etYKEo
         D6RWTDXGczRCCfiDoTEwta0KwalQG5QvAZoYmwb2hrNE47MhiaOHs2XhYNf+Hx07VSXA
         4vtnwGoFGmrEsOSUC5RhkGOghpe2CRX2Et85hUt6M3HdYGVx5PpOYj1CORyZsCoZZ6er
         wKYAvymULZrPaH1XujRPUwF4Yy7R/1meta+tDHH/0q+3nD1fGW1LdICqzVQcPqzMMp6f
         Yv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073141; x=1747677941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=dDkiyiqL/rsfoRdmIFDVcZWSo9AV/jgJHSBlWAnXYNakUXLA2VpyYDY+ez0e0O0SOl
         CxDtW8TaEuUYdSllR7UXUvcuMbpb+bnHz31ei7qiGKbo9iY4T6+8hiohYmr/g5HWrRey
         haqQJPq0h8TYa0c8/rnRYBzP5G3vbJzwELBUr+IOQKveoVS85x0xZclrKVZoMyANa2EV
         LgLZNk4860fsxfZRT/20hRepxKfwhA6cvIsqjZQ/cjgvKgRm/Bj7X/T3FaFFqQbg343L
         wGMNi+x69CiMu8vpALSg28F55LujG324sptFdvUHa57+i6D+46GjTGlnW17ZzlS8ELzv
         uuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrX20szpjOlrBXoUzNVDQRlCBP8oFekCdXKuw0osh32zSQfbCnLep1TdQYyQTMS3wSiStvAN5PnXob1w==@linaro.org
X-Gm-Message-State: AOJu0YwMUHGVNSmK8EzjWzGyc4Wxz/8iWavftLEiiL+Vmz+uH7tfMDFs
	4fjItOtYNOJjPPaxxiQNXlz35xTXhAgIZiWoHWugQ27EtjA2GDZ4DR3hyPW4kdSM/A==
X-Gm-Gg: ASbGnctLN8j8oaoM9sQc55nOefZKjzuBs7VPlSz1qakmxvi7sDtJ8AjgsGOoschrJ9h
	wGXq0zPD7bdPDug+HlM/J5a6f77V1Wg38g+ZtsXJmmnd0fBfsIYETSWx+FC/QfaEOYYgrgsh1Mn
	4Gwb/BV1rw1+2T/SVFDbWe8rFRnBurIOzve54QibfTo5fIh3JRycmZC1mGrmuaQoGnA1Ka66vxp
	fAT2qCd3xWGWnXwTkTuMy3Z7Qn7hM7OLkr85i8C7Xie2LN07dnM3X+KfamoaZm5ptmg1jlJ0uhc
	yRsvO0I+i2tQ4DYC3ne5S08Ra+6ojpacKjV/7Z9KPYeTbZVyIc8=
X-Google-Smtp-Source: AGHT+IEB4HGFgjrJqND6GkVuqk5sFWv3djL5NlKtJ/9FxV4Ne5ZgKlSvrPTD4P6BXHrMQGl/vG9WjA==
X-Received: by 2002:a17:902:dacd:b0:22e:566f:bca7 with SMTP id d9443c01a7336-22fc8b5192fmr194608985ad.17.1747073141166;
        Mon, 12 May 2025 11:05:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 33/48] target/arm/kvm-stub: compile file once (system)
Date: Mon, 12 May 2025 11:04:47 -0700
Message-ID: <20250512180502.2395029-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0Lz0pK0oJ9bN

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 29a36fb3c5e..bb1c09676d5 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,7 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
@@ -32,6 +32,7 @@ arm_user_ss.add(files(
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
-- 
2.47.2
