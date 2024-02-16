Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1151790ejb;
        Fri, 16 Feb 2024 03:05:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmwQaUIdPGW+Nr9jfjMQCThALZxl/DYlNSKvbBqpeQwCJn2ItlZN82T7q+p+JfKRG25KisfgXLsCg3uAbsXM7Yirgp8ONl
X-Google-Smtp-Source: AGHT+IFeJxcsaQMA19+bgXhxN5+SuB8uwMQthjjaulLVM50puJMh27yqhGBAjmFlCzBq/VT1bF1z
X-Received: by 2002:a05:6808:19a9:b0:3c0:3156:a7d3 with SMTP id bj41-20020a05680819a900b003c03156a7d3mr5769126oib.26.1708081519543;
        Fri, 16 Feb 2024 03:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081519; cv=none;
        d=google.com; s=arc-20160816;
        b=f9KUogCrEATaTxlZp50N3kBgA2Hf1q+pLP7Q2mFanFpqYH3eZtuN4M2L1Wt5V8T4o+
         Qq7NyRiqq6h/nOYHK+PNObb9x0xCSV9lQUA8rHf5QmIHhQqM9SbQCxQSlZYhYeAfK3Bv
         O461t7hc35yWt2NuzcyTnEtnkiQZJbLGXctPVyrvRbOI0Ec81yGJ2Vslc+6ohfWMg4/7
         vCy6yVzWcpILrk2qg6HOATwQ5bKrXq23TRHvEuDDQTN/56Use5jw1TDXCwR1xpeFUAnL
         xs/2ZD0s4X/vnAbXf5NaD+inTdtludWlyG5loAU5+AvdPY3YNNhlK70VxQrlh6PXD+Iz
         leKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T0y1oWRnInhsHqZm+cg/tsMm+PW5dK4fpoLCbcPyN88=;
        fh=fTye0mSSXY8/JlqSAuxQaJFMVU5XWYTq1j3myzxpdTs=;
        b=JAjtO7rMFGvw00fbpJeBA90UkxYs16Tb/8r2J8dsOCXyj9w+FweXRTIG5Nz6RY1NyH
         5ep4MknNqw8HAcDfaHfZRHDlRoJa9pxVEsfkmlRPLW9STkUqpRO4nQLjuPPzAWFeP+GD
         P3okfki61vds7ALGZw3+8f5YTMfWcO9hEXKIGKCKA/ART5fxnPIEBwK2W7W0GYAWusl6
         DMIrg/KOKkS5raMD1TvhqwSanywOlzaNRUxrbjzrlykC/SBopTrf/LtM5LI7H21UyoXa
         zCcpVqu6pdfKPwwsQ4ghAiec6CR8CU1yDkfAfrCrhFywu/up/AgOGVnV0NjgQEOjxaVZ
         rLbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JH5nC58Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020ac851c6000000b0042c63b8d06csi3474732qtn.258.2024.02.16.03.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JH5nC58Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw1C-0007Xf-Ct; Fri, 16 Feb 2024 06:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1A-0007RH-QS
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:32 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw18-00014L-3v
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b28aadb28so1010699f8f.3
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081468; x=1708686268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0y1oWRnInhsHqZm+cg/tsMm+PW5dK4fpoLCbcPyN88=;
 b=JH5nC58YOAe6murAf8Ji9d+hD94A2GIfXNBxOprWtySIRQH8TD+apJkRM61FcK4xiv
 2PPZRvf7jkRlKW6op+KHRV6P0DCURkaM2CxVv67gi1z77zTUxdaz3lRv8y8NpWjwnBEy
 OKRbliYrXFW6jn+cU7/cgP4lEwe5DthLSuWMNUqoZHep72E9s34ysVjmuIsB6DwqiBGp
 EV1hk/b+mzPemEYZrp+OVejzOGF/rA7WBSa3hozafzPkMUlq6mI1ADoo6lAt/Vh5ORJP
 Kg093cEsMn7UsxNkyV8GbQPNWcnUNg+XE92W9Yg5a0boHXoYwJ2bUgCPz8H3BODx1u+t
 lNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081468; x=1708686268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0y1oWRnInhsHqZm+cg/tsMm+PW5dK4fpoLCbcPyN88=;
 b=GPGiB2TLSgcEREqd7onI7KDgXt/e3o0q1nePNzhEFclj6JCQNXCE56+A/YTMRoTHGY
 lQi5GA0vpH8mrZON8dhF6ifuS+nJwZvqckimHEKsZi/0+onCsyRG1zqdG/qBpj4v3lg1
 X8xrsdEuXf7Qm4YJIKSVqhOU240oSFnfokdvwJIpmI125/qK7h8AnhwFzexZu0mA6tXl
 c4GMzABHdZEtcR2l8Lp3KEhg5j1vLloDxLtcIqNbepGeOR9xYdbXi5/LT5DrHMZalMIQ
 cWeWmRliOj7Piqwkpoya4OUzVBNMNO6vI1tR0cGd5k/LmL+YQSpkIEsM2zNw8puvZh6N
 UxFw==
X-Gm-Message-State: AOJu0YyijfztK8H1qG4x8Y9bBJtbyU5CmNe3WBZ2MdnbFRN77WdqXqlU
 n6mxEzAFttdO5FcrNnzQFXgQTaCjI6IXyp1Xq38l+l6XCQvpxKU75jSO9+CuJC8=
X-Received: by 2002:a5d:428c:0:b0:33d:2156:6da1 with SMTP id
 k12-20020a5d428c000000b0033d21566da1mr553594wrq.61.1708081468667; 
 Fri, 16 Feb 2024 03:04:28 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 az9-20020adfe189000000b0033b7a2136a4sm1911276wrb.97.2024.02.16.03.04.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:04:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 11/21] hw/usb: Add QOM parentship relation with hub devices
Date: Fri, 16 Feb 2024 12:03:02 +0100
Message-ID: <20240216110313.17039-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: WG9v4Qk2IHSj

QDev objects created with qdev_*new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index a599e2552b..baad04f466 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -439,6 +439,7 @@ void usb_claim_port(USBDevice *dev, Error **errp)
             /* Create a new hub and chain it on */
             hub = USB_DEVICE(qdev_try_new("usb-hub"));
             if (hub) {
+                object_property_add_child(OBJECT(dev), "hub", OBJECT(hub));
                 usb_realize_and_unref(hub, bus, NULL);
             }
         }
-- 
2.41.0

