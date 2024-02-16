Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1152629ejb;
        Fri, 16 Feb 2024 03:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZh2WEHzoTIgLa0dZauKTbXh/Ck266A/RZc4uD9EdfzEY8gmo735a6mBys+ZZzAao3mzoQqqaZP4y51BJwn6igpaUzWZk0
X-Google-Smtp-Source: AGHT+IEZoyGA821X0UJ+ipPmDkubAOcQzIKHjdhh1ANhvo6eYvwv3NoC4snCZf7PUmO0EMjwWNBc
X-Received: by 2002:a54:4117:0:b0:3c0:3189:d9e2 with SMTP id l23-20020a544117000000b003c03189d9e2mr4131842oic.20.1708081618285;
        Fri, 16 Feb 2024 03:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081618; cv=none;
        d=google.com; s=arc-20160816;
        b=O+ZCrjwyMX+GB+dtU/RrYfxloENcIOA0WIFzLJVPZez+HWJuC3zU5ctmwqkgTsB88t
         qZaGz2WS7TovrRG3CUy745NNLbNpw3cC07PbQu8U6ewrBg3ZsZiTdYJ5Z48eQ6FiF+/d
         XktRgE1ms/idpNf9qhw7qO6p0TUbb9ZMA8LrMT2bopAr1B+bILXDVR1raoamAGvlvw+I
         VV7WvjsiTOZ56gdUXITpxmuCEageHGlilK8o1k3+9mfvBojj5NQ5s0TR15fTgp1yXtHg
         brgesoBZ2Em5ScCZnA0RKg2mc46TuvO3Dd/AfrppIxGlmzKVEpiiZSv9+/OPow5r8+oi
         u9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EY92sY1OM6q6PT81SQkKCMEQr7lGvoIEo8ukB7aXD50=;
        fh=UiWC6Roja1ztrrNqpKE/JeGIlT1eDwlyHqBVsZEo61g=;
        b=PPpXIjEhA52+jtG98y2bx1Mlu/k35PVeN8Xc/SoCEsK2hLPLk0egABMseRPPOtArvP
         INA5hO5Fl+0fh3Pi3oUfw+YCxHXG3m2i1Fskqi6QViF+t5JS5tOB+Y78S/xkTKkuhH/8
         rvVuQSEVl8eOaar7qkPWTqvNOqhsDtqu3n6z7s9e3QS7sUTozpDAotDrNDyCCCDdBruN
         Nu8Xe5HDvGHePBBwQHCWUgej1HwLg6QBOA3Zh896OzcjaRODpxvH8cCflHlivXOPv70n
         HNUWxm5BUlIQ9WG7RWlbjDTj2D9YYJHkQNChGpkQIE8/6VmQPXLdoDxDYuXhb4pQ6Dm+
         63BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/ZcLL72";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a0ce800b00787162aeb70si3662303qkj.774.2024.02.16.03.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/ZcLL72";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw2N-0003UA-73; Fri, 16 Feb 2024 06:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw26-0001oM-5r
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:05:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw21-0001Hi-8I
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:05:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso16715875e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081522; x=1708686322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EY92sY1OM6q6PT81SQkKCMEQr7lGvoIEo8ukB7aXD50=;
 b=Y/ZcLL72CDJKL+5r2dO8P+wIpI7/77R3I3pQmRUqOH21HAHQjN59/1XuC0YIykgVv3
 GZ8nNUws9Sqe5zvOMTgdzr9YcCXxHLHdk4CQhx1guMtQ0SPnUHHJ7mgKPRT8Kbz0av99
 E6jGgkK2IW1uxLkQgGbyHB8C7KbTFQ0GZWtYHdGf7v2IPcX/mvWQR+ffdGteo2kk9RUz
 frb/Up2+gAy+Xf6vRXBTnr4BN6cO30tCboc4r/n4uPDSBp/7ydUDiGA7EKI2fDpQXFDE
 6CDlpj3c+B679wRIOLafXInl+Q4EgGxcpdgCq7fe/n2z7mb6Hc+OuVFk8cXLMREWRNFM
 NdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081522; x=1708686322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EY92sY1OM6q6PT81SQkKCMEQr7lGvoIEo8ukB7aXD50=;
 b=eegkaVPd3v86Ks8BOaPFV/u+UOBB6Dt104uZw2VuRTkQBBs4cIq00my9M6YSMJ/6vQ
 6dG4BAurE+R6FJHfV1QODQFsDUldD2hQvCNJmVeEOb3ltm8kKHaAScGgJA7Q2Lhsy+yn
 Z+XAsB7Y+9+mnWtZYPagw6HVCYG3DupueOtmFsBHYkTYjanrp93lcaq/VBbg0R8JlmDS
 DwohpP4julBTyJjHK3GaLnjtZ+xmcjJHk7XqaNYrNuPhyqXwLN678HtRCEgqKPGRvnUR
 yHD4+Wt/3HsHiG8yR/E0clER6BAAx0e9keKaxU93qCtDivDf+jcfLYORsMeiH0gPBlws
 dOlg==
X-Gm-Message-State: AOJu0YxMP5gcM2MfKpf4lXSvHzSb1OBRSbG3qNsXsDKERPcWhLUI1dAw
 dDkera8AlEdTZ4JGuR21Dewh+e2kjaOQqxZjo8jowJJJ0p6GqidkoOBFGEhxxEo=
X-Received: by 2002:adf:efd2:0:b0:33d:201f:ea9d with SMTP id
 i18-20020adfefd2000000b0033d201fea9dmr875165wrp.2.1708081521846; 
 Fri, 16 Feb 2024 03:05:21 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a05600011c500b0033cf095b9a2sm1873207wrx.78.2024.02.16.03.05.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:05:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 19/21] hw/s390x/zpci-bus: Add QOM parentship relation with
 zPCI devices
Date: Fri, 16 Feb 2024 12:03:10 +0100
Message-ID: <20240216110313.17039-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FhT4/Fizq14G

QDev objects created with qdev_*new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-pci-bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 3e57d5faca..6d07a7b530 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -934,6 +934,7 @@ static S390PCIBusDevice *s390_pci_device_new(S390pciState *s,
                                 "zPCI device could not be created: ");
         return NULL;
     }
+    object_property_add_child(OBJECT(s), "zpci[*]", OBJECT(dev));
     if (!qdev_realize_and_unref(dev, BUS(s->bus), &local_err)) {
         object_unparent(OBJECT(dev));
         error_propagate_prepend(errp, local_err,
-- 
2.41.0

