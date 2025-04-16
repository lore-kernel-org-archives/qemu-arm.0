Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179256njc;
        Wed, 16 Apr 2025 01:16:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8d:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-73c267d2f14mr1548907b3a.18.1744791388703;
        Wed, 16 Apr 2025 01:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791388; cv=none;
        d=google.com; s=arc-20240605;
        b=MPLFrRIod+querxs3oeJiGUM12SmWwWZ103SLRWoeXH89AlWLXf9jIgFCioYnIKd/L
         AVOVfaPchg1JQgNBjvwqElt8kcQikRsuRjdA1WgFbKf7hntAANUphy3y//tvHG5AG5F/
         gb2CsboPjYsbATIvu6/Y1ZvPdr6WnSKz2l2wWtDrm70328awoEkk+FhDs8IeOZiQ3rOA
         3N1o2GE32eAzhB/3CmtJEwvsK1fwtqzWj62ErM46gFO2Tx53RN+jaRrrRAZE3BMZF+oS
         CU0gg+5mjYU/+VqkWGgKsqOGAdEbkFQhds9TCO5vRIS3oTWc7iSoQUXf+mdkDOHze18E
         9eTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lYpO1k305Wtiuq/zmuKPfj735nkTtZMPOH5ZuTPK1tU=;
        fh=44EJt32sUexDaRKDNrG4nvGVf4pEpV5c4wERqwGLKms=;
        b=UaxDM9rQxuBP+XpKka0rfDCwrZzJQZUJ8Q/giUpuMSWAtXTvbd4PcgtVNdh0mrULso
         upSRob7yyYmJe+oOVhiVcwgCrpQa4ejJ3VHvLERriwjlqdjJ8ns9LddQgY6b6E26YosJ
         nksXRir5bV9IzH28vCQvSpwp/tkL9cuaCARyAihZLro9hSt/BzcPrvFtzs8zKo9jzncU
         SyO/KJ6PIxOaEU4zgJ5oOc1WIKErM43Loh/+VE1O4j7b7MUtt73HLaU7mVz6gp9RZE4I
         ZbezAjHL31BWFJ5KSSJpYB1DxYdz/rXNIZXtXRBvyr3qAvCVcSWy+eplbSKkzEuBt2Sn
         OX0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eeTsvqJf;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bc26deac1sor11402170b3a.4.2025.04.16.01.16.28
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eeTsvqJf;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791388; x=1745396188; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYpO1k305Wtiuq/zmuKPfj735nkTtZMPOH5ZuTPK1tU=;
        b=eeTsvqJfCHbS3PXZ/GNFI1rLSPTHdBAJDzUJ2vQmhNvu2GF8jg7gB4IpDmE8ODr3ec
         ouSa9fmVyK+gaFLnbGNCviGyDsaPjb0gMpY6Mcwk1fx2qC7IGrrPDiyeoIC880T+L5RV
         KXvhpg4Dz2xbSqm8l4lysfpVg/OSKzRngQ2+pKj5sOig6HzdKd8vn6iWZVrehsEHuV60
         siv+v6I8WpZvIbZjgWEZgImk3EIzlp1oPK6xBijEnh6P92YSpaWhIV+lgfkswruulJhr
         kdSOwnfQ4bwXeEgNz7TlXZYArdPV7r2QdP80qfBsaYbjemaxb+xftniDWjWG+1QxzbOb
         dpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791388; x=1745396188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYpO1k305Wtiuq/zmuKPfj735nkTtZMPOH5ZuTPK1tU=;
        b=jw22TkEp9HYVl8Aj9WCCAmWLu+AEfZVWDe4V83z1hR9GW9TpiBaxfA2JobRhAKclcB
         +Ogq6zq/k3Y8Lf0iq363evFgwai6eCzNMLBZzrMjD8W9yxcHVco1tDljS7NLBUMTuPtf
         /H03jH2bggG2SAYOKx2rbq56sfsNHaS6erVQg1mDpSM/6e+WD/iVGY5At2GSEW1lp7oU
         8DmDo9wPPRoehsbUslfrKGWobj9aDMmNMX+j0BawzRZWo2Nr6u4FbN8ERGw5gQ6VxIzc
         uS4XCL/r5t9CkAmlLmZscLjFiLmbWypd3TC0j44YxL23Yc/8wARMnayYuu/8LNWCB6M4
         JpaA==
