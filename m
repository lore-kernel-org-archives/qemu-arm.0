Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694607njb;
        Mon, 17 Mar 2025 21:51:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWp9ec7wvQD4qCvj2j9BMkkGXOFktY65/wj/mzvI7iVnZFp0zDQQcxMh/pW7AanJyL4Q1caYCQW1HIkJw==@linaro.org
X-Received: by 2002:a05:6a20:43a2:b0:1f5:709d:e0b7 with SMTP id adf61e73a8af0-1f5c1132be7mr24345370637.6.1742273499316;
        Mon, 17 Mar 2025 21:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273499; cv=none;
        d=google.com; s=arc-20240605;
        b=ICACh+maW22eqb3e1WKo03Nxlo50S0wGVlWI57fIQNhNn4wcipOIoQBtcFw5HJlQok
         nAQ/FofEllHeC5v/Farzd3RJC07imyKyBbIo77AhveFi2wHf9UXf2WDSX4bJiUrO4c9S
         QV4DZd2Aeon2dvB62TF8NZCb+iyQdmB8uUa6WtqxTrHnTnWyTjASAVgA7PBOintq8FxA
         cZhy2/3neNrJWfbrbJuK6TgfPX6FLU/sJPPvZhuC/0WKvmuqRuzqAtEQmyuGR4HRZ23C
         3uZhbbndXj+sZkRazXgCZ6QzZ6Ftd0tHslVBWICNIxpPeGbVkCuyhIDDilAoJW88gBvb
         hx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FSHS1XcppE5ZPP6nkhpeNl/9mIWtetza6WviZOkY9i8=;
        fh=5ro9zKQ3RcGsil2XazLYrQ1oBzu+H/Bq7AZoq76ActM=;
        b=J0Cn4R/+hsOjNCWANObbGrpoHwsbgwmbKqxRs5kDkBHsis9oLpiP83XYF5o47NSsva
         6GbEY4ljW7LoBecrFgqR356zUogwFHgw980T4yfaoOGXblwVKoU/skq7ux233c5fT9+7
         7402NqvZgew1yjGEjCkS0Xv4NkGHpr0JSVTR4RSaLmy7AMc9cg3qUruiHrSHBS6UhSuZ
         i0iRwqbBrvrvnUZCBxm550RTIYHFMTFYJTrarLJ9P1WbkkGmFEeEjuK7LdForpCBYMy6
         ryk+0xxC7vRf0hX5j/hD2ybqcGHVtOESFUjw6tGo5ca1/z40tqmO6/Nn2YjDS0+Ob6ur
         a1pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwQGE1AG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737116aeca9sor4911662b3a.7.2025.03.17.21.51.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwQGE1AG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273499; x=1742878299; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSHS1XcppE5ZPP6nkhpeNl/9mIWtetza6WviZOkY9i8=;
        b=OwQGE1AGrDZ+FuKLezzYgibJl0m7wCSFdRMPZeboYgiZyD7whZ0u9cHiAU2ghaHySO
         qdKwgLE/xKRgOVMI1KkmUjcmUTwJJx69NGUBQeb3DBPQBDaRlLpvt2wNhx9KdGzEvSj6
         qRRRNr8+Djuik60hcU8pt+dHzIdaDYpAEd0IZg4b5wTJbHNA184fRh8TqccuStUZ5ygv
         Tc4CjXzccvGdlqBbhLvUaNxCfB7vCBJwPfgjB5IvxrnZpaDrk8DlES05o0v6TcYLEOBj
         ppa/RfFXq9ydZxJwA2wyqSYS8ecsalFsN6G/NFcvL1sLEqWmuxdAoMukEHIZUSWjIAjB
         FBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273499; x=1742878299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSHS1XcppE5ZPP6nkhpeNl/9mIWtetza6WviZOkY9i8=;
        b=qnqmxp55vhryz2JeBZY2uqj2NtxYj4RsgOunDqm7Aw/sIkoU4ZQ5dIXsggT/yv691B
         del9rEljMJmSv5N3+2T/oBrO8d2GoiC+1iwU5n77xOCfTViNk3l3OiPS9Vq1ZWglkk2u
         EoghvzyGvKB23uXPO/Yz2OYIUtlMx2XlwgiLT1I4AXdURTHkRV5LGzpk/JgYvoXNdKri
         D+1QyjpiCgYhQNMLpg3GmMzXVn+B/IsOlHJ+5yPhZu1gYC2ooFV5nIR/Pah215h28fUu
         xKXyuZojWDFukn0g4/CcwU3bAuIoLJfVMRtHuroTMrMZs4wZJHj0y9ZzU2nUJlnGX9u4
         0OsA==
X-Forwarded-Encrypted: i=1; AJvYcCWBvdTlSiscG6RbFzkOcrtvwBEnsDP51y91XFftvCt4TYQFbOm/TMDZuu4pqjPPKTJY4yPfgTDb6N89ew==@linaro.org
X-Gm-Message-State: AOJu0YxhvmtHS3P6rHJsmePgZ7t/o8p3s2Hztc/rBsZ+mo/tws9z+dVa
	Q9fkyvbMYwq4iZskkRH4zjRkDX43M0dbd6oHFR9cpYyFF5+yfyOKSazzfbyfzz5vsQ==
X-Gm-Gg: ASbGnctNVR5sUGbP767bSsivjpBWLqy4KK9gaStcd+wWBM4Z7jfscJx7BnvAuMy6K/W
	ldWqN3W605Csly5l49E0mk9nZ5Scd7eaOwVIzMo9ylMow7n1ekWd6XZpNOpLScHDnTkN9h8kHq8
	M8uqYFQ1yYhBGXmO/7l065LuxXQg1sHUMHPRdaHqTP87M48RPZ20hQsojkWCoh/nUzQ9RP9YCGH
	l+9uWXwBI8HgdnxNuhS7MkPQS9QZJCEDM4PVECqFCDk6N0g97835CkfR4PLhWQDzRkxXuFhsCYS
	tQd7WCS75mgxKJhuazp69Yi4a72BogKy2SS1P4deAu2y
X-Google-Smtp-Source: AGHT+IGLHGqHmqYs4ezZCOm2c2SvTDjQRRs33WUEidalhqMBp81xlxxvFOnPgr1sAs0uuf26mtAqeA==
X-Received: by 2002:a05:6a00:4649:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-7372240beeemr19161977b3a.18.1742273498760;
        Mon, 17 Mar 2025 21:51:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:38 -0700 (PDT)
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
Subject: [PATCH 06/13] exec/poison: KVM_HAVE_MCE_INJECTION can now be poisoned
Date: Mon, 17 Mar 2025 21:51:18 -0700
Message-Id: <20250318045125.759259-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QF+rdDJ0jgNg

We prevent common code to use this define by mistake.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/poison.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 8ed04b31083..816f6f99d16 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -67,4 +67,6 @@
 #pragma GCC poison CONFIG_WHPX
 #pragma GCC poison CONFIG_XEN
 
+#pragma GCC poison KVM_HAVE_MCE_INJECTION
+
 #endif
-- 
2.39.5
