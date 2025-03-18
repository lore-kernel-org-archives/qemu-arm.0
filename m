Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694580njb;
        Mon, 17 Mar 2025 21:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2gTiycKUZw9RKDU11IEj8Bb9PcbOCkhBqZ8z+BDn9tsEWIig48qx6xu7rZhuVsTtLDQIklLAUk3qerQ==@linaro.org
X-Received: by 2002:a05:6a21:789a:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-1f5c127a618mr22071908637.20.1742273495567;
        Mon, 17 Mar 2025 21:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273495; cv=none;
        d=google.com; s=arc-20240605;
        b=lt77mwdkqUPVWQcpCL0QhINUeBCmEVDBfXAaxE2eehi1/NlWqHUqfLQVrvurthfZtw
         7VXZBDk98LZWywfo7arPOpTEh19yPQBfb6HbV/0HdmXrhJFIg0wkkIE7MJ/3+FnuIzeD
         tA4l1SckI/qsli8YyNJwEB8qMFDey4xa3PdHNoN6HEdOiuXbIvFHN4gylNlLpFwA60eK
         qGlkQ98e0IQvsjHSDsRYCdSCTxGNLc33lwWFSIdatPGRtYSo5x6aRkH2tJAYX+nkXgDt
         6uyXtJ1X4cw/ORJq3sv/3DbZDesMwkhCkkZaZOVmxC7urkWQvB8uNEsB++iWq4IBnmZ6
         8p4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OAWROUlIn7auIWdaE5em6TVb2NvztQjiLgpJIDrbZCE=;
        fh=4J2+9pdapsl4eVhz/Np4AKfCUwDvid7+GQJoUvDeEh8=;
        b=Z7jdPj45GgWlZIBfnoXBLnv9wNKKt0c9ixL0/MdMOpAQxOaA1Ya+IdedVE4Mg+1uvX
         lciLs2lnaGOV9IHHS9uzDffGJgzy+oFloJv4kePxt+UzMgFeuIgTMxGog2dKNsTfmXKI
         3w1Chz9Z/NZ/8zYYbVpynQ68mwtffcRgSbrHE5XKVmLkD3T3U1Cne0l6pVg763NW7cYA
         80ODeViCe9+QQSCoyJrSpImlwGSgS8T15WOYRQ+3GGxzd+gw9fg41bNlaxcjB8DWVhLS
         QSq+w69/aE0Tt0exQsNmAJiDcbpS7v5fimftuAtGePlHNzyNanzqiFdsraAIuHgN4vaB
         vzXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibTkFWdU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737113d771fsor5241431b3a.0.2025.03.17.21.51.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibTkFWdU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273495; x=1742878295; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAWROUlIn7auIWdaE5em6TVb2NvztQjiLgpJIDrbZCE=;
        b=ibTkFWdUIhmiyb+5no9pqAy84ss/eGHosN36IOzjFl23qRR28fefb5s6IBkVRnMpG6
         503mrWUHm6X82Sxg4GJXQc9Pm7W3ab81oqnUcVpRQ4j4m3ftZHbvhOOFUVDhkXEXKWd2
         FxnDgwgIU6aF496yVXDtzURYpEfMZhUb3XWuIPQSiuSvHhUmlbmyUX9aH+jJaUTbW+BC
         ccPN9PnGH7AHt0mhP1+EmuMari/Z3+bXYK9c22GDBVCmmEn8218w+G8ivFdQSSFXMIBc
         2WOQP89J61jJynUBZ7Spu/oGc9/kk55lSXtoBPenQoaJwyEmmQDzvzteIlXR/TfukvWr
         PFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273495; x=1742878295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAWROUlIn7auIWdaE5em6TVb2NvztQjiLgpJIDrbZCE=;
        b=YDNViL6FpdOEM4tcUu6q2rwV4IdDQv85bBhjPdg1NvpWA/Nc9nReawRXJ2mVtDPlX3
         H/7ZCT3l5XDifLf1M3WHAzHZpJINmCimcULVCpg5er0YGh/CxhudKZMMzN+PN0MaJBFH
         GGKtOj62mr0SfA/CGZh6ybgoVg/IuppbQzKb+61Gvaa/BrWYcvDWOEtlZBKJchqT0Ep+
         9oAn7w7VMxLlPxTRPTDUr6iY6zK/Mh7wTF1ZbjF56yH7CdTZ2A6MqK5mvWGNbqUUbLwd
         B71HFskT1jN3IMoycjV+kkj/PNtsTZ9IGnfS6oDJEDzXNqpv980Pen534scYr1NSVUdE
         Ujyw==
X-Forwarded-Encrypted: i=1; AJvYcCXO2DsPcbEV1s2jFRa7KaMp1FBOsliEjxffZtkIunSlfhQB5e8EFDxoAvq02ZI/TFE9TyA1St9fZ75BxQ==@linaro.org
X-Gm-Message-State: AOJu0YzljG2NN1WyVR421dfgQtadoEymOxyfWJcuGOj3aACFzz0wi3oO
	LbjkOCiFxZkiWXdDa+oL/osf6tigElmiitAjZxuC/jRnt7vuwSUKRVEnvqOmHpoovQ==
X-Gm-Gg: ASbGncu+XKlp0IdSDB4JKGGoZB1I6toc1sN23csHdavS2I4KkMUaNNL2RNxC3tP5DpJ
	kZy8jIyQinz0IaZ0FQS6PHwK+6QTheYc1MNsJFWCPsXpZn6nOZyuoiog8La8L1Zrhr6JV8ymoLJ
	LgJpayBN/Wivq4nqQ0xr27C28ryR9bLEkewuEVvVu/R4/MVcSCwpPwd2Ya/WgUadbP13rFx0T+Q
	NqVSHncKsqEtLfW1HETW9tXj2kI6XMlllG7DL0Yuj2bQGJe+m9Qft2EGzA1xbMLLGtqVOJ6Sij7
	/bxHqW3ALVStwuv7kExyOz9QuheQ/I4W8eHEXliyKeOd
X-Google-Smtp-Source: AGHT+IEt46y/1QHMt9sgoOzblTQOO/Vh992GC9mrguK0N9zijMCVTkkxREI+0zrgLP1cwHkaSo90Bw==
X-Received: by 2002:a05:6a00:b95:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-73722353269mr17764448b3a.7.1742273495053;
        Mon, 17 Mar 2025 21:51:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 02/13] exec/cpu-all: restrict compile time assert to target specific code
Date: Mon, 17 Mar 2025 21:51:14 -0700
Message-Id: <20250318045125.759259-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wpD6bENu5uQc

TLB_FLAGS defines are based on TARGET_PAGE_BITS_MIN, which is defined
for every target.

In the next commit, we'll introduce a non-static define for
TARGET_PAGE_BITS_MIN in common code, thus, we can't check this at
compile time, except in target specific code.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 6dd71eb0de9..7c6c47c43ed 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -112,8 +112,10 @@ static inline int cpu_mmu_index(CPUState *cs, bool ifetch)
 
 #define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT | TLB_CHECK_ALIGNED)
 
+#ifdef COMPILING_PER_TARGET
 /* The two sets of flags must not overlap. */
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
+#endif
 
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.39.5
