Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4792502ejc;
        Thu, 12 Jan 2023 05:51:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcJXRkHk00fuYil1jcrAob5M8/Q7nTj0UmGdp7yvEGTCJm6yYfDklk5XccxNEn1bLSE8pl
X-Received: by 2002:a05:6102:1498:b0:3ce:f1f7:b234 with SMTP id d24-20020a056102149800b003cef1f7b234mr11647861vsv.15.1673531517605;
        Thu, 12 Jan 2023 05:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531517; cv=none;
        d=google.com; s=arc-20160816;
        b=I6K3iwrWNYh20V8verIB5V26aAUW3JlzbLW0DL4kC/GyZjmg6MZ5HADf5KiNKzMxUo
         es7cupBD/6wNPsTn2dix6iSzNEvLol0iLFBJJKTBu7/PjStiQMDuCZPUbN32IVa7Z4Sl
         lYdMB68M45tQb22/9cTmvQKNq2ZjGwd+33Ih30kvuHfILOltWWhYGrnARqNziw6hIJvu
         xJX6qawSrE2BMWPE5EKOGegJceRVI+N/jDW+4H0nAf+97kqrco/A8G2lfsF8BdOX9pqj
         +DJJWFcUfNHypW2W3+HWIql8njZWYCwiKLwj7R5NgOmvrde0y++q3SpN72jvl0WHLajf
         nXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vG8MsiZXqR9BpNtt6zv/oEucFrLBECeZCo9G5MfOAa0=;
        b=XExzfO9w9eNtcFYX5T87f5k1vcjb49qJ80FNLf3KxGlb2EWksQvic8GhsboBRAR0oy
         kE7196S/s4hcuavUbqmF1hKlFMyyNHYVdknE/tE4IrqIsC5jS2mDkAZAnPGkgjwnI9V3
         bCTCBG3yZHeB0zbJcth497uAdfqXRgbQ4IZ5O9dK6thpjw59nUHCfeVZOU7EvYdPYZqx
         jR7KbJjgM1gMDfTsDDeMMV2kSvuOgoC4UlEROi9s0yt783kPONhyseLpoHi2ytF55lma
         v7DO7Ht+lghhPKx7kJXs/2ZKK6X5LPNxdG694EieBZZUi0sBydr6304oSunlp7JKKWZg
         zOJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PltSGh1d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05620a444400b006feffc303c1si11427212qkp.403.2023.01.12.05.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 05:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PltSGh1d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxxj-0001i5-F4; Thu, 12 Jan 2023 08:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxd-0001Ys-9u
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxb-00037Z-8j
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vG8MsiZXqR9BpNtt6zv/oEucFrLBECeZCo9G5MfOAa0=;
 b=PltSGh1dwQISaFRV3/g398veOR8V+iRgd8EG4BikyJslWDNMFC7EBgbGX+ipSBYVUFgwto
 kT/7FOdml/2zYxb/FdagJFuuzJtu3g9qM0AtygUHVs9zKsjUhQJsNE9XY54xq7yGtCChMV
 Uvo+RnUtl9lif/j7sfn3EJwrSUrUV8g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-gxImCNeNPbK_-NZCvz057g-1; Thu, 12 Jan 2023 08:49:35 -0500
X-MC-Unique: gxImCNeNPbK_-NZCvz057g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00010811E9C;
 Thu, 12 Jan 2023 13:49:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E6340C2064;
 Thu, 12 Jan 2023 13:49:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 3/7] hw/tpm: Move tpm_ppi.c out of target-specific source set
Date: Thu, 12 Jan 2023 14:49:24 +0100
Message-Id: <20230112134928.1026006-4-thuth@redhat.com>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
References: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: KgepoRpAod+T

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The TPM Physical Presence Interface is not target specific.
Build this file once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209170042.71169-4-philmd@linaro.org>
[thuth: Drop the CONFIG_SOFTMMU statements, they are not needed here]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/tpm/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
index 1c68d81d6a..7abc2d794a 100644
--- a/hw/tpm/meson.build
+++ b/hw/tpm/meson.build
@@ -2,7 +2,7 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
+softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
+softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
 
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
 specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
-- 
2.31.1

