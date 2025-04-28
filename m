Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783596njd;
        Sun, 27 Apr 2025 23:40:44 -0700 (PDT)
X-Received: by 2002:a17:90b:58cd:b0:2fa:15ab:4de7 with SMTP id 98e67ed59e1d1-30a01329af0mr14224622a91.12.1745822444144;
        Sun, 27 Apr 2025 23:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822444; cv=none;
        d=google.com; s=arc-20240605;
        b=YUBc/Qnp4+mhLl0oahW8np24bSlJGw1k6LxMO/+v/g/T0yZTsrel5fBrq0T+aauZz7
         HJ0wyDNU/C84uxd2oQyne/vSdQbDG1YdNF7USDt44DpcM3KnUltWtTA9MUGfaD2MkW1k
         vrPDiussTLqvEtR1ZTh7xEHZip1+8SuY3d5OJCSZrcuNoOFqXwFF/165DIx8xeYESkis
         FFFz0g5YCOzQLo1zo0LgSVNMW9F4RkLXHltYM96DLJUGOxVgJDDw4FZvtl32J8mdNfiH
         wfhTj8Tu3ET4mwqXngyoGFu9d54eTZolvyFHu+4Zi2sJGGii/69g4oLW+AiZkcUbH+sx
         47+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yYdISxmnAJp9R0AxjdKJ9MRj5xSuzSN2i3eHaLqf1tc=;
        fh=DL+3s+ToSokUT1Kz304B48I6d+f4dxY4kBWlBrotBvs=;
        b=WDRK7hYgjRzkDGOO1EIpGldhgC6GGpu7m2cNZHEWFKalfqJ+tSrnbyVwTlVOCBerok
         Qge7po5TZUtewPyytFy3Um8ePonGcvK3vlvHPim9BaeHgDnEuuEqkG/kNevScWDmrgo/
         ITAp22HavzZvTU6lt0xYc5wIiVDF4q1T7+VI/eNAd6naL5kE2rjlryuJ8+HQSFJeASlH
         i3Tls3/W3SrcFP3BwSAONrSULZtpcVr67bMEOQCPvti0voOMV8iPSd513ZTtJV4kOnEE
         izeMA6//tV2knykryZK7uy1oaOLvtdZWvTyiWvPnwa9xKzQ8izPryZxgJY/V2Wd0n1mI
         2lFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=W684btM5;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee7aaf3fsor5199460a91.2.2025.04.27.23.40.43
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=W684btM5;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822443; x=1746427243; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYdISxmnAJp9R0AxjdKJ9MRj5xSuzSN2i3eHaLqf1tc=;
        b=W684btM5hpXZ20/7J65pERV2v0pWHWj21lW0ZOisR62b06B5jWVDdEpobAc5fQI+yl
         /02GExfTjca9yYawq/LcSxNYoovlHhCM8n8rWteNMJEO3j6dr2LcPUl+oOnD238e2SiV
         LRZPyGGNUU6f5L4Nmgz4cnI+hDIncgYsFBVr1yCppwkq6ALHyFuicZQza0Qd6N5upP1e
         GPDDZaAtOCmYq0jFl1+SnZ5kYq400OSV87zMLjgVpWzm8gxATNAjTeqYh0ZhG0CkRp5o
         vTYlRgXZyPUF+s4MeMoUDkOHKIkdQ1HRt8QZLZh+Byv9PA44xayyd+CFvfvUE6461/EX
         sA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822443; x=1746427243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYdISxmnAJp9R0AxjdKJ9MRj5xSuzSN2i3eHaLqf1tc=;
        b=DEDTamuy33ga6t/iWpBYjhwX0cB1SaO1JMjjlR5IKiAFPkUQp/trhsQUdGUcA/xIr+
         TfpT2s93g1jXJGwpkpDL3NhWT07VnN5WlVCfi/g2vFLA8ZrAzQokN2UHEmUDJ0S8Nhpz
         4MNqs2TDlUF7jzqKX+dbJ0BFHx//ZLAJAuVB2O/hSj/CWGproKnYftNWjdmWnJIiEG19
         aPFBKytzHPu9F8T2oY6biHMSoPt3f2GhS0qQGyaoIxNiGg8KXVZ1V58SjQw9geMC3RgV
         UuF/twsofXlK7HL3kLUyVrcsiUnIgAg98Ocd3wBy6vdUkzr4c8Y3RgBTlsnNakgvj8O9
         Jkow==
