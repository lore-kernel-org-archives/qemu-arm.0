Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397026njc;
        Mon, 24 Mar 2025 21:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURHtPw44Bk3ywfZBNc8pjNe1KltJDMJXaYJeuGcdo30FGisd/p7V68UCZJvt5LfQxyjMK7Rmz2B07/NQ==@linaro.org
X-Received: by 2002:a17:902:ce0f:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-22780c7ba39mr190430255ad.18.1742878772783;
        Mon, 24 Mar 2025 21:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878772; cv=none;
        d=google.com; s=arc-20240605;
        b=hkI2EBHd/GpA3R3Xa3ohdELNfmes1GbjpiLVWo/1KTAPPf7TYQco3S+RcAzi18IdiX
         2FsyseqENejFTz/IywREhDi2oT0qUtA+ZeCIdqv4xbh1/bhWNvatu7A9QFh6AHoaTsQl
         Fspq9R4HTH0V+mbfDz8ocpfxJqCxTpnf1Eg8veePcuDI62R5tx5cFdNK6uWg2HU3lkSf
         MmK7cX7L6z0rRlfjAiSly5+0MgMDocdgFvVyTETntA+OYgAtrB8/c+DJVYs7xXeesd6s
         HIMjgxYX83byZ3C4nkrHRJjd3Zbdj0ukqNyBfSS2rO9yb9eLxvdaeWc9Sxt+e7PBa808
         1FXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nPsnrBhccWgusioYoG8wwAVpFwZsZiOnGsl/PTdMWhk=;
        fh=EJx5lA7TCcBPXfGetWze3mEsmwHjhH4wH2tvDXJJ2d8=;
        b=BSu/xeCG7mUHda5gfRG5w+FiMJxgc7jkG4+3VBGcACJO1wumAvP7MdT6eBpOUKcGzK
         kNelAwMujaUmagrnLhnRuqH4APiQylOFEzo1RHlt71TaLUxVagdMmPUuO1MZ0Est9nxD
         Zn97wkQXPaxok/ggfev4qsO09ggDYwo5igSS1ZjRt8pNvghqmC1jgX6NhVivJPvt5623
         MHg5FuPcscLSt0U2THrUeCodEvrOkT8bnprw6T4UqOcHP0wVANXusYj0469Idp1OKrJO
         lKmr8tU3vqEKI6vSgPZju9u7ffA2Qqe0dwespkvHxeohMG/h5ZsQVrk8ixSmHR9SdziW
         yWxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIY3MzMk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811e6262sor54870355ad.15.2025.03.24.21.59.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIY3MzMk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878772; x=1743483572; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPsnrBhccWgusioYoG8wwAVpFwZsZiOnGsl/PTdMWhk=;
        b=EIY3MzMk/gv2ZI5l/4+MfM5WTHoSMuT9fut3cJvYUCzMqKb32yV5gYbPMoktUn8nQ5
         ovUnDCUjrW4jxPW1NojA5G5lGzbCV4zAl3SNvqQzXMqLNw1xRGUf5q4MiLv8rW3I2dLv
         58kWBqwCODJFgw0ktjepgaKsevp5J0dnzCTa2QS6/OKFKrf6PbjeWBsQEyuoDCsqCbat
         OJlaaKioTXqcY/kxoVwcbMaR/QtTJ2zHd6MTy4q5+UavHLSwUuSr+nkE/G/k+La3NrWb
         3QW685tjI2UHZPKkE7/LtxPDRp8B3Lt/dzy0oEfPQZqeTMFA37inrnq6+Ol4nPWo7wJq
         Ct+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878772; x=1743483572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPsnrBhccWgusioYoG8wwAVpFwZsZiOnGsl/PTdMWhk=;
        b=AMRqZUhesn4gBDSfBu4UTDC5VAvgS0ld7ykRKy0A7HqRJKlf+DsfAkU13wqFiaDwT5
         EiirmHiOeUrY02U6cwDoNBf1qgsDxBIk5Q5mphyzcZJzrjpwzYyDDmK8qVXfevidAZ5s
         rhL4VflUEyqAvyIOfeqaRi1zg2ArSzpGzkRjAJmwja2uYHW/mFWYWxPd1292dyYeOUHS
         RFym5JesJSkvwl7CRfmYSiHWUxB/QGTm3xp1WknqjrzrlOYZK2IV12n74kpUDxdMXnM1
         dIgZC4mbY2gB6xUqsklFSk2yoNmIa6/eRoR+qvGDvpwSoI4RKo3cAJeRubDMZaa4+yq5
         FO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0DAdrPFUJDs+eBP1dAWVsyr3URh8pBSudh/1SXju/5nO0yHrLTXxjQnMCKYCYU2ggvw1bddGdKyBRAw==@linaro.org
