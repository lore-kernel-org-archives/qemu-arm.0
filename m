Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp685836qvs;
        Tue, 13 Jul 2021 07:29:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRUvs9y+GmQs2mINft06XSxCSp2n9/wy66yaJy7wXpcxt1JJS8gOBrnMC6PS50hM0ByUkC
X-Received: by 2002:a17:906:fc6:: with SMTP id c6mr5909110ejk.65.1626186593787;
        Tue, 13 Jul 2021 07:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626186593; cv=none;
        d=google.com; s=arc-20160816;
        b=HdJKFjzPPomFIzY5O7yCBiw/VStop32KnYICZ4PrMjkntSIWKwLNWRkk6FytIZGm6T
         esK4H6UkzM/rDNG9vDddh+ihLOK9mfXIwpONDy5l8xZ/71n75m2wbJnQhz16wzBA3/Dq
         gySPeEKufqY+TJGtgHm2fOzVvjibLaBZIdbItLi0fpmEWCGHLP3PfZkCIzDUO/o/bx10
         KihF9y741T+zv1DQVqtYZnI9XrNg9V1S66ODzc4HjswPYOZCQ5mKHZmZCsPZM4klNDZX
         ZtLOw9cO4kOXH+Pyc5bDeHKJnQoP1ExGi4wXNGa0+MsM/cuFTLoYprDUq8a8CPfcQ+iu
         LdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W2SdpSDEP5iF6kitd9bg3QMHVJgptr67Uu5d9CUR6lI=;
        b=C47qLe5WKmAz6El5p/3oR2Rqkk/Dl8QjYk/NnlEiNivqoeEXXFI7o+HuMGUvlGngJk
         /EzTz7zDTvGn+2bnz0JlZoIgoLlkOgHQnrBL3iCnclNtyCV1oycvsr91fadDJrm08UpU
         ZBlnKmmuuhXzjYLsH0x3YjggEGLZjdXA7VtMRWbnJxTZ1C8+SD3YVN4qrzlUyUWKPuZE
         6YNBg9wIrhvhiHZHeoWZwKWMjoUDDIfExTgtNBspCmf4OJSD+QN22r+HjQ4CWFcHBF8A
         ZID8PsMc12yOC7chf557/Qx6/MpGrvWx09bUoGk7/VXsABUPPXeel+yRohRpTcSNmh4h
         taig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=USvL12Vb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf9si3911414edb.132.2021.07.13.07.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 07:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=USvL12Vb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3JQ0-0007L5-RD
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 10:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JJ2-0001ih-84
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIu-0001es-F9
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id g12so5939299wme.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2SdpSDEP5iF6kitd9bg3QMHVJgptr67Uu5d9CUR6lI=;
 b=USvL12VbRuEdh/d5jaoQ545e4B1QfkKpoGPYl+VV2jq1ID8VPQZZmrOuOELNPtRPyO
 iFlr3Oni+6YFUqGd2PElOkrlCKHJXVUcstPsrCd1DdErcemQkRUw3o93gDIp5AlC+ti7
 BevrDpw8R7R9k9weqHsXAKz9DNwPb0XHzQ8bvOGBAkpcESz7+ZQ82q3SRjFPxR8GLl8c
 GUwP1Cx0IzgQSyK0tHaOoCdYm3ikdlxtl74AM1OzLc9llcFgCO/gOHOqyukXyQm6YjrF
 GM3w0rkEU3j6GBdHN0GRY3J8PBommKqDV57l/g9V7/rJ0fNpyr0hyqjoPRHR0932CU6j
 E1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2SdpSDEP5iF6kitd9bg3QMHVJgptr67Uu5d9CUR6lI=;
 b=jvt81qjbN/xXk567D3Se25s0MExRoYL3BGdzSvO67LNBREArA0XmMv4hpnRpb9HNbw
 G146P/4W+ZCq2fLLzLdiaLll//mfejpt4RdmVQkZIvFMJist6JXnShwhkRiFkCjqlTEy
 eK8vmfTh8Ama2pknxAm877s1W01mQFrOudxTAJXxQ+Y5D0eJoJDBhCgSpMqvjykZzTT+
 1o6zvuaH1Cis8njlArIR8vzdGdsC2rJSqpKjVgSkeoUluD6psgOE7Hq/xJG6DlsTTJSh
 iniZD/aDld6s4JxxOy2klN8PQA7OFZWAZWIPaeWLPJgenYMRFayTMA2WEVKwz7jfVxKD
 cwwg==
X-Gm-Message-State: AOAM532MXSa/nEIUNCUOR4Wctpv6NyKmYEfaV8U+LmFB/BmtNqCaaq+7
 hx3n1VXFyTwOsXBILRfpMDmfgf5UtX/TyLkY
X-Received: by 2002:a1c:ed08:: with SMTP id l8mr5279959wmh.38.1626186150437;
 Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] docs: Add skeletal documentation of the emcraft-sf2
Date: Tue, 13 Jul 2021 15:22:25 +0100
Message-Id: <20210713142226.19155-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
References: <20210713142226.19155-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2bPs0bGIQswy

Add skeletal documentation of the emcraft-sf2 machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emcraft-sf2.rst | 15 +++++++++++++++
 docs/system/target-arm.rst      |  1 +
 MAINTAINERS                     |  1 +
 3 files changed, 17 insertions(+)
 create mode 100644 docs/system/arm/emcraft-sf2.rst

diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
new file mode 100644
index 00000000000..377e2487206
--- /dev/null
+++ b/docs/system/arm/emcraft-sf2.rst
@@ -0,0 +1,15 @@
+Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
+==============================================
+
+The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
+Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
+based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
+The SoC is based on a Cortex-M4 processor.
+
+Emulated devices:
+
+- System timer
+- System registers
+- SPI controller
+- UART
+- EMAC
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index e2fcb64872d..c52902acdad 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/sabrelite
    arm/digic
    arm/cubieboard
+   arm/emcraft-sf2
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 93b9f900034..f23cf874c66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1023,6 +1023,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
+F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
-- 
2.20.1

