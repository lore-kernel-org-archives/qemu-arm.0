Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451496lfg;
        Fri, 7 May 2021 07:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkbXCcrIsHsR9NnEFGPxIkOiYPtfrSj7CUMrLydlwD5d/55iTjYI5a5I4B2G8o24Q0nn1P
X-Received: by 2002:a05:6402:6d4:: with SMTP id n20mr11640395edy.134.1620398654299;
        Fri, 07 May 2021 07:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398654; cv=none;
        d=google.com; s=arc-20160816;
        b=hYo2h9gck4Fa193AP6xASogednuwtKpEdPaiSzYk26WtMAhamBSmffIXs9ZWNqdaBo
         fYDgYjgC5V74qQtOeHPQeOkR13zGd06E6W6TrMBfJ6+5i5wTaAOuQAtRLmPwQrop0DwK
         ElatnhWV7ycEDuhbRGDhQeDKFXgKcw1A/6Z8Ktl6JMug4UkySjznuSqF+KsIEeFUmN+n
         I6zqR4e2HndfZ9VObLG21GGvOq7PXq56+DvVi5Pj7MUNVkKQvIi3gwRLFKWRhm3ZFmwr
         Apze+KzQnOWXwMj8FFAOY4SvwHTs/pFLvEQ3lmfr62/jEPjG3+DXFrPl51RBc0ty31hD
         PHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LTsvX/otw5M7TG+3dUKEvSePlS48V26N+Mr55ie/fDA=;
        b=dni0QSRV8ERE2iUxQ6DhvSjOiDfVYnPdUw6lDcJh5ccCSVGV9qtX2WpYUqdhPppZDx
         Ebzl5tQnctwmkyNCcoIci9oNFssrIJOktS10xfIAWZcZZvNiXlQQqq0gp7rR1IZJ3KT0
         LQXC1s0B/wfs8cfW/hs82BDlquxfZmkPzfM9MoUWUpStxb2XMYtV0fBoOHgr45I/Buci
         BMztGWqSx7VS7ORxgUaF/hwxsbWvar7QrbS7osyBDt/suXNf+yQn4i8VdfvWi8X/5hHa
         lkpVQd+IcwnyyUQ1Sys5FmlFhtagewMcUs97Z2DQqOIirNPIJMMX7L2JAsaGzPmXfL0X
         Jubg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D27syJ7B;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gu8si5250676ejb.497.2021.05.07.07.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D27syJ7B;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTsvX/otw5M7TG+3dUKEvSePlS48V26N+Mr55ie/fDA=;
	b=D27syJ7B/wIOmfLHVmMaJbkNuRB49CY7uRHqqP4fivyiqZin+97I73t9tscNYfm/bzjtKG
	DCGImahBpKcnDUzleL3o0G5XVEhdIJouRoEvhu+KxXj+/o3Zg1iy4aCpOZs+em8oBx4D5E
	5m+JzrwDYcE+4rHAQPHCtzd9OP+8UwU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-VtgORW2WPYWiTXbRD6e3Ig-1; Fri, 07 May 2021 10:44:11 -0400
X-MC-Unique: VtgORW2WPYWiTXbRD6e3Ig-1
Received: by mail-wm1-f71.google.com with SMTP id j128-20020a1c55860000b02901384b712094so3991445wmb.2
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTsvX/otw5M7TG+3dUKEvSePlS48V26N+Mr55ie/fDA=;
        b=UEKoEG6TWzKH8FMOtBqX2HgzBKCeNDQc65cQV+FqsVFAtUX3fqmSIj3KeiS2dApu+E
         D+k6VcChrM4eIVHoOD2O3ucFgx1PUizd1BQdr+wi7B07WN6rmWssxFHSNqIuIKKbLm8h
         TNljgPGyZIoqXN+6bJYOBwEzyfjFAAVagd+fAZcL5B/Hiz+nAmzp4HTgQck3cAL+Xuc9
         yGRDDK9ubbLOjqxtSNtqsFQsjU0N8kPJWG2ZOndwTmgBPcMDDoaSQloRYmIkIyi0icC8
         AIRHrK/fhUbgHELvMzYI/ODenPbjTh/9iVdrEG/gWL4gcyNytnSptObS7OGzeisX9VM1
         EHUQ==
X-Gm-Message-State: AOAM532Sg7ZevJngfpf5VJ240z2K55kAWcZqf7P98EXQKXVCA4nPiva2
	IDCO9xQmIjWQ7qlCGqYvqMhbf+rhST2lVujYNcvmgjbQDdDYpjpFjbZiUg5vvpsx/5TpPf3W1r+
	qQoaSh+4+bjtnzSi2
X-Received: by 2002:a5d:498c:: with SMTP id r12mr12851514wrq.31.1620398650417;
        Fri, 07 May 2021 07:44:10 -0700 (PDT)
X-Received: by 2002:a5d:498c:: with SMTP id r12mr12851489wrq.31.1620398650237;
        Fri, 07 May 2021 07:44:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id w25sm6720771wmk.39.2021.05.07.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:09 -0700 (PDT)
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
	Stefan Berger <stefanb@linux.ibm.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH v3 11/17] backends/tpm: Replace g_alloca() by g_malloc()
Date: Fri,  7 May 2021 16:43:09 +0200
Message-Id: <20210507144315.1994337-12-philmd@redhat.com>
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
X-TUID: l+ltZ3u7CKLj

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace a g_alloca() call by a autofree g_malloc() one,
moving the allocation before the MUTEX guarded block.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc1934..9553cdd891f 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -123,12 +123,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     CharBackend *dev = &tpm->ctrl_chr;
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
-    uint8_t *buf = NULL;
+    g_autofree uint8_t *buf = g_malloc(n);
     int ret = -1;
 
     qemu_mutex_lock(&tpm->mutex);
 
-    buf = g_alloca(n);
     memcpy(buf, &cmd_no, sizeof(cmd_no));
     memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-- 
2.26.3