X-Forwarded-Encrypted: i=1; AJvYcCUdlZpoQTSo/Af7ZfQTmK/15aOeZJwh6UWo0Ef5tZAPLxF2TIfpe51/rDlg0zjN88cbSGvGnmmbSZMDOd79ILFLXQ==@linaro.org, AJvYcCVhJ9LFwOeu2wNbUON/Z6hl5FoJvkDpHBHRmrTNCk1LfLVycYblUYgfTZ2FNC/RlgLkwmuMhgA6@linaro.org, AJvYcCXDHHh7fRoWlq4Hc3QGG6Lv0c3JbGlFUSLvws/PCGKf1ssPKrBoYzUUIkT6tMOhLiNFWV97q/Klmw2sdnTiRujQIgg=@linaro.org, AJvYcCXkX+gVdLZ5ZCZaLxdUP0u6ZtTbdsFsfniEukIwccC/F0M14x3ls8P7ZO6wyVbKkAVxFfUmEwZzllR//GJF@linaro.org
X-Gm-Message-State: AOJu0Yzw6/uS1gVe51aVgf1LD0PM3jObmrMyaUHP+ThKO/lstaqAKNVD
	uHeZe9FivNxwc/d6W/RbCR71RRVaRA1OdlZApUs2E1uFvfFc0EKj
X-Gm-Gg: ASbGncv8dzDlcksqrITyX50YC3TjzTcoFLc/paEn+g2sDFhqgLANpNPuEiflhzAJOoH
	36OFZV/dAIpCnlN4NT6WtaobHSOhKtQJktUkhUb8rCzAtREC37JBWdHlRQ/K1Dlumdgf7QzRh8k
	7h/AxNFjDTMKcd4O1rO9U3N8sXuzDC3L79RXwFZJXKswX4jAK3MNBEft04N3gHm1gLeEGuPWeGP
	8XCo3eVSIqRnxsZlgDOcekuupvKAFh4sI9KDHp87bRBK1b5K2/MmkgqAhAPLh2aH3JDW9SyFX36
	zH7qfOxGmgGPOnTkny5NC0rtOSolf+CYGwZZNlAMpw2dIXoa9f++URud5A==
X-Google-Smtp-Source: AGHT+IF9bDDZbwuPJU2PpdK5gj1XZbWq4WLDXyolVao4ExtH4EJUgh98Q5i9ZONRA1Uraq4j6nEIYg==
X-Received: by 2002:a05:6a00:4c8d:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-73c267d2f14mr1548869b3a.18.1744791388065;
        Wed, 16 Apr 2025 01:16:28 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:27 -0700 (PDT)
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
Subject: [PATCH 11/19] util/cacheflush.c: Update cache flushing mechanism for Emscripten
Date: Wed, 16 Apr 2025 17:14:16 +0900
Message-Id: <97a2164b3f428265136bb1c01615a16b516138c2.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7r3JhoBmmspO

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 include/qemu/cacheflush.h | 3 ++-
 util/cacheflush.c         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
index ae20bcda73..84969801e3 100644
--- a/include/qemu/cacheflush.h
+++ b/include/qemu/cacheflush.h
@@ -19,7 +19,8 @@
  * mappings of the same physical page(s).
  */
 
-#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__s390__) \
+    || defined(EMSCRIPTEN)
 
 static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 1d12899a39..e5aa256cd8 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -225,7 +225,8 @@ static void __attribute__((constructor)) init_cache_info(void)
  * Architecture (+ OS) specific cache flushing mechanisms.
  */
 
-#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__s390__) || \
+    defined(EMSCRIPTEN)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
-- 
2.25.1
