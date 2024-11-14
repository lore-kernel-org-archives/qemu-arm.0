Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25968njc;
        Wed, 13 Nov 2024 17:14:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnu/TvrQThUvBzgvCGZrNsZMy5mpf8vE9ss8a0ilS9zdkLEifJCSBu+tNJrlHufhXq0COVdzKKncESCg==@linaro.org
X-Received: by 2002:a05:6000:42c3:b0:382:7b9:3215 with SMTP id ffacd0b85a97d-38207b93356mr5748032f8f.31.1731546866488;
        Wed, 13 Nov 2024 17:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546866; cv=none;
        d=google.com; s=arc-20240605;
        b=Hl1mURdEkBWGWAiV67ieCRDGZHi3iTKTOnJOPR0TU9buZVqGNZ3xU8v9xWjz6wAfYO
         ED4i9Adr9FDo07+7Yek3Rs1CZq6Jn8GJUXOR/uYCZPLEENkfOyEzyz+tuP8hYwVzYNro
         KUMdYEHXBM0BJpn+jEsV6fhOuVPivEWxSs6Qcu+1TyPovR+pNMBEG6Xb/fQHA72NbOHe
         BTWOrM3EJnovaZusj6CYLq+HZPurdovXxHe717CuTO/UBT+5hl7VpDaY11LT316Yjg+0
         LaSQXE2of1fnwmjLacuS2d7lw1u/mA03T6bVW9TW6IuDtdZieN5YEOQrc1Yu/ikvw2Jn
         VuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OzDo0drcf+l9FI9MFOgWksxtiPTKy7V4t/YiPF1FVxo=;
        fh=UnB/TrG9OG/bL5WHQE56XyHzLmdLiOsgsgKHji5bcwc=;
        b=G+Wna8+Vf7+Syhhrdu9DvmEffSg6enohi66ka32qUR4Ze3MQwYZnW2gbLMgYDmvOMr
         NJWTJJUbLVV/P4abWd69iEFOkBtAyf4H+3v8Edm7VOJyMsI5eMQD7Y2Ouou0mUPn/avP
         0RgbmIh9i4wyZ9LX2MLI+aaCyziva4FcdIpBvY1ah/2E7v2Gs3amd4hoBBjU42RV++wt
         njlbTAM6Mc6oM39BGmR+NE9vE+5tC5EtcY+8G9ImusSHydzDbayARrY4/6A75e0ANHcb
         7JZc6B7WRipHHbh/kEM1vhol2HoiUIpdzp7xskWL+wbCB8274q6AXvaZRSK3lLGajYfs
         zaIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j14Di/8n";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed9e4c1asor5578161f8f.6.2024.11.13.17.14.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j14Di/8n";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546866; x=1732151666; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzDo0drcf+l9FI9MFOgWksxtiPTKy7V4t/YiPF1FVxo=;
        b=j14Di/8nwrvVxncPD2XeRUaZkZHJfA/S876iZ9JXQ9khgL+kOe7OQpfD+DU2y72CUD
         CkXY6cl8jYnn4PhUi43FhOPeHmiTxQyKcy3uApZT721wXa7tQ7f+wU5aSbGn00c3fHct
         iFr7ZDQKl8oxkUEeFbRbQIXlsf6TIzW8x4mIY3VcpGNtTSsFgWntts7NDUQbI2c1HCOR
         ebjG9+VhicK1UsxAi4QZmfFdHwbjYqDYZYoa8sI3t3Yed2lKI3wvOs2k1rONX+ZJybjG
         D57uhcrIeeIPvPjunjg15qsZSoBitu2FKL8VxnxIVSoMsd5OwzJ15C6/hZwjozL9fHts
         J7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546866; x=1732151666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzDo0drcf+l9FI9MFOgWksxtiPTKy7V4t/YiPF1FVxo=;
        b=VI/Pf1vlOQ3mM5wB8yPnid+AjPG3zFDznurmX69nOWi7YHHNMI0nGMLqxKSyRY6DZG
         H2pX0ObC2Wmsu8aLDlH8Mp0vP8J/v7KRcbSbLfTS22bTUv3qn8DqUyJrJdxK/Q66CPPF
         XC22td2K85/lw5haWL5OucfloYb0eKFSrxsKqX5KvAxFiBT9AF9ijwjiUmaU/D5mzLcE
         flnSdqw2r8E0Yt9+fPwgjF5hn9m67+kKRpDU8Iv8k9/tDYtMRp5t7+36kZin26cP9bXw
         bXRjLrhY1UZ8JWl9YisnVqdVlVxoVsWcOvOvv4QNuZVjvzCvJMGaVLATb3eVVYDAWeHS
         KVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/FmTvBy8B0Qz/i2wOMFqaqPWrloYibVntdK/E8Zvlo44vWQUtgZPqrisU1Zf/T+rgJnSu9qJ/lxUfOA==@linaro.org
X-Gm-Message-State: AOJu0Yzu9fvmk0q5J0Be6vfQwuE3F+n8BlHMN0X3G+NSKlX0X/iMMLj0
	iN0MwUB8eogULvwTGsbkvVov2UXG381FTwZOCjdWwRSIkVg5/3xWJUsHPHjWfiiAgw==
X-Google-Smtp-Source: AGHT+IGRAvO0UPawK2zfcCGO//9i8AmO6U7NK1zJgE+Z8dy6kuyS/IdN4ms2Ng8UXNa65KniwwxN/Q==
X-Received: by 2002:a05:6000:401f:b0:37d:3e00:9a9b with SMTP id ffacd0b85a97d-381f186cafbmr19128225f8f.20.1731546865946;
        Wed, 13 Nov 2024 17:14:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970f68sm19860449f8f.11.2024.11.13.17.14.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/24] linux-user/aarch64/mte: Include missing 'user/abitypes.h' header
Date: Thu, 14 Nov 2024 02:12:53 +0100
Message-ID: <20241114011310.3615-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MrLhvNoWOxrL

abi_long type is defined in "user/abitypes.h".
Include it in order to avoid when refactoring:

  linux-user/aarch64/mte_user_helper.h:30:42: error: unknown type name ‘abi_long’; did you mean ‘u_long’?
     30 | void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
        |                                          ^~~~~~~~
        |                                          u_long

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/aarch64/mte_user_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
index 8685e5175a..0c53abda22 100644
--- a/linux-user/aarch64/mte_user_helper.h
+++ b/linux-user/aarch64/mte_user_helper.h
@@ -9,6 +9,8 @@
 #ifndef AARCH64_MTE_USER_HELPER_H
 #define AARCH64_MTE USER_HELPER_H
 
+#include "user/abitypes.h"
+
 #ifndef PR_MTE_TCF_SHIFT
 # define PR_MTE_TCF_SHIFT       1
 # define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
-- 
2.45.2
