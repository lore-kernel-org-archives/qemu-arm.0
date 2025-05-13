Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688521njb;
        Tue, 13 May 2025 10:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKPyAfhNQbAW+r2P6/8rH0Sa2oYEnppzLtZTm8LxEbEz9wEikbMP1Uewv00Ym4SNgLxKEys+Mu80IBfA==@linaro.org
X-Google-Smtp-Source: AGHT+IGemH5+3SzsS+wVWQlGmx+4scmAQmY+sRKYeUKh6Y3TSxfWeS/r64yXPjnYZ58QIwIjdBZT
X-Received: by 2002:a05:620a:1918:b0:7ca:ca21:23b8 with SMTP id af79cd13be357-7cd287fa807mr81113085a.7.1747158516675;
        Tue, 13 May 2025 10:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158516; cv=none;
        d=google.com; s=arc-20240605;
        b=YR7EZn6ESGaoHu1y7YYsx/F+M4Cj7fVQOXnVmBjnjj2JDxOWnxq5hggo4ewPNZj9pm
         3+nz+WH2/gyQlZa0CTNhSX15nqD9EGprao0Q0UrIEs+Ux86zTZn3S59yciD7s8Udg43p
         uZjKYGAW14CooBHKp8nT9/osRsUBWDj/fS3EwRUvKUx2bOMD2sIrsZfpO4QUo1QnNYGe
         ncqzWrjlipTK1kpiVIMRxaC4NLT/BRWdEO+YSCBdoTs8l/dYcxLQnZt4fo9xdaCzGthM
         Zqa+tT6wJ683grXHznTQl8P1+ppOulxp5rPiMGFeo9nZQu7fbJPvMXPoL2poQRDKi+IJ
         eQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rQ3g7cfW3jvPyWxEbqJvfCwLD4zthzCwcF0/oFX4jZo=;
        fh=uEEYT8SByNxL5aihDjEsY031PAE6o7iuAF8ukLE+U9I=;
        b=aeACFPGeEPemAbtf1AuQRSzTYt3tPPs3q5bLadThnK7exPS1az+7VaqLJ5aEoF8GNS
         an6mRz7nsBeKGwUKEu3Txm7FM3tZEWdoKaMeIskvdSgdUar+sXsP/x9z6eYIsSYFiriG
         ZcPKy36vakt1YnNszeNcQ4zE+gXxMxUU2Vg/Drhc+eWPdNSKQoKRwUiKLwDcwdiKUMLa
         RM4qVjO2UNR70+ljjf6qoziH6OH+RnQzSfrkZWnMxK6n8bVbC38mwSI8GZPyrEnvB1Kp
         K8+KfRnTZ9PPb2aa5Wfcdzi20KyCpMaObtb5BeKCnfcF+wmq2u5/sNL7ay/qbjUWvj3H
         VZ5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rR3gTLV3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe1754si1205981985a.351.2025.05.13.10.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rR3gTLV3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtg8-0003fT-HT; Tue, 13 May 2025 13:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtdn-0001fr-Sa
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:42:08 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtdm-0003ZT-53
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:42:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-442ec3ce724so7405355e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158124; x=1747762924; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQ3g7cfW3jvPyWxEbqJvfCwLD4zthzCwcF0/oFX4jZo=;
 b=rR3gTLV37rriQJQ2fWNYsmFBN+G3whtDWtkwH2sC/NmEnsY7gBsGSuzCSMAtw0wZkM
 cwhQ+DWKnFwbs3AM98cG10QpDo6t0L7O+8hrq+VStT27rtUCWDGaarRqTTeACU55fvnr
 6K7Lp/wXCZNvCZ8WVCpQsN8fGDTdM6O7S4QRV38UjUmkuXAedYTzkwfyfj3Uzsqv6sDq
 tC4pd1LXBgcZF6DTT5E8/yV2v9ofKqxSdkon4Gtl/iHi/HaRJGUU1jXrbuw5PZD52g2w
 x/x1IfZjDlQRMTsBuoq071Z3AZTbrspZz/HCdc3dyJDwz7a22VlqnLb+mBckK3A21QZR
 d9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158124; x=1747762924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQ3g7cfW3jvPyWxEbqJvfCwLD4zthzCwcF0/oFX4jZo=;
 b=W1yy09zZIi/h+IUX/MaQB76fYpHV1+uoIHYi5ssRZPpFt/gnp5KeyFSo5XH9Xx6Bei
 uaesz5UYfcoQWkF0EXoqP8hissUBET8lalKqwEleunOxJ39le53hw1ja3jpXEz7P7TvJ
 LZ9DZY723ABspKCFQg8LMXImfrntpn7qN2Oe/khsSPZGB9F+9ANWZDB64iCw3XHZ1G3a
 rRlJ6IFJQZWySkTh8UT2RsjMA9f5f4rPZKIScFGqC/0+e1Y7cq6g1XPR6nTn86ZE4wwq
 6YPCifXWp+QDlJRXUGKzE6DvrAsUsftMGbb4ThetYUymC5/IXgeN0zKX9SiMZSCEM4Hz
 giIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU/A7Ka5/pGhKxLsse0+5I0dzaC4mQkVDVCE3+OWJlZJ2VdIrjD1/tFa0as7+ineR/LFgp8vPBVg==@nongnu.org
X-Gm-Message-State: AOJu0YyUL9iKiXWoesMJGFStE1JDErb7NCBwyxmbw7YC+r7vBWKMn82b
 sKtdWLWoboLxO4u9xBGzVxNcM6tTqZ83EYVIhYf78sdJty0l72JXNo1hjcWqr9s=
X-Gm-Gg: ASbGncuTGfLDhFJGrjs4yt+cxwJap291GYAGGIfX/UJp3ydyMQ3RE1mrfg3KCNOR3IR
 AlFQ9HGWL0/tVLfU3cBJRXfaWnxGyApCoPsqlnKBT3u2EHT3RIOQ8z44dBvHAFvjydQbodgtjLT
 ccSyGg00Qw6BTfFeN2O64fxoHukrKZ2UCVjScW8z4ZNA/HQojZad7gEhAAaOBDCsFAyeodaDyX3
 2p5GcB2EKNF4oyJtrEmnzJuWgUnjf3ZHcYU9p3mrhoOG305NY7qJGTspKvEikIXzgbgw6sG0VfI
 cP5vuepPOwWMX5AGlKxeG3+SHMWm0y4MPCVkYc9Eqvs48uJf5mSAK3lY8h2zDv9NBpujhhiudYW
 GiirFOtVnzCqUSCp6ursJae0GE9M/
X-Received: by 2002:a05:600c:1553:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-442f20e8186mr2075995e9.13.1747158124605; 
 Tue, 13 May 2025 10:42:04 -0700 (PDT)
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d685869csm181759085e9.26.2025.05.13.10.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 10:42:04 -0700 (PDT)
Message-ID: <d05792d0-3164-4504-91b9-1570d668653d@linaro.org>
Date: Tue, 13 May 2025 18:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] target/arm: More header rework around arm_feature()
 & multiprocessing.h
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
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
X-TUID: 2Phi85P4UKNK

On 13/5/25 19:39, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (19):
>    target/arm/tcg-stubs: compile file once (system)
>    target/arm/hvf_arm: Avoid using poisoned CONFIG_HVF definition
>    target/arm: Only link with zlib when TCG is enabled

>    target/arm: Always include full path to 'cpu.h'

Missing review: 1-3 & 19
