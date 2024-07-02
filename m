Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2242594njm;
        Tue, 2 Jul 2024 15:49:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxY/niGmEoPKijb7pK0aaYQBQPL3Ag5q5Vb2p9+w7XrPjmxcIHW4/ihg1X/uO5lysh4SkMltaXbJ/6MDxQHRCwyYenta9g
X-Google-Smtp-Source: AGHT+IGPNkoISFsScilUHVrjsGxHF/I3YH8a1TMWbd+ZdyA1RudfHKOn1IyrjDV/9xAnPwxhyZ3l
X-Received: by 2002:a05:6808:14c6:b0:3d6:2cc2:6b33 with SMTP id 5614622812f47-3d6b4de2f12mr13370269b6e.39.1719960542657;
        Tue, 02 Jul 2024 15:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719960542; cv=none;
        d=google.com; s=arc-20160816;
        b=k/yWF2ejxFNWVAIus9sg92MWC2rn24PqtOr16XJIxX4GrzaGNOzoNvYJj9qG8YWQVW
         C0Iwn6PA2UHJllXTiuO9CzVkyJof9O1DhBGbsazcMg+blgnohOHS4MDZYSEnQij1ZAqz
         1Y+U0eXtBx8kTsx+MBg/0J4rLUG6auDLW2VV4tCiadpVRHDCLaeAn0AMsrzcSiwpAzkn
         X7JilDtB770zhL20dZndm32uRkN2+UWNOsji9QSy4mjdxo1HBCP4rYYzLtPkbmfs+JAN
         vcSWjL7cbqjylEfH3jsX5L7nGG2eCsFmNkPOfcRATIKZqLk32oyhyQbsebZZJiAYLKxL
         4pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xzViVz0RgqTMnq6v0aLF/VAMt1kEy90VTp6r2oT6g1I=;
        fh=Smw1hseM8sTeNvlP4HR20dipBt1Up5BMO9wgcEew5TE=;
        b=glmrEiu0T4iaHDJWRDEuvri3GM9z9YbtfwaGbOyuwkDzhLSr7xLlBrXxoZW2KUoNLM
         udmgQjzEwkzhRe4HIM5pEHBC6Ks/lfy19UtZlbxwN7fwqvNa7R8VfL3FlHFEEbfe/1pF
         U5bxKnCddyQo0/xeZ5R1VSLcVMYmb51fTLiYTKjsimAxFuIF4J4VeLwm0THbeKUKSbWS
         G+i0rWA5K/dbj2z8mjN9i/2rlHBkRP22URJ6/PRKDmlHb/j6InoaPRwPpjclpZxuOS/Z
         HVwg4m/lB6aRDrXwX8JkOrkIsRBjG16offVrmcLzZSNW0dabdNCZdrONtN93H+e5Xmfa
         VKAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9oOYOh+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e554b9dsi114708246d6.187.2024.07.02.15.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 15:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9oOYOh+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOmIC-0002m2-Im; Tue, 02 Jul 2024 18:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOmIA-0002l9-8i
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 18:48:06 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOmI8-00028i-KG
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 18:48:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2c86e3fb6e7so3112513a91.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 15:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719960483; x=1720565283; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xzViVz0RgqTMnq6v0aLF/VAMt1kEy90VTp6r2oT6g1I=;
 b=h9oOYOh+CFEA53v4yfv6KVLWyLGrjgnaYyBXIFGTBW8EsXz46TGUN7yBrL1TaRigJO
 2Ndf1jzjwSTSxEXkrNnvHgcRWlrAswBcM8Uhezg38G/yEvoTtMYVdi1PxVB6D+6qkM6F
 XgoAmNbHsOx3QF76WXZI+azi+kouaNQgB9ryjOAzWbFwMW8WlEgRUibO/7DK0aXWtb0f
 HNu3Yd3EozjtjdJVdmbl0CyaBXnrAUDYOBaKJQL4VVFhqeU0jhTKj9tbRxX2k55/I0GW
 YiABGHL9snHudKCTC5x0rCvhCrG1/sWTCvoWnqe0d9dZam2TeDBWNW4WbLkkcvjYKupD
 AEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719960483; x=1720565283;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xzViVz0RgqTMnq6v0aLF/VAMt1kEy90VTp6r2oT6g1I=;
 b=n/JYCsxZOiX8qhuxYn8wouc4ljLud9WlQ3lXoTupfKj7E9suGqiuAjis/97gIwsamB
 R7XusCVeKmLuY6mEotFmbHrP2N1Cn5OVvDDWgJVYxReMH6Yvxwz4h4TGrYwOZNlQOjyP
 6hG2jVwkUVCXJmgP/PkXwNTJXPsvJDHaMu2E8ogdibYP0bVJCGIkb8GdQtls+xjdQoSa
 192GFZLA1l3WZBThCiwK7pnKY0lHybnjc2i/q1JkN1EH1gomykP0GROLzSc8dMQ1x+gN
 vdTM4sRTFQV4usXeOpG80RzEPI3bx0A8/AOVTPfrau2T+x3lNXsYctzgk9/4aAqc5AKf
 +i8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJcvdhPGz60JDD+y4K7r6nK3hfRwIVaDT0++V9wHlIodqLJCSD9VrmulCkt5Gp2WtTy/5LGEDUuM7UY9aMcAg6J2kl
X-Gm-Message-State: AOJu0Yz1qbEda+Q364EwDy40DETXjL2gLxLXp/QcJLT7+wDCA9u6vOLa
 sX4pPVaaKsTO6+ZeAh3RWMKeL4JN/Be21+0BQD42iv68brEXGfiPwBN7996+t9s=
X-Received: by 2002:a17:90a:9ca:b0:2c9:649b:c249 with SMTP id
 98e67ed59e1d1-2c9649bc32dmr1751898a91.27.1719960482571; 
 Tue, 02 Jul 2024 15:48:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c9784b9ed5sm62631a91.33.2024.07.02.15.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 15:48:01 -0700 (PDT)
Message-ID: <5079f504-1b65-4a44-8fd7-bb676b2367b6@linaro.org>
Date: Tue, 2 Jul 2024 15:47:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/6] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240702080042.464220-1-clg@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240702080042.464220-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: wDuAbEj0EuPU

On 7/2/24 01:00, Cédric Le Goater wrote:
> The following changes since commit c80a339587fe4148292c260716482dd2f86d4476:
> 
>    Merge tag 'pull-target-arm-20240701' ofhttps://git.linaro.org/people/pmaydell/qemu-arm  into staging (2024-07-01 10:41:45 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/  tags/pull-aspeed-20240702
> 
> for you to fetch changes up to 5b0961f7ad6790f473623703834351b6e43fbaa6:
> 
>    hw/net:ftgmac100: fix coding style (2024-07-02 07:53:53 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Coverity fixes
> * Deprecation of tacoma-bmc machine
> * Buffer overflow fix in GPIO model
> * Minor cleanup

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.


r~

