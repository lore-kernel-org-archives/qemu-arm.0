Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1298178ejb;
        Fri, 3 Feb 2023 03:38:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/PCjeSdXh1qzNFeKmvwiD79rb2Os0uPu0t54nyzmZILB5GnxXeUB/U7M0vfdFlp5RiUiB+
X-Received: by 2002:a05:622a:188e:b0:3b8:5ad9:3fe8 with SMTP id v14-20020a05622a188e00b003b85ad93fe8mr19135549qtc.48.1675424305025;
        Fri, 03 Feb 2023 03:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675424305; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ0pA6Ua7Ki/7lRq9fJKzQsAdbJyyVkm7T5OvZTrNzKk12O0TLbmkdOUFi0nCcH3ED
         ksD9Xgg4H/4ignaS9GevNDP5YVU+jc+tLMJpvYF5d2MvxpVZ1sEzlmgSiYB4hrDmEZ4T
         yLy6eMr4tOHj6Stsp9TVE/z7nWUif3g2IfmpMH+qOPcuZxu19PAo1YRz/vl8okevF1ZE
         buhO2p/YHVlGQrUaAfgY8bndfZcYtW3LiKWJf44e3x/dqq4uR0TrFoSO3KuY//Jkd9p2
         +bIDvrynrBxGjyzbx+IYyxtNCWY7Fdp5cafueUFk6rNhr9fRVgf1+Iu8VIns/ZZOXeGS
         Mw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XruElQ/KqElMH5647D/y730I75puE5BeGIEjp7H7QEM=;
        b=rpJfosuDZVGEy4MCYOr8qF2knOHH/ejaFf7JvaDua/FQwEDlCGwWvPSKjn/GBJ7Uo2
         UpNCt4YVTC4ahuX5vGiJk4uJ/k/LZPwnjTFjhWSdJNAEoTg0Ad9lw7D9QLc1AdE+sJVO
         KfKZocmagYdbD1Bv6oWOmsNzlmCx3Dio/oUtQeclKyp/rFVZ1ICMNEcbxKQFzPLMIUUu
         DNSrrvqpUavlP2+7iLMlr5a99ZtR7wcltQLRYeeQoEOtsxCayuIFwuWkz8p4gjkDspp0
         hQjjFfjECm2jVc36TXpUEGLSV9Soe3RRENFzUsY0OPnnV5IYcZ+tatQcVM6PzpRZK9Hs
         RI1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nocjyXie;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05622a048b00b003b86d51a5e8si1711428qtx.647.2023.02.03.03.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 03:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nocjyXie;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNP-00080X-Ir; Fri, 03 Feb 2023 06:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNN-0007z6-V3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:05 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNL-0001CZ-Ph
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id a2so4102793wrd.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XruElQ/KqElMH5647D/y730I75puE5BeGIEjp7H7QEM=;
 b=nocjyXieTrPivHs/s+PlPk/HgSfTlvK00jERJL/goaYJOO4/wb0GOEWMwESfoxe6W+
 wT6dhwZu5OCof5DZpVD8Zn/28B1BUpynSYN3GYS8ewq7sHhx+LpIib9I+MMzGKlYOkdO
 pQigs7ujxKmhHTKCqcRUsYG7g5SZeGUiC0fe7/H8iBv7+ElXI5M5lJ4J+YzOgyLcLXgX
 Z7n6EcmEytjBfySSM9L6CeEIF/zwnWfzuh0JNwmPK4HxKEBkCqm2A7Vgg2puPf/u5xVk
 mcgtOYS/fZXnyPXXfsUiR3B+u2UH/mt4qJVlnlNO0PZkJsHvFhj8bOGMucnHPHTViO9X
 5idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XruElQ/KqElMH5647D/y730I75puE5BeGIEjp7H7QEM=;
 b=WE70dRTl5TBMas+8uE7WtH2RE2XflE8bJP2C5B3yhErqBxj7Y7Ky4JcUsi5ML6qG9D
 QYrv4n6QrhyTOgNy09BhQXxPZE1iIEIpv5YZdOOUPskkRlZl5G7dCWRRv3aT1jpN7Qde
 vlk0JLcpxzWKRRdCY69AFG05r3fl4U+ecFiO6ta0Lfr1NsFPd2CRtKCIR5r4n1utVEm6
 ur1MdVoitB/FxwuWCHc8UF210y9/1bqw2x7t0bxoSKWFm+iYszS3zsoRcPWXul0kHMej
 bhrJLjhjNlT4R4zPpzE9soPDFpwTK260il26fA0OxXwtRPN2xFGmJ6jhAQX/kP2TsGGE
 CD/g==
X-Gm-Message-State: AO0yUKVYZbQa1UwX4b+jECZt4NoP85h4HaErfN57sfvUG+saUHrptWaN
 HyE0Vti7Lj/DB83kQ33fzOYsDhIjyipkAMYD
X-Received: by 2002:adf:ef85:0:b0:2bf:e443:ea70 with SMTP id
 d5-20020adfef85000000b002bfe443ea70mr8060231wro.1.1675424222405; 
 Fri, 03 Feb 2023 03:37:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm1885239wry.11.2023.02.03.03.37.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/9] hw/ppc/sam460ex: Correctly set MAL properties
Date: Fri,  3 Feb 2023 12:36:43 +0100
Message-Id: <20230203113650.78146-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WuizADwtQSeb

MAL properties are declared as uint8_t:

  static Property ppc4xx_mal_properties[] = {
      DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
      DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
      DEFINE_PROP_END_OF_LIST(),
  };

Set the property using qdev_prop_set_uint8().

Fixes: da116a8aab ("ppc/ppc405: QOM'ify MAL")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..cf065aae0e 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -389,8 +389,8 @@ static void sam460ex_init(MachineState *machine)
 
     /* MAL */
     dev = qdev_new(TYPE_PPC4xx_MAL);
-    qdev_prop_set_uint32(dev, "txc-num", 4);
-    qdev_prop_set_uint32(dev, "rxc-num", 16);
+    qdev_prop_set_uint8(dev, "txc-num", 4);
+    qdev_prop_set_uint8(dev, "rxc-num", 16);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
     sbdev = SYS_BUS_DEVICE(dev);
-- 
2.38.1

