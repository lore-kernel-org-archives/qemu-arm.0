Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136855njd;
        Mon, 21 Apr 2025 22:29:21 -0700 (PDT)
X-Received: by 2002:a17:902:e88f:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22c53581248mr213612015ad.17.1745299761239;
        Mon, 21 Apr 2025 22:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299761; cv=none;
        d=google.com; s=arc-20240605;
        b=iNvzbGfPOAZ8nvo+8yhrZb+NoTO04NL7Q6Z0R7MGAQqeRwtXER4o8S8MxBmniRUI+w
         aYiLK7vhcYMbIdMXAkGXYDXS2zkHd6H0Xokz8kaQ4Vqes/UdUpEFEFnTAgVwX+p0x7HQ
         trOe/GcyixQN+/6Uh6WGdk+duCKrzy+LGmYRMHN++q3FYOWK2XTVkadmHr++lb9/8xo7
         ze+M5/Wk/T6v64GhHmyqZ5fCjRK5sfPlkB62r7MqziAoKHIpqZ3nsoSnufHg2hdvjXX2
         me7CGF3MMoUj59h6Gwnyhby3fkYdirLA2g61Le0k/acWUlPLmwrwsGIrFkEdDyHiwJ3Q
         Lpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=a0zvsPX/FfJ/QEBUSdkp3Xuzprg79q1K+fLsRE/b2DA=;
        fh=OCNPnc03Jh13vZa/Gjmx4b1z1I3MVMezLfcJXhEvLxo=;
        b=NCNfE0gyEskL2jNXNG+gMhlLdEg/rpj9s8owEf2wwT1EJlK6fPhL8L+dNyU0JgYlq7
         +OCOhzfw5CtBub6uYTcvvD9EyZOWOo0Cp95PZ3idNi4M9Hf+3lRPDMu7A3ZBTAv6yYIH
         j7ExL51uBhwBbkn+3DncID+YtvaIcFuZ969mRzVqfRlBWJUtZy3MUyNFnkN+9e+3gmLl
         XjNWVvPZC/NPMc0XF/y5DDJ2ARkCw4tQAfFjq3ZMTI+nee5Ul1NQAwztZmZGMqsFxSvE
         uoGAwBrGq6fnzhTpBjIB8u2GOzWBHzyDj3R5F5k/GnplW7zhL+xDe1eWQtlPWjPlQc9J
         +Rvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VM0boMiK;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bc7f8esor53730115ad.2.2025.04.21.22.29.21
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VM0boMiK;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299761; x=1745904561; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0zvsPX/FfJ/QEBUSdkp3Xuzprg79q1K+fLsRE/b2DA=;
        b=VM0boMiKfGcy7kNqW4g1DW2T8gmr+Q4Ats4IG1H5irk/oFYMRWKr6DVMrU5hoWQ+On
         n5sh7GzJZDC/xHGqUr8BGkAmYxF0tFZFAE6qQp/pzUBubyusQrpQ7Qgaa/3ON3oPGjGP
         GpJCfcEyF/4MkQnFXNpbfEz1D97nvUroW5XTSjf78jjmVzEIUh4wIBTQVtIt9bJe++g7
         gqlFcKFdGhYy6wOfTWvVg7/xzhqyJEFkuLlZVWeMiUEUc1zCni+FmB/ASgluaiuS81yr
         16pVdFxfozdAAgBTW9Eqsnv3Uua1JhVB0G7Lo/5t1XitbBRBN9bgiqDhAmd4J3EM4/sy
         pj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299761; x=1745904561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0zvsPX/FfJ/QEBUSdkp3Xuzprg79q1K+fLsRE/b2DA=;
        b=MmFOQbqqf0AX8Hm24aSYvAz53xZIoLmpAu7lJg0ZcLAZJMkmLb9pliowT4Zz5X3wEJ
         Qj90Gkxp+lPILyqi3Jc9EzDI4RK92UVnDLOaK3fTbfFbu1GSpobfFStp9WErpJ/aiCEt
         kJgZ9tB7+OFRQ1TVNeKNDpe0T7wtn+ufbwhgQe0sxGEae48u6fxOLQTtIksohIWEGk2W
         8IG8MMRVMD/qJX9k1tvwmXcyZx9+cxeiFmeJHpAOXmBa4nvgi46qYDCgSVrTt7jtre6L
         Yi6kElU8l4UhF+6vb7g6r2yXQFeuMVCBb+kKOv1upF/4J6fyx942tFGs6EuBTyMUgo6N
         C8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUg5JUkO4CTiaemIBCm/g5or4TfaSp6YxupuNqYHfj8Y00cz8RVoPbTaGGL4QKuzPlJJbiUD3kq@linaro.org, AJvYcCVRV42j0ZymT9lfPRTJMfbWqbPhut9LYnvjNXH7okgAI0+kP2luQQzXmClDDZv2aflQnQUoYOwelY7ZPFwK@linaro.org, AJvYcCVyi7APqiGIxwudcaSg4EWrpvy7v7frVrhaaqpFgh+Tn6HpcZVtUCD9sffgZ0pmGoYR6PnsqTKEtKniaYjg/pGdzoM=@linaro.org, AJvYcCWKdFAwT8n8c1NQc5mUICzmnr2rWi9hvF3ihOzYCyfA8TgpPLmYB5DVmmgEDvyXrywSJo1bWG0E2usExZT1Nvnn5Q==@linaro.org
