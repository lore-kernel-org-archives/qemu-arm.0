Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451753lfg;
        Fri, 7 May 2021 07:44:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEGgZ3l7m0yJY8LCvZ8xsh1yUzWwOMIAJbixCPzwcdqYu3nkXVPO00Z0ng/K4qnnbFLYyB
X-Received: by 2002:a17:906:4d11:: with SMTP id r17mr10399628eju.217.1620398674211;
        Fri, 07 May 2021 07:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398674; cv=none;
        d=google.com; s=arc-20160816;
        b=TQQTkBFPlvB6nkDYmt3hNWqgMxRaaLkCpV8XCpcPKbFIs+TDOivN4Y4ytgS/OjWyf5
         a1S6XfzxwzapyUN2zhjqWXVFGvIRZcD7ArCFaxnORmb8lqAU6Ou6Y25dkFcmdGgxzr+m
         WWYzifNU40B8W5JGYhSEfBiCg0GPaCFJojbc8Ih0ok3nRujXxWlTFJSai34PTwKYzhuw
         0jVitwwwpxbOhwS99jwqf+PrRCH/54Vx+vR22aViTLpcRBhvhPk2hJgU0a6t61MOPaUy
         wdegtgbjr3GT216HXYUnmiTbvrNwYn0bZdV3PS03jxzYmML/RsQofjvuQ5RaepL/PTuH
         ylBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=C+MYJWIsLohbCHlMSEIGcZQyDaEDuU9Kl0ow5213YNc=;
        b=d0jXCTZm2fuMjJYk/3ITjb8zzyPGyJryJ2nC6Tkb/ljg9r5DN2C5NgMAwbWKpwmngj
         yLJdbVgEb0O8jPFZyNlgEmYy8M6uDojGut/DGX3xg7Fs//OLUsKtuX6e3T7zKIiLUMS9
         J5i7v9438xFZ8eog2Dj/uFz9C794sVpdmEMwT9Sb3U0nLzZez95985jwgqunuDzJZ6W5
         QJrrkb5bkqEJOFAszk4XuFOrrlCIxm5W5fJg+jU0mbOyBPDEgJEhsb7NC+djapurkWgC
         AL9kELXlDOjisg1VbT+HWzUs7bWiG3AaqDQ8+ktZ7S7P+YMJjtiQ9Uh1lguuiBXsefQs
         DelQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9bqPQ1i;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i19si5242799ejv.399.2021.05.07.07.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9bqPQ1i;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+MYJWIsLohbCHlMSEIGcZQyDaEDuU9Kl0ow5213YNc=;
	b=T9bqPQ1iOCtOKzHERhU/iTCRz0QU+fJrVF7VtsJtQ1CCf+nD5fiCd3UL4Tf5Pug+hnXn0A
	iS6taGJK/KAqmDWOLanVYHlyKIuW8EShZq3IPNpUd9MsmnZ1qhfip1w63fLcuGeZLzqRD3
	urf2/VDDc9L3+6oZq7q/Vf4Cs3vKot0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-fWKyHACMNtiQUzKstWrdmg-1; Fri, 07 May 2021 10:44:31 -0400
X-MC-Unique: fWKyHACMNtiQUzKstWrdmg-1
Received: by mail-wm1-f72.google.com with SMTP id t7-20020a1cc3070000b029014131bbe82eso3991374wmf.3
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C+MYJWIsLohbCHlMSEIGcZQyDaEDuU9Kl0ow5213YNc=;
        b=lD/EHb3fAH9tSGMkhgoJXxABSzgS31BmMrR4VYlBxzgvgHpX54nx89T7/hiWL7eogp
         Vc0FriJTcI8ugse1zbYhw+pfkOWNiSKP84X2cqLLpIe2psOpDoY9fM62dg89B5OGY+lP
         VOed1qRokR4hEEoReWldo7cOdBYNQusdPD/WLKoGYBG8hInFYOQ9cE+ue3lbVs7J4rKI
         KqVxQqnsWdXWt8XfStAgQ3B2KSB5SbUrauUO/1EHPmzU/FMdOQw2Cj86CvK5x6aEWOvC
         et1B+qZvLrVdrV3g+koTOVUq+16jr0tFYCq1VHdvgPIAa+nkiA0cRId3oG6E/yP3Yxry
         l5dQ==
X-Gm-Message-State: AOAM532MyXZwVm5hJHjbFIlV71J/CYmXQs6x75nGgcvznA/+JzQ3kyFe
	A5BQQGxFDsnNv0bOvtQqUkHR7mIHjVN7v+TbJzIAA78BpLFfdTr+wNi+RDgXIRGZTaV6kKa4OIU
	bPaQmm4jCQo/wMNmV
X-Received: by 2002:adf:f80f:: with SMTP id s15mr12876033wrp.341.1620398670261;
        Fri, 07 May 2021 07:44:30 -0700 (PDT)
X-Received: by 2002:adf:f80f:: with SMTP id s15mr12876009wrp.341.1620398670157;
        Fri, 07 May 2021 07:44:30 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id r13sm8833726wrn.2.2021.05.07.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH v3 15/17] target/ppc/kvm: Replace alloca() by g_malloc()
Date: Fri,  7 May 2021 16:43:13 +0200
Message-Id: <20210507144315.1994337-16-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tNvpDB0Nip8s

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead, replacing it by a g_malloc call.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb5..23c4ea377e8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
 int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
                            uint16_t n_valid, uint16_t n_invalid, Error **errp)
 {
-    struct kvm_get_htab_header *buf;
+    g_autofree struct kvm_get_htab_header *buf = NULL;
     size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
     ssize_t rc;
 
-    buf = alloca(chunksize);
+    buf = g_malloc(chunksize);
     buf->index = index;
     buf->n_valid = n_valid;
     buf->n_invalid = n_invalid;
-- 
2.26.3
