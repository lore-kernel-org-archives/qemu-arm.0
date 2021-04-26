Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4120132lfb;
        Mon, 26 Apr 2021 12:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqNKpaqpwZXU79GlWdCRGBfxmOVfr47i4yS6viperqrvpVHb0q1aKYpW9i0MM5R5HYHqMK
X-Received: by 2002:a92:d58a:: with SMTP id a10mr14920910iln.170.1619465759416;
        Mon, 26 Apr 2021 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619465759; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZwobGw0gxOIbZkUXlvEocpJ/49059Z58LUUKODeuCcFHiGZsA2ERchyukE4u1Nos4
         gixjlyZZf7LH78qQzAfrZXneauOuWQgJRwgWmY28rtOdbNLqefe+N8550M5jcOu4Tf/8
         ceSz1puf3V8CbACzUls3hsJz86MeaKGGiLBOUmvD8V4CaW9O9AcDyhjPR0SJpdTrXGJc
         yPQLIar7HrMu1Cc8wQgEUDFN8eHHKvq1QwTe2AmccV75R4xmx1dwd7X4D677x0ze3FB1
         H4mgYwYMdhgTWMx/fuiLBxoDjs0k3UCzcw0QUdShWWskUU8tKPBWvJkJCHxSu0IKSStI
         LTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
        b=SEdqxhJHnqT4HC/Sm8RPbo7sbKEO5rFQylacaWA2YKNMSExG4Q76ZLfqyGSj7s+BSk
         LlW81LqB8dKuAhdOQg4lCpU+nVv4E8AcLMJJ2mud+2d6GxsKjHPtxNl8BIMih2T5piux
         O7JR2Lr+GWmsUtdV1aZRVKG46Y2Y3KlsTBY09XUj5aMRi4LPKqSdJFIMT77nn9kMtsYo
         bpFPXl6ci5hAj+2twIkB4aZpxkCNocpzkfhmRGfJEd768TnAMqkZgDvfHNTyLEjQ7Gka
         Ko9eqmdGJtxXOWKiDS68N05FPeJfTsnlWYd0BpLy/6Tnq8rvuVJljUQxPkQQ96+cZD1t
         WzFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F+Pj6Ons;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si925129ilq.68.2021.04.26.12.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 12:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F+Pj6Ons;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lb71S-0008St-B5
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 15:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb712-00083k-Vh
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb711-0008Ot-H7
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
 b=F+Pj6OnsUNnoE/HEu8QiUeYB1LMhK/XFj6BPAD6xdlgwtq/zFArKmePKHV9aurruEiQOj8
 dzjluhSLv/FplfW/xmy02INsCbhyN+ttKEI6II5v2qi8VGDoD9g3YGteYGP58cbGA8ztGL
 Z2wouSf8qmy+npATmuGg+SidgREA4dI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-OHhiKu45OP6CtiLID_nELQ-1; Mon, 26 Apr 2021 15:35:28 -0400
X-MC-Unique: OHhiKu45OP6CtiLID_nELQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020adfd2100000b02901022328749eso19472192wrh.4
 for <qemu-arm@nongnu.org>; Mon, 26 Apr 2021 12:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
 b=Mq0x0kMWfCVIYm4iIFEO2V4b6hYOCG91wvew2/dkDGc/M98Y3ZaNVRd9DmYLRDmwia
 uXRwYVURksvsaVr2oLYoOwyKLZvqVqIfiwZVPII8OB8aZEyNqq4fJOEgRkMXjXYSoabx
 qrmA6CvRb5WWwDv8RIrW/pVff5tc8hSb5IkH/7/RxWvI5jByp78qEb/Tk0xY1Skmqmxk
 s+bdnZBKb1wjEP7X196rXlVntSpapVNkS2TdCyv58LfcK2F4gEmaZYykzh2KP6f/vrD2
 Q3oTRq2kOqsiwuubPSZaQu/U8vQxuqANAvE+IWEvmA/T6+hHcKAdACQh7gakJXEz8H58
 4eIw==
X-Gm-Message-State: AOAM530BCNBLxD3dmPApWjcFhXufY4umcV+4SRXdB6QxrPVd/Ly6fwxB
 ri+q3WO3km20AlNpd0ZjgtKb5o12GFlem5uDdOgVZOu/aUZfcWMiHvL2qVHzeGna40g8MzXdfc8
 v6nqFsXeOnRPm
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15241559wrp.320.1619465727162; 
 Mon, 26 Apr 2021 12:35:27 -0700 (PDT)
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15241538wrp.320.1619465726990; 
 Mon, 26 Apr 2021 12:35:26 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u5sm396893wmg.25.2021.04.26.12.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] stubs: Restrict fw_cfg stubs to sysemu
Date: Mon, 26 Apr 2021 21:35:14 +0200
Message-Id: <20210426193520.4115528-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KAhcsnQhKuL1

User emulation or tools don't use / require the fw_cfg device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d609e5..4ff36401cf9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -12,7 +12,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
@@ -49,6 +48,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
 else
-- 
2.26.3

