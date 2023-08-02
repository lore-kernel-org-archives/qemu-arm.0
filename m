Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206078ejb;
        Wed, 2 Aug 2023 01:47:15 -0700 (PDT)
X-Received: by 2002:a05:6808:114f:b0:3a7:5e46:484d with SMTP id u15-20020a056808114f00b003a75e46484dmr293167oiu.57.1690966035739;
        Wed, 02 Aug 2023 01:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966035; cv=none;
        d=google.com; s=arc-20160816;
        b=s/tXgcJlqceOWeEUF687mmvB4RR2kUWjYVdXHE/q8/Zw9l+qNlLkj8TCuh/BEL2PAt
         Ll7eYH3ti32CIx6RGei7EiWCoj2xq68DfHaDYngHzUmMOfWn5PTVZ1ZsE6kP3UVwy7Kk
         KVtBNwlaRgFQYwG+osHmGj9fXB3MdFsUNTGxvNTIpBd6x/g2sJFiGmj+E1GRBnFMrEKt
         NkNtqntk5WcC81FA7CD6y6rH3R3Gl3EdXHRU8r1cPsYPyhPhPQKWGM3oDmmRmZ78XMpP
         WWFpKjeT7gXKhRXZ6d9ws+pLEocoitfvBxO1ozpeQ3djGAnmL0Ct7uytvQPV6fPgBhV/
         WwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FznljfH/+zYGuRietSNCgMOr89IrbQo5GMLU/BnGdrE=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=yaG2Y1LBDooi5HMM/apthsfa51GzGJiv1jIFZZt6AsHhZTVH9+uAWlEVCddsTlsG++
         vNUxAcmS80UEQZ0If628lZ2B0hIWiqtgPd9BBnOKSX9HMyQQnWqRalkOFGCYqX30udv+
         h+ROAS9zaloc/+ie5yhBIiBgVzwIjMMJUSlPlwH7VGFLIA/bUuPW/Y9Ky3v2LH0MFz4p
         a/8FkyAk3O3TEv6CPiBDwNueGFSpCBQ0dnLKIt+3mckETDFqY/3Y+AK181ghxoHq3yx1
         OUqUVaIbsGE8zgPgtylq6e6Pi17K24ZpDJOt6VlSt/jVX4uBKZSxPFLIzNfCAVjK+4iv
         cL6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=0xZJvJvs;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u42-20020a056808152a00b003a43a5c35d8sor15858511oiw.10.2023.08.02.01.47.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:47:15 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=0xZJvJvs;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966035; x=1691570835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FznljfH/+zYGuRietSNCgMOr89IrbQo5GMLU/BnGdrE=;
        b=0xZJvJvsA2joPzm67xxpk70vUtVP652nx7gZn9vSjD7ZCv1vG7IcGlIXp25iUO0zQD
         RTXNirSsSK9ekJ1S8009vhSlO1iN+D0xXrB78byq7rAHpkMfoQC083ARr2VnJIWzl9+w
         lK/uicf8YHrkagejO2WJjAvchXjBkGqnRW/Jv3cYmzPov8/zio88wPFUQ05HjIV2BCUu
         EMLLopps07g67H7nXg3OVRGsQmy7Gc7smYvzV0mw5w4yrZ8MP1jupTnyU5oivN+5HbSE
         cxWTKCtzq7Dv4uY7HzboXm0/e8yFnFTMcZ1k7JIYQrXVM/OQ7zwmqMiW+UH/YDcNA6rT
         05gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966035; x=1691570835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FznljfH/+zYGuRietSNCgMOr89IrbQo5GMLU/BnGdrE=;
        b=JCO66j2G9gDrFCQIqaNMiLf2u6EEUgCbeKuIlcfRAzpip9IGfHzH3UKURkgIY13Zhe
         rq9Ko80YJLfhhCGgrPNCBOib1Sy5i6+sQgKfUJ8kOHxMieVzT1Or/4NYPSNwfS72btmr
         VLl05jar0uJUGIHzO6qc+L2Htszm/gv0udOsFxqFzwVMkLDArfoLshQA3HfV6laHiCeu
         aU09Pv39Y6XdpGj8kJ/rOCyQdVnmCKsXW+7T4aKd/PxNo060nuaKir7O4NjeD2NBIwpR
         IIefLBqGGBjvbom/9Cxc0Yu6w2hhWx3RYFP6urITUKuYPASgcgSTuNR5VIxkHR/Zzvkw
         uZAQ==
X-Gm-Message-State: ABy/qLYauitzePcaiC1Rj3STqu67xKI6vvabr955GcvonoQuG5SPL26S
	02wioGqa3lXEWU9N7dKUnVCqrQ==
X-Google-Smtp-Source: APBJJlEUGZXJI8Kr1i0JYa2fWmNRk4YlR7ELX33qcgUfelTxcAQEILGkknZDhw1Sb6+BnXLG1V4TZQ==
X-Received: by 2002:a05:6808:ece:b0:3a1:d1d9:d59c with SMTP id q14-20020a0568080ece00b003a1d1d9d59cmr19156761oiv.33.1690966035334;
        Wed, 02 Aug 2023 01:47:15 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:47:14 -0700 (PDT)
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
Subject: [PATCH v2 04/24] gdbstub: Introduce gdb_find_static_feature()
Date: Wed,  2 Aug 2023 17:45:52 +0900
Message-ID: <20230802084614.23619-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iXEeZ3DhGRgJ

This function is useful to determine the number of registers exposed to
GDB from the XML name.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index 2772f07bbe..48fb43a6e0 100644
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
+    return NULL;
+}
+
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.41.0
