Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp363812ejs;
        Wed, 16 Aug 2023 06:40:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:9189:b0:13d:bf07:7444 with SMTP id v9-20020a056a20918900b0013dbf077444mr2291311pzd.0.1692193219811;
        Wed, 16 Aug 2023 06:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193219; cv=none;
        d=google.com; s=arc-20160816;
        b=r30A1U0hFQK5LhNbcH15diES9MJBQzs4ehRPZqQa0srCETy6KVeJVWag2XhRRbhSHc
         /DgofytmdrDHnL2zO4lFg4xoXlAYxJari5ndLmwIk98gwm8VwoYISh49M7iOBIMCgYOi
         QS7BKKdfoCeyyjH0Y+4gBirvp3fG9HKBKmA1CfszqPio663/lt7guLCxWtZE4hZuyANH
         se+epO8phlSvT6fCTUM8ta4raK5NOq6FLj4zsO0EkEOYHW88p7i1uYzPGRxWYlkov6dk
         WjFY9A+on0N3LZQSajtMZYgzULAu1zvY9N63RRb44bnrYDPY1O5+szcbfVF3aSFR8V0g
         pfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nZll0H6CXaAKys7cBNNrlAZQAX9ewDlJMrzDsStORGc=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=d8GlJzqGB0ApHhhbflF1ZYUfODmppmh8poHoxJcD7ups5n1DnpIiccnXvYrxvhfB0G
         GHfcAPCKAp0a4lA3ATNVqQZpDpAPDEv+8+criVCPt6N2e20OKeaJdAPoDguVADjf0mBv
         8jJ7+M87DCyFmvTsIudcnYY346KA9qYqedLj2F6kf6Ghr/o22wo2DU09YRjMQSa7VKbF
         UxsKWYPzBOBS0qKL/j0tR9zF9frvsthPPzqHdQ1g28ygomVyjr1vJyD60YpY5YqM9oZn
         6ci56NqfPGymMwohUgxPcsDaO+mTS+qURXFrChu2EYW+F64iHPaCGWAKX6mPMDweq3/x
         9NwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Y4Z3JSLb;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m19-20020a638c13000000b00563fc10f771sor6799714pgd.4.2023.08.16.06.40.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:40:19 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Y4Z3JSLb;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193219; x=1692798019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZll0H6CXaAKys7cBNNrlAZQAX9ewDlJMrzDsStORGc=;
        b=Y4Z3JSLbbqp6hcAm2g65/9NPsKe+m5HP5VKCqWSvbY/ILGUWUrwDCcyAJnEXpW/X2E
         Vm7PQ66C34wKVMqRTr+wBcFKMvDgGkkZbOPgLrPNT+RWdIqrgqV0/wdowOSRjQuLH93s
         tpFgNBJBYW7XCVjdxSsYRLWDyDrjq804ox7Ghbg3GwOa9o+rhgvukqhyoF7AVyv8k+/m
         pA4rGVOYxZegGiavhU6F9cNzPdL6vH+FNK4iXBXcVm0A/LsoZ/wju97U8t6FXNU6QNQg
         sR1mjzJanLGKi0yGKcv7k06zES/gRCJMxEBqsTTbhH/sryAzFhWe9wrjoMonriw49Aun
         besw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193219; x=1692798019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZll0H6CXaAKys7cBNNrlAZQAX9ewDlJMrzDsStORGc=;
        b=ih7vb1NufAGh0EoxIcvvPDMMXx8I5Hm2pYmmzm49fGNhT14kCHFadYBcyE5PGbVMTq
         1uJ8KvS0T+ZfcvpJZYqTIRV4tf6GhXV6H4wfy4NhLiXULcsJrypFO8Mje2lzUZEMvN4Z
         xIPKhGQ8nMeFrAwy5NRm0Yfy+AKCG20mlBWTizuqD9AHb+I/aJM+iJdEZeynDwUxz9FR
         AhRiPMDNI+zDuPeo8//yaLrF/Ydcpfy66a9B4VozV7EzRLyiiJf7mwvnveoXg22uO3g3
         qYVrrCVcm+BQo458UD2tC9Uf34ThREckLr5+0i7w0dmoDuWBukB8iB8ogqmQ4mmNU/Dj
         aoiA==
