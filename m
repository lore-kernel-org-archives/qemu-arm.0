Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3213239lfc;
        Fri, 12 Feb 2021 05:46:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPEND4SF28Fxde+j869uu2C6dS9OnpCDgzuS2V9YU9afRiLE0fT1uUfSmYv0gxQKIYRu08
X-Received: by 2002:a5b:488:: with SMTP id n8mr4049435ybp.224.1613137561577;
        Fri, 12 Feb 2021 05:46:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613137561; cv=none;
        d=google.com; s=arc-20160816;
        b=UJrBpyHtXb8g1Y7vNj6l+KYdHSbXl3x6/F9k9aA7sml0RudrChgEgzuWreww9yv2Zz
         SoeXYIpZENBHG+Av7AfNX3RXJcwvLsO6d1DZcF7JYwm18QNmlkbfQzMJVpjgF6mcxfxF
         O+Dn2TqYduMLGxmw+peNMIolTB/T0x7IZZLvKeUOzkZo7UWmG7kr3ajiJ3t/tH1mT1So
         /MS/JQv2Nd1jdWenyNTB/WF9v2hAo/nYei8NpM9HqlGAUVCjJOspMXvf97nkPg2sgpHA
         FZx71wMgQnf4hv+mO0V0aUciFelm2QX8/J/mhzcfFipTuAKe2CSL4lJZktgVNxvGN5w0
         ueLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cKkSa7m+8IPtWG/STQauGhQz7dudn/gIsTyWpHKE+Y=;
        b=YYqtNR/twqb/9/cyIITPRsLMDy1NAGu7jPAY6vwKJ24GosW/kcYiaBYXSU/i/aKnGY
         pW4nApAWEa/1bZQCMkhgdD79h//M6DNBja62FXP7LT6RoOmVjMCpiPEegWWQId/CFn8o
         n41N50NYWNhRwziJmK+tpuR3lRqcscxmeY4254E7LpM8iajqmiOfZYucw4rn+zd0DnlH
         ADonPkOMcYoT+u7tNZWP3Wu5kyUSNehrI09x+wsRqD8Z5qUmIS8dIW0mpcI/p9mIqoWj
         ggVOjtmOect85e5eaJGz21USWpuwcfForLdxVCZPGh6iXHsMr+qGxtk6hiFi9lgknWnS
         vSvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rI1g7imP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y198si8598396ybe.83.2021.02.12.05.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 05:46:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rI1g7imP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAYlk-0007ZZ-TQ
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 08:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAYlD-0007YM-Ol
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 08:45:30 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAYlA-0002jW-BP
 for qemu-arm@nongnu.org; Fri, 12 Feb 2021 08:45:27 -0500
Received: by mail-ej1-x62a.google.com with SMTP id f14so15693545ejc.8
 for <qemu-arm@nongnu.org>; Fri, 12 Feb 2021 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9cKkSa7m+8IPtWG/STQauGhQz7dudn/gIsTyWpHKE+Y=;
 b=rI1g7imPM0ocCtlsaZ6g71qJaRsvvZmqXxbC7K5zRLgY6du5Ktsr3mxCEXq0sLeA2Y
 8IaeFb87rs1wa5lF7Fi/wAmZ3o4lUvE0kqxEK/omHetuCXEbPkgDi+A5ic0P5bmBYO29
 5f1YvsH3xFc2+gqDNhB9D5mlkLH2zo72KNC/bjTpfWsOM/FB4G8Dgd4/rm8BnMte/xVx
 1vZLWJiYEO3kxVOYfX33Z6ZhcLYBWCb7GQ4OXTw0Fl4eeAHVLUqpRaB+Rgj8KgLCdvZN
 HvA96h6ZXKS5M2Ez+k4jM1Zsvs6TJpV1LMoT8mXQVrjPK11XNMHJHezKDucx7JCP1OBm
 B2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9cKkSa7m+8IPtWG/STQauGhQz7dudn/gIsTyWpHKE+Y=;
 b=Tn2hQJ2gG+GQIg7q+NPPo5innErQm3IZ6oI4rrOR6f9b+V5M3Q9CcPIx2vp8QE8uxj
 wW50C7yenQ6sfnkXynjPisDdyykPyZ7gzuqm2EzyRZOK3fV3hrH+jWirKr/tbz4embXw
 fUH2TTc6tp9MPZx4ptWZ6899pEX/DzDAwgP6AeY6mrz/Cjiz3YN/xEWkJ/m5yEMZlEXH
 8UP507rogEtR03gIqiX/Dh04p/+6ONcDAQksOCTSQCXKZgmGPIC9HbSDf7/ANjrV+uLu
 5zDt8/rgV4PMlSAoDeQbezjVfqGsR6ZiGYIe+dnyNikOmOAdFPsCZ2EQBx+yLs2OJMed
 aInA==
X-Gm-Message-State: AOAM531rVTH1WtjJyMihN9q6s5TVRDkA5Yg3jRd6uCDtXztvd4XUS1Co
 xXdIkM7+gomjOdlpuDY2iR5N2RcjeZ1hRANc0t4FlLiuxazmCg==
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr3152486ejc.482.1613137522538; 
 Fri, 12 Feb 2021 05:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-7-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-7-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 13:45:11 +0000
Message-ID: <CAFEAcA-YqMQATkQXFZHQNy0-JeO2cFvmuHdnhF1+TWAHgf+tcQ@mail.gmail.com>
Subject: Re: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gNjJ+q7Ojma1

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> reports the value of some switches.  Implement this, governed by a
> property the board code can use to specify whether whether it exists.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-fpgaio.h |  1 +
>  hw/misc/mps2-fpgaio.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)

I changed my mind about the property/struct field name here, I think
"has" is what we tend to use rather than "have". Trivial change
to squash into this patch:

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 83c6e18a4ee..0d3c8eef56c 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -38,7 +38,7 @@ struct MPS2FPGAIO {
     MemoryRegion iomem;
     LEDState *led[MPS2FPGAIO_MAX_LEDS];
     uint32_t num_leds;
-    bool have_switches;
+    bool has_switches;

     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index b54657a4f07..acbd0be9f4b 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -158,7 +158,7 @@ static uint64_t mps2_fpgaio_read(void *opaque,
hwaddr offset, unsigned size)
         r = s->pscntr;
         break;
     case A_SWITCH:
-        if (!s->have_switches) {
+        if (!s->has_switches) {
             goto bad_offset;
         }
         /* User-togglable board switches. We don't model that, so report 0. */
@@ -327,7 +327,7 @@ static Property mps2_fpgaio_properties[] = {
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
     /* Number of LEDs controlled by LED0 register */
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
-    DEFINE_PROP_BOOL("have-switches", MPS2FPGAIO, have_switches, false),
+    DEFINE_PROP_BOOL("has-switches", MPS2FPGAIO, has_switches, false),
     DEFINE_PROP_END_OF_LIST(),
 };

thanks
-- PMM
