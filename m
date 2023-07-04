Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2958890ejy;
        Tue, 4 Jul 2023 07:50:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEchfCCQaIsPmDy6Z2653osirpBbw6uoRxuqW8PWyvFqx/3Y5HF8EvM9qCQxqmkBFB+spRp
X-Received: by 2002:ad4:5ce2:0:b0:634:7c34:6c6f with SMTP id iv2-20020ad45ce2000000b006347c346c6fmr19411971qvb.13.1688482236388;
        Tue, 04 Jul 2023 07:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482236; cv=none;
        d=google.com; s=arc-20160816;
        b=oeE+npc0lLgpGI1skaabkyuAhMyhyTVZEKxX+TXcVUK/+fKYw7fJ5QcaPGey3MvtMj
         EwGqdZeO5nPjmoJcDUTC534N2A2n2MGo/HztT+iVQpvS+2S1rhUX6kNTGVFqAocHPfjl
         KnPnY5FVUlaTrvZjiWNOYfZBjN/zddPwrVLeKlrwGzG5ew2pMNMGAbLdnaHVMghmte2j
         37AdgT4qTHwGw7OgqMNTdvAqEE6IUyh/ogSt5ZSjCcJ2GnmPoPqdPETgby5hmxOFD/cJ
         LGyzFYL/ScxOjFOS4sSrT/p4zGY5UYT5XnqGYV9W01O6RM8/xuaJe1+Thl9NGUiRpGPN
         9/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pC0y5hAXJgyUcYLTNDTBx7JZb6mKEWfua2iOK72cNaw=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=C5GTiPV0lJk4ZcNS602hlD5JzXrPoLMXHUjSSBMNQntWQxWcrDih+MQgRaqpk79gff
         ctzcyn7PFOzOcfu2/paEjIbgW0W9jCZ1G5Wxcsu7ZvpwWUrV9fqgP74p/oN0QTuYd8ST
         fhTRWvpZCjNbgB8b8R5aQVjQbsKDf++gflWaZYQquMPjc0vTOub/QvUxuIoEuGwnebs2
         H9n9w3gGd2SRrMS/w3pyEx3JImzhjAYiAP6q+sFgnbAIZlhj1FM5NgddN1AjJoBgGFnZ
         DkG7OwMol04QMZ0O3F0Vu2ww4wEs/lZeMp/aMxmpdxNDvjYZ5K+XJKXmL+CzPCvmIcUV
         t00g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nSeygWQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020ad45be8000000b005eda1d1d9aasi590140qvc.598.2023.07.04.07.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nSeygWQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhMD-0003Tx-RY; Tue, 04 Jul 2023 10:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMB-0003Ss-T7
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhM9-0002oM-1P
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3143b88faebso1799748f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482215; x=1691074215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pC0y5hAXJgyUcYLTNDTBx7JZb6mKEWfua2iOK72cNaw=;
 b=nSeygWQeZ21e3K8oFC58vn3T4ynGyGkDkFheP6pon28GDZh1b12d1HcPGJz7KFJ4ua
 Let5dm9yNOiABp3FI59ZMyIrrf/fRymJrIZQHW1EbVZ6QlH5PjuLBc+6NQZLoDJqxp3J
 CSCB1Xf1UzeXYITlWHoinW2se5han4JAtZp2rL5ALKKVzOvU34vAsK7H2l7axsvY6PJM
 Vo605Ol/EF6/j9O1/+7rdw5Jr+fD612a6/iS8xr2FP5oW5boVLTjL+EfxFbQFs3mvW1k
 t3C0udpkiIx/YaALTVDorTlOXXaSdD8XJl6DsBSpCaQLh/uyln0O/IxKBuhY/ELAlMuP
 lZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482215; x=1691074215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pC0y5hAXJgyUcYLTNDTBx7JZb6mKEWfua2iOK72cNaw=;
 b=ljIy8Q+hNhC6r7RgsPwIlD6VmXKHqIm8evMf44w8QB3mw70hoJ20f6hQjttQchyTpd
 FFzCP1tLwXvTj5nJBiv1DWkuKOrA51tHdXCBS2gcsZHHiTO2VY5N1fD0LG3d3QcV+rPD
 77noL0GZMe1r1UcWCzF3cLHWnr2KMHRD39EXtW8cvV4U8MViZD5xeWP5dR66+IKE4m8Y
 BrpRpW3EyCbamjOo5JzpezU5QmNIGB0VPcEA7Q2DN/qw5L333ghB6kJC5sXM1RldixAX
 Aos0fgHSXwdyDCiBTFoxIJ5Q00iNd1SXh6LfnGcjPuHJ4zxM5DM5QGFLfBPqmb1X08Hi
 3DFQ==
