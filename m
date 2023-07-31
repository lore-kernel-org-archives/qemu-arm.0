Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025101ejb;
        Mon, 31 Jul 2023 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:137:c971:6a0c with SMTP id p31-20020a056a206a1f00b00137c9716a0cmr9150527pzk.31.1690793063539;
        Mon, 31 Jul 2023 01:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793063; cv=none;
        d=google.com; s=arc-20160816;
        b=Viqa3E5mr4Kx7N6z/cVcvd5eQBPEMYi9DghqW9y3feHU0IxS8YP25Ko+I0p5lIKtjK
         r939ydNPBnVK4D+L620aUTXCt+826tHmffPLQzOnMJjUwsBxxGm/Oy8/deg4x0WSujU0
         /akMFlAnZQx+hQ0Kg+0AvdA3bXpHzDTcj7llkvue7eQ6GprKlJ2z3GSjP4UaHTGauB9b
         gV9fafBWu4F4gMp44QUOs4CgaQPfc/354JMHvnEmw7PDtiepQDPGreGOTzs8NdFx7bpX
         lWvVwJc6AV3yJAtm+YRulCmhp414bqRf8yWKATf9Z1GFN1yE78BkUGoNB0UehhvKEFjx
         1tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rv8ecp5MNNYaYzflXkXYlG6pC6Fau5qFV5g6norDKWY=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=pP9b4+K6AtA+dfnwrsXgSOQjV08L2XZbfd7CDJOeuvetwTzvVwjOAh3d+vWEs+i7jd
         iITQN+v0PFshfDXFsFcFHGnQF0RmdLKZ5q94vKUXgPiPE4xSxOEc3hjeZzyIuTUrFfQh
         sLC1ZOOBfHdWArkssbF4cJw07Cy7YDa1Q0M8J+QOAdSwAtBFRpZoYMX+VyyEOvE27UTR
         z3LKrlcvuORVFF7mpIpSpthaC0cIYVy5LZLIcQT6dAtHREnvKdYVvc3UAv76jzdt1pW/
         qXJ/M3efifxdU4Mqmw/CVdrz+WLUf2/l6DctdmVYwItXna9ahsln0t6AOV7xy1FZIC+m
         Fvqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=PZDp+BBA;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bf3-20020a056a000d8300b006821133916csor3324057pfb.6.2023.07.31.01.44.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:44:23 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=PZDp+BBA;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793063; x=1691397863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv8ecp5MNNYaYzflXkXYlG6pC6Fau5qFV5g6norDKWY=;
        b=PZDp+BBAvc0KSB56DsQmUvjKSFua+VZ9zJv0Qx2cAelbx6oWm2A0BCqnTznDCYOsGT
         9C/ylIUMVvvzeIZPr6sUP2C5NV7YBwxDzj0GMLnazLIdJWgEv+zt1Amv29lD1aGuK/io
         tLXNLpawYWT5S2pS2V0ngHDeqkjhqHr6WUd3TXkSg8jsX2VItf1/yPkZwJALZ2T54ZX0
         1DfHgW94Ua/0Msj3wxgIeAW9i8Wr0Ks7WlQavTsyENI2dm5luHnIlNv7CpHebGGWoCHz
         PhY6U71DsRup2LP0zN7VAoz+34qvXpMw7DAh4zvlZXGVb0Rgz1uf1XnarZOmdA3Qt11m
         PP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793063; x=1691397863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv8ecp5MNNYaYzflXkXYlG6pC6Fau5qFV5g6norDKWY=;
        b=QVdgAkgyYYtW/JmitjpdhASrM3Yzj6dAdK/7lDnSqsE+DvetiMdyiC/67u6FlUByAa
         wDTPFUTqW+GVS2BuJTRUL/iCUMB8eKbFbdX7JKh8pYUvgPxtCm8iNWLvBzCSg0UU/5sz
         I3lZ+p1osdv3R2Q7I778pqnrGFxw3SgUci8twHCTJQkR/euGI+EYwv+X0kaNb4A6B4JR
         gLb6uqZ5OGyZVv6O2tRBB1MsUhyyZTe9ymzKROkxEj7I0thLly8c/52n7sZvROTlDebD
         NrCqJW8egPKPWwxZF6nJRZw5y0F8Xv3mIv0lvYdcls3SpHwxhf/69Cqicp2GaTM0J08L
         7CVg==
X-Gm-Message-State: ABy/qLZllLSkm3euFTPW/QwrevxkAAYTPC0zshevaiArGazvJc8AakLM
	ep0FmWf98VFPpL1kLbSDjJmtyw==
X-Google-Smtp-Source: APBJJlGS/uBh757PghIh1LcVXhYRgj49gAZ0Q+WNPNFD5s7fgIOIJxRogywBE58O/HDzE59o2ynz1A==
X-Received: by 2002:a05:6a20:160b:b0:133:bf18:ef7b with SMTP id l11-20020a056a20160b00b00133bf18ef7bmr10943503pzj.24.1690793063098;
        Mon, 31 Jul 2023 01:44:23 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:44:22 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 01/24] contrib/plugins: Use GRWLock in execlog
Date: Mon, 31 Jul 2023 17:43:28 +0900
Message-ID: <20230731084354.115015-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6ZQB329pVsGq

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