X-Gm-Message-State: AOJu0YyqP9QIXn6ErskBQLostn0FkDu0QeEpkeS8yVyHTKM+qXXQtq+C
	4yLrWuYu1ymnc2CQOZKe5S7+VGObENTSMDskTxkH7PVZa3PtzwpI2rAIHqgry2SO+Q==
X-Gm-Gg: ASbGnctyaldqky/g/ITNaaLuN7+i8ssU0XvwqpFS77pJ0O/Ig7lRA/tkIzmvQPgiVmv
	bX1zedslC9AhGkJhiTXihhjXeKVrqUe7+MDO95wZPsb+1UEHztc2xXm6ZdlX/fPXMyHnyPJduIt
	YQhR+VrdCzGGZp0B9aaS+P3Vf/ZfZYs1zOIu9Ws4R9oT5IcPYTe81IgkrzXOxHP841Zk+EWPRXy
	HotREsccPHokRjn0BTIk0oLRymjTTBJw2gSmYyc4UwJJ0SngR6XQFQYP3qtFzTdUhJ/HwSlLPcD
	cKbwJ9vpPz4Ok0VQtFwSzqCWDBkBK1d5iOK7uRsO1WwX
X-Google-Smtp-Source: AGHT+IFhBlyML92DzOsb+PMZ24kTM/lrjFJmrSBEIi05/e6tUY8Bh1kxoJuR1Fz5pHuu12ZsWx03WQ==
X-Received: by 2002:a17:90b:4d:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-3030ff00e7bmr22295807a91.30.1742878772239;
        Mon, 24 Mar 2025 21:59:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 11/29] accel/tcg: fix missing includes for TCG_GUEST_DEFAULT_MO
Date: Mon, 24 Mar 2025 21:58:56 -0700
Message-Id: <20250325045915.994760-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RaAh7bOgxgl9

We prepare to remove cpu.h from cpu-all.h, which will transitively
remove it from accel/tcg/tb-internal.h, and thus from most of tcg
compilation units.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 accel/tcg/internal-target.h | 1 +
 include/exec/poison.h       | 1 +
 accel/tcg/translate-all.c   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/accel/tcg/internal-target.h b/accel/tcg/internal-target.h
index c88f007ffb7..05abaeb8e0e 100644
--- a/accel/tcg/internal-target.h
+++ b/accel/tcg/internal-target.h
@@ -9,6 +9,7 @@
 #ifndef ACCEL_TCG_INTERNAL_TARGET_H
 #define ACCEL_TCG_INTERNAL_TARGET_H
 
+#include "cpu-param.h"
 #include "exec/exec-all.h"
 #include "exec/translation-block.h"
 #include "tb-internal.h"
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 4180a5a4895..8ec02b40e84 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -37,6 +37,7 @@
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
 #pragma GCC poison TARGET_BIG_ENDIAN
+#pragma GCC poison TCG_GUEST_DEFAULT_MO
 
 #pragma GCC poison TARGET_LONG_BITS
 #pragma GCC poison TARGET_FMT_lx
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bb161ae61ad..8b8d9bb9a4a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -43,6 +43,7 @@
 #include "system/ram_addr.h"
 #endif
 
+#include "cpu-param.h"
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
-- 
2.39.5
