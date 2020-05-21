Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888039lfb;
        Thu, 21 May 2020 12:59:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxpEShizCyK51uUhuOvqulgTlwRNASir9oYtFhOfmBEypZnvb1RMPAi4Mw1Kh+vykaa+be
X-Received: by 2002:a50:9f85:: with SMTP id c5mr371418edf.72.1590091186509;
        Thu, 21 May 2020 12:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091186; cv=none;
        d=google.com; s=arc-20160816;
        b=TQ4kQzUG+hDcgf08CNhuZmT6KKpO9t5rD8z9p7PrrJcXOLnbFJO3rsM26Z1/AU3lmn
         LO1fxKQ53V6QkMZrE+XNnOQltjKQQ+QNYV+0LgCiEt/NuhUoxACUNNdi6LymGoiNzGCV
         RA3Em4GXvT3nU8KYONRXRT14fnmoyXKAlUAtgXSigkgD143pFFmyKbtQ3tL4SmpiuEjd
         blAKlp9Lykc7na+5g/xVJjCfz/FbOWDOJ5fGVhT14K9ElLJKgtgFeqAQU+sAe2py5glB
         emlVE6wcflFz1wGSNnRzBIp1jplSV0iCfd/pGqjw2U87WpiTPSZrEi8pfyoTUTyQMoPE
         FElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
        b=TqEGwCrcKN5zsAHt7lgOCqyMi30STfrpoj5YJw6ZKNUqBDKekRTBqsFCP00C75p+gW
         y19R6WSXTz4uziEhEni+S4Jr3LiJV5QGcA1wKcLyWODQr9Ug66kjU5WGp2hnxJbQoRd6
         qnVWNHDKK7R1dAIFYTT3kRf/UrHz1kTwDgTm16h5toQ52sIRttJljhnT0l4yZwwpkyAk
         t8xNoux1XoZY67tEfQZ+prnCtkRCVM4rldajM+fF/gKL4b4BynaSw8x5efilNTR7HCsq
         Sc9MX1lM6ZUwtW0yvZ4lZ0OFC+kL6892CJz6aaTL54jerL/THzR/RMxikcJ/n5OSnf8t
         37BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akM51lUG;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id e4si3653457edm.144.2020.05.21.12.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akM51lUG;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
	b=akM51lUGK1ElKLhmZTB4gjs3jGCRiUY4k/dplulWfp8vcC9JoGGhI6WzvTJfhRz0lqQev/
	PUzOmrWgwd/ri+ST0f/OWyT9stiamVseaBtwKYyEPuCNW4+nyQFYXM5dzqaeuEYUiTXU/n
	LmzuV5U7qlxKhUKZ4ladIVBOnTGYtEg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-l9WDbf2vMXWDcOqp4dv8Dw-1; Thu, 21 May 2020 15:59:42 -0400
X-MC-Unique: l9WDbf2vMXWDcOqp4dv8Dw-1
Received: by mail-wm1-f69.google.com with SMTP id w189so3088174wmg.1
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndqFgBanjliYTdRp8N1sk+p/cY4owVogsc0x0ibf8Jw=;
        b=ULPpihZFMDJexaWyKqdFGozGl+/RJZWAnsImHuHdOH4aw+pfluGogYnGNeAKWIO4N5
         m0Is7VuqGOIDkVMzZr0lqaV0VnHFYiTtG+bzjxoodIsxc34a5IAqLGOHpM+wVTbLqtMq
         EziSp7qLlQMehakw3bsSu2cXLvM05+88hXroEE2qcnBiCcczXYQhrdMhkS6vwCaAL+Ph
         oHaks/12kTsGfjUw5NUAwehegtToGsxemNRJ7fMNJVDf/H4NjXDb9tu4lpau2aiwScGQ
         +rxB2nDCtbvLe1bo1Ryvrmu1zeRYu6xODPODdXQMmuXLY96OMdCEwNVz29MrjVPbfw64
         zDmA==
X-Gm-Message-State: AOAM533McJtB7Vw1rkyS1AC4MKJvQ9M8Z7vmZ+hrt/YEWPI8eWmy9eMm
	CxLJHdb3LVmCG9ahvxdH9pdGjhWhXzkde+Q6hlA+oqZtURLQjIJ1FZRv7R2OxmXjHcodkrBIY2a
	YqWfEQa//Hin55Urv
X-Received: by 2002:adf:ea09:: with SMTP id q9mr199791wrm.399.1590091181640;
        Thu, 21 May 2020 12:59:41 -0700 (PDT)
X-Received: by 2002:adf:ea09:: with SMTP id q9mr199773wrm.399.1590091181402;
        Thu, 21 May 2020 12:59:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id 40sm6315242wrc.15.2020.05.21.12.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 05/11] Makefile: Remove dangerous EOL trailing backslash
Date: Thu, 21 May 2020 21:59:05 +0200
Message-Id: <20200521195911.19685-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: si34FCYvv9Yb

One might get caught trying to understand unexpected Makefile
behavior. Trailing backslash can help to split very long lines,
but are rather dangerous when nothing follow. Preserve other
developers debugging time by removing this one.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 40e4f7677b..6c9d718b2c 100644
--- a/Makefile
+++ b/Makefile
@@ -420,7 +420,7 @@ MINIKCONF_ARGS = \
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
-MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
+MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
-- 
2.21.3
