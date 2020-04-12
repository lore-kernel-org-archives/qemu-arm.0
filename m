Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3138997lfm;
        Sun, 12 Apr 2020 15:40:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ/y7X4tw6EdT4siheYsSxdWVlTbK5RBd7MCadIdWiwh9msm0IvXyf5Q6JHOKb++nqi/GoN
X-Received: by 2002:a37:4a14:: with SMTP id x20mr13989292qka.357.1586731244438;
        Sun, 12 Apr 2020 15:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731244; cv=none;
        d=google.com; s=arc-20160816;
        b=BLZHdbpQbBvmO9/K/1rSys0R1MvwYn5Q1zEf9y6IIOsJQDBVeb7o6nTqXFH+aOACpI
         Y86mxUCvkgz17GSeNy/GsEx3kZjutSnufMKLRFYJKmIUKPZg6T1QhWIgkPaTQcnQDCr1
         KANnHt3acacjs+tcsO51K2LMK98bs/9IvN/fU2Hqbd020CEJNDHwJyYAb5sVs8JWx2in
         NCk/eLyJYrg7lVB1Q6WnX9JDm0qJ5byAxOSWxwMONfPbd6QPNYvMChX9hC8zm+Ldtewy
         7KmQLdPFxTKhRboEsa8Jexai80HMf8dl6H3lsyz14QyKj7+tRDZnBlYX6mv8wd6PrGB7
         +LYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s0AvIH4tmhY8dJIWOooS3DYC6YTsxY1MNRofHTiR85M=;
        b=07r2MuDxngHfInHjXw4YstXPUhgKafiir3m8I0YtXOo4oa/duGUaFmX5BKQwaGYhU7
         su2rFORuFMrIVuZ2MOCnkdcw9haYkT5snw7j9OGeEVXXW0kXDVreViC/GedJmW9cFGp7
         6BoO0+7sFV0sfBe6WmNI7GnYxnsoknFL1NOgTtyuo1X1GYYROuoiPrpZo7P8Kf2NVtTQ
         ni6tZPAuEqiBfvnNdQAEM0k94CXUHCR8RtTpFRNMyea5bNmKgb8XjZUCar1hgWznk/Zj
         5fckDTBjy9Cg8AIXGpeDn+ds7DsGh6wcXeJQshi7LtiO/1/Wx9LlrNOW6jRVFGJlQggM
         6K6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="sJ/YqrK5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k194si5312764qke.63.2020.04.12.15.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="sJ/YqrK5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlHP-0005fn-T7
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDt-0006LZ-8Y
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDs-0002ky-4r
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:37:05 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDn-0002fI-Qo; Sun, 12 Apr 2020 18:36:59 -0400
Received: by mail-wr1-x443.google.com with SMTP id u13so8049446wrp.3;
 Sun, 12 Apr 2020 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0AvIH4tmhY8dJIWOooS3DYC6YTsxY1MNRofHTiR85M=;
 b=sJ/YqrK5TugYkQl5sc0s15+oijPE5rmDui2mmm426O3nS20g7Iqp2ltIuK0f0PBihj
 zN6rI0IbarDeMJvzhgzN9dAl5a89IN8iFLiBum11DWPxCw34nwRQPRZzxNHaNfKXKlW2
 3taNV/vYtbmHh/XkeiuNMqVZjraJ3zIsdVqLGCmZTcQyZKjdTiOL9h1wbUaVF+0ZIM/L
 DGJBtNsbKlG1iR82A/FsRGmUt7tk4ZuyMSaghR9c+hSJ9RlLPWMs8rR5eKpmHlnr17Qc
 Ivmo5Ie0zkDMFGMzDIuZpSKSnvsu/cAiaozPT7HkKGLTxUzqrHA8VBE9EqiE6ToGqcz2
 mB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s0AvIH4tmhY8dJIWOooS3DYC6YTsxY1MNRofHTiR85M=;
 b=ikRldUAQPJNeIMPDLYBR9S+CYksDluwOWCm0HWTT9e+OTuxe7vxJAOixuElaU61a+i
 tgAd0Zk3YVWbxV7Q7qkWdgTmQmgQtuk3X1NZ/yQRPSpoSH+h9bajhxCkGPnv5q8QRddU
 H5KUNFjGwxTNCxsRCekD4caVqRAsbGMiUc3PUUkcDYfNz0ruXTn2i/ZiqjYKZJTEDJSz
 ypfOGPSjTPOZ4ZxEW67pJxu7xGhNHeOi9kDEGJVC7W/T8Yyt9Rp92jcsxjECszzo1mJS
 tKAMkrhN8Z2CbFeg/wTle6MuL3/NPIQKj+U2GZK9i3JJmjgfWsw5om5DJj9hfiibEftM
 Nw6w==
X-Gm-Message-State: AGi0PuZAcdWTnR6YwJ5TYAlekcq7UeW6/dzqkm01oSkm3WFMB1kLJNci
 OTtOIxHOs3DY26EKrsBkweKVyfYGmTZNTA==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr15131900wrn.289.1586731018704; 
 Sun, 12 Apr 2020 15:36:58 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 10/24] hw/arm/fsl-imx31: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:05 +0200
Message-Id: <20200412223619.11284-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hrYMtTo4cbz

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: hw/arm/fsl-imx31.c
  >>> possible moves from fsl_imx31_init() to fsl_imx31_realize() in hw/arm/fsl-imx31.c:68

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/arm/fsl-imx31.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 8472d2e911..61287e24f6 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -62,6 +62,8 @@ static void fsl_imx31_init(Object *obj)
     for (i = 0; i < FSL_IMX31_NUM_GPIOS; i++) {
         sysbus_init_child_obj(obj, "gpio[*]", &s->gpio[i], sizeof(s->gpio[i]),
                               TYPE_IMX_GPIO);
+        object_property_set_bool(OBJECT(&s->gpio[i]), false, "has-edge-sel",
+                                 &error_abort);
     }
 }
 
@@ -191,8 +193,6 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
             { FSL_IMX31_GPIO3_ADDR, FSL_IMX31_GPIO3_IRQ }
         };
 
-        object_property_set_bool(OBJECT(&s->gpio[i]), false, "has-edge-sel",
-                                 &error_abort);
         object_property_set_bool(OBJECT(&s->gpio[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.1