X-Gm-Message-State: AOJu0Ywo3SgfR9RVaq/ccyi+IzoB/WV1NVUJHGxSi3tOmIeS4g8P1foY
	STt2T1w9PT/iP/LjgC8AJRMM3w==
X-Google-Smtp-Source: AGHT+IH2Qr0VtfkmLBVF4SUA4/1JXblF7+YhrxctQPDO4368U0x1iYdOjTpgRfUqhAp2aGWIa5/0Qg==
X-Received: by 2002:a05:6a21:3d86:b0:131:5995:340 with SMTP id bj6-20020a056a213d8600b0013159950340mr1857560pzc.20.1692193218657;
        Wed, 16 Aug 2023 06:40:18 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:40:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 01/25] contrib/plugins: Use GRWLock in execlog
Date: Wed, 16 Aug 2023 22:39:11 +0900
Message-ID: <20230816133938.18310-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p/mpw5IA9Qee

execlog had the following comment:
> As we could have multiple threads trying to do this we need to
> serialise the expansion under a lock. Threads accessing already
> created entries can continue without issue even if the ptr array
> gets reallocated during resize.

However, when the ptr array gets reallocated, the other threads may have
a stale reference to the old buffer. This results in use-after-free.

Use GRWLock to properly fix this issue.

Fixes: 3d7caf145e ("contrib/plugins: add execlog to log instruction execution and memory access")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/execlog.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 7129d526f8..ce67acf145 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -19,7 +19,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
 /* Store last executed instruction on each vCPU as a GString */
 static GPtrArray *last_exec;
-static GMutex expand_array_lock;
+static GRWLock expand_array_lock;
 
 static GPtrArray *imatches;
 static GArray *amatches;
@@ -28,18 +28,16 @@ static GArray *amatches;
  * Expand last_exec array.
  *
  * As we could have multiple threads trying to do this we need to
- * serialise the expansion under a lock. Threads accessing already
- * created entries can continue without issue even if the ptr array
- * gets reallocated during resize.
+ * serialise the expansion under a lock.
  */
 static void expand_last_exec(int cpu_index)
 {
-    g_mutex_lock(&expand_array_lock);
+    g_rw_lock_writer_unlock(&expand_array_lock);
     while (cpu_index >= last_exec->len) {
         GString *s = g_string_new(NULL);
         g_ptr_array_add(last_exec, s);
     }
-    g_mutex_unlock(&expand_array_lock);
+    g_rw_lock_writer_unlock(&expand_array_lock);
 }
 
 /**
@@ -51,8 +49,10 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
     GString *s;
 
     /* Find vCPU in array */
+    g_rw_lock_reader_lock(&expand_array_lock);
     g_assert(cpu_index < last_exec->len);
     s = g_ptr_array_index(last_exec, cpu_index);
+    g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Indicate type of memory access */
     if (qemu_plugin_mem_is_store(info)) {
@@ -80,10 +80,14 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     GString *s;
 
     /* Find or create vCPU in array */
+    g_rw_lock_reader_lock(&expand_array_lock);
     if (cpu_index >= last_exec->len) {
+        g_rw_lock_reader_unlock(&expand_array_lock);
         expand_last_exec(cpu_index);
+        g_rw_lock_reader_lock(&expand_array_lock);
     }
     s = g_ptr_array_index(last_exec, cpu_index);
+    g_rw_lock_reader_unlock(&expand_array_lock);
 
     /* Print previous instruction in cache */
     if (s->len) {
-- 
2.41.0
