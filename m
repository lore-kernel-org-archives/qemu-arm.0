Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2309044njc;
        Mon, 22 Jul 2024 22:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIOO1xal+9cG55fZns3QmZz/uOG+BvyQzffLM9kB4ToKPfhCjPYGqFBNSb3ejn/OPwwYLAxkkNvVFVvW3CFY3vbUALgezc
X-Google-Smtp-Source: AGHT+IFTiRR6pLBgzPWAgTvrLCgHBRmhSY7Z7dZpRSm2ztHZdyhu1178KgxkJ1VwpVrSE+nBCblu
X-Received: by 2002:a05:622a:1107:b0:447:f285:926c with SMTP id d75a77b69052e-44fc55311a0mr20298211cf.31.1721713127302;
        Mon, 22 Jul 2024 22:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721713127; cv=none;
        d=google.com; s=arc-20160816;
        b=oFVhQ486W5lbdL/8EA1MsEI89C12/T8rfMoBdRWGcknKSRFbvUilwU3PtUgDF2YILg
         RmHVnQftJ0Spr1TtHH6WmIHCLthi9M8inKCRUkYK5oaLrvVL+PfKhc9ecze7LLGu1r89
         /w5M6kSQWK9HQUe6cWIsslQM0fCHejgZZpegEByfMk7WSvEH+A4IL2jxdjfrgAE8RM9K
         k9N04hcX4b+pCS2UKRjG3dhsfwGFY2tP59Q8eLAPhCJRFl+dzhOl7/aBtH0E4y1iNmRZ
         YxvpGagqha1v4nuUhor+0u1DY3PuvWAdOqqkE9b1fcScU43WyxbA0C+YZnvHSTi/BQZE
         x4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FiLsnPWWpzec/ur3Q1Kj10EZhORKW6kD1cRUGTLEA/s=;
        fh=xLRIiKn1KsfY4HHOjGI/Cud1yBwB01lbHrtUko2/yfQ=;
        b=sNlnMEIX33GdS+5FajjcN+ZXhJoO6G/P3NRJm9YQeW5K9ZDl4VT8A4KBFe9CdpkyIs
         xHTevMI8Y8nsWmM4N0DzrrBZQtLrZNs/7c1PUbac+epjrbohqNyPjQ9sOyw2+kWyPhJq
         XRkAtFwj56vCvb2Fs/N4anZTm424o7+UjfDMfCLaXw22EoWNsgg62JV1m0a8fP+ore9h
         Q9cfnF2BKxJwy6rsfERHVyF4cOpT21rQ6g6HzFx8jMv29SQ/EyYXB8zAqDYOxzPFEjtF
         /fue0ml09Fz2wa2w17ORQMbQdszgOex5WsdIivSqx6jHfViQKfz/efv408RENbN0/mqA
         yDvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BN/lxTUC";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdd4ad6si96132811cf.484.2024.07.22.22.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 22:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BN/lxTUC";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sW8EF-0007si-89; Tue, 23 Jul 2024 01:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW8ED-0007q7-5J
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 01:38:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW8E9-0004FI-Rh
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 01:38:23 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70aec66c936so2847382b3a.0
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 22:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721713099; x=1722317899; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiLsnPWWpzec/ur3Q1Kj10EZhORKW6kD1cRUGTLEA/s=;
 b=BN/lxTUCvHk4ywM+Nwz3/FIdZ+zD0nQFzbgoagyIEpJ3BDDF727WzjVPDCkgffr4eZ
 nmtvwEhg9satg48sml6RQHe4K1L1pJWzj/Fkn5Xwm0EnboucCAAKyP9FI51wUwPAQ7vW
 20HYC4hBOKcoop+ocA0Qs54y6WLUEPyG6ZM4l+f9OgcHU0hnK6HO4eKfyIZgmGhh0Iyk
 ZUF/bDf+0Kl3aJO2pzATM3wBA8uG9nhSCkrj3vpJVlknOreJN8v4plmVpjiZTgwFKiKm
 IfemGuI6orFR6Q3Np9OrP9VE9BIUmasRGe/FUO778uINnuOGL4o8yVTN9eun2NtlSHKS
 TGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721713099; x=1722317899;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiLsnPWWpzec/ur3Q1Kj10EZhORKW6kD1cRUGTLEA/s=;
 b=LClSisuXKK+Zlu93MxjK6JLilDSAKn7PmwctSFctdwDJAWHuyMUY5MBzOURZM9UNQS
 e/vqdaL5s9IE0i5WYfujWrkQ85GUjkMQJbhyrTKjof4PfCeEvoshXMdi0O66r+30uKqb
 /o5Cw90wuBfpmYrMSfU9eLhMqcvRxa5iAzN2mKvAfTh3Sk1k4NCvEiI2Hsg7ThxpKv2f
 YIe/E9SzhNarstx3cSAq+mIpfCs0s0IYmbPkS1Y44MKKd9xL+E4ZxPyofcvR7gWRvCrX
 5wa+YQTKT3c/TTDIS9x4ozB0cJsSO3Z7SK8HrVZcX29ENpJYvii1g2/IUf2G+GlxvwO4
 7tJQ==
X-Gm-Message-State: AOJu0Yyl0xL8JuDn3eNr/ObHxiCfycKhGqLKS6SbPTzMoSsqdoNfh5ON
 60utxEZsf2EhVpTcYxksa3ZR/HHmF83oUW207IhjQQF4X/IfgEQO+bFL9TwcP7U=
X-Received: by 2002:a05:6a20:7345:b0:1c3:b1f9:44e1 with SMTP id
 adf61e73a8af0-1c44f968a43mr2251090637.46.1721713099386; 
 Mon, 22 Jul 2024 22:38:19 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf808f036sm8095386a91.43.2024.07.22.22.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 22:38:19 -0700 (PDT)
Message-ID: <bc477114-b6c4-4830-9e21-ccb8b806cb6c@linaro.org>
Date: Tue, 23 Jul 2024 15:38:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] bsd-user: Hard wire aarch64 to be 4k pages only
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-11-imp@bsdimp.com>
 <11297acc-de3d-4e74-9e1c-5f08ed219269@linaro.org>
 <CANCZdfptOuaNavrM-rYgqOhgwATeY7vaNUrAMCEgm9ySFQP3wA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfptOuaNavrM-rYgqOhgwATeY7vaNUrAMCEgm9ySFQP3wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O3VvRIZqSguE

On 7/23/24 15:01, Warner Losh wrote:
> It's a compile issue that this won't solve:
...
> It's fixable, but 
> will take a fair amount more time that I have before the deadline...

Ok, fair.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
