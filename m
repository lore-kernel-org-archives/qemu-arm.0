Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1463591ejb;
        Fri, 3 Feb 2023 06:58:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+I7nspBskYZohbYaVW5wwdNsrBhWBZs91m5WRJJkcEsLuEeod8gF4i8tYJUEIWS+it9sOR
X-Received: by 2002:a05:6214:3b84:b0:53a:f6ac:2a93 with SMTP id nf4-20020a0562143b8400b0053af6ac2a93mr15103839qvb.43.1675436287048;
        Fri, 03 Feb 2023 06:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436287; cv=none;
        d=google.com; s=arc-20160816;
        b=uuugPnv8J8kGH8+jsJEHUOnTcB0jujAgWZELQxSVssVxlHsjjf0Ws9y9iz4mRYKmnL
         kc1T4f+wPmhdaV6MjGU9z1D+or1CVRs2Z9Yyq43m3dRGL5SnugwX/k9BuKYMi+vXoedO
         UMolLiKLB454LVyL8cc27sIHx8q4qOJeLVZyqlWe5lW9AuT8oD63QHxk0KC46ld4laqZ
         6KlWXZ0YHbi+nXHQHU0Y4rbS3vtaayQnvnYzpoxxKl6nRJFe9kSmpHMj1Atf+g9KCPHG
         CA5eVbLd3V1qb5bDI2c9u9mluxLAzbl2t54S56mEpxCubfbX3x4l+IE03dwgA/o06To2
         CMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WDUR7TYjLSIvLofe5Yaai1+QKInBgxE2ASTflQgOO30=;
        b=U1CF5qBF0kBjgIfWoGDCgXt729XaqUQH6KoZEicZZ583UdR2hd4UtJfLDxbUDaatvk
         DOHYHoF8gzJxCUzmiRU/7d8XFKM0myJw8EtkxosfngdoD0gNd1hLeNkMNVyIwy7pxvfv
         qeDbjT5WtkeBelqAzJB7EiN6KjLTTfMSIj7mIoD5rAu5E+/k4xH6mHWOyDDNJvG6JIB2
         eWxAjT8wj9WQMsufmVvvYlirUeCv5Yuajvc9M0oZKDi4jufE7HcBTo1VlohCKkb8cNpd
         SofW4hUd4nwam/EhyClQBBvLwyu5Y0lPpR7VQIfyI76c0rm4uoSanVURnLnyk4hBdKiq
         nMvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=co6U3Gbs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x128-20020a37ae86000000b006fcc90f374dsi1928990qke.468.2023.02.03.06.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=co6U3Gbs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxU1-00022P-5r; Fri, 03 Feb 2023 09:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxU0-00021Z-E0
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:08 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTx-0005ux-HC
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso4046898wms.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDUR7TYjLSIvLofe5Yaai1+QKInBgxE2ASTflQgOO30=;
 b=co6U3GbsDJJFY4pVZU4kiCaVdgc5JoqCG/yoosYneWzeGuAXKp52S85umVEABW6VC/
 vG5zZI++4sVTwNag+e7zvu/jX/Z9H1HuEXOIHUk7P+LOmkUAxpXCp/MzN/PuY/xYL8AS
 UId+mN9Np3xWCJbdz01CchkAaBWuNy36A2+Ptadp8y/A7BY7ydDKdArSqODvsaxYDR17
 DfOHxEdc6zLChVvg3POqKO0xxojy3T0FvQY7ECXspXMLFdkPATsO5vL+FFHk9vS4NvBF
 2+d2Q6Lp4joe+MOeQBJQkgME4A8r9jX7IP6jeqJWH281VzLu8X1RFPnGbOFbTirxpfqf
 ADpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDUR7TYjLSIvLofe5Yaai1+QKInBgxE2ASTflQgOO30=;
 b=yls+bdU0fQVOprtEDIANxKm0XVVtOhu9pmCpxRNOfUOTyJaEfDJMhd5u1YuLta70kg
 iCEskm+Q0aLY6sV2YNIrKwW3UJQbssCp9rFQkcDtbyeCr+itHuEXdsEZyQPp4TcCm0iM
 XBssRUWz+6z29NvFIV9+RAxlhekvrQwadoNvqICH786iCk62WStQLK4s/DpxSqBIo7Ai
 dDLqSqIY+to35cf/AMA2itRZtM4YkpjvYsx7PcrWkUkrQx8YoyX8aOBF5He6A2jAlzUe
 Ds6ATRZ7jOsB3fQ29fT7feN7HkKOi2U4N5oaS1O8757HmQnpPvyNi3wezn56wwpi1rIN
 OT2w==
X-Gm-Message-State: AO0yUKXcEDFnLXkGHuhOqjGIJ3/HIH0amaN/DbHDllInkxlamwjdps+V
 ZXQKJOHlKKX6hkjsbiCIZFCW4w==
X-Received: by 2002:a05:600c:54c5:b0:3dc:9ecc:22a with SMTP id
 iw5-20020a05600c54c500b003dc9ecc022amr10169316wmb.8.1675436163969; 
 Fri, 03 Feb 2023 06:56:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003cfa622a18asm8009272wmr.3.2023.02.03.06.56.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/15] hw/i386/sgx: Do not open-code
 qdev_realize_and_unref()
Date: Fri,  3 Feb 2023 15:55:26 +0100
Message-Id: <20230203145536.17585-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RXAd4+Uef9xP

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/sgx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index db004d17a6..6a729bff94 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -285,7 +285,6 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     SGXEPCState *sgx_epc = &pcms->sgx_epc;
     X86MachineState *x86ms = X86_MACHINE(pcms);
     SgxEPCList *list = NULL;
-    Object *obj;
 
     memset(sgx_epc, 0, sizeof(SGXEPCState));
     if (!x86ms->sgx_epc_list) {
@@ -299,16 +298,15 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
                                 &sgx_epc->mr);
 
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
-        obj = object_new("sgx-epc");
+        DeviceState *dev = qdev_new(TYPE_SGX_EPC);
 
         /* set the memdev link with memory backend */
-        object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
-                              &error_fatal);
+        object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
+                              list->value->memdev, &error_fatal);
         /* set the numa node property for sgx epc object */
-        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
-                             &error_fatal);
-        object_property_set_bool(obj, "realized", true, &error_fatal);
-        object_unref(obj);
+        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
+                                 list->value->node, &error_fatal);
+        qdev_realize_and_unref(dev, NULL, &error_fatal);
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-- 
2.38.1

