Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178894njc;
        Wed, 16 Apr 2025 01:15:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:3284:b0:201:b65:81ab with SMTP id adf61e73a8af0-203b3eedda8mr1150746637.23.1744791342170;
        Wed, 16 Apr 2025 01:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791342; cv=none;
        d=google.com; s=arc-20240605;
        b=DO6kpTkzYOVAPSm8ZWxFMubUWp9ytB/np14Yh7nBDZoJI1T948/WB5oM8odxEgFUR2
         +1noXXT/IMiRe6V5RYdEoMFww/eswj/NoWIGrD9A03WymAf56JIF6+bahpOqLl8BTJaK
         UBqsU4gFOnS4nOf/BCvt0Ow1ZJdNvGgF8hmwIx4iqRzergnC8jD6OYI50WmC9/0cQDC2
         +q4i8ebhH5ORkE3Kfyf6VFtcex+m+B5Sr6OQBOmxVL0VtKOQKLkcfnCG3n+XX3KuH0Z+
         hJW5kcS/LCs240KHXDCnxc5itWJPsgw1vh9BG5ZcQp2pPaH+A4Od3x20palAQFjwiTxN
         2gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WpJvxCQGaFnF6HY7NcaQ25KSvKw9uO9sC1x3AjQFOq0=;
        fh=81oal//xM7JU8q/V0r5uO1QjW8xlnUFldg9S98AOPjc=;
        b=SYyWIGX9t1iuSwUq9jBYZRQqsvZLermsYTRRbJo3COIjnS1PSiCmB16xcp48SZ99n5
         UPxK7ZSLXCdLuj2fjvxkgSbYggnhm7q0bD5XSGP96dNMXqu1onWMtFhchRj5pi2e7dzI
         rMI4yEctEC7FQFVRBq0fwb2quP1f8pPUs/eidlJBygVlX8hBgtqLmTXFvHRvJbPIvgPk
         yLsJVa9bPtX1t/9VyajWNILO+O6vr9lbXYT8r/9Nw90ee0Tqxr8aVOl/txg8AoZxCWth
         +GokNTPghrfshOXhMBeb5NhcxlJBPPDSMtnQ/P7pSEXnOjYCBG94DsFrWtGKyQHrehM7
         Ikww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DqfggRbB;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d6bcaesor12238814b3a.4.2025.04.16.01.15.41
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DqfggRbB;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791341; x=1745396141; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpJvxCQGaFnF6HY7NcaQ25KSvKw9uO9sC1x3AjQFOq0=;
        b=DqfggRbBmqdZHCjjvHDSUwxuLXKLRu7OnfU91lTxN3OBTiOb6LMtZSRynagCq9pGLZ
         1LiTTj/Dpz233qXi0N/ObdG4Wgzwoq9nlQJcWO/fi+DipWe/68CoIc4CP+Ol6Qv6zqX8
         5r22g57IQX5uTJCfqYRY8vsWq7l4UtZ7NqfWDPWw9uqz0fh2fkmyaVkO3NZlcDX5whid
         SOgCDMspAYaC89u4WaPArqmkPnRoVIbK5Wb3UsRR7lO8bJYSgfwGSNTIYBIsZokAZZdG
         jn5fZYeTqLzO+JJyLDVKZhPGjv+k++V86b/CKspO7YkQoHXvTgSjkmqxgIhFRezPlqh2
         Uc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791341; x=1745396141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpJvxCQGaFnF6HY7NcaQ25KSvKw9uO9sC1x3AjQFOq0=;
        b=O8wzWq2fdSoaLo/+6sOa72n8bT1N2td2s69FtljZ9iDmnWwiMCIK/9l4UAGqVUGUeA
         q29KFDR8XZMfJEOwii6+XMVk8d2I8LnwuEoJ8AnaZIX0kY93S4rpD3tgBPY2EKCoQBlk
         D2eiEQIiwz+fblchSgBie/SW3KAtJoR0umn2yN71S9XqFVU6sjCdpBQtqH7BA0ehso6T
         pOwu8tP4UD7pRTu9JVEV/7lEOAATQIJ7E4cpQqwS5Xhx3bWgsbYYq3bDYonoZfWuU9kZ
         4tv+7OonGb4XNYey9qVG1GBE+c62Dr7ANhKuAQDWhhLSaZKBXIg2V4TQ7UmtpBQ0U65t
         C69A==
