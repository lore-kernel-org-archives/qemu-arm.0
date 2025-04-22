Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136777njd;
        Mon, 21 Apr 2025 22:29:06 -0700 (PDT)
X-Received: by 2002:a17:903:46cb:b0:225:ac99:ae08 with SMTP id d9443c01a7336-22c5337a025mr223999145ad.5.1745299746071;
        Mon, 21 Apr 2025 22:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299746; cv=none;
        d=google.com; s=arc-20240605;
        b=jZZA2GyyztrTp+tbjrMvJos5rkz6Mt0Ixk/8ASW9pk32kQua3Wc2KKUfMwRDBy6g2G
         Sn85ar855j26sXqrP2ai8RhwLk/pagl4pSAW4Rne+kTvI6MlRSIqim1JMS3GpJx7yfUt
         yw64ItVEBL7dO1WTGH9iXLTUFVMYoT/qOSJjVzm8SYqu9ZHjNUw6cRb1UvyaLYWTGTfA
         vIL1OZrIDLT8Q6ts6SztHSMsbbvcIgWoUY1U7+oYDvwS6Cw2ydClM5V9MBDkrbYkkpL1
         Dxo5SEfnKgcB+CuOaZNX6y8Ik3pviEUh34eeoDTIkuDCVatswdG5urqLfuadzt8r8b5U
         PVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XLyDJb6zuVf07S+Oux/CEamJxltd1syyWyqOmnLXnEw=;
        fh=n54C4jMZ5VXDL/KCySl3mQOM9athDafe4T1Iq1a0T8c=;
        b=KaaWEHSF7QK7Re0Ey4r/MxkCw4QlqvJY4rdGtItdBnRdkLHL2zp3nNMvni1fXMo58x
         VezvClj5AEWmnqwlJlWVT0aErccthiL2VKInb65aCyQ1VXrPCAj3TyY9NyLQBW2xfBr4
         diQZxupTTnKeLpTyAh9Gpu7xaA41v/RhRjYcM3uz0NFLSwPlCSreGUe4BqQaehKe0dF8
         XbgxEUmOl8BvnOm1bdmKXoddlm4//K65kqUdpvLUWt+HGJrPgywTw8g6+xJXk8hpViWw
         sD3KRFMXWU8P10GF/t8yHcHamK6f3BJPhrIgU0+iszbwaz2r0Y3pS+v247TZmxvcqQBh
         ElkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LC6uzRGp;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d79133sor56559235ad.11.2025.04.21.22.29.05
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LC6uzRGp;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299745; x=1745904545; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLyDJb6zuVf07S+Oux/CEamJxltd1syyWyqOmnLXnEw=;
        b=LC6uzRGptBtjkNnzdiYcGN60FXr7KbOngVs/TnWDvToG8g1O10JlRqySPcwrZTABFv
         1C8rN1nos3tPj5Osh4KsfZ1uBoAB1gzbsMTg80Ac3dI5TBgmrHMiRMxni/z5DN/p4qi6
         30vTDliTalaELEp3N21kgKlSBQim/vtiyLI+n1Ll8dGNKziNOpxGnmDowp8gCqUH/2OP
         cXQie3o3rZImT9lOo8H22qCn4xvF4IbAufNoSxvJInyEntfyUNJaNZuSpkQklQs99Ry3
         1vDT8H403lNNc3YwhydJq3uXudkGZDBiLjtQGukQnumWBV1dnxqa+mFLRHcy+Dp17eH6
         nEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299745; x=1745904545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLyDJb6zuVf07S+Oux/CEamJxltd1syyWyqOmnLXnEw=;
        b=vaMJ1x31OyLMp5v5q+rdpgQbmL7b314ZmZ4QU3eyx2EIuQ7jWtykkJSRRyHc7chpNH
         GzkxSofZWqIZ2j4ByrDqKZpf3XthfIdIYr0GVihShAzb1eM5kdOn+rPI32LvQCFfIcV2
         sif576YfpUGo96oJ7Zfs7bfT5CNHB/FHcdoP9Lb6e0w2WnXly5+EIGz85phicnimz2l1
         JmJ97dFvHLHSm0dn48kbYEqc+o8epq655FoE47zlzL7cr8mQbzhq63Wc9E8O+xUhXztv
         z90utWrLzCOEZ40o64JrH41Ann8Z3StU15WedpPg3ym4QMeWHOImGvE40PMOeH5dM1EV
         apoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGt+Gl0e40p5ATegG6TB+swd5JTxQhVvPihAw6Z7D/XKjN4SAoQIWcIgWBwO5tSehQ5qGUjVb6/MQjgZaP@linaro.org, AJvYcCVZiSEcKo9jRSj4BK8RA/LHeYODrrCxP1D6lFgn0PhjfnHhaXE6dpNZ0gN2jLgy8L5DwtRATvva@linaro.org, AJvYcCWzPAORGzgQnB0QfVU6sAMDcKq7AVOi06oP0MQkysjBsNQVTsV0KrRt0whRxlIUUJh/bIh03r0MGbLF2oTViFj/Hw==@linaro.org, AJvYcCXWyfVkDPcBBivUPamOR5d8SzASEtXrX/9rfyogxyV10Lwww6TFj6jrXKoSl8vSlkugFtHwnLJn5R5R7NKCK5jNzvs=@linaro.org
X-Gm-Message-State: AOJu0YybiBWIDAGGx7N6/SwvV9YQbdlIL/qUh/Z5FDvvlmL7DdY4TU23
	g2sDD/qcTzFHqlOkHGY49PZ4uyIcX1KuzbK/rc8uCZ3YStIxaSWO
X-Gm-Gg: ASbGncvK+MSS8o423D61ETJwpkZLi/xcKS1KzWPFpg2dbzwIvRtDjNrorGoTjFD5kT7
	PQj0NioqKv5jolGSap7GamsGRTGAKIUIc5Px57pipJ51NpdfUPOfV3Fv6NycNBO41g80ZMJ68/V
	GmKsBLnjjtwCZY/0x023F+6/mDkm3ztMiIBhWieMFkZcqoifG2HxlSO2IvJ5/OEy0p0ECLQRwu5
	VG6DjONH0AvC/KEHDwWecPiKrpSF3QtMzoPj/9/tFLtB6so7YhQx0b7o+zWIbgdIjb4y0sLblZp
	jSkzQFheiJ3K6ApTEy6Gd6l3uZ2Si4UJ8BW0CLKZY6ovnICH/9bdd7CVS8U=
X-Google-Smtp-Source: AGHT+IGli9pUmcY3KyTzbFBRjFgDu1JXXm31EwPT7XYV1PhrrsboM1x/7sb3HIGZTZeVLj7SCvEwRg==
X-Received: by 2002:a17:902:ef11:b0:224:2384:5b40 with SMTP id d9443c01a7336-22c535a7e46mr256405075ad.24.1745299745436;
        Mon, 21 Apr 2025 22:29:05 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:04 -0700 (PDT)
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
Subject: [PATCH v2 08/20] target/ppc: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:12 +0900
Message-Id: <255824200579431ecaebd32006bdf7a89d48ffd4.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FtFiSKrQeDIq

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

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f81cb680fc..f03e48ba31 100644
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
2.25.1
