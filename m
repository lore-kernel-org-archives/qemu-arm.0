Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802366ejb;
        Thu, 19 Oct 2023 14:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoQvdetWyopxQD3NUT1/Nz8kUaeGi+ayR6VKuO2BTRjBWCvKCfjTQb30AsnLBGZpuGfq/i
X-Received: by 2002:a05:6214:d4b:b0:66d:65ae:18f6 with SMTP id 11-20020a0562140d4b00b0066d65ae18f6mr85080qvr.50.1697750662921;
        Thu, 19 Oct 2023 14:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750662; cv=none;
        d=google.com; s=arc-20160816;
        b=GdMKcbnRPJ6SqIVATVLrlbcHd6/mUq+KlS1aI4qvEWL0zm2ApHGzCjAoJ4hbQMoHmn
         02BuzY5M2Bl6S80nfx1be9Cqr8mK2re/DFY1NFC5Ilu9DBIKWDqYRub8Vw0Sm2L7lAZV
         9ToovDVhbdSxAC3AF8jrh3PXRhiOrkt1gDC12jAB/sMUjwRJ70p7Ao5UUZ0X8/ia2v4u
         W5jKNdzEdDc8HGjQP17NZ9q8EF6va2CcryfX2ojCntqdMT2AAcdmoK7G4kGbhwIDUppf
         6V9Uuu1PmX37jUHLQm2Malb4Crxu8LdXCdeNiVGQI5SvDQPKXOlIucMCtJITyedcLTA2
         t62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EAIq9fwE+HBUXOdrKkuK6NI9pJuWSCDleAybIfCpGM4=;
        fh=PURj5iNFTT2Ys+ENrL2QLsGUVEWEE2wiUjVhZOrMPtg=;
        b=WKzoiKJufDAgA5M0tzJexYHNioHGizEG8b/NEQ42WL5TYB2685FFXS2mCrX8W7DJ7/
         bfAwBk6gcRINHVszhNxwPIWsO7TIWAilsJFtJfZhHw1pazxM3Te1tuR8LDSMrlmmqrTg
         RkpVlztA6/M0s+Do2E/aFnyKTQ6D9Vd4z7TFDV/kvtEelngpgSVGf2b42NtcI1NW0pVN
         eEnaNPk9/J21vCsb/imBfxZnGQgRrlmSBBr1ZURgEbe4gneOLD9I2gzaQMiYa4Soq1D8
         RJVCTDb21ejF2C08XUdzWDBYCgC4zNqg1JAYwQI9OnluT8HAC+OI/RABMeJLNG7jkPMD
         u5Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSuRZZvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nh12-20020a056214390c00b0066cfbbee518si373860qvb.389.2023.10.19.14.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSuRZZvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaTn-0005Lw-U1; Thu, 19 Oct 2023 17:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTm-0005DB-VE
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:55 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTl-0001Tq-5B
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:54 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c5210a1515so2159421fa.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750571; x=1698355371; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAIq9fwE+HBUXOdrKkuK6NI9pJuWSCDleAybIfCpGM4=;
 b=PSuRZZvtf/+4cQrSYMjvDM7kQElQpNV6uK/avnGzAbJXwrFDiC/Bci0nSzsV4LZ7I9
 HvFD0mnHWN9n1hwMYcZV2+KXQXpckSyFWtYVgDwMFTiRTCFcEObeofWY71IBZ8gyHAHJ
 d4oMjjLWAPhR5P0m8PSD8pc7MLwaRHejZZLUC7uc8QEkhOGgIEUPpas5qGw9RaJL72S0
 NslZa95f99EzPUheeKs4KVE++3HCDB/6p9UJRR2DXnZSKGUg+qKJSGzNnHwhqHsPjdXU
 mQ8wGxzQsYSphPom14JxSufvIh1PIHI5vBbnpn6kk4cwWWsEvIGx/ewz7OsfPMlU/iIx
 82cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750571; x=1698355371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAIq9fwE+HBUXOdrKkuK6NI9pJuWSCDleAybIfCpGM4=;
 b=NfbgduMrK2TY3As45r8gzRSndVn81CyMy73d6dTke3UlMAj8MXEW0tEKRsBXQhYkjC
 faDFq2h/FNeyHDU+mgLIYM8aNQapNSFDPwlFpxI7eTpm9QhzgETWZID4VUW0fenZJwnL
 0EpjEs996klj8k5pBhCflhJgA4RYtbyGeNR39HjTYPEP+a5NeO4auJsPNUl7nfM/NxsY
 4Z99s82d6Favg4Zi1hvaj4C2T3fbKbuWAV/wvO3wo2qqIRM1LPiSrnnYWJVm1cINalbY
 O8uZejPPg0+w/rUIS0TAWSFfEK0pRMj2AWO88YJsS6spa4Uqe7rDbFryUpXzobCx1PZP
 WlVQ==
X-Gm-Message-State: AOJu0YwTBfL4jy1GkReCqVlH10rqcNmaWCJRw0X8n6RdVlg9Us9W5pjD
 S744hyJAMp7r3mip7H40W/+s+w==
X-Received: by 2002:a2e:3a03:0:b0:2c5:1482:719a with SMTP id
 h3-20020a2e3a03000000b002c51482719amr133394lja.21.1697750571533; 
 Thu, 19 Oct 2023 14:22:51 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c150c00b0040586360a36sm5254311wmg.17.2023.10.19.14.22.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 41/46] hw/block/vhost-user-blk: Use DEVICE() / VIRTIO_DEVICE()
 macros
Date: Thu, 19 Oct 2023 23:18:06 +0200
Message-ID: <20231019211814.30576-42-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q8XQD5LKmEzt

Access QOM parent with the proper QOM [VIRTIO_]DEVICE() macros.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20231017140150.44995-3-philmd@linaro.org>
---
 hw/block/vhost-user-blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index eecf3f7a81..4b37e26120 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -405,7 +405,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
 
 static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
 {
-    DeviceState *dev = &s->parent_obj.parent_obj;
+    DeviceState *dev = DEVICE(s);
     int ret;
 
     s->connected = false;
@@ -423,7 +423,7 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
     assert(s->connected);
 
     ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
-                               s->parent_obj.config_len, errp);
+                               VIRTIO_DEVICE(s)->config_len, errp);
     if (ret < 0) {
         qemu_chr_fe_disconnect(&s->chardev);
         vhost_dev_cleanup(&s->dev);
-- 
2.41.0

