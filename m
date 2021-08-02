Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2034297lff;
        Mon, 2 Aug 2021 16:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwestiuog6Kr+Rpfye3tzR2DgtyX58E/RWE9pKmCeJ0umaCCPfVdZkyIav27U13oZi2lk1P
X-Received: by 2002:a05:6638:418f:: with SMTP id az15mr17119333jab.8.1627945614711;
        Mon, 02 Aug 2021 16:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627945614; cv=none;
        d=google.com; s=arc-20160816;
        b=A3Ylv+NUYDNmagl6sYdX0Kedl2jipLYLcw8PPfifqw+P9zVAsNv5jJr1ipE07oVrPA
         2bCfhdbpPy3xgnqH1Co7ENWwKFrxcpcQRIrSxQOabdglWv8E4/gGm6cVcRiZagGB87aX
         bVq00OkSKLoX/MvjPqxDQpOkp3UPHgiT22OAzJmRKGgALQ+ifoEpXXoaR393ZJlPicA9
         G2eakU/g7G2Y/p4SdbVmdo11dAtNVt+tzb0ov4PxVIwTvKrWaJ+xx9nBdMp2ftXFTvqJ
         OHLbiBAEePG5Ab1POgp4ivq2V6OLQoHUpNbys/oLIEXCt69m40HPBSfIeYNa7Hwpzo6/
         GwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
        b=ilLsOnFtxYEXALDOTPZsih7lZc6EXfyWP5x3NEtWcuauCN4YDxafE6UH0ZT5/1IJBg
         Zmah726qdUTT8Z929B2a0tkRKe+00F852mZv4YW1iGGsbHx5HMe4V2XdnZXcXOMDDyGF
         uPnd1VT++kFqNsU2cI3rrPq6cLbwBrbVRzVI/6ysNXZtXCt6CHvu6H8xE3KAh5JxR6+U
         NC9iVdwyTwce/kgA4+P+/gfJNeEwPYUERjQNLo6mcDZFGeZHn5mM3mNJGxjLQHinmz9M
         BQCnG1v8JIks26nXh2z2XPyVXPzUILIT8iSdA93ACPrunIjVy3XcZBbFH3HCn1EhVAvy
         o/Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Mm0xyK8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25si13721675jah.26.2021.08.02.16.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 16:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Mm0xyK8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAh1K-00059n-3V
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 19:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3z3kIYQUKCPImngUiaiiafY.WigkYgo-Ulghihaho.ila@flex--stmao.bounces.google.com>)
 id 1mAgyJ-0001d5-Hx
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:03:47 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3z3kIYQUKCPImngUiaiiafY.WigkYgo-Ulghihaho.ila@flex--stmao.bounces.google.com>)
 id 1mAgyG-00068f-Ok
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:03:47 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 w26-20020a05620a129ab02903b9eeb8b45dso10001423qki.8
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 16:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=Mm0xyK8e1yq86bRgmho8H09UREqpiFEcNARD6zeJFfBAUhE+n9hC3f067jeL5SEyfr
 frQVqNYqAdfIKDqjBOiWHkWgJB6RFYsh7mOCD9QTZc+mnGKJ8OoxJEgcmyfeGklF9GHx
 orHFUlCC/8LMf/EbzXLq+GOLkHdjpwLFWuatD8paUSMjRk+NPWyYSP1wlbJQmFRQDdXv
 fteugsRyIblLXUGZG8PqF0IcPGRdBnf6r8ERQK2784ovC/rncWWIc5P2uvgqGJtRCroQ
 7Y4Ud4or6xlNOaUhi8P1c2DsgP8GwGs9C8k9RlcbELd3TVF5sU9UGkoKJfY5XSxlmP+3
 PBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WySyKNVtmI1hpq+spiGANC9C/vzKA/exVmPjzKEgQag=;
 b=s3LurWZJrSAPQpHnfRPYOTkwyt0cotMeyXBSEcAzrdEUW/yzai/eizFq/s9sKQEzxu
 IyupVnZZz5BCHEG2vZqnCf1/THfzW4+ZoeNWd1DYDtVpfcZF35aupgq/s7U2XI7BLdjK
 uQ1EKzQdWEyp7B74CXUgf2xIstu1qO5JfCZtrtUEM6JF1W348kTMETO3drdyZfFX95eY
 ddWmELpPLzUld3A0YckrTrTw5810dWcN1pmGZok6mscM61jwiSYaqtVNPhCbYrOzLnT6
 v7KYcwHmU/hF+oSyn2TAYY42AZ9T9/7cA7taeLuV0NUQ7ZQv3LDlND6lzKVVaosAqjG/
 RSwg==
X-Gm-Message-State: AOAM532YSMQOEM9HqfPgcDXuekOByjd1wcNOXI8/JdL8ZY12t9RNBqbN
 IU+6M42bD4YNIosWFGSpmR4K3NuP8Q==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:ad4:5ccc:: with SMTP id
 iu12mr18087739qvb.47.1627945423356; 
 Mon, 02 Aug 2021 16:03:43 -0700 (PDT)
Date: Mon,  2 Aug 2021 23:03:22 +0000
In-Reply-To: <20210802230323.1164787-1-stmao@google.com>
Message-Id: <20210802230323.1164787-3-stmao@google.com>
Mime-Version: 1.0
References: <20210802230323.1164787-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v2 0/1] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com, 
 maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3z3kIYQUKCPImngUiaiiafY.WigkYgo-Ulghihaho.ila@flex--stmao.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AM6Rgcxh+dLT

This patch implements the remote I2C device.
The remote I2C device allows an external I2C device to communicate with the I2C controller in QEMU through the remote I2C protocol.
Users no longer have to directly modify QEMU to add new I2C devices and can instead implement the emulated device externally and connect it to the remote I2C device.

Previous work by Wolfram Sang (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough) was referenced.
It shares the similar idea of redirecting the actual I2C device functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
The work by Sang mainly utilizes file descriptors while ours utilizes character devices, which offers better support for emulated devices.
The work by Sang is not meant to offer full I2C device support; it only implements the receive functionality.
Our work implements full support for I2C devices: send, recv, and event (match_and_add is not applicable for external devices).

Shengtan Mao (1):
  hw/i2c: add remote I2C device

 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 6 files changed, 340 insertions(+)
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

-- 
2.32.0.554.ge1b32706d8-goog

