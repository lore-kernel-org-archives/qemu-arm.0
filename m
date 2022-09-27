Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp444867ocs;
        Tue, 27 Sep 2022 03:13:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5c3FjQTvRFTCfThiaHl/2Z9qJxDaVr2c5KSLzYwKEYkrZXPEP9sQj44wG1EXDj52HMe8Bc
X-Received: by 2002:a05:620a:4008:b0:6ce:8725:cb7 with SMTP id h8-20020a05620a400800b006ce87250cb7mr17775655qko.480.1664273591346;
        Tue, 27 Sep 2022 03:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664273591; cv=none;
        d=google.com; s=arc-20160816;
        b=L538zQt1KKKWKF8w1lGQjrSeZ/pUEm6OwGLcyf/3U2SChj8qQS6her28Q+ty436KSF
         oz71mGFpVAKQz/X84Ek/s7O91FbmQlzQ835nUlAiV3lrYxMFotuWa3ULOkdWCRH7jy6u
         jokInNXJOLFK0qtbxMe0scT52Bn7kuLKSCbrH+GxDfGVM53ClvZFzKTeo1iia+JjmHFI
         5T0xVl7zbEYtdqC/cec01qb+5Zy8SWDGnfw3hGvWL0u0hwnYVLZHk1uLdmeCstBRiq18
         gQMtibB/rjjoo4yE+6rRmzb7FaPw+tGtZUBCStSfK7CgZtkhUWEitKpJoOquRsaBEnvf
         TLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CJWWWX0j3DH7dA8Y5VomwvEKcqa9vhwQUJYhBUYvd+Q=;
        b=FqGpfXQQn7GUyCbpyxOnU0A8b1nB0VAayCfGCK7tP2TXvByZEyie6+rrJpEdw5ZuLo
         LZ8SmcSvlqW0t3f98MUp63t1u/x1OiKPzd9CsTEamV8FMsOm631rVr8KEFa/VCFd09LA
         Ofeqj0DC5UNtR4jHD+72NSv5vylv3aLUBGdgF9dCS0GOXHANNGx2JHgfddjmTqjba47n
         +QNHHqaKtf2ESX+mYwerINu4FfQ7vRvw1Sp1zD3Ms2Pb1eCkruwv6yr+tXS/gneu+Djs
         MXrEX0Jf6SWi+f9pVNfUOob6ZKtlZhTUdWVkWIh3cTW2tqaQlWUkCCQLvCZsH/lD/zUE
         lRLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qK7WkBHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm22-20020a05620a199600b006ce8c77425asi525492qkb.133.2022.09.27.03.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 03:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qK7WkBHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1od7aQ-000111-VJ
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 06:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7aA-0000vH-L7
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 06:12:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a7-0002Vy-OK
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 06:12:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id ay36so6226871wmb.0
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CJWWWX0j3DH7dA8Y5VomwvEKcqa9vhwQUJYhBUYvd+Q=;
 b=qK7WkBHmP6cpQ/O20B4lKQ+1uHK48TTvNpaNGwmYAwHy/fphYsI5MqF+PX7ijXMvbN
 2RtCjUCr9z3zCVrNdWEB6uUjOMHtbePqrfwWlRhudYGlfb2o25eiC9U/DVNBd0fOv2J+
 CHTN2n1Bi1wI600nagm4WQPU7kzsLymTxfjhzb0pmh4HtOXmkiFE2Q8o0lVs+LANMvyw
 ZdAPY+MrK1GtnKoK483tb4rnrS4zlzQTmjwzMNjm70HV6atzhcyl2JfxUN86nAvUH8kk
 4GOJN3AU/kI6acxCunk0rYklFhhCsF1+EDBxocZtdX+4Yqt9+IYI1bBf3W36Zhv13inJ
 yOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CJWWWX0j3DH7dA8Y5VomwvEKcqa9vhwQUJYhBUYvd+Q=;
 b=AGW7DUxQD5z2I5IlbuCb++0i3lsCCio7wVu+YZRJ2aCLBuKUj8lsyMV/WqeqG/U24I
 +GR47KPHPGTaIYXmtUv/7bHSJHTrGbGE60X0kv9zkoHCmvRnbfnZ96NiinvqJuCfyoPU
 97K2z0Wg+O/sL4dWhQ8sVS6lmLUy34MEp8RNnBm6kltboQClywKxGbmfdiaaYpERx4rq
 YBuJDKJ5TXE0iZ2Brpidb54gMm8T8aS0Wj90jTTsBRS/pqB4rdkpdji5py8C2JF/YzXm
 9r9M22+vIeOIqUo0rOWttXEdzxk5UyBLaQiTWSi+VcJZAM2GD+Udn1M9ZCV1YPc8OAza
 xnyg==
X-Gm-Message-State: ACrzQf1Yvi0hx9bVX2fO96MKdl+jze2oTgNg2jMdcg5gN9/BIr+ATT8F
 03ltY0hZLjqhylyCSQNvFvSq7A==
X-Received: by 2002:a1c:7c03:0:b0:3b4:7647:ccd8 with SMTP id
 x3-20020a1c7c03000000b003b47647ccd8mr2053064wmc.10.1664273569674; 
 Tue, 27 Sep 2022 03:12:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:49 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the GPIO
 node
Date: Tue, 27 Sep 2022 11:03:46 +0100
Message-Id: <20220927100347.176606-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d7vNS+3lMUSH

Since the pl061 device can be used as interrupt controller, its node
should contain "interrupt-controller" and "#interrupt-cells" properties.
Fix the corresponding dt-validate warnings:

  pl061@9030000: 'interrupt-controller' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl061@9030000: '#interrupt-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6805c57530..10ce66c722 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1012,6 +1012,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
     qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", phandle);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 2);
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-controller", NULL, 0);
 
     if (gpio != VIRT_GPIO) {
         /* Mark as not usable by the normal world */
-- 
2.37.3

