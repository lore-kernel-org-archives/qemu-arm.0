Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025021ejo;
        Tue, 12 Dec 2023 08:30:40 -0800 (PST)
X-Received: by 2002:a17:907:72d2:b0:a19:d40a:d213 with SMTP id du18-20020a17090772d200b00a19d40ad213mr1740030ejc.223.1702398640072;
        Tue, 12 Dec 2023 08:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398640; cv=none;
        d=google.com; s=arc-20160816;
        b=qAC66EJ1BBCU5WyErfisOUvllhMyEs4njDzi8ZI4f2n0TWAxP9lUHmHVfBieFRl7ru
         uwgnoru2putxuB7WUcVdW55WMmpd3qbfO+M1L/kY0JQmgL5pwffrt96iCBKJYvtatlRq
         yDyqepVqJVyhUPy5okzGqBpFrMTTl2RJTs2RmuAZRXgSnW2AF0eyvKf6YVUooPmBqWek
         ttwqtH+P5vSBtTT+p6xVUfuXTf3Daxk9JBpTLISXUlQnx4HPB9xpImPjd6cA2V5Xg39J
         hJ1wwLeErM3JeXL4ea5r7EjBTQyDZ2wrs3HWgySaVLF6qFaSfZiVmfkteUeNFYnKTpB+
         aSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hjt6Wlk39I28ykvvxAfjim08zez2NFi+ssDQvlNXSBg=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=F2BqUdPyP1pBu+Ac3eF92bPkMii9g8fNcgPjFzA/MYAFKeoVMQBeqgcbgQGJJOsqOx
         knkZVh6SNeTIZpokW/rlDJ5bvfl2RaJHR1Nig0jFD8Mw2vCBv01IFhJ9kBU+WulWoSVE
         BnjAVfg4NyQbkhi9yTRk4PsfLLKGH70Houw9/xr7SzWO7Qock1YWgg9NHwO81izzLnP9
         FEZ9jDAvMhdKhvq11sEwcWOoKUdw+y4g40bL3LOgAQw6mIpSot0mFfwROzbPwrN0vI/i
         j+uS3f77TwW3MHitt2UCU9mFkmXM9n2+6Oy76wmBRJ3X72UJi0fe4MnrCdFLuuAE1mMw
         FdCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zPJgKHYm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dk1-20020a170906f0c100b00a1f6aec7ea0sor2374391ejb.16.2023.12.12.08.30.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zPJgKHYm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398640; x=1703003440; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjt6Wlk39I28ykvvxAfjim08zez2NFi+ssDQvlNXSBg=;
        b=zPJgKHYmXDn3N4j6hxEC0ttT/c8GIlQCPWU8UaGmECQFc5wMYQ1tnd52xh7A1XgD34
         NGWOyhitOIwuljGKytExLEBIcYGG30oatFUWSzhkLAw+08f6klbugh4+85Nk8npWdXnm
         FEV0B28bSAoPdtwfC8GeKvKC09ryHbTxbZ8stFis6lRC3jACIwglTO5KN7csdKFQK9MA
         PX2GJyDu8tWNZ+tYB9RyWIJs555b87sCWAl/868b7omTuHVraDO96t2u9zzmkQuLOElT
         375sbHlhiisEOBtiYpbKUHRAA2EsMwZofqMNDMFBA1Njwe8tHsrMFaSG1m0L3aQClcQF
         rr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398640; x=1703003440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjt6Wlk39I28ykvvxAfjim08zez2NFi+ssDQvlNXSBg=;
        b=A5G+v+NYtp4TBET3kpke05XWBpqS9/DQ42DWv5Kay7e0N0nxg+xd5JkhDqO5o8zyaL
         E2DJBDJ94vWdpFikE+jT/bZZkAQ3rFCTTkJCwIAuUVa04/Awdi9gXOsAppEJIs3LHz9P
         bA8BUvoABEn/A/68rWWnM48yPtNc+3PO/bvikTNiGS+kvt/sDWFCbKIwUYUYrsnJB4nK
         UgkKpYuTLVyHirwnEkrdHtg8BRUuGE2+EuQbfvWNL8Sba93p3keYUc1dtF10s/ph/9oz
         78rILvT7TjVqdpMRo88TYtSeAI0cbG+xfIDyQ4zlK1C9CNbTl+dqLrL3RS8CafprmkY9
         Oqzw==
X-Gm-Message-State: AOJu0YyqRpHNE3Vq24/eq/vWJpN4AmavQbJ/RM515ZqWrcYyOam004lj
	P7McjWrE3Xa1Zb/u9U6scgC0juQp
