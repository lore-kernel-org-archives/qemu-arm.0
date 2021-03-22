Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3437429lfg;
        Mon, 22 Mar 2021 03:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjEIaiQXEsO5cBJfFc8dmKzubIM7r9kX6YgDvIhAb/1/ou0LKASCMNqB2zIaNSqjpF1G8T
X-Received: by 2002:a6b:d60e:: with SMTP id w14mr10231785ioa.187.1616407691413;
        Mon, 22 Mar 2021 03:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616407691; cv=none;
        d=google.com; s=arc-20160816;
        b=lj7u452ZmlLjel+3SDfaaBNq+FimjVlruoDHNn6qJNstj8zB3sAk0zozvB/5toJGrr
         MTMbU7oWhLlFWjHjoy7FOQeQmGqMbsCPLefabdl2BxNsc5Z5vwdDBG8rPT/5BJKOiWFt
         Bc2YLTvONL5Bz7cq7KJ6KR9fr92LRpxgMyyAfC8aWMdtRh2HucCXGQzONBK4HKIWmLsn
         mpp0Uqrv9sg/ioRmcf9yZtAnijwfenTy3ajM0F7ja/ii2EI3AGwQ93CokR+GcjK4B4Yc
         u+Yn5PapFxDTwQ44YcIJbF28f11d+bisgN5wjTH7XG8TuB2E7tuS0Pm3QPWpCvI5b/m0
         0SXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Jr7Nf4ZOpS+Hp/7sKCD1OOapTVuiNfoOxyZqmhUtVbY=;
        b=hxlBOSPDJQGPPKVEY9btbymupFDYQyGOs+eM2lw0EkuAk077wIcB6WbGtvmQmgOQyt
         dEWR955iMoA2G3mOvTD6vzW/tUnbQ+AQeMtXKhnQUTWdMN/914OOgFTG+Jwqm3o9+roV
         dcfz1kWvPct0n0tNgK6GeVEOEBAMPwZw+kJPgD44rh0UVS8hunYalIiMnZVDic5D/TcE
         G3q/WKrNERX4KGNDbGIJiT9FqHrluV/9LUtf5WfwFHPjE8MKf7oa6JcWVyRJmB460jkR
         8TZg5hIq5caFFBu4D8S9zHgNwL6oZMQkArLeFNKg5kv/rDK9LXqI2xrJwENQcxAhuSPD
         gOgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bfKGvzUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si8541246ilm.83.2021.03.22.03.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 03:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bfKGvzUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOHTm-0007FH-OB
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 06:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTO-0007CF-J3
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 06:07:46 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTL-0002R6-OX
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 06:07:46 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v2so8288132pgk.11
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jr7Nf4ZOpS+Hp/7sKCD1OOapTVuiNfoOxyZqmhUtVbY=;
 b=bfKGvzUMkZvD8O5vhedoiQESIMu4RIH7ra9TbytC80xVAXrARWOKCB2poUytDaP6wj
 s9jDQMsrGCCDPUAeBaGU+UIHKhlYuSnOmBDQMLl/bP7mTtJmwg3Z3Nu5v1uIYof9ojO/
 du/xCfvE55wVpRwvjiGSh2J+0vEKFNX6Wti7EOv1iuwVb8btaFwBcjiClNKhEHHefVNw
 aSRdgPf3l9D0CTMbSrdef/vcUyoEnnts+X67HI6H97qDN0NigY1NCR1Dfw06h/geCJzu
 lacTURJnhh/MWlA4ZrQ1dEIH6dYj5xhc3dU/7pxWHmi9ve+N7yOFgYHQeAxvMhyxCTkx
 VpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jr7Nf4ZOpS+Hp/7sKCD1OOapTVuiNfoOxyZqmhUtVbY=;
 b=tksvn8nNRmyVuEI6GrAtlZjhFdzMbdufgYEzv1DbvguQpP80MSix7i8IDC0ERBx6DH
 LmB6zy4PCJbTUV7J9pr/WH+vXk9uR/6xFSv4kPwBTSvnWl++wdEk1/kEbc5yjZ7ui00e
 jR67tZEaojjxyrRpDzbMwKQ63H7n5ShxW+811Z7w8ff/jAe3TOMEPj5ZRc7s4IjNV/EE
 IayR/al9ZZXKoZtZAYkksww0Ih8RT6X+YvCaA1s0JI+ngq4UCUQpCqpuRB/e9PTg4+r4
 Z/dyemszqvyAZTCDYdE8h5CKhJMk8nQQhQi0vJLNIrfxONEab6BX/1J87nxHyC6acLIU
 ldkg==
X-Gm-Message-State: AOAM533pBx2dEDxxmQ5hNQ/7j0v1Vykdo9IXsOwyjEeMU9Gwdo21uGTz
 a1pxglPyswcmTwFeSVVVdWue
X-Received: by 2002:aa7:99c6:0:b029:1f5:c49d:dce7 with SMTP id
 v6-20020aa799c60000b02901f5c49ddce7mr20611403pfi.78.1616407659285; 
 Mon, 22 Mar 2021 03:07:39 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id c193sm13697145pfc.180.2021.03.22.03.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:07:39 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/3] target/arm: Add nested virtualization support
Date: Mon, 22 Mar 2021 10:07:23 +0000
Message-Id: <cover.1616052889.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 Haibo Xu <haibo.xu@linaro.org>, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zo8BikoiJnWe

This series add support for ARMv8.3/8.4 nested virtualization support
in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
has been tested on a FVP model to run a L2 guest with Qemu. Now the
feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
starting a VM.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-5.12-WIP

Haibo Xu (3):
  Update linux header with new arm64 NV macro.
  Enable support for setting KVM vGIC maintenance IRQ
  Enable nested virtualization support in arm64 KVM mode

 hw/arm/virt.c                      | 11 ++++++++---
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 ++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  2 ++
 linux-headers/linux/kvm.h          |  1 +
 target/arm/cpu.h                   |  8 ++++++++
 target/arm/kvm64.c                 | 14 ++++++++++++++
 target/arm/kvm_arm.h               | 28 ++++++++++++++++++++++++++++
 9 files changed, 79 insertions(+), 3 deletions(-)

-- 
2.17.1

