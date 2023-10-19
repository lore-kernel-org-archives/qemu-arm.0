Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp803016ejb;
        Thu, 19 Oct 2023 14:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1Q4P5OBpafH+1mFjnM2iYl+0tCoroBLPEF8+ixsOEi9CgP8OMFj9y8nKMCXCKzrzJh/i1
X-Received: by 2002:a05:620a:3728:b0:774:35da:75ac with SMTP id de40-20020a05620a372800b0077435da75acmr3976754qkb.55.1697750745375;
        Thu, 19 Oct 2023 14:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750745; cv=none;
        d=google.com; s=arc-20160816;
        b=pcf9x1u/1Ze1E8fTePp9WWRB1V0ruywH3nE0hZIPsPgyNnF31mnZIGGQFsTTdXmUF0
         chCS7++Gda5NpPuqD5srQ7lOOw894FGVAWv6FJaRosYhANfwveJHsy8OSZ8tyqQyIfGT
         8zrLaNS2LTH8b5kXKelwuQdBz3CQkq/tEG5BgFyB876D577hBFbpkNjBalqGtI8XHoVz
         sJN08xxpN3FytEFP4SwXqWbKF1ZPBMCv3OHuT+g9FCYbufIXFIx8dBBRAApZihLG7nwy
         /weMHYNoOOWDG2jDbgR0KBE17w+0GX/X5qX874EgomoMRSCp0i2M781Vhq75sXaQEnKR
         wRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nv3oXKxb944zUzl3WXXH7IJvjD+TPF87yEqv4BjuzRw=;
        fh=xpOvQqV4QvwdzK3O+/SB3uc42SM/PHqvazLR3cdZTdE=;
        b=mz0h+9p3D5K5CbB9nhAsr7/wlri+5xt4ubo5pdmmc3KMsFpKUzjOXnfKouznKg/AU0
         MKp2ElRyHwdHLdSzLZ5i/M2yeCv/HqfkP9qB2HbxkFu9zLwwbMc0WF+U7Ys1f6TmA4g/
         lsJF4j6osAuJU3GqT1KJF9g7uyf3qIxjFxXLatvHAe20fqbyvOZvjkpxE9THI55OfNTm
         7FvTEdLSlgCYH9koBEXHG5x0muTlKrBSyJNDJcZcUHkMIlMP1WKoSfOMIAVi/e2t9udi
         qEn8olpLwSMnOcZfGo6Qr9nM7aBe6GWjrNSNwMk7sxQ/9gKX022bs513bhpyNVJ9qGNb
         S/fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeRAsNlf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020ae9e708000000b0076edc6ca0afsi261859qka.172.2023.10.19.14.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeRAsNlf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaTw-0005wI-DH; Thu, 19 Oct 2023 17:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTu-0005r5-Tk
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:23:02 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTr-0001cC-RD
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:23:02 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so1653571fa.3
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750578; x=1698355378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nv3oXKxb944zUzl3WXXH7IJvjD+TPF87yEqv4BjuzRw=;
 b=BeRAsNlfvYPxkzMfcnN/gLLY7KvJNgc8/5ESA9X398IwnjspAJ5cH81GiPRahC7nkA
 sucAqtNMiSnJf7ZzfjqROmf2gQaRO8SFP5xTLHoobsbcQsqnBGxtGde2Joy4B9avEsJD
 lr0ijXUar0+tIoHWx239B5A2gTpVgW9uoQo2g2WQaVWqsr6RVFH2LHcW4YpDXmsBQGkw
 RQ2T7ubeegmpq4lrNJ+6UQFa7eviyXzar6UKk9ZNjUC+TFyz5v8o/quU1YjVyv66PB4m
 0rqzC1FDBPloMjXYsWfds0lW6pIvZ6buqXwmrJYazbob5UJD3Zaty16GfDcVRGebPzEP
 5RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750578; x=1698355378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nv3oXKxb944zUzl3WXXH7IJvjD+TPF87yEqv4BjuzRw=;
 b=C9gfNEZHQiqGF5lIRzVdsvURo/Bcz76xbp6/OCUOIqu4jajG1NpjYL6vE2xTkNclLZ
 EoERfHmoR9HIwq41iE6mGV/upA76NQXESIzHf5qIh/tRPJje3lOSAfheKneF0TBMQklp
 fz0JJH3lCrACV0RPgkfoWyLOfwqFJ3aXf3/p5Ri+DLQInuTu07NBEgQvbyTKHKBgfWNW
 x+9Zg65/ZqwWGcTui29+RuLCPcPLyb+fSFBXiDqZpuzSy6uNskrV5mVXZjK+wUbPpFo6
 Fhr4yuZVhBUFz4DzKp6pnIqlDnvDH2nHyFmVFsDIItlx+q0+ZAD/mzLSeBxc4rqoobf0
 C8qg==
X-Gm-Message-State: AOJu0YyE9ZVChnAyATPI5cxIQCdlVgWOl44u7V+j5Ca0EHi9xkPxd7Xg
 DRTqogOmiEmejDW5qRMq3Y1zVG7Q9q/MaFJW555NcA==
X-Received: by 2002:a05:651c:4c6:b0:2c0:14e2:1f5c with SMTP id
 e6-20020a05651c04c600b002c014e21f5cmr114228lji.5.1697750578071; 
 Thu, 19 Oct 2023 14:22:58 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c488600b004080f0376a0sm497964wmp.42.2023.10.19.14.22.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 42/46] hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
Date: Thu, 19 Oct 2023 23:18:07 +0200
Message-ID: <20231019211814.30576-43-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xb/y8uRT+iCr

Access QOM parent with the proper QOM VIRTIO_DEVICE() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20231017140150.44995-4-philmd@linaro.org>
---
 hw/display/virtio-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 6efd15b6ae..4265316cbb 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1128,7 +1128,7 @@ static void virtio_gpu_ctrl_bh(void *opaque)
     VirtIOGPU *g = opaque;
     VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
 
-    vgc->handle_ctrl(&g->parent_obj.parent_obj, g->ctrl_vq);
+    vgc->handle_ctrl(VIRTIO_DEVICE(g), g->ctrl_vq);
 }
 
 static void virtio_gpu_handle_cursor(VirtIODevice *vdev, VirtQueue *vq)
-- 
2.41.0

