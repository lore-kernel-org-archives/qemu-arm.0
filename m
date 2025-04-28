Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783409njd;
        Sun, 27 Apr 2025 23:40:13 -0700 (PDT)
X-Received: by 2002:a17:902:d486:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22dc6a0d459mr114598555ad.23.1745822412986;
        Sun, 27 Apr 2025 23:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822412; cv=none;
        d=google.com; s=arc-20240605;
        b=i1BsIdiaZfbh5cNx104YY3zRTTgjn91ZCavg56t6OzZG67WQwG79SUx9AwrQFm1bln
         fRnQGjLASMqj1B2/Zi2rY0htt8Vf1VuyltIsfSUgDglAY++OHMNMiXvCl8v/ZH3N89Ek
         DkLX5uy6Cety/OKnVGw0KL3+YoUfli39boPyHFwkO8zTq63MPoLJe4TbQ0Tj3vn5EUly
         UGW3Xkp+8PhR3z7hEt7dEZNNjP9N1scOnddRnW2QlnyQA0AFw2ueThqVbGJGLUHHPAWo
         8ddFssJdA+frFDWmKKgP7ooB/VNx8jJXPJvOEXs+t8rkJzI9ys1e4irKhHyEnJoXxw47
         iWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uDAIV3MAAhgPQVTgQ5ZP+CvmOSVz4UfgoRFflq2h9Eg=;
        fh=2zhxxi/XlADLlnAJoIp67K0Gk54E68XWPRPMdRPZXxM=;
        b=YGvqy8dtAi4RTBQ7pcawyyw4l/bG/7O9RbIqd2RVwd2RqS0bwiyDYQDkxi7wSb+iWb
         JHkbXfzA4oJMm9FZRs7ST+1IccBVInByi+d9sv3JlK2d0YqVkwRGJjp4Pw3Fo5Mnse1S
         mwtVccnWbrLNMdaZel3VMFaxMZp3uqaqsWwegquDMQpXqthNZzk04C4v0wCUNWeqwLbE
         sIVlwUwlUX1TvaroSDXWv3G6d1o3YKGcS8VoK+zCAKr35h39OVJNFIDXAk7Xr0Sz4gs+
         EYII86EScH7nSOh0NLmZ87rIqsYMjZzJpnfVMyfhcXSZ+X+ZZPme5t0wFlYFh+QRUYK2
         MpVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JBKp2k04;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db5110c1bsor51448775ad.13.2025.04.27.23.40.12
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JBKp2k04;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822412; x=1746427212; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDAIV3MAAhgPQVTgQ5ZP+CvmOSVz4UfgoRFflq2h9Eg=;
        b=JBKp2k04D7DwYo4KMNd4P8RSCV+u+4m5TR55d7S5+dJKSgKb8iIDrIlIXV/L2kE6TU
         HvNkp6nQvb/W+gxCXwaAAib+Aq4hTxbNA+GXLagaK2LeuYRw2vikKY+6KBB7Bn97xjbx
         H/FWvIqGw6hpPgtnbTdgNyJ9dfZxmOkENqQL6rsDodkg5hCRNY0TtndjQmUShrrtgtzA
         Djp4DjN6RaI1cbwxRTiNkNMgd6lzb/NT+yVDh0cOFr2Te+OmjcwtsoB634VaKfRzycVc
         uOO9vTRhS+ZC/sdwwYOckQ9LKrYNWiiOV+xOKf3/3PPOPImdNCm47vRlrTsA4JxYFfze
         5r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822412; x=1746427212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDAIV3MAAhgPQVTgQ5ZP+CvmOSVz4UfgoRFflq2h9Eg=;
        b=Qw6znlwk+jQ5sxAph+9YtzG6TgssRztRQvmVWRYQbXzdL9Gnr58eogD5RB5vPqBRtf
         deGWDaHFxTwbIqps4gWsifMQeDsLAOy2BAe/SXy4SDyFcZtqPzGwLyx+NmK353xU6eD5
         deMyRDfhVjr5HUN/Cr70uX/DI2ft/XNbqWWwx4AEGFWYrFxImC8JvM8Ovs/DYsgvPBI2
         88Rg8762lGig1w3Ay7EGHsE2tzDhxsW6ZNODjyZzHuaG9GPqU1u1DBLG4ynuyu/jLjwV
         4b2BvG38IU5M0YFhAP+kDVXfCGCYp+MQDxlgO6VAEfO6JviXi1HXmUpPc/ea2BENRz83
         b/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPh3E0Q6/mn33ikK/uS3D26ctXy9Pgn+eiCf93+iNANACSl4MKvGi1LXrT8KDQ2arBLKJjJfNj8/xXL0O6yQdGKLg=@linaro.org, AJvYcCWsod3gBrgrsaSU8r+e9Rql6xLbHONxiH5xakj9esDaPlWIVa6Ip1uJlH8MRNlyxBkiArbaa6tbxQk9bD3m@linaro.org, AJvYcCX4yRr8YoHr9R6ShFtGw9O66lYeCz8ER5q7u4jlklZcPUvVRSdpRb+WGLaJvux36232y1ujg5zKy+7leubKncNHUA==@linaro.org, AJvYcCXm+S5jPGErgYwwV4/mEFoCtOAWU1XE+eCHtFgKvgwpv3YDyIUtEv09MMepl6GOVPwQasm0Ejw4@linaro.org
