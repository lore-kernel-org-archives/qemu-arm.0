Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4619878njc;
        Mon, 26 May 2025 23:26:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWdLQJz/Ufa2Y3OXfBk3OuLtZDF5AVfQcv3OjeycWrYDs+9h4R7XM5uK1MploNYNIHeG3uBgyoEQ5+nA==@linaro.org
X-Google-Smtp-Source: AGHT+IFWBEdzMbKet2m6VeWqN/b77TBJAMyzOjsiW/7UAeF6mhpk7PtPPM0QeSuDjB7N1nefM/9+
X-Received: by 2002:a05:620a:31a0:b0:7c5:95e6:62c9 with SMTP id af79cd13be357-7ceec4b8fb9mr1848937185a.29.1748327203434;
        Mon, 26 May 2025 23:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748327203; cv=none;
        d=google.com; s=arc-20240605;
        b=WXg4Bdc6X75hlIso70mxvW0FXFX17MA+gQBDo1puj6zbIROH/XbHx5c/T0mQfwXSoL
         0wg3u4hijtbQRP3RbMiK8QgbyUTpOSkk6tIRJS7CAp/kk2DTJqfgf/yLM/cV/NKr/+Cn
         OHXUSdcyDZGVDdfdSEmcEqN+FLe3L2h2Pz6b/KP4ly9+JFkoUgZYbGFCAuFAvtAT2CUV
         xY29/rByAt4Hytx7DifcvzShnLG1cP/Qw+/qnhdacd4sZz8o3IYFE18PEavrNYufWLr3
         hE06F8eyzNo85m3Be8J+cv3SN9RP0bH69fZXUbeptJLoTD83oFFfduY4CoRf4PuynzLR
         FQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2DmxUgBET9XTKDTcwtHqiaaJrle7CTwTMt9apUCaxMs=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=HUsQFjkIQkpu9TC047ZyQIQZrY4n68aPBe/7FSl2psEp78J9bDbK1Tzf3cJxXN0olx
         4S57nXCDQhL2f7j/RwIWgRQLxpjaKCUGeU3Q2LZUlS6cX0HlQCawvUq+MU/HR73QO6yF
         BLwc5xsF15U2bE58LNbdY3nx5ZAXy2YYJCTBiYiNK/L8hV4TDMyjxKFtbaHjxdJEj1y1
         Z69d7tCFsJdm+nICqbv/0tKjXtJOmTF788koY/RHGr9wZaYO0BFeIQxbKErv/er1Un78
         c2f2KaiP9+IkXUZhFd2UoA4zz7JRuaGF4SDR/qf8fFLKlw1U6nzo7qXwWFEoWNMotX1i
         bdQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LIjIjqKh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468b2479si2551449585a.366.2025.05.26.23.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 23:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LIjIjqKh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uJnlM-0000F3-BE; Tue, 27 May 2025 02:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnlB-0008VB-Px
 for qemu-devel@nongnu.org; Tue, 27 May 2025 02:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJnl2-0005lr-Oo
 for qemu-devel@nongnu.org; Tue, 27 May 2025 02:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748327148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2DmxUgBET9XTKDTcwtHqiaaJrle7CTwTMt9apUCaxMs=;
 b=LIjIjqKhIy3nxN0XuJgiVSrm+v7mZrUPeYtGd20Vjkxo6IMc8UJ7xBHDaSYmfzqVPTtFPg
 QV6D4Ip/qVZbrvwtMeUpnJidK7BNR+cKVjytFnRWqupS7GWfGTCYfX4gUN1scTjbzYUY6U
 fjg1wbydBU+QGasg9b/Rx59icHZaz58=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-vmbmiEraMyaUDBde4RaTAw-1; Tue,
 27 May 2025 02:25:44 -0400
X-MC-Unique: vmbmiEraMyaUDBde4RaTAw-1
X-Mimecast-MFC-AGG-ID: vmbmiEraMyaUDBde4RaTAw_1748327142
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3EBA7180035C; Tue, 27 May 2025 06:25:42 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2DBF6195608D; Tue, 27 May 2025 06:25:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [PATCH v5 0/5] ARM Nested Virt Support
Date: Tue, 27 May 2025 08:24:32 +0200
Message-ID: <20250527062534.1186004-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: R7YBbh8ua5/w

Now that ARM nested virt has landed in kvm/next, let's turn the series
into a PATCH series. The linux header update was made against kvm/next.

For gaining virt functionality in KVM accelerated L1, The host needs to
be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
with: -machine virt,virtualization=on.

This series can be found at:
https://github.com/eauger/qemu/tree/v10.0.0-nv-v5

Original version from Miguel:
[1] https://lore.kernel.org/all/20230227163718.62003-1-miguel.luis@oracle.com/
version from Haibo:
[2] https://lore.kernel.org/qemu-devel/cover.1617281290.git.haibo.xu@linaro.org/

History:
v4 -> v5:
- rebase on top of v10.0.0

v3 -> v4:
- fix: only set maint_irq if vms->virt

v2 -> v3:
- KVM EL2 only is set if virtualization option is set
- fixes regression with virtualization=off
- Add checks against unsupported GIC configs until the kernel does

Eric Auger (1):
  linux-headers: Update against kvm/next

Haibo Xu (4):
  hw/arm: Allow setting KVM vGIC maintenance IRQ
  target/arm/kvm: Add helper to detect EL2 when using KVM
  target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is supported
  hw/arm/virt: Allow virt extensions with KVM

 include/hw/intc/arm_gicv3_common.h          |  1 +
 include/standard-headers/linux/virtio_pci.h |  1 +
 linux-headers/asm-arm64/kvm.h               |  9 +++++----
 linux-headers/linux/kvm.h                   |  3 +++
 linux-headers/linux/vhost.h                 |  4 ++--
 target/arm/kvm_arm.h                        |  7 +++++++
 hw/arm/virt.c                               | 13 ++++++++++++-
 hw/intc/arm_gicv3_common.c                  |  1 +
 hw/intc/arm_gicv3_kvm.c                     | 21 +++++++++++++++++++++
 target/arm/kvm-stub.c                       |  5 +++++
 target/arm/kvm.c                            | 21 +++++++++++++++++++++
 11 files changed, 79 insertions(+), 7 deletions(-)

-- 
2.49.0

