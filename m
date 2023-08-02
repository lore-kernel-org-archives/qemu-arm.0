Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp205871ejb;
        Wed, 2 Aug 2023 01:46:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d10:b0:682:537f:2cb8 with SMTP id fa16-20020a056a002d1000b00682537f2cb8mr18224703pfb.26.1690966007898;
        Wed, 02 Aug 2023 01:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966007; cv=none;
        d=google.com; s=arc-20160816;
        b=s0Z9UeagJLnA9ZvVBX30qyOz0Y41tsWN62xfFmm0W7oYLaTutt3YR+D5wp2cr2XTxz
         aNb0b2LUIZO7YbKbeSc2/dAja9QzBh2L0JxB5Fka8Ey9fmoiTNlVzJ6NJ2cdVay9J1d2
         2+WNxnNg9TaQzrtT0febKBMIULr/FjLWJ8fi1D1epHC6MB/8iMnWs67WJs8Sn+OefAl3
         AsPrguIZ5mgQZNVzKCWrzR2GTLvhdYYE/KxOph67iLKplMnEAVCRSOiO8w9SExODeE/t
         YMZ2R5c88TdZkQNuOJ/yglBOdBHK2y7dTsGEbKxHWAdC0d4CPIO+7TxzlhjZht1cZ+8S
         b6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rv8ecp5MNNYaYzflXkXYlG6pC6Fau5qFV5g6norDKWY=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=ItSkmZdfNP06Ab1EEwL2Sb0eUndsuP8HY15Q0yv8QltZvtCRHgMVVDzfFtwvS0MLfY
         V4yNIVEIEZUuotj47UCOJFC523lLp3J46yI2+ZX8rgOtrpXepQ8K+VAw3+OiaeOQGSf0
         oqohu2Tbk/Uieu1pqNcQ5WcxwLpt5UVREkzhoFITbmg0OX+tyNxDB3WA8HFZU9YzjIi3
         WAd3SevVZyVgns3VJvM2fXQm6LI6sUmibMqZZNIN8qHXwfn8Ni4JGLO1eaMkB+yE0ZN+
         XN9wYQfXwPXsFfEr843uVkvnLsUx2z2ZBtFzl4hmdKlBGCLtJFhXrPNk6J7SYjF09Mln
         be8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=z9wjAVBD;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q4-20020aa79824000000b0066c729f58dasor8074324pfl.6.2023.08.02.01.46.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:46:47 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=z9wjAVBD;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966007; x=1691570807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv8ecp5MNNYaYzflXkXYlG6pC6Fau5qFV5g6norDKWY=;
        b=z9wjAVBDpHMbkG6eQ1r3e9ny+mLCXFsCxQQo9SYfOOWYUY/RQPMbUkymHZVAcfvvUD
         3OofNVeHGqhCahnR+/UW17yxhH8ot8q5p/iXgKmsmiPiopZQMEmehFUtMHFDUpXUMfVk
         mXofmBj+JmzrPOTqZG7I6XcZup+9uM4oJXNVeEmv30/qd/keO32a3USFQhIgSLQ2PZ7u
         ELBSV6eteUtIFtJwqeXRW0rEr6R0QCQZsTsBYZ7fYa+dC1y5OXxZ9DtIg3tGbuy/IG6J
         j6FW/Ud5yeigEy+TXBLOTHiZEH8VDLmJMNPu7hi/EtSV7v2v92EAuOQt7Ymv2pxyXYKY
         Q0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966007; x=1691570807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv8ecp5MNNYaYzflXkXYlG6pC6Fau5qFV5g6norDKWY=;
        b=mCR/9/R7DsvE3EImRK7Wwf39lOQ1YYcjcC1GO1MFPSxgLJii01jI+rhBDaStrjsOG5
         TTXnVM3Uoom1il455qjoog7JQuFwrdg+rHiQBSq/F8xBQQD6W+qmNE7lv4tLO1xa53cN
         5tSfipqkPCfFMf7IU2oxVNgGdvtpCk89vyyThbXY88ujFnZZj5rUNEYiYneSzol6GKxZ
         7KUv6pGp/CsFJbcMlOEb0TfZPbX8bjm2hxX8+at4MRlyXGt2tEH5FUEN3dAZtmUcIODs
         ByOH6o0/GWkS8kZfvnQcVOhlmUoAEHoQp73i3IsQZqU8ihzkMJxAGC6cZEMyS2uOQE5e
         mGKg==
X-Gm-Message-State: ABy/qLaBhp7hs1129T2QmDZ2tGOzLvxF5joRW65T941gRd1qZEGm+C/F
	avnw1YNvnaA5QkB3S8svimGfdQ==
X-Google-Smtp-Source: APBJJlFbT3djjGa3AhGETEN9Ly5DOGsyt62WPoYE4syhoesTaxfMJ77VjnntAWiN77OHXldGylrOGA==
X-Received: by 2002:a05:6a20:7355:b0:116:d935:f742 with SMTP id v21-20020a056a20735500b00116d935f742mr16115776pzc.20.1690966007186;
        Wed, 02 Aug 2023 01:46:47 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:46:46 -0700 (PDT)
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
Subject: [PATCH v2 01/24] contrib/plugins: Use GRWLock in execlog
Date: Wed,  2 Aug 2023 17:45:49 +0900
Message-ID: <20230802084614.23619-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vJyKaOD0dWpo

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
