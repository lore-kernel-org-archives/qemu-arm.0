Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136596njd;
        Mon, 21 Apr 2025 22:28:27 -0700 (PDT)
X-Received: by 2002:a17:902:e5cf:b0:223:6657:5003 with SMTP id d9443c01a7336-22c53611037mr232464125ad.32.1745299707278;
        Mon, 21 Apr 2025 22:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299707; cv=none;
        d=google.com; s=arc-20240605;
        b=EkN5LGEzPRrelosZGInWG9CvdG7pSaSKcvuoSGsFZXA2bD4z9ENzWyEonV5vS6a4Ui
         fmBIfvy4EGjwdZHSlVBmGPKqNhgVLNAH9Ls02Z58SYp+ZWtLWOXzK1+UyOuYssYd4Ng0
         ESP2DwzEq301a7vSzATFY6Y/BjeESG1gMpHpCiR7/q4u0cjHgmCNgHUKE4M+Z8nzAKS8
         dljF38cfEpwLy+h3T/WoS+6JGCVvePL7owe88X8bWUtz3aT/1oivYhfwKVrc9mAcNAIk
         wbBge4WrilI6SywPHuNi5u5b8uD2VdMfvUmlcgk/mFhoiF9H1/cr5hNib9zwM5C9flH3
         B3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eLDEQ4UoxB4KfXTxMudZLa30Bn1KGXwL+PXWMvv39yI=;
        fh=EEUy+pM9TqE59maxMrTdKW7dUvtw+RqWCj7EAe9FojM=;
        b=FfBs3ZA0BF3fwwmvOLahiHHXh4a2hdNm9Zs+gMBhszbpe44po7z8HJAKMyq2xsUVA2
         SnHklOrQQFqDJXbtMGi6rTPBs7XzAhsyyekWmz7vD9e7QusX965y0LQZHdQqd0vlSUCd
         pkSAafVhd6i0fZq/5jHpuVo7gExA1Tvf2iTMCUh5HyrssRHdSyMf+7Hwxe0mwpWijRzv
         GQ3nCaGn7S1Yj+LtRoCDJVC2BGbV7ahADfghuaWqa8eydv5HxlvJdthXTZbDvXU0ZQFB
         EO5JQZIlzhZwI3kxIT36PWa923G9S2zcgxSH/qsZkNHu8KdZZcvxlsgqMkxs18jUFGk0
         c7Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="UFl/ChKg";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30879f8ebbcsor5770171a91.4.2025.04.21.22.28.27
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="UFl/ChKg";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299707; x=1745904507; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLDEQ4UoxB4KfXTxMudZLa30Bn1KGXwL+PXWMvv39yI=;
        b=UFl/ChKgEKgIHv3HU7M8GRXgc/36whYFqSLX5EsQzRu9MNEF2G1iO8JeiLFyL+tcBd
         HrRPQAlMncjpkusyxWTC/+Z7sPu8SdjkDTUqhAm6ZflYyBntxOkUfgsx4jwBOZXttFjp
         lJV5ESKKm099Dn3HxcPZY8TjIokQkEP063vBFGns+CwVQ+Ki/MrtAOwyXUhKBN9rFWO4
         +u+N2NCWMHb5oXvikEtEJK01f8i6e0s66cIJpOVU+h0ckUHHEZ2BtD0aHKa3gQG7T3Np
         QHw9iNdAE7huLGO2ekmhPdn7zkzE7VZc2DxfEqtFp72yB5eyw3ecRUGoUOy+voprjZCP
         iI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299707; x=1745904507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLDEQ4UoxB4KfXTxMudZLa30Bn1KGXwL+PXWMvv39yI=;
        b=l7PaqPXvfqg2KiRvhc8g5U7Pf6wx2JYyMF9kqBpCe+VKz+1nUYWMKQsMDZ1OfAQms/
         /YA5WyPbPwqz1uPCgSulR31lySuXl96qwi6+0x5qp8lEgdqIekAHjzSPDC6rGKSg4PID
         fTE6mqG9KqrJgMCH1wIg7DK/cJWNcJGttRK71diBABDfp58WZntGVvC1OVJa1s2m48JL
         5hLZvd5aF8qV6iKxttHvarZzkGtEtOUW04S9Esg98AO0XuziRYxRsfOoMBa1MmLOupY4
         d5zmSZMhhN4FEJPfPuU7wusBU0qiTZfme/IkuZ0uUPK3gnurI2IuOX/EkYJtwdVKaSrW
         jD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPakRJSx55VEUsulJPqsDmaU+vRNuDmRIabmWW4aS2zuLad0ZJmKcSc+ZSrSHdoQSufDcmViKVOshk6tEDKvAuj+0=@linaro.org, AJvYcCVket0HoodUpDTunsR+i7J6vnmQNAyzPqRdQ3uN2ze8tzedd63p9UaQ2czMpwy0knjS1gpp3Kd3Qx5Pe7EG@linaro.org, AJvYcCWKa05u8fgtGzGtC1zvUPtuPObup5nt3fGnBKAHmGMcswN4A+UK/dD+0FqyBaFQ+3ar6pCWDmfl@linaro.org, AJvYcCXyJE8MrJT4BYDqKvGUkQxeJfM+LsmCDU324ZOoupHFY9gfpknIDPqwK6ApjuFEvGTkA7MaPxVnioP4YezaBpfagA==@linaro.org
