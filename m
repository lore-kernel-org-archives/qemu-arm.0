Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136547njd;
        Mon, 21 Apr 2025 22:28:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8b:b0:308:7270:d6e9 with SMTP id 98e67ed59e1d1-3087bb53527mr23720414a91.9.1745299699534;
        Mon, 21 Apr 2025 22:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299699; cv=none;
        d=google.com; s=arc-20240605;
        b=XjjidnQ3PAPZBY2dD/7s0GIrK71jZLS+kbefkzBTTW4ljdxbJmD8EA+KPHFM6wWTLP
         HSuimB4upYVKeAzspFUWXpGWe2RQbPhtXWFfUls8wmUxPPfvcQ2etTxsn07nzEbeShzY
         TNN5pqfvBPsN2VGOd3yWm3mWOVANxJSPKLYiER5O9aiVmhKZ+ArZA2/ehLnYtxxIxCGd
         DlRMOvzOQPd+yhCIBWqyWX1I1g1NTZu7AKUyIRLgNXCrh7fNJCC3phP4RuTw/4Y+yiC/
         u+XViRRZQDWEBMG/wyRYdG7ayCsQuFQ72/csB9ax+gvYA3HW3cz+GfzZpvAGK9mlksY2
         zHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c9YjZLFky15fQ25eN+PsZB2kxxrFQ2yvjf7JgWdhp2A=;
        fh=n/MExOfhXHnVmRGA1n3G9LLz6HJOk1U7fFj1bd+yoZI=;
        b=MH99YqkazgMcc/W7HgTOmXkKdRbB60TPZbDWnxtayj7BV4Me1pKZZ8Cl3tCCct9rSw
         yET7kUIGC9IsyBZsPcy/Qo14Tjp3EnYt8igJJuWawTgH9Y27kzor6zldrajlQuwEqIuS
         rDKmLPzZAhy4ntQCFiZ3nyYVIbiKTyH5mECyxZW7Saxztc/qhTuRJOcUAzgWdXXayVCX
         ka21L8yvoUeP7P9/+I0Br41Jx10gCKEhZ3/GFf4wQxVwJW8Qi/hDzobgcRgnsoRKRjcR
         +3DmYWM6dH3SrTwzFD5IKD+GtHER8acmA89TZ75bncvvfwfFzIpj+mULgIboumt+JIlP
         hS5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvmHT2CR;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30879f2beffsor5790973a91.2.2025.04.21.22.28.19
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvmHT2CR;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299699; x=1745904499; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9YjZLFky15fQ25eN+PsZB2kxxrFQ2yvjf7JgWdhp2A=;
        b=fvmHT2CRYTSZ7M8ISpCOI3J74GIM1uJl8aWoNO2ko2dPgNXE6VU5CcMQkDOH36aPYd
         0K5npBL0/XaWfiAIdu17A6l8CwjvrF5vIX4/FY709YWEaIfALQO70d8SEn7P5nn05isR
         4AoKNzXwcKkjyvO+XBn9GXIRRq8e9EkX78QmlWcxfTD4+Z5gv3DarJdJDyPpwwmntNn1
         PaC8vbkhTUzCibN6Hs8mp5ySjaqWKszxDMjZj1xb4RxOlFgUy3UTfpo0szz10T2QyGpt
         TVNhbjNA/R/V+k0y+iXWXx84X01BWNEW58M3rz06CtP+hiBb3bxJocb9++6eoJqEYIuM
         9s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299699; x=1745904499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9YjZLFky15fQ25eN+PsZB2kxxrFQ2yvjf7JgWdhp2A=;
        b=AOY0BU2ac8a1ltyJYeq3jwk8NDt6ep2KkL2ZoW3xpEHv6kxmENpVmK7vFL7zT+9qf9
         XOcB0MbpcKSKD3VUJTiQpcXzBI5bltggDihMURefScVmZ8tYLhWygmG8qnk6gcBKEqfd
         HLH4lsFhr/fDfHF824px+fwQ9P2kk99EgRIqC5micEtB9iRCY6B3qDtKFx3l4q6RXMEp
         tARoizhY71p9X/LhmipS8NM+RtaHg1UH7u9JTYYUYyMNQl9H7FVZpuu8B26PoYuj7GvG
         ma8XFKwoeQRsrpg8V0jee/hbSCNGWKS+LWgIhcpLFE9arzA+bVHdY0yGZFzpqsnYxZNd
         oaGg==
