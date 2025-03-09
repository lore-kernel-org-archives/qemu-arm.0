Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp541799njc;
        Sun, 9 Mar 2025 04:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlAEAkcz+Q4AMRm7iDPQul+OBtLRXxNp1YKHCEkOJUxEMiFftNyjLV7oZEMo0cE+dtIJ11S7SHRk3LxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHisKgs3UU1vN7umuQIwUMPyZnap2ZOnzJt1NZqbFL7joKUZIWqk+eouo4Uc4xKREekYH6s
X-Received: by 2002:ac8:5dd2:0:b0:474:e75e:fccc with SMTP id d75a77b69052e-47611959d2emr139966171cf.35.1741519245198;
        Sun, 09 Mar 2025 04:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741519245; cv=none;
        d=google.com; s=arc-20240605;
        b=J5HK5mSfoN3pryPnCgNIeM1iX+18quWqY/w8sCQzMES9OlUL1vmoSWsy6Df5Z4WNs1
         3NEQH42eEzqiFUeutpcBCjMIKA6bMT4Lq8TD9VWaaWcSv4YK+9YYgCLnAI8QqWuv0Vgu
         Pj/ERrpZa7HRZ+OBZ5Y1/URjaXDXan6P3OdZjbM/9JPfqei+W8Hdvo9vwb9TiltgqtvC
         01CwohyCml4xktoUw3dAGEhTIAM3WSGMKpFK3ePzyY6qXVO3TCCiRbaKm7c90WBt+Y4/
         XXMUwuLOwt39L6wEVnvCBxf7tY5xYF6eO1vso5uT7EcZ58bKwlpBSD/PNqiQmHN40pDl
         ufHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=Ee4UW0rH+MxOO7bHyuSeM4ak0D2paIdH7EyesHf1+fk=;
        fh=g4IoZ6gARhmvvdqyrjYwV05NB5zXg6qgZind0UQ7Eok=;
        b=OmSNC/Eneyx78ESLW0j+qSEuiGnerP3Jw2VeDOW6ExcYBSXtO5YyYh385wEWLYjccO
         CnQZVMfxERvox3pqF655XYpfMCmCJCMi3uoDXX78hYaKqTC0UWHjVUnzfAKO/vuh+zQI
         XANoNk2BhUexU2uB0Rd3LzSs32y9N8LK5f++L/hboZNVZ3R8/niLWxfPiUerNbqkRr4F
         PbJIXOWZBgYJsJw8Ff9J4jrhMKaNznxOhpymNja5QL4am/XvqbsShvRyIsmi/kXx2LXe
         mmqbul8UxLSAHWAD4Stg5q71UWejT2s9qUlO6MLyHev7aZwfEhqPaAzFUOslyRKc7S+A
         KZPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47665362ec7si30665101cf.120.2025.03.09.04.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 04:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trEhg-00075b-MP; Sun, 09 Mar 2025 07:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trEhf-00074t-4k; Sun, 09 Mar 2025 07:20:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trEhd-00009q-8l; Sun, 09 Mar 2025 07:20:18 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D4D834E602D;
 Sun, 09 Mar 2025 12:20:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id d3hX1SHkr82Q; Sun,  9 Mar 2025 12:20:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DC3004E6019; Sun, 09 Mar 2025 12:20:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D7E1374577C;
 Sun, 09 Mar 2025 12:20:10 +0100 (CET)
Date: Sun, 9 Mar 2025 12:20:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 02/14] hw/sd/sdhci: Remove need for SDHCIState::vendor
 field
In-Reply-To: <20250308213640.13138-3-philmd@linaro.org>
Message-ID: <6148217e-1b9e-69ea-bd08-421b71967234@eik.bme.hu>
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-374121858-1741519210=:9805"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: nuGZGlXT065Y

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-374121858-1741519210=:9805
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
> All instances of TYPE_IMX_USDHC set vendor=SDHCI_VENDOR_IMX.
> No need to special-case it.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
--3866299591-374121858-1741519210=:9805--
