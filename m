Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1271953lfg;
        Thu, 6 May 2021 06:38:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8hOpz59jtVYmPcTW6srtmACuUwMxxiEdr+b1aGp+EtTqnMitsqvwLWXggpW3MSIV+xySC
X-Received: by 2002:a17:907:948d:: with SMTP id dm13mr4137288ejc.180.1620308298822;
        Thu, 06 May 2021 06:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308298; cv=none;
        d=google.com; s=arc-20160816;
        b=FT+teRQuxggNh6U4QJnsSbnfuanAHJY355TN3zwJVit0pj05Yoy7J+DsvDBYvOCW5g
         LhSvvgIdztlBLHmb0XIPyH5S9A7/0B2ZM61Zwue9uRfFxx9TUZu3ok4aOsbkTNKAHPUU
         dUyVDrwTA9cj6NyHFObNAT/7uLZyWQPoGJd6qKTAVxuYPWl55s31TpMr+WL5mIqWwmvb
         K/QEMNBrDxOWQgDxDVbBD2RuohuHDG0lDjJZhIjhSFGPDAXdx83tbgHO7b3PP0e5yxMC
         cTO0NCKCugJe1jrU8j7MAiVnXQg5oequbhek3ZNT5DouhAmD2S+Ybctv7HWSfEWNa1Ni
         MAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rtnD1U4zAjjBX9oA9uBgg0xbiA9djz1nnWZVPwnN9No=;
        b=nUI4lXJOFtegsvySVq/RLy6jmZzO3FlMVs0OIqNXkY/M1LJy/wYPUv79HQxj8OpYmK
         fHJD+wemSsH3J2kZzl6Bo2zOyMK2X5RrdrcdmL0JXrIqrM0/Acu8sBIo9ftgrXyvj/Je
         rRUwm/4PSG/uaOm2AcyFyOQEvojYpKWoI3VBbsMJ7KbQwHqbqRVYxDsWiI3jZg7W2ilu
         UWHlTBN6aemn/B9Pe2DbFgVbvkYKJviJ7twqZEtfRLSsSBML83xVMIEXnbeWfCP4DD1j
         7TSsfkQlOQo3EOU6ZJ+u+diJs/mQMIUMwBOukpw8FOPx7vF0VndydevPpQJnBOwKaM9F
         NLWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCTTW9r2;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b3si2193180ejc.453.2021.05.06.06.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FCTTW9r2;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtnD1U4zAjjBX9oA9uBgg0xbiA9djz1nnWZVPwnN9No=;
	b=FCTTW9r298Zd1wevlxcFi5fozFOlgBMux3+1mbxM4ET4OCScukRNbCGgqckgNef+/QR+KQ
	+/kAwXSy/8DTtxM7bXyq+jpkPZUr2hMx6hSCNfk6O7OM4abQp4YmcFJKG1m67k6B4g1h8o
	Z9FcquKUJ1/Imw3ZmCyEREgoI16xsZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-mAZrGuhEMbuTfdO1k_tzPw-1; Thu, 06 May 2021 09:38:16 -0400
X-MC-Unique: mAZrGuhEMbuTfdO1k_tzPw-1
Received: by mail-wm1-f72.google.com with SMTP id l185-20020a1c25c20000b029014b0624775eso2674241wml.6
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rtnD1U4zAjjBX9oA9uBgg0xbiA9djz1nnWZVPwnN9No=;
        b=VBlqPIjP3MxW1bofSAZA8w6vFIz7Ml6E8rdhkmrtby8H+ojxCTz4FWdL4kOuW0YPBD
         zmKpCknE9p/hf/xKpon5JQW6QpUroEPE2DEZ0j0CyJraP3hdMZbd0eIGrl6qR68XcALO
         PkxirINqu6ILUqjIP/HyJClgU9u+/khwVBNQ4lvG73wS/2ZYItmAU2dwBAU7RfPgE9ZW
         l8xaPzmOux4WiB9V6wfBIQJYcmkST1dcDOqEejMZKrNW2A6RJ7kf7a42CvGm5JbT18zP
         WT1dYfHdW3wyuJocrc9Kqt846C/laqZ4Ln95tzqPrLLtMCW0EQWuYGfk4Ogpg6hnBFFJ
         hJ7w==
X-Gm-Message-State: AOAM531Z3po6TCnklfpc+WsfGVpZk8j/Hsrvw9SjTfxhyc4BZKrsl6J5
	CQEe0OHHYYgPFpWYp1C5i/C+GA8r2zB0cPnIKA5yYYNrIN6YoEEBsJv3ZIT3Bpde3PmW65znbVF
	mnr3uskHfnomqGsA7
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr15033740wmf.145.1620308295092;
        Thu, 06 May 2021 06:38:15 -0700 (PDT)
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr15033720wmf.145.1620308294899;
        Thu, 06 May 2021 06:38:14 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id o15sm4312755wru.42.2021.05.06.06.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [PATCH v2 3/9] backends/tpm: Replace g_alloca() by g_malloc()
Date: Thu,  6 May 2021 15:37:52 +0200
Message-Id: <20210506133758.1749233-4-philmd@redhat.com>
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
X-TUID: dI4zkpPcCDFX

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace a g_alloca() call by a g_malloc() one, moving the
allocation before the MUTEX guarded block.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index e5f1063ab6c..d37a6d563a3 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -124,10 +124,9 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     CharBackend *dev = &tpm->ctrl_chr;
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
-    uint8_t *buf = NULL;
+    g_autofree uint8_t *buf = g_malloc(n);
 
     WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
-        buf = g_alloca(n);
         memcpy(buf, &cmd_no, sizeof(cmd_no));
         memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-- 
2.26.3
