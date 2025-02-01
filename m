Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1072602njb;
        Sat, 1 Feb 2025 06:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYaEiwSOJd90YKK+kN9f52uLMgJS9Q+DbYV5b0MkUrJCWeYoliWba4l38GJ02+GhK56y1t6NCwaCMD7w==@linaro.org
X-Google-Smtp-Source: AGHT+IHRRDoZt5VVq70HzvvTOj3eZctJwP1xjne31gYUpf1lAmK/afPgXMJXke6k81RI0qzIYQVY
X-Received: by 2002:a05:6102:161e:b0:4b6:1ce1:30a3 with SMTP id ada2fe7eead31-4b9a4ecab5amr11488202137.4.1738420257800;
        Sat, 01 Feb 2025 06:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738420257; cv=none;
        d=google.com; s=arc-20240605;
        b=RGfDlGinWNpvFA4GqYmrWojvtZH3H+uy5FO7L7FPYsy3GdwOELuTBzucYm1sLZNh8K
         35bf4vPriTMDapK8YB7F1unTraCnCzGHOnlY4Yod9OO6V5l8sS02VcJT2yp2NvUNg6R8
         Pi1iS812RMVkKpleBUxi2s/dcjLAKuufrPo70fU9biccZMrgzpQE1SOCU6SwHg7p0Lin
         KjhksXd/taYmyuw90Ov4qoj5D06YDO5kOE+OO8yb5718HPqT3B4vlXUuWFh7VnbM8s7Z
         eeZwb6TXAuhdUitqNIRimCo1aD7601Tw9nBzen7L8QytnMvqnAfK8RxEUpU6P+89Z6uW
         IzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZecNtASfh7rrAlvwFbfUE2XXOpRJhV4UbpJBSEoNxZc=;
        fh=lESjYC9zbRRiggKTmGqrD3/xOfN+S34/gICyBdJs+pg=;
        b=Ss30hiDB4FldbbRsi1eQl4nczRrg7NjigVKkIV/wDgD0aj4GbFiyrl4bgPTgTanJ16
         u33K/XJR60kxOom5D5b+zeNkt7+Vlr5mnOv3CmzxkdTOt43y1ufUsU3dLa5IrA6ReT6T
         3cUGN7tIqvFWPeB6CwmZB3NVQtOBEAnzRtnT8q1w2zTgjmbhLouPgQbB0TyXoFbsTDse
         2bCWa8RbJUisznyIUQnajJH+7BSypVmGTZgA7bKSMUj31pxEtMFu8pRCifi69cZvaPP4
         4VThI6nbT2TyXFu+rgsuf61X+rMmvaF4n7rnKrA63s6zL7g9VeHHArCGtd0kIHzVif9g
         9iVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t5U5PIZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b9baa6384fsi1246720137.111.2025.02.01.06.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 06:30:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t5U5PIZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teEWI-0000Wt-OQ; Sat, 01 Feb 2025 09:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1teEVl-0000SS-3S
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 09:30:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1teEVj-0008Si-Al
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 09:30:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so29222065e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738420213; x=1739025013; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZecNtASfh7rrAlvwFbfUE2XXOpRJhV4UbpJBSEoNxZc=;
 b=t5U5PIZ6Slz8Q8c4XYZrdP6LBstWw9fDdYE9bqsViBvLQzN73tLxfv0L3uVwJARKjb
 55kEn1KRnM3syJw91nt4SHD0pO7fJwiF5dzBfIXUon7f19WdeFW8Ug7tfv/iZSnHoRRQ
 qzB9vtFUcUFG7cB+TawwWYWl1uTfoG9eJ0qtNWOqfycSFdghByKjD8WNxb9Od+sotdXG
 LLE+2LS7gmlblVylBdPCnIxpe4VYpsdhiAZRwJnIzVdPnpfl/m1YakaNYkH5XVhrVSUi
 JJXNdw/QDglehm4QtliCxc3zEYpiefligJ6SYUETNN1IUIu6EB3MpQEM++ZgkmkXUZVr
 /xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738420213; x=1739025013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZecNtASfh7rrAlvwFbfUE2XXOpRJhV4UbpJBSEoNxZc=;
 b=cwtlyWc/1zfJcEIwmXPpiR5U1j127hYZ8hpcb8jzdlHP7lY/eeLlf0y6mKQTEJfP6d
 Z8pXb/u6cefwd4KnyPid2qvCRcAts/1HKB358jirCv1ZVXRbTcgvg+i5fMen2voCMIE7
 lfE32GhGYoliI8LOJ7ViFSnI4TWqk1JbSLM/NAVhX0OG8ljfiYAHPzUiT2enLkzhff+b
 34WZYndisI0WuHQuDZ2NobpMsJuGbRx6AI1qeKHBKqsDxb9e2Y3exBQZQ+0NubMrg+x2
 IG9Np54GB/yfyaWerrzpD81wmjdrpHL104lkc4prL0BuLaSJfEMsCIrPTONOqwLcZzMG
 GFhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNId/EXko8c1Oy99wG6VgeRcOqeI9OE0+Hga/DWMkkxDajCmo9GeRLm6s159iC8gf2/W1LTpevJQ==@nongnu.org
