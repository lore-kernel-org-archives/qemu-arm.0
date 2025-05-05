Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778182njj;
        Mon, 5 May 2025 16:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyTiiSoXrgr0ZxoEJ8AERBB6tZo12GBGAp5Q+fZJf+RTE0arHbjYdPLS76Sax2O9r374zAR0deQ0qFEw==@linaro.org
X-Received: by 2002:a17:903:1252:b0:220:c63b:d93c with SMTP id d9443c01a7336-22e363bb456mr11522215ad.44.1746487229019;
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487229; cv=none;
        d=google.com; s=arc-20240605;
        b=LxY3JsdFRWerHmHO531CU2BLXqQpnn7a5dG7z7SvcBBP+IS4fdOM8h643rmI+6HoPd
         E9NARATOkUu8tPMxQmIWxBL3NTwDQEy0p7G275J9JsUKZDdp/sKvCgJ8OwrdM4sJyXlU
         6Ow106BOmTULH1KQ4ZPbhMZL24CNjbKvqUACN/TqZ6ZpWo7ZD2tBucX34PcZ3cLNjMY1
         Ng5iagY3DI379dky9BY6e4tvUdqSEBrrCO7voA1DQQoqlS8tX+swAfv7l8867LudGiVP
         ZzVhHYBrBllVK5CGq02VgYcqZwmubjtMpVhMx3NYFZMCnF3YpImmfaJdF1N7QhDpylc0
         fHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        fh=RBdZ9892mVzmddY9A4CPA9BZ7Hb53sLUX3glwLT06kQ=;
        b=K+PaV5+nDsmjocLNT9YSZSpHekhKtq+h+7LrZblQGbDH1Co95e1oKrbbcJ1GnJk48x
         iTo6tkChwMp0puafAsXeFgRK+/VY83/BaXk5V5tYbg0J4sW90BzorVMvKcTv1CKtCXsI
         +5GFxB1p/qSQ7S8UsNZ5fGNVI7RwN8L8VxunOFf2dLAyUQJ3jYvH74boEOIm4H1ke75w
         iJIrz8rsIc/+JH8SzsxQAGtXyQnmjXPliKbKYGXR63opMn34bkQ8FadB1nEF00YUcDem
         B0BpS9FZEx0u8O/Es5tpztmIDvIaIs8UEB1WBws8K1dgm4mg9b9udct6iM0/1gzCvMaN
         LFyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bH9JtWnN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be73807sor62857385ad.15.2025.05.05.16.20.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bH9JtWnN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487228; x=1747092028; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=bH9JtWnNUsfykasXXxPR9ni8xcpD0m/thk8EhgLqJhr0yNGCcl9AAw2E6qDPkwzTc+
         2NEA9MG3G+LTGYj5zvA+sdarB6xasQaycdNy67lcMU8JlE3VtvibDoKzipx7rmzfiOVw
         wnM+sw44iK/gdIxykOx1XRo519MKWzzlPhIHsFFFUEKORic0vBDYtpl6BMr/4Y5/L0ag
         gOMER7hM5d1tu1/YA8w/pRt4aSik7QGE4FkH1NWxhd4gkku4+1qXV0Qn2dWna5a7o5wk
         OgM//EWMPca1NiEmiVBBm50+xDyjaOuF4d1GItKXStOgHDZ1EIG2pdbut3gSGMeGe5N7
         mkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487228; x=1747092028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=hsm+j0SRlxOwUcsJL5AXSGD50FYQO2AlBoQGa8U5wpFPwhg68wH0MLzyFSnmgg5JcP
         Z0l9w8PZLnEALCPP9/wI0HPis0C7vEZerrwM6VklLkcACDikLUrracJOKJWl5h+/4z/k
         fwE+DwMstkj5Mw/EVqOEAPjcTPEH07Zo7hphZVCPHF6fzQHdl9TJNQcENYHUai7zIJMI
         odfGZfKc0u4SO8onuA/skdW4LDu5z2rGujFt747T3ZTN4JuanFeB7z6MfgLH+jcEkat6
         oUGZgEoOVnJpj3Y2ANhBq/Dyq58TiBZBPNTa0ExcwD6UtwmFfvoi5aRyS/VYgujCXGUo
         imZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqwb7n2VMg8PGdjo5JF0qNU/gljufkaGAn6YrogQYzq8hwT6RigIw45aPokqz2hMn1pGsYnlNB9uQgBA==@linaro.org
X-Gm-Message-State: AOJu0Yx+ZhxH99YEnGGPge2LPQYi9DiRKc1vMZBk0Q2znPVoleeSnwRf
	r0P0bkgz2RWiLinqDzHsIVO3ZC/pltlIXXxka0tK6FfYkoCaMuZ59oAl1yAbJEuMyw==
X-Gm-Gg: ASbGncuDrl54WvXy6rty6DIhlGD2GkVn6SpqLfpdx3b2OeFGFso/XZXjsrl8RLACQpV
	rNE9Ck0D+4Lo5Llf+MkemeZFCM6tFzy7Af2nMj3HZxYMc0ejKB8RrVg8hkEvFzYJyT5cv2Ax2Zg
	UoVvVcGqGq9SX9o91f+v4lcujd6i9SqKu/SAE7+8fNre1MzMkU28gjX6JV6xK2leHhMdi4j1QWe
	He5B/3v1vYON2Ozv6lLid/TyVDeiRU/yFq+iiZ6ElwBL/+4zYF6bBbZ3uO6L9JQvHKX2/ZsOvpE
	/SU4JstLjOZ+W2KpkbHFFFJXRBMkzQV9noW9W0Dv
X-Google-Smtp-Source: AGHT+IGSY/R02CKSQdqXb3iHAsgo600GkoW68E32m5EK8V2wo1QEuGkpp1ZSH6DODuTARwW1aFA+vg==
X-Received: by 2002:a17:903:2f4c:b0:223:5e76:637a with SMTP id d9443c01a7336-22e3620b14cmr11382035ad.23.1746487228533;
        Mon, 05 May 2025 16:20:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:28 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 09/50] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Mon,  5 May 2025 16:19:34 -0700
Message-ID: <20250505232015.130990-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: j3blKbWz2RMH

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07f279fec8c..37b11e8866f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "exec/page-vary.h"
+#include "exec/tswap.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
