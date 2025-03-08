Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp306945njc;
        Sat, 8 Mar 2025 13:37:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWzPWFHDn1abvvjQ8YNgHZcEoPlXlD5Uw18lCEx1AqDOtYSAyKZjX0fgWAxOVn7RLShmMQZuaJCaAEPA==@linaro.org
X-Google-Smtp-Source: AGHT+IEbbZRUqAK5kb5ky3v27dG1kJ/v4injvRvDi6szXmmf+cXSzbi9g5qGCESDq54tD20wT0AG
X-Received: by 2002:a05:6214:da9:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6e900601587mr116706546d6.8.1741469834942;
        Sat, 08 Mar 2025 13:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469834; cv=none;
        d=google.com; s=arc-20240605;
        b=EcB6KHZt3/UDb0D5sqrRxVAinuMcNyYtmgkVQ8fn4xmVm02x5Va9bqx8TgV4ZM1qRN
         OEImJaPsWY5HuK/lpJp0s8ff4W7gBdcYe1iy988mEDJhrv/rPI+1nJk8f+bMTiiajl7x
         KuojROAie3mg1IpBy6sJ4B/Cr07MHSlzBUIH8jweIbzN3rRz9BxUbClmAmOdqTQ4APLd
         Hn75+UFtV2sMMCOXyccP1Sd+1wKVDpzQox4QD5oSWrK7LAUTc2DBkZd4bxyHukf7pffx
         Sn/KPgxwMXR3evvRyR5SvqjFizQ/aapx5nsUn5BYDeePNKVJve+KYbeSfR9PT7Wh6Mp/
         oMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WDbWzQ3TRhfqcCdGrWE6Ka+gW+QxOu8dbIYkiLZFWgQ=;
        fh=WKXvBSHpi/OTkm5FiZFKutyjF8BHZHrOk/P7CQMO0Fo=;
        b=DKHVTMuLuLOIxOY4425kTqGZ/KoXqw4DrY/gdZ0vy3reoma464yuzw7/UcejoDQfqZ
         okChtt84Bpxvikd/Of0YjvZbHRYsidtZBiZaSBLnVS9+FE0cWtCV0L6ZzVmCSwMeDJUM
         +F9wRFsHrlMcXPDAflzzUGcP4xv1UegOPki/nFxRslLXkiHzyB0kzr/R0ZM9cJP/OvQb
         5TQ8geIE/w4FTdSPSd5QbaOqR8TQQbFipyNr6UQEWcaEdMYwm0LRhqWC/nNNWUX3cEXT
         G07X/2tLr+WyKg62a9Do0nOZlkVeWcKij+y6a5LA7agnom7Qgd5MB97xCyPYVWdcNmfW
         8eLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UC18KpIM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e91067ac43si11284506d6.424.2025.03.08.13.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UC18KpIM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1r1-0005OF-LU; Sat, 08 Mar 2025 16:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qm-0005Ks-77
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:36:55 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qj-0003rW-NF
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:36:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so17540465e9.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469808; x=1742074608; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDbWzQ3TRhfqcCdGrWE6Ka+gW+QxOu8dbIYkiLZFWgQ=;
 b=UC18KpIMYVewhQMRLfuFu9ytC+o5y2jG91K7piSEqDd08VVSLkqv2xTt0AmXhAtudp
 JDm6nyFYyXHW75GnxsI/1YrOMO+T/Lgc+M6HygKnYZPceffVf9yIxQV7nFsrWaWNik4y
 OY3FeIGUKT3Ync+K/RhVdda+hzqLrD8W+VMIfJ1AO05A9GrcU64+3Syra+6eUMhxT6wd
 iz6zO9eCsqUFQyHMf0uxxnUth++UuT1WQd+Lgox9VB6XcjlSL6FFFXby1tuwYf7SsZiW
 Jc6DJMOH9V/rLGeSEWlIbI9qroW8clC0IeG/adR8+XsPFoWb1/R7bYPVI1aQI5lzjDKn
 h4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469808; x=1742074608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDbWzQ3TRhfqcCdGrWE6Ka+gW+QxOu8dbIYkiLZFWgQ=;
 b=bjUNkQbc0CQt5De0mjf8ycqmwd2rbCOyLC2BBEp6xKi/emX9DBZr3Rc8+xqDg0crB/
 htvJ28vrSDnVaoIbk0Z+rBmn6CyDkykbEONsyeMF1ghKNt+5AunUvWu72Mpkkbe/GdRe
 chujc4QizoYfGvtqtpTvZRQPDgQQKD0Lae6wYPTtz8Dixk0CbKCo2wSGEAI7zi/0Gnmz
 QjWtDgKuHjuTgRin0EKxmu7lAdOM4g0M4m+4g+tBpgmudj1r05XxiidqvYUtIgRrqV6o
 QdfEPrEM/NGuj2j9uG24IICSOZwRr9oLOO5hJibUQRK8HMTE2bBV7+U0gtvNDiiAbfsS
 k3SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZL0ewOP4vZqooHRJh5lQCu//IktJ2w6INbKP8BuJ0KrTfMMGVDH0fOfEoGWpip+CLRODxhwXgRw==@nongnu.org