X-Forwarded-Encrypted: i=1; AJvYcCU2BALKX9gdAz51NtGv1WbPiC8jvcAMCoh+d8IW8QCnhtmqL6dGKioKzWPXSvD4mURwqtk7oolWBYCG05Ia@linaro.org, AJvYcCVIA2V1TiOgVOJqkMSFlV/9ed2v7iySZcHjrblSkWevPb9qa+6uQetfdPL77725PQySMGA+BY/C@linaro.org, AJvYcCWF6NxL5ftZCqZHYAAraGfwtUrJUuMsvE8+9q78LolQe29ZIYqIQa8DXTd6iADccmNi2ET7cSxaEF9a39KU4Xvl1w==@linaro.org, AJvYcCWQwMSDVBAIsiAjDR2Be/fxN2MSr5E42WLh3E6PNqAT59do8zKcRsergB++x1nL2nwQpG+Qn0OWtJVVLBBkHA+77sU=@linaro.org
X-Gm-Message-State: AOJu0Yz4acUZHurPE5CHVDKE7BpTz7BaW/4IFD6uCgN2flCt9ifXrWkj
	OnkFhekndEfMRRaroeql8uSl5LmNpLfEGTYMTUhqUJX64mmBBQW+
X-Gm-Gg: ASbGnctXG7qJ9WDrpx6ifRZX2J5VOl0SQaZR39BSuMSTHCeySZWO73elqCsIwgZG/do
	i7EXvXKnR5FNQ7tFD7i+Z1JBKcuu/H2y4aQjawNdaKyj2IxND5SmcIaXziPCbRZkHjemiY/fVBx
	bmYAOrw8dVfLB/L/DlrvVJ4s7qHM0gi1WqXeQNlp12kDZXofhUPO8xYJqwnYikuww4jDXUYeMCX
	/tqv+PTn6hEr041QoREVvjtL6gA7wz/okl75q32APcY8fKeQh/J/ysf7yNWw/2Pr4h0R9oAK7gw
	+Y5utoToyjdgqYJk+GP7m799ozgRtN6Z6adlgyGwQOI9lDnnCirRx0eU/Mo=
X-Google-Smtp-Source: AGHT+IEclO4OoJigEUfTejjyH3NIpSNJXpyhl1ePgWwzpOp+ffb6EGFjIA5uyx5Tw2/HzCaV2+Jtpw==
X-Received: by 2002:a17:90b:2e48:b0:2ff:698d:ef7c with SMTP id 98e67ed59e1d1-3087bbc9349mr19070468a91.29.1745299698887;
        Mon, 21 Apr 2025 22:28:18 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:18 -0700 (PDT)
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
Subject: [PATCH v2 02/20] qom/object.c: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:06 +0900
Message-Id: <8ca13f4e2b9eba9d1f6030b0afb442a24330e463.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l37U0iAmxlce

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 qom/object.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/qom/object.c b/qom/object.c
index 01618d06bd..87f84bac41 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1191,7 +1191,7 @@ GSList *object_class_get_list(const char *implements_type,
     return list;
 }
 
-static gint object_class_cmp(gconstpointer a, gconstpointer b)
+static gint object_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     return strcasecmp(object_class_get_name((ObjectClass *)a),
                       object_class_get_name((ObjectClass *)b));
@@ -1200,8 +1200,9 @@ static gint object_class_cmp(gconstpointer a, gconstpointer b)
 GSList *object_class_get_list_sorted(const char *implements_type,
                                      bool include_abstract)
 {
-    return g_slist_sort(object_class_get_list(implements_type, include_abstract),
-                        object_class_cmp);
+    return g_slist_sort_with_data(
+        object_class_get_list(implements_type, include_abstract),
+        object_class_cmp, NULL);
 }
 
 Object *object_ref(void *objptr)
-- 
2.25.1
