Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783675njd;
        Sun, 27 Apr 2025 23:40:59 -0700 (PDT)
X-Received: by 2002:a17:90b:270b:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-30a01339f6fmr13155655a91.18.1745822459743;
        Sun, 27 Apr 2025 23:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822459; cv=none;
        d=google.com; s=arc-20240605;
        b=LdJsmCpfEYUyMuCOu/JKDVa511C1/8tvK9m5lGNi50ONT11aIEBTHp4ALSkioJFT5h
         dbwdUgZ55ruNSgrQszZZcPeiQv4lZyf/UDCKVenMNseDK62mUYkdd/UrPF+PpiYiFWzT
         6fO+x1DSBEUmBVIjeN47cZ/FXQ/LrExWvvs+7PgTLTlQM/djm35SO0kuRYJSnGl8gVTD
         xh1m1KMj8VTs7o3AcVdvGC9WxAhjObshlephi3ydllSgftrp1xCFjZIl3qVDyYMCPoci
         bAt/VR191WA/pJd3979AOd45SmHm++YFue/PYOWMechLDoVXMBLsJcrmLyqByZOIKjq0
         NPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=o6Y5fduZ/n7B0lws/L+kMEP40MZKy5lZ1C1ofdKXGng=;
        fh=ziJv2LgVoERYw8TdPdV67n71AEFV6uYIVwgl1JKh6Lo=;
        b=fFF/g3YdlmnGjewe3C/Za7/ZGCG/ENtQQPw0QFzNwGpHkoW+4lg2Sln26srEe59E2s
         NELtuLdEJfjhGhYr2pVB7NzA521udacPT/w3Td3YaSQrw39qgUgl6VgU04HhBiOiB/7S
         +AvqFT2vj6Ac5YuNWvDBvroCKSy+RltLUOFf8UkNBAlAneavE8l0d0Y54UkZNb5EPbLP
         6/AxHsqKxGoFJvJ8PJGw39DTnQIy98Bavja6aVrlPBZy3orLjb3FermyR2tlHImgNzJT
         qCM51KpIVNO6TjQyRz1uNKDTHFmf4rEmUq/7dLOXy8A6I8VkN4TC7TwMHxu07vcXBH9d
         GZ0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejKStpGI;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f8798sor52893985ad.11.2025.04.27.23.40.59
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejKStpGI;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822459; x=1746427259; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6Y5fduZ/n7B0lws/L+kMEP40MZKy5lZ1C1ofdKXGng=;
        b=ejKStpGIBoSiG/16tb/Fp+o0889LnOTgVG7mcoM3dkj659UfIwKsqrpmu/KRjJUi1d
         OmyGL5Aq1UTU34Sj0ajVFNWgCRRc8gzHl1BAJ1MeT3Z4KXhLfZ6irbgBJWi5HUZoSxS+
         mpe4Z6cX22oGSuJOwy5Abe+gFwjeVl8yQDVEejxPt5uzBgMYNGpAYtV8G+jOEh3f3/s7
         7n8mQVCiJe2zJPhkmNsjx9iNbJWc0adwGHecCxpDHHPHe8D4v+xlGi5RN9EbGiGFqT1h
         WjCdOjv6XSO0lRDebObY/dsqrKKz2OfNHDCOuegzQLLY16n7UTI4wCvPWXu30wpEGxQR
         tNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822459; x=1746427259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6Y5fduZ/n7B0lws/L+kMEP40MZKy5lZ1C1ofdKXGng=;
        b=dxIf5LoEO9rMAg4KhL6crJyTyevLr3NH1jXX5OxTyMQkuGmLQcw7acHhhcipasw5hT
         r98zJtYyQM6jC5Q1PGoSQKbmT4VH3OMIOXvG3ADEfRmZ7IvNWVXEC0wL015imfigH6Gb
         wY30nrg8rbyGdTdD1Na+renRLZi7G4AcCkouOC+jSVXgxoo6P5+JsC5yt6RuD5vFs/UG
         rUxJRyBWBjGhaSRV9qRqax9tgwTdznyivjYbSR0bj/RrCRVfVFnFzLHod3WOG6Ax+eo0
         U4oBIXBDZe/KKiJwKhZqsQc6e8f2rpvZqI6JXnTyEqIMzo9RYVXG6lwxCGJCxAhXSJJd
         tkbw==