X-Gm-Message-State: AOJu0YwpjNUohsG1K5KYygJO70My/vTUfXsjOGh3tTr4gtnQcGXdHy1N
 wOdZKtIe6xOwh5Gnd5Q/4QDyBNiIoWTcF7FBTchttjNXaHkoN5vGxT75lwwpPlY=
X-Gm-Gg: ASbGncuVGVDIspppszcjn9caYU+Yb4lt7Q27KDtGe0kPWwZ/GsQdheifFSNSSac1fA0
 v7Ld8dPEkvdrWe97BmDdoLA2SAxq1CdHK2x5PJO8ZVIyQ25fTrFHY51naq9xxydkU4RWZc1XgI2
 LYh1sM+zWkme4N2Ek5zpA+JFzUmSXY1dwxApYOXqgwp9aiXjGUBqO/89kCoC/RP9k/QtNs8fRuN
 ts7hQcOcHVVOW7CdiHqKE0mLzLOMql7jb+u7xeqXwXA/IWTDw588pUoFo828NfGYoJni47VBuQ+
 hJU0xZDTAd5qiw1Y7lNBqI4UbEN/WhjUF4tHP000OE5Vdo1pYWjT6kRpWY/e+b3bsEulKUTJ4s6
 T6nBiuelzB4lq3MEpkTY=
X-Received: by 2002:a05:600c:3b0d:b0:43b:c7f0:6173 with SMTP id
 5b1f17b1804b1-43ce4ac7369mr24625595e9.4.1741469808250; 
 Sat, 08 Mar 2025 13:36:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8c3aa8sm94423005e9.14.2025.03.08.13.36.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:36:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 01/14] hw/qdev-properties-system: Include missing
 'qapi/qapi-types-common.h'
Date: Sat,  8 Mar 2025 22:36:27 +0100
Message-ID: <20250308213640.13138-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
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
X-TUID: Czfm2FIQa26v

DEFINE_PROP_ENDIAN_NODEFAULT() macro uses ENDIAN_MODE_UNSPECIFIED
which is defined in "qapi/qapi-types-common.h".

Fixes: 4ec96630f93 ("hw/qdev-properties-system: Introduce EndianMode QAPI enum")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/qdev-properties-system.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index b921392c525..49a3825eb46 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -1,6 +1,7 @@
 #ifndef HW_QDEV_PROPERTIES_SYSTEM_H
 #define HW_QDEV_PROPERTIES_SYSTEM_H
 
+#include "qapi/qapi-types-common.h"
 #include "hw/qdev-properties.h"
 
 bool qdev_prop_sanitize_s390x_loadparm(uint8_t *loadparm, const char *str,
-- 
2.47.1

