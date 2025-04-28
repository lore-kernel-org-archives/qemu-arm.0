Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783270njd;
        Sun, 27 Apr 2025 23:39:49 -0700 (PDT)
X-Received: by 2002:a17:903:3011:b0:22d:c52e:2dae with SMTP id d9443c01a7336-22dc52e2e10mr89637915ad.18.1745822389354;
        Sun, 27 Apr 2025 23:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822389; cv=none;
        d=google.com; s=arc-20240605;
        b=ddcrEVfShHt6ukgvGDYSYiy+Zajysph7A+NPvITxuRC9bbzHkdV2Unm9yub8xHr/M3
         Szo0fNYDMuv8Yww89o1lGX0GZat9McuKT9r1klYMOSl1QG1L7jqLGKFGar/yt7oAHbph
         Dz3l5JfCEBmtTkhHGSwtWytAdnvhJT3rW7QL1kLIZWSGBRWA+pRJeu3eGLmfCMIr9DQH
         Pb6pJlMdkZEG7HadS54JAjH1MVtOpzUVAJQX2YSj8QFPQ5KUkXTWe6Ph+0Sob9WGRhqC
         SyAxMLsDXmbFgxljDXRoN4s8DVgx1KpUurVN9Q7sSMk5WPgzsmAkcrE7S6v8NF5q1KYh
         0vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sXRxpcTPXlWeCW9VyVkVrsS4eG/L50janz5xzL80Y6M=;
        fh=zRguaO272k1anX7hnPcuAqhbGSI9o2nBvAxM8BUrBT8=;
        b=UXypdBpkfie4HImXH0HRAVybi2sm9+d+ClAXWzzt32B9K03wBuTyiGp/UNQWNkRrIp
         +2vFhJW8hYHRBNSLWEKW33PKQwGfs4lYpuGGHFUzaXHNM1J9mcy0vdjyJ2k8g3c2driE
         kQb8nEWkywbzatxSAEMImJc3c0l99Okd5ttvbdzuKgWu3kvhX/AQ9FhrsUwURut9FbIk
         SEgjiFMG5Jb+bHAHs7jiRPRrI7e8Fafw6GlnIm/H+IPP9Uthf7GnBG3S9Fmop4d0xf0S
         PPlqDQrbgOmSNVufEu0nmHuj/zt1G8MFETQw74B4ZiCk3Ieub+CfQyVTdhBblp7eACXi
         m9/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=T5+mc8zM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db510ffd8sor53968535ad.12.2025.04.27.23.39.49
        (Google Transport Security);
        Sun, 27 Apr 2025 23:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=T5+mc8zM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822389; x=1746427189; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXRxpcTPXlWeCW9VyVkVrsS4eG/L50janz5xzL80Y6M=;
        b=T5+mc8zMKDQnB9R2we+laAaZkNaKbc19cjrWzkZ/OhA/UlSXaO1pgUqAK7Ex1yfdJ0
         7RyZ7UNBMsRqAafDk50/JV7a6oeBy7fTZrut9PklDfiGCPyUeJyeSn2QG+XT2ZQjGoI4
         wPc13sQ3XC1e4P2BF4fx4ooKmQ5KU16ky3ENoPymF9S23kKx7NtzND6nTLbAdg9H1m5v
         yPBbWHJVDdwjORHd9Wir0wM+y/1qJqkR87ii+8fDZbj38Xk0uWxRDebemTkZHAYfQOVE
         J8bRTbQ8/pJXXeXMFRnxk7aRNOSKjxSkrq+JYGHTwsqjzQCAsd6ET2GSM23kQxGBjC7p
         oheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822389; x=1746427189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXRxpcTPXlWeCW9VyVkVrsS4eG/L50janz5xzL80Y6M=;
        b=DNmQMrVHDjzg4Cx7qkQw02PPzBZcynMraABlhRMMg5nwZY3KTqL8IHyA+IOWVp7rUM
         R/M0oQT+DW7VFDyeKnNVIUx1VPGtLGK21fUpC9vfR/mdGY9sGSSLtaQxUBzGaxywefA4
         AljnoAyMozi3WzCHO6T0y95jF5IqszBwIPdpmFftnZ0T6r+2Dr8l/w49N6Ap7lPcMLIs
         yNvJYxeMivwHLnsEoETnCr55MsCIgHPl02hteWz/A3042FAVh0H8fb/sfQSlh1Vqh7U3
         +jncCuS08J2YY92oQGIkpBlvAdZfYCu8A3hPJhCR/AuiuAD12W1yzpmyLkV4IfESxiGA
         8fEg==
