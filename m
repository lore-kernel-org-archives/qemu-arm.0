Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451598lfg;
        Fri, 7 May 2021 07:44:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe7uu9zul2FJ62QBEBsiZD+eAUOCU/ygu/T77/UK02y0dUZrSX0u4pqS8imB2S7PTJ+0wN
X-Received: by 2002:a17:906:2c55:: with SMTP id f21mr10722318ejh.41.1620398663765;
        Fri, 07 May 2021 07:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398663; cv=none;
        d=google.com; s=arc-20160816;
        b=m45xW5xn0RRZX43ggCINQk+cP5bs/RuXWXjMx9+tKULoaMPL8l9U7w5sAOPFtgxXRG
         4FWreZA556hSwh29odAwk7LGrvONmw8kOEhl/ul+hv01GaYWd8DUbCWL491pKSFmlgLC
         JtD0llkesio4KtphYyZFhHD1jqgLw4g02andAsyY+p0Wf7+CeDDtIIS+wHxNHzCVla7j
         bF6P29g+tw/7wNX/FwS+i1PrsFiU4SmzIN+LeWW5DY8IqvuiULFO+2G7SZEjaQi4yUDs
         bAYzzO6zglfX6iGcb52U6aJBKbYVaOwsf+S7AnjA2YZv58xlQb9Fupy0Ixxb1FasV53n
         C20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
        b=qvQbgchNZAUFYPBDJMoJljE5HbyacFTf5+44EPuTAFd+ZtFZ538LuS/YghBORwmL5m
         8Gsh6nsF3kL+KRWdJc22MqXyPeBHQhhOR4ED1vcT/bVkIyyEQacO5zfAyeYXrw/Qtx3B
         p8c4gMIOro/U01Td49znJG8Y+fsjrVNP1p9PNaB/dkGD/8dJeE88ZEC9M9OESWcQW5En
         HvXoVJBSJgR/sOO4bKAW25+n+SRaMUIkUYSw6Gm7eYFQ6QS5ghJyFNu25y5DrKbF1w5q
         QILJ6f6qk7C2YO54b8cmSSWcz54MJVGYqSrIxDpSp5Yfj6kkgWK6k1WQ/58Mb9JR6OAP
         vNIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FxMc7nsc;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gy22si2256911ejb.663.2021.05.07.07.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FxMc7nsc;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
	b=FxMc7nsc5hVkc2bf1iDakhYnkiE51EMMi0wlZuOB3cImBXeHtxgOK+afXgMowFer3Eg5jF
	n+y5UtntiZSV91TLdzK+8aUYyvy8BvgAdFlU0Ys5sqetRbkxkvuWcocOsp3aKLjzEjBHiW
	EyYoJuUJoXV3XDtw1COT2M6drXh+3O0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-ZVJRv38ePxG2Hyn_QSL7kQ-1; Fri, 07 May 2021 10:44:06 -0400
X-MC-Unique: ZVJRv38ePxG2Hyn_QSL7kQ-1
Received: by mail-wm1-f69.google.com with SMTP id s66-20020a1ca9450000b0290149fce15f03so3986698wme.9
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
        b=i8gCzR8MXYK10lklnxfIjHLKLeO4zu5A914Vve8hGw2VLDRq21Qym08ys3FMPH4BNo
         pVm2hdjuqSxF4JqFX1+i9tWkXzMcye3SMxTWJXVuSdE5IGo9KQp/s2ja37F/GpD/SuFa
         7q7AVxSctyV1zPxnRmXFFN5Fc2lkgqT8tRcQzEmpqyLUQAxcjCSZQ5J4MAh5NUE7lffm
         Vpv3TEVvUxf4zY1H5Kiz1zu1JWF+ZswrcUGJfAZvF6gO853l3xn+zkdGWVIKSh+AhfFT
         ZrQtjCWFf1Xgdnsu4OkAGRv16oaOt73sXiHp9I+HaOMPvG+PPo0x+883rbksTRZAi7mu
         X10Q==
X-Gm-Message-State: AOAM532xRljn8NUgaEh/b8T2IE09yd9Jw3+BRSQI21CGQlwVnsBMo2t3
	iAlPRyFuKYLbrmDm2vfolP74yw9GDX7h4kC0KqmN70ASGHRyvvUQZRQ5bA0Ej+rkqKYMx/ctSgd
	D7MHaL6I8Ka9IkiCX
X-Received: by 2002:a5d:4a51:: with SMTP id v17mr9368903wrs.259.1620398645500;
        Fri, 07 May 2021 07:44:05 -0700 (PDT)
X-Received: by 2002:a5d:4a51:: with SMTP id v17mr9368879wrs.259.1620398645319;
        Fri, 07 May 2021 07:44:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id r5sm7924414wmh.23.2021.05.07.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 10/17] audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent
Date: Fri,  7 May 2021 16:43:08 +0200
Message-Id: <20210507144315.1994337-11-philmd@redhat.com>
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
X-TUID: AEA82z+N5Jtc

The ALLOCA(3) man-page mentions its "use is discouraged".

Define the cleanup functions for the snd_pcm_[hw/sw]_params_t types,
and replace the ALSA alloca() calls by equivalent ALSA malloc().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 audio/alsaaudio.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index fcc2f62864f..f39061ebc42 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -70,6 +70,9 @@ struct alsa_params_obt {
     snd_pcm_uframes_t samples;
 };
 
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(snd_pcm_hw_params_t, snd_pcm_hw_params_free)
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(snd_pcm_sw_params_t, snd_pcm_sw_params_free)
+
 static void GCC_FMT_ATTR (2, 3) alsa_logerr (int err, const char *fmt, ...)
 {
     va_list ap;
@@ -410,9 +413,9 @@ static void alsa_dump_info (struct alsa_params_req *req,
 static void alsa_set_threshold (snd_pcm_t *handle, snd_pcm_uframes_t threshold)
 {
     int err;
-    snd_pcm_sw_params_t *sw_params;
+    g_autoptr(snd_pcm_sw_params_t) sw_params = NULL;
 
-    snd_pcm_sw_params_alloca (&sw_params);
+    snd_pcm_sw_params_malloc(&sw_params);
 
     err = snd_pcm_sw_params_current (handle, sw_params);
     if (err < 0) {
@@ -444,7 +447,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     AudiodevAlsaOptions *aopts = &dev->u.alsa;
     AudiodevAlsaPerDirectionOptions *apdo = in ? aopts->in : aopts->out;
     snd_pcm_t *handle;
-    snd_pcm_hw_params_t *hw_params;
+    g_autoptr(snd_pcm_hw_params_t) hw_params = NULL;
     int err;
     unsigned int freq, nchannels;
     const char *pcm_name = apdo->has_dev ? apdo->dev : "default";
@@ -455,7 +458,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     freq = req->freq;
     nchannels = req->nchannels;
 
-    snd_pcm_hw_params_alloca (&hw_params);
+    snd_pcm_hw_params_malloc(&hw_params);
 
     err = snd_pcm_open (
         &handle,
-- 
2.26.3
