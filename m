Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2719684njk;
        Mon, 27 Jan 2025 13:17:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcnCGwW0/JL/zzffMo73au9RNICZZ4lYUZx0KAQJY3184ZDnCj4SNsbHYHfXVURKxu1tkHqQRcvAyzmw==@linaro.org
X-Google-Smtp-Source: AGHT+IE8eBGRoRd0hshfSzQX2593fpV7UHfE4DGnnxQATLQ3XMabs/VKb+MeLDSAMfMASAW0dUC9
X-Received: by 2002:ad4:5ece:0:b0:6dd:84b7:dd86 with SMTP id 6a1803df08f44-6e1b2213ef2mr770375836d6.36.1738012679704;
        Mon, 27 Jan 2025 13:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738012679; cv=none;
        d=google.com; s=arc-20240605;
        b=GzDQ1sS7LFhy/OHX/dMmpIELttXgSsLtjY/ttoA8mImruj/atx3xBsPTMyVk64tqGd
         gyWb01eDlI1n+pU63QjVQGGK39aIntdqnrNWSfUAGHxbacUxqobOQgauYFaWHiD1HUDg
         nXvgUWMXfPhPqthNhAHy5qqxMHQRm8nrbTPdn+x262aA9ZFcOoUpsNO4iDy+952pEP7d
         gvoqjTL6MU+E8knt+ArSJad5t4kuaRlKDaIXbxXlAeUxJPbKFltWzcOQTwcMOD4bVmWb
         z5/YH4wyiXtmPF8c0W2QMbVIdubyIvCPC4dfc/UC/LdpNmxhL/C3dVoem7lFT+ynnW0Q
         TOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BtSUBFOJLSoXX4z7f3NYjxcYRzGB+wfIl27/EGyk+uA=;
        fh=y5KHqXDaInhKqWpWzc2ByNZMUg9XMksoc+fYhOP0R0g=;
        b=Vy8J81uOK4QNH/SD1LlW40aG5nFIBo1eZpN4lArNjdmtWI4W7Nue3JU4+7b8dCujE+
         mpIpZnUxJfSpwWNb3O2vx4110Tv5Y21ENVA6gz6jgFSWooFeZ4Gv3HLGk6JUXytWFUL2
         2D+/AyOQ/QJj7Viv8x5onsP4b5ByFIGYnMeHabo+wL8IajPujH70f4ghEo2PwMRSBsqJ
         c2OtnkVQTi69ntToOAlTB2v/VhwI1o4yJFLi0i97dAhdD6qP3ikCskiliqAz/NGt1cAf
         HaGvZhHaXCNu+oyUlueMntvnrTavkRwBcSmcKGdicp2qbRfcqB2cxeNYFjbQyAT7pnHZ
         Xzqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VkN6zfEf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e206135cfcsi105718986d6.475.2025.01.27.13.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:17:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VkN6zfEf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcWU7-0007JV-RD; Mon, 27 Jan 2025 16:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWTL-0006wp-Vr
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:16:46 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWTI-0001WW-LJ
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 16:16:42 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2165cb60719so87204345ad.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 13:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012599; x=1738617399; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BtSUBFOJLSoXX4z7f3NYjxcYRzGB+wfIl27/EGyk+uA=;
 b=VkN6zfEftz9JdmTfiXY9YroXPOn0VAYttJNaC4sc86uYpMRUPGuTZH4VkCAGTwUzcl
 wUEsYXDEhwFHc+hQDzwjjfrxM4tVItnvzklvJB+yO8OyOX/4CDxohaWOyC/eOaOXjMyc
 S3sx9Y8CrzcZ6o/hDbaNhUIcBybLSjI4K8UUWmB7J/W8SvkygbOA/RDP2E5o5WdqY0Ke
 XHC+3puRhybvLnwKx9jmVI7Xd6PJj1qK9Rvnk0rj4nMK2EazLcvP4JH2YJe10ok4D/OR
 OAdNX4e0P4X0xUELoAlKYcylOlJi4c+3237CB0hy9kNS1qoYrxNsyNtNX3uI01NbL/KR
 bxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012599; x=1738617399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtSUBFOJLSoXX4z7f3NYjxcYRzGB+wfIl27/EGyk+uA=;
 b=R2Z5crnGDkiOtSajt4u/rgWQC/fHW63UJhWX6xu1ps176zfOpVTSNUtm1VZ559aUyk
 BZX/FNBTgjGvz6gBA6Gl50P4VrNtSbOrGEZz+xFrwUQvCSEm3mmwA+eNN9cjgcOxIWUu
 KrOTYS3i+zOlUhKlcn3vPR+3z0Y2aZT+7QG4u6LbkCEK4XB65Coo+0d8sqoJak7o8g2s
 LuOwqGk6ul52O/81kb1oqGXqPkcddRLXqiA/2C+3qddvfcy86YL0s5K3Qj2M98/E6y78
 /MPpw9b9KIJp8O1wH2lxYDjOcNOmw/499BbSXZLWCrLz7lKrymU9wLGJ8xTTvCVXvzt8
 IBSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzj3e4365x3JwBPJO8N70Y1M6ooQBcdksCa7hD6qtE9K0ATpk+f29VWZ1YaqHi5nBMVXZvXWZhBw==@nongnu.org
X-Gm-Message-State: AOJu0Yz3y0mGR8t56mVvGMl8Fo3CH3/StKtFPW7p0/ajYtdRVCqMsGkL
 6MwaTwznZj8TwB+WxJdLQEeeMiZ7tW+oqeN2usAgX5cgZimumrm8VZBraXt3EhP1Efp4kUxmS9K
 g
X-Gm-Gg: ASbGncvRdu0Bk01a/xrhAAA192Mjtuizx9YDEBcN0blk4+zADVOYVgmW9uu/p/Q8iFQ
 JuyPyxYWbFJhgdFqsF0YQB7M/06vEDsSQqMfTMkOdnvQX7yQzAwt4M1gN1E61peK3t6ifLwcP1e
 +2InEqpogKOEDLzeOmvnvzAkxmWN03VEWH85YIhf2NqVpCWqL0LQVInOF5ZeXTH4GsSoa9cpqB5
 wNo0fKO0fHZ/PEOihk7k6mpwRNsysqOjA8helheE1rDNMRtMm74x6Urvwrp/QA98pS9eJ1u7iZC
 0cwreVb0BmK/0LRCP5OPRxkQjnoWY/hlb7OgaBZpckHWwp8=
X-Received: by 2002:a17:902:db07:b0:215:b9a7:5282 with SMTP id
 d9443c01a7336-21c3554b516mr612350665ad.26.1738012597570; 
 Mon, 27 Jan 2025 13:16:37 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141d41sm68618195ad.126.2025.01.27.13.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:16:37 -0800 (PST)
Message-ID: <6ddb695a-44eb-4e9c-aa41-067c79ab87cd@linaro.org>
Date: Mon, 27 Jan 2025 13:16:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] hw/loader: Clarify local variable name in
 load_elf_ram_sym()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: LDHRzM91Bzt8

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
>   #if HOST_BIG_ENDIAN
> -    data_order = ELFDATA2MSB;
> +    host_data_order = ELFDATA2MSB;
>   #else
> -    data_order = ELFDATA2LSB;
> +    host_data_order = ELFDATA2LSB;
>   #endif

Worth squashing

   host_data_order = HOST_BIG_ENDIAN ? ELFDATA2MSB : ELFDATA2LSB;

?


r~
