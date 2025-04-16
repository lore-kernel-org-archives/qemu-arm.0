Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179132njc;
        Wed, 16 Apr 2025 01:16:13 -0700 (PDT)
X-Received: by 2002:aa7:9313:0:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-73c266e1782mr1367698b3a.6.1744791373264;
        Wed, 16 Apr 2025 01:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791373; cv=none;
        d=google.com; s=arc-20240605;
        b=KY4ixlh6fHdKtAzDcnjIDKGs58nA+X2Mvtgy8Xc4sOp//p1Grxf+g5Io9n8bEnYRzB
         3Jz1v6HoK0sPdlwL4eUwoD9dkXEgZuvS8QhyuRdsVPM+faYzsJVw3yIpJwD7C8M00iWL
         JRvTBZBhoLkTv/Shf0UFqz2uJWNu0yCyg7EkeW3fUOkCon8q1XxxQlV1W9hqNh+d3aXU
         nViHpG2UVXnXVk6LlaOBjDadqMRhKxp5dVmakQHyj7iQBsf4iBdNV3uHK7QSbp+eSVlr
         KuXeBqshkY01nLlchm+lCJ3AMEiLhFDanjspSMdO5cCXcZtk0qgWw4mGBBjpXuJ8psl9
         wPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GZwfnw5vxnLL2zR1KniO5W7Nb6K9SEbOa4Rm3mdsFsU=;
        fh=Q/rfQ/l8noLMMLHNX9q8f21zIBBX/xYJjjtCunAlDSA=;
        b=FUYpM67ozUcFhvPFOV9Zy3MjpNegJ2SKsKLFKMndNpnxnC2WhCeOxCavlw4pbPeFt9
         iZX31wanFIXetehOOMe8GiAbOlYXI9lrGbcbghf7Q1PSGvtntBk3mz/PSeNYPxjkQ1wG
         RGcB+gxO3dsISxwX9DIh1hlvbkMK/8HsAAGlZ+JsX7gl9LZHA34i9Czu5bybSO5JztOq
         x+WC5Hltw4Y3VlliIj1MM2A+ubmVWZpAj9kDTE6RU+U5LxfbLNAc67K/uZPxMfVm/GkK
         COZIRWmPIw++ddSVyfYm5OhUa4AMUWYfrDo7yxc4A5tbr78rrpz7Htq9OISlJmLNG5Re
         PTLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qy52Uq5M;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d44bcdsor9149074b3a.1.2025.04.16.01.16.13
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qy52Uq5M;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791373; x=1745396173; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZwfnw5vxnLL2zR1KniO5W7Nb6K9SEbOa4Rm3mdsFsU=;
        b=Qy52Uq5Murp/+qt/gOXiLi7Ji34P9t/3TypkvtJBvhn/gv4W4365jsmy6ppn0tHyF+
         Io3xVOVci9+zfP1vEzS8OeDFkfyBQfSO0R1VS9KW0x/LjefCp5VIl88vLjHqcJb9Svm1
         F7TjgIZL5lhYPMsvVVZhLQS7SvTMcm1BytjYLY6wQeFaYvDjEZu+30fmMKQ8wdINwd/Q
         yroU0SAcfGjYW0p/22OJRJj2Gbs7Vo9h9wAmBQI6KR7NwHSBRdGWdT0iMh/FAH7wBw+C
         kx04cuuaIxg5e4JB4gWq2TOohhROkpSMIwnIN2A1Oog3a7qx+2suTis55inHjJodxnhA
         04sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791373; x=1745396173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZwfnw5vxnLL2zR1KniO5W7Nb6K9SEbOa4Rm3mdsFsU=;
        b=rjPHyt9aLLsQGG3hOkcVeoQUgiHSYZXeRO4PMWhuKVIRxhELNTqcqYYUBphB3T3Oj3
         cWikFhc6R3r79XPUZc+OYUdUDPVCw9U/sroQJoYdIQbuXv51wuRo7e8PdNOMNJc9Ju3m
         FGZvmlUxxU4bhmU4lPjlKuDTWOp0DPoloNOb393cg90G1/0tUkaIpJciE8xaAcqIovyS
         jdIHulwPx//aJ5jmOKoM56fim1tFbz74c3hBZ6KC5YAQ6ZwRJQ//hgbqdD9FWQpYYDDR
         /beKYGfaZjPGPb0UD/iMcqZ/fXHCE27lInG3F8HVWTPKJS5SWDICA6dwF39oKT4wuQkW
         ZzyA==
X-Forwarded-Encrypted: i=1; AJvYcCV/z8jAoeDeJx2qyZxFTC/lxJ1OmXZA/Yi7RCSfkaLjtXQTp0quQKSA2bhpCgmmR2MyatK6mss1@linaro.org, AJvYcCVAr+LMePkf9IqN64caKl5nsoR3UJO2tnYQTYDqzeLpZ2CKl3L0B8/u0s5tgVfxGPHvGm26xwqvMqlSP3IDcZ2HxA==@linaro.org, AJvYcCWfbn+iOOTS0GK+7rJ1rAl7ZNvtTFXepESwgF/6WHILfLL7iYcqHVSrgtvsOgm5TzknuxGu3PjyuqezL6kR@linaro.org, AJvYcCXEQoj71Nie+TvxL36Hf4bcwAfDhw2iTJyR2d93xnZ9S/FFZ/8cwmiFgT2dx9SPIXldalDyBTdtsURrbg2Pa8YSrrU=@linaro.org
X-Gm-Message-State: AOJu0Yx/WOugYrT6aMAahCKXvxNMYC55NIleP7STgE/2n4w29EdFN4m0
	seayUwazFsikUatg6JUJa+W+EsN3fDTs0vmTFncTtdwJWA5ZAcEqE3zuRCL0
X-Gm-Gg: ASbGncse7Jf/R0bY/W7TS3oxjVKcpCyc+UEkSJaxsK+TZ3IsNqlDyQufZGC1mowSagN
	9wz+hggkBLRZF4nDDuCh/Nh55TUtvgwR2dgPZHKA+gieZpjBYuwbjsUROSE5wON/nSCd+QY5BrY
	1N0koSaMRmH20cS0e1k5DDA7syzW6A6bOBzAUeTuXbyMdFdgvbYd5nElLQcwY/DZQ2+eWadjJHH
	tk3Kb2efLkpTZJ9YY4AfTILLVjGvJ1hhI1XHYy1YzfRViWc7aP/e5IqOrtDitwuErA8zpEELvsh
	61Jtoeb/OPJMQEtxVJj4Q7VwTjsMekItDyIC1w1Nh03DJe24tqAorfCwRg==
X-Google-Smtp-Source: AGHT+IGQOK7n+6TprGHiO2Lrr347LOOWE18O3SkbS/KKjF+Q4XTcV+l8OwYIIP3q4cnQwUmzahCevA==
X-Received: by 2002:a05:6a21:789d:b0:1fe:9537:84a0 with SMTP id adf61e73a8af0-203b3e9fec3mr1108892637.15.1744791372610;
        Wed, 16 Apr 2025 01:16:12 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:11 -0700 (PDT)
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
Subject: [PATCH 09/19] target/s390x: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:14 +0900
Message-Id: <a6c885f0f022816e19fa169ede5f2599db94a889.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iwXqw+H/kHyH

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_slist_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/s390x/cpu_models.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