X-Gm-Message-State: AOJu0YzAQyGRLEDuYYd5QhQF82xsCAm2YIBzMGHpv3LpsuW9N35FPtrW
 9Mi6X9ZOHtFBdJL9Wp0dhXfdXyhIFWF3aeME2KYadU2T5YkbfoFe9DuI1rugFPU=
X-Gm-Gg: ASbGncue2XGJS15qxRLgpxoSH05zdXxMlvp0BjwKVhTTtdfiwM75L9y/idfz1nKdts7
 anMKTNUhspegel21M5lcCiVoar8S08k5ocWOHlsynNwBzvGVLGGtUrG75qwGRMssbg3UHz/V2ZG
 h/lBurl/n0xMwTZivtkXUUsFxSZI9GHyxwVUBdunEVHBFYfHI5JXYGCs1kAChfOu3ZMcy1qZDmV
 +KdvTnenu/7EWFzt4HJSKdadXx0B1yOmWrgAZ3A3kVXbWaUSzO6Nw+izGh0mjYlek7JXox6nwrh
 jKzmE5pcrsUPUz1awtyeqbpSzQEuV8qey3qsj7JgsqcUnp1dM1iekGbH7A==
X-Received: by 2002:a05:6000:dc4:b0:385:f44a:a3b with SMTP id
 ffacd0b85a97d-38c52097596mr10568743f8f.41.1738420212739; 
 Sat, 01 Feb 2025 06:30:12 -0800 (PST)
Received: from [10.85.240.213] (217.170.88.92.rev.sfr.net. [92.88.170.217])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf571sm7291868f8f.82.2025.02.01.06.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Feb 2025 06:30:12 -0800 (PST)
Message-ID: <4f8886c6-32f8-465b-a243-b5fa510a8f9f@linaro.org>
Date: Sat, 1 Feb 2025 15:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] hw/arm/raspi4b: Rename as raspi4b-1g / raspi4b-2g,
 deprecating old name
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org
References: <20250201091528.1177-1-philmd@linaro.org>
 <20250201091528.1177-5-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250201091528.1177-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: qF8I3SKde4ml

On 1/2/25 10:15, Philippe Mathieu-Daudé wrote:
> On 32-bit hosts, rename 'raspi4b' -> 'raspi4b-1g' to clarify the
> machine has 1GB of RAM.
> On 64-bit hosts, rename 'raspi4b' -> 'raspi4b-2g'.
> Keep the 'raspi4b' alias but deprecate it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/about/deprecated.rst | 6 ++++++
>   hw/arm/raspi4b.c          | 6 ++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)

>   static const TypeInfo raspi4_machine_types[] = {
>   #if HOST_LONG_BITS == 32
>       {
> -        .name           = MACHINE_TYPE_NAME("raspi4b"),
> +        .name           = MACHINE_TYPE_NAME("raspi4b-1g"),
>           .parent         = TYPE_RASPI4_MACHINE,
>           .class_init     = raspi4b_1g_machine_class_init,
>       },
>   #else
>       {
> -        .name           = MACHINE_TYPE_NAME("raspi4b"),
> +        .name           = MACHINE_TYPE_NAME("raspi4b-2g"),
>           .parent         = TYPE_RASPI4_MACHINE,
>           .class_init     = raspi4b_2g_machine_class_init,
>       },

Forgot to squash here:

-- >8 --
diff --git a/tests/functional/test_aarch64_raspi4.py 
b/tests/functional/test_aarch64_raspi4.py
index 7a4302b0c5a..891a8135b6b 100755
--- a/tests/functional/test_aarch64_raspi4.py
+++ b/tests/functional/test_aarch64_raspi4.py
@@ -37 +37 @@ def test_arm_raspi4(self):
-        self.set_machine('raspi4b')
+        self.set_machine('raspi4b-1g')
@@ -67 +67 @@ def test_arm_raspi4_initrd(self):
-        self.set_machine('raspi4b')
+        self.set_machine('raspi4b-1g')
---
