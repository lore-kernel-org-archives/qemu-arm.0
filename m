Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp537485njc;
        Sun, 9 Mar 2025 04:10:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQKYTnsWeZN8bazxhw10pj5ErV8G94mVM73fcOAMyBghcW3pHM0RKcheu0bT8zfz8/ER/wf0n05H76BQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDfcKJQHQ2X+rDwR7Efg7VzaoLGQ5p6aURVB0ENjojNrucgP7SeirWF0jYYB1g4+7TlPFJ
X-Received: by 2002:a05:620a:8802:b0:7c5:3e22:6167 with SMTP id af79cd13be357-7c53e2261d9mr789748185a.23.1741518610602;
        Sun, 09 Mar 2025 04:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741518610; cv=none;
        d=google.com; s=arc-20240605;
        b=iBQEyAO4OIxs3KxGlf8tsXOHE4mSREPK10jCkx177yBWXgannb+YG0QqeBImQ1JzhG
         SsUF7gznW6RiV4RajyCnSsmOZYXMvtltBXt/XoQ3X7nhMvlDFwW5wpwO7XRlzs8hjin9
         iXzkFVOCnzxfAX0HQQKIq5Vwr9JJFS/xt3CN6L8sCsdzpaymzDr2SVVgTB2nb6HxVAZN
         kkD5reWSzN6RtX94KzZGeR8jym46ZO9ChabT3qiIbhGwYWr9JO+u/fqpMRT4iN4fXmg7
         T8DpleomLEatV2KeJCtzN2+97bBFsxsvxvxL9Ld1HcW/uVvOVdr74YGLOCbL4RjfhhsR
         A6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=bhDVcryryuIzKdu/IK08nPqPQDHIqSOMVp/mTRlL4Q8=;
        fh=g4IoZ6gARhmvvdqyrjYwV05NB5zXg6qgZind0UQ7Eok=;
        b=VXO818/iTQz5te3az1D2WH1QAfdukvLsEKlSGG5zWng7e4wiiU39k1ZusMTgx9a12f
         475tjJDZRBEYbSi6Y7tArjdoYNr1/kdiKh2BlsewgyLHDDkoWlwaRpyLwyJ8ZOi3ScIR
         bBMBxf5W8IlgUiGp7cE8EuVN8KxBUMpkE5TnEiReJOnIdzIzvvC2bhSCXkJjmtZ38kOR
         c+jQ2/3vJz3y+V5hGbGZFhxO5bvFP8wj57arnTlrBbbUBCqwkBvzgqcd+vd/AZPFfU8A
         Z33pbmTGBv8I/8K084Ng4S9t8d510h7R3KMWyzjNnYdi2MBrVisWwbuwlmzvIT0tUYq2
         /18A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c54c7c0736si76873385a.48.2025.03.09.04.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 04:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trEXH-0000NP-2T; Sun, 09 Mar 2025 07:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trEX5-0000I3-7U; Sun, 09 Mar 2025 07:09:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trEX1-0006Y7-P1; Sun, 09 Mar 2025 07:09:22 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F1A444E602D;
 Sun, 09 Mar 2025 12:09:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id Qhlo6Z4xBOGz; Sun,  9 Mar 2025 12:09:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EBE4B4E6019; Sun, 09 Mar 2025 12:09:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E678A74577C;
 Sun, 09 Mar 2025 12:09:06 +0100 (CET)
Date: Sun, 9 Mar 2025 12:09:06 +0100 (CET)
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
Subject: Re: [PATCH v4 05/14] hw/sd/sdhci: Make I/O region size a class
 property
In-Reply-To: <20250308213640.13138-6-philmd@linaro.org>
Message-ID: <060a8ba8-a5f6-8081-8d30-131008c504a6@eik.bme.hu>
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-842983965-1741518546=:9805"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: 59PjpbNFJUZi

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-842983965-1741518546=:9805
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
> Be ready to have SDHC implementations to cover
> a wider I/O address range.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
--3866299591-842983965-1741518546=:9805--
