Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp5531225lfb;
        Sun, 27 Mar 2022 02:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVKOgrzV69yNve8p3vjccZAa7HP8ImMLx0yZJr7CyFcqXDl0aHjvkRcZIr8clLWXMyRzGX
X-Received: by 2002:a05:620a:2183:b0:67d:3a8a:feb3 with SMTP id g3-20020a05620a218300b0067d3a8afeb3mr12399292qka.338.1648373753349;
        Sun, 27 Mar 2022 02:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648373753; cv=none;
        d=google.com; s=arc-20160816;
        b=LSJ4WTwBbWAP5ethuvJaSh6UYNq6a23ITNNadGLsR5ioMSE41EI2JQftyZ1gGqzHLO
         ygZ/AzuSUEi5HrC1B+g77MnpBLfrBgA9AxhV/il59DEaXtnMRDFqIFH340dVC6W12MKJ
         URWVzn+iBYb46a+gnFq+wCv9ftxeCwv460Tzm8oyyMGJALz5s3bvQk//JnejQQ97b+0t
         zd8GFgESTJInrOK9smKxbePH3v1AfL8Mjp38rMQ6VzqvnY+CG98VAym8jTsAuh0vurzP
         h1QUPTjgjsSwg93xQM9lf5E4KCKPTIhVMiGADeIMrK+dEci7iPK+WX5iSmh8grVhGUAj
         bPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ABcxXaf3qNBOZkBqeTkKv0RGUyLEXj8LkCJhCdpicDw=;
        b=MJXS+/TVoZtFvR9Wn9hu4BHGuRpQLhbJYOOyvA9eLa2IOPTGCGEXPwArCLgWOuvRrA
         YUTFXairvMfJmLer+WjyUFRKnJdWdjzmGFf1YgN1hNr0BE40Bc19okJ4emPaAOVBSDlK
         R/KGDBXVCJkIVamZLyM9RK1LzGqfWOMqB1VQMIR2WdfEazUw5jjq5Mv4Tt1kYL3GMkEr
         QWUAG5tPJJMA3tU5clVN0hsXQJxNAlvLS2U/47d0453ZLwYfQL0DZL6FFgOUhf1GoOYl
         3NdLLTZL8CTIm1Zox8hun6JuSJ+BbzIjmD2ePfwWe+BUbKeyEQDsb5/1Zc1xi6xssILD
         MgYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="pSIXr/D6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05620a240800b00680d004fb5asi241106qkn.224.2022.03.27.02.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Mar 2022 02:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="pSIXr/D6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYPJP-0002lk-Oc
	for alex.bennee@linaro.org; Sun, 27 Mar 2022 05:35:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIm-0002kR-UH; Sun, 27 Mar 2022 05:35:17 -0400
Received: from [2a00:1450:4864:20::432] (port=43611
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIk-0002cA-5N; Sun, 27 Mar 2022 05:35:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id a1so16302108wrh.10;
 Sun, 27 Mar 2022 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABcxXaf3qNBOZkBqeTkKv0RGUyLEXj8LkCJhCdpicDw=;
 b=pSIXr/D60JHCWFbppP9W9FfpWA5WhalxobIpfIsok69jAR3A0Wf6VP4OVdZqaEGJ1Y
 jA7TnFFMOXOxoOulO3hTNSa1xrq7Y2GMIUnNviKJcjn7X5Ql8Aykl0SK4zzFEi/Ydzda
 WYRRm8LXIva2FsQKEc6ABIrMru+8ATRtdEHQBVgLgzwk6TCtCAm60ZNl3eytQF75hIgO
 8bTsSL3vwknf/6TljOdjpDtaPn0ZXma6sMi0QU0YnDSUb8DOGr9L2HX0hPgXMPogArn2
 1Hxxp8gndtJYc36X03iRjZc3DZBtaqoJloqnlTeOQ3d82LwMGk3tl1/omoN+nl2nm4sL
 IFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABcxXaf3qNBOZkBqeTkKv0RGUyLEXj8LkCJhCdpicDw=;
 b=auQNud8LtGgGh+4Vs0xTwzVePnF7Fdp1JxEmZgNM/U4P/talEiG7iKhjNaKWUc5q24
 CK0spEPWBezrIfcBJF5zGGI+nwoMT4NCD2mYk7uqQ7oXOMDrFV4ZFf5QTVWMOW6qn3Pb
 8PqQ+Mp9CXMSQho4mi70xLUFohd8jWaIzxgWEhI9NCPAz5nTlBa5dd8YQBrxIwbGIQEf
 5WMggjmDP7U/QHRgwbYzn137bOMrNGPCx0B5HiqzhvjApQJIuatbyUmcdWx5lCQlpqvG
 QoS5wefYPGYravulITQSBNSODOo5aQllAhJUpGCziftXH3QXIFMtaDBlu3qclp/qRDy7
 8D9g==
X-Gm-Message-State: AOAM531RIfW36zjp5iTXBHQnwUW/ss2rIC0Ui9V3tu8Td+je+qMdrg5j
 BZGA7wKAyL7zGBY15mBpBzpYs+94cwE=
X-Received: by 2002:adf:ee41:0:b0:203:de82:c2aa with SMTP id
 w1-20020adfee41000000b00203de82c2aamr16579584wro.390.1648373695801; 
 Sun, 27 Mar 2022 02:34:55 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm11892039wry.32.2022.03.27.02.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 02:34:55 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Date: Sun, 27 Mar 2022 12:34:26 +0300
Message-Id: <20220327093427.1548629-2-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327093427.1548629-1-idan.horowitz@gmail.com>
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rHLYiBqxOB4R

As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when the
PA space of the IPA is non secure, the output PA space is secure if and only
if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 812ca591f4..d0265b760f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12697,7 +12697,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 } else {
                     attrs->secure =
                         !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & VSTCR_SA));
+                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
                 }
             }
             return 0;
-- 
2.35.1

