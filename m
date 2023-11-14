Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082743ejc;
        Tue, 14 Nov 2023 06:39:01 -0800 (PST)
X-Received: by 2002:a05:6512:3143:b0:509:38df:1e77 with SMTP id s3-20020a056512314300b0050938df1e77mr6552172lfi.10.1699972741012;
        Tue, 14 Nov 2023 06:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972740; cv=none;
        d=google.com; s=arc-20160816;
        b=Qizlgax5VF6X/GTWb1GGN4eJLYeb3putf9x5nuNzklMpfH4mThPomEmnl99S3rkpNU
         AEbZqSMyeHkhpYzRY3QbJs6MVSJTIeJDL51a/DvDyaIGBWm3HmvYhfZFx1rsOH2bpbbN
         pP1Fm4EQOQkH88XqVBs0XYqaxeliDWtkICc6HT6r1Q23ceB6sIlRa+tFxdNN6v+SRyA1
         fRtlmwpzTKiRMtu5uFiE0aN7+r2iConQrWpzJUJp9abnhSYIMpQw1FAsqGe5812nbYHG
         EJRWQSx/stitRC8Fq2B9V9oczxfOJG9A7Lel1Hpkz4DcfzLqSTSp+8IwJUq15oajRLkP
         fVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A2i2PCnBLcbag3MdE1ImS65uDPosS8yIjq0X323T5yY=;
        fh=x9Fi4ZIukdrtyL5TeYscoblPJScsjDRIG6KPVWTJ4xI=;
        b=HN3mAIB4reC3bvJp8pqwe0TvzyGG6fS/BRzwV0vII0scTvcej1L9jFsr5mc+tuICx2
         LFxxje54OV5v6SO4lSVDEuw/1RROj9IraFuV8JPr4329acKoj2PgGhjg8kvaIf3RJqNf
         k2/jCWm2o7+YtiisjF4hUhCFu2dc+eeEIHDeyFL57srouA/4SK7NNn8b3ecg6wkivY0L
         FrpD0SYALGzivZagTjhQ2pM7od2gxG3u6ZG/t+YUNfYfFIOKp+B/sHVpJ5hWHLZTvJ4Z
         F/+nnXpyfDzmgl+1rQ07Zb39MHHkixqCY+eFgGvqQiRE9o/6rnuzWr8+uTj5zbagYVNQ
         9ObA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmDhve3r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m24-20020a509998000000b0053e4bbef07fsor1739331edb.11.2023.11.14.06.39.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmDhve3r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972740; x=1700577540; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2i2PCnBLcbag3MdE1ImS65uDPosS8yIjq0X323T5yY=;
        b=OmDhve3r8aBNsNpIdB2wmaeaBBG4ojdoe7KkCtp3vO7mqz013/FBH7kY+CssPm+NRq
         ddQVAcft3ojppcEeU7SjDD0bHZHuUE+2pSG90PsgC5H2JZzzWKQOJLZe6wJozU8y3ZXs
         VSPhoAQMvWIISBGkaN95RQzvBVY1npKkgO4N99tyZ8kcuueJOgyNcDOn3jAEGwso+Gur
         0NySspedMc/yx1WEF9FpfFeQyLClQ2FA82TEUyIY846hfFKJOIxkE5AEcm1gFa/r07xE
         77tcHvxuH6N36EP/ZbbSOuDQlaZznH5Ss0H0NVYf7ICrwIKZcEMpcj2jG75f98lP8KrR
         A0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972740; x=1700577540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2i2PCnBLcbag3MdE1ImS65uDPosS8yIjq0X323T5yY=;
        b=n9O5snFv9c/jUSSiEsjyqicsGXg6bZRbkXwWFIEYpKv3pX7kfCP+K6FP7TywsEaO+L
         8zz6VXEb/bcjBdSuwxQtBROQNqL2wSz7I0G90RJi5i2myv4YJvltFo5sWQwtEK4aE2n8
         SkVpnlT0DRcEisC70XSYI4clisbuBO4gnvOn0m4/mxcaEudafCKZH5wzN+KGditmw3ke
         3J0lhtRsdO1aWLxT2I4kflSEuogWOMKrFJEQFx+lW92EBcFezd+e1RMjqatSKunb7rl7
         Mug9Wb9ez9PKY9mAJGOG9rz2zc1Sk/a/JMMVM7WqVsDqmYC3K282hbovHGwAjupiioPy
         MyOQ==
X-Gm-Message-State: AOJu0YwiBlu4JJLv09NLCe76Kio5Q5rAN4zqJbXoA2S+jW+sYgjThywb
	qKv9DF4evzJ5qNyjuy6z7+kHpyAH
X-Google-Smtp-Source: AGHT+IHSJfSbRj04/mwMI7ongNHq1l4+SKd+JSAzh7MEswy3END/JCbC/d/lhlupvrq+nM36Jvq7cA==
X-Received: by 2002:a50:fb14:0:b0:53d:eca8:8775 with SMTP id d20-20020a50fb14000000b0053deca88775mr7423669edq.26.1699972740609;
        Tue, 14 Nov 2023 06:39:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id b21-20020aa7d495000000b0054353639161sm5133902edr.89.2023.11.14.06.38.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 06/19] hw/pci/msi: Restrict xen_is_pirq_msi() call to Xen
Date: Tue, 14 Nov 2023 15:38:02 +0100
Message-ID: <20231114143816.71079-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g6yW5nPvxR0t

Similarly to the restriction in hw/pci/msix.c (see commit
e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
xen_is_pirq_msi() call in msi_is_masked() to Xen.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 041b0bdbec..8104ac1d91 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -23,6 +23,7 @@
 #include "hw/xen/xen.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "sysemu/xen.h"
 
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -308,7 +309,7 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     }
 
     data = pci_get_word(dev->config + msi_data_off(dev, msi64bit));
-    if (xen_is_pirq_msi(data)) {
+    if (xen_enabled() && xen_is_pirq_msi(data)) {
         return false;
     }
 
-- 
2.41.0
