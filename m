Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783450njd;
        Sun, 27 Apr 2025 23:40:20 -0700 (PDT)
X-Received: by 2002:a17:902:f687:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22dc6a684damr110543155ad.39.1745822420635;
        Sun, 27 Apr 2025 23:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822420; cv=none;
        d=google.com; s=arc-20240605;
        b=RlBiBsHTzji7nZmr3nnNuHjfS/VHhcji1lYGL9JvQRVlaDAeNf6GPCOCrApRV+u4/L
         ySqMmVCv+eBKx52f9rqGUF52mpuLxh9akb8qrgIMQTv4clW7QfiNd36dBn51fYfeCRqg
         5Hj9rVV/2e1dpJGmO6IcteNE0ESAmmJ4wj4rpc9ZOsag3hytb9VV/f+59JyeE/oHmHnA
         5/aP83swDC+103G5vCs9ebz6ovHYr1rwVyrBvrdANDtfjChnkLtarGdfjmalHTq09uik
         xiuKVxQxHdrSO7RF9RTbH8Zq422OH5HJ6VikVvlhZBaE0yeqrm46IPeSnBRDcSPkEBUH
         wC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Bvi4Lt8goFH4Fe3VIBwH2k0EDfUx31JuXJkL+iD5/SM=;
        fh=JduCMl8zdDGCUfyUQV/uLPa73DL2XajAUMGH3UQ5kZc=;
        b=HJorOyTBOJlLkLFUJmx0mrc0HOmJPI/UtgWG0aZZyyLzKJDYEiFv2iT+e5uNw9ddKV
         btKY6qZcpbSUGN7JYaA/hylOzoYE+w4kM1mLuWP2zCbT83aMKQOhrp4ECLvpabs2dsja
         ulCllnnaCn9SzdL9DHDinuun5BWFJgNj3ob41vfTxCSAPWiYOQWWxyhDMI5Kt5kxM9tz
         /AWec0fIuM7tz0XWhGaBgQWfny25anVaUU9xGmiG8uHaIe4MXCzbDJuwQIvcj0MFbeKU
         T4avB/WP/fBDSR+y2PmvlZi/nPG3N0tICFG6RX5DEpiqCc+NMG3FeVIif+7dB3Nrp6z2
         AARQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKaqDnZy;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f07ccsor76300825ad.11.2025.04.27.23.40.20
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKaqDnZy;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822420; x=1746427220; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvi4Lt8goFH4Fe3VIBwH2k0EDfUx31JuXJkL+iD5/SM=;
        b=HKaqDnZyCcYaADcGTa7S2Sey7GD1jEc+U1h6O5bPCkGRl0TBucCbA4v0s0NPlFT6sq
         d6kjX2p6CF9oGsbmpNosLdiHSmrusPpQ9cpNvghA7j250g49U0DR/l0t3hvQ2vp63KOm
         FCMgXeBoBgFVHaO7l7xL2iKsY10RssxzRZoJ6iCm8Dax0JpS1628XcHrcblwAqj7UXp/
         r2Y4xy1eS7aL0ShB5ylJfAotPuw8Z+iiidh9sPNdrwqgDz/FA8cRNfk1u0YtorPOmPWI
         TqUw0/xi1EgTsWKR4JI3f0TGyCEMzdbRKDMoRPFGvtlFlxaViYiTTHHR/ZtH59ptdHt6
         fWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822420; x=1746427220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvi4Lt8goFH4Fe3VIBwH2k0EDfUx31JuXJkL+iD5/SM=;
        b=OwTx4Hdpul6C7+sK0Skch5mW4YQlPlYnYhixE7FCVa+NvrlCO2jMn0a5bcjP1Z13dq
         pS9EFNE7RGEAVbqtpNTXMeT7E/nX1VwyD7zEEhU+M40egFIrh1srBTwSYrP97A3+Jxpa
         TS+WuGgLpq8guYXqsXJOo3VCJq4GLIaalGmC4BiPzY5xKqaNrnYWCF+NB0QfdE/E3si3
         3+aehlfgDmFD2pJ3gwEO8m5GwtFVoTVvl9m8r1DFPLP/legxtYBFtgj94H3JoKwo3fgx
         auXDDLs4x2ea3eU+AA/aPSieIRVgI+f4oKh78wVhkyiIclGQbUV8zpv2Zn7SfwMnbE2c
         1VOw==