X-Gm-Message-State: AOJu0YwH2StEj1uVjBdX2LLX/Apim1nhGoWQWxclvqMntWxT+oD02GRO
	taymwdBqgBQcIv+yhDjuN6Ycl1qSgrZhH4IufZZoiu831P1ZIzjY
X-Gm-Gg: ASbGncubt2TxKyUdiCbrRXh6fNRdPaXVGav6M+S/SypG5blMxwsIiTi82Hi4GKcIDQp
	PD9vmTbig/qoyBMqVWL16JplcI4c7Xf0/r5RrKDgbI3cZCGSSN93cj07vW/aasD5CA8NhKGWd/+
	kxIA15mdJdvAOi24QmlGwyCiu3IP9WWkZBbs+et1FXgfU9hpKrOoOxLrWbzXCVHlvT7hKr/AdOM
	tPXmo6ttcAReRsWZmfz7x5On1/p6SxgqZSBa4lEyFvpSE7dRdZ0DXl1cmz7G/fCPfZ8G8a1RcMJ
	bTlrBDSmEOAcYT1g1YeoE4qd90N/5Z9otT0NI6FQJk2AEJ66TVj4wR30PuQ=
X-Google-Smtp-Source: AGHT+IEjmWmpJ6AAAiaqVT3tzNWYxNrjHbhUCkbn37vCmlnEnKPSfcFShn0zTwGUz13Hrf/oiWTlcQ==
X-Received: by 2002:a17:902:f650:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22c5337a016mr187606955ad.8.1745299760678;
        Mon, 21 Apr 2025 22:29:20 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:20 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 10/20] include/glib-compat.h: Poison g_list_sort and g_slist_sort
Date: Tue, 22 Apr 2025 14:27:14 +0900
Message-Id: <edc1b2ac9a26dc5bbf9a3897e842fbb36c69ea87.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9V7X7s+63sry

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 include/glib-compat.h | 6 ++++++
 1 file changed, 6 insertions(+)

V2:
- Fixed typo in the comment: s/insted/instead/
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 86be439ba0..53f8ea38d3 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -36,6 +36,12 @@
 #include <pwd.h>
 #endif
 
+/* These functions perform function pointer casts which can cause function call
+ * failure on Emscripten. Use g_slist_sort_with_data and g_list_sort_with_data
+ * instead of these functions.
+ */
+#pragma GCC poison g_slist_sort g_list_sort
+
 /*
  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above, allowing
  * use of functions from newer GLib via this compat header needs a little
-- 
2.25.1
