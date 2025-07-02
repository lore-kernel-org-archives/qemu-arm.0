Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3840886dye;
        Wed, 2 Jul 2025 07:12:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnM3p3+h8K/r8g0gXnEoqTxBUrA4GtNCRZDZSXdWlp+LPBxaja0O9VUfTvy8zHwNw6qe6mwq0UafjOqA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7NTAkK4f4TzoaFgW4uU7J6DKTmk1/bizUCaw4o6GuaatEvAslmkNqunp4zLD8mhcqTvs8
X-Received: by 2002:a05:6102:3753:b0:4e5:a6ad:8fee with SMTP id ada2fe7eead31-4f1612e9daemr1622931137.19.1751465547519;
        Wed, 02 Jul 2025 07:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751465547; cv=none;
        d=google.com; s=arc-20240605;
        b=i40mfpqybcyi3pmftEZYVVbNKdmhQDOvJwyFJv34Gjw12DSVSQKpKJ+lk2f+3fyWVW
         CEcg9Gc48vVUBP5vOXVxFFRYtKdnflLaFyqciANBxPwn6QkKh5Mv1xNz+ibZ+KKJ1qa9
         bEAqvNoCVWN9hePxvbJMDD05PUikJUNelmwJ9GS96u/Y9ApkyGmHX+IBae23gXOMwHvb
         U3ineomtnoR7AP1uGIQ5W0pgIJznIuKkVclmJSIZVjnDG6ck42ivD0kvxHhhp8vBHF01
         /kXI/ofHCd6AojBFGuB4GMNHvQMd2RXvoV+No/Ehag5FqSpWfeTMW02XIT4Zs+M3NOzT
         0nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ax92OI6M4WzJiJxDk5o5mfpOIrq8GmFb/DsxeWoDlBA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=BzJzWR7oy9hxwYsUMgYN40/niqZ6Jo6tCxlnN/F5rNrGCvxcG1JwkbBHDcws0bWFv+
         72ib2JPOdlLTxcDRZOHV9Bqi6blL+kRM9nPPH/V0xa3HRzSOAGKpU6rX8hEQuqeZMyia
         2vZ0iV9vLYQX/P5ujF7iN0gnCb/9vQYuUXxf1hm9AevrSuRgFnSoRW/imlQIy89GPVQI
         2n/RaARakKVl0SiSrTLydNMdTOmJ2S1ZdEe6QKUEWD/oGns+bIO6xKrfu+lbWZQpnRBr
         vphFnXBjH39rRxUDLXtXzFJr+I7m+O4102IkTLLXio7JbwgmCrO+X2kBdXHQfNECBzyp
         0dMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAVoPos4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-884f7e91f6esi1551010241.62.2025.07.02.07.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:12:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAVoPos4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWyBf-0002Kw-MO; Wed, 02 Jul 2025 10:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyBc-0002Jx-Ua
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:11:45 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWyBV-0001pE-Eo
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:11:44 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-408e0986303so2772165b6e.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751465495; x=1752070295; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ax92OI6M4WzJiJxDk5o5mfpOIrq8GmFb/DsxeWoDlBA=;
 b=NAVoPos4vIkjRmT2t3jZi8U5ZKWTfDnPKcN6bLQdq0yCTTumqnvF1W9Wh/J9Yu7bIc
 AxAsIvDzdTWwZ7sIE/8s1yWkC4qJ8F/M0Ysf1nuLLEkI6dqxh8pV68aTjKFnHZ2lYGKt
 ICiJ+y01tBDxxIX71a2X8PIDsNwyyF27dnUEKjlDz+IxQy9QA1OueupDghKb6d0n/1Ux
 UmSbr7gwG7HyR/4fF+TOk3L1A8G8DbHAUG3jZhb4EgHR6eKxy69pSfezGxj4u+pw1OPB
 1lmBRJae+nWknnOSFe/6X0iL2RkL7KGZ5gumJFy7fyG+wZ5dmpzgz9K3JZXqMxwsKqIi
 EQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751465495; x=1752070295;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ax92OI6M4WzJiJxDk5o5mfpOIrq8GmFb/DsxeWoDlBA=;
 b=vWZelj2Au42yuJUtpWWbE99UE83QQPddEnBwX4ok7I9hdMD2WyZ/6lHp2V0wSkuotw
 nKKjGUq8cSWF5HTJE/7kApdLFu/RxmXH51MMvXQZkX7YQUfgS0/kSnL13Ux/net21eHH
 DqovcK/wf35bM7BomQcDPgLAVqYt61vsgX0G0SHW/xnqmIXIAi+khPxeuZddkE8ehKul
 gko34RhFpIZWmJZEqsn9D6OL0ATgGNSi+wfwwepUEYtV1OtKys5y0IvPxTnvzChJPWpj
 AU/t4XhTaMxlmYgsPcuLXWManmyzVacWQL82jVmosZd/lyJCbNn5wsn9Dzaq/NTV3xjF
 2eaQ==
X-Gm-Message-State: AOJu0YxdmmeKDOFAS7/oUqMj4P4rEuti5Jlr98ILnfUhqw6dq5m0avOD
 YEBnTA+BquK4iZwiGtWNryVj2ZCyQ7lpBd3ShZCM2IqLSL5nfV1LZx3zqOReuUrrfsQ=
X-Gm-Gg: ASbGnctp3ll5M9SBKQRttfoqnHYwcMtCQ/L94D+h+UxZQgTErOz7gTWbOOdvPHjw9NU
 jSlPD8OBQDCVgqtmNFHTZM9kTOzJdN1sLN55DBtmRyNahjYuI5dDOxI87peZxkuQrsDUR+OQJIZ
 jTcmMUWLXTQjOvY0K3SiS9D6+NUqaHVBldftdZ4ivwwazVek71M7UNlb8vOFzFkpltfhUXHt7Nm
 5+SGxjhtFrXhw8trx546exp27OawV7pCcA2MY3wJOg0Z9BTAyEjSI+QkB0q5BaKBROO7t16GXyJ
 1hv/0qeqDSb8gd0MAdCTH9n9XUm2Yw7RXqpP33XzylqOa86Jp5QeB0pTrPm+ulpSdIrlbVjRW/G
 0
X-Received: by 2002:a05:6808:1823:b0:3fa:7909:2716 with SMTP id
 5614622812f47-40b89521769mr2288942b6e.39.1751465494894; 
 Wed, 02 Jul 2025 07:11:34 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b322ae397sm2537119b6e.11.2025.07.02.07.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:11:34 -0700 (PDT)
Message-ID: <c350ae1c-e2ad-41be-8b49-e532adeb964c@linaro.org>
Date: Wed, 2 Jul 2025 08:11:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] target/arm: Replace @rda_rn_rm_e0 in sve.decode
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-5-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250702122213.758588-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
X-TUID: vabLoeRCvvRC

On 7/2/25 06:22, Richard Henderson wrote:
> Replace @rda_rn_rm_e0 with @rda_rn_rm_ex, and require
> users to supply an explicit esz.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/sve.decode | 48 +++++++++++++++++++--------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)

Bah.  Sorting error with too many patches.
This is not a SME1 bug fix, merely a code reorg for SME2.


r~
