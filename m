Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp838966ejs;
        Wed, 16 Aug 2023 22:30:55 -0700 (PDT)
X-Received: by 2002:a05:6300:8089:b0:135:293b:9b14 with SMTP id ap9-20020a056300808900b00135293b9b14mr4648327pzc.55.1692250255136;
        Wed, 16 Aug 2023 22:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692250255; cv=none;
        d=google.com; s=arc-20160816;
        b=axR9wj3y10MOnZHJFZFOaJ1XiKwlUTDN8PNky3iDU9M8+uxOQZLAgL1BWlfDzftNvc
         6P9Vyi1bo3F31JkNDr/CqvddRxQ0fS3TzgP6Gjmc75GAah/Y8v2fjKDs6SBClpnQ48A3
         vZOOYbNAKcszAg+0RJNbG26Hamy1kNC1diToFkCvHUInsb+BBonv4+00RwN/UzF1e6nJ
         hxv+ODlXpgp3ArzQxNednstsp9a44ClloKQ0BRktJeQnhbfwfkQDH4dDOXGUBGuBEGEk
         RZsP/2CSFNvRuwqId9PIBGj55jf2GIohz6TTUXhGYCL6ERctNL7hNUMSifFyHDXrHgFc
         WHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zdUDfs8nzmH3mudBuoXaYzlsKQKqdd+Qx/2fnT/104s=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=F/iqTsW296B22yVRenxj0ct4B8eMN+7ZR/R0ubsGoO21p/a9UNXaHWrDL6kHqidHtn
         Jy8cF/sm6vddzwqEMCrc29bc4QAWzgDpEr4g2IJi2lpUr+ZJjcm/R4OyueDcYEPGVms7
         y0Nk8BHnmijj6kGsxP1YnAeQZSxclLfi9JkXBu3Ts0fb2rBhWLvoMZFR7yhg3hkXJ7qX
         y7S0mCFw/3+ACK9w3lkRzdkQVpmHi884sUfeRmZZiDYQ8RBcATzsdeSr3PXvxG5XXzVX
         9znNWOa6MxadN6YAhwafrEZ+4+PDT3HrCWXBKtqbjwQ6SGyxAq287RMw9dqs8I2Jb5Cs
         /Ofw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=wCoxPlLo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z7-20020aa79907000000b006875df24b6dsor12891793pff.12.2023.08.16.22.30.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 22:30:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=wCoxPlLo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692250254; x=1692855054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdUDfs8nzmH3mudBuoXaYzlsKQKqdd+Qx/2fnT/104s=;
        b=wCoxPlLo4fJNyJLo2YPAC93pw7yDAGHN3pA4MPGN6WYPvKD2HnfilAuE3YUgmIBIm6
         5lFr2VNyCJMV2VjfTAxQ7Du1RQOp5y/PbkiuW33/TjkO4eGZ5qsaCdOfw4sIOHslHYrs
         IWX0SB8UtnoFnDbzYKFZKtoDYF6Jfv3fjTF68ioItR6MbFGx4y3V+szdf/GmGdrBQxmW
         6CKJnk0s+dA2FGE/7YgS7IZ9dnx2GIVU5aS6YTqVFUCHv6zfyr2ccgvNbRwiGLtRH+dn
         xH2rx6R9AET1rCxyvlCipckj/EK2A8YKQD0PAI89QSRnqxrhI7lMvwkqgMpdSQIS1PqG
         4+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692250254; x=1692855054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdUDfs8nzmH3mudBuoXaYzlsKQKqdd+Qx/2fnT/104s=;
        b=IKdmbPruJL9mzOHWnk9L1Qr00UWUvDTVc58KbOgBfDj0+7C/PIqE1NpZq7z7kvefae
         qujntOXW+3cICpwydisW5JuhKUzNDqnboAVXII5jMnFoEdqOk3kbNqfW3cM1qsEPJAQG
         kavL1tVZyW74n2Or2+dqHc/psTObn5CXh9kDC5rnIYWLnTLG2LmwxpNCpyYiXBieFb9h
         lJuTRECKpgZ9TTksQMetfWUO2aa0jw4/jwEGU3WtIVQ/vAa/h33AWDVOx2n14QWIWIR4
         1BhKbGVfTnfKB5xvm7fwHZn3XJFxGFQDZAw69s59BCCMK8CODBIVsg8aq0c39XWwBIxe
         lhXw==
X-Gm-Message-State: AOJu0YyEXkkHxV02Sld4wcvDr23DkCJA2cGpbQ69AMeC12n9SMRvfCE1
	Bls7EDZjyguTRbf9/K91pwW1lQ==
X-Google-Smtp-Source: AGHT+IH8ewMLpNbX7Glbea2MHyvU0ftrKKP3DE6+d+QyTno7miAfioylqSHTEcBwUZtErBg46+0BBA==
X-Received: by 2002:a05:6a00:3988:b0:686:24e1:d12e with SMTP id fi8-20020a056a00398800b0068624e1d12emr4202571pfb.30.1692250254546;
        Wed, 16 Aug 2023 22:30:54 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j18-20020aa783d2000000b00662610cf7a8sm12339407pfn.172.2023.08.16.22.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 22:30:54 -0700 (PDT)
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
Subject: [PATCH v5 01/26] contrib/plugins: Use GRWLock in execlog
Date: Thu, 17 Aug 2023 14:29:48 +0900
Message-ID: <20230817053017.24207-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817053017.24207-1-akihiko.odaki@daynix.com>
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZTopLQ66jqro

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
index 7129d526f8..82dc2f584e 100644
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
+    g_rw_lock_writer_lock(&expand_array_lock);
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
