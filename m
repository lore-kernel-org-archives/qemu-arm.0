Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397067njc;
        Mon, 24 Mar 2025 21:59:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtk01wmF3s6gqme+OEBClSserdUBKsAZGCj2IkSHhjre7L1cf6ACt6qgsQ/9Dg5O0KbJ/ruFMalhTLKg==@linaro.org
X-Received: by 2002:a17:902:f54e:b0:223:fb3a:8647 with SMTP id d9443c01a7336-22780e0a4b3mr244498355ad.41.1742878777521;
        Mon, 24 Mar 2025 21:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878777; cv=none;
        d=google.com; s=arc-20240605;
        b=jZA+GjArmmEexLrG3DaZWjxv/4mQ3sHaCZgLpFPl/5efZ8WtLoHFolFYZN/hvJH83u
         47NonSW03tlrc9LZ9FvE0q5esBY9AbKGbFqAdOXNeNPFRbqSyaD4T5gWYeVzUjW7JWh3
         cW3m0FLWRNXitDsB5TxJj4E57inlPWN2mLxBu7X2sx5x2Fm1FZaSupCmQQZMuWHeR53t
         RzImBHc5EqOy2Uev+pBKJzaqrOx0Amd8OelyW9/AAZH8fimC8WNC876gocynavq7sV4n
         +bZq7h9BpZq9lOMbH2h7T7QY+Z7+25p7zGL4/UVzNTiZMvJyFw7xqP0eocIg4d53nPuS
         wxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        fh=pwiudG5onsHuOlGVUlQ1oebMm7FNuEP7p/pW81bCqQQ=;
        b=Qky3KkAkKgGPQut3NRZvA4iney1rpr9GWDXYgA9yQ/1/0mwOQ/ihvyJ1DAdd9FCAiS
         l6r2qwvFJ/sd+vo9xPgm6VrLnDqicgwnWPD0+SZx9HhMQcfeABvGgGHZP1gHpotvfHRC
         gYtibb2rYqunQGycw587ZX8uhQwNTutwoFJ6hKb/XE6ngaCBeCd7g6SdvIsMegbcWxwU
         7G+/NLRf5i3+eALNOMjj+3CQr4sV0V0YuvUyWNq6TcHa1BnW4mQson9xi2anQKN38txE
         7mGSa8iNhhbOApM/1fgpu8o/OtbFv2vHkXDkFG5Hw8/DIQJTBHzrhG+C/pSTf5CGlXg9
         meqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMCDFEIG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227812380f1sor62136835ad.15.2025.03.24.21.59.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AMCDFEIG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878777; x=1743483577; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        b=AMCDFEIGF+mFhIpMsK7TDPbgpCrAvssvdIfNY2HRZiePQZ1AehFYGMp0GtbEQD3vr7
         QGiN6EoK9yztEVTeYcrWHY1UJ3XlZB800T5DDUVzTalJg6rbrzSJKkFhfZWa8nCzz0uI
         iyJGjPn1AdoHvEFV3xEwLKd4GY55Wi1X/8Zcq7phLJ6nWtLWi9yk+TG7gx870I11/AVF
         Y3zdvmGSjon1ahYz06vj0cqT7w0YNCZUqajBhwQSPPVZCf2IcpApo4vAeXZAgGk27WbH
         8J3M6NI/uKMcpkDeYY02W+Jz/tQ8hXM/5kcKu264uiSTA1SrO9zAng80xoiN1lczUTYe
         AXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878777; x=1743483577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        b=nTy1tMVoWFsYyErmB+YOVT6XggU36CRAfCgOHYXx5emRhNWAY0AbVrqQf+nBz4QVyD
         /oJSh8grncjZg59CD1utEZfQP/ImykI9ucxBiVo/08R5ckFJC7g6bYqXvpd0JQqFI1Cd
         zJPZvX288UwTOJipgVvhetE886V+0iXq03qvWVxBTfsfSDl5u/PM8nU+zYREYKxvg0Sq
         6oocvSegEJnZHiDVVPnfNrHlYuQlw7bB+KQU/t4VxsiUY42E3ucenqkl8pdpmOKf/Zuv
         ZSuRl3eIOMcBu5yoHGCArCI9IdlKoMINdLoK5hcEd+kxbkLX7sPImIH7FUyUwq8e7e3j
         6+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXHOhRVChE+9WPCvtjd7jARqliBpm/J6fZYwDFgRu/MvsmZVMmD3ZYWz/q22WwZ5UAVKg3+CN3UgxSjFg==@linaro.org
X-Gm-Message-State: AOJu0YyqlfmokyWQsw8nhDY66s0uoHco9bHWIc3uiXVnWSCBpmI9AnIz
	KMtv/U+pm3aw/utChXBfn1cpNc6O8dyEfSIXH9gH2NvaaqlnrTGDK/iR69XzPYUoSg==
X-Gm-Gg: ASbGncsyI9Ue4hXBGJlhHS/nh3CCht9xGORxGMepvEMwFgjvt1tXR38PMiu9f6tIZjk
	BDbValQq+JiuE8OSOB6ARwFwoO3dZ29/mEBJl8bHYRCSR2vYMepc4eHqZ9g5ckxOz4dO0myBovl
	7ffgnI3/d4+lU1yBNMI32kQYP9+2VTGv5YNh2NPNApNMjuDM+1y5FP7Bimigtm+SifYPqtb8nKE
	mzb+f8nWuNBwepF0xUjq1srlY9pUYMI04wpuMieHmHbvc1ec9WlifEwzi0mFyuJIVUp5LDtz98k
	EMRoFCJVevAJdBTaJZbgpys200a/DXVrlaodrVYxsled
X-Google-Smtp-Source: AGHT+IE6/e75fo+Kg/zgnWaJm+LIfAfDzGoGdg/CTmdUB6XE9NW7yCx2vtaKJnH35gGHMugZZFYWOw==
X-Received: by 2002:a17:90b:2743:b0:2ff:4a8d:74f8 with SMTP id 98e67ed59e1d1-3030fe721dfmr22138307a91.6.1742878776987;
        Mon, 24 Mar 2025 21:59:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:36 -0700 (PDT)
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
Subject: [PATCH v3 16/29] exec/target_page: runtime defintion for TARGET_PAGE_BITS_MIN
Date: Mon, 24 Mar 2025 21:59:01 -0700
Message-Id: <20250325045915.994760-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YDc6sljxCaNr

We introduce later a mechanism to skip cpu definitions inclusion, so we
can detect it here, and call the correct runtime function instead.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/target_page.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/target_page.h b/include/exec/target_page.h
index 8e89e5cbe6f..aeddb25c743 100644
--- a/include/exec/target_page.h
+++ b/include/exec/target_page.h
@@ -40,6 +40,9 @@ extern const TargetPageBits target_page;
 #  define TARGET_PAGE_MASK   ((TARGET_PAGE_TYPE)target_page.mask)
 # endif
 # define TARGET_PAGE_SIZE    (-(int)TARGET_PAGE_MASK)
+# ifndef TARGET_PAGE_BITS_MIN
+#  define TARGET_PAGE_BITS_MIN qemu_target_page_bits_min()
+# endif
 #else
 # define TARGET_PAGE_BITS_MIN TARGET_PAGE_BITS
 # define TARGET_PAGE_SIZE    (1 << TARGET_PAGE_BITS)
-- 
2.39.5
