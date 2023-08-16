Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365930ejs;
        Wed, 16 Aug 2023 06:43:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:9382:b0:13f:7e6e:ed7a with SMTP id x2-20020a056a20938200b0013f7e6eed7amr2329399pzh.50.1692193434555;
        Wed, 16 Aug 2023 06:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193434; cv=none;
        d=google.com; s=arc-20160816;
        b=ErhptIVffAFb8nxYUWlq7JvzF6m98M5YXULpDxtyKRzVROytcMxt+UyWb0352Xad0F
         +sGbue1xN3gdLSxvrbZCjSaf3D2sCqYS6STZ6M/IoK57k2ek9UEWpUvTCXzxszzQF3tM
         3Agvkol37E+YBUYgvaTrFUYCDnDvvpMp93ltL9DIZKB4d/MOFf/rdfLSyz82dooMmczR
         kx0zldhEhgBejXcz1XyhITYPLsp4iZPtYVgILObSdLtM5maB5BGHkqJlwQsBArzg2hzc
         5l60AX4SDCjVRXb5bw7T2s1Fzr/9xJ62h1lMa4x6ks/RBdE9iVq/qb4LKc5SdP/1s7KR
         l8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=AmHXv1DZLpfPvShs+c+/DYThmlopCKj7enB/TeTnvA1HBsuO+NNDE+v3Oqz1QqkMEk
         oBF0mwxCyfkOajNu1Zdt+k+Oe7sH1RtltIpaayn5EHaYaYDxuZSRTLTxr7RwsruILibN
         dk2JiIdaL/M6l4l+8Sp3JWsJYcccl7XsaTejk+U72gDHmxK/orc7zO4sSc0FvbSaSIfg
         9FG/JnfinLEBRX4srI37/BYwskBwGVN3TTs13njzBEb6EP+QIzCPWWASEKQTb2UBh/xI
         0lbYImsozq3tjDpKLxG9CqarXCfSLLlKRRUq2GCho2Raja48nGFBEEGgxDU1TEXeRJt9
         fFKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=lU0HwLHL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q6-20020a656a86000000b00553c0de36f0sor6831917pgu.10.2023.08.16.06.43.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:43:54 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=lU0HwLHL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193434; x=1692798234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=lU0HwLHLEahkhhIIrOxAKwPSL2Cvjx2wpLCco5heXqC3PNZm4os91oplWyHM22FVCK
         kEJSzHefztvho7JRs5n5oAJZ6rdhNiQTJ07rrysBU5h59y09Wly8kYNz7ZD0Zuc1KTQb
         IXQjS8WZJBtcBYs0rpEQBW47Hcg1yH0nCk4cygFktKpZtqpDn/+RBwhMGwpaM7OHs6HC
         LAljrLw+uOn2CkgJZlexM9pGYSFEGoMGIV71Pxjb1ECLcFaYq8XPWs0l9CNP/AqJNZJ+
         TExeK6McHrbC25B32KN6qi2W4wSKznZiuxqTfLzHpydnFgpX5EEk/giLBaXV3pytbqc9
         X/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193434; x=1692798234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=DCCjdTYO6nHy3UkL1Bv/nHdmfyAuM38VLx9fOwOw+QbIeWat9yyHAbobkmpUFzdDYF
         /lBZFFXp/VwyMJk2utQDLubrxt0NBDQU9ISzyX8AEVLASpiB0O6x+rMvzuJdkX4nFdqI
         iI7+Kqira921Z2auYnVdH6F0C4hkJxS+rcq0KcWDhfCoX0vME6NdN8cfZ6JuxYEEPGhB
         As3V6QloYcLsW4uGt1WgttuBK/keoOCY9YFI4DOIVh6OUzWFqIITHmlAJHwKW2l3lD0L
         NOw+yaDL+5zNtCxYUA+tfKnJtFHLYa0+vpCrnyTyceaKqFrxXQozb1vSEaK04rQkDDT9
         GZ/Q==
X-Gm-Message-State: AOJu0YxmsucRocpYl3Rl+PiH2jyyVbktjAZC9tRUSIE1rnO4KrR0H2fR
	sAotKIndEWKcxu7hk3yLlU7xdg==
X-Google-Smtp-Source: AGHT+IFQLZBLAKQEvnfK4L6F2IWDmnkcOBA0cSVcj4jC/pDXzUIC2LH4XHeYp++FOHCLZU6XibLkmg==
X-Received: by 2002:a17:90b:fcf:b0:269:7eea:d7f6 with SMTP id gd15-20020a17090b0fcf00b002697eead7f6mr1094012pjb.49.1692193434042;
        Wed, 16 Aug 2023 06:43:54 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:43:53 -0700 (PDT)
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
Subject: [PATCH v3 24/25] plugins: Support C++
Date: Wed, 16 Aug 2023 22:39:34 +0900
Message-ID: <20230816133938.18310-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mF2QWWydHK9M

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