X-Forwarded-Encrypted: i=1; AJvYcCUsSMuDNX4PGJoTbNX64snZf8tQ/HqQ+8cQUCMfCjZ26qppJL6JbYZvrWTG1xXpGRQaV2gWGbbq9g6wTzaJJqJhjYU=@linaro.org, AJvYcCWBT8QkVTz1hPT4lQJmjCSzwLsZOtkAurkjJHU5dCI29Jd+3c8lrWf63Iqn9yScUZY7f5jHSTKm@linaro.org, AJvYcCXGMce455l6U5ayHRd+OMYCC0LYGHAgM735zwsSwqkLaOxJySYOnpnx2Cd5/j7u2ewGIekhO9mfYQwgG4AYyNfj6w==@linaro.org, AJvYcCXvsRUcXUuzR/VEPLYY39b23ogW+W82U0pbNxiIjbOvNMEYjZLBhzwDwU8NStQlzTq1znTaDvdlgnwu2zsZ@linaro.org
X-Gm-Message-State: AOJu0YyWcW1t7nAeDugZ7ZT1K3ajO7QhV8YCBUVsmGW1eKfOHcn+qOSI
	dC+25ONjHISrRMq1aUSNkGSykibPe24jqd2efR1v/Zcuks4G9dFO
X-Gm-Gg: ASbGncvDM+PRwwb4gJWXhGI6E+bSs4iRnBrt1697+5mY1B47LWVvCDokCH5N+xNbmq9
	WFs9a0rcKZulxW3cIphY8t2ynirRsggcGPHk62/PgTesbrVLmTFYf0UJkQq2fcYNBMitihWgHP+
	aHccx+psBBDa6M2rcrnXjcCq2Lipj7977J5t8spYu11pO/f2QhhkEzDXBQoQrgjwJJXtc5hAeEh
	w+TUnrdgX/Cv/IHCQSXowubbfmyBkM5uuXvlYA+rzSrC/lEvDpb6Df93UAAmyQR5IZFdELbfmdV
	WTtNbfQIgxGDtspfhZsj5BneYwW29kIEMcPBfg==
X-Google-Smtp-Source: AGHT+IGxE/qSj9shgLPWH+whxB6DllaPY4tO98UowGZez6SHfn7EbMFVoUAgUeFD8pEQ4gF6JNUKZw==
X-Received: by 2002:a17:90b:5407:b0:2ff:64a0:4a57 with SMTP id 98e67ed59e1d1-30a01398791mr9653604a91.26.1745822443492;
        Sun, 27 Apr 2025 23:40:43 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:42 -0700 (PDT)
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
Subject: [PATCH v3 08/20] target/ppc: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:57 +0900
Message-ID: <d917055d35f5ff7316ccdcbdf57af9a7bd85bf29.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: E12tBCgLzeXf

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/ppc/cpu_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index fde7d71fc6..b070fcb637 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7115,7 +7115,7 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc)
 }
 
 /* Sort by PVR, ordering special case "host" last. */
-static gint ppc_cpu_list_compare(gconstpointer a, gconstpointer b)
+static gint ppc_cpu_list_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     ObjectClass *oc_a = (ObjectClass *)a;
     ObjectClass *oc_b = (ObjectClass *)b;
@@ -7183,7 +7183,7 @@ void ppc_cpu_list(void)
 
     qemu_printf("Available CPUs:\n");
     list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    list = g_slist_sort(list, ppc_cpu_list_compare);
+    list = g_slist_sort_with_data(list, ppc_cpu_list_compare, NULL);
     g_slist_foreach(list, ppc_cpu_list_entry, NULL);
     g_slist_free(list);
 
-- 
2.43.0
