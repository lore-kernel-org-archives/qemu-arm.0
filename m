Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1023849ejk;
        Tue, 30 Jan 2024 11:03:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENF4xgsR8OZpmizc2BqwkeCghgGvzWyPjiW+y3GWi/VTAidHTexGcjuT8DqkVnhWxOlI9V
X-Received: by 2002:a05:6214:20c1:b0:68c:6294:e74f with SMTP id 1-20020a05621420c100b0068c6294e74fmr1906218qve.33.1706641416956;
        Tue, 30 Jan 2024 11:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706641416; cv=none;
        d=google.com; s=arc-20160816;
        b=QpKHhW7QNQJm3Ypa6vVk7FvubNUgQgbj4RBhTIbPQPfYy7jDG1KYtz/lsy5qWzZi/M
         VYvoLaL2tktgz7ZYN/Jk+kDN0dPlNj5wAD3M3S20Dkwbca048e8Ge75bFYY3e7UsoE4J
         y/nbu+gfXy9oUZnBeRoqhuTtS6V36VWAhQG94OPXKHckfqSkTFYoQnm7ZZBQwODzPhhR
         gH4co6O7RR3sBCI++gLiLlR/T8of+Cw7LHNKzPZMjDmH0paVjbU7QtF9uA7Il5vRsLmX
         0KGTslGg6Zj8n8esjDNjiw0wMQgc9ViWLAb25GguddbVXew+TiTY4LoJLtY+ol5rRi1s
         /w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gE4N+SZz6g2Nc8XtfAugEaqTsmycgrTHLFCKHFIc7Ik=;
        fh=SR+8DozJdQxNforhpK7RQJlJqxcnmmBQq9YEbztxGAo=;
        b=RSkxjXwO8UqBIUwloC+qGghtK/llH62CJwsldkUJcloQQAXvzq6yjpKo5d+IkJwUS9
         vn3OjcIR7uMEFG53kAhHoLwbBZ+OuMv/jkxbCjl2MaOuv/yH4VRcpIwqj0snRO8dhM4p
         v9CtZrfqhAlRDK30IiUJp4ADr7viQzHZiybvVD3stE8SYa1GR9ypRAAIn/LwQAgcgPMr
         Lt4U38pqzdgC6dYnVQSI+w3/3j2Jo2xL2oFbkyR/o3UxofQrjVV+FJXt77wppFsQKgO8
         BTI/f+fcAWXCYb7vCmeRumYidvnEmrkyCJ/Yw7r6iahKXaFdFMHTn1zsNAqvS1sGsQGh
         NXug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zpzCG/I9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fp13-20020a0561223a0d00b004bd8688c280si1372511vkb.318.2024.01.30.11.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 11:03:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zpzCG/I9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUtON-0000wJ-5t; Tue, 30 Jan 2024 14:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUtOL-0000vg-76
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 14:03:29 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUtOF-0008U9-C5
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 14:03:28 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51121637524so547097e87.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 11:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706641401; x=1707246201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gE4N+SZz6g2Nc8XtfAugEaqTsmycgrTHLFCKHFIc7Ik=;
 b=zpzCG/I9dy1Hcdc3hMSZ6GgTU3Pvw6s6oqSv+mqUnh14mStgv11gIGppuEaqPTFjJL
 xUeRIVhxidKbJQyRLZejDhVWW6tuy5e+kjnXMCqMsjU4ySbhiKWhaNk+vdAYg4fAfWlo
 3RgemX5iogntu2Y15GPRlBllhvgenHCsC/K2NhDxNZVXININ7bsKCYkKBqEMO0x2F4eI
 0ZnddZMJ38P9Q8DRqFblqnX5HvyRyH3gyK3UACR9KH5TTkgPpE1IW2OxDcSExOPVqfOv
 HoxLmLWAO8hjy7ipI/hb3ff9iwwFmMtdjRc1IpS1GbhKKibiLJYMB+yZN+MHFzdaBO0J
 EQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706641401; x=1707246201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gE4N+SZz6g2Nc8XtfAugEaqTsmycgrTHLFCKHFIc7Ik=;
 b=QY2UA9RSlW4HRrNt10b+h/8g8UM4tB3smkS6RM3AebZOT/5ltquWyIu8iFuqjlp+Gg
 z76GXZ6tQLkBErvqHZ2gqHeQ3s+/ZDnKeMKtfRZokzcIWvjITs+wvAr1Y5+7NxJQO9Rs
 Nqy2z/0nXSvBE0JIzvXXQbOdR8GsouUc2/cnqApRxzA6EanjiuD5zvDcCn7w0Pxd80yv
 7WAiPltSYZ94kZuR+uqsoNupbp148uQsfZEGqWox1BKLjWTX0N/ZqRNbWMK9jlgF249P
 g2WjBXpOQ+E4YhP3IiHQc9blo9EzmgM9iND//q/jxcLwAp1IThuxBvwecQl1WrivrN8u
 zmSg==
X-Gm-Message-State: AOJu0YxpEFKCqg7GVcabWgDWkw+wTiTEnnVL6FqGjC3RjXLcrdQuRMin
 Ukcc+jjaEVo72QnqeuuAuJY+qf7G/uqVK1LIvKu0dNQYS2jFUDPusLFwPyjRIcc=
X-Received: by 2002:ac2:47f2:0:b0:50e:7702:a189 with SMTP id
 b18-20020ac247f2000000b0050e7702a189mr7185145lfp.22.1706641400804; 
 Tue, 30 Jan 2024 11:03:20 -0800 (PST)
Received: from m1x-phil.lan ([176.187.218.134])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a170906a10500b00a35cf6727c1sm2179896ejy.105.2024.01.30.11.03.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Jan 2024 11:03:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw/arm/stellaris: QOM/QDev cleanups
Date: Tue, 30 Jan 2024 20:03:13 +0100
Message-ID: <20240130190317.25692-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: V8eKtfjH2Z9w

Gustavo wants to access the QOM path of an input IRQ line
from the NVIC, but since the device is orphan he ends up
with this nasty path [*]:

  -device ivshmem-flat,chardev=ivshmem_flat,x-irq-qompath='/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]',x-bus-qompath='/sysbus'

Add the missing parent so the tree is now:

(qemu) info qom-tree
/machine (lm3s6965evb-machine)
  /gamepad (stellaris-gamepad)
  /oled (ssd0323)
  /peripheral (container)
  /peripheral-anon (container)
  /soc (container)
    /v7m (armv7m)
      /cpu (cortex-m3-arm-cpu)
        /unnamed-gpio-in[0] (irq)
        /unnamed-gpio-in[1] (irq)
        /unnamed-gpio-in[2] (irq)
        /unnamed-gpio-in[3] (irq)
      /cpuclk (clock)
      /nvic (armv7m_nvic)
        /NMI[0] (irq)
        /nvic_sysregs[0] (memory-region)
        /systick-trigger[0] (irq)
        /systick-trigger[1] (irq)
        /unnamed-gpio-in[0] (irq)
        ...

[*] https://lore.kernel.org/qemu-devel/20231127052024.435743-1-gustavo.romero@linaro.org/

Philippe Mathieu-Daudé (4):
  hw/arm/stellaris: Convert ADC controller to Resettable interface
  hw/arm/stellaris: Convert I2C controller to Resettable interface
  hw/arm/stellaris: Add missing QOM 'machine' parent
  hw/arm/stellaris: Add missing QOM 'SoC' parent

 hw/arm/stellaris.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

-- 
2.41.0