X-Forwarded-Encrypted: i=1; AJvYcCWBpX+QHD4p0LSaXUrgB/X8Ktk6JJo+QOb/apUwD/bJBKCWkS/qXX6ZJjrd9J6NG3pj3D3kTCkZ@linaro.org, AJvYcCWItNgIl9/d39HSbdXslIY3ICowDdHssGLcqRB2V+Kb74xzfvdf4tg0EOVO1T8AFJhY2fFRS0rRswk6T/1mQ1SrPwg=@linaro.org, AJvYcCWoW27CF+KJ6HJpVquaKEeJXGIUXIpQa0QJHQwORxRg15cX5rdHgOCRBwQ9ob2SAs9woYKlWNMGSYhfUy/oOAs80Q==@linaro.org, AJvYcCXSKEHXCdhEgniKmxfRe5swjMwZ0A2sJR23uop+Eq+v8SXlRo6f0EUmTigaYfABBEVLt6XLUTLka9/9+Eng@linaro.org
X-Gm-Message-State: AOJu0YzFKpgfJTcaiS6HZjylqYarNUqf1uslqzhLsiV0EqxbPBOyi6p5
	U/IhT6htPPy9aPrFnOsASz50r4Ngk5Jr9FPDb2XHhoKgVC+zEIiI
X-Gm-Gg: ASbGnctCokvFzwIDel8e5M5XHzHdZL63LA6Yzn0cEOuuYXU2zsFJ7+55F+rTdjENdJ5
	OITsuEFSCdAU1de5PLZ1AdVFMwl5G4P5WfMyZ3e89Lvq0ZD1J0fN43WzMu374bLfbyxwqsOVfL3
	+DAVeAqSHkvjKuu2IeV7Fk7oY27fYmv7QYly/Qx4Ou3AdSyQRo8D7HztcsmTTuRVMeyb6KV3lYq
	AK6E4XktHMIF90xwGyxelETOch4h2CYeyNtpIUECjDAFhPjvHDMj2MuGvq8+g9MuEeVqTsr01NV
	gk9zvDFGVsVXGeJkr7F2V2SncHsJN+8xM9+SZA==
X-Google-Smtp-Source: AGHT+IFrZH8PrQNIR1i1QyW1F4U8cydPPxpBJ7fMsIckNZPcgjOFtfm3xC65ZGB6y11sDLsbKqifGA==
X-Received: by 2002:a17:903:32c8:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22dbf5fc2aemr168535235ad.24.1745822388742;
        Sun, 27 Apr 2025 23:39:48 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:39:47 -0700 (PDT)
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
Subject: [PATCH v3 01/20] hw/core/loader.c: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:50 +0900
Message-ID: <2898d818d4eb82a3604509ef3ec8646f0d0deafd.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rUdaMvDXeqjN

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V3:
- This commit is included in this series sololy to ensure successful
  builds. It has already been picked up by a pull request, so please ignore
  it.

diff --git a/hw/core/loader.c b/hw/core/loader.c
index a3aa62d132..b792a54bb0 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1410,7 +1410,7 @@ typedef struct RomSec {
  * work, but this way saves a little work later by avoiding
  * dealing with "gaps" of 0 length.
  */
-static gint sort_secs(gconstpointer a, gconstpointer b)
+static gint sort_secs(gconstpointer a, gconstpointer b, gpointer d)
 {
     RomSec *ra = (RomSec *) a;
     RomSec *rb = (RomSec *) b;
@@ -1463,7 +1463,7 @@ RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
     /* sentinel */
     secs = add_romsec_to_list(secs, base + size, 1);
 
-    secs = g_list_sort(secs, sort_secs);
+    secs = g_list_sort_with_data(secs, sort_secs, NULL);
 
     for (it = g_list_first(secs); it; it = g_list_next(it)) {
         cand = (RomSec *) it->data;
-- 
2.43.0
