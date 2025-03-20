Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278873njc;
        Thu, 20 Mar 2025 15:30:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyMVddxpH3Plf4kkR9GjVsWHckKMApZrZWpyE+CjLc6xjTTXAjClruMNbIgdosJVxblABy5/Vt9vAqcg==@linaro.org
X-Received: by 2002:a17:902:d488:b0:224:1005:7280 with SMTP id d9443c01a7336-22780e121e4mr16284005ad.38.1742509817468;
        Thu, 20 Mar 2025 15:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509817; cv=none;
        d=google.com; s=arc-20240605;
        b=cEflCRZIte4IvjxOicrvMELcBidfp7mxpHPo6v/TVrfB6RmaGVODhv+FNAuK/VrKQa
         PBlbO9MLcXS27xJ2RLhdZxob0ZUTzaHLNLiY4/VxQLqKDOnCk7okn3R38WuWnSC5ySIt
         Cz6ahTfSuWX08BgccB7DnzpGvgJyOCmF984U3Nj0hP8OKc9SveTdLD6AFhNhL1S7B3aM
         3xcWVmsnC/Pd15XAUISsJiyn+kogG18crF5MhQJGA0HxuVwmuWLQb+UkrlCGMu0rAU/g
         D9X6+xKZAAD7n+dLY71W4iyjoQha7FNXUWHzjCKj4F5VEMgdvzfbbExRmPXxn8TU6/lq
         MeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WS56+yaDx7XPqQTsxGbqAzPgp+EeucvCf5WClfPP9c4=;
        fh=cW1keL/+UZycSY2g078FkmrDk4aEeTfMB/H+AznVfDU=;
        b=G5HH5UQ2GUThTyZbeJ6lE5wIPeSaiHdirOmJEdMy8NSfBQmgok18fHaNt5XFIN/Ew2
         unTT/K+2MX0iKKwC0dWqeSwHHL1lrl7E8neEoB8z0w2SbQWY5XONEFV3Tfi1QfIrLqaD
         vWgBHBbYCWQHHopiI+cK9HSq4PZ3HkBUqQpHMdX1PWYpkwZC0sfhBPiliNGBQyddU2I0
         qTGSe5jPCSeKv+/38pcayoZZpii1zWSxVLwSD8FwClvvPfTuveIooti6FBbWWEJrAdKH
         wF+P4uYt6NM19TGCW+nwNz9OG6PbiN1NmGuvR2dVtxKILhZkBJ2V++Urwie9V7MmK4km
         9T2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u7AQKKVn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f5be92sor3810465ad.8.2025.03.20.15.30.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u7AQKKVn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509817; x=1743114617; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WS56+yaDx7XPqQTsxGbqAzPgp+EeucvCf5WClfPP9c4=;
        b=u7AQKKVnGewr/60ndSd0QfHCtvW2GllM7lcbJ2K7Aj/icLnnKet06G/tS6/rtP3FY5
         67/x1FCY77eIutTOrdl22xnELSb/nuTvI7JmLOHpH53g/AQGZiRWL5tl36ZXbgg47o9R
         yUf50nJ7S2e7Zr0adEkmKi1DD8wUUGSl/+rGrmbAGEPVbZNGtI6Hn09P/0/PZnpCCrYY
         xQ4AQaHC4IXtuD06RxHPn0toMj7cd71LgHKoOHTU9RJiFPYNBgt0VfPU5VgTmYp731IZ
         fRIFnH8ltw+vZnIyQ78o4+a3MpEBRUR49OKvFhu4Ug7YKoaeFbgFJwPVAp0OZC94mECO
         Gx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509817; x=1743114617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WS56+yaDx7XPqQTsxGbqAzPgp+EeucvCf5WClfPP9c4=;
        b=Hhqp9NYMriCjw0J3i2uQsdbn6jr/spauGaYbswc+x4MF2BRlCE9ZQLqNFjzExao2L3
         VsK9K/Dze2cjK6jjRwp+wAEnA3xohfbj3DNyXG+H9KkHlj7cn9cwcS/ome4qBMfP72WQ
         S/5ndpmQ82s6KTzRb1wyTCdshqfmYoU5gI1clkyqXEd9NGTlE7tV8NOnZtambDnE81cq
         PnBO95uyKmlzEvlv98YZJbpj9CnvFCnh8Sf0mRZcKe4HkEzG8e9thAMAlGJf9ICNrWMz
         BaNGzZwIasvRYwTtMEImBOhDu7XWbrPqdBDgJv1h+M1Yo9Y2SdW+ErYtnv/sxzIiMw/+
         sLDw==
X-Forwarded-Encrypted: i=1; AJvYcCXyotD9yQ/XfQxtDjvvq2egyS19yJfmswSuTAGFlbknvdEDUvjN5L+Xyr/d7WcgCzfVAF0yoXIlUqnAlw==@linaro.org
X-Gm-Message-State: AOJu0YzoaKfejpx3ETR+icVjh8oOwidSbo1CYf3GGmpao/UR6AatwSP/
	FXI3b3U5Jy8iU9dvuFdT4X1bkyhxrO9Hdy8Kw6lpQCdXWB85rlwUTOa2nItRL7Fozw==
X-Gm-Gg: ASbGncs7kVWOBm2YY0xX8crWK6YhE080nOhQWgpZDVmjX8dBuaSwGyftyEt4eQ+MRu6
	4p80JuImG/bG9O0f1U4OB99P6nXClPJZV0Sob6tjh1okjLPl2qFbW+VIchdwq1fEyYacl7yES8x
	PEUbGzqN1/NTBSOUoSjyjAS1xwCItY9krOWxWAqNfnTOmXQCz/ydcdIRT/EYBUcMZIzhNMru3vm
	KQVEtGbH4oxGrVUzmOoDKPU9M0zk3SFALLZ//zreqRJGKmE7igRFSWAmzariByqbGbvrGSt5W3A
	T0xTKHrG9i9G8+pWX/b2wX1s/T84Xu3aiMnBSp7+KoPv
X-Google-Smtp-Source: AGHT+IG0vzDaHZgnC6rKOEx/scdI1YP63Fg9bCy7lK0T8agjJCI/Ay2Ce96All1W1vTYmlDF4RvBEw==
X-Received: by 2002:a17:903:41ce:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22780dacaedmr15783575ad.29.1742509817000;
        Thu, 20 Mar 2025 15:30:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 03/30] exec/cpu-all: move cpu_copy to linux-user/qemu.h
Date: Thu, 20 Mar 2025 15:29:35 -0700
Message-Id: <20250320223002.2915728-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PG+tNVbEfT59

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 linux-user/qemu.h      | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d2895fb55b1..74017a5ce7c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -32,8 +32,6 @@
 #include "exec/cpu-defs.h"
 #include "exec/target_page.h"
 
-CPUArchState *cpu_copy(CPUArchState *env);
-
 #include "cpu.h"
 
 /* Validate correct placement of CPUArchState. */
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5f007501518..948de8431a5 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -362,4 +362,7 @@ void *lock_user_string(abi_ulong guest_addr);
 #define unlock_user_struct(host_ptr, guest_addr, copy)		\
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
+/* Clone cpu state */
+CPUArchState *cpu_copy(CPUArchState *env);
+
 #endif /* QEMU_H */
-- 
2.39.5
