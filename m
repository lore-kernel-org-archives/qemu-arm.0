Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136825njd;
        Mon, 21 Apr 2025 22:29:14 -0700 (PDT)
X-Received: by 2002:a17:903:11c5:b0:221:85:f384 with SMTP id d9443c01a7336-22c5359c36cmr196686585ad.16.1745299753962;
        Mon, 21 Apr 2025 22:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299753; cv=none;
        d=google.com; s=arc-20240605;
        b=eZxp+2BwGMuoI2zMQBlLKlC+XzxvJ4wCGXQM22q7jVuiKcW4zQ9UJlGAbSa8HdrYP2
         x0GhOzs2PW5PvQGjfRhGzZx0vZTuj+6cuGXWH72i9e6Nq7NPsphmQHhsuKUviufGlwOt
         8lxIqkLkbI84KNLlxQ3ZPhlzXUdAPxT+5Wvk/42rqo+Nd5S0Kv9FiA74i+n5L1YW7izy
         LeFEvu70K/zERC2oCf0OqKoM7EX+t7wzh/N6Mz9uegOWfeaKFztv6sNDbipnmGUcabvr
         ocfgjMJv0yyWzv9AKP0AN1TZOA/XYKqj5QyVuXPDvfJyQ0slqFoUF/tjF3L7LYb6s8IM
         An3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9vwsMBWLqSru1XC5tGa2owIx78df+Ne2sGVF0WVxroM=;
        fh=HcQBNt+xfdbL09Hqzu7d+QNLCZHM5YuwssyKspbxFBc=;
        b=WcjzNtbBoc2BmISy46rS0mHPh1jShQ5h7//vhe+HwMJRgNKYh/InD3sKOUmvYTbfMR
         82pjuBEufEvMB3745+m7i8azjjILKtQCsTyPG4PElkmMPQlbijyZD9VYsWcYySfhQJq3
         vnLQV4lIVdAArMFgt8ap/JD1Laox8PXozDiAJwoWR8FwYD/MMYuej7s3yhS4mcyyiVx6
         sOrxGnlvMEvk7n6CZdGAyhnkSUtlPqYDadX+bIWjufjQ3lot+jFHcf7K1uOOyD9n03tC
         6vat+sJh8VDyclVBaFE2GqIexKoAXWmZ23gfVDOfVmIC/Aj1VmALq6BxV+kPraou38wG
         LjMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQqTZ6sF;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bda1b1sor54998405ad.4.2025.04.21.22.29.13
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQqTZ6sF;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299753; x=1745904553; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vwsMBWLqSru1XC5tGa2owIx78df+Ne2sGVF0WVxroM=;
        b=LQqTZ6sFe5PtbbEM7m/bKh3ZxOTY/sH/cY6ADJb/2PJI8MsUJg8mjvA9+KSjHTNVjU
         DHTzhWmgbiw/VKy3pPLQ9AhYov7Yx9k+SrPiip1P4DCfetcJQYCApPmxrQ+p09jGiGgB
         572mB8tJIjyJ1eFdBvdIYM+52JmyEWkl4qslJD+GvCr4KEc/Sp71uP8mvHFnKnMJpSEC
         RflxKDFK3WCVzhqIvZtE+LctjL9ULB9vGtqkwbGlsWL2GCBEF/TQzd63SNuMr7W+GKeJ
         t9zLfyiXwwZcleZgnGgoNpWSyYk6UZQqsQd/sxR4+v4id6vJFln0YXYpCB69ij87ar8U
         /F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299753; x=1745904553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vwsMBWLqSru1XC5tGa2owIx78df+Ne2sGVF0WVxroM=;
        b=vXBrRTcGTfMxZoTVAPMkXIMt5suMityw6RvE27xUDSNvTb4o/RRyI47i7mIbgmEb9r
         UgrvmAjp7cdosofLPxrKuvSy3tZH/HWgPESPgOuIOL7YXDs0lYZ11jRkObOuo9MqlNPs
         qXzgPpHZWT/KUDnjZuW0Yei2/XdVU8pGFl5noYtZfRZrzDlfxfqonh9MNG4h99stCgtN
         rVeQi+7Lw8MC00GUgixt1Ufq8pUA4vDoOvfJqGcycQGM2UIWNTFH4HnhvDJIMiiyROYj
         fkburw1AES+8UwQ8fEWeCxSStosvU1WK1GKul8yztdESnFFbbBtcMpryE1XKQDpddZEe
         bTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5sR2b2otNLLH5BPEWZrZHyvWDGyMUvgAyIY2m6TJFAtwpxNogiohz0p4YAM9g2CEM5BQAcWU2@linaro.org, AJvYcCXMhu2d4xJCyTvxKH9bSty0VyzBecUoK5uo1cMicADE7Rd2xrU2X7Hi8d7UbF876hzKN2NoapWtCTqrmAWrMGg8y/I=@linaro.org, AJvYcCXcyCWUQOQEe9YFpruxY4HHbirnrsVJlxsb2HoyNDcQAqpjpZNI6ZKIPZV0+tRMZp2kQGUc/qa3qGUj4B3q@linaro.org, AJvYcCXp0IO+5prjUpg5AfvB6iMQ0SI7kLvi8KI/ODfdZQgK03xaMVoYq/g2ETfubKRPR9b7IFqWX245UJYyDJEKUKvfpg==@linaro.org
