Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026505ejb;
        Mon, 31 Jul 2023 01:47:44 -0700 (PDT)
X-Received: by 2002:a05:6358:9308:b0:134:e422:c500 with SMTP id x8-20020a056358930800b00134e422c500mr5276455rwa.27.1690793264149;
        Mon, 31 Jul 2023 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793264; cv=none;
        d=google.com; s=arc-20160816;
        b=FdhsRByEJvEW4TGTTiL+OFiicLFwwj+MeYqK6EWE5PRgO2XLq2V96t6IDQGg95OEys
         e3xjqjIkwO3kEGVi4ytaIJBNVxSMWSsIPki4/PUVzGSVN/ywLolzgQsJPeYmpuQEMPOG
         N9en6F2PYAUVBMN7E0MWb09GYBMJBBnAuhb/kBEAKkl1HMr6fLjGTGvmXuDCK82K0W4F
         A9nz+ZVpc5w7gPWUyhuybyt8iek2esbBJo9tEJUhunG8H2On0HibK2jUMfZbmbYiXikh
         dyihRVmuQ3biWnY72FEsSp4LPqHvE0w0LYKqbCZF5jcc5ZYM2J9ewq3nvpPYkgPVQuXg
         6Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=nkJSGEwTVUPaOZOsHfqLRb7TCRCMZUxl3gH2OUWSg3iLxgN2eGVHWVTjAk35JjhA3C
         KZXYEqFg/U6VT/rB+jyM81VD+xFMTFveNUCTzcE8VWVxdLmKf7FL1IATEuZC7voKCOpS
         epnVsVyD4MWPlxg9ylH4UBbSuh+8djs8bZPaqQqVOCpfy8j5eFVEbOtsZgqze+klTYOr
         LiW8zE4Xv7uxB/R1+ELWNEKKkTsQ4JpaYwbceFHC6pl5iOorbWqDOJFVi2SV+KR9O9PQ
         OZur5EvPbSgXkuYjEZLP9dPXMCv0UP55mmeFugUmK/8okGLh4SF+++wgBzTYQk+07UTz
         sa9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=y7u6jP89;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z64-20020a633343000000b005642a79ae82sor1220143pgz.10.2023.07.31.01.47.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:47:44 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=y7u6jP89;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793263; x=1691398063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=y7u6jP89IRQwFYemyUCc7xG0gnAOc6UdmwLMYKHPqhVV64B/3hHVL4MPPDtz7wqlA7
         10yZVU9H/4k+HA54IqVn54qBfdzJZBgZDG5Q/xylLQlBEQ067qih3SvSuJYzKTvcJmjc
         mrxi2zEuDLRUQdx80/tkyCb3ED+1QiEZws52SCZBk3yaVyIh5T5NQ5bhTTEAlGyGOrf3
         SGfvTJF9Cc5V3n7kDlhmbTcHZ1oApB3rUp6rNP919WOivk9EBpEDr9HJlAfw+sYJk0gm
         PDRE4rN7kgwMyNEgJFvdeJUd1lyD/ncCVmGusDXssoXlqcBDaRtCpwHb6+7lOCRKVef5
         hdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793263; x=1691398063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=Hq658cV94vtdgy5iIjw0Khfw5Xb/KtMI9SLEP6O0M8PISt9RdedmSRYqDOyLdWdBG/
         siSQKw9S0Rr5Sa9UFCwJHcgHqgKjzMcPs9Rk2GBqSUy0xXjOQvwHKvhS9HlAux5UuSBb
         OBGMEDzfnr4iCipFNAKUXQschKequkDZmEWOM6+54zx9WeChWXtTNrMCZsDluKBf81jn
         +ZjDYuTmi5G99xvUAtuQ1uWLyshcqbNJgrwTELNGmlHDIS+WJDYDfqbkhTWesf7EgP2c
         8WU+bsitrWLbhk3tT1gwet3GamLxMlSVQ0vRRxgQabhB1doNgb6eNhIHimSp5FN7iMcn
         yxUA==
X-Gm-Message-State: ABy/qLa3vh4V0WzJbmh0aoICtn8aXpgXtualXlIUhgPp3+uMgo5ijbmZ
	GioPfsNiyZF0v8Ut+g2oVKufRw==
X-Google-Smtp-Source: APBJJlEaUUZeLz9nI9U553gFiXbqNs1uGKfoHWk0vvfK5zSNsIuJ4De3cguOxUIvGNrmixpzNVrxxA==
X-Received: by 2002:a05:6a20:8e2a:b0:137:4bff:7c92 with SMTP id y42-20020a056a208e2a00b001374bff7c92mr9475935pzj.0.1690793263643;
        Mon, 31 Jul 2023 01:47:43 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:47:43 -0700 (PDT)
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
Subject: [RFC PATCH 23/24] plugins: Support C++
Date: Mon, 31 Jul 2023 17:43:50 +0900
Message-ID: <20230731084354.115015-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Bpjt6dhvcfbp

Make qemu-plugin.h consumable for C++ platform.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/qemu/qemu-plugin.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 214b12bfd6..8637e3d8cf 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -16,6 +16,8 @@
 #include <stdbool.h>
 #include <stddef.h>
 
+G_BEGIN_DECLS
+
 /*
  * For best performance, build the plugin with -fvisibility=hidden so that
  * QEMU_PLUGIN_LOCAL is implicit. Then, just mark qemu_plugin_install with
@@ -723,4 +725,6 @@ qemu_plugin_get_register_files(unsigned int vcpu_index, int *size);
  */
 int qemu_plugin_read_register(GByteArray *buf, int reg);
 
+G_END_DECLS
+
 #endif /* QEMU_QEMU_PLUGIN_H */
-- 
2.41.0
