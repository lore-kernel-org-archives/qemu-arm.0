Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2956054njc;
        Tue, 25 Mar 2025 15:45:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx9hbf0i1W1STswBF2JvzQ/79xVwGEkX+z6KJyw5fDJ+vQJ66IKMVs2oOf1/RUatrbm96s54twL8tnSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGJBlapOCfS8Ur2Pj6/IZfWB1zjKdkmSY2JcHmb88dQDe/EZGBKr8Z66LfBGaso514LgnWx
X-Received: by 2002:a05:620a:1992:b0:7c5:497f:1002 with SMTP id af79cd13be357-7c5ba1e403amr3150217385a.46.1742942750463;
        Tue, 25 Mar 2025 15:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942750; cv=none;
        d=google.com; s=arc-20240605;
        b=KStyxLqGuwqZGMJc0SZa0RGhvsKeRIfrGMGFaVPA9ZHT27UIKj1XFHdH/6MtnxfNiO
         eIux0wK/X40ccnrSQKgkcRWU5JyBplGtY3MXlyAAuuA9yvajn5DsEau0OkIr1DD3EaiQ
         ytylw2O5il2PhdIwkT2PpNAKZvRlQCGf7ElbxdIrFQnrkXJrOSOzqT/lvRrlB969vLLM
         a7DLX/rLYzBK0iWt7YkpeVXQlxiWl73n2FunRbiemPWhzpzmdjNBcXUlA2+/kH0vaYWm
         xd26RliDmAqyU033gwkwlKxgHZKQGbD6ca2k1mOJly168cd7jeXTLNjm4liu90CRGw9P
         tfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0SOvxtJeq0EX5lR/jkU2/dH8LgMhbpkIvEfLhQT46Rg=;
        fh=fl1bTaE4bJqe5lYPy5yh81fWBnIQbwNhCI0RkY6sRE0=;
        b=Z8uh4LndYYyht0+mYBnDulMFdPi1NGcwhbkRCAvZ/bX95XlaVAlEf7fUaWweA7vR0L
         zIZapd63WQGHu+VTP7EcCiU9UR40Q0yc0bK/0BOjahHGqVYIHGSKnIulciVvUFBPB3zX
         +E3AAHESIa3FJANqkCAvIITVmObK+AguThdWpG/YBV40uyKl+YG7SJAf2Vit9H0pAqap
         QwQWZzOjb7oRyaSRt+8BMcKoyMCwrfSobbEXURuL7Y8C2ZqBnpHA6iMvhv267ZxT0D9J
         CFy9LK0ZSjDUowrkcAqw7UnIDnLE95Tq+a9yA0lY1lfTnUwKFJNK2a8popfe41mI70EZ
         3WYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cS+9YF5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b92d4d7csi1019190685a.160.2025.03.25.15.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cS+9YF5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txD0C-0001Fv-Eu; Tue, 25 Mar 2025 18:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzi-0000oW-NP
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:39 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzg-0006wp-17
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso28292695e9.3
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942614; x=1743547414; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SOvxtJeq0EX5lR/jkU2/dH8LgMhbpkIvEfLhQT46Rg=;
 b=cS+9YF5DO1DzdWrCU5nGAMAQliQt2Ombjdj8Tod6IdFBtB3t05t5+tfbVOi21IugBo
 yhWlPTTKLAm0u/l6r1TWN4JDs0Q+naS/XxSt6+bhk5xfIWA93LRz2R0lxKC6fe1BsKM0
 WOTGniZqasvKsv0YpPdHC+jrq1c4UNa/t7QxzlNFNssW5VjhiY2cJ5xwvMJzMTiBLvna
 Y8IGLH8XTf3pfnIWHiH600Yy5oCBt6MIWYKvWFQFWQxjV4JJ3pvxbz9Cs1yDyPJkS7kI
 uOKRiFTHQt0PNVcAHy3DTqv9ViYLI59H19zieviylLnNAkavoPeCWpte8ZnA0B3ztWWq
 AF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942614; x=1743547414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SOvxtJeq0EX5lR/jkU2/dH8LgMhbpkIvEfLhQT46Rg=;
 b=Qoa/crGqATwdxxLYSUDleSeoo7LmWlRn6hBWOnX5CIw3o+JxeoVnGvXmP+JUTJpdja
 ZDL+yRCp7XhKyODhrUgYgyMNQPygbyXEJkroiDuESOEUuG9V+vTkVOZFAUW5qeY74t3p
 4qbhYM2y2UafqUG9/ZXiCW0kNYGiSsiWYO/4/tPcZ0J00nLYhxofu5qxfS7+kjL8AUGg
 xKVHI59A1e2vqv1dSgUW8lomXRTJKUlOKexwntgC0iyvww22aQb3hxfchM40znq90+7o
 9sjr2TC3q7nz3c6zFaTi4y1fwxMoqWcBgDhgl9zKmpALnnHWaKQRXNTSFKExvgQ3RnIS
 K7mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4AG4aezBvs2SYSLH7MfEeFhitahrhXTYbXuIojO2RmYBIBrnMYjAsORGVfajbbvtyyFjZ7AO2vQ==@nongnu.org
X-Gm-Message-State: AOJu0YzMJI9qLIklU7qizdbhxo/4YNIl5EcRhLXlkiE8GJoXgOz8/bL8
 6u+pU0nS5HrWqhOoqJczKV0y1ZrXjBLeLUq4LUOH0gUSLm7QfS/+Opd4BYtBz70=
X-Gm-Gg: ASbGncvA3yYl1/tUzRwlfkvS30cMC08fNJ/jw1g/0GWtscExLuTUW+zur/B8EHWNVf+
 2h0yZzGvQ67YpkehYJeNBy/ioElSElOGjt2DVJuoGiKdh10YhWWLjzlvoQTpi3KHz/BsLIVwAfA
 ygQjivT9IYKQ7VbNfcJPVGJIHEuTWF27P/RMB97o/lJ1QLozFzPgk1t9TI+37p4DpZ9gg2rQ6xJ
 vh/00DeC+btUCRJ8t69+Ql3HHYinEtffKcetJvIl2hu82B61kXkwJVcsrtPqR6ieCmSqHBwNb5i
 m7BmmwsVGjevOyBtgQ2qrwFQy/c29oByiPDeygQMYsLsOgr/nLZOMmCoYOvsikp0++gW1CMonyK
 2Fg3765KVW4EqmVcfzIU=
X-Received: by 2002:a05:6000:1842:b0:391:2c09:bdef with SMTP id
 ffacd0b85a97d-3997f9261d0mr15336360f8f.30.1742942614322; 
 Tue, 25 Mar 2025 15:43:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efe61sm15199585f8f.97.2025.03.25.15.43.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:43:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 04/12] hw/dma/i82374: Categorize and add description
Date: Tue, 25 Mar 2025 23:43:02 +0100
Message-ID: <20250325224310.8785-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
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
X-TUID: LBnrKNEsoa04

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/dma/i82374.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index 9652d47adcd..0bf69ef399b 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -150,6 +150,8 @@ static void i82374_class_init(ObjectClass *klass, void *data)
     dc->realize = i82374_realize;
     dc->vmsd = &vmstate_i82374;
     device_class_set_props(dc, i82374_properties);
+    dc->desc = "Intel 82374 DMA controller";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo i82374_info = {
-- 
2.47.1

