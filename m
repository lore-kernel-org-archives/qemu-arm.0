Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5C2CCF9F0
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 17:00:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVzz-0002Ne-Dh; Thu, 30 Oct 2025 12:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vEVzt-0002MG-AL
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vEVzh-0005HB-NY
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761843552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c4skaTSZXHQuIRmGbiy2gxynizyJICG1cT+Q8yDgioM=;
 b=hovY4EVeTfQicubJKAktVHlICc1a+eZQr3MHGdXCtcWcYou4IoD+bbdL/+lZQFZPhY461r
 buHK/B7hHgXru/M9xO4cA96SH/t4/moHrr2pYtarm9s5Nbe+vYnZkP8VNxsFcAJgQsAhW+
 hiuNncVIZZVKCmCFmLfpOgEzFAFAXNk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-ZYcl9B2UP22oxdT0PPkzEA-1; Thu, 30 Oct 2025 12:59:10 -0400
X-MC-Unique: ZYcl9B2UP22oxdT0PPkzEA-1
X-Mimecast-MFC-AGG-ID: ZYcl9B2UP22oxdT0PPkzEA_1761843550
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4298da9effcso1271512f8f.2
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761843549; x=1762448349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c4skaTSZXHQuIRmGbiy2gxynizyJICG1cT+Q8yDgioM=;
 b=BgdzXHMqI2WEUGdJ8aHBWwSUvbYGHXVk/OYUHe9nstOfbcEkHxsHQ0zvUkAmexVFYk
 cy4vOUxGM3HarZfz36crntyhfEoZ4Obkl94t7VsUqxM45STqtATrX/BjPpb6+CZyvTLV
 uIEWs07GJhiCEdJ2EJHMlNhw6LhAehw6P1X2/CwVvQ44RiqFZHM7InUF8O5kM+Cgtq8S
 xu8kM2fsvnUNaQhRI1vEbVemKFI/thNwRGegy6LEOaLbH11TukFDAQjc7wqF2E1UONCO
 IMXRvLlDgxuQvHja7lzcsQx1HORWkyCUfvnZYy05n0kShbafYc2plfgZ50bV6iqzc2ZW
 ai+Q==
X-Gm-Message-State: AOJu0YxIwEecd1zhsXolGm5yMYSo6YG4SRtfo9QuGBsg6v4w2XTS87Ig
 iK8L1jS7uMcbxZgZnNuI2LzBHTmgYP0yqFuqjgRRxGOdzKwUOOPCHZQsBSO3u3xtPveXmTqqdqt
 gMfdb554dCGje7L0rSCw4aD1alRBU9T15x0IsJnPpRNpnBktcViYWYA==
X-Gm-Gg: ASbGncvifY32GTQkWMZhPYj418459r2lEj4gR+y6y2EsdMMJz5XpwwYB8sIMCI6pPWt
 Cn9gHpbbatqZlVjXd8B2nwbWl5GYXJMvu6ZqJEmq3gU/L9rDnEKDH82ENlUtUQcET/hkKK7eEso
 hJYiRQjC2CwQe6utvKgfeQ80BJGklpdbHgnYHafVqx6acI7rSnCJVXj542U9Px/k5gPU9Io3PHv
 AwySUfaF5NqlIKLoknyUz3PFpMhCGnty21stge6ECCe0st7eP6y6Cv31vmhalFdsbXq3aFc3GTL
 KaEIBAcrqtsl0SLglKpYWLZobkkEBiksjalTVm6xz5fAmB4oMm2fhm9fJ9v8S/X7T6Z/9+lvcSF
 cR14iCcspMUS911gIO4ayhnIMnD/cUtcnlXoPIP268g+Q4QA1tqevSUkSxjD6w/4=
X-Received: by 2002:a05:600c:841a:b0:471:672:3486 with SMTP id
 5b1f17b1804b1-477307d7648mr5007415e9.15.1761843549523; 
 Thu, 30 Oct 2025 09:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt7B6ojHr/3JYckmLT4sLA4gFFjBs0ue4eJPWN4fnRoRr5RGdu8WPcg8CocqfFNx1nXc9tQQ==
X-Received: by 2002:a05:600c:841a:b0:471:672:3486 with SMTP id
 5b1f17b1804b1-477307d7648mr5007155e9.15.1761843549096; 
 Thu, 30 Oct 2025 09:59:09 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289e7cf5sm51104085e9.14.2025.10.30.09.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:59:08 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2 0/2] arm: add kvm-psci-version vcpu property
Date: Thu, 30 Oct 2025 17:59:03 +0100
Message-ID: <20251030165905.73295-1-sebott@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bmrJiveYjdGM5bz8rTFjMpKceV2F38Q7Yc9m87tRsdU_1761843550
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Changes since V1 [1]:
* incorporated feedback from Peter and Eric

[1] https://lore.kernel.org/kvmarm/20250911144923.24259-1-sebott@redhat.com/

Sebastian Ott (2):
  target/arm/kvm: add constants for new PSCI versions
  target/arm/kvm: add kvm-psci-version vcpu property

 docs/system/arm/cpu-features.rst |  5 +++
 target/arm/cpu.h                 |  6 ++++
 target/arm/kvm-consts.h          |  2 ++
 target/arm/kvm.c                 | 60 +++++++++++++++++++++++++++++++-
 4 files changed, 72 insertions(+), 1 deletion(-)

-- 
2.42.0


