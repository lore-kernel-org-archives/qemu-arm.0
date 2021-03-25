Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp529520lfg;
        Thu, 25 Mar 2021 08:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrZzC2kXxulZ1huaYt6FmdZUFC0r6EY+vdhEzHwLKQIJozyL8tiy9ztt9o+Lh370xpVBAG
X-Received: by 2002:a5d:89d9:: with SMTP id a25mr6892011iot.69.1616686686285;
        Thu, 25 Mar 2021 08:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616686686; cv=none;
        d=google.com; s=arc-20160816;
        b=hUPb8LRHh/jqaQaNJS5AFkwzCAMMPxDgNJKkFh1zcmcDjNtUmNoCS/3E5fpxWSdbea
         MCvTwXEG9QptphH3Z6NBxc7RL/RbT84ZNFDw/I+n9WYFgnId/NEilYNQcP6VNonvlHMt
         AYnsZ0GwAnyHkVSS0jKeYdz5WNRJQ+VDTlbpBfFv32Ibls58goQXolrX6VJfn710sq23
         oni9TzBs1/5CyqrHgpA+pPhYsmdM4Vy8/pw49ad9WVQjm3S82nywCJOfNhLkI1rGsYEC
         l/IAhn7JGUgcpUyFtmEXsCRBF7YAO0pjRTDTgOCavTNxYCBgKvMT3S4fhJVr6GLgh24R
         Z9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HBUJPboo8vzvo+P46JoUkwrV2UGz/XowQ0iwB317xoU=;
        b=LuK8pltbYUTWWF20pUr478twaxqDuVo+CU5ar2vhP0g5Ez3rdyzyaUnNDIzAu7NNRS
         LHoGP80vjWQWHpdo6yAQ4hZIVg9ToeRWrvZqXcyeZOJP5tVmsOzuybnoIrr77AoJkCpE
         u+47tswemtzLx7BGBhz7dA/V02ioN2UmXo5AKqOKi+X9YG9nQwMFtCAig8nhv8WFBshE
         eo1rlQh50KDvF3iOybNhVpSfFUBUkWEmkr4WqNlHMGx5W+hSDiB1G9sCeJ3PCyJ6LZjW
         gLvswdrcAMON5eLaEby0S2qDpWn5C+nTv3fE1iG1jpmIRtbChwWXIPT3EbV8Rsxh+LYH
         +ByQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vyomhw+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si1586096iob.94.2021.03.25.08.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vyomhw+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPS3h-0000nL-HG
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzA-0005E6-N3
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz1-00055q-JI
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g20so1414130wmk.3
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HBUJPboo8vzvo+P46JoUkwrV2UGz/XowQ0iwB317xoU=;
 b=Vyomhw+uoEfnfc3INjXZvtatCkD9AZ+Opmpsxz4Ayz/lLNEIW23EKRXk5T+AQcKtIb
 oMWueOa/vaUXwMvD/5CHV8KKyCE2NJlc+BsowTrWsdSLzwn3ESUK9y1aYkvqJQGyOyFA
 jXVwzjoc4O2IlTeSX0lF//lvZI3Az9T8M7PfZyyp3eL1dzHkS45wwUruJnuE/70oiuXT
 fX3GDMQAb6gpso2j7dxTiHurmQiztMgt1W7yKwKyweskstdeFeeBeU2X7nodJs1JEAI+
 NKifyw9k57osxYpHsHjrgvnEn9dNH/NYFfoiketadgZVI5iD9yRQ4ZOTsOkr0FgQganA
 dEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HBUJPboo8vzvo+P46JoUkwrV2UGz/XowQ0iwB317xoU=;
 b=kF1OClwGweuTYN/2A50hWj9kfHq4qlUGBngHjX0mxsiYXK5lnpH0y6rqDuLlP8KyHA
 srKyCMyWQ93MNz8k4qLelEEiLOKyyxRtJ6v8U14e378pnnK+zTYEK3mzUDa4IoeUTzaM
 vdt6/ALfSc6sq8oQwg+fS6gI6h3gD6ih5SlyMfmQvEBL5UYciLj4gAtGKxZs9hwKRWMa
 ivpXWPNBLSWpvL3MMGVEzkdikJQkYyPTQAx0YOhRapvVvOIGgPugNG9/NC+sp2Ov97CV
 FbWrjb3/HKTEL0yxMqnPYZMQcec0Qr/rOn8Ppy4N5Yx743Uv9lDBLmsQ1KLwGpT3ZLIp
 nzrg==
X-Gm-Message-State: AOAM532r/5MkO9K3wrs6lXTFz1Lh+FBmEfKgEGBGIpbdGowu6jf/j+A9
 ghj9hZNk6rB3JGUrrNnEAVa1t28sExizW4cc
X-Received: by 2002:a1c:f305:: with SMTP id q5mr8524371wmq.96.1616686394040;
 Thu, 25 Mar 2021 08:33:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/4] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
Date: Thu, 25 Mar 2021 15:33:07 +0000
Message-Id: <20210325153310.9131-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /JpE8pE5MW/r

The function machine_class_allow_dynamic_sysbus_dev() is currently
undocumented; add a doc comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4a90549ad85..27106abc11d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -36,7 +36,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
 
+/**
+ * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
+ * @mc: Machine class
+ * @type: type to whitelist (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Add the QOM type @type to the list of devices of which are subtypes
+ * of TYPE_SYS_BUS_DEVICE but which are still permitted to be dynamically
+ * created (eg by the user on the command line with -device).
+ * By default if the user tries to create any devices on the command line
+ * that are subtypes of TYPE_SYS_BUS_DEVICE they will get an error message;
+ * for the special cases which are permitted for this machine model, the
+ * machine model class init code must call this function to whitelist them.
+ */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
+
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
  * returns migratable MemoryRegion provided by backend.
-- 
2.20.1

