Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2025288ejb;
        Mon, 31 Jul 2023 01:44:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:9146:b0:12f:90d8:9755 with SMTP id x6-20020a056a20914600b0012f90d89755mr9642177pzc.15.1690793090575;
        Mon, 31 Jul 2023 01:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793090; cv=none;
        d=google.com; s=arc-20160816;
        b=BIJr+j8Y5l4pc0J5aWTKFP0oXUlI6PoIhMIhD5uLZm0rovDtjQnXAgkaHtWy1VutUG
         Gd5+36nxizxdDPN54Ai21cVCFXqBxAU2XvKpheo0gmG+GMS6b3sZf47KmPXMKxH4yH6i
         ViHY5aqrW5ACiVBfSZEot/2NPpcifAOunJHwTPJB49NnTGqr4vNrqulxKFwgHeJMylL1
         e2MhYcaYGcvuZhQMnA6+7LL6my2c9LDYTjDnhmdqXdxhedfTE6WULsjHeFIYmpxgHTcr
         0RYEciFBFIBbfBrlXK7UtOAMPrgmIu7kz0FO0D/fxzQq0Mg4RM6Y84y4fDGmm9+cqHuS
         cu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lVYJk6LGaltRcOKAehyT3A59XywRmFvsI/b8ir5GS3U=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=YYklXPlOg2wWuEkwqjSnZdFEcDlp7DiFUdDygK4YNX1veAMKlkPutRQQZWm6BwgV86
         KTCkCmMpHJS1F2HycHsEVw5bNm3i8jpFQUXzHlsOr7jsX7Rqdfhl4M2HZYd1tH9odHTF
         YPM4MTMIFGdeSYCjmRhHFSVxD78ZzD11Yfd/th3dGiz0xIQ2vjxaJcQfrUTfYuk8D5xn
         YP7owuiAVG8/+jJ8TlhCE0XuwLGiy8R33QNHeMd01pHGHU5zYQStIKyiwVrvX7Ogs2Yl
         fMByf39ybnwgKKf6UjQXTBOHjt3c2lF0sRC8ND/x0XANu4bH6fTH5bwcbTG1swpxYmKM
         LDtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=BykZvVze;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x3-20020aa79ac3000000b0066a4f04e996sor3316109pfp.6.2023.07.31.01.44.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:44:50 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=BykZvVze;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793090; x=1691397890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVYJk6LGaltRcOKAehyT3A59XywRmFvsI/b8ir5GS3U=;
        b=BykZvVzeeIyleaCsCxlBPKsXbpHaujxGxlNK2l+O+9UnfFsnXUPXjxsozBMpcZNbc/
         SE3MLTBKLLwM16qrqw8WwHliSIDdd5LAgJ6K1yAKA3v9bVjViZYWvX6oP7tKlgA5SsH9
         +FIkewHecvcmp354i417hO5iq5/TX/e0ZrNM4o5r/tvw20lNKKRftFckzsQU6VKNoggn
         j/cEOHRN3sdBUh1sNijpdVAHLL+gt4CM1OIwDSeYJfW5PsXBASliS6MDwBDjUNlbvW0+
         LOOyiPHALaISYNcfzqfBhprWMMTHIJtPVX6WDB0K/PXvr2fSl793tchbQtdG4KLNOSZN
         ONsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793090; x=1691397890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVYJk6LGaltRcOKAehyT3A59XywRmFvsI/b8ir5GS3U=;
        b=lvwkQhiMZx03JrFiw6itGlgFiOdmkLDo10co8MZ0AQmHloPpBkoGPn1D70L7OLD+Sd
         jk8k2lwOu3myNpzi0QEArtqlCmyscfjw05/v/A9znO+KcbgDG6nmaeSRkj1YUru4BIVH
         5Q8VZPAGKJQC8oxhhuEXQ4ak6AJSmhslXVa7PqS/HWYTgIgBstOqb4Evr0dM9WMCP4xY
         9uzOj8BdBWgAUzvRsFEakaPEh4gITwAKC9zJRmm3nfbcewSsOMl9u2euPGws+/A4RmwJ
         2O7FPp5uV01UFunFt5stDb4Ar9RT0/ywtfQMTwVnOefhgJ6PKd5DNLI3s6TTutGanyGj
         Iz2g==
X-Gm-Message-State: ABy/qLakYVszIT+Rb92TcSvjdiDl3B2pQtoQeJ0plalMJNBUJIHKoLCV
	craTZ9ME4VHU6zTc+jnHDkEMLg==
X-Google-Smtp-Source: APBJJlEmSkhH610IOf78Ddg7wL5Fa2C8ae2uuFOWoonLbL1asCR2tM0pEqy9UiM56ZXl46akI/Z1tQ==
X-Received: by 2002:a05:6a00:24d6:b0:686:254c:9d47 with SMTP id d22-20020a056a0024d600b00686254c9d47mr10490718pfv.30.1690793090111;
        Mon, 31 Jul 2023 01:44:50 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:44:49 -0700 (PDT)
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
Subject: [RFC PATCH 04/24] gdbstub: Introduce gdb_find_static_feature()
Date: Mon, 31 Jul 2023 17:43:31 +0900
Message-ID: <20230731084354.115015-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1VYaklnUi/Dv

This function is useful to determine the number of registers exposed to
GDB from the XML name.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h |  2 ++
 gdbstub/gdbstub.c      | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 22e5add5b1..3115dc21c0 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -34,6 +34,8 @@ void gdb_register_coprocessor(CPUState *cpu,
  */
 int gdbserver_start(const char *port_or_device);
 
+const GDBFeature *gdb_find_static_feature(const char *xmlname);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /**
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index fad70200d8..6d9cef5b95 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -414,6 +414,19 @@ static const char *get_feature_xml(const char *p, const char **newp,
     return name ? gdb_features[i].xml : NULL;
 }
 
+const GDBFeature *gdb_find_static_feature(const char *xmlname)
+{
+    const GDBFeature *feature;
+
+    for (feature = gdb_features; feature->xmlname; feature++) {
+        if (!strcmp(feature->xmlname, xmlname)) {
+            return feature;
+        }
+    }
+
+    return NULL;
+}
+
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.41.0