X-Gm-Message-State: ABy/qLbCHfduMed6Q9RZwKKWGftFWgSa00GH7UCbBm8ytaSVWxCSIl8n
 oF9s36ZTgiSfLeRMBsNDzJocH1cjSulb1G+gcgc=
X-Received: by 2002:adf:f60c:0:b0:313:fcea:db06 with SMTP id
 t12-20020adff60c000000b00313fceadb06mr12618889wrp.12.1688482215219; 
 Tue, 04 Jul 2023 07:50:15 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a5d4b87000000b00314374145e0sm5678432wrt.67.2023.07.04.07.50.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:50:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/19] hw/timer/arm_timer: QOM'ify ARM_TIMER and correct
 sysbus/irq in ICP_PIT
Date: Tue,  4 Jul 2023 16:49:53 +0200
Message-Id: <20230704145012.49870-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DAHKVqVtgB+e

This series converts the ARM_TIMER model to QOM.

Doing so we also correct an abuse of SysBus IRQ in
the ICP PIT model.

Since v1:
- Added pm215's R-b tags
- Addressed Mark/Peter review comments
  - Drop '*State' suffix from structure names
  - Use OR-IRQ gate
  - Drop sp804_unrealize()
  - Implement Resettable API
- MMIO-map timer regions into parents

Regards,

Phil.

Philippe Mathieu-Daudé (19):
  hw/timer/arm_timer: Declare QOM types using DEFINE_TYPES() macro
  hw/timer/arm_timer: Remove pointless cast from void *
  hw/timer/arm_timer: Move SP804 code around
  hw/timer/arm_timer: CamelCase rename icp_pit_state -> IntegratorPIT
  hw/timer/arm_timer: CamelCase rename arm_timer_state -> ArmTimer
  hw/timer/arm_timer: Rename SP804State -> SP804Timer
  hw/timer/arm_timer: Rename TYPE_SP804 -> TYPE_SP804_TIMER
  hw/timer/arm_timer: Extract arm_timer_reset_hold()
  hw/timer/arm_timer: Convert read/write handlers to MemoryRegionOps
    ones
  hw/timer/arm_timer: Rename arm_timer_init() -> arm_timer_new()
  hw/timer/arm_timer: Convert ArmTimer::freq to uint32_t type
  hw/timer/arm_timer: Use array of frequency in SP804Timer
  hw/timer/arm_timer: Iterate on timers using for() loop statement
  hw/timer/arm_timer: Pass timer output IRQ as parameter to
    arm_timer_new
  hw/timer/arm_timer: Fix misuse of SysBus IRQ in IntegratorPIT
  hw/timer/arm_timer: Extract icp_pit_realize() from icp_pit_init()
  hw/timer/arm_timer: QDev'ify ARM_TIMER
  hw/timer/arm_timer: Map ARM_TIMER MMIO regions into IntegratorPIT
  hw/timer/arm_timer: Map ARM_TIMER MMIO regions into SP804Timer

 hw/timer/arm_timer.c | 353 +++++++++++++++++++++++++------------------
 hw/timer/Kconfig     |   1 +
 2 files changed, 203 insertions(+), 151 deletions(-)

-- 
2.38.1

