Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1562198dlb;
        Tue, 9 Jul 2024 08:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZdB3mwpR1jw4boQN8e14yn64kaRFDOn2wurY2kEOHRYmOmUuuo/Eva7efiXX4IOSZsVpMcZybSFp1kHY5NLjh4LHOAOj3
X-Google-Smtp-Source: AGHT+IGSnEgfquexEdSOKh7qcl4Wv+3MMjAVJ3G1n60b0UanEZ+/wWcdHMPKnFCxOtq/TJ3e1wFp
X-Received: by 2002:a05:620a:490b:b0:795:1d99:1a3b with SMTP id af79cd13be357-79f19a1fe0fmr279233885a.30.1720539065652;
        Tue, 09 Jul 2024 08:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720539065; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEKx5YWu7MFwG8d5iDpuk/27Dpf/RCGLFAr7pkCowO94fnP3s+GCv5K9UI0x6KutPy
         Q1avmZlg6c6srD68yELJUNHqjv4Y14JBfMUZcvqRFl+/hwiS5y1n4odXjJ4QfHbrH+9t
         T2kaxDS1bICcHf7bQynSgQTw1FOVz6HqBogQNgTIkrZBf+7fYHvHi5fzgxp9VrZFPDPT
         Jxbd6TM+24J/Lv+xW7XxbltzzlHNgaIyRb9lZbD6wXV/OMVvfFm/ah5+d0o8Al4/evrr
         eQemIprB5Q9/5F4SuIsFt08ojRFpT0BMeyOakq5pjOL4hoxmQw+vjr4OCTegbuwktPHc
         PN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+IrpdCD+BuSWH4PAnzhWg9dOS6Rs+7FERDF9DQN/buM=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=dHh4+ovaii03fQGTygrsewvVvVRaaZ11pWSEpfmtflKxzOPS4nDPC1mJ2lZ9uy5iDl
         Iei8g3IFpuqZzGT+G5ozuF9gFucy9C7yN3NRJhSSEhiqmMQBqi3w6pqI/MTa30/AjHAK
         fPHNE70KIYsuZ9P2fT7hzBOcBtbxgrF1T09bTijGqbdbsKTnnf6NHLcK0kR5vLyuvDET
         f/TSlT5LIEokMR1tu7BwZU1fzkyPhXsjtHPYxdrwESxRc8dvmNutaZjsMQG24Atc5uKy
         vYCrssYY8oHDxqz5xqrGpqD768YxXPU36Y0Mzykt2o8S8dZJjA83+9aB7XOgUYl/0Rg+
         vcfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQIzWjlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bafa8easi24461126d6.546.2024.07.09.08.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQIzWjlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRClI-0004Qy-A4; Tue, 09 Jul 2024 11:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCl9-0003Tj-Ht
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:28:04 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCl3-0006Y2-Sa
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:28:03 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so6541769e87.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538875; x=1721143675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IrpdCD+BuSWH4PAnzhWg9dOS6Rs+7FERDF9DQN/buM=;
 b=TQIzWjlzP2Vk/R3b23Bu50k2arFb2fFPAA+v5ToFk4KxWqDKMY5A6gtd6a9f0mpctk
 OGq8Jw7EzNhRqrFrhV0kn3Z0F4Suqd2ziOJabG4NmawKNUtuSWQx3XDZZlmEWmUQ539M
 pb1paKImHdWxcDDH5rK6h0otyX6aMU4bEkNz00PmdKdBkgfu04cXLLaZkgDRMc1Amfoe
 pJM1JodVQHMXUQSSV3YbX5zezjLZaemdzZbtBamBjIiYH1RX9jx8GDeqZjunijHRCQDw
 U9GSkD54z+FTdhJIf9d3IPxQGXRm0dAp0RUiw6nOblzdeZRx/dsXI0orfh1kD6q98Atw
 nxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538875; x=1721143675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IrpdCD+BuSWH4PAnzhWg9dOS6Rs+7FERDF9DQN/buM=;
 b=R6SRSd/MQjVbBA6dcThFm+03shBInSTTCfa2dML+2Z1xvynk3SoV3ewL0SgFlIx9fX
 yO60zroJr82KLHtwNBiwgZuaeSWsSq4wPiKSVfotD9da256T0r4xC6m6CjGdrocOlejp
 P3vCqSKicZhrP+rsa4yJRSIi5efnc8Lp7ZgxB+RD3bX3kCDnsv7Ro96Sq2NPQfB84Y3M
 EQEYSYQJ8pVwUZhxsBcPNTKDaQmYCbhHOpjB531SNfFn0Vrq+7Poym9Vb+AX/tcnSBNV
 itEbpqKLUyNcYZo7CQMkC/gp3dr4wewwfUkGTB4xaP6hHnuUquUhuGJqwcxFaZF3LlZy
 jlkw==
X-Gm-Message-State: AOJu0Yw9Gxq9+Wyvpq/sRtjAxsQeG4Su5DBfp/As6/4Uyd7C7mDxw0Ek
 FIs7bgKwcERDny65yhKqLn8UyYiSXAg94AoTdDG9gOfihCw53A7CU4O1pXWcNcY=
X-Received: by 2002:a05:6512:1154:b0:52b:c14d:733c with SMTP id
 2adb3069b0e04-52eb99d741bmr1577497e87.68.1720538875240; 
 Tue, 09 Jul 2024 08:27:55 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f7420cesm45316395e9.46.2024.07.09.08.27.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:27:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [PATCH v47 19/19] hw/sd/sdcard: Enable TYPE_EMMC card model
Date: Tue,  9 Jul 2024 17:25:56 +0200
Message-ID: <20240709152556.52896-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: 8HyVJ6nCkrJF

Now than the implementation is functional, allow
to instantiate it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 6aa83251f7..4a6e9cc035 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2941,7 +2941,6 @@ static const TypeInfo sd_types[] = {
         .name           = TYPE_EMMC,
         .parent         = TYPE_SDMMC_COMMON,
         .class_init     = emmc_class_init,
-        .abstract       = true, /* FIXME: Remove once model fully functional */
     },
 };
 
-- 
2.41.0

