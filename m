Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp83699lfg;
        Wed, 31 Mar 2021 19:42:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/AjL3DKTLQk4hT/YO/R9ggbXJruytfa/RElzUwIPYeL5a37zN0X7B0dtxdZU6XDCxPWJY
X-Received: by 2002:a05:6602:1c9:: with SMTP id w9mr4670110iot.201.1617244943341;
        Wed, 31 Mar 2021 19:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617244943; cv=none;
        d=google.com; s=arc-20160816;
        b=Mqwm5TUScl2jJkQnIg5aLkSR1ULYJF+WJVSvEF3FCBl7hdSND8WJ2wz/8TSpY6Jpyx
         kXv38xeYyDg8vFLd9lSpfbqMS21z2K0J6PAWjb3O5RkTSpix4U+Ht5oHp2r5At/LtgsR
         4Hq5UgjZLtm2EtrFQgrzf4eyXZBO+JBFzeC1N4NvlmuS7clPDoE01xyi4dAuX3jKNrpi
         wnoTcMdzY3QpKQY9cbgXbxAYjE0YJYtEX1AlQCUK2QYVEg4MFcGXL2tXGjyjBDkowIrZ
         LsuIt0pCBUDk+vxIwVJOE6ufjp4cDw2jxDlFuIkrhCQaR9bOYMIUTNwGGrrvAPTA49lB
         0Uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=svgKfP7SrgBsWmmHOZcQYHV23wZX0ZFPkptJcVYaZQM=;
        b=XHEWrwFZ9Rc2kaM36JjQIomDj0yBxTOlX4Iz/jsP1Fx2n3UJ2pUAf8rwrg+/DkBU1F
         jjnqmqtdi8yBDIca6Yy7Hq4+orW4c5EPr1F3UsiIJLBtGpSUgOCR9cdjPCrTT+0SY60p
         CP4LzYw8SLRKYf7iD11QlaAsPs5pytz1gTT60uv5Tv75tk0u+sWcX4VTfh7RrQN/LbMP
         73sEXsLUmD47pfhKaarAunG3dvNYOfHFXH7q28cr4rV5Pde3PuYWXCcCJXDSSBXp0fED
         qZbJ7L7vDWxwsp1IGXRmbfATWNZuH7F84N+ovAnAF5efo6WkHZpMuV6uafRB4jYYrzev
         CaVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yu6Ezsos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si3657218jan.5.2021.03.31.19.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 19:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yu6Ezsos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRnHq-0002cC-LP
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 22:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHR-0002ap-FS
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 22:41:57 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHP-00036e-Ow
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 22:41:57 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id c3so365007qvz.7
 for <qemu-arm@nongnu.org>; Wed, 31 Mar 2021 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svgKfP7SrgBsWmmHOZcQYHV23wZX0ZFPkptJcVYaZQM=;
 b=Yu6Ezsos6SAyXTcIaUpPMLy4RISwXAN5NrrDNLUwCM5KeJclig37BaT7w+MG7sMpLG
 5QX19am1AIl3zpPWksXKbPCgvwqQ9K3T5PmLqg0GJxhVJ1HMYaqEhFzbiytyAwkhqdl2
 CRT/vv6SPRyqk/DnRPNGx9cQNFxT/pGVVTUXzFtBXVTnnGeurXVpQEFbEJ+ksIFS/fv0
 rlxPqvqT0pYmsf6mkJTpgY2ErRw4dlDtaKuVL9xYs37Dyv78RpcDgt3v3Vr9SKFyc2pC
 JjG1q3mEIIMhnPdw/eqa19zkq9xZaBy5YloJUMiMCdtRK0J4uyu4YKl6hl48afLUfw2V
 6nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svgKfP7SrgBsWmmHOZcQYHV23wZX0ZFPkptJcVYaZQM=;
 b=nf8BSjSlcMxHtZeYEotmi1VcKjoHgvDfYu+I0um1L2kCf5RW33bIncvx8JVzyEpRab
 hdfd8rkGdhbNX+T7I6/W+34ioxD9gYo6XRdBKSViESVebIGtruljUJWw8WWq0uICyriB
 hDZ95V7iaHHciTQf1I/G/LVPVG7+F/FGndqRlBRHIa3GYrxJcg8MnPG/swzrJMbYb68K
 kXo40kgBROb2/vzzmV41DFf3/cJ0pKXdOkYV97dzZgcphA7+egVejfCskoUoN4Oflbw+
 txyWr7wM89g10DfEd9k9kSWhipzMegyrvAfKMjbm3673EyQwMLNvWD/VYMZLw0IV01Hy
 CgfQ==
X-Gm-Message-State: AOAM530lVtwZDCjZWBVFHAajjwMb+byJvDUs17FZRgxp3QX/EM5Mp7MR
 pnErKybinheUNQNuV9y6LXxxGw==
X-Received: by 2002:a05:6214:1484:: with SMTP id
 bn4mr6163973qvb.8.1617244914448; 
 Wed, 31 Mar 2021 19:41:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:54 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 0/8] GICv3 LPI and ITS feature implementation
Date: Wed, 31 Mar 2021 22:41:44 -0400
Message-Id: <20210401024152.203896-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MWy2SvHjDIVK

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are 
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to sbsa-ref platform as well as
virt platform,wherein the emulated functionality co-exists with kvm
kernel functionality.

Changes in v2:
 - used FIELD to avoid manual mask definition/manipulation
 - defined registers in patches that first use them
 - changed LOG_GUEST_ERROR to LOG_UNIMP for unimplemented code
 - all kvm-unit-tests passed except 1 inapplicable case of its-trigger
   which assumes presence of redistributor caching

Shashi Mallela (8):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  hw/arm/virt: add ITS support in virt GIC

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   10 +-
 hw/intc/arm_gicv3.c                    |    6 +
 hw/intc/arm_gicv3_common.c             |   16 +
 hw/intc/arm_gicv3_cpuif.c              |   15 +-
 hw/intc/arm_gicv3_dist.c               |   22 +-
 hw/intc/arm_gicv3_its.c                | 1359 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |   54 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  152 ++-
 hw/intc/gicv3_internal.h               |  177 ++-
 hw/intc/meson.build                    |    1 +
 include/hw/intc/arm_gicv3_common.h     |   14 +
 include/hw/intc/arm_gicv3_its_common.h |   40 +-
 target/arm/kvm_arm.h                   |    4 +-
 15 files changed, 1867 insertions(+), 31 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

-- 
2.27.0

