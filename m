Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955220njc;
        Tue, 25 Mar 2025 15:43:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1Hifiogahrgd22xAdYOIt61xWzq8Pg6aMZWDA1XxGEtxJEu4uTztMzZKkR+bkQCASAiSOQxb8DBcb0g==@linaro.org
X-Google-Smtp-Source: AGHT+IEZoIq1yuSyB+3fs29a7U9iOe+2v+L6nwmhoZuTSswt3ruPgRXcbOkG6yS928xIuX46Yoz6
X-Received: by 2002:a05:6214:1d29:b0:6ed:1637:442f with SMTP id 6a1803df08f44-6ed16c99dbcmr21787396d6.17.1742942624007;
        Tue, 25 Mar 2025 15:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942623; cv=none;
        d=google.com; s=arc-20240605;
        b=EwJtU5Be2iMgs0Xb3Q8BOQhDPfT1b9nWXSGTx+r2ue6sc/fPLZ3/86RNFDNdzRUkoo
         1l6EepxwT43hUqMT/61TqzWEXNHNylMlXHw46PoIJgHmuEFg+SDi+FYfR7bTCgSdhvur
         WGbLUxD2zIdVdry0zDMCPsZPOFfno/AvsP0+7nS1k7+mV1/H0f/p97K4CFmum6zT9Epx
         2RN36W8kCMo4mKwZW7t5sU0jgTvCXcZbPIRArNgA15r/5Mzi6NFTOCt7o72/fjvdil8I
         N5oEOKRFOsEYiITd1GsNHGMiLGbRwfeJH3JFVX6zA1mq6q1qbgVJmyDWq6eod3aX0+Bt
         TExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uIsbtSKYbmjuBlwlygMfh2FAmt4wKaqUSYQkYlcHhAY=;
        fh=TzfB14sNQfn2Vl+hdNDM/PFev1zQWaZwt+7LQy2WRUI=;
        b=J2PD36yVEqhDlKxpy3KdT4ufECpJQXwzob2lXK06hn8o3OcSyjia0jA5PsgEvFd48s
         sHgtUWxqLTWrflkGLvMSHt/CCHPwaggaU6yyhOaCJNXPdyjGyQRZjh0oMKUnjmxTGry4
         /Eke6o+noIoMNzEJ0ItIeFaaUjfgVnvs2XGYHnd471jhQrN1sJ8MSVl4He57USz2XIQ1
         jb4bGrzd/WTI12yd6FHAMM4U281kkHUH8MQttwJro7mrGqPzi/Vx1dT44n5DJlrehye4
         ddaPgnsIqUt1M3/q9yyYzZj+I3BFLHrLWy96Sxf2fmqlaRDFPGogBAIslZPSIMhnRA6r
         DKdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PQz9VHJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3effd944si107041336d6.169.2025.03.25.15.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PQz9VHJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txCze-0000gi-In; Tue, 25 Mar 2025 18:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzc-0000cx-0A
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCza-0006vt-Ek
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:31 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso42557685e9.2
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942609; x=1743547409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIsbtSKYbmjuBlwlygMfh2FAmt4wKaqUSYQkYlcHhAY=;
 b=PQz9VHJQnv9EXVpieVpBpnyn5UKBTIaPufX3fyeO59/MWAgy4A9XjovQ7B2DZUZ2iC
 vEo0UV0XSBw6byBP+i1f8hE1+1Lbkbddv7LR6/hzkmqSkThlS04Td+42StZdNKNrQXkp
 GnHBpAFODeO69ur8c1CrSI58A150/Bux2K3bDLWHgY/R0OdXGZ3SoVbTGt59uPt8mOE2
 NOXx1E7/JZOts4qURzLobXDohK+8eKDDMFAQ34sD/mW+tXGm2HJb/CYs6oNwUpb7EKqj
 O3YdWmgM6qE5CerXhH9F+PQADUg3vasw5Io0rttNurzCdRcYbFDUYcZ93vBMefSTxXVS
 MdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942609; x=1743547409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIsbtSKYbmjuBlwlygMfh2FAmt4wKaqUSYQkYlcHhAY=;
 b=aUkpBlQuz+wQ+8ZNllFp9qbgME6tVpUV3uNf2i5eDjGks3CwlZQCTjzaZGKc+pEUFM
 KcxHpeIGeNJakztAgVRiJI/0d6etY7JnFByclUli6t/10KCi5LaxgwGilX9LNLW8Sjyc
 JFnAx6EOGxau3pP5yFr0a2OSBVH7OFoVNKCnJPPS3haSt65hmffLgTvBfSciEJqMRuWp
 Rn4qV+4yY5QCLEsJ6ul6L9+lXYYJdX6R9w6YaDQeM+QW/GnNjKOsTmOP6OVkMFW1tfc5
 HqhUBdoTBIBcFkCbQfBSNLZUGrGPmnPKhOpMoWOuTffCE8Sx0ECVv57F/vddPLMTk+Mf
 sxlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeAGNQsvsOkugiJNRK0EEdqjZvAecVcMNZ+P0cZe1Wq1Ce1pSBukDAqhZIibRmaaq/QnTRrtoxRw==@nongnu.org
X-Gm-Message-State: AOJu0Ywe0is7OrT5fc4PSFiNHjVT2L2o2NLpgtg5imZ3D5hIjPne+D8l
 zTbE9awB51BHY297GSflAoBc7GcvB7f8Cb3HcbqUxQnbZUuf5OkrMFJa5B3aUzs=
X-Gm-Gg: ASbGncukjJkd19HY+ZOJPvFt9zmVTp6xRsJdDLy3XdxKwBJPLFy2MUKhf9e+AepK7TM
 /D0Jlv+2py4/LeJOWnyvF9e4x1nZGBRL0Ye4qaDdewbUHvb5U855JGp7Ns2ODKp/HbIbrVBS0f0
 2YLU4C10F1OEH1CHYLnEEcsONF9vtR5xGgvFLAdRvA4YW6tnpRHoTw7rhJekkXL3r0cbsnYEI5p
 Clv6wf/uXe+FyzVVA8JFkFZbfYVFwxTKx7xRCEFBP7JRuGiB2T3zkD39LrAgC4QWEXKnCS5ESfT
 z5FVzsvtHgAV7QIuYdrD6QE8Y94YqHmJo4Q5j5Wne7uW3Tks4iXFWS0+KDs7vLM0JUrDQZohiFW
 VCTTlgQWEgbMMQ1Gxy+E=
X-Received: by 2002:a05:600c:34cc:b0:43c:efed:732c with SMTP id
 5b1f17b1804b1-43d50a3c1d4mr162965315e9.28.1742942609083; 
 Tue, 25 Mar 2025 15:43:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b517csm15243394f8f.51.2025.03.25.15.43.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:43:28 -0700 (PDT)
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
Subject: [PATCH-for-10.0 03/12] hw/display/dm163: Add description
Date: Tue, 25 Mar 2025 23:43:01 +0100
Message-ID: <20250325224310.8785-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: QrS3Yql8hqqG

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/dm163.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/dm163.c b/hw/display/dm163.c
index 75a91f62bd3..f6f0ec0c632 100644
--- a/hw/display/dm163.c
+++ b/hw/display/dm163.c
@@ -330,7 +330,7 @@ static void dm163_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    dc->desc = "DM163";
+    dc->desc = "DM163 8x3-channel constant current LED driver";
     dc->vmsd = &vmstate_dm163;
     dc->realize = dm163_realize;
     rc->phases.hold = dm163_reset_hold;
-- 
2.47.1

