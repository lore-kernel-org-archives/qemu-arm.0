Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2794057njb;
        Mon, 9 Dec 2024 10:31:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLGY0VQOR+vpzDN00A/o4SabGyEV5YgCktqgy0oU39/rx67oNx4gNhqU7FVdEhaiDsDqadz9Ubevv7Ng==@linaro.org
X-Received: by 2002:a05:6a00:2d13:b0:725:f212:12e5 with SMTP id d2e1a72fcca58-725f2121b65mr4993040b3a.24.1733769071597;
        Mon, 09 Dec 2024 10:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733769071; cv=none;
        d=google.com; s=arc-20240605;
        b=d2udh5jpq8566QLshjuhec9c/GV6/ufWvuQA9jX2i695/HVuj67JXSFzUkg9vxo0N+
         MtI2gzdg7dsVE8jleDpWLW3MwI33OiKqZRMZy+eJwsBJQ+IsF7M8L1beE1j5b3EYNSeK
         BbWQZy8P9cqlP2kXtAlmj7rjaoeyVeUw7zkxAF2YRGvuwPzshQTrG33JHuLX2kXTfguI
         0Dexo9JQd5sZd/kp/MwUWDXq7fCZeol0bMpsu62+Tj5/GeAYBVwWLtFUsQi584aSD84F
         Ju4tjroUJE+7wtgdE8NE7WCF9qr/bIHvO5Dcmy6hhZwNpHTXEqQUvF+H72Aj1TZURuUP
         Knhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=G1VOR+XcM8CwYRfbqrbxazmYwC9oKrYhK/MN/rkEn/Q=;
        fh=ZLxG3ZZ16+y7b0NVRwdqjIX+3y18pNfsRx9iQxyYm/c=;
        b=DLOHT99G8E8IBqSxnR3pdBxuaDXN4IuYmCgOMaQVed3zJRSaEJu9zMdU4/YnFLz4ce
         a7HPxhyn+QTft9Rgj0owZu/7VajXTLN1WZ2o5ICeWwAzpLobnS0XbQ3tlDYiuTzks2Vq
         Kp3rqoORS+dQaTz5I5GbBvAUKasE1YEMnTDHJ1olQNcrWr8O+CBUw2VjU8txkzTemCDP
         UFPudzCOEEpIauNmApjLEPkYoMLNB1drKBiO9AK29PIub+X8jXl8ih1Deec5kfryKKOh
         xo8z5rQg/U91WW8ZbrPx9ZibF3RdcSFVIGb9ezE4yPxGaRrtcxr52AM8849JwrYYuKNy
         q2hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSpN+FoJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725eee8afaesor1516882b3a.9.2024.12.09.10.31.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Dec 2024 10:31:11 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSpN+FoJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733769071; x=1734373871; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1VOR+XcM8CwYRfbqrbxazmYwC9oKrYhK/MN/rkEn/Q=;
        b=dSpN+FoJ/8NCIb4hLinVHxRBy4y4uagGjdl4k1Q+La/rIfbGP4ZqA1ON0fXGrq+h6h
         UlCdd3in0+gOeZnJHyHSeiGDTkczRYBnHi7eqCkonGLoe9yFTQRJbZevwFmzxwg9kGMp
         BU5Adp1IMutFOAIj6SzfZh06ajjjMyJYiy3hVWoZhKuP+5iXEuqcTEGoT38kiRxMot1H
         wZE+w1R9SirLqGSGcE464DhtKlrNiKn9yUYlPuBQO350bUXjYWHj/jtCMU9euDpHO3rK
         L+n0iYnYoZ3UMuInvu9QJPTmIKDnVXZlZnmPG9CTPhASJ5BXSabcgcO8cMZEF2g2Ci7w
         8ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769071; x=1734373871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1VOR+XcM8CwYRfbqrbxazmYwC9oKrYhK/MN/rkEn/Q=;
        b=Sql7lXoIWqBv/N9cvzr8jWWCYPb3MN6njYr8g6zbYsQCtUSbex97KFshipv46+lyIN
         Q3FiyPGPlusg+Yox7oy7qZD7IjciqjmIApfCusqGzHpgRNgIYn/frgupi5F1shsd9d8/
         5Si3pc8mRSfdC2OSvNxVcvUXEEgjQPrF3GhqKBfZ33RMRaHWzBvRlFTjroKUPJbfTuth
         oQ5eo1/bqPvKb3B9Q9G3L2dTi2bxrfbgzs4RUY9MQv4b+hiDa6DN2AC7o9KeaOBerc0J
         hDJr/TIEU9fuMOAgRmOhaQjiBFe3Bxs6k/25mzUXrn4X+T3+TQ8TvhT7lPaxGrGFLroz
         As4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWHbPEkS2pSBPkZ6AJZ9ghc+znSRhCh/j5DnrfOnTiX7lV1cqOAlAsTkl8N8CvMJMZA2IjbjB8BMqfrg==@linaro.org
X-Gm-Message-State: AOJu0Yzsor72uDELi8HMHQmgB4n1NSYfSD0bHoF0pmLOhG/y6HCWdtly
	irfbpFQCi2hEiVoqufYKI7zZMZNw1A4LnrrrrVBfFldSxEKlP4efpwujOL8/v9/i+Q==
X-Gm-Gg: ASbGnctxRGeY3WsFxDzSAzJmL8l16ZZnjHrOBKTTdtvlTJ15QBrnHZrZPKNU56Oeh3c
	GLrIWUplbEOg0Usy9DnrdkQJ7fTBreOLmuTDWl95GQmZtUz35tRiBzR2lOqZrHanPwSvYuxLKDa
	+xJ/tqjBDnFK700gkcrQsZqFqwpLLQvMbeKJ1Qd07Atgkvw+/O3C/jicz9RiqqugDu0sXjL9KSj
	FU641X3pRr7nVv+SOAsthtq0SBXCIOS20PLPR5Tfr/DZGBlsXWPglpw8fmv2rfbJ96w5beR2xS6
	VYJQW5RkQjOh
X-Google-Smtp-Source: AGHT+IEXRHQmFLOcJlksi4NjoGEt2qTEb+UNr9ZNna4mBykL2R6hP0+kn6KJCVsSIaIz7h2XZ+rUlg==
X-Received: by 2002:a05:6a20:3d87:b0:1d9:c615:d1e6 with SMTP id adf61e73a8af0-1e18700f9d8mr20290552637.0.1733769071164;
        Mon, 09 Dec 2024 10:31:11 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e2388d37sm3322821b3a.73.2024.12.09.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 10:31:10 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	qemu-block@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	philmd@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Markus Armbruster <armbru@redhat.com>,
	gustavo.romero@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 3/6] docs/devel: add b4 for patch retrieval
Date: Mon,  9 Dec 2024 10:31:01 -0800
Message-Id: <20241209183104.365796-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
References: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3wauazNilKfp

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 69df7682c5e..65c64078cb3 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -433,6 +433,20 @@ For more details on how QEMU's stable process works, refer to the
 
 .. _participating_in_code_review:
 
+Retrieve an existing series
+---------------------------
+
+If you want to apply an existing series on top of your tree, you can simply use
+`b4 <https://github.com/mricon/b4>`__.
+
+::
+
+    b4 shazam $msg-id
+
+The message id is related to the patch series that has been sent to the mailing
+list. You need to retrieve the "Message-Id:" header from one of the patches. Any
+of them can be used and b4 will apply the whole series.
+
 Participating in Code Review
 ----------------------------
 
-- 
2.39.5
