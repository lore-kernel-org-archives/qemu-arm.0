Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4642632ejb;
        Mon, 6 Feb 2023 14:36:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8pHNpIRn21Qv2pMwUsJ7CXLh/VUhCSm7Vu3K/IS7UxIAsMfKbfM2IRU0uuU8h03M9lHRDT
X-Received: by 2002:ac8:5c02:0:b0:3b9:beca:8d93 with SMTP id i2-20020ac85c02000000b003b9beca8d93mr1838479qti.24.1675723000894;
        Mon, 06 Feb 2023 14:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675723000; cv=none;
        d=google.com; s=arc-20160816;
        b=BIKMpp1ZzNmj2YqgR7fvg3gPXZlUlQ4c4Y/HZlMlbJp+8Zs+lDStYogdtwy8gylxA5
         zuMMGb9UrWG3yXfOAir759wxO+rGtfZYWcAraSACQJgPsx38svSd/6oyvDpwU7GVufMR
         j+bD5ubZ2i3lFws20srO3Sp7zBuAK5BP36xQ+3isSMHeiBh1VndPqD6ezO+KdCaaxDKg
         vVyeSG4Et/Z23+TlaSz0mNQWCLvia9NhHUrBoY5RRWp48KSSzIsS8JK4FtPIPHM4myUj
         ZyDzKsa5Qz7LN3OiGIPZ+xGD6dPGyAK6MVITa1u51Jdwt723bu7X27zjhS15gUJ1qNgj
         DI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p4gyS8VSD6RIzTedBzt7OIRvLu1nwoR5LZytAL+qtYA=;
        b=h/eWtJs81OYgrCD/L+jCcT9+l9+9LMbTr01l1CVH0bX/2ZRZqzV2/xsSyHkbrO8Z0W
         fqJnnmxOaR1Ldf7Hnf6MxrIdBtV9uQ+MCSXeuK+KZQAAGCtAOUiqLXTIMjIqj1Op1YgU
         M1AFfRvmDjscIy/Rehrfz4T0q95YhQZlbzXaSFy8zu01K/i0gZGZbkZjryo5lKjia7JO
         P4kkHuOqZa+ZQL21xLakbd6X3iAhKz66BtI/bRJ7c3+bG6O6drrhc+bvqee3gnKU0/7T
         RQI/KmT+KGI9o9LDFuAK6ac8hJFtZxT7qJKa70zSVWg72g8ZQTGz4zuAEVHV4J98YXi2
         fgKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0jkkyt+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020ac87f4f000000b003a68fe872b3si9018796qtk.399.2023.02.06.14.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:36:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0jkkyt+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPA5K-0001oV-J7; Mon, 06 Feb 2023 17:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4y-0001i2-Nk
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4t-0004QD-TR
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:15 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso11900290wms.5
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 14:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4gyS8VSD6RIzTedBzt7OIRvLu1nwoR5LZytAL+qtYA=;
 b=M0jkkyt+5OA03Ycl5VLUGKKEtqBl6coUbdTH6Dxixe+6IAEiK7xLR6nDhOkjDL41Oy
 P0zwEHgnfmurEJ17sVxDvcrBtPTbiKOiNroNcydc8oY721IEnr7Gs/g+y+vNwmHLBWIp
 UAWRkacDWwLyxGTM7uhCmotCHHg1VYE4XREeuOkPBNr8OPSz37x3MSam5Pn6VGeFsHRX
 qc+YWiPGLicw8SqkappHHWVNN//ANKcblzJcRxx4PVdiouZ/kx90XnH1Vh9NgEf1srsB
 pHe+yBR/1IGXZ5umvvftuCCsqZ524+vFUDgX6V0qZn9YCl4iAWswT/RafqrsRHfpShHh
 7u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4gyS8VSD6RIzTedBzt7OIRvLu1nwoR5LZytAL+qtYA=;
 b=ZTXCiOdIL73INQDxDEVGcpBnUTz5T5kBGfsEXY2eYmIRk3hAvpocBiins1jfw/cTmY
 JC3MMG2hjjLxlcfZQ1NNBAHkhD5EbX+vYq1p4e5vqOtE5G5VHV8ZYGv3bhP6DC3ecVxj
 +a9Jpg1WAvpquynCpj2RHpI8L8whj6YnRBrYQIJaU7THasX/0mRNzFtrAG1lHcK1iZMM
 Hp3lte5jm4aKL2WmAc1y+8PA+zBSVsa3T57ud2ilO9O7kKSvetxT2nGDmLbUWOzUD3ML
 nkAykH2WfbLvxgRKsw8hOLPH87Y6Tvx2wSgjNIP+V2ml8SAaFI+z8TXD9hPIF4CTYUar
 PXeA==
X-Gm-Message-State: AO0yUKXOKVycjXX1S72kCK4jtqF2nTxAJcFrz3yUk+6eSeg3xss+pynt
 f5OwkLQwYXD0wSS3N/he9nuJ0A==
X-Received: by 2002:a05:600c:1613:b0:3df:b5ae:5289 with SMTP id
 m19-20020a05600c161300b003dfb5ae5289mr1115598wmn.8.1675722910146; 
 Mon, 06 Feb 2023 14:35:10 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c512500b003c6bbe910fdsm18922037wms.9.2023.02.06.14.35.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] hw/intc/armv7m_nvic: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
Date: Mon,  6 Feb 2023 23:34:52 +0100
Message-Id: <20230206223502.25122-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TLMsq14m3s3U

Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
similarly to automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 0180c7b0ca..07f9c21a5f 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -16,10 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_NVIC "armv7m_nvic"
-
-typedef struct NVICState NVICState;
-DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
-                         TYPE_NVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
 
 /* Highest permitted number of exceptions (architectural limit) */
 #define NVIC_MAX_VECTORS 512
-- 
2.38.1

