Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2084490lfb;
        Sat, 7 Nov 2020 03:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznuTlX78SxK53Bpv0sKO1pvzswAt43A6YigRbCN9N2c+kKva2k+rajszp0nvuDAhBqD4mo
X-Received: by 2002:a25:a567:: with SMTP id h94mr8202163ybi.211.1604749758623;
        Sat, 07 Nov 2020 03:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604749758; cv=none;
        d=google.com; s=arc-20160816;
        b=PIiJrwZlDLNZ9ud/wNhNgxSQCcS7knrR3v1SX/rtnX1t3K7KiyS0S0hvqn28HoiRab
         U3pcz84+jdHcVLA+5AtGISGn6hTH/EAb/gxyfY7Dt8Mqcfzoi9XLGc5IhaM9OOhUENOS
         Z259SlP9hF6msiuB0bA5GyM02AbQfToO6LPFG8IPniQhdIk9l+btvOZVJVaS40QksUnP
         1JnKoHpNuoWVIJD4pzqgAOuFUakKEdoez1dndyJNCRywqSugR29C//TXwisYv/dKroOJ
         i+y+js6eU3IQ5UgpPskNRdmFe/xoQH2l8UQkgeQnzS4pWuQXFQw57S62BZfgsGCb3ten
         jkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/C0KE97XuxcDYw99rga1UMIhoioSLQvSMLDL2QmOHmg=;
        b=Udg1oUOK7HJnMxhFIAQiHjxL/SMy7sad/B6wC+qtkmW/93/tzQW7ud0UwAAw504dwI
         NHQgSm0rMklrPNIRjOU/sOkON4mnqhK14T5KOHMw9LylJ8q3VunE5N3BEfcM4IHNZFqi
         HwG640bdrSMIdlONV52K5corA4tXUI7K1drMtwgOuhlhrfD7WuRSqHuUPPARkoAVSNGu
         botVwDJmwvQnvJwmtWvDaboJB9CA3vOXmcvwaJVKYU70CAmFxc9f6yCny7lfuRKL2YNL
         2AGMkQbqfS6HNr0wlumZvZ42fNnIWt89REgec7zi+orifcRAM0biUxjCosl7rSIVbVuV
         amnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IOhLfH4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si3661948ybk.86.2020.11.07.03.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2020 03:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IOhLfH4N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbMib-0007OK-G0
	for alex.bennee@linaro.org; Sat, 07 Nov 2020 06:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbMiM-0007O9-8Z
 for qemu-arm@nongnu.org; Sat, 07 Nov 2020 06:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbMiJ-00076w-S6
 for qemu-arm@nongnu.org; Sat, 07 Nov 2020 06:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604749738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/C0KE97XuxcDYw99rga1UMIhoioSLQvSMLDL2QmOHmg=;
 b=IOhLfH4NRRFUNwxGZBlELfCuqBxIY25vpJm9Ifq+kNyeo7mpwTtpHcJBQxrlHdGQmwAQt3
 my5+43nOybNgadfLuLMn0DitO9CR6XQk+NOxt0Y/DlIMgG/mPIrlb+BGam6KEXOcrTxpeK
 4bMRUqOJkgn/z2nvDryKtOqaZdBxROA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-8iJqHN3wPniEyldvafzlkg-1; Sat, 07 Nov 2020 06:48:56 -0500
X-MC-Unique: 8iJqHN3wPniEyldvafzlkg-1
Received: by mail-wr1-f69.google.com with SMTP id w6so1636323wrk.1
 for <qemu-arm@nongnu.org>; Sat, 07 Nov 2020 03:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/C0KE97XuxcDYw99rga1UMIhoioSLQvSMLDL2QmOHmg=;
 b=nZHJE7jRktXc8OPzplK6Lu3ZOX7eQbj88ECfpJwbCENVXcYt84hV2Bz6cYT369Y5Pd
 CgUx6Xg8i3hqh+3jTEhzA1HrJiupayOvNuj3PH/vThvyTMcU6Rkjao+v/P9AC9wqxxTg
 3CJvNRqJRe5z1Y/bE2PwWeVvLHrxb+tk72w3VO8jectZlp/pAwP/1sw4YJ8jLGh0+p9V
 LeqziGPshOy6p5Xr7X/7FqCyzmIXaDFc1EILOblOAJtcc4zqANttRRSyGVBEsYxT/heU
 /HxoekGjrLWyLLITaf8gt+bFA8r5MuC+i5c3sYYh1GaKxd3dZAvLClRtPHaQfYgHeHVf
 pPTg==
X-Gm-Message-State: AOAM533qRWSQA4pb4fxQoGLpW6FJhcs+S7e6FN1E/3SBp6RrIDZlNxQu
 cZEMolqGJttc6lW5FXA1azELlptex43R5lbRmwhp4xEZ3Y3U4RmR8+gz1Vwh3NK1VE0/GHt2I0l
 JRxdLdBMe4OQr
X-Received: by 2002:a1c:9695:: with SMTP id y143mr4526567wmd.70.1604749735165; 
 Sat, 07 Nov 2020 03:48:55 -0800 (PST)
X-Received: by 2002:a1c:9695:: with SMTP id y143mr4526549wmd.70.1604749735001; 
 Sat, 07 Nov 2020 03:48:55 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y20sm5982693wma.15.2020.11.07.03.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 03:48:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2] hw/arm/virt: Remove dependency on Cortex-A15
 MPCore peripherals
Date: Sat,  7 Nov 2020 12:48:52 +0100
Message-Id: <20201107114852.271922-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/07 03:59:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I+KfECGB4nL4

When using a Cortex-A15, the Virt machine does not use any
MPCore peripherals. Remove the dependency.

Fixes: 7951c7b7c05 ("hw/arm: Express dependencies of the virt machine with Kconfig")
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because there might be some odd use case I'm not aware of
    (like instantiating it via device tree?)
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index fdf4464b948..e2e9cc36eb1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,7 +6,6 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
-    select A15MPCORE
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
-- 
2.26.2

