Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9CAC79FB6
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Sep 2026 14:43:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4JW7-0000HP-3A; Wed, 09 Sep 2026 10:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x4JW5-0000GQ-AQ
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 10:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1x4JW2-0005fy-On
 for qemu-arm@nongnu.org; Wed, 09 Sep 2026 10:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788964990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wLpBNFZD3RVw+7D00ZIotFNb9etsyMpGKaQi8IeeH7Q=;
 b=VgLJz5QWI772Z21S7w/IsdKSCUjPPvvhxhcShvqPozRkdxmgBtPiaIbdjzIlDzsxETIw0w
 9mrX9Y9te1k8iSB6X3PDeB4MHsxrzmV9II+rxTfjng/iwnesJRFP3lLiuj4SqOO+xGwv+S
 rSxAI43s+9wmncLqLMpMhLbjpwNndqM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-s73IaUY3NhWicyDqSZIXfw-1; Wed, 09 Sep 2026 10:42:00 -0400
X-MC-Unique: s73IaUY3NhWicyDqSZIXfw-1
X-Mimecast-MFC-AGG-ID: s73IaUY3NhWicyDqSZIXfw_1788964920
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-484337a63bbso3838863f8f.3
 for <qemu-arm@nongnu.org>; Wed, 09 Sep 2026 07:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788964919; x=1789569719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wLpBNFZD3RVw+7D00ZIotFNb9etsyMpGKaQi8IeeH7Q=;
 b=fdxnxQZnlSJS+UgYtaWPjSV0MxYfyccFHUlkuCepDaYG5DY2jtEmaQQoAWriTU8g8O
 kHsdHuDON81+zcEtEJdQAop8A+h7mWO1usNX87f35hMet1bGHgHTzGJD+02m3nmwB6DJ
 HF8n/ejegQOGh/p5xQ0J2Amfo8/uQ2EHfREBnVdm4+pILFdAiLa8Qp0LM1VV+/rVtsm+
 vR3Rwq0IvE1qbnedM0KHs2nGDobaFK8Eut4yKBrTQXYmCr9mbS9rXni8c096sYbfQ4OH
 RU9skrOerAP0EF2PPqqKU+HxPUxG6cuej92MbyFvBtmlbeu68/ZOFxfLMRnTy3QIr1DG
 ccwQ==
X-Gm-Message-State: AFuF++lFoMMH3WAkpeqyiODgtuS326EwjviK7TB3G/xOAeAADemyt43s
 5ooCDEinb1KoB3i60kOwuOKYHCUkekkmrt+pyqa+c5T1DYbESzp4mjO0LcfzxEbGdoXdgd9YS3f
 bJgB5O0dY+tOu8ApXTxi8vEMALAiXF2++Y/i/q4I3o7xVjlDQvY6okg==
X-Gm-Gg: AYBFou2Ty9ZkDyzUnogG6aVnfbhc99NaPbrrEFgaGayxIqVFxmPtMqdqy/4l78+16aB
 QEkXJKoRQ5gNt7vVeFwOfu1SNvtltWlclYWSoXDxQ3R0QJfR82iFVhYnBV4YHYVOqdlg9AUKIgG
 yaVj27MI9isAQUArq3nA6cxoKxwT1XVACmShqj54+/QNTFoj5/80kNwG186fV+OYvptwzOy4Wig
 HWtqrNyIjvkizsuO7OR66tx2M4SHdg2+ACWyCmkc3Gwf9Jw2BCGleIdJ6k3lh6fe8LvoTMV4IKR
 60GQP1RTDJI21wJ1u9f2MUxocKTNjcJz4qcFPYN/jkT7JuVusifzd2W7rZRP9dEcdA57OLHoNIU
 TEUGGhTfOdqx+CGkrpBx3rOED80rTSgCKDz/fQg0XxRZIyxwDxhEKZ409DCemh5zn2g==
X-Received: by 2002:a5d:5d02:0:b0:485:8a46:b3c6 with SMTP id
 ffacd0b85a97d-4858a46b562mr37607294f8f.46.1788964919566; 
 Wed, 09 Sep 2026 07:41:59 -0700 (PDT)
X-Received: by 2002:a5d:5d02:0:b0:485:8a46:b3c6 with SMTP id
 ffacd0b85a97d-4858a46b562mr37607258f8f.46.1788964919199; 
 Wed, 09 Sep 2026 07:41:59 -0700 (PDT)
Received: from rh.redhat.corp
 (p200300f6af0e1b00fa6b14698c8a91c3.dip0.t-ipconnect.de.
 [2003:f6:af0e:1b00:fa6b:1469:8c8a:91c3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485958f1493sm32933395f8f.37.2026.09.09.07.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:41:58 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, khushit.shah@nutanix.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v5 0/3] arm: demuxed ID registers (CCSIDR_EL1)
Date: Wed,  9 Sep 2026 16:41:48 +0200
Message-ID: <20260909144151.26803-1-sebott@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGSBqqagXRuwgEArvLnRrztEeAlIugoufRsB__NFtM4_1788964920
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

To support efforts to generalize handling of writable System ID Registers
[1] this series addresses the demuxed registers that are kept outside of
ARMISARegisters namely CSSELR_EL1.

CSSELR_EL1 is moved within ARMISARegisters and accessors to retrieve
and set the demuxed values are provided. Initial values are gathered via
the usual KVM_GET_ONE_REG ioctl.

V4 of this series was posted here:
https://lore.kernel.org/qemu-devel/20260702133606.34529-1-sebott@redhat.com/

[1] https://lore.kernel.org/qemu-arm/20260616132625.1732031-1-eric.auger@redhat.com/

Changes V4->V5:
* changed diffstat format
* changed cover letter

Changes V3->V4:
* added R-B from Eric
* incorporated suggestions from Eric

Cornelia Huck (3):
  arm: handle demuxed ID registers
  arm: handle CCSIDR_EL1 as a demuxed register
  arm/kvm: get demuxed ID registers from kvm

 target/arm/cpu-sysregs.h     |  9 +++++
 target/arm/cpu.h             | 18 ++++++----
 target/arm/cpu-sysregs.h.inc |  1 +
 hw/arm/virt.c                | 19 ++++------
 hw/intc/armv7m_nvic.c        |  2 +-
 target/arm/cpu-max.c         |  6 ++--
 target/arm/cpu64.c           | 14 ++++++--
 target/arm/helper.c          |  2 +-
 target/arm/kvm.c             | 31 ++++++++++++++++
 target/arm/tcg/cpu32.c       | 26 +++++++-------
 target/arm/tcg/cpu64.c       | 68 ++++++++++++++++++------------------
 11 files changed, 123 insertions(+), 73 deletions(-)

-- 
2.55.0


