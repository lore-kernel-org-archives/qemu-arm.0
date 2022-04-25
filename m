Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2219149lfk;
        Mon, 25 Apr 2022 01:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX2RZkwoLXy5NlLx6ArD+JdgY9vLAEwem+ynDr+8DGxA5M9EOY+Sq7tsXSl7vjCfIzYR1Z
X-Received: by 2002:a05:622a:509:b0:2f3:6abf:cfdf with SMTP id l9-20020a05622a050900b002f36abfcfdfmr1435507qtx.679.1650875921902;
        Mon, 25 Apr 2022 01:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650875921; cv=none;
        d=google.com; s=arc-20160816;
        b=sPpk09gr5zpdg1NhBs1YczA1unVaUq1wQuJ2UXjFKxl/oQ6L+knAVBsGnGGoiaRaTc
         PEpkfOVrYrgMR0yXisX2wpr30siBWg6T6Q5QGW7CjW0YkSSJmb4SdzcJAiDZGWLTvx//
         ZjE1dA5Kz8uQvxXLAfVrKb6OKCY+lSlLbTVgM07r2X6jGvIhNfppUiknQLo+gISVv121
         Rg/tAz9FTmnqZDj+7HfT+8BlRBAXg/cqIHGRsE2MSakUHqKaRqlGDJ9SiQsJrqREpei0
         gdoaAPvwwRfPMcEXVVwWMPEv6/o83To0eBy+lMnF3hSB23wrR+xLJymfk7Ez3Bs+ktEa
         cOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gedXaEU9mdSzLcQUY6OVe9Xoeu9dbw5uLfUiFLxMZHc=;
        b=B6a0g2RhAIt667rgQKCFN1YKTnxwik/bfU30eNLDo9tWF1/cNsKMPHHuAC5VcRmSuB
         iinqt6qLvAd4jVTmWFi7V1lbrpXOsaG8/2aVdy5x2USjE4Inkw7htVYFVcaphVzvAX2Z
         MlkVQcgjqKwQg8PukaNrfLJw/rysJL+ZhPvld7Cf8AibR/U+pEGf5TG50Va1bKQqXdm4
         omuObSHlwq9oVYg8HLuU7rqy7NbPwuPRkhFBHiU0vA/xv7TE1itKppWVyIAbJ7RwIAqn
         3ZfJQax/xu4lA9yJusAzIP2akSsx0swzAZDduCL0gVUgCrtHwiCuydsXuBVtl7ZE5csm
         duiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QplVIMD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05622a04ca00b002f1d2326dd1si4680193qtx.170.2022.04.25.01.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 01:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QplVIMD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1niuEz-00019u-9s
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 04:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0B-0006am-Ja
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu04-0002hJ-Lc
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gedXaEU9mdSzLcQUY6OVe9Xoeu9dbw5uLfUiFLxMZHc=;
 b=QplVIMD0JjH8T+FGu6+Q8ozaqnyYcz/yvg4IbvFYo8phlm4gSdG0Ne8UOEq+Y5cyzm3wkF
 hfFPugtMtdUMNmuMg5/L7fAH7/ZJ+OX2b9R5ytiWZqGChSDvZ5kkvzQfu+LAEcQCDvoRUw
 /r9N0eQl1ScCBzNg11KrObhbwcU2hyE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-37EaWVsUPfSusEPoxx2Hng-1; Mon, 25 Apr 2022 04:22:06 -0400
X-MC-Unique: 37EaWVsUPfSusEPoxx2Hng-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so1766541wra.15
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gedXaEU9mdSzLcQUY6OVe9Xoeu9dbw5uLfUiFLxMZHc=;
 b=NCo8vIUiCPjJauPJ5OtFyFaloKTNqn7iUO1KYKsiagIwHc6yMdcGU4yUggJmMdE2tG
 oOB1h2diOQSuSIgz7EFhKIFV5ye/YHdKj7dUv05h0dn8pN4nEUzdQxsFnfkIJdCzDcZD
 lRrjK+e9GinNWawdL+q2q849VgAmgunUnLjYgMY7c7MyRtk6Wz0+7OV2aYQhlhq3Pk1D
 3WWaU09B8hbeHIpOq/HhPthIOSl6zKWdqUezjQIdAruTXq7fwEDRVU4+IGWb9Jaw3gKP
 UtHTGLXKVIZEuHwAoLnM4Wps9DGNT7z2UEFgfKwDIz/eKRWOLsNtn2FJpAqPQFJSHxPm
 Ne+A==
X-Gm-Message-State: AOAM532RLkw3L9BL4o34DkMBcIJLjPUOentQWNVGaJstuqFQp1vS280z
 xRb7d7aj3Ewmim6iPBwY3YPdgqWivgyGSzMHPz3sXlUEAe1ucj4BOpkSVb/4ajxOkFHHSUeA95+
 0k6w4ZPV1DK5VFdY=
X-Received: by 2002:a5d:64e4:0:b0:20a:e005:cc96 with SMTP id
 g4-20020a5d64e4000000b0020ae005cc96mr708538wri.402.1650874925637; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:20a:e005:cc96 with SMTP id
 g4-20020a5d64e4000000b0020ae005cc96mr708518wri.402.1650874925442; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 e9-20020a056000178900b0020a9f995a3csm8466324wrg.24.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 4D44467B1B5E;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] hw/display/xlnx_dp.c: Add audiodev property
Date: Mon, 25 Apr 2022 10:21:52 +0200
Message-Id: <16963256573fcbfa7720aa2fd000ba74a4055222.1650874791.git.mkletzan@redhat.com>
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
X-TUID: y2NCSHGHR0co

There was no way to set this and we need that for it to be able to properly
initialise.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/display/xlnx_dp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 9bb781e31254..b16d6be2b5cc 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1357,6 +1357,11 @@ static void xlnx_dp_reset(DeviceState *dev)
     xlnx_dp_update_irq(s);
 }
 
+static Property xlnx_dp_device_properties[] = {
+    DEFINE_AUDIO_PROPERTIES(XlnxDPState, aud_card),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void xlnx_dp_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -1364,6 +1369,7 @@ static void xlnx_dp_class_init(ObjectClass *oc, void *data)
     dc->realize = xlnx_dp_realize;
     dc->vmsd = &vmstate_dp;
     dc->reset = xlnx_dp_reset;
+    device_class_set_props(dc, xlnx_dp_device_properties);
 }
 
 static const TypeInfo xlnx_dp_info = {
-- 
2.35.1