X-Gm-Message-State: AOJu0YxrcuffqoDZshFE3m40be2Q6bx4oih92I1MyeO4Zx0RpaEPu6hp
	gB2SY8yicC4sSxnjM1ChiywtYG42FfLYRrlMraNTu4N07d8MGw02
X-Gm-Gg: ASbGncsfDS7np/CnXw1UX/6ZClLrIUvjWNUTAkRlXgVFMQeMZqu6N4dFRfsIx5Qgq6d
	/vyJoYGyeWVU60jABpMVGblKgOdcwigZ7Kq96Wp0DvYRlNQBBrZ/3UjaJMTwfBwX8SJ7/g9Q8Ll
	MDVzVqADF+mpoji2zcYMxaN678jkr5rZT+XRIPZ/MnvEQaT1/qFC8jHKPdhtHOgdxL9k5rJE120
	w3NR80q9nkKOZviQYGdEF4xOPFciK7Xo2vGHrctv6wqxjIYBO7VZRffi3tTzDmiMOnrYS3sFFRa
	2OT/I9eV3wC0Xd/30WFdLrzOBSrg4CRVKijXcbzgizs84nydpFbcC2nri76A8wuR9izA3Q==
X-Google-Smtp-Source: AGHT+IHIGGhSXR6KJuuf/VKfP5bkoJ6cloNLfBSB2N/q5TArXIo4hjgZGBnttNj35T0H4joj0zPGFQ==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-3087bb631d7mr23227589a91.16.1745299706596;
        Mon, 21 Apr 2025 22:28:26 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:25 -0700 (PDT)
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
Subject: [PATCH v2 03/20] system/vl.c: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:07 +0900
Message-Id: <e9a50b76c54cc64fc9985186f0aef3fcc2024da6.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R+NJF/ej9M46

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 system/vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/system/vl.c b/system/vl.c
index ec93988a03..8d89394b45 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1523,7 +1523,7 @@ static bool debugcon_parse(const char *devname, Error **errp)
     return true;
 }
 
-static gint machine_class_cmp(gconstpointer a, gconstpointer b)
+static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     const MachineClass *mc1 = a, *mc2 = b;
     int res;
@@ -1573,7 +1573,7 @@ static void machine_help_func(const QDict *qdict)
     }
 
     printf("Supported machines are:\n");
-    machines = g_slist_sort(machines, machine_class_cmp);
+    machines = g_slist_sort_with_data(machines, machine_class_cmp, NULL);
     for (el = machines; el; el = el->next) {
         MachineClass *mc = el->data;
         if (mc->alias) {
-- 
2.25.1
