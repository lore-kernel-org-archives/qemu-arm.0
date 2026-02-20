Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17914C55ABE
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 11:57:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtP88-0004Gi-Jt; Fri, 20 Feb 2026 06:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vtP87-0004Fv-4A
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 06:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vtP85-0001jZ-3C
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 06:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771588623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f9Iq3P1+3CvjmPUgtUDKxrjal3kc2Xn/2NZQuVratlc=;
 b=RdoXMv2lx2UKpeD9KEf4yCnQuAg0SQwGcL619k7avbfClf27PhPofQO/S7Eox+PQLgHeba
 2l3yAQPjcbTEOLHbgW76XEPVCTT/8MRer/CvjWNrVHjj2e5mwrj7WPv0FdJTE+hnalZ6jt
 as5XSvOWyK423GCwzt3b5I+KJRT86hc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-jTpw0th2NjiGqZqQ8su06g-1; Fri, 20 Feb 2026 06:57:01 -0500
X-MC-Unique: jTpw0th2NjiGqZqQ8su06g-1
X-Mimecast-MFC-AGG-ID: jTpw0th2NjiGqZqQ8su06g_1771588620
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837246211bso21252725e9.0
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 03:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771588620; x=1772193420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9Iq3P1+3CvjmPUgtUDKxrjal3kc2Xn/2NZQuVratlc=;
 b=swH2eVzMLphyh/7v2PZrWP3lJ2bZO83ncVEmtGg1putN/3Q7P4oGJPn6KgMw1+8Q7N
 Ai5vzr69/5KEgKhPhFLv3eJcDcfaruIjN3UmEwh/UKZvijn/LOr9jF8lGRX9parPpjsv
 DSi6o5c80TVfKWV9Vc0Mbcci+NYp+5wSBHDyAdcZv1zpJzv9hWvbB2XbrDFkoRJPItu1
 ftxbIWySmduS7EFKBZ+TKvWR/d+lAAan2zD7UdfbUiTyz1vzRjgIDUZr4GI1brhGZceG
 cvALt5XuUDFMDL0aSMGB76N9OHrKXv2SRzTq8rOuQfhsNrYv8UZydwfYrTqBGaJKrPXn
 HYrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV56XXhnnUYjKdQ47oOT8VCKSLd5yWSSOHSwSxIHSKq3lpQvfcZvKiY1wRjRcNcwrSMngAnz9QiMQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz8WrtdAQRG49+c8iFDcDdNPvYqKBF4VchWqakYypgusL3q3wsu
 5JGtAN3DBqq2oGi/uThEyqkms4KdRG7rP5kM+394GPIwbs2L6ve9USiY7IGsvs92SUBIIn5RgiC
 cMpB0mDcgwOl+ODwT8d/T2Zf1XAbaFZeJCWIt5V8x1N3WBECoHKe72Q==
X-Gm-Gg: AZuq6aJETDlyvm4cLmf7yeDKGUrIcGLFv+2UGaNH9Z+WDUxuOEvbDIIa6OP7AWOBN6C
 pClUY9H2uZgYt2WGWEAocnz6rlZ5ly9PLFqs1bUSy3CA2I3b9UXlozXeXaM/VglsuPDHnrxf6GI
 j7DuO2+/ME3Dimy9nHIfYFzZo7dZ1sznANGh+VwMngyMnX92kDoZWH2es2AgMUelIjhJFQ7UDce
 wVaz7x/4G1L/2SXnOMSf1sB+vP2Tf5BkK4RHqLi4WWkwDZdweNoUBbYlN9Is1xQL22M1DEVo9Cx
 6TVQ/3cWbk36dGU/pnpXhxkJdCmiIPCsjeYJjPYJRXGXZB2Ly1cMYA52dHKRLWFPXo/A6lrNkV6
 aBriK4c9sEbAzEUn7MpE+UJstqOhl3/r3yXOyfspJnfNIoXQ673+nD8JLAPHxUHEqMJU4xLoP2w
 57H8CKQq/h
X-Received: by 2002:a05:600c:4fd5:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-483989ca4e4mr142430105e9.0.1771588620365; 
 Fri, 20 Feb 2026 03:57:00 -0800 (PST)
X-Received: by 2002:a05:600c:4fd5:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-483989ca4e4mr142429585e9.0.1771588619823; 
 Fri, 20 Feb 2026 03:56:59 -0800 (PST)
Received: from rh.fritz.box
 (p200300f6af2d8700b4c2d356c3fafe63.dip0.t-ipconnect.de.
 [2003:f6:af2d:8700:b4c2:d356:c3fa:fe63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a316c2aasm66102295e9.0.2026.02.20.03.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 03:56:59 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 pbonzini@redhat.com, qemu-arm@nongnu.org, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v6 0/1] arm: add kvm-psci-version vcpu property
Date: Fri, 20 Feb 2026 12:56:55 +0100
Message-ID: <20260220115656.4831-1-sebott@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lL4yKd-NB1SAIQ42PID6QzBOPcAOd7MVszQrEk0OQtk_1771588620
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Changes since V5 [5]:
* incorporated feedback from Peter
* dropped patch that is already upstream
Changes since V4 [4]:
* incorporated feedback from Peter
* added R-B, T-B
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
[4] https://lore.kernel.org/kvmarm/20251202160853.22560-1-sebott@redhat.com/
[5] https://lore.kernel.org/kvmarm/20260211153032.19327-1-sebott@redhat.com/

Sebastian Ott (1):
  target/arm/kvm: add kvm-psci-version vcpu property

 docs/system/arm/cpu-features.rst | 11 ++++++++
 target/arm/cpu.c                 |  8 +++++-
 target/arm/kvm.c                 | 48 ++++++++++++++++++++++++++++++--
 3 files changed, 64 insertions(+), 3 deletions(-)

-- 
2.52.0