X-Google-Smtp-Source: AGHT+IGLtDHDdLPeVypC8ZM20Oj1MeVcIRgGuxjTqKU9B75xo+mLSKSdDmZpXYa7wtb6TnEHFRnfEw==
X-Received: by 2002:a17:906:225b:b0:a00:152a:1efa with SMTP id 27-20020a170906225b00b00a00152a1efamr1843142ejr.3.1702398639820;
        Tue, 12 Dec 2023 08:30:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id rr17-20020a170907899100b00a1d457954d6sm6462970ejc.75.2023.12.12.08.30.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/33] hw/cpu/arm: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Tue, 12 Dec 2023 17:29:08 +0100
Message-ID: <20231212162935.42910-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0vKzaRtuRd26

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a15mpcore.c       | 21 +++++++++------------
 hw/cpu/a9mpcore.c        | 21 +++++++++------------
 hw/cpu/arm11mpcore.c     | 21 +++++++++------------
 hw/cpu/realview_mpcore.c | 21 +++++++++------------
 4 files changed, 36 insertions(+), 48 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index a40f142128..c2ee985fb4 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -164,17 +164,14 @@ static void a15mp_priv_class_init(ObjectClass *klass, void *data)
     /* We currently have no saveable state */
 }
 
-static const TypeInfo a15mp_priv_info = {
-    .name  = TYPE_A15MPCORE_PRIV,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size  = sizeof(A15MPPrivState),
-    .instance_init = a15mp_priv_initfn,
-    .class_init = a15mp_priv_class_init,
+static const TypeInfo a15mp_types[] = {
+    {
+        .name           = TYPE_A15MPCORE_PRIV,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(A15MPPrivState),
+        .instance_init  = a15mp_priv_initfn,
+        .class_init     = a15mp_priv_class_init,
+    },
 };
 
-static void a15mp_register_types(void)
-{
-    type_register_static(&a15mp_priv_info);
-}
-
-type_init(a15mp_register_types)
+DEFINE_TYPES(a15mp_types)
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579..6b5ce01246 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -178,17 +178,14 @@ static void a9mp_priv_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, a9mp_priv_properties);
 }
 
-static const TypeInfo a9mp_priv_info = {
-    .name          = TYPE_A9MPCORE_PRIV,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(A9MPPrivState),
-    .instance_init = a9mp_priv_initfn,
-    .class_init    = a9mp_priv_class_init,
+static const TypeInfo a9mp_types[] = {
+    {
+        .name           = TYPE_A9MPCORE_PRIV,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  =  sizeof(A9MPPrivState),
+        .instance_init  = a9mp_priv_initfn,
+        .class_init     = a9mp_priv_class_init,
+    },
 };
 
-static void a9mp_register_types(void)
-{
-    type_register_static(&a9mp_priv_info);
-}
-
-type_init(a9mp_register_types)
+DEFINE_TYPES(a9mp_types)
diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
index 89c4e35143..74f44434de 100644
--- a/hw/cpu/arm11mpcore.c
+++ b/hw/cpu/arm11mpcore.c
@@ -153,17 +153,14 @@ static void mpcore_priv_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, mpcore_priv_properties);
 }
 
-static const TypeInfo mpcore_priv_info = {
-    .name          = TYPE_ARM11MPCORE_PRIV,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(ARM11MPCorePriveState),
-    .instance_init = mpcore_priv_initfn,
-    .class_init    = mpcore_priv_class_init,
+static const TypeInfo arm11mp_types[] = {
+    {
+        .name           = TYPE_ARM11MPCORE_PRIV,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(ARM11MPCorePriveState),
+        .instance_init  = mpcore_priv_initfn,
+        .class_init     = mpcore_priv_class_init,
+    },
 };
 
-static void arm11mpcore_register_types(void)
-{
-    type_register_static(&mpcore_priv_info);
-}
-
-type_init(arm11mpcore_register_types)
+DEFINE_TYPES(arm11mp_types)
diff --git a/hw/cpu/realview_mpcore.c b/hw/cpu/realview_mpcore.c
index 7480b38d1a..b140888618 100644
--- a/hw/cpu/realview_mpcore.c
+++ b/hw/cpu/realview_mpcore.c
@@ -114,17 +114,14 @@ static void mpcore_rirq_class_init(ObjectClass *klass, void *data)
     dc->realize = realview_mpcore_realize;
 }
 
-static const TypeInfo mpcore_rirq_info = {
-    .name          = TYPE_REALVIEW_MPCORE_RIRQ,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(mpcore_rirq_state),
-    .instance_init = mpcore_rirq_init,
-    .class_init    = mpcore_rirq_class_init,
+static const TypeInfo realview_mpcore_types[] = {
+    {
+        .name           = TYPE_REALVIEW_MPCORE_RIRQ,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(mpcore_rirq_state),
+        .instance_init  = mpcore_rirq_init,
+        .class_init     = mpcore_rirq_class_init,
+    },
 };
 
-static void realview_mpcore_register_types(void)
-{
-    type_register_static(&mpcore_rirq_info);
-}
-
-type_init(realview_mpcore_register_types)
+DEFINE_TYPES(realview_mpcore_types)
-- 
2.41.0
