Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp207365ejb;
        Wed, 2 Aug 2023 01:50:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:419:b0:134:198b:84e9 with SMTP id a25-20020a056a20041900b00134198b84e9mr11977967pza.61.1690966217904;
        Wed, 02 Aug 2023 01:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966217; cv=none;
        d=google.com; s=arc-20160816;
        b=qGh+E1Nvj8ZfsygtDFgTHX1VT7EW6v5h4ACK1eHHwbLHgTt6joRPNHRvKjzIbIqpwa
         dkXbJcmMfO61mnD6EU9O9ratF3cNeNGn3wyRFclml827oGIi3SgGWFKRarPIoysjtgUM
         tXXh1LUCQpfYT1fEvMv6p2XVLjRLAJW6mpkXeenEGjBndqF504ZzssFUgaig2vUsihZD
         lYedxZzBaiEH/I6P/tKMYxVUym2CE51hlpRNuqyPl9R/MgBGu/LfSbWSxqpOpNJN4vEJ
         MClDT/t6H4YK+aPlC621MPj7zgan8tupXy44CGLfKJWo5kfCeqBZUixkbglHmCdui2pw
         jNeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=OZt8/PZ5iWO+X3ds/eiPxatJwotO/A0txFpRp0KocM/CiSgT1aZTrTVU1Z3I/ZkjWz
         Leo/li2hXSO1RbUapAfaGipEOyk5kU52PZb5pvkdMQRo3GSgM24zEfXTZzjlB5zvZTVP
         sOwsdE5pN3NqX8cmsBbHnf1Q/syhRhuj2mi5B8u0c1AMM4cceL9y735IHPy2mq2V6DzH
         yhr0aGkUg/N8zrCaBpFUCJ6OoDqw1tWbWh4qg9GDlQgKDnXG1xsWDTB5Ua0VF9FJ1DWz
         gl9nv3lr+jBzUk0iJgDqWiXTLnfXLqLKcU/4LywyaXLvRE2nu4aPDDm8qUb1Aa3x+62l
         3KQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=n64321ui;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a5-20020aa795a5000000b00682597cf841sor5617235pfk.12.2023.08.02.01.50.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:50:17 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=n64321ui;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966217; x=1691571017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=n64321uiEYqMxpwq+YPMHlejbTIDDAtsGHUU9HQt/tRzKERlAQH5pAl3jyaN9mBtxo
         NZpbwZr5VzWAk+NOAsFMWztzHWEcqh6omALyQrV/a2PIzPQM6yS5vADVB6tbr7LrPWj8
         gdPuiDzSODq7YCzU/Tzi2aydzbnUKWWidoPGNBx+U5kGC+5aE9NtNB6KUQ9470TCLUan
         vRhdz18glsozpm3n6zS+1lAAM/m9Zc/z7+nDcSmQGSLCvdfHIUSXCwR2WD5gws7GH8KX
         266iQ6ybkPE9LPUJNNWKRojbPN7oZguGzooZYUYsiwZjmw0CzGSepZFEZAcseNqCwexB
         MQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966217; x=1691571017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=bAGdVrowJRLtcWA0wN29ERuOkN3B6oASaVrW5ztemJqNDrJh+z+sqL3x22xdbkbPx6
         H/mvw2Xp84o0NDdMBs/hVHhGFTFZUJVP7A2/NylN+NYrDg0dBcG3z83198LHgGWP+gTg
         xA07KX83q/oLE/7psSFLDcci8+VaK/kSxxdQYhSiBVDwA7dMxQbnd1QVsgxsz9NyBScO
         ggLEsuQb2Vmfto9ryutuZUL9FuecIBF/q2KKIrnzTBqRd9F0XlTMjo9tkwJGOrl7QIrA
         G7Yf7NYW3JXlaay0ZyCB5vOFwfrTHF6icyJzdaZPAlrtpIbcgSy/ZuexBNULr4S0GWeX
         3aJA==
X-Gm-Message-State: ABy/qLbWt9VAYihoOV8YfjSFRzKvG4pGLBy2veHJut9B9HwePUbX6MW9
	REDpcyG5KMD0esAeQobqnGpi8Q==
X-Google-Smtp-Source: APBJJlEvPSLRRm2xJjIsvRMcJDpt21CYiEG6/gmSf1umI+nX8s8y9EC2IUL3JXw3sPALcyMOgzSphQ==
X-Received: by 2002:a05:6a21:7185:b0:137:2f8c:fab0 with SMTP id wq5-20020a056a21718500b001372f8cfab0mr14147444pzb.49.1690966217220;
        Wed, 02 Aug 2023 01:50:17 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:50:16 -0700 (PDT)
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
Subject: [PATCH v2 23/24] plugins: Support C++
Date: Wed,  2 Aug 2023 17:46:11 +0900
Message-ID: <20230802084614.23619-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hE8z69aSd+Wr

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
