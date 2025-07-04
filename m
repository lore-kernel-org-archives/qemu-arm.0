Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1248046dyc;
        Fri, 4 Jul 2025 07:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5eapgY8VGMW+K/1nEY5LtInm2ENxY5hPITJq5YYYAI/MSkTnl/kGTkDkDYzRLo4J05IBWL8KxyYV2jg==@linaro.org
X-Google-Smtp-Source: AGHT+IFge8iEENtNXTjqkPnDsujLaE/nBw3byCC3zZ1P3aGeoNRSDQOaIu/9FyGzCtQqVK3pjqti
X-Received: by 2002:a05:622a:1a19:b0:4a5:a5d9:c4c6 with SMTP id d75a77b69052e-4a9964e2aadmr39474671cf.25.1751638792899;
        Fri, 04 Jul 2025 07:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751638792; cv=none;
        d=google.com; s=arc-20240605;
        b=eG1L/nvxUJBCnIT7FPcL111YZ/I/wYK+m3WpKBzUwfsLEiy+7fVaPG+07Sxq6M4fH/
         96Ab3oLRiTqa5En5AszibrGSkwTt5Zr/8gjmWZnU5zw0n03RuHg3W7pqlUpirkLaC9Gc
         B9PxZPx0bcQth77RPjtdPoa084Acac0QYmPYdnpf+8xUsoheudydflg+SAHFvuo/QIUB
         beJ6fxqsFGuOYKVKWBFMDiW2ko7orxuIZ8aI/elHuSokkfwYdZ/BA7G9jeCKvVbtkNj8
         aoUzAF1RUKiHt4mqxHOEGfBDhRSv43DpQSl17XbKswlfOJdiyThi/KOH8YIgR0+uMahU
         solA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uiBSjbiTzUCruijVNyKBA8vl11HzBah7FxlKeWQPG8U=;
        fh=47nbNcdFoHdx4vFkcZle5phKNunXZjbcCr/4dP29blM=;
        b=GzJk1wHL9npwhVP/kiKIwKD3MuPFziyysu2oV+Cz7guKhalZ2cf+frmCITp1Z9S8g9
         41Q025IJh4ShtnfIzOYE5cp0tZmwJov+j3JgjWWyaFPESJ7jfj/C1bRmwIxHtJGQmZ/S
         AiqBNhekzgHPPlTgzJ+unIczOnV2yz42H36l5S59O+ahTRlvmkkcjfbVhPXZmv+BuSUp
         Xn9zAHNstl0qCgGbunE1eFfYCWu8pdx85gKyBfLZX1aJhlb4ykfdx4ILj1KPlWDiXu+r
         YPk7LbJ7dL6ffDwNqXvIQW62LIra5eliW3cTqf9O+0YJwXAbRfIsJ4rQf/CS3r2DqjYS
         E4IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eP60/oGM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ad1ad3si21319971cf.379.2025.07.04.07.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eP60/oGM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhGT-0003SK-C7; Fri, 04 Jul 2025 10:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGR-0003S3-EX
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1uXhGO-0003IC-UD
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751638778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uiBSjbiTzUCruijVNyKBA8vl11HzBah7FxlKeWQPG8U=;
 b=eP60/oGMIjvZvINCPr8pQvhCckEZIeybnxD6Wu22S0fjlXPzlq/tqd3M9H+Q5K2ZmI2YE2
 EqVrBChoT8D3hvSfN29+IJtpFIRfB+TwkQM5U5OAi7jhejOFll13qCuegrNyCQYK8isa5/
 yiPQTZ2IsEURRFkvmnB3re54UQ6LNrg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-6LOCEZLQM_CR_VCla-MyjQ-1; Fri,
 04 Jul 2025 10:19:35 -0400
X-MC-Unique: 6LOCEZLQM_CR_VCla-MyjQ-1
X-Mimecast-MFC-AGG-ID: 6LOCEZLQM_CR_VCla-MyjQ_1751638774
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DD73719560AE; Fri,  4 Jul 2025 14:19:33 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.44.34.37])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 60FC1195608F; Fri,  4 Jul 2025 14:19:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 0/5] arm: followup on the ID register storage series
Date: Fri,  4 Jul 2025 16:19:22 +0200
Message-ID: <20250704141927.38963-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.218,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: gDUon+5dZPRS

This series tries to address some low-hanging fruit on top of target-arm.next
(move some more registers, some cosmetics; see discussion following
<20250617153931.1330449-14-cohuck@redhat.com>)

Also available at https://gitlab.com/cohuck/qemu id-reg-fixup-v1

Cornelia Huck (5):
  arm/cpu: store id_afr0 into the idregs array
  arm/cpu: store id_aa64afr{0,1} into the idregs array
  arm/cpu: fix trailing ',' for SET_IDREG
  arm/cpu: store clidr into the idregs array
  arm/kvm: shorten one overly long line

 hw/intc/armv7m_nvic.c        |  4 +--
 target/arm/cpu-sysregs.h.inc |  4 +++
 target/arm/cpu.h             |  6 +---
 target/arm/cpu64.c           |  8 ++---
 target/arm/helper.c          |  8 ++---
 target/arm/kvm.c             |  3 +-
 target/arm/tcg/cpu-v7m.c     | 16 ++++-----
 target/arm/tcg/cpu32.c       | 34 +++++++++---------
 target/arm/tcg/cpu64.c       | 68 ++++++++++++++++++------------------
 9 files changed, 76 insertions(+), 75 deletions(-)


base-commit: 7bc86ccbb59f2022014e132327a33b94a7ed00fe
-- 
2.50.0

