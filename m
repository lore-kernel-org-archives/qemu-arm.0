Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1272352lfg;
        Thu, 6 May 2021 06:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYR75q86KUkaQl34EZQ9ZMuUtVZiGVlB8W99RD4OYU5QRwvoKSB4FVEXqCkIKLTD4hykru
X-Received: by 2002:aa7:cb43:: with SMTP id w3mr5149778edt.287.1620308328706;
        Thu, 06 May 2021 06:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308328; cv=none;
        d=google.com; s=arc-20160816;
        b=vlnX3CYECvmpccxEl84M1LZxYmzbpNLpzWlLw4ihFq1kj8SKej/VqpXkmcQtCjafln
         zN4KMdNRkpJRVt5ObhI7xoy0+RNkQa9w8O4mooC6WJ8tkgDGUhVsaduHY4Q/OqoXD+vk
         0vKs8BOJv3HcSUlrSdMpk0pw5M72FjJ8488IDiceE+yQG58CNLg5/nwmOX6yhrrs3+qn
         wK/MrVfeXup9Ev/lXVOYpSB/vPCwtMykVGU3CKV5a7Tx76lRiVJsFKCTWpeeNrYTe9/V
         gDbQhjuRsxFyqXmh3aPWV25L5qoXk3VsX+OTa5eiMdTDW+A8Yr9jLtkesPn2V0Xx68Xm
         Evjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RLFve6Y/zmLo3HdgEB/9T6FDXcQ0p9jwbmagngeIlOE=;
        b=CisYDrXMwoZfdHWYMcbDpw7sw20iV0aioX0HMzdhbG8Skx4Tg/M4iJb+gbFto4y2Hv
         +EpliM4ZFrjD/+HYdp71pY4frEa7Z6rC6xpU8WhBQLIt4bB0vF8YMg61fK+IVdeQxzvp
         sp+WZaTu5JAKSQ4KeRgTDNuxB+bCKIRiT9Yx+FwH7IG4XS6U6NfXPcUpEPEAbvIxpA4m
         6RquwKTodR/PkKaSd7CAgq7q69MFU8yPZNkWcemi0+R8Vja6j+te7i613BgBwblTPwdN
         9LhpbsGc2VoIgDEIKpinINyMdQgoCiCJs0taAzhYTzmX5+Aaz7Pv1KIFSnrdggRctmeG
         LCHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XSZTY0dF;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g20si963843edm.517.2021.05.06.06.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XSZTY0dF;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLFve6Y/zmLo3HdgEB/9T6FDXcQ0p9jwbmagngeIlOE=;
	b=XSZTY0dF3//VL+zAfbQ7M4B9+MMOYKVm8Ei1drOjWr40BijNSmiPlRFRYBzy5Pq/7KbvWn
	CQWJjFhTEYHrHD4iy1aBMt9uS5dxzBxxvEhY2u8zHx17IKh/znlgDNoIZ/l1TNNUZuash4
	c30fibj6K1qX1yOcNrtDZN75KSQDuo8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-x-BFlhxwNJqK2IVZL2wFGQ-1; Thu, 06 May 2021 09:38:45 -0400
X-MC-Unique: x-BFlhxwNJqK2IVZL2wFGQ-1
Received: by mail-wr1-f72.google.com with SMTP id x10-20020adfc18a0000b029010d83c83f2aso2222007wre.8
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RLFve6Y/zmLo3HdgEB/9T6FDXcQ0p9jwbmagngeIlOE=;
        b=klX90qN4X3LLy/jeevnqc/xOtKaXn4VrUVaF/LNa95GhuDxOMmGVzOsTVOhwzV+SoF
         zd6ljf/p+ameq+fFjAzAWNV70C1EqLGWQGy311q0Izxb98iGa7YpcEqyTcoXmcfCx4jp
         QAsWJVNH61KXCWKhgudeBEuq02oOaPg4Skgb8PpYstexpPQARu8Iscr7qTgWg2OIHNTs
         Q8QJtRogbjgw2LQatblDKNliXvpx9CJm0mhHvQpS0UuU1QwRXaV1ded/MFq0e4gj66J6
         8l1zUvYVpl5ukuGRqJoLbpK/4oSB7Kfh3k6MRc+YsTHvM4sXapqhP87wg1froiLHjraC
         ODAQ==
X-Gm-Message-State: AOAM530XQ6erZ+LUfhzBpK3hr7GnFxxO9YQpBTS0b3wnh0TT9HmWgO/5
	9v5KyaO5uzM4UOU64DIONp/5VrxBqYIWxw1i/BmSRiwcick4yojeNbNgvtd5ZLYV5WVmuPuo+db
	myikhoC0AJ2R75UBA
X-Received: by 2002:adf:e348:: with SMTP id n8mr5215092wrj.209.1620308324012;
        Thu, 06 May 2021 06:38:44 -0700 (PDT)
X-Received: by 2002:adf:e348:: with SMTP id n8mr5215061wrj.209.1620308323810;
        Thu, 06 May 2021 06:38:43 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id w25sm3208909wmk.39.2021.05.06.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 9/9] target/ppc/kvm: Replace alloca() by g_malloc()
Date: Thu,  6 May 2021 15:37:58 +0200
Message-Id: <20210506133758.1749233-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: T4T9o1HM79ju

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_malloc() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb5..63c458e2211 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2698,11 +2698,10 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
 int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
                            uint16_t n_valid, uint16_t n_invalid, Error **errp)
 {
-    struct kvm_get_htab_header *buf;
     size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
+    g_autofree struct kvm_get_htab_header *buf = g_malloc(chunksize);
     ssize_t rc;
 
-    buf = alloca(chunksize);
     buf->index = index;
     buf->n_valid = n_valid;
     buf->n_invalid = n_invalid;
-- 
2.26.3
