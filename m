Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp446287ocs;
        Tue, 27 Sep 2022 03:16:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xxcgHBVPcVkrhNWHgltbCk8rNJtOX0AMOJJyHUVjY/HE/ARwZmjUvdASRkVcpG14KmeYF
X-Received: by 2002:a05:622a:393:b0:35d:472c:7bae with SMTP id j19-20020a05622a039300b0035d472c7baemr4778216qtx.641.1664273786470;
        Tue, 27 Sep 2022 03:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664273786; cv=none;
        d=google.com; s=arc-20160816;
        b=YFkrnxaXqln2fMydBCVoYXPCiDgPHZYYvHjh+DSTk0B3V6t2+v4dmuoynxtDViWwTp
         6WQSWBj+29A0mkJE3eQN+CLZl7j7R/jxWhPapIvVHLjKrVRE8POuJdm0UFzNPIuRAkeO
         I7fD5nc0QKzPtKISLVuyvgds9E2Zm7md/06ZCeRvpkZG9QewgUMlg+sbicGIMoak20nU
         S5vi4iUbjbR+3Pf2hWs1Mt4g4vmCCv1w86ZSUtQaYm2j7UKk8zN9eNv8PQys3/L4FbxS
         ZsFJHcqxs07wh4KhViFYegoyQXTnydTc0t4CgHq50MqZYLOaxHe1f97sb6e2xC9Pl3L0
         J5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mdbZvGlemRTML0U9/q6dutguZkYkpzqfdzZefPdbkXA=;
        b=ZrjBsKMcnDiWP+PaKrrTM7WrXDAO2IsolBW4eLo2ihB3Ft6mNx0disdc3AHNDbBMKC
         se9bKb9jahGXwpv4nHhx66KQARw6Sw6k/2Ag1GLaT2ldGnCLy5DRQ7EmFCxvnYxvckXj
         +VgINwMjGyZnkPeU5f9OmtYh/5DrtTnm+rkKsefih1wymySTMVW80S1uBLLep8xTBchA
         hSSk4hNiHgA1MECEwlaayCVBbGO70MH7PVBfjfl3zH2EXWHRfKrsrtCeHDscWb25JSSg
         jpX/mV4d87ULvr8RKiSW5oRwitvkWvc8s+1fKxG6++mmNeJ1+xmxnLV7QsqzMFEu3PPE
         q5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CmPqP9vb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05622a145500b0035d160d7405si527291qtx.110.2022.09.27.03.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 03:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CmPqP9vb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1od7dZ-0006il-VF
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7aC-0000yv-Fp
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 06:12:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a6-0002Va-AM
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 06:12:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id s14so14304487wro.0
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mdbZvGlemRTML0U9/q6dutguZkYkpzqfdzZefPdbkXA=;
 b=CmPqP9vbY+PGpz+U22K2Ul/camvnXkDS+a1pak+dmDNnSZBe+WyD047bdwQ51PDnGe
 eCuJOyQtIzS75Si8r+aP3krDTDBBeeBUT27Hvn4b9s80qDalbkZroeov5WUW6kfXzEpn
 YVYAL1xThHWODyay4szCmdncz/qjPMCI27CJBBuZWxbIk8KZBh4xk0m0uB+5wDYQ3bBp
 FVFjGBwtSkGrryTjPRNrMMgshjbHH8h30YKFOTbyEgPaKkeDjzi+22C4sfIypz+OVAQX
 fMRPLR/HwghA2y30kzPT23L72d6MRBQ8p147loX8/5AuUCyIo3Kif5qCRU7AOc2wWBo6
 LQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mdbZvGlemRTML0U9/q6dutguZkYkpzqfdzZefPdbkXA=;
 b=6LIdyC0V3uEKPkIL8V8cdBwMK6Snw5+P5fbBuFNqS3sQ0sJGVtx/7xzSYep+wMDk/A
 0YfSpIm+GxOYQoheiR6JHkhwvNBZpIXSpdZM6FZSfHPUkM4YGxx+SEEo9w+9Z22MDZk2
 wkwyuyDEC8OvMvzWD9xjkTDC7gTmbpnmONA7ATt6W46NtksqAe58cDKwAPY1TuGthG07
 k3oBKvNjWBBoPLWc91Ps5JgMDjSrjseh0fmZzQJYPuRrdcGOtTW8c5iyHPFgjZtydx69
 zcLbYIT8hFINASaN2EeQhPuYO/XQmUERedVFEyMkBA9j7QgCo0khvrEkaFrgCb2bEZzU
 Wq+Q==
X-Gm-Message-State: ACrzQf0HRD/NBLrKO4NWm6MKTXauQRPuVvaqcuqKQMTNVB3kztVQGmSE
 emDE2aiuaxSOyfzCQlGX2Z+SbmCaeLRrBw==
X-Received: by 2002:a5d:49ca:0:b0:22c:bc93:a9b6 with SMTP id
 t10-20020a5d49ca000000b0022cbc93a9b6mr1643313wrs.10.1664273568980; 
 Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the gpio-key
 node
Date: Tue, 27 Sep 2022 11:03:45 +0100
Message-Id: <20220927100347.176606-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: rGNad57VqAof

The node name of the gpio-key devicetree node should be "key-poweroff":

  gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8605f5058a..6805c57530 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -932,12 +932,12 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
 
-    qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
+    qemu_fdt_add_subnode(fdt, "/gpio-keys/key-poweroff");
+    qemu_fdt_setprop_string(fdt, "/gpio-keys/key-poweroff",
                             "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
+    qemu_fdt_setprop_cell(fdt, "/gpio-keys/key-poweroff", "linux,code",
                           KEY_POWER);
-    qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
+    qemu_fdt_setprop_cells(fdt, "/gpio-keys/key-poweroff",
                            "gpios", phandle, 3, 0);
 }
 
-- 
2.37.3

