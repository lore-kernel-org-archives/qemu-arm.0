Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2216713ejc;
        Wed, 24 Aug 2022 08:52:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6jtf/ftxhplisRhhNh4NCY1BTzZTVul8e7ly5ya97hLHxfVSElwEG9rde+Xlt+gVLWU4pA
X-Received: by 2002:a05:6214:2387:b0:497:15b3:f792 with SMTP id fw7-20020a056214238700b0049715b3f792mr2384050qvb.118.1661356367675;
        Wed, 24 Aug 2022 08:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356367; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvZK/mnyTrTv6AJM6v8dKFZtHlfWyEREsrUafYCp2NHttlW1JKClXMLIFlDn2iUxKE
         pQiQU/LFvTE/s1aEgQc92/ht+qPK6IW+BC7cedDwYy1SGUsJVbx6P3FJQSEyXKkoxZ/N
         hh19vTc5a3zplMfWyLkHylUTktVept7ZJIyrATUJswjunTLQzIkH0sxzJ6FdFuBL3iRl
         ThXwnfk4BJeUHDk/NSMilLBUh8987ko1AWpY64HKGY9keeHzZEkrFpiWJ7++rSOafeqi
         wcOb7TC3lqOoYPVKstWpmY1v1YDO42lmf27oGOGsN3J/O/0ydZI4+t+TH9vHo9Ah+dTR
         gGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ohy3bUJKZGFkjSeZY9AWoC2jPWdXu0ag6d5K6Qn5vz0=;
        b=FSvi5NIqVLd+j8yy2XkHBcvaVuwfevNcLzoaKrEhOWykaTMBTvs1iMChUbgB9kAu/f
         ndQ/Dh3hlQO+As/x/nujQavGBCjykOlT4VHNZTHWGJZZTnVOFdJa4U5Bx27VAh8ketHa
         SmP4Rx72pdi5WcI+CPPvgrLbmPlrMJUqfG1xcjWpRIZbeaszbCkL7JgyOg6RD1skNbaJ
         d1sDEsqnwk6TobRdLkhYdaIKfQ8aUHfiIBKxKITNq+pmWnpms58oFLiIl3NmGrA4C0cH
         5M2q8W15IZsNcL8BeFYf9rLx70gCg/WcBP8Pi2NjiH8+lm3DmVXbfruNtfPmGbsBNovi
         WAtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JM5uTKHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a05620a444f00b006b95b0a7132si10243662qkp.26.2022.08.24.08.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JM5uTKHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsgR-00030j-7i
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsfA-0002BE-0x
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf7-0002GQ-R7
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k9so21311564wri.0
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ohy3bUJKZGFkjSeZY9AWoC2jPWdXu0ag6d5K6Qn5vz0=;
 b=JM5uTKHzHWO6C4wlZpHJYwKCnAzZHA3+IZVXBchD6yHxEi/Gq+9DTpUnwXxSwLPg8D
 mVWRfk3TaBDAO2vCfFfQLJR5hW+ybGgxBmDjvnyRsyXeIVqCtNYyOcm35ZKfpur0peJY
 yFg45aMADf2A5u+mMSS9Duli9lrutVvfnTji6dGr8gEL1gQmfbMbiU30ZjLQLPqCi7wp
 rzvMl6DW33Q6cLdR+jvHN6Nkoyv3z24u6Ys+PqNKi18WYEV8zjn9DQNqT36ZfJW5cipo
 +KZ0qmH7VXE2d47pH4q+KuzC0bX+ENQWGWdWh1YARLBrKErO6VHGApudIzodIVCPQaeL
 u9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ohy3bUJKZGFkjSeZY9AWoC2jPWdXu0ag6d5K6Qn5vz0=;
 b=4MrvD85cSwGTUe5LARihKofWvEVaVgw1oD/SZ/HGn5gt3svxuJ+85Tx16Pnjfe+XIT
 o3ZjDR0ay/gc/Vuct5neZ3g6+TxBGyigMvCNCeNWP6o5XpN0VlPJ48JD3BU1TRtdB6bw
 e9bFBaGhUFmTEKXkwfR9a+7U9Smbwr7SNnQTnElzqCTRXCkxSVLna5vnnkXxijxpQhRn
 3hqyvmtRnKcni9Y81pIi/QN79IevICwlmnOqQZgbt2KP8P2/HqBF6zF0T0XC8y9GQZan
 ZvHmSOh96L+C4O+jkrOZ2DgP0BTcyY/1PiC+tPZaaLzZCiDHzRyJ5UCwaLSw8k8xhkBZ
 k4yg==
X-Gm-Message-State: ACgBeo1gv4Eu9ggAHR27+oLQEdnJgYYpU3vR9xqR8YMQSxJutSqv4CG8
 UAqI0B7KhRINrX17H5hxud+EKQ==
X-Received: by 2002:adf:fc8b:0:b0:225:5a71:be1a with SMTP id
 g11-20020adffc8b000000b002255a71be1amr8173178wrr.651.1661356283710; 
 Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 08/10] hw/arm/virt: Fix devicetree warnings about the GPIO node
Date: Wed, 24 Aug 2022 16:51:12 +0100
Message-Id: <20220824155113.286730-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kz52QiDJqoQ8

The GPIO devicetree node is missing "interrupt-controller" and
"#interrupt-cells" properties:

  pl061@9030000: 'interrupt-controller' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
  pl061@9030000: '#interrupt-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 952af37935..779eb5ea31 100644
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
2.37.1

