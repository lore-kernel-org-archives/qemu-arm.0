Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783321njd;
        Sun, 27 Apr 2025 23:39:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-309f7e8225bmr15846776a91.24.1745822397223;
        Sun, 27 Apr 2025 23:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822397; cv=none;
        d=google.com; s=arc-20240605;
        b=DwJLPXE7y5Yb2OYAzYScYsOmtUPPd3LLq1qwVntwZRA/qeVFuW3nvE1BueXflAgb/P
         xhBnrgRMHHpUfQbnsiXAAiYuihYNldNC+1kAwGDVdFZq0h8jkmFBdUvF+tLLZ8UuRi41
         DQt7+3Bkk5Hk/T6MGqxrx+bjT8BDzFLVsT9t3Fe+mj7XAv+iQBmigGw/lxDXPeBwKiYu
         lUYXCzt80ubz8w4AgarueEwdc+2HZeKmchbN3/CHcul6sqOusTI4A89OS58BwlxR8sMZ
         VYjCMKUDaNs5cBdvDuoeGXHSKw4rN0Oeo8rIiV2yHKZgDjUPg7fK9R3AUmY6eqB9G6FJ
         DN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lww8hov75vab4etPov3FqdJvlp/MIqzg17mT2sCNDQ8=;
        fh=rNvxOMCuPOB+IbX5X61JG1d5fLgNL+auSOrQZtU+fWs=;
        b=LY61m0HrrfEwDc+wSRQdYDHXZi8xOAAGMjQwjm5yaUHPYE6y4BmCifBRGxgT7GH7SR
         I4JKmAG4tywetXv3iOtsSZevug/DvjSmCMmcDUidzM+Ti9j2VK9jPoHcgMUPtO9ABDt3
         lLg4gKv7uWPd5k3WssPVumnO7qy4orKFlBsBVwvqvyD3L0Fh8jzWcZqn92vHnkntB7LB
         89E2FFfloZOf3SsvjK5Xg2SM5KGMFy9paGwDRPgAIBPgW/eoiaJqKd5Tiz2EXPW4GuuQ
         opoHOzypdC95tVmJ6xgPy4caTtMC2mxmjYSETA9sjubI9vzcHzfbrIh2Oe/dCarT2yl+
         hpbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CcDBUhv3;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4d9b17asor57866065ad.3.2025.04.27.23.39.56
        (Google Transport Security);
        Sun, 27 Apr 2025 23:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CcDBUhv3;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822396; x=1746427196; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lww8hov75vab4etPov3FqdJvlp/MIqzg17mT2sCNDQ8=;
        b=CcDBUhv31KM+/j4tUzJfNJ7AL4Z+Q3Ldfq/uKYwxq+0esjGOpdDOdJfzYUIRYI0EJd
         b5NHIVd63p6wYa8J+JTmIumWq+CAht7ORv6Ei8OH+HR6tphfvgWPCu4yq3eTO2sZAo/P
         n5a2GFHU10m4Lkti0Ja2N1qavc0dpRJSGFvIV4rn3si1IIm7b1DRVW+xqk4X+dVKGoUd
         UE8lGlYDA/lsBGy2LoTZNHLL5aKYpF57DtPtDCwC4PEhk8tXEwoPSrvudlKO4F/+WQ8C
         tjj7MsxK29xARNTnk+m/BpSqp+LkvjDqaRcc6x+y6i+TQnJQ62RLufu7b21l0nD8aCsY
         C4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822396; x=1746427196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lww8hov75vab4etPov3FqdJvlp/MIqzg17mT2sCNDQ8=;
        b=DZUrBOZ7zvXM/N+SRVW+BszpJwmkNkhlpx57gAIQ+Bgay8WCZ7YZGhnqvZb6/+GgCR
         aZh4V7ThvL3fWfoxW7+QaV+TYv1CluY26mZvAPE5mU+W+ZiCo2jE+NKMcBc4CsCJ/y0G
         wDlKT16PAQ2fJqkc6/YQwBIheG5EzP6zmFdoVGJuwL9WvFJLSNRQ8Qoe4pbduOhklpih
         8omPmHnZW4vp443UwrtD8EFYAwepXabxeOWg6AytogTwxl+rXKEhiwq80hksy+jE2n5d
         X3uGOoROtJAIW7ezYkYsPpEKVmy6gTPHSZdW9vx2WpUcHbpWNQzKcyTulgLNA+b/urYm
         XdBA==
X-Forwarded-Encrypted: i=1; AJvYcCU7F12m3L6GeJwXKiutZxjNtnqK4N/P/+eLuuanI1QzsFvGojTI0JkVoiNzkeY6ZVD6fRGJaoKo@linaro.org, AJvYcCW3uv7mN9xE4wQNkLoFTt+JaSCujo3sHQIX9BANc6ouVVeDcMf3Tr+xRZsIJE0pp44ZIIy2lvctfOns8GonCpG3WYE=@linaro.org, AJvYcCXC8hEEW3AdnTJCJdQIn+Q73eW5KT9Nafqc10k4dh+aSUYp03thuKVOpRasZCLNGNbysadO3sio6IxxWPQONV+hyg==@linaro.org, AJvYcCXmjIzEhW2QXLSRKJLiMhBjnA0GCv20dRMqyu2cCgYCkXab7e2baTUqrv4LGdVM9U53EKL0DW+rxTIHc0QL@linaro.org
X-Gm-Message-State: AOJu0Yyhj6kYG3ajhyQudG7s+XatTViMKkWWN9lB/74Ux9rh+naiq5Md
	YykmOoiIR3kiJaRPKdNFTJfpIIMthXVhc6Xe4u8IEzzoyzNUw8tf
X-Gm-Gg: ASbGnctIPyfcT7UaA/AyYyOPYW4sa4okXFjlW1ueJRKfbO8XFR9z/Oy25y3Jb4bHW+m
	VnHPSyEDwSZygtb/TFt6V/f71hbEtvROxs22uHGWrZcfnoxQdD492p1ki//KWW/m5DRRhvvZInS
	HLsQY9Za7ZpZyPW+94OYABHYh0qreDjlogSjvhh3RyF3q/p8r7V7vPtcu9gPTlZ4nCLLvgkHQoz
	69d6Tza/aSpwdAszwk2r2zD8WqKZ3SWFEPQx66YBFfjpmV4XBc0RUCw4TKmS2w6bn4ZvHzpHPhE
	KNM3pms8QDMZe3CLfHx8jyKc5nIpo7lx/7ro4g==
X-Google-Smtp-Source: AGHT+IFt0ZirYoW1xYqnSpsbjooBfunphjZ0zCT0Gw8GHldDifYI8Hr1ZVtidupvceMD4VAN9K9TRQ==
X-Received: by 2002:a17:903:40c7:b0:21f:8453:7484 with SMTP id d9443c01a7336-22dbf5f704fmr147698225ad.30.1745822396574;
        Sun, 27 Apr 2025 23:39:56 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:39:55 -0700 (PDT)
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
Subject: [PATCH v3 02/20] qom/object.c: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:51 +0900
Message-ID: <128ace316789fb5af6e6cdab7788ebe9b6bc639c.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lDaFSOSB7ypl

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qom/object.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

V3:
- This commit is included in this series sololy to ensure successful
  builds. It has already been picked up by a pull request, so please ignore
  it.

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
2.43.0
