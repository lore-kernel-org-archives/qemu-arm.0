Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp412964ejs;
        Wed, 16 Aug 2023 07:52:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:3e14:b0:13f:aa86:804d with SMTP id bk20-20020a056a213e1400b0013faa86804dmr2469422pzc.35.1692197575130;
        Wed, 16 Aug 2023 07:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197575; cv=none;
        d=google.com; s=arc-20160816;
        b=uNaLr6LkmMzFmT3Qvunxr7C7XPQ6YmGfLu6TE8ewVlbOn+rs/T+u2V1W++xqBndjty
         4wpJ7huU9THUpRNXVfrXJXCQ9weCU3qbaUcc1GKvifOIOrUIT2F/S4NxC7/1UGfWlSRR
         E83UgWVT7u5odcMMJGS8YzwUWTjcfVMEPD/bG8rJ+i/XKRAMZ9cEkIsOsbQIb3xxCGPz
         xwtfQPo35TY0bDxpSmzfJMnBeG3+7pEHXEpp1E48mmzytv1soRCks66pPDxysl8+Rnuq
         ZG60zzqRnmOu0jkRZATMkxJvsU79oafUlJfGlhGdLMMSwYLJbU1Mg9jo5Y3T8a7T9lGo
         +50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q7pUOq6IPFvx1k2W2dQWmkO3YzfVeoPk1QwhHtWlA7g=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=Fe8V3b1qaDVO+ibgH5hmM6c3wb69OEgDClfBwXP8Nep+JsPQw7htrT4fWgdZnRK5xO
         QlQE2p9SzdSu1HBNgfMJAJWid3mjrylK8QKgo7zkBOk1x2nLYsene8mdiv+dPWMdOTcT
         mZG0o0KIxwiLVCHMuVx7D9I06JdH1t6V6bJbKFP/naC2nfVptrkxTyzTGmofj3/n9uHc
         AFeqnGkc1UuTBBOpbMWX5+5dA+OPtGNd03ONh7/O6GmxfY2I4SfV3w+CNkqhffs/DbiN
         5MxHKrQB3+h9pIRnOFx9zWZnSXf1KWrb0oNrqFIjOPDvGN2pLhgOiunxhw8vskI1+pSO
         7B4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=g5gIZwU6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11-20020a63920b000000b0055fe7611916sor8675033pgd.6.2023.08.16.07.52.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:52:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=g5gIZwU6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197574; x=1692802374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7pUOq6IPFvx1k2W2dQWmkO3YzfVeoPk1QwhHtWlA7g=;
        b=g5gIZwU6UwCQWXPmS+5P+fF94QVoM6wZggI9uprZGCRsS1BeWizVJSq8VgrcyPkZWR
         NzvKlI6AbZ5z+3le5KoHsQW2K3sj8c0aKS0Nt2OtoaXrzRKP+z4hYZrmAuV75LEL+qIw
         LottnaIjQ619Drz1cIfpkQdwU/81eIMB+EFtoakoHrNWL+hO4HvT3rGI8SQgYL1WUBgR
         V1EX8uuhVeP4AbBOINNBnrwIA15Jz0BUrm7YgvpoLkmZLmhkJZvLmLmuI7grNPIT0+9z
         81SysbcziYUVKsAVk3RFbuyMpdH6PRMMeUBelM/DWJpuPn1xNssTHairK4nLGH4N28tG
         ynlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197574; x=1692802374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7pUOq6IPFvx1k2W2dQWmkO3YzfVeoPk1QwhHtWlA7g=;
        b=eVxBRCc8i4XceluilKDPKRDghF0H+3Hvp6FrIn/L7M73clubPIhYvsAX0AiLwKUQpu
         k6ol/I1TK9Ewz1ThL9TzVRgc2GgLNq39W6qGLNfMV9HjFYY098VGprHit7Vbe69yplYz
         wSOZ7II/V+SCkUdjfsVEwlqwamtNZJBUbxUT9EZVkuZZpzbjZgZqkkVZDpMYkmcQeezu
         biwpW4cHLlgLS7ePcNIIjeR9azyeGYTaRLli017u+Mh5kZhuyqrKm4KtICytN3utwTqB
         q1OTd+s69jCZFBwOABqgocMKZwCDgYsCtDeNxHH7KXFpqS2j0L1t+pbIs3xCNqvdvw2M
         KARA==
X-Gm-Message-State: AOJu0YzcuYOb0bousJKUsu5LH0vG8xHYKNA0TDrmTXGY/Bi/892Z4EF4
	uIp+dJKPlPrg3GhSb5J5uPPjLg==
X-Google-Smtp-Source: AGHT+IELSulh/oz6ixtFLkZnD+ZZTF7a4OEbk5wN+eGCSB625pWQA9nU9mWM2B5J89v0SG1HND+jRA==
X-Received: by 2002:a05:6a20:7da4:b0:133:6816:c889 with SMTP id v36-20020a056a207da400b001336816c889mr2729018pzj.40.1692197574627;
        Wed, 16 Aug 2023 07:52:54 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:52:54 -0700 (PDT)
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
Subject: [PATCH v4 04/25] gdbstub: Introduce gdb_find_static_feature()
Date: Wed, 16 Aug 2023 23:51:25 +0900
Message-ID: <20230816145155.21049-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wFweDFMVhrWu

This function is useful to determine the number of registers exposed to
GDB from the XML name.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h |  2 ++
 gdbstub/gdbstub.c      | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 9b484d7eef..d0dcc99ed4 100644
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
index 2772f07bbe..5829e82073 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -414,6 +414,19 @@ static const char *get_feature_xml(const char *p, const char **newp,
     return name ? gdb_static_features[i].xml : NULL;
 }
 
+const GDBFeature *gdb_find_static_feature(const char *xmlname)
+{
+    const GDBFeature *feature;
+
+    for (feature = gdb_static_features; feature->xmlname; feature++) {
+        if (!strcmp(feature->xmlname, xmlname)) {
+            return feature;
+        }
+    }
+
+    abort();
+}
+
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.41.0
