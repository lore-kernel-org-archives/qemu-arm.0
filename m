Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp547003njc;
        Sun, 9 Mar 2025 04:34:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCyx/EtS0fN0Ubat0LfVeKDkHajzrLD4rqIJZYfST0N7iS7aRKhNkhdMtlAyhZBgJcX0oGeLULEp63WA==@linaro.org
X-Google-Smtp-Source: AGHT+IGrrIQUfbJIDkygfwuam+8LMxBsZuzi67nRwkTn5Rabj33rAE+bKk2J1h3mREv9wJa4IBSm
X-Received: by 2002:a05:620a:2693:b0:7c0:add8:1759 with SMTP id af79cd13be357-7c53c8bf4e2mr1000228985a.18.1741520096889;
        Sun, 09 Mar 2025 04:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741520096; cv=none;
        d=google.com; s=arc-20240605;
        b=hlwcVyl7+Vf6npvLfU8kJEYsA1y3p5gL33EaubgYhLr6/OZ4Ocr8r24Ak+Ky41sPmo
         Oi3LS+gJC8M5NM+VQzS4U4htUTqKspZfbnxtlC9JDn2hJqGK6ahoZbeT3Dhj0f8JTXSc
         n5pjyffwtgrFPTGLY/+SG+Hi9KABtB1ytuleohHRgCIkWw+oj6xgcN1cNyP8//5zB64e
         qnNCJKuhQ2eD8OBfeSWNCu46OYSB+yoaaPch+avmxnuntffiHjsJYPZ/VAIKLTiyV0EG
         rooGgKG9GErDb74juZE5ONfPzsFSshDMg8cEui9Mouql3j5DiaZBUJM70KOVkbS/Dvl2
         5z9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=29IBGKAH77NZK6xZY+5MYE8BEhD3gh5zsY5WOKh2bjc=;
        fh=g4IoZ6gARhmvvdqyrjYwV05NB5zXg6qgZind0UQ7Eok=;
        b=hY2FyxWI4CCBniSBM4/cREc4tl1d42D/iIN5pXn+UM2v3acEqZgLcj8VTYaM7MSFpt
         4ht7g1dSIUElp3HzHMakKmAX0Ym1sxyIe3wBLu2BUvHAYDumcZu4zoI6cTBD7PEIC9uc
         4aapht9OLpQZKYGvxsx7By31HOhBS9PnpsofAK9MxQnGY9dA99T9CUwt9q5OfhbKY1aO
         nyoREMObvCIJGQ1+ELf73yN2OJCXzXgE7lHy4eb2bSmc+CB0P8mAzy0M4jQq23E/2NQy
         Odx/+j80n4O2Clx+N93K7t0Wi5Y6HfDh25u8/s+6Q2Q2FD3ypoXLPpsGfFwTjeCuFzpV
         NIqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5511812si722932985a.343.2025.03.09.04.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 04:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trEvi-0007ON-21; Sun, 09 Mar 2025 07:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trEvc-0007Kh-FY; Sun, 09 Mar 2025 07:34:44 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trEva-0005Yg-NX; Sun, 09 Mar 2025 07:34:44 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EA5FA4E602D;
 Sun, 09 Mar 2025 12:34:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id UcD6v2CQQD1X; Sun,  9 Mar 2025 12:34:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ED1834E6019; Sun, 09 Mar 2025 12:34:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E7F7374577C;
 Sun, 09 Mar 2025 12:34:35 +0100 (CET)
Date: Sun, 9 Mar 2025 12:34:35 +0100 (CET)
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
Subject: Re: [PATCH v4 12/14] hw/sd/sdhci: Allow SDHCI classes to have
 different register reset values
In-Reply-To: <20250308213640.13138-13-philmd@linaro.org>
Message-ID: <a915e927-81c2-96c0-1ef7-d641cd4bfdca@eik.bme.hu>
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-13-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2137444010-1741520075=:9805"
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
X-TUID: kwsxoBJyqJTV

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2137444010-1741520075=:9805
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
> For the registers which are not zeroed at reset, allow the
> different implementations to set particular reset values.
>
> Remove the misleading values commented in sdhci-internal.h.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
--3866299591-2137444010-1741520075=:9805--
