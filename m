Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2743000njc;
        Mon, 18 Nov 2024 09:24:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOFiPBpPXtBxAVWofjdFOFC6tHUpKBOTaKdbI03+u/xTnLCvYoAnD7UKsnO9RK7qpDDAxUoQO54naOMg==@linaro.org
X-Received: by 2002:a05:6a21:7886:b0:1dc:5e5:ea65 with SMTP id adf61e73a8af0-1dc90bdf6b4mr18982568637.34.1731950657672;
        Mon, 18 Nov 2024 09:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950657; cv=none;
        d=google.com; s=arc-20240605;
        b=iRFHQAq3mGpqAV1BoO+Ot3+gWQL11qjtd+GVCs3HDNavytzmV4LNJf9NrVARp7M5w0
         72EVSDkl5ru5utEU1ja4mSbbb7aTW+KeODikJeBjchZwxMr/NOr9TaT0v3M6CJRvllqE
         pf7v0BwWs4gXBssP6jQdT/bfjd/MQBBWmAhjxf3gd9pbaZd5+mH/RCsw5hXXneYSRt7c
         ROM2V4VPCt2fDfvmcsW5s1+RUZkdcmeNV3ymmDq+C432NUNrkes681K3UKwYDKKqKRQd
         FB92sR2AgE+Q6hKGwGeNtFPQHrghM0Svf9j9zxp6kk4A/5Pp2O7zqd8j9P/OhYoCNdZG
         /RYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oJI8STVH8Bo0tJY7LAmXxwBqwEyTRfjQjwFSYQdXg1E=;
        fh=MoEaVSMcko8F3TYZ9GGj/uTQgz3R6h3m6+nYnlKpM0s=;
        b=ARTmUUG7UBzvtDTM6DPeF+xTp5e28YYEaki3fuHTdI7UTIwP5YjTqg6K/97ldlsaYY
         Bm8i2dJI5DVNZkj4D17OZ+C87LtK+qHadHhjqGfi0c1RPvt3NSGSrN1jhKATalJz04v0
         1gONbIjMYPaBoGg6IXKqY12a4p5SPFEwKz1yK5lTm451JWPGlOBnYSM868/8ffI8v05Z
         EGxp4E6D/lXn44taa3Wl1fCHWpe9RLf3HpEu/nRpgxmWLfbyGwPpuCumSMsU+0LQKwMz
         wnme5Z8RfiKTyu1Rm+LXTR9SG0k6v2VFm09tAXvLSqKTLdu6zgHxl4jLbU2ZiyrV+/AD
         g6xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLlp5vdi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211eca179b6sor45154165ad.1.2024.11.18.09.24.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OLlp5vdi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950657; x=1732555457; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJI8STVH8Bo0tJY7LAmXxwBqwEyTRfjQjwFSYQdXg1E=;
        b=OLlp5vdio4+r9SvLcVn/1RfCBgUZNqXrtH9vrWrTUfWaNHBKRxQBX66tQYYA3GU6se
         Zukhj16Y1njckSdNc3k0UAJr3qYyZpNYMAm3AyveIf2+ebDQyAZUcBu7Mii5oHTwYWNd
         oB9v9jz0YYwuscZN7U0VKhSuXerzd/zxrTNSW2mmNvPAmKHaeptdoOZu1aQcQ4bSUG2k
         Q4Xs961P45c0aWASUfNFiW3GoPfQ++26oj5t227o1r8Qcqig0LiX0K58aoasgGsfdv/K
         B9kdvu39N0EORdbKZBjv9ff+RYhID+twS9SWpJGtU6n8lN15ChLgwd6OC1oz+4NwvJYW
         QMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950657; x=1732555457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJI8STVH8Bo0tJY7LAmXxwBqwEyTRfjQjwFSYQdXg1E=;
        b=C8DOecX+hhRx78ER2pwY+Y3+Yk/TpluS13eAjvjJ7H+LUa5JxBSEKTRuZF0wFPWxhs
         BtwOLAXNrsl6dJrSUA2yEXcTvF52f2uM63FX3XBNo7GnPgrVuQ7SthgS/+TUDyWyWqxC
         KzRjNOC3TYzOC5EzuUMyQ07X/PzmHqBJiw1IXGoV5ZYjdykGBmNQnvns2okXZS6Foefs
         DxfOqGKbozo8sSuqTxQPL11pUx9McpyRxXCx0JF7dYpcFgSlq3zhEDp85o8ZHDDQ5GmO
         1Nbc156hE9h23JTkews2A7Jb+gp1vig+JBg/DTzYfXmE/nFFntjyMtK8X/MohfOxpgF1
         Hs8g==
X-Forwarded-Encrypted: i=1; AJvYcCXgcOgP3dPVflRznWWCYcJ7rrnd8QYmWY6wjTbMnMvII33+2gBNB7V4idRNApc885frB/clkJVCYG8+RA==@linaro.org
X-Gm-Message-State: AOJu0YxLSMHhYtOjI/p1skvEqkZ6c8A3TRru92kkTsMtte5MIveKtccP
	aJM4lEwhXauptI90LJ41UtEcEnA8LUeXAAgPzeIsqR+sM0us0501jemPC3t9fGHu9w==
X-Google-Smtp-Source: AGHT+IGKRu9eW2HfGpfNTqNSZ6X9JKssRl87etJ63B8V8eQW5O/yNx303ObNGLP/peeM6ZoQWUEZEA==
X-Received: by 2002:a17:903:188:b0:211:f6e4:d68f with SMTP id d9443c01a7336-211f6e4d9f6mr102645405ad.6.1731950657231;
        Mon, 18 Nov 2024 09:24:17 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:16 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 3/7] docs/devel: add b4 for patch retrieval
Date: Mon, 18 Nov 2024 09:23:53 -0800
Message-Id: <20241118172357.475281-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sv/n8NnZ0Xea

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 953682f20cb..d25c677d996 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -417,6 +417,16 @@ For more details on how QEMU's stable process works, refer to the
 
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
 Participating in Code Review
 ----------------------------
 
-- 
2.39.5
