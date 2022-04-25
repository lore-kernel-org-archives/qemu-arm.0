Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2232268lfk;
        Mon, 25 Apr 2022 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUNxFeWgYdRj1JMVg67qNHq7DisJfpWNFTL+3FL9aBOioy8jXCKjd61j8/aFgAlyk2/3q8
X-Received: by 2002:a05:620a:2586:b0:680:f3c1:9d4a with SMTP id x6-20020a05620a258600b00680f3c19d4amr9213858qko.619.1650877678342;
        Mon, 25 Apr 2022 02:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650877678; cv=none;
        d=google.com; s=arc-20160816;
        b=oBHhFP9f9+kisnyRAbpVO5UxJSXe39u0FhegBjChMJZeoRuM3VnCXhy3bNur8eZ5Rl
         ALlQaZ12NzWyN67h6rWvshQQ7XxQua3SXr+T2cmECeMKMjtdKfBU1oiohcNHdQopfhcV
         Yb8Exb0VO/+gmRTA72zlLYU8cOOEKoY6m5xcD85ozcjnNlooDoKSdW6UXOBdjyuKy4T/
         o69U+G2oCSLeyr+7gtgC5nRoSXNE02CAPzuaEiP/NoZra7MgYam/0wp1TddzbXtyD/z5
         ARWW/wE16oviPtVTNhuCY/Br4gbr0zh959k0+UW+qg8x6mhfHVUWrqMzQ7avY/nrxh6p
         yxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s9HfXFFqm8XD3sd/B71lxNFxNbf5q88arJTDKzK7o3M=;
        b=aJ7j6zOgM3qcbq+ttFkXWB3EfJsBPtw1DWSPE1Ww96a16HoAiwQTnbPGec+kq/tFOp
         ybwmETF9OKR+P9/R+7SJI5Hq9TEJRrixWHzOMTkSTzBhkRIEvhPvzfdQX+Tz0/w/7BCm
         zHKTKA9wJmH7LEObc9GYW/p7rKx58sY1bLXDekzL3G7p80Ttq2sSd0+Kml2LCcn//LOJ
         LmvbIPxtgomRDDAzC7GUiWh7k7N+miOn0qZDX/R/SYXDB9wKXjy/ewqqyqqudbcmzMXX
         9HVCWvxTBq1aawlLgI2zYN7herFjWM/a6oOZdoTIBxFj3x7U574ZwUbo7cDo0KMfiMLL
         lqYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="WSX/WBoy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020ac85b86000000b002e1fbf3beeesi4473858qta.223.2022.04.25.02.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 02:07:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="WSX/WBoy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1niuhJ-0002Qj-RS
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 05:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0r-0007KX-3P
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0p-0002rL-32
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9HfXFFqm8XD3sd/B71lxNFxNbf5q88arJTDKzK7o3M=;
 b=WSX/WBoyT49aM7NxGWaYTwWRcCKJn0Hsu8VNQz3oFBcTox2mhtg/6l4INFWnNeaceXPAQB
 NQhBRU6Iu4DJ8f/KtvkG5hZTX9XyK8da7FA7hR4yJKdd3i78ulq7TN6ETE0QfBaYTQ6rRU
 In0QEOpnDjCKflcwK4W6gwUqiKvJ/zU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-hED7U5QHNemqZWm8fXi9OA-1; Mon, 25 Apr 2022 04:22:08 -0400
X-MC-Unique: hED7U5QHNemqZWm8fXi9OA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g13-20020a1c4e0d000000b0038eba16aa46so6862150wmh.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9HfXFFqm8XD3sd/B71lxNFxNbf5q88arJTDKzK7o3M=;
 b=CPM7/6+1AdlV9KdMDHW1/x5YxM0YC1nZmKoQFMZ97xT5pF2qmAqnC15nogF4Gierzg
 +BNpuPgjizVtQ8nBfY1AqeNN+LGWqI/I/EfNbReFhwIHOatebBYP86i0dbjgFNoezlDf
 cqNO4QiYok+TkGS4e9MEPhR+Pj2cjJQ3NaF13cG181Un9pyfe4BNlSPsuH4MUEXortIz
 si3W3E4NtU3EKValZp37qpFTLsEOh/yTpaJ8Mn+i1bxAUK4QAdVTU6XX8RDRBKWQUU5o
 QRmzZh+H3HwV9rjxlwwyCbNPxTePtAX8mdQqKZMowswcQRum+XK7N7dekNK9I4Z0i4VK
 CX0w==
X-Gm-Message-State: AOAM530SQVp87RYT9Buj/hvCrDQn1rD1rXB2bepeQwoMQrt6oZVwWYo0
 k+bvairX15e0iLPt2H17smam9T9CvNmPGN4zfiOBi6gcNQlS5hxadrAP2bLyhbbDPIHsW1GD2ig
 BhJn/MX/SSBSrmFA=
X-Received: by 2002:a05:600c:500c:b0:392:b12f:40a with SMTP id
 n12-20020a05600c500c00b00392b12f040amr15318845wmr.122.1650874926858; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Received: by 2002:a05:600c:500c:b0:392:b12f:40a with SMTP id
 n12-20020a05600c500c00b00392b12f040amr15318821wmr.122.1650874926684; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056000186200b0020a7be3f1d2sm9949427wri.53.2022.04.25.01.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 9C2A067B1B67;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/18] audio/spiceaudio: Fail initialisation when not using
 spice
Date: Mon, 25 Apr 2022 10:22:01 +0200
Message-Id: <5db1fdef0330f20ed6ae306b5a71dad1b5e9b44c.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CRQ6yLZItLk7

The caller would already fail, but this way the message can better
express the reason for the failure.

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2043498

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/spiceaudio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index a8d370fe6f31..fdbd7dc285ad 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -74,8 +74,9 @@ static const SpiceRecordInterface record_sif = {
 static void *spice_audio_init(Audiodev *dev)
 {
     if (!using_spice) {
-        return NULL;
+        error_setg(&error_fatal, "Cannot use spice audio without -spice");
     }
+
     return &spice_audio_init;
 }
 
-- 
2.35.1

