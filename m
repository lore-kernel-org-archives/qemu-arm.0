Received: by 2002:a05:6214:c86:0:0:0:0 with SMTP id r6csp1058623qvr;
        Wed, 16 Jun 2021 09:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/fwus5+dcXTFHHzZbWgJZ9JKLkyxC7JpuLr4P4YfwDT0cQwb+LT9y+pKHKndfdibODChZ
X-Received: by 2002:a17:906:1848:: with SMTP id w8mr313970eje.277.1623860511870;
        Wed, 16 Jun 2021 09:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860511; cv=none;
        d=google.com; s=arc-20160816;
        b=eY80f2P/8rbggmCn1Y7g1q/NDVHW+QzJ/XaSZzgJn44tKf1jgvrDEthhffb5onT4/l
         87CL+kwQMi4mwdCNVtHir5xiaf2AYHi/8yDwJKldowgeaUZIBhuwTakRO9g6MnSyVw9n
         DV6N4k6uK+/66UZ9HN+jWF0YNMnukuNlOfJJhRfny/5fjDs5WZPPv3lrzZInEIIeJzNf
         NEgMCz4M/Uu0g9z0kbB5PHn7jT+53ocYkqWyTmq2Zi0ErPl0exY5VQa+aVJW2wfm2DgR
         DSLQh2fU6d2wIV6KrkcXXa/yVD9FtEEKMJ0kbr1wecUK3WrE0i3tfHe3JA8nwvNRnBUk
         i2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5aEVDqUseYYwXDUj9I4DDboAqkXF8aATk7ZG+d3YXVg=;
        b=IaXpa7TbjtxArEqPCLKS/7rsWOp9FpeVe/Ue66dKPf80w5zFk8rxUgBNCa8OshVliA
         vhEYeK+N1AxBj0fw0k8yWXE9dk7GY3qtJ5wXgHjhZivEpWum0XA0E/z6ZzQaEkliR13r
         HNgQRsoGbSjQXPFDGsHrj1XyQVyPZwX5YDixDq7eqvQXfg8OcIa4S3BrMmyByNDL2179
         WVJg8jCvnJpLkH/slli2wa65sEAP85+fXsMfNq+a9BW5Nv4cSGwyaUJf4exHtUUK8lSO
         avWzRF+gI9NUo9vszS6xAyxINu5qNigUAHnVSX93aXyUctxhJIRVGCCkTBJykvbTkSJo
         5m8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XsqtSV8o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si2796673edn.223.2021.06.16.09.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XsqtSV8o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYIY-0005EH-RY
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBp-0002fZ-7J; Wed, 16 Jun 2021 12:14:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBn-0005xR-OW; Wed, 16 Jun 2021 12:14:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id m18so3341360wrv.2;
 Wed, 16 Jun 2021 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aEVDqUseYYwXDUj9I4DDboAqkXF8aATk7ZG+d3YXVg=;
 b=XsqtSV8oaLOyjIC8TMHCtq4LHDQUpXFOl34+XwRMsfSAeIpR7EZjhuGjhA9ID9XWOf
 dRmC7Czh/ccm8obaYww7ul0vTXO1VhD6fZ+UDRZu638VNSyObx7335AQNKoFwUuzLYhu
 I+mIMeGh1HYTHIQjCUG9+WDa4KdRE5swTXBJhXTp/H742xSO2fX6tIneQ2CJYh/y65th
 A+QExky5feg8lgWDGLknuXWkNZoYFRJ0ieDh07noiDn41+cVQXxSvOOJ//qY01jvEsSu
 sFe3gU95tUKSVwFXUgQZLvpXfoHttwGc4owC+YKfNSR569FgqgDLEF8A7t5GRgpdEHcw
 gZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5aEVDqUseYYwXDUj9I4DDboAqkXF8aATk7ZG+d3YXVg=;
 b=JBzoy+pB+duvJ4chjiSq+ugG4eGOQYBiRStEvPJxa5Hqe+gr/1DvWdwsQ6eL/Som3g
 W+uU+jrXwYr/k5n3ECsP/l9pxNWkXhONh3ZzCG1JMxpR2S8izw9KynSY0oor49N3qxqn
 1hdFkh4jvQOj7/iGA+IkzDH82uihj7qmAFmHfrVB3m4X4JlKttjoRzaNLoNGezBNsQqz
 qQJVlcWYh8NqKdkuN8B/VKhWZxPM5NVINj243bQ6ViJPdiSv0kZQAyxIJcUdrTgB4wBZ
 Is69I6zAnDX5T0/z6kRP9P0V1kjm7j9bMcE5w4neRzdFJyje3M6letzWR5xbBPBEY6RO
 wRRw==
X-Gm-Message-State: AOAM5304E6sfEJodWkLfLv3d2LhZo8XPoWxEjxde+az4issVSh87Ryc1
 Y2Th7xr+FE+vT32okTBK19qPcny6mLBB+Q==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr250756wry.126.1623860089435; 
 Wed, 16 Jun 2021 09:14:49 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m6sm3175364wrw.9.2021.06.16.09.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Wed, 16 Jun 2021 18:14:11 +0200
Message-Id: <20210616161418.2514095-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 19wGXHwXxvpE

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easire to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index f4c5bc12d36..b3d3da56e38 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
                         i2c->sts &= ~IIC_STS_ERR;
                     }
                 }
-                if (!(i2c->sts & IIC_STS_ERR) &&
-                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
-                    i2c->sts |= IIC_STS_ERR;
-                    i2c->extsts |= IIC_EXTSTS_XFRA;
-                    break;
+                if (!(i2c->sts & IIC_STS_ERR)) {
+                    if (recv) {
+                        i2c->mdata[i] = i2c_recv(i2c->bus);
+                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
+                        i2c->sts |= IIC_STS_ERR;
+                        i2c->extsts |= IIC_EXTSTS_XFRA;
+                        break;
+                    }
                 }
                 if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
                     i2c_end_transfer(i2c->bus);
-- 
2.31.1