X-Forwarded-Encrypted: i=1; AJvYcCUUeRCDxsCZqn54RPIQd/gg1uc7EpQvo4f5rYASW82aTZt436x3qi3bgxfZ6iKjaBHIRvRsmdhBDL8r37XR@linaro.org, AJvYcCW6H5CYWUWOGqiqj3XtOC1PURubdlUkzevkSkeZDt46gatS2LLOQwEfKQDxreHZqdCs1UqMPB8bJjjVh4NwxhXg0SY=@linaro.org, AJvYcCWxFMkOgox9oGo1s0BdRIk6jw2ZQi1K6BvMlRjiJGZ2o0TKJf0drC0uKH8gKi5uQbba5ee+qND7r0rqaAFNm69rSw==@linaro.org, AJvYcCXJo3l4IjP59F06pEbULjhc7ZEgEr7IyPjdh1l98TpyhNQeGgPyTnZhs7Lds4dZB12yq7bMeU98@linaro.org
X-Gm-Message-State: AOJu0YweSqWK6UAyvQl6lLtgeztHTGHez3WjIogTPIu5UIGRYCHKT4dH
	MnRl2puA3vepPmoz8gfURq749Y7yvyIN1SNh7S5avJuGshG8t7oh
X-Gm-Gg: ASbGncvYmb0CVY14rlr+dAlGsVKPZ5xUZTgDVc2DFjgQHE5siiQHjpldcExduurCWJV
	pEn/A6FP30OCJd3X6btK906JuzbZgfEE7qPPZ5JXeI10uxVgDMPBM08hoDY2015BWajofWkL19v
	iZ4lqSDcyq40oOBV0fBkzXxUHCZoUUYYV96yuo5GruztOrdg0Qt8MKJHeAI1oRHki8iJCkEW1MH
	FmnZQDHhTNImbkvwE0dgwDFjsABxtPsplwso5K889D9iBTuHxCZS4y/+0eayxEJ13WNU9w/1E8H
	qU3XK3KTl9g6zY4U1R2Y/Yd+ynOu7CH9pQVaEzPG/0oA5rT/
X-Google-Smtp-Source: AGHT+IFg4N8OT8wKmU3nQHn6zk4dFjhpvs/A9pwNKzARPLnM/GCRvPNR7NLeZX5eUAhAVxIGHW/tpw==
X-Received: by 2002:a17:902:d2ce:b0:229:1717:882a with SMTP id d9443c01a7336-22dc69efaeemr117641465ad.4.1745822459147;
        Sun, 27 Apr 2025 23:40:59 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:58 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
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
Subject: [PATCH v3 10/20] include/glib-compat.h: Poison g_list_sort and g_slist_sort
Date: Mon, 28 Apr 2025 15:38:59 +0900
Message-ID: <fa57c8069d6c723f5b947560677f4ca596334330.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: abGFnFe0za/E

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/glib-compat.h | 7 +++++++
 1 file changed, 7 insertions(+)

V3:
- Fixed the multiline comment to ensure it starts with "/*" on a separate
  line.

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 86be439ba0..2e32b90f05 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -36,6 +36,13 @@
 #include <pwd.h>
 #endif
 
+/*
+ * These functions perform function pointer casts which can cause function call
+ * failure on Emscripten. Use g_slist_sort_with_data and g_list_sort_with_data
+ * instead of these functions.
+ */
+#pragma GCC poison g_slist_sort g_list_sort
+
 /*
  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above, allowing
  * use of functions from newer GLib via this compat header needs a little
-- 
2.43.0
