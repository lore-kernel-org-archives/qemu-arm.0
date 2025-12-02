Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5ECD11705
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 16:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQSyM-0007xr-0f; Tue, 02 Dec 2025 11:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vQSw6-0004wf-DV
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vQSw3-00006X-P9
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764691741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VN5D96R/t76acLMeIjKxcWybmi4kuwmjRsxRAB7XktE=;
 b=Oq30BEauUlxsRFKjRsE1hB8jStXa9kxTKv5KSVRB6cTwu5qc/+6UsI2IGF8XW+tfF070+K
 1ieKTRjiML/07dQksAkjbSjFcvHYN+PLuzVxhDJMG9LSGO4r7aEsT/6X6RlxnGcJvK6MiI
 875Pp8CBSvdK54eYuZ0/omz9g47Ghbk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-zz-8Kmi0M4mfviJLsCyF-Q-1; Tue, 02 Dec 2025 11:09:00 -0500
X-MC-Unique: zz-8Kmi0M4mfviJLsCyF-Q-1
X-Mimecast-MFC-AGG-ID: zz-8Kmi0M4mfviJLsCyF-Q_1764691739
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42b2ffbba05so3192749f8f.0
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 08:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764691739; x=1765296539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VN5D96R/t76acLMeIjKxcWybmi4kuwmjRsxRAB7XktE=;
 b=kFUK98GrUrtPfEsrB+d2L5WDoSC/Zzq3SPFVOPHLwD5bLHgoTJOMzSWQmoax3hnrMa
 OaABph0/XYs/0LOwDSdItwYnM368iZjwTeY/r6Kz0PvhRf6k/Fov3a0gfYunVfBms9U6
 pad9kvWRsIRphse4nni33cvwLvKMb8aNpvoyGrPpqbh9yxq0Hm47NPl73PYrR9StVmf1
 X1oWgHR1fi7wREd60cy0jaVXNzFOKRn3jaM/53TW/EpuD9/8jq/xBv2DSz8YKph6LY/g
 oF/Nh7w0Dhp8gP3z0+H9pnyBom54IY+/qIM6RE4uVu+erF7iIRCH+OfcbQE+o1lF7EWY
 v8Ow==
X-Gm-Message-State: AOJu0YwBX7On9cgqm+c/kHxnQHKc8q36NBE49V5GVG74CN/MEWDmlfA3
 tQuwEXkk97ESCcea+kyyiPN2aIv3ASh0c6a37E+OUFRhgWZLaAW9/SpJlUAa7GhKDZaoSu13jW8
 /uS6nCJxaEALw2ajvtpChHLJYXiOeH+A25zknluMRUBtJOTI0rdNqqg==
X-Gm-Gg: ASbGnct4W74Yen7kGjNj7rtNfLW5qHgpuVIoVTvc93zQdtRyitcSWE54dF9rgUwBG8k
 NDa3fe+ZkKOOd90R4TAa7FY7ha6hfsP9xADx9LHffOSMvlz658+pGhvFNMj97mLwhKxnfamgcGF
 JLEAjZmGJswFmkF2yxc4lwk+q3XgwVZCf2ucWc5sL/Uru1LmU7GthhWFj8ngVC3vXNo0WtdjG/f
 4/aykzZuLcluL/gF8TbR+6MWRcU+h1MwbH9ZDuqfMCi6hLWlWUAmCZoZOK5osLYra7fvvIm8r7N
 Gm6qGn8iDl+BxyqThoCFKgGoidPjPWMb7tOh89WxRq3EuNc01nvfAZByALrk5uF/2L1FK2aMYR3
 /bS6CSS4ssAi8SI/KW/74xnQ5G9dwN+HBF06/Fxx5661nMZcsP3SSBeZpNAKc2k2ICGZAo66w
X-Received: by 2002:a05:6000:2307:b0:42b:3bc4:16dc with SMTP id
 ffacd0b85a97d-42e0f213b9emr32166635f8f.21.1764691738812; 
 Tue, 02 Dec 2025 08:08:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlWgvgyCrCdB68a/vDVtdUnY3Hzqt9cNDCyK0z8du3Hyb0hPWF5OXcMS0TvNkdQ42xNIogkQ==
X-Received: by 2002:a05:6000:2307:b0:42b:3bc4:16dc with SMTP id
 ffacd0b85a97d-42e0f213b9emr32166604f8f.21.1764691738387; 
 Tue, 02 Dec 2025 08:08:58 -0800 (PST)
Received: from rh.redhat.com
 (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caa767dsm34300899f8f.38.2025.12.02.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 08:08:58 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v4 0/2] arm: add kvm-psci-version vcpu property
Date: Tue,  2 Dec 2025 17:08:51 +0100
Message-ID: <20251202160853.22560-1-sebott@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q8EexWrCdnK7KDV_AB_EHFEkHVE-iDVtQ3aQpGHnkLA_1764691739
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

Changes since V3 [3]:
* changed variable name as requested by Eric
* added R-B
Changes since V2 [2]:
* fix kvm_get_psci_version() when the prop is not specified - thanks Eric!
* removed the assertion in kvm_get_psci_version() so that this also works
  with a future kernel/psci version
* added R-B
Changes since V1 [1]:
* incorporated feedback from Peter and Eric

[1] https://lore.kernel.org/kvmarm/20250911144923.24259-1-sebott@redhat.com/
[2] https://lore.kernel.org/kvmarm/20251030165905.73295-1-sebott@redhat.com/
[3] https://lore.kernel.org/kvmarm/20251112181357.38999-1-sebott@redhat.com/

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


