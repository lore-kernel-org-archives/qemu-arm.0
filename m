Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp109342lfo;
        Wed, 16 Mar 2022 09:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCF92TiG0q0tk4p0BxTZxj/a9KWHNr9Q1ORkkx1xFllNfPdy5W8D75Z2i+NwiI4do5WvcP
X-Received: by 2002:a81:c54a:0:b0:2d6:435a:5875 with SMTP id o10-20020a81c54a000000b002d6435a5875mr1078462ywj.181.1647449239689;
        Wed, 16 Mar 2022 09:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647449239; cv=none;
        d=google.com; s=arc-20160816;
        b=KocXKVftQjWahSfVCTn7W99I0K4s+eDGqE/8S8I4XKzX20P6u3BwU2OOIRLEvwlcxZ
         noVhIb5HY3HJ61piXhNX69ZIRBJrnjC20PskQcP/JAXM67r/BI3KTd7Bz+hdYEH3hfeH
         QMQOYmPoEapW50v3YIKiYYH/AU/VIN1Sh4H+pQNGU7p/586nZMTHlbAS0817auupBSqn
         Rg8rLvqanWL8cWI9b0meMqMo7+bw7cIfNUaWoNaNdN1r/WMWUAuMKricbjg+rujw5H+3
         bwA4nGT08iIHnaXysOihGXIPWlcZ/loYkghS/AVkKC98pQA6OIgPZWUIfEN478k3SIWm
         +6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GDHUjqvoXBWjn/T4vpDVQ9faiM9wq3VNxoH+FJ0Hz2s=;
        b=iLcbR/tv93lmOKij1V/kawm0aU8xOnH9g6U42fua6agLaloDxW+5nHgNNCdxvIpyoI
         M+6QsnImwr3u9rLw1RRVuulJHNcSfBh1u80NSYop95yLsxE03IzEhZX+bk3koxijtM8+
         hv+ywYfjAO/RuMiN+KrcgzZIZKFVNjBOfZ68HwivFbe/eNS+H1pQPU15gZ48A+bUMR7h
         vrGYfGee7JjwuXe+wDQGjIwRyMsqADpLBJxm31HMjb2YzjZgLEY+VV69JZZkPGGn42xn
         SJjO8GLwNYhABAMT8ixIHfeRRO7uTPOWPpIGW+2ojpYJjnNQvXXnzpe/mpqK3sXrreiT
         I3JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZVTyiltN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020a25ca05000000b0062915c76e11si2597014ybg.36.2022.03.16.09.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Mar 2022 09:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZVTyiltN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUWnv-0008Vx-0O
	for alex.bennee@linaro.org; Wed, 16 Mar 2022 12:47:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnT-0008Ui-0j; Wed, 16 Mar 2022 12:46:51 -0400
Received: from [2a00:1450:4864:20::133] (port=41924
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnR-0006DV-9n; Wed, 16 Mar 2022 12:46:50 -0400
Received: by mail-lf1-x133.google.com with SMTP id n19so4702088lfh.8;
 Wed, 16 Mar 2022 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDHUjqvoXBWjn/T4vpDVQ9faiM9wq3VNxoH+FJ0Hz2s=;
 b=ZVTyiltNl4cZRTwou/qFPHKV+cWAEX/zRhcch68yKzc9MKOjjXTyPd4EPzgKHJrMXG
 q328WddTXnXLH6lbjD6QIhFyioPUpu8s94hr+RIp/njkJ6MOS9hYk5JsaXzHxb2u1k8+
 r+UG06m/RrGYHU3s+ZaUi6J9jCN87gUW4MqUT9+qFYF55PYdU4bQHEEHx5gcghBRytsC
 VoqYgbk+NbENJ9rBG3/E/P97HwGxcdY/+jb7YZGR1e89s8LNLRG8WWxf2GAXIMzKsf/g
 9H0dKOzr/2EzJKIdGwB7oNi9DfFLjf8oBIngCl9pHvhLwB+J83TwdZrSk1olnqbj8BOj
 ntow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDHUjqvoXBWjn/T4vpDVQ9faiM9wq3VNxoH+FJ0Hz2s=;
 b=Ov/JaJLmumUydpeHzxHzBmdU+zuAg7C4m4P7Sp+FvGoCc/kwt0Zo05ZT5sqLyvPwIO
 Ws4ILBCSkyIPstW4QK7SRdejMfGbCA9BoyFVPxKVLdv8pErAuqTR0vW0TjT6jq30Coc8
 57W/LgGRNhkHL+R2lN9d10ucvzE5szrqIuqjAplOdm1yv2n4MsT85i9HL9oBUgDK4clb
 BpKzH9w5YvNRqxBnWgaTD1vfRzXSIioE5L2aVG2U9jTPnDE83FYshaJTfaDHdzGAYAoO
 rGpW4190YPUCETrytv0AK1qpovz0JIYGZBHsIBGAkw7WDtFacLel5rF88zzA5KAgX2Dt
 bxWg==
X-Gm-Message-State: AOAM531KDJaFcceLuO4YjK9N92fInNiWoE8ccOd+aHR733C+lUZWSrYj
 woQdqnIhdb9YGHHuCm1kLGWcVONmt7kEkQ==
X-Received: by 2002:a05:6512:3fa:b0:448:75b3:e6ff with SMTP id
 n26-20020a05651203fa00b0044875b3e6ffmr325935lfq.150.1647449206449; 
 Wed, 16 Mar 2022 09:46:46 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a19fc1a000000b0044846901ea6sm220845lfi.42.2022.03.16.09.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 09:46:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] hw/arm: zynqmp: Add CRF and APU control to support PSCI
Date: Wed, 16 Mar 2022 17:46:39 +0100
Message-Id: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7BdYBHRB4Ov3

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the necessary modeling to support some of our firmware
tests at EL3 implementing PSCI (TBM). These are the test-cases
that were previously relying on QEMU's builtin PSCI emulation.

Cheers,
Edgar

ChangeLog:

v2 -> v3:
* Make RVBAR_ELx register reflect updated rvbar
* Sample rvbar prop at reset
* Remove setting of minimum_version_id_old
* Use OBJECT_DECLARE_SIMPLE_TYPE

v1 -> v2:
* crf: Change APU_MAX_CPU to CRF_MAX_CPU
* crf: Remove empty interfaces
* crf: Add include guards
* apu-ctrl: Change NUM_CPUS to APU_MAX_CPU
* apu-ctrl: Fix indentation
* apu-ctrl: Remove empty interfaces 
* apu-ctrl: Add include guards 
* xlnx-zynqmp: Add comment clarifying SER/DESerializer

Edgar E. Iglesias (6):
  hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area
  target/arm: Make rvbar settable after realize
  hw/misc: Add a model of the Xilinx ZynqMP CRF
  hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
  hw/misc: Add a model of the Xilinx ZynqMP APU Control
  hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control

 include/hw/arm/xlnx-zynqmp.h           |   4 +
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  93 +++++++++
 include/hw/misc/xlnx-zynqmp-crf.h      | 211 ++++++++++++++++++++
 target/arm/cpu.h                       |   3 +-
 hw/arm/xlnx-zynqmp.c                   |  46 ++++-
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 253 +++++++++++++++++++++++
 hw/misc/xlnx-zynqmp-crf.c              | 266 +++++++++++++++++++++++++
 target/arm/cpu.c                       |  12 +-
 target/arm/helper.c                    |  10 +-
 hw/misc/meson.build                    |   2 +
 10 files changed, 889 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
 create mode 100644 hw/misc/xlnx-zynqmp-crf.c

-- 
2.25.1

