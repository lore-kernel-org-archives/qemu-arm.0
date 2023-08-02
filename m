Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp207061ejb;
        Wed, 2 Aug 2023 01:49:38 -0700 (PDT)
X-Received: by 2002:a05:6808:f88:b0:398:5d57:3d08 with SMTP id o8-20020a0568080f8800b003985d573d08mr18921319oiw.37.1690966178427;
        Wed, 02 Aug 2023 01:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966178; cv=none;
        d=google.com; s=arc-20160816;
        b=t4glNU1hDpjG4Bn9PzpiBtWK71jetScLS44b5y1/EQp6mfGrxy7uP58YOA7yrZX/zu
         Lwva2KzCLlnz3iYqYkoCVu4cruj5mio0UuVwAvfemYBCB8bwVSLJTboEA/cFpuYq4MAu
         GdO93HAPKOLXs6WRmXJUaj4YiFzBE/IbrTAv42PLBqsF4ier3LX7/6o66amJ8PXd2fwZ
         8zk6qlDnJhjWzxkPm+lTD3k3AZ9PEHzKkprDZDMnDD/27FzXKi8KxruFBiPTH2LpoYj4
         qqzwXyZHTPBGVr34H4ZJh7Zzw5kUxVu1rwRZf+O5bb2+M64SBk+NGYxC6KtQlBZ6yQeM
         BbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+UF5S4BAA/eK+ZwqrbbvWnZLqcwv53M7+DITdN+nup4=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=x9KjohTS1oHMB/vLlJ2jd5Hi57Q5WgwFmVlltFy+ouETg00X6a7C5gzuSOWY7V+F50
         9pEDMJO4h9ViMuCpZZSWXIH00EpdHgM7w2nap1jgrsfNElSA6hqG5nAlAhLwRst7+ImN
         JXC8+RBDkqfta3nOKbgIRvtSLHtw6yF3mJKFGLfbKxgs+vLQr4geBb3Hhz8o35H2DYWg
         HyKik6E7CvS7fGc1q826q05jNXWCVX4YVcgZ7BX103AJmlXuN467cr192SGOQVuvpusX
         hSK87Zz7Ie4Mxwb4h3XEa8gOwS3nOmWu1VrEvKebtMf5ZT8i1PPlMiyDMlqad8WsPmID
         37sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=YYYPirH2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u6-20020a056808000600b003a710e8fbc8sor8728550oic.12.2023.08.02.01.49.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:49:38 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=YYYPirH2;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966178; x=1691570978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UF5S4BAA/eK+ZwqrbbvWnZLqcwv53M7+DITdN+nup4=;
        b=YYYPirH24uWg7w/+2GQEt8PnEr6ndcrCwToWcTIylCL9ZOFMATdIBokhxiHySCpdnN
         u4FKHg02k6fsXM1xvYzyW9kPI4tS8AXV0dw8h37LBZnNzZ5EeHBoIf3YMdXFBcaTMS6r
         tgikHOvTAQFlc52x/SL3B3Ls6SHknMjm9wSkrvJS2oX51+lXJtOMzZ1sAyR92LpSac9a
         wXyh5Bj+rvYyHHW2sH7ZzsrT8gvzb066JznuyiSRGkzFz6WcJDkzgEtGkWEjuv74MTO5
         IVFJGu9tP6PjsjmuQPAtqGmZIPJ7zO7MtZHaOI3D8TzyqYEQLgdmfiVf3W3U217k4US9
         qS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966178; x=1691570978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UF5S4BAA/eK+ZwqrbbvWnZLqcwv53M7+DITdN+nup4=;
        b=lE0HqecaPv0fI5ynRm1uJrJ/0zWMEtqZYg1aHFyUe7nz7Chneh+GRFUf3XP1aB7BBS
         o5Y2sU8UXoNZFib+s5kjNtragXeKPxNPCDfEzT2Tg/FXZTOJEfM2AamrEHIjwiHYthUK
         u3AMhdCtL7DCd3twJ389Oto+ScDJ0uk0ypHNZTkY3bn7m9LHWePfN3wF9Kz0XsTf0pyW
         0tgVDBIhR+FTi5+aNbSKQuBRkHWGMcB3qYBXthjnsgk0txIXuef2IiC7hrQe8ISN9pAP
         2mDWUTjs6RJF6ouWzK/Zl64C9GXpO0Qk00l3YBmd17/mmsqTLir0HV2RLQ1LAYTlTQSG
         wj1Q==
X-Gm-Message-State: ABy/qLZcG5cVpxJfIJmEc/tAF9dG5gXBIAWU5Hk7A9BuncIsJ8I/B4ET
	tfz8niXUKYlcg8tCEWoWDmLdRw==
X-Google-Smtp-Source: APBJJlFrQBDzH2I3mg74KwFQ0Q8QnXZRyBTfiWFR68SVT7RXFCg1IlIPcfLorCZvXM+RBFRLS3jDnQ==
X-Received: by 2002:a05:6808:148e:b0:3a3:613b:2787 with SMTP id e14-20020a056808148e00b003a3613b2787mr19582390oiw.32.1690966177903;
        Wed, 02 Aug 2023 01:49:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:49:37 -0700 (PDT)
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
Subject: [PATCH v2 19/24] gdbstub: Hide gdb_has_xml
Date: Wed,  2 Aug 2023 17:46:07 +0900
Message-ID: <20230802084614.23619-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: I6xRLhJhjT3d

gdb_has_xml is no longer referenced by the other components.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/internals.h    | 8 ++++++++
 include/exec/gdbstub.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index f2b46cce41..92f5ce8cbb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -234,4 +234,12 @@ void gdb_breakpoint_remove_all(CPUState *cs);
 int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
                                uint8_t *buf, int len, bool is_write);
 
+/**
+ * gdb_has_xml:
+ * This is an ugly hack to cope with both new and old gdb.
+ * If gdb sends qXfer:features:read then assume we're talking to a newish
+ * gdb that understands target descriptions.
+ */
+extern bool gdb_has_xml;
+
 #endif /* GDBSTUB_INTERNALS_H */
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index da4b9173a9..aafbea78ab 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -40,14 +40,6 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
 void gdb_set_stop_cpu(CPUState *cpu);
 
-/**
- * gdb_has_xml:
- * This is an ugly hack to cope with both new and old gdb.
- * If gdb sends qXfer:features:read then assume we're talking to a newish
- * gdb that understands target descriptions.
- */
-extern bool gdb_has_xml;
-
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
 extern const GDBFeature gdb_static_features[];
 
-- 
2.41.0