X-Forwarded-Encrypted: i=1; AJvYcCULmmG9fr4YfOfqQpzSgJ/378AUf2MPM5B8AHwk3MscXumTjuClBPisBViKvmXocM52CyuLaAt3QkMO+59KYxqICw==@linaro.org, AJvYcCUjr1MsiIYlNdpBXdfz2L5VkKe/UhiJeG6ZmsYDXvrtdM/jLoltWahNAzaMvsqIQDqWS+L+7QWYk2LrLUUa@linaro.org, AJvYcCXS29uFijvbJpHQ+hZhYjcGD0/tV6fsxKIpQSPrTXE8Wz32wDfVc3MILsSfVYkVAyAxGQUOjSMRc1a/duEBTIw2bBo=@linaro.org, AJvYcCXaH3mQrtj1DhDiFjCu0LmZBeD/wueGzb4bL+7k0/ocZ0oYKlAyHgBEIZguFKhX3JU30eON4VM1@linaro.org
X-Gm-Message-State: AOJu0YwOXELlmrAMNBtCGfs3cbNuRBqKToGMlrVcwR8ruSmORWLQ1EG4
	H+AGaFQJqAnCQ7Pwifve6cBPZ/uuI9aC4XbpjYCcuuH7hi8h9BEp
X-Gm-Gg: ASbGnctTc4hB/4ToNMUTYSgoOjd8Unyl8G1wAFOtAUI98mVTMenmodaGhGq3foxIiJP
	fuW6WcXKO649owCKmn7fLJkdEQZNJxzdYUqmN0/nEXOIc0K22IVdzYO3Q03E4SVFH8HLNMg2Vwn
	/Jz2lhu9GVzxysfjVixwihtLX2ULxDGFfY7NeCUU3QRFIymviUhlOZSu1qn4x2ds1y/xh7DoTiq
	uHlYsXSO9xAz9ZlkobAnTU6fDrsRE1JHsawJQAg139zX7r3+bLpJUS04gtUT3TNA0pWRZ/Jri7C
	xFvv/W0EtYviKfCB0tJ8DRFRu6SkHEdzR6vkWEDBcSOcRf2vimDwNxXtlg==
X-Google-Smtp-Source: AGHT+IGxLpFGOdeLk9mPFSkfHfbJw8A0iENnrM/+hSulZm4CxoTeH4oVbmxYU8fUDsz6zRCOaAXueA==
X-Received: by 2002:a05:6a21:670d:b0:1f5:60ce:6cc6 with SMTP id adf61e73a8af0-203b3eed04emr1324160637.21.1744791341546;
        Wed, 16 Apr 2025 01:15:41 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:40 -0700 (PDT)
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
Subject: [PATCH 05/19] target/i386/cpu.c: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:10 +0900
Message-Id: <f73846a5494a1b6f2abb7143ad682c640ef4b9df.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: INaFEseJs6iS

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_list_sort_with_data and g_slist_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/i386/cpu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1b64ceaaba..2c494e4b0b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6226,7 +6226,7 @@ static void listflags(GList *features)
 }
 
 /* Sort alphabetically by type name, respecting X86CPUClass::ordering. */
-static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b)
+static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     ObjectClass *class_a = (ObjectClass *)a;
     ObjectClass *class_b = (ObjectClass *)b;
@@ -6247,7 +6247,7 @@ static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b)
 static GSList *get_sorted_cpu_model_list(void)
 {
     GSList *list = object_class_get_list(TYPE_X86_CPU, false);
-    list = g_slist_sort(list, x86_cpu_list_compare);
+    list = g_slist_sort_with_data(list, x86_cpu_list_compare, NULL);
     return list;
 }
 
@@ -6304,6 +6304,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
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
@@ -6326,7 +6331,7 @@ void x86_cpu_list(void)
         }
     }
 
-    names = g_list_sort(names, (GCompareFunc)strcmp);
+    names = g_list_sort_with_data(names, strcmp_wrap, NULL);
 
     qemu_printf("\nRecognized CPUID flags:\n");
     listflags(names);
-- 
2.25.1
