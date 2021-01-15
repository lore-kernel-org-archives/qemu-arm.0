Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp364024lfq;
        Fri, 15 Jan 2021 07:34:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6O8jV0vwq+Qxh3JvdAhFtGgXhUclv9B1xE5QzILDeLjUzRz14G469vvd3hJ9fkLZGLkh4
X-Received: by 2002:a25:b28f:: with SMTP id k15mr19671906ybj.67.1610724873593;
        Fri, 15 Jan 2021 07:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610724873; cv=none;
        d=google.com; s=arc-20160816;
        b=vBNW7oIOWNoz3Mje+hCHMbvWQHmJiWsXaQohdPYZzTwUL58ANmFiUGSol7GH6K8aXG
         XFG/icbCyezJ1QK0F4NB+MZ2H3ANFE+1VqMGJwhE4b3XUc5Fq5F++syOEzWG/Cmlc+m6
         w4ko/h2Tis9ja9rlFfZsHy5lt+1ZAs8WTGXdL0eGVMfZu3GAwmlOflSOBntzvwRVgvj2
         scfEs/VOOQT0jkq73IMaZVHl2AP8DYjK63xxJL2321G82HV9bUduKxYK2mZLIPnIkGPP
         lnzqIR3B1KjFTvQfsuYksBR2+WYgCFTROCBe0RAX8dlkh4Nnu/N60c4F0barobQe7SEu
         RhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x6oAR5xhjstTwMmnbU+HOg/xOa5AqlizhCQtpQ411WY=;
        b=LA7Vgk8ae1fiOXc3w0gfPvSracFHFf6orZk7V3VzmBEIhBXD/nygN14GJ9yweMA6aI
         aD1W3QDJnRfsnxsJwF2Q3Dgzkq2fM0gdH6aJNjT0LtS5DhT5UqWzBjsmNny5ShKDKLi0
         sRf98sCjz50Lgkr6c9SVWU+smutAgYXcChTF86EMovVQtYvU9I7F26sgy06QVIt/kYgs
         heC8MXO8vFQoikXw8UlimfSshicJ9rvKYMh/0bh59pN3grhFuOOG0w4dztrNA6UmHyUT
         cYzeviEVVySBx+/GUfkMD7mLUdk9pMtVR6wIXa/TIJCl/nJP3vkCYCW9B7kw7W1wxIlj
         eCwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I5so5R5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si8142949ybc.407.2021.01.15.07.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 07:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I5so5R5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0R7Q-0008Ur-Va
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 10:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R46-0005gx-Kr; Fri, 15 Jan 2021 10:31:06 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R45-00011q-1p; Fri, 15 Jan 2021 10:31:06 -0500
Received: by mail-ed1-x531.google.com with SMTP id r5so9917881eda.12;
 Fri, 15 Jan 2021 07:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6oAR5xhjstTwMmnbU+HOg/xOa5AqlizhCQtpQ411WY=;
 b=I5so5R5h4jTlYCFgTINKkP8J9Q2SPHRcmlQhNC1ob2FWgMVtX/9XOz2TxGkE95X2iq
 vaU12bDKLSYByGhVGJA0OjIIGZ6pqq7wAHIMYUQQrJmMPTWWjhXm22QlbKonfG6i8gl1
 LQC0t03UM+5yy/gZom6ZsFsPLpCtKuvEJDCllviMlzjWaLq74J3sHsS9jbTT+3gur99L
 4Mh3k9IYK9iGG8WiExKeyMd4qM13aYwMU4C+/7ENjaJNKs0fW9GxV+sPad0Jj6L1CBSD
 HMbg+k5yAoj5GdXYJCRUNlGZSLlmvxfkhCeNTtU7KZg1zdpXXh352PBqeUQj+O0KkCCB
 LuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x6oAR5xhjstTwMmnbU+HOg/xOa5AqlizhCQtpQ411WY=;
 b=fqrIgYffc5WwhEgQAn0LndND9TYtBbqgMOOr1mmH/kTyzz8Kd+y3aep09weBqtCj7C
 5Mpw2x+8XWBrgzD2KKaqLGM1CfZccvWlXn7N2ZktVnD2jTWeQQC8TPTO7efOnt7eZxVp
 2QQAaJgy7GQmg8KShQ9VI1qaDk8XGCnM1OwAh5tcFk9aOhEU63/smE8V4INF91CYNojL
 kPlSdFBR+iXDYZAHPrhRTXyD1bGchoNA6WH2jx2H0YwYcLsSiqfMo76bd9rCT5/mq2C1
 xklxOBK0s0+wgj5qtjkH10/azIsJV8xeZPsvE0HKK6uBthtEME7pndUH3/bk8VebewHg
 LHMw==
X-Gm-Message-State: AOAM532mW9E5VNS9/f6HbEiO2ggN64MPRhs/ikuaHqxpeQRIRlPnR2eo
 Kx2+JHMCAqv4iqqOixMXN9OvRh68TbQ=
X-Received: by 2002:a05:6402:41:: with SMTP id
 f1mr9819779edu.286.1610724662967; 
 Fri, 15 Jan 2021 07:31:02 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m24sm3679721ejo.52.2021.01.15.07.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:31:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/9] hw/ssi: imx_spi: Remove pointless variable
 initialization
Date: Fri, 15 Jan 2021 16:30:42 +0100
Message-Id: <20210115153049.3353008-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4NObGIXzVO0V

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a213..40f72c36b61 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -428,8 +428,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.26.2

