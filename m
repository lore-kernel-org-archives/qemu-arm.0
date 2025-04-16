Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178697njc;
        Wed, 16 Apr 2025 01:15:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d50:b0:305:2d68:8d57 with SMTP id 98e67ed59e1d1-30863d237a6mr1302706a91.5.1744791319583;
        Wed, 16 Apr 2025 01:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791319; cv=none;
        d=google.com; s=arc-20240605;
        b=hQNnQr1nohQY7j5ncLlXCULYndLDUZ5/1ZFcIx9FkLlC2wIc37oX+PqbLkt1eGYmmG
         N0zxdq7kmTYMnx/mKPmvYydSTDOSqfgnlR3calDXqEHlaE9XPsVvw7d5ZWlxm5GRDb9a
         k3b8FHSzP8QjJFU9Ad2cdx5YcBSfpRWFqX54WfCIOk6D1mkc/g7ZcLIf6XID7RQsemf8
         lR0nl7ut5xm0V1XNP6pyt9Aa1vYkrIjuwuZ1NjZOKPyY76h6PyH+ySr/XqZ6pNTe4BDU
         ptwpqOrFJ54x1B73qWMf0I5hQXAAhGILEFXHnW584ieXoZv25iaFBz3ecG5LFTrW1FHp
         IEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c9Qi7tBom5Vd967CqXnYUihx6jXTbGRTUe5KQdGWTvQ=;
        fh=IDbDcFqpQlB0LxKp2kgBPMv52QV/j+UEjefg0cfpiS4=;
        b=NS037fFl9AWLVaQ0n1ItmKzOa3p8xG3wQ5CADpKyRmPaq4jo6YbqVajZqNiCTIDIVb
         CG2Hdicaupn+/lGL7jI13OJ+Q/OnnjMWO1P8s+GD83oRbaj68M+7O7UEEAeDfPlwTEFP
         yL4sC8Ua4/WozodUQd5Jq5haMxdDJOEWPnzAlduOH6y35mZWXAI9K/Ba3OrY9k+mzevk
         0DMi90qYeCM0T2yIhAmHDc2SLWAH7ZcQ47oMOkl7TNrTvCX8vW8L+6zI9TlZL4Has18s
         1tPA9BKUSurn5C4qyviios7yHS0LkyV7qxFHyKNh2txbholGibev0028EEvCJE4uoVbO
         vAlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=E9ljFYJm;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7b5bd8bsor129714155ad.6.2025.04.16.01.15.19
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=E9ljFYJm;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791319; x=1745396119; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9Qi7tBom5Vd967CqXnYUihx6jXTbGRTUe5KQdGWTvQ=;
        b=E9ljFYJm/mnZQzD49jdkhWetIkuS88sOzzopu0GRJQKk4vqePgH3lCAOCuYeplNs/f
         M8iZN0jikzxTjEspiHgP/qF6Z20NffiWe8WnpvhRONVn5v9FumdOtS67+Wvio2pgpS5r
         KLkkh5d6za+kqn8QJtgE+OyASeKAKuxQcR0VmyUzaZug8vCYCyhhDC/m5c/Lo+++pzgS
         A2Jz6VOK2y2P1hCIKzOlV76DRUnFcG5aGP//V269UzelPYaWbnR+CFOYFu7cwqWJzEAv
         oGGw8kOeAcyCmtx7kOKEFILBdPPtYqln3dy4DxTyILzBi6FhgFHTCM6BhCVKZ9JPi1Ti
         CYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791319; x=1745396119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9Qi7tBom5Vd967CqXnYUihx6jXTbGRTUe5KQdGWTvQ=;
        b=c7Huu4bWP2mHeWjs8Tc1KKzZMNH9AR92oJbUQRzCNeonpr42/ZsFzORpI6pGW2OzaO
         0S5VhUuDLXwllivggC6iX7GhJDVkJR78ksq/lK0lhVoQ3Iod7bNQ0l5XUJRWLW0F0O3k
         UgsQ/3ykB0f/wuNc2IU8cGZJYgNPrAV1WexeEpu8laWDwK4SB58nSb+Q3o6aUQuQtTsK
         oslh+AXixl4lC3H/AF3kbw68yDS6tf4jqeKwLqryZIli8vHoF/hX2o407w/dwBSgKFhH
         UXMyH3axO4snxelbgxxYzBm747kEqDAOwKoRwBB5/6ws7w1bzeqo9Gf0v2Xrd0lnPv+t
         dt6A==
X-Forwarded-Encrypted: i=1; AJvYcCUELh0GPEI5+10jZPhrCTXgcIoRbB6NfGJkMIgJB/Qv1vdUbrmvTwfX2wRoWlLNWj2vWAV9Sep6@linaro.org, AJvYcCUUTXk5PEBpBdvWy0x4aledatfMVSZ4TQabQ7EQ53aloBujpccyVhQyV0juyrFip/ucL06K61XGjeBgdWETy4aatA==@linaro.org, AJvYcCVSaRkwhj+3+l/BOTKlKpvpGyc6XMFsfXCxHpwWF67VHzerSJokZr7YsPdM1F8WbYd5rr2AYgS5vtIx+VOR@linaro.org, AJvYcCWs2pn+i+0Nu8wq7PSRyCU62JxrTsoxZRvf4c3OBFFO3oOD8OoVTZgMI7ehXAzGUUYGMi+0giXyrkk9+vngVd2Rz2c=@linaro.org
X-Gm-Message-State: AOJu0Yz4XOewjquEJfHvXDn93Kk5131UTgvl9AkxHLH+mQV6uUnlSLde
	QD04oYghEeAQivNbL28BF8Far91Yv/Xfy/MBH+nSGF4AKr0A+XJP
X-Gm-Gg: ASbGncscuKeM7oO9LCiDISD+O/OltT8zPwjvjruUX2D4GxZKSuBKJIMBcpYn/G65MlN
	gFau8U5vExXbHpperiybQ0FbBmu5iZipe3tOtkk53toAJstNDznk5kbQP4Q9qttvHLtwAvY6hzv
	Jsep6qZoBq2Zf9CmbkiTVcVOPeVjOEVmADuEyZAMAm/V4TTmHyCYVt1pO/GGGdC/uHYSHkkmr1a
	lz2FoywFYGofylwB0lrRX4Ll7n1qcYsiFj3o5bN/NJTMaSqcE9ZPSKqM1k5i0YIotKgIl8t1QVi
	9b4U8x+es3YEaPju7HUXdP/4psqOT7+YuAgb23uVwI0DWch6+sLNLVVntw==
X-Google-Smtp-Source: AGHT+IHs7Zf9k0205llWie78fgPTs0fh8TUGkAJGR/jHsaTgOeEs1xBeZHSl7kCo5gtKYgBFUS5wTA==
X-Received: by 2002:a17:903:2302:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22c3597f330mr13078545ad.36.1744791318942;
        Wed, 16 Apr 2025 01:15:18 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:18 -0700 (PDT)
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
Subject: [PATCH 02/19] qom/object.c: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:07 +0900
Message-Id: <9774bf5ed472be69d5a1e4cd7bbb34184ab0a202.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RF1aVUoVdQjM

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_slist_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 qom/object.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