X-Forwarded-Encrypted: i=1; AJvYcCUSbaIulX43Q7gpCcg6yfOTPF492JdDUUeY025ShYBstwFRaguodVco5cNFPofBmlxSc4Jccg8ellddG6kxTsIzFA==@linaro.org, AJvYcCUfVFVd9fh20REnUIzF0SIAvb13KsLyLrNmdqpcQl/V0XVzmZ7D58+3l+lsQjlMl9dXhAnveeDt@linaro.org, AJvYcCVD/DjAiXqR99PTpr9oTAGwnG0EPM1sHOBcm1SSNvrZ97UX/313OZzCKu7CZVKs0ZYVDiQkDVDBkK5tEHyX@linaro.org, AJvYcCXMBB48CYJMHqbzAEQJwgTtw8fTUwBIzbDmhIAzI4CRS7fyX4EMCR/NPNOy/sIolg4dUFuYGIqy4MkWqK0KaczVt3s=@linaro.org
X-Gm-Message-State: AOJu0Yzrsb4Z0gxSZTuesXC5kbtDwzQoQLnPRyzhSAVw4yFE7isuWCq+
	P3mrgzSjqtbp63rZucJ/+r3YRzYrNbDiHoqaGQR3BJ6lYyjhcV+d
X-Gm-Gg: ASbGnctv63Q04D2/iqdi/ZWGI3l8se2lIRs7r77+wkeZMCnDzqyuFcIVXsEWb1ybmxM
	pX+C9FOtfPzcrWKlLCbyPXJIUMUe29bqSOelCrXzHLftSDRgXGP4JqZlDAFBr9XPS69dPaB6bCi
	9clH/RCvZbNhkGs1A7YhCEhibojHi4z2+sDsHuX1nksysi5cR2hhhxtiYM5n48xMhKHyIvLmJgV
	g9vWWW7LvrY5vHHqS+BaW/CRzsOnwNm4ipqBaN9EYZk4znCO4QgkhHYv3rRCk40d9WD0qBaECdT
	2jt3yEX1CsZJ0lIQuWinClFEpaQZ9h9AnsrGVg==
X-Google-Smtp-Source: AGHT+IEKXQ8XAG9aG4IJKUQ0712Vhcc3ATE2DfxiXf5irIpidBAU+HevlQue4r6tw4Q6Rs89//wyhQ==
X-Received: by 2002:a17:902:d485:b0:224:1609:a74a with SMTP id d9443c01a7336-22dc6a6851emr115611895ad.34.1745822420006;
        Sun, 27 Apr 2025 23:40:20 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:19 -0700 (PDT)
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
Subject: [PATCH v3 05/20] target/i386/cpu.c: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:54 +0900
Message-ID: <8ee6c2b02c97d5db358c3eb290d00afe71d1ceb7.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: V06+r5WvcAIt

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/i386/cpu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1f970aa4da..fedc47ea84 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6240,7 +6240,7 @@ static void listflags(GList *features)
 }
 
 /* Sort alphabetically by type name, respecting X86CPUClass::ordering. */
-static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b)
+static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     ObjectClass *class_a = (ObjectClass *)a;
     ObjectClass *class_b = (ObjectClass *)b;
@@ -6261,7 +6261,7 @@ static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b)
 static GSList *get_sorted_cpu_model_list(void)
 {
     GSList *list = object_class_get_list(TYPE_X86_CPU, false);
-    list = g_slist_sort(list, x86_cpu_list_compare);
+    list = g_slist_sort_with_data(list, x86_cpu_list_compare, NULL);
     return list;
 }
 
@@ -6318,6 +6318,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
     qemu_printf("  %-20s  %s\n", name, desc);
 }
 
+static gint strcmp_wrap(gconstpointer a, gconstpointer b, gpointer d)
+{
+    return strcmp(a, b);
+}
+
 /* list available CPU models and flags */
 void x86_cpu_list(void)
 {
@@ -6340,7 +6345,7 @@ void x86_cpu_list(void)
         }
     }
 
-    names = g_list_sort(names, (GCompareFunc)strcmp);
+    names = g_list_sort_with_data(names, strcmp_wrap, NULL);
 
     qemu_printf("\nRecognized CPUID flags:\n");
     listflags(names);
-- 
2.43.0
