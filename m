Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414814ejs;
        Wed, 16 Aug 2023 07:56:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:3294:b0:140:94b8:3b76 with SMTP id yt20-20020a056a21329400b0014094b83b76mr3076157pzb.20.1692197766793;
        Wed, 16 Aug 2023 07:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197766; cv=none;
        d=google.com; s=arc-20160816;
        b=oXw1zOLM67qUJ9g9EJFpBTTz7YJP70c7SMzAOTOTGmTGzJC4vcne6JSX+BcddatN0r
         q/4oNwcWQJ4FIlopM6sAFPzgPfhkIKfCevmrMRQyVhezJ0E2lQ/X3apNSjSY/2CiTHCV
         qSpg5lxKXZc7HPkGVihJmPCPh0SMnjCwVIdmWAOpuD/9JUI3RuAYHiKxGpJLUZCo3iR9
         F0Wap87yqbmTK1zCII6Bc3MTgtpgjOBg7L9++Abj3H4wlZKGylFKG9ubVsu2R6t/jdMa
         Jocma1nJl3uwbQu1LgKq6UVTr0gI/1vT2vtnZMtj/LcO5qS04MWdLARExC3etsW3+Ed4
         hNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=aezEgc4IBCrb2uaFMqNelLS9BEfPlJtO5FzFXjsmqGjkfQgYq+j/ux5o4uEm5p97kR
         4+XZuiVvJ5XcYlG/hcOkeTubpfiWzljSOm1RfLPvMaOY5KyCjdT5aTjJYqJlPNX8ZctP
         0Zuo0Vvs+fHYZUQoF3loVmKuaIc2Iim0mMBe4DtS4JHGO0gBdZRNyRjILkK1tdRQVEeG
         CNrBqL+nP/PH19HgpTJbS71okEOEOCViVhm7/2hrfVKIOZ2wnMeRUL+KnnRFtUKUPkVc
         dN+3BffSZiExvKyEcV1IJZikDvUUjKZxNbt2S1aBSvEh2TVTiIG8QOpX85jOx7YXA06A
         pl+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=ECQssLGS;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g1-20020aa796a1000000b00687bc2acbc3sor11525163pfk.6.2023.08.16.07.56.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:56:06 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=ECQssLGS;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197766; x=1692802566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=ECQssLGShkIKdoxhZZy+LMWwlFqzcHtixQxWIMYm/BPslYVE6MlU4GZhw3MNDXuZ9z
         WgTVohXHGd3s7Osjiq8VtBmd1ehLOZ+Lcck+3DergPXyd7OEOXfTVCQfH1SLt3/bWrse
         EOeRQvrMwHLxs/tj15RZ8wQrYSzwNh0hy7hp189kvrqwewMsv4jMN/fNIcmgeYfg7pGI
         HbQ++YqfVJpORyNTZPPAXzBTx/IF4obY8Au80rf06+Q+BhYYew7CNTlcAj9uMPQr0w2C
         ivi/42OGXK1MoeC3yoEzFx5k2zwhcUV25Ss2YSGm5fVtf7Q8eJ8Llc0gO4wpzmtaHafn
         oMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197766; x=1692802566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o76KcQlFp/MuUPscQNwseGhYtySE7hW349U50r8SMs=;
        b=UtJa3OwsJbGDjqgYgSYO5smeM3i6eGloziwjhdJdzC0Ci0soLMdbBW3d9ZSSCRBXwI
         Sz9RW9y+e/5W+vMFPFnTULbIhjJgc+7allOdtrzfMxudHDGLFNfTVD0aol9r9OMdRdfZ
         +hbsB5/7OXNthJIbDQHI4/C10IWJmIWVgISExqvqU9d4LGDu/sU6vWYH6wXAYTFVEUqZ
         3biq+6u47xXD9dY0myb2jhyt9d7kf+kloNUxdolr34bTdVdt+2XQQkwcnWnlY8SRqz5s
         bbvaPzKtM6b5YA5QRvMafem20WHI7UDQ9EFSRYKS7zXOWNYzo5Ca52FaK0/NZLdCVeyC
         KNkw==
X-Gm-Message-State: AOJu0Yx0GCERQWOv3PdkqVRcKvnMgWT2KC14fO9IXZ6HtFkqCn+pYbyS
	y0lnXGknjYYPwhd9bL3K0tw8yg==
X-Google-Smtp-Source: AGHT+IFuJWXKBYrZNfpQaIXVCLG0U/O4pHpCtQJ7JkWj+6RHSYVf1WjURL0J7PYM9I6jSgpFz0yl7g==
X-Received: by 2002:a05:6a00:10d2:b0:687:5c3f:d834 with SMTP id d18-20020a056a0010d200b006875c3fd834mr2605176pfu.11.1692197766339;
        Wed, 16 Aug 2023 07:56:06 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:56:05 -0700 (PDT)
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
Subject: [PATCH v4 24/25] plugins: Support C++
Date: Wed, 16 Aug 2023 23:51:45 +0900
Message-ID: <20230816145155.21049-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WqHjmdHGqJBL

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