X-Gm-Message-State: AOJu0YyDzLa0CJM/eKuIYCluhCWxqjNXH9eB4ks7Pcpp+E+k6Lo8Y7VJ
	LQfVkNoxADP9/pWhpd4wspmozhSBTAT4V+W7VGnkRkqnk8nejMdw
X-Gm-Gg: ASbGncsMLkB+JGRze9Locc9pAzF9hneDdZBsbuacVqTsxvXeJFUCH5b8381zSncO9qK
	pDGR9HHrE8rBWk4o933nL5tmFDz0AMnOm8rUg4Axy1A7qkXhPM+RFnkigsQZtBfYl8zFeybRR2q
	ec5Qoz9uCal6cC7upLZc4mUfUZK9JPXjyVu98ppdwDn+NSxEhfhszEGQzMABDlRkKK+4N8JlSNy
	aNQS5nyeoCDf92zrhy2vS4seuBUSDcbuS00dXww3f6+r9O4/2XFwDRADCcGZrNl7FOCCKWuGT3A
	L186dUooz40EelmtJaS1Eg9vp2DNSmSLVpaBrw==
X-Google-Smtp-Source: AGHT+IGYgDPnrfPv3dTxLkHXLjDG89KvtmfMESBMfs5U364tez7VetESFNykboa8hSQIs2v55v2j3A==
X-Received: by 2002:a17:90b:2e03:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-30a0132e771mr11805766a91.21.1745822412354;
        Sun, 27 Apr 2025 23:40:12 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:11 -0700 (PDT)
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
Subject: [PATCH v3 04/20] target/arm/helper.c: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:53 +0900
Message-ID: <7d56c82382e8b4f1694b6d7883b2ce3084fdc72d.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rSz4npV/Fhte

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V3:
- Fixed the argument type of cpreg_key_compare to use gpointer instead of
  void*.

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7fb6e88630..c7ff9f657c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -222,7 +222,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
     }
 }
 
-static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
+static gint cpreg_key_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
     uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
@@ -246,7 +246,7 @@ void init_cpreg_list(ARMCPU *cpu)
     int arraylen;
 
     keys = g_hash_table_get_keys(cpu->cp_regs);
-    keys = g_list_sort(keys, cpreg_key_compare);
+    keys = g_list_sort_with_data(keys, cpreg_key_compare, NULL);
 
     cpu->cpreg_array_len = 0;
 
-- 
2.43.0
