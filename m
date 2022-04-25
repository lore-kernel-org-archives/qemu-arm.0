Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2214360lfk;
        Mon, 25 Apr 2022 01:27:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+f3go38vAf/sj7cgtbIx6QES6pQJ9XnhKhbemtdX767mzcAb/2EQZ7A1EMy2WF+LWRbvp
X-Received: by 2002:a05:622a:610e:b0:2f1:eaaf:4a76 with SMTP id hg14-20020a05622a610e00b002f1eaaf4a76mr11070669qtb.1.1650875267965;
        Mon, 25 Apr 2022 01:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650875267; cv=none;
        d=google.com; s=arc-20160816;
        b=XVqdGdeOCQzxCaBaDGRKfCZtlJutm7YxaBRhUbmNGW51I82zhTmwYjDAdz90bcfuuT
         DWco+oesFo2YDmCbJFxl2mCTzCvNs7cyX3jZ5SSQg6nC/T307LHFMrSo4xD/FKFTA0ga
         +DPjAsIXiuT9qehz433ESc+VYNBc45PYsJ2/bYGDoaETLnxWfyFQNf19zzR35WxXYash
         IqvTqsDTAzNvcRMlPv77RiyAhnaZ33NQj+rMqEBaXWn0iqgF2clTtWE6OV12A2aZSy7w
         MeHOUKoha4iIDe27iQikh8bbT8il6xxfcDT3MgRnkaWlNgvhfHs+zIhVGuj8iyoWKu6h
         hgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uSjZ4QBWRDNWG4JCXGIx/l5GdZP0dmWgbGQwE/eNVLc=;
        b=TeXecAi07SlQCaeIu2SizpFzUE5c3O4QmvotsN8fHUUtNhMDLfjQrpY8EekFqWbO8G
         2i/gP9qVZcx29n/3gTGyOEeWh71svlG19g1wSPyGAAQUlznv2vJ3snTHkKVOY7868juD
         AE4+uLHN97Oypr71gRYSD++Pnw9KoH4d8H2PpN+9ECH88l/iNZZgDlVR+jpd1R6XRh5h
         yXOCO7tFzh/INgyC6nY/Es1KE03gDX94UgYOG2BDnRKO8x1g0znbcDdaOqIHinyjh9/W
         OSrVXpGkR2Z59sjd9nwWIQ4bDU0uYrI7vvYZCT1LT0rebdWrbmfK6OqV1LNSwm3L+iFS
         +Tpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ii7wxs3a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020a05622a15ce00b002ebc2febee4si4244487qty.287.2022.04.25.01.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 01:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ii7wxs3a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1niu4R-00017J-Cd
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 04:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu07-0006Uv-1S
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu01-0002f6-RF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSjZ4QBWRDNWG4JCXGIx/l5GdZP0dmWgbGQwE/eNVLc=;
 b=ii7wxs3auKd/VMGjuiC5O2/C8wmbpXUNDCabWbPdFK1jzIQIPxYnQdDJNg1Vdb3TeodOk8
 sxuIgF/goo00xjXD8BiDphepmhKsOv4Vxw/zUa6Hg4Qw51mDdAKduN9GysFRlba6Xj3ZDe
 eV1JOyoIFifa3BAXptiejzALAUNFDd4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-0BZ8KRkyO-eVP8GcnBWEBA-1; Mon, 25 Apr 2022 04:22:07 -0400
X-MC-Unique: 0BZ8KRkyO-eVP8GcnBWEBA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so3073953wrg.19
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSjZ4QBWRDNWG4JCXGIx/l5GdZP0dmWgbGQwE/eNVLc=;
 b=GhLoR2qlKnoNFcLCsI8MIeOssOcNp645VWa6KZOLOTyca76ZC+aVhSzLP/mTLzQOBi
 YCgB8OSPMIeguN5bo7dabrgeLoxURGBS7LZKCZJEhR6cpQ4SRHqWRFT1sECltDdIpyTd
 Etvw8to1AHqVpvoZrGK0saL2fGhsZzCGs38cXsu8BNCX1FcLcs7/vVXtT7cW2GM3xfqc
 b1jaSH+G9N/wEMzT+MCo5dDpRywAKF7+HUNGdD/Uvny9TYbwyO9S9NWd/13Dw7tolkWr
 IOVxou9hMJArPBf0FOQtmA60qBbv0+GJCwVSVMLwIgkuEzSufA63jCBluIyOwee/NOpg
 2wTA==
X-Gm-Message-State: AOAM530l19gCUGn/qxBSBhXLnMoSBP6cyhVBj19z3eCsZGB9wuN4kY3g
 uJ8AvrdBgE1RutXb1GdYA4O0am/tU0vqCUMOU6LDoQ4A+PduaqOJqMzZ29kIkazW2P/FQiAyXgY
 wP7S7tx2/Vs5OQc0=
X-Received: by 2002:a5d:414b:0:b0:20a:dc15:bd00 with SMTP id
 c11-20020a5d414b000000b0020adc15bd00mr2725008wrq.136.1650874926087; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Received: by 2002:a5d:414b:0:b0:20a:dc15:bd00 with SMTP id
 c11-20020a5d414b000000b0020adc15bd00mr2724989wrq.136.1650874925839; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 w5-20020a7bc105000000b0038eb9932dacsm7960786wmi.48.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 783A667B1B63;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/18] audio: Require AudioState in AUD_add_capture
Date: Mon, 25 Apr 2022 10:21:57 +0200
Message-Id: <c6e87e678e914df0f59da2145c2753cdb4a16f63.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xRo1BZkrWTAY

Since all callers require a valid audiodev this function can now safely
abort in case of missing AudioState.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/audio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index b95aca444382..97eb645764c1 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1855,10 +1855,8 @@ CaptureVoiceOut *AUD_add_capture(
     struct capture_callback *cb;
 
     if (!s) {
-        if (!legacy_config) {
-            dolog("Capturing without setting an audiodev is deprecated\n");
-        }
-        s = audio_init(NULL, NULL);
+        error_setg(&error_abort,
+                   "Capturing without setting an audiodev is not supported");
     }
 
     if (!audio_get_pdo_out(s->dev)->mixing_engine) {
-- 
2.35.1

