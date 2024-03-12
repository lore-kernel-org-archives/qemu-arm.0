Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674795ejc;
        Tue, 12 Mar 2024 01:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxAl/Ax9YH8KtTP1qR0h/ullAS80PFOg+nY+6fbGhoZGXMVwWrPpyGG8w2VSKHnCmE3N3OBeN7BMdgab0PW56PBA5UR2j5
X-Google-Smtp-Source: AGHT+IHN2O8CczRsCT5tI1PsZ7gHrfsH01QDsEFbo1O7D6BA9Tv7lE1dGiPBpRyTEffN73TJGPdd
X-Received: by 2002:a05:622a:11d2:b0:42e:8523:5b82 with SMTP id n18-20020a05622a11d200b0042e85235b82mr12474329qtk.14.1710231874585;
        Tue, 12 Mar 2024 01:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231874; cv=none;
        d=google.com; s=arc-20160816;
        b=DyG6eqk28yCpHxWPFE6te0Ph3MEk2W1BtAAE3KXFEjBso2hZKdjwgwnYd6l0+sWab6
         3NF9U5dIauJvzlvyuL9Vy1tG0xC/GxLnIEvVRPvflFdVtb7M6NL1mbHIf/xUr+kDmhZr
         o23Adpl1elrzExGnNrFY2SGg2F7VY0Czb6E0nNNx/O9LvYBhherrENRCzEbfOqUvmqFP
         GOnFSWqSAbA2VoRXudmIRu5+gujm84XqPoc1i7WSpcZj2PfwR6bFv7vUrOzyCcskDHzH
         2srVtNRiAhidPsT0n7dqF204w+CL9UPv1aUqkeyP9m0ZIGl3/dKW8EEZ+SyVhBgbo2Ad
         eL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=29XjHGwit3vYXMB9dG4vvP3w+ZRgmYEAu29xmgeR40E=;
        fh=QGE208CuWWXjqU8DWoAOzN7HEgdTO9XuMw5AnhzBzYg=;
        b=vszbPbHuwMyWSoeg2af1NNMt1kaxvZCgCzQxLMtTIZ2D4HMT68rZPWaz8JOh354D/l
         /GQO9AzJtROu5D0eTHReAY/uV/r3mDXz6WtRH9KLGauL9wT6ZNYoD2DppybX064d2s1o
         5x8XNyckpfWTO6Nz/LwcDEFjUqFI+MqoAxdROjUcUVHVdU00u5S0/yJtCL86g+tLX+jH
         gi5UhmNP17kKbX18ZF9PNLY0uTGCHdsnkFp+lcWcwN6F5kPZQGy3AYC5y1tnOOL9rKNK
         A6fHxllLDRlkTJ/xmoZrNl/l671c2IZ+BXQ55qDMWwkR1FyD2b9Pu1vY1ZcjD4tJdX1C
         KtbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AX4t/Vah";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020ac85e50000000b0042f0187f3d2si7211873qtx.290.2024.03.12.01.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AX4t/Vah";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxPy-0005sI-Rc; Tue, 12 Mar 2024 04:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPx-0005pt-B9
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPv-0001BG-Ch
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4132a436086so11062605e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231801; x=1710836601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29XjHGwit3vYXMB9dG4vvP3w+ZRgmYEAu29xmgeR40E=;
 b=AX4t/VahYZcM87BIA5LZ0LFDZ899y3UkP1QNKUqZRGY1b0s10GoKAdJXtJMeJY7KHz
 7drWnOAcSx1IthKJR2u9JZ+UCE4gIqgiD2E4jza07NjkiTqD5KMQpUyOn70tlJhotcwf
 /jWuvbra6vCETc3LeA9Szgc9yIYqWelcQ/gL9gCNCpoCpP6hfJiL2VRQRVj2oVqzRpMu
 GTQtjuQoF5aedpn7+ip3Zi9TSNYHoCRW+YFUp3+j3f2CkiGFy+dR0YYg9ASxLjaHvHOH
 gdDgOvC7vZj+Gkb75n2UwgoyTclB7wqU2XSUIzKqnVASViZzlhbFImVMWXLtYFBDTgW+
 Uw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231801; x=1710836601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29XjHGwit3vYXMB9dG4vvP3w+ZRgmYEAu29xmgeR40E=;
 b=TSQTN/y2Zcks3jy/wt4FTonYAGvUe7EXbedWiOWg4L5/MuQQZz3bODCVOm1fyXgZbs
 +mnovxtmoY5x/RWaN9mbi7VKGeAit3h8ssqdG+LCO++Otepz9EHgiR1hthnJlDJa/PDx
 lxEcJcPkXMujlQL0gx3KyS4uJGGCbyAJtEXRFu7lG3UFX/gkCbJT7oJYhtySKBX5fkT1
 wQGO1QrmRCGWVnolo0EhCOnTqZhfzX0nY8V4H24uCcQnRuj+P/8kxfDujs9A1p0JNlYI
 kuhe14Z+dUAi7j8lAOJ7VJEzAvjB/6cc+DaTjGyDef6WaRVPAKV58kVdU1EyndF2jo+z
 dWiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURPvRlvcYKwYW+QYq+R8BoPso+iQ9QNyqvIhF3RIkdRh0YFk8AIELE6vQ1yioOkRkw1FFX3GVhFLUzQNliSDUJV4mp
X-Gm-Message-State: AOJu0Yw1Rqd11/0agnPv8Pdvzy945i+xsZ3jMW0UUXfQGDDDFqUdT7Kq
 lbe+eEnfZnenfdawaVqhwx7d9jBTZVk7Wa6/+9E8sRsTZEpsdWgEiO2SjCZJngg=
X-Received: by 2002:a05:600c:5190:b0:413:27d0:44ff with SMTP id
 fa16-20020a05600c519000b0041327d044ffmr4080264wmb.8.1710231801005; 
 Tue, 12 Mar 2024 01:23:21 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b0041330d49604sm2480108wmq.45.2024.03.12.01.23.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Juan Quintela <quintela@trasno.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Michael Galaxy <mgalaxy@akamai.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/13] hw/misc/ivshmem: Fix missing ERRP_GUARD() for
 error_prepend()
Date: Tue, 12 Mar 2024 09:22:31 +0100
Message-ID: <20240312082239.69696-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: 9XQ7SxK8pO6Y

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, passing @errp to error_prepend() requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
...
* - It should not be passed to error_prepend(), error_vprepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.

ERRP_GUARD() could avoid the case when @errp is &error_fatal, the user
can't see this additional information, because exit() happens in
error_setg earlier than information is added [1].

The ivshmem_common_realize() passes @errp to error_prepend(), and as a
DeviceClass.realize method, there are too many possible callers to check
the impact of this defect; it may or may not be harmless. Thus it is
necessary to protect @errp with ERRP_GUARD().

To avoid the issue like [1] said, add missing ERRP_GUARD() at the
beginning of this function.

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Juan Quintela <quintela@trasno.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Michael Galaxy <mgalaxy@akamai.com>
Cc: Steve Sistare <steven.sistare@oracle.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Message-ID: <20240311033822.3142585-17-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/ivshmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a2fd0bc365..de49d1b8a8 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -832,6 +832,7 @@ static void ivshmem_write_config(PCIDevice *pdev, uint32_t address,
 
 static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
 {
+    ERRP_GUARD();
     IVShmemState *s = IVSHMEM_COMMON(dev);
     Error *err = NULL;
     uint8_t *pci_conf;
-- 
2.41.0

