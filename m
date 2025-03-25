Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955726njc;
        Tue, 25 Mar 2025 15:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXicAth1/OOmeVSomAl3leVialne/F17RZAqSeIUwDqWCNvBLoiQLkB8TbCAB1ViLNOFpJNjfNmnEnYCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGlRuIKdYTqeNxNijoYwyIWOZaCBJttBGmvgWyuyXtc5o3vclep/oU7syKuUU/tDjd13mUs
X-Received: by 2002:a05:622a:4d9a:b0:476:7e72:3538 with SMTP id d75a77b69052e-4771de7dc94mr362146661cf.50.1742942700409;
        Tue, 25 Mar 2025 15:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942700; cv=none;
        d=google.com; s=arc-20240605;
        b=LGYMlAc8/SJ/oj5oe+BYqGG7e2gamQmYSNujFcDMBIUg8HEgTOQhuqqcz3SPWByOgS
         20gq6hIxM+dxzwO3TiaeVecUvA3DmWIFkuMwUahaG18AMSJ9+S4Nhz3Y+o8yCajYm9IP
         6mNpnF2tXoyZkZax3qYzNZFOaz7RBCEn5BKpfDNoP840dU0HZ5lEQvC3zHSgbV4c+N1D
         mGiMMSpBGpFO/d+Ub2FxfDIe/qbKiI2JbxKOZ8tlArqelBWGQr5vE9LQTTjLR1pihzgV
         vyNf0wRp9mFSDnIWOyOAdJxq60hCgl8PxjAkRRozdgeWsoDJ92tCdy5Op/Xh7qf4u9Z4
         IBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JG2VRaJptEB9qSuT5SVsGGWb28vBDAuwNTjCKkTxX/4=;
        fh=sfDaIBuWqNZTby8mT6RES5ZSaS0U0tBCPZGk09Bs7jM=;
        b=eSVr8tBxy0nUiaaMnZYrdtGmXD6U0UE8o8JhSL8IYxNyopiutvMQFIWEZv/l7/cRBl
         tz6zTzNoGvAF1hFK8M5sHVsm8nzjsOlc2q3iyLCHknTqFI5QtC+GvTq6ErAlthpCKPfp
         LYCq+lfmlYFwNcfSIwdoPURuAgygyKXJYqnLenGH+UvFKy/V+cQOS0nU9xxguX+6H42I
         g5GEgHHWqf+k/7aQMvcgpZEembFxbg0kCpQ4GCMwYW5ngFWA0Zg9kxZ64qrwgaGpSuql
         mE9vEp/86jvLKU+xKz/8FTw826WozTdtKGZfyf6W0SxZ2vKUsdS7sFxteXjKnPsIJh5f
         xjAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xlUEOtqY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-477291829c4si87415701cf.90.2025.03.25.15.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xlUEOtqY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txD0m-0003gL-SI; Tue, 25 Mar 2025 18:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0T-0002Mf-JG
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0Q-00077X-P9
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so37139045e9.2
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942661; x=1743547461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JG2VRaJptEB9qSuT5SVsGGWb28vBDAuwNTjCKkTxX/4=;
 b=xlUEOtqY8RK6YPCJV1+iwe/3bkff9SZG0CsThUBTOvg8AtaBTIbgVvE8I84ud65paC
 7zBx84S9/1QWFIDETVsX3JZJqrBALXHy8XQCScX93G2v0vw3UfQYBFI3hSLHB0s3Qf18
 yvd+3Jd871DT9VcdUZZfmPo/tx4CLtTophl6P+/20LYm3RKi+cclhRyZ7PB4a7iey55k
 dO83alSyFd9Wx4TxV36UsT71rc5u2EV7bZoqJUgq5yvnM5leWDFSvGnH4RtIK2swoqu/
 b6CfhhfiRGr+mFFGOEP/cPNkpWFbGgrFemoN2ll9PrMtOrnPdGFkZJwt7LTpx1nVysqV
 xJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942661; x=1743547461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JG2VRaJptEB9qSuT5SVsGGWb28vBDAuwNTjCKkTxX/4=;
 b=jBA0VsdBu4hNRcAmOfXGj6k9wo4J49WkTM9G6k/ZvLrWWCPsMD3QoMdgqMh3KXPhY8
 lk37c6uQIYNLZ10F+vHOpVLovEjBsRYhPwFPNMVXuO1GiGmx7N5qr9HdJaj2dix3ZTP9
 zAGX1vHvzAtJyeVGnc4+7dk1Av7ZW74zK87Rxuf6Xw89ssh69G7lx7wz2NFxSSWIdMs3
 7q84IOvlJBNCQnuqEhvDMEgIFAjlvhcFykQWpAfsI6jo/9BONv4/FjPXdqimDEH87GhI
 N/tuMqeQLE5c/5jMbA42zwXqnr2rqcA4FIwdIZOizCHyPxyBvgbeMUsBpw04EV0QUtTW
 +vvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDCm15FdcKm2U4WMWacG4wZZatv5ct3XGPSYjgG39o/0hA7KJbUxViM310D2Vi0aVrC9forwZiRg==@nongnu.org
X-Gm-Message-State: AOJu0YwYZJzq6uuxi3XMIvaUQ4xhoIhBIRRBKwutALFg9KuH8ROVE5Xz
 WioRPTmOGFXL6zrkOI3ecw/ghtUHuX3WRAKo7DE5aWcLmMo8jbRmiJiscBPqSNc=
X-Gm-Gg: ASbGncu4Jc8y9DFbRFyXNppV96/lR8WrD9F7ccKa23mCmbLaOXb3VCtER5Md+Mx2xna
 myHMzti5TU8viPvZoDOP9PMoBNazo2vDuSOMzbm9onjxiZdB2Cuc3+HdoD59A/66YtFb9M20iwM
 52TCTZlCIxP7nGjXfjaMX9qhuVD/XsZwYTNqFdSYRRx+T1JKsF3aRx9kFIlK+4lbg9lOOo9aJ43
 KmP/X8TcJ/toG9fwhtFpRvUpU1F0li3dUVwnCA2KxP1mpb/1y/5UPwDd4a+SQgOdb7De2Ej3zI/
 fxTyWHmZwKs1pPexveADKUD0FDDB4ylNWJsT3hpcRHZt33Cl124gzeG1anoRd8B+0i/cZd8aQOJ
 8aWJRxj1efhy8Oizzyrk=
X-Received: by 2002:a05:600c:1989:b0:43c:e7ae:4bcf with SMTP id
 5b1f17b1804b1-43d508725ecmr163452165e9.0.1742942661253; 
 Tue, 25 Mar 2025 15:44:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fcea6ecsm164303625e9.5.2025.03.25.15.44.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:44:20 -0700 (PDT)
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
Subject: [RFC PATCH-for-10.0 12/12] hw/s390x/zpci: Re-categorize as BRIDGE
Date: Tue, 25 Mar 2025 23:43:10 +0100
Message-ID: <20250325224310.8785-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 7BIPuoc26dqZ

A 'zpci' device encapsulate a PCI device to be usable
by System/Z. Categorize it as bridge.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-pci-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 2591ee49c11..dbfe24f6eca 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1562,7 +1562,7 @@ static void s390_pci_device_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->desc = "zpci device";
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     device_class_set_legacy_reset(dc, s390_pci_device_reset);
     dc->bus_type = TYPE_S390_PCI_BUS;
     dc->realize = s390_pci_device_realize;
-- 
2.47.1

