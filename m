Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88172CAC587
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 14:49:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwicH-0001Be-M1; Thu, 11 Sep 2025 10:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwicE-0001Ai-Ir
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwicC-0004IB-Dd
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757602173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oF2cIsPBN8qXmdEgTfizvTF3d/SEeert5/n3uAYGGo4=;
 b=S/2JWdguywpsfghbKEABwRfLeZm+i8EoZ4dG7tj0GV3rVXSm88oUUEk/t5l3xmwynU2OxY
 XSivKXUz0DaxnRbqt7jntZ1AQgoyunUpv0yaEeXCqrLGBjNAxIICzhYn4dpUwzbBQjrJ5U
 4LmjWu+I2Fi2RplZXa8Ep0GUmijXeuc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-_OvRErj0OVq79tB2qc37nw-1; Thu, 11 Sep 2025 10:49:31 -0400
X-MC-Unique: _OvRErj0OVq79tB2qc37nw-1
X-Mimecast-MFC-AGG-ID: _OvRErj0OVq79tB2qc37nw_1757602170
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45decfa5b26so5826525e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 07:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602170; x=1758206970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oF2cIsPBN8qXmdEgTfizvTF3d/SEeert5/n3uAYGGo4=;
 b=ryVwoyuTtxwlm0MPRcv3v0Ui22sMudBHKpulFJNN7WRhKMh4b1kQG+DOrBZk5xczaa
 bkcIRx90FarfClDZjOSkjRHVt9WdTBOZezDkNajchb5cji9djvC6VoYCbxA1L7J5IIuH
 WLmNVxqpc8JyX7+/5/X/rlRfLJw60WiOkLw6hE2gvETaiFiU66UFjt3dXOWPGUZuChgk
 VgnN4LLUSkVYxg4dRM74DWx9Mhz5wsWsHrb9ZBUODdLo4+yTcxuC+9uazmhuTGdkc4RH
 6r740J1ZzXT9xJQR9T/MjC2UPy34udGaPFyQva8cpc6KWAd2VB/9BrLJ50TBCex3yUYV
 BQHA==
X-Gm-Message-State: AOJu0YzVx+SNd8Uebd/EN/+E/7erilBhKALnG8H8fmC6b0NbV+w6saL4
 q/03pBgsRaUj+NWrrzSArtdTmWJLZW+eBDtLhxL9ywH99lQrrtt0/rvHlovGwICWa4ztikkmZio
 4YhachXsuwayCaRNKXIvJediuIb6u/7kXLjopFpcgpTLhB4KM/7oMLA==
X-Gm-Gg: ASbGncuTlA4B9yxOw2KEJNloHIal3LtnKo5e4FEcNkuXUzM1Qz8swt7htFtcKTL5m1J
 z4g/7BNPF8o7z9bSk98R0YigoMf5+STwwwmQ9N8GRCO4zAmz+ht+QiDIk2pXiRtwE96+yv5Is1o
 Lb/AFlx5a3t3hjrFHO1pX9YzJOEQLOFtuhiEnw1GBZex8kUe3iZp1vAsq3OaDZYeub8vzjtym/D
 kcTJYe6bjy/Zc30f/ZLVwlC0i3vLEOA25LDLR/IRKAhELVhd9BdV0XI3r5HRdfgTjqrk/fME1g9
 ZxQ5CeRI4vXf96y+6NMgQrDfIkxnBTn+Wvy1hO+2iUW+/U2FmDnMs262qBdm67EKg2JNDQQiKsT
 t4XKaeHHDaJg5ZEQRa4nxDRuKAU1D
X-Received: by 2002:a05:600c:4688:b0:45d:d2d2:f095 with SMTP id
 5b1f17b1804b1-45deb702e1dmr110544235e9.19.1757602170326; 
 Thu, 11 Sep 2025 07:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8qtF1qAnlROs8xNUfS1Rs+dPLZYcpuM3doPWb7N6ekPV01fUhC82BPE/uzS0/3A1DBuiZ9g==
X-Received: by 2002:a05:600c:4688:b0:45d:d2d2:f095 with SMTP id
 5b1f17b1804b1-45deb702e1dmr110544065e9.19.1757602169950; 
 Thu, 11 Sep 2025 07:49:29 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0159c27csm14941575e9.8.2025.09.11.07.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:49:29 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 0/2] arm: add kvm-psci-version vcpu property
Date: Thu, 11 Sep 2025 16:49:21 +0200
Message-ID: <20250911144923.24259-1-sebott@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fngo-8zLdp0kPFOqxvcsWCLmu9vrdDcsSIWW7yJPciE_1757602170
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Note: in order to support PSCI v0.1 we need to drop vcpu
initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
Alternatively we could limit support to versions >=0.2 .

Sebastian Ott (2):
  target/arm/kvm: add constants for new PSCI versions
  target/arm/kvm: add kvm-psci-version vcpu property

 docs/system/arm/cpu-features.rst |  5 +++
 target/arm/cpu.h                 |  6 +++
 target/arm/kvm-consts.h          |  2 +
 target/arm/kvm.c                 | 70 +++++++++++++++++++++++++++++++-
 4 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.42.0