X-Gm-Message-State: AOJu0Ywjz5qfYNxHA35v9Xb3J99yf7j4j8r12weYcvvseTsOt+h4vfW+
	KhSI8DV9rMjPaYpy6bzB8iHRsUWkt6wcercWryvNAxae9NhxyU9n
X-Gm-Gg: ASbGncs0Zg9VSGuA+vHv/EYR9wnT8K3n6jb4kksmbMNDW940E6f9CHfBVD9hbd1YXxz
	2eajBPbyHpCpPa9glmrkUtyf/Bn2dpyWHmL44isesUSiR+goc/kxtO1RzHQ2hKkZMHkP8vFOyH2
	RU/u8zJf9/T69axc3ia2WeyuUymvd4TUgjFn5owU7VVvMDw2sRY5KFYn4iJBY+RyktVkC28Kqjt
	5he/aQLrZ5viPb28cpjmUeBmmwrMmPJG2lvpJgtkNXv1CZkV4onJSe05anTwTxW98nh0VU/opPS
	B0GFp6VhG5Eb34F0E6lW2LFojylRo5oY7ELpveCy9Jn2f1yFA08hUAo+/H8=
X-Google-Smtp-Source: AGHT+IGcgLfvr8Wdb5riVcTXWYTEKyRMiKMNTuqyUTz74/+a7cYyYkhgkYkaogzfi9swQMO3/AnoyQ==
X-Received: by 2002:a17:902:f682:b0:224:912:153 with SMTP id d9443c01a7336-22c53573d25mr231402555ad.5.1745299753393;
        Mon, 21 Apr 2025 22:29:13 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:12 -0700 (PDT)
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
Subject: [PATCH v2 09/20] target/s390x: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:13 +0900
Message-Id: <1e55b633d50567e8b145c98f626af5ecd93001f9.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GZEoDZwIgFx3

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/s390x/cpu_models.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 93a05e43d7..48cdef285d 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -373,7 +373,7 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
     g_free(name);
 }
 
-static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
+static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     const S390CPUClass *cc_a = S390_CPU_CLASS((ObjectClass *)a);
     const S390CPUClass *cc_b = S390_CPU_CLASS((ObjectClass *)b);
@@ -415,7 +415,7 @@ void s390_cpu_list(void)
 
     qemu_printf("Available CPUs:\n");
     list = object_class_get_list(TYPE_S390_CPU, false);
-    list = g_slist_sort(list, s390_cpu_list_compare);
+    list = g_slist_sort_with_data(list, s390_cpu_list_compare, NULL);
     g_slist_foreach(list, s390_print_cpu_model_list_entry, NULL);
     g_slist_free(list);
 
-- 
2.25.1
