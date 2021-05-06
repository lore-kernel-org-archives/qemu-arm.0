Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1271777lfg;
        Thu, 6 May 2021 06:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPqStyN1Q3IqGBIE1cbAA4jsMOINgPRUqX1hFDz4PyrI7tQDBUrdPFdj9RA5XP2Z6fziSC
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr5190145edj.178.1620308288915;
        Thu, 06 May 2021 06:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308288; cv=none;
        d=google.com; s=arc-20160816;
        b=bTwzSTu3ZQEEJNb1R+3c1u4Ka/fg5VzIeKHArsB88FDve9v60rRzKl1uF5Bl3yxoCs
         YTpdLHaCBUI2Z5HQp+/j3NoufTX/gISWcX1QJvtjeR64QGx2zNuCk5vTsqz7gHyg8xZ/
         nkFKOX3Kfj5GrFf6/iURS2H7ChcPzMQjVchd1Hp9Myhk2cV6A3KsHvKqH99IRiXU8CMX
         XqLF9Ya2mc+DCa6xjH+B7wLFTRnG8hP/nAcvabBxiiihvnNKqHFGm4yot9ARG1wd1bbV
         IuzzDD/QcXd5SdNUFMFLcgHRJKr79nB77mDFZZjR+o0Wuy0PiWPNf90A5134FVHxJtj1
         ZrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
        b=OYlgkZHoZiH9fFSDp2vTicLpbzlI03d7lx7GaASlGoG1hD9DhbMmecDE+hGlgrd9cz
         0bjvIKNymoIeD9p4QuwgXJ95YyMAvMp0/nvvW/WqnUyfqVDGz4e18gapOGJ4gvbarwNb
         y9r0wwEfudkH9lHv6W9Dkln2oUn1HDZMKURRedemCMtIKw5TIVnGYZUnTy+fnB0PSOvY
         JLSHpFbnIJBrGZ5I7OIQQuzLZimfu9jJycMXWmQFwNzeMZXMR6mPaokXoHZbC7n/bKd+
         fpPI/xeij4PHGBKIU4/dmta5Vs8g0fwiVpc9fMV4bAa6HBMAEXcJIhMeAsukSBp059nS
         1xgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q+aNczE+;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id a23si2305906ejb.73.2021.05.06.06.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q+aNczE+;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
	b=Q+aNczE+ZXpk5rNvlxZwcF4Xg9IKTQDnOESm5Gw7aAc1nWFeXLqn/B3Eoxo3Wj4rMEZaKB
	HrObmC3eyqtV1JLnqR94IoLYztFe18fBUQsG2HXBHxWvc1vr39owStWZolGsDXEppw/Ggg
	CLMfzsrABUaT0DXcPj9obCs2Te+NyvM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-lbEfVOXANBySPo1jM7t6pg-1; Thu, 06 May 2021 09:38:06 -0400
X-MC-Unique: lbEfVOXANBySPo1jM7t6pg-1
Received: by mail-wm1-f71.google.com with SMTP id n9-20020a1c40090000b02901401bf40f9dso2686038wma.0
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bdOhY3sBOcIHJeoCe6CkJ1QfZvAaT12hvfPxmFulM0=;
        b=KiWu5XikVIRgT5xVAoqLDb8mbpWR49gZfeL5iEAueLBuEkWrgYsiNfqasyKhleRYFA
         4tVFgu9EWcs3RVRQvkNCynLIYrObXN4mD82/GnIAqUsYOIGpEW+Dgj8Y+1OT4OhgjhGL
         WhSP0Jau0slJwfvuhdrqWoKFydq1ge+V08Je9tvxOmx4uBdFLiL7TaRgjhovKZgooJ6u
         nIs9bwxebNhA+8TNAHYCwDKYoC98nn1SHkY+RyeqdxmcaedhYqjagPGQW4SAQzNsVnpv
         PdgFCu5qlqmg/eNXiMq9ZhCBgVEA49OXuDah+eIwLMBeErZUjh+UU7ztPczRe7S5Ei31
         UXxQ==
X-Gm-Message-State: AOAM532KJF/3MrvM8HWwhXbNnh78IKLeLgAGlHHbwJ7UGLRRHbwI+dcN
	K78P/PiTcP8L84XIBkvQxDDMl3MUa4Oc+f2dO6xOdRM0vm+0bqSaKDg+xMVy6m9G0TI7q47vE3p
	wIfz/rvTzLlDhMUPz
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr15231208wmb.3.1620308285136;
        Thu, 06 May 2021 06:38:05 -0700 (PDT)
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr15231189wmb.3.1620308284991;
        Thu, 06 May 2021 06:38:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id o17sm4231200wrs.48.2021.05.06.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 1/9] audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent
Date: Thu,  6 May 2021 15:37:50 +0200
Message-Id: <20210506133758.1749233-2-philmd@redhat.com>
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
X-TUID: dkzLOVBO9YX+

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
