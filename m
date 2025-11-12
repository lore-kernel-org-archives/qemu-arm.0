Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426CDCD3438
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 18:15:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJFMV-0004TD-AE; Wed, 12 Nov 2025 13:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJFMD-00037w-Ao
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 13:14:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJFMB-0006nE-Ft
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 13:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762971249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6wkDGLNl95u4gTMNts1lwy5hnz5zbSzJt2V8JBhOwjc=;
 b=Z90XeRv3s3j+qeTIlicwBwpJXAKGMjaecRc+UGMr+br98NF99EbipCk38QSM55UJLc2Tt1
 zcwVNp86/Ymj1BNORH4xKfW/xcKeG9Xxmk91CG1dNIDYpWePRfdMEstoDqZJ/7KOqQp5oR
 3q4mnIjstVwaUvFTGZOW4JlEfTMwudE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-Od3p_JCYMrSOTvdTk0_qvw-1; Wed, 12 Nov 2025 13:14:07 -0500
X-MC-Unique: Od3p_JCYMrSOTvdTk0_qvw-1
X-Mimecast-MFC-AGG-ID: Od3p_JCYMrSOTvdTk0_qvw_1762971247
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477563a0c75so7375765e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 10:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762971246; x=1763576046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wkDGLNl95u4gTMNts1lwy5hnz5zbSzJt2V8JBhOwjc=;
 b=RkV5oHeQIZHvssWX9dNuhTveSMW4CXMECNHY1/AqFOQ33s5r2Vx31jnIfaIpKzIanw
 gXrysHxJcE+4CqXfOOMizolY8MtPgrtYK0KjerBrWTsmK7e3YSQazwqnPryb/iaFbULu
 rdXE2mX84XOrm0ogZE4f9ZRMoR+3OB2Q0/8+scT5Ngr+rw5cPIc1QnpTk1e1hEle7kuU
 2u7tFKUsoPmyr3JXQsh9+tLrgN8xTa0WVpiV9bmYr3OTHU0YD4s3KqOZpra6M51H1SWk
 Ekh4OBusF8yilreCDG8bCF/4VGD0X57qkFTjTOfzDqBEHE7lcFdRulWAaRLlZir1z8l2
 CRMQ==
X-Gm-Message-State: AOJu0YyTjBJtoiK90h+QisZh+l467qUf/t/1fYJI3sGbrLRDaMhTSyI4
 FA9SMB+9cqM8/hV/QfsgiPF8Kzy/086mmIpgk/Pf6KSo1gHCRk9GdDrae0P39WZptNmdgu6Nrj+
 HGUdQ0EqRCrUpiEjD6m/3CZM8vMuyfQZWHSkNASdj3qPYfZxNdV1bIg==
X-Gm-Gg: ASbGncuJcwxs0dwGlmk2SSQDgP+5A6azoGtmd4adhPf/2l1QHhvSt8b8TqsEU9AqV13
 qRizXITh7yYVnCd9Kx6rmULfVFHU03BEARxbogXv+gJHXxjYh9SpfP4245WQ3uRcf2nmDTuwx0S
 BKfANB0+9U3NgXtsHeE0fTPd8Z3GkBbkuXt383t6gsMNaySlsIb83oxjQgFSThrJci2mneyHjuj
 ftDjDy/o4YYnebqYY8eAqmAz5Y8aLzpcQjJuWFeFiBegB+vxS3JTndZgK2toSu3GPJStxq3PANw
 0Xu6gP2LrtF+siO9X05M2dh9WCpx01AMuhZqv44facBMNHxFFykWdjFigE+4taIUAJxqx5f8SE/
 LyTvJCeyWlcc6RPXNloJA15BDtNltyybML8Bf282oksOSZXAeYSzL4OZTEdvsyw==
X-Received: by 2002:a05:600c:4f54:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-47787071103mr41219875e9.1.1762971246457; 
 Wed, 12 Nov 2025 10:14:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9+tZW+TZfDNytcYdvgsMKLxtasoyhEGtTeovHC2gFRRAmyVWZ9b21XTXgVv0PcfEXirpotw==
X-Received: by 2002:a05:600c:4f54:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-47787071103mr41219625e9.1.1762971246059; 
 Wed, 12 Nov 2025 10:14:06 -0800 (PST)
Received: from rh.fritz.box
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e51e49sm46851355e9.7.2025.11.12.10.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 10:14:05 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 0/2]  arm: add kvm-psci-version vcpu property
Date: Wed, 12 Nov 2025 19:13:55 +0100
Message-ID: <20251112181357.38999-1-sebott@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nkS9uH-ZVb9r1kbioDWlgqXApSNNQSwgRf-SvtluUXI_1762971247
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series adds a vcpu knob to request a specific PSCI version
from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.

The use case for this is to support migration between host kernels
that differ in their default (a.k.a. most recent) PSCI version.

Note: in order to support PSCI v0.1 we need to drop vcpu
initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
Alternatively we could limit support to versions >=0.2 .

Changes since V2 [2]:
* fix kvm_get_psci_version() when the prop is not specified - thanks Eric!
* removed the assertion in kvm_get_psci_version() so that this also works
  with a future kernel/psci version
* added R-B
Changes since V1 [1]:
* incorporated feedback from Peter and Eric

[1] https://lore.kernel.org/kvmarm/20250911144923.24259-1-sebott@redhat.com/
[2] https://lore.kernel.org/kvmarm/20251030165905.73295-1-sebott@redhat.com/


Sebastian Ott (2):
  target/arm/kvm: add constants for new PSCI versions
  target/arm/kvm: add kvm-psci-version vcpu property

 docs/system/arm/cpu-features.rst |  5 +++
 target/arm/cpu.h                 |  6 +++
 target/arm/kvm-consts.h          |  2 +
 target/arm/kvm.c                 | 64 +++++++++++++++++++++++++++++++-
 4 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.42.0


