Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783625njd;
        Sun, 27 Apr 2025 23:40:52 -0700 (PDT)
X-Received: by 2002:a17:902:f60d:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22dbf5ec740mr153141425ad.17.1745822452057;
        Sun, 27 Apr 2025 23:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822452; cv=none;
        d=google.com; s=arc-20240605;
        b=C8b3eKHrHfwlnpGmd7fcrJUn5kMVr4inz3V/M8METuhihuVUhkm9gf4lXerX4r2YDx
         xzgwodprySQAI0gbZPvJWA7sInknt75jg66NAzYvlwDO5QPpqMo65INAdT5wEP8YvDiA
         Dfr11XsGK72zMK7Y8pp+J89JcwAwxuKGksKFw13SEgcM5w3ApIUZt1NrZBToXCQQQl55
         QpHRPJWXrJlMoz3a8CmE4IpvQZk2Vqrm5DE2II01WixQsN53mSgHSPQjumr3T5pVQdeI
         xHnVcX1rQqedgiWJ9uGoZv7A6Hn7fjJX/c+yve6h0jeTrFTrNdRjPIrwv7TLfpldD9sk
         DJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8Q15BGW6LhwhT6zw6SRS78AEAgNrS56qYf9dYAkVJ5Y=;
        fh=HwnXj7sXn6oExMhq8yb/feiaQ4AOsJ61V5CsyVReNlo=;
        b=cCzVnlg9SuZ9p+O6OGyiIZgQD3vLdV+AtfRgwIZaPmN0dYl/Hhhoqol26mQts/7Vdi
         JUfuGD87OO9+QAves12jShpFHdy4wVrNU1yWV4RwG3rkmx6h2aYUz5tPD26u6j7ZdvX7
         H1vEbHHkeoRm7HztByB5cQxYQcQ12/77nuFwgNx7qm5LzcJAQJLi8koSO5jq1VxEs7+Q
         KON2Sj/nHJcEKjRhZokL+74wc86gtsenyVt2KVBaR47xeVV4Z/AinQatiwcG4w9d9tIZ
         R5zYEmAvhJ07h5KeNHo7zF1KenCCZgLCgFHQpX/mQ+wJyBA6E327u0O7yRL+Y8XtnJYE
         GanQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3kwRUyN;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f4f3bsor57487875ad.13.2025.04.27.23.40.51
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3kwRUyN;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822451; x=1746427251; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q15BGW6LhwhT6zw6SRS78AEAgNrS56qYf9dYAkVJ5Y=;
        b=b3kwRUyN9t9f7ZimyQefW/OGOlStnX4t2sIxVU/caAht2ttn49OtBgRo/JS8QJSmKx
         AkNQhcmRuE/xUXqPp1b3DTejfiqEG6qYhl5vdEb+4QKIxQ3jB0SdVVNzVfgiZiVGd57t
         CCrTulpUfmUmfrQcL3S9de2E85uhuGdWahq8u6rDZEMcmUQNjcj/eQrc84bAe614ngnn
         h5kcGH2LXT9ucICjryxGk/VSO8bfSxQhLabEjSkBKg/fm6ZxvAT+aIm692/E043n2ht5
         JFMDieWcnPhsic4O1tnDQeHg9laguA3+Gwh3yDLX4JOvss/ZfoLCBQ2yXzq1nzzWEHt9
         URow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822451; x=1746427251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q15BGW6LhwhT6zw6SRS78AEAgNrS56qYf9dYAkVJ5Y=;
        b=kh0pQNYA0km8eRKSRuRWGJC5Wk9CKmkLfyX97px1aJi0gk+4Wpq4K9xpEu+70ExuSx
         nB2CW6Y75XANqEsrWE2p4Y6JoIwjverepFTnBm0ctOOzdICRJ+nC821MrcBcO5N33D/J
         VFKp1wJQu8WU8QbwQvKH7LMVYwfn0RRajcirrCS+8selx/YxpRSbWvokUeXxQFfOTXcG
         72YSmQ5tKAsgbafUsW5cmc3KbA3eOy+EabC6u7AxPE6WV6w6jbRFG95OEKKo4HrvpXT7
         7CnQBhOHrdtO+gBjeWWEdCzZ4Id6rXANvadmijlM4HRSeiXWahIjTT7gadfpdfuae0In
         Dw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQmXtq2+8R6cxMzBil9SdP+i61hHKwfYqlwagTo9y4vrpoaCbwvxGMiJv9HAG9U4tZyFC23IuEf8BUOR2M@linaro.org, AJvYcCVag/zCdkwyX+V0QAp/lPfCDUrxT+h0742BkyNwQLEO3yFFsBhwza2eOXRuza40mjnOgKUf2g6VxuimdqDPvYaPhw==@linaro.org, AJvYcCVxMnETWQ0BVi1DH49zEV/TjM4nbKn7FKT3dpI9AUGhBDMUkrRqiHJEL84DkFTv/ZKwIBD3hZzV@linaro.org, AJvYcCWxUFUC/G+G37VWGm3Lk8QQn9QBwDjsVUSCu1TYoW2dAoE3lWUjQPyVtes8yK81mDkudIdwQqqvIDFtqvIiTzTLJpY=@linaro.org
X-Gm-Message-State: AOJu0YydMcP1NSD6sp9IP3deMwzdrvmozxQENXR4px0eaQ53ImwQezNy
	hQBdNr4BzfcSIfl5H1OCf5VtMANAfuAx43raAebN5WDgc0Ur0yiD
X-Gm-Gg: ASbGncuQ5cO7tEiavsXp2DBg7r0mhmZjlzwj1KXhKp7Gl5M33YUJNAthENwY6itWYlg
	HohKjiSQachjANfDcAk+dHJkyX/puriFfgj6a9IArvOrGjY5+r0UoWxOjAyGbrCCR+YFSum027h
	y3lnirPjjZpHYewwxMpAhXbTZed9VQYdrWkMaF1T3Hf111x4j96K4tXYckC1GpGEFPaGV4iGt/W
	6Agxd79juqVgFQ/jFKUrwTarN3p5MaLyFi3p2l79rB7VKBUm+1Ki44PAvbGQ6zVIu6/PESra05X
	l8RRp/sm8JOEvqZ40+jVJjpR5KOsU4yfFZKHeQ==
X-Google-Smtp-Source: AGHT+IHUzvkkUjB8d7ThlNvRcVu0LfUpCbBEl2GyOReJ/zYjSf2e/+O+k3koZv79twbkihrK1nuyzw==
X-Received: by 2002:a17:903:1744:b0:220:d601:a704 with SMTP id d9443c01a7336-22dbf5ecbedmr128835925ad.18.1745822451373;
        Sun, 27 Apr 2025 23:40:51 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:50 -0700 (PDT)
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
Subject: [PATCH v3 09/20] target/s390x: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:58 +0900
Message-ID: <e91c4e266b839f62b5c41173a05896b210ae1180.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mcOCMYiHXIvW

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu_models.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 8e0b01dc65..5e7c091681 100644
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
2.43.0
