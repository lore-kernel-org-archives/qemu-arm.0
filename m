Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp412641ejs;
        Wed, 16 Aug 2023 07:52:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:1053:b0:12f:bc36:4c67 with SMTP id gt19-20020a056a20105300b0012fbc364c67mr2290574pzc.61.1692197546830;
        Wed, 16 Aug 2023 07:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197546; cv=none;
        d=google.com; s=arc-20160816;
        b=Ci6OnoDM+Hw3x79OrlXQaxwEi/H3JChdVI8RnF+vh69MdwPUTyVe9ecbaQtlfxcxnx
         lA+RWeZCZcU4uaLi6+HxA5ewtD9giwuVJ/tfpKLtw+kdsMRZ4XpVM++SDrjvtYhTMoHR
         0EfBIEfI1Ji58VvUgjLor7Xvoytkzg9EQT0NoeJOMAZR4zioHIE8XcCJgvtHjbSbMpMD
         qn/BOb8JyHr3vK8A4/LBGTd+mDgQa/qPSJ47UFpWFVUoTAqBOm1L44QLkzsZdavqv1r2
         gp1bAZlhY6TtHPC5DKnAZDftHz7TkEaT/u+bE7pBeM0DSjYKXv4jKGTBQBGAjF8gZbsC
         +oRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nZll0H6CXaAKys7cBNNrlAZQAX9ewDlJMrzDsStORGc=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=oDyXviygd2W5O5asFDbUdodKDswP9EoeFYpgMYEuVTRRxXBGXVYvq88Kemzn1NNkFG
         joXPwlYb6HxaHj3ylLr1bi/i3TSNkQdYXOdkHS9EdD3yZXP3PuTkeb6hZbV8hj3G+8/1
         dtZhQp7wzRcWA1O0W0npbU/OmEOlJGwzK+NbhjlMsy+51p8/R4Tsgw8oLhVxAKJooawb
         LobhEQ6Jq//fGa+ItFCHdR/KxNowelK52qzc/8v53j8qu5EFpicL11lSltaADvAA4MSI
         FJhPPVkbONeCS/H+yOt+6CcGAib4ALWbGfAFnLkKMv3ZspOdU2Xf/B3OIJxxxNhxUrqW
         arvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=IS98RPSo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i20-20020aa796f4000000b0068741a6f4b9sor11925770pfq.5.2023.08.16.07.52.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:52:26 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=IS98RPSo;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197546; x=1692802346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZll0H6CXaAKys7cBNNrlAZQAX9ewDlJMrzDsStORGc=;
        b=IS98RPSoM3bHM532wB3kGFtMQpyITAnx71ZNLFCE00bUEp/cSqOVhZ1K0iA5kpihq6
         BRLl2OXfqX34J2J2L2cfhhPuHdiPtzE0pMl77seizCPTDrduCZc5IGAliHm4cIAN758F
         sFUPNr4oDH5YHSqKjOH4VlyvNm8MAorVsGECwc3Q7HLkGmeWJWX2mV4IcqbNmKDfGJT9
         WoO7X0hH2DLxMNn8lj3jzOz3Fn1ZijU8o0LXT7V7w8TwQ2fOJ2S1Ij/ZY07bdTyREdMb
         KF/9+vHP9w/LU8V7D8rUYw8p9YphgfDHAiJwSE68BRzJ+TJzDWoCrgFT+FPO15FtI9af
         3MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197546; x=1692802346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZll0H6CXaAKys7cBNNrlAZQAX9ewDlJMrzDsStORGc=;
        b=Mo/+Lee4O2iMGw7Lwn+CpkraN+pYPdrqh1XHj+qeCkYLQsZvfyIghmIvp10VF4KTZL
         KaW+7SxalJ31fDP9c5S68NzJRhcOP3N+lw+FNsmPTGwbaUtMI5CHgCqJfmZfhL3Rvj5L
         Ft6rbmxs7aCGAoRAKzt/27O8SQH/s0+aDTNlqqTJmhwHVGGAATSVxQBVtfG89QhdS1rj
         XP5npkWRQQHWhqe9wg0JQ7X3H8MXmF9/PyoG8HeSfVMc78a3wSuiokxEwxfgXrVMBlSM
         XLMtnTqwRAWgwLinpFIvodIEkvZrTuTJigiYGBVx4OZPP0t+f/+8JPSzyb0Vz7JvNOpN
         Abnw==
X-Gm-Message-State: AOJu0YwTHiXboTqKYwhuVTeLEhMfUgFqWZhF0vBzFAzInI8MdgjfLLg1
	l6IVvCcQfbe3Qjt+2BtKnzfydQ==
X-Google-Smtp-Source: AGHT+IGvqTVlRSSkvBFQxZQ6Oytspddpo1IsISOp9PrJWZtteCsFnXnUM/ejoMkcxYQmUWq95f9M6g==
X-Received: by 2002:a05:6a20:5485:b0:133:be9d:a9e6 with SMTP id i5-20020a056a20548500b00133be9da9e6mr3463895pzk.17.1692197546383;
        Wed, 16 Aug 2023 07:52:26 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:52:26 -0700 (PDT)
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
Subject: [PATCH v4 01/25] contrib/plugins: Use GRWLock in execlog
Date: Wed, 16 Aug 2023 23:51:22 +0900
Message-ID: <20230816145155.21049-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YO+l3jBZWq0G

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
