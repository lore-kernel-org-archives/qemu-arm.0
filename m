Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2283753njm;
        Fri, 7 Mar 2025 08:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuojFFAVhwgMBzFAniRzJBxPdb+HMtt9No/KRi8x0YVvr7p6oY1NV1V8ITjgYZEoz2FdfI6KjZo1e1mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEJBf1sasQxZYNteTtNsG29vxvgpN8djC3b5FmxLOKI3NMicP+gYp1LGenytTxse+xgFLuq
X-Received: by 2002:ac8:5f0c:0:b0:471:d976:567b with SMTP id d75a77b69052e-4761097644fmr43144571cf.10.1741363407784;
        Fri, 07 Mar 2025 08:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741363407; cv=none;
        d=google.com; s=arc-20240605;
        b=KiyMZiSvV9NNp/IOkCjgiushlB8/B2RxfD5eSfhW76siAD+nQQaBq12pPhhJ1fIwv5
         +f21qHBpJMZnD2W8wmr7e76U4cNNq/c9yy3HtpJk3PElvyZMl58SmDC75F7x7KUAY4Nw
         Sa95r3LohR2u3FfYruujU31thamaynzVk6p9dALnG2IsevLFKWCF+tOE6Oo3h3ryETuq
         sv8C3o0f0yf0h99SrquSHESEvksaKiLldE6HzCSTDNB3oX2fFquRYK97ZhvVYtY2qc2i
         ssDva7kxICAYsXx5xaKth8ru0bvc4Tx3M9tg8jXofPmSG91lllMlzbYMqmOX5wm9yisE
         /JiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ME81v5aH/TuF2khOtehqCQQR3r3r08weUaCHg73I6Ik=;
        fh=SsFM1OuPluqhlVCHX9E2IAg066UGUf+lW1BnjjyHs6A=;
        b=Q9A3/ifRwqJHomjTMXzmmHpAaBGwRm0+NIegifmIq6CraX+vcgK43Orq9QclWwZZ34
         4/6VMyNr2XbgV3mW2HY5Zz4b8KwJYtrgX/PTBGCz2ppzShmVBn12OSQAehwmmz+RvGuv
         r96GwJp5CKYwiifYiyGbQObjtYNXA3NlQpLnz4klcJo9CIBYFK1xlxAw5xUcFNePIG/0
         uJpTPKujFry4EM7fQN4l5IHXfjIoY0de+3UOALcCWH1FXAU0M/A1RZpsDbLySBia2Ak4
         z1StKF53PjHhrxfeW0J5YDR4++ebmm/5tIG9oJkSlVmMsA1UcyG5OANoDowuL5r0835o
         2dSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PNFBLALD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf927esi37090171cf.222.2025.03.07.08.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 08:03:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PNFBLALD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqaAE-0004yd-9N; Fri, 07 Mar 2025 11:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqa9d-0004mu-24
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 11:02:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqa9a-0002XP-Fs
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 11:02:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bc30adad5so12802235e9.1
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741363344; x=1741968144; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ME81v5aH/TuF2khOtehqCQQR3r3r08weUaCHg73I6Ik=;
 b=PNFBLALD7uIdmuES3ZypUX8O3/8DakhNjpg0Atlk+y8IuNsxycyiQ7wujRl7QSHK8G
 ACiudxzi+xOOj5htvlE2YVdNhmKHE2iamBmMaA2S6SURnINfUvhWpGZLMPSktE3DEnLa
 rzPSp2TKp0PbvlEQLdpCsyp9kTpP4/Zp26xJcJj7H4lzQVEQ8z5S61hn48PVyxmleLf/
 AHaKHihLyWl0YK5ULeKCEiVhy03vSnlXyIuT5nV87Gqw8DmAZlDNhm83jH6qftxzwD4v
 nICUO4+avc0QAnYx4EKyPe7wy4jKGEWe+RfYwfzZENChEooWm3CCOy6o+sBkSC1fcWp0
 7pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741363344; x=1741968144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ME81v5aH/TuF2khOtehqCQQR3r3r08weUaCHg73I6Ik=;
 b=ogTYwu8radwjyf2Spuz/RpGCn1e5H72NWtbtBFaEo/i6ePf/ZTwGmOdKcSbuqLttiO
 rHru2rzE4jeV2FteHt62C27woI21vIOw8w2YDfNVqAQ1jMRvefPd1hBPVI3TwWYXvIaO
 Rrxon+CtA8juGzCP5N01kVcf/Kule93GNIxcOWeGVN2N1YEf+BNn/pUf4gL6pEMJpY2O
 iOLRKr/51hB+jWcDcLLZnAiM2lCaeXSgji7sDDX8IM3+/EdG4rlLainVfDTb9+bmEBsh
 DLBI+CZpcnN7MAg9RNqomOjnwNCyR/mMxmkfhk12vaFD1XxvCb3rEzbQ6J0RZGCC2z9L
 84Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG4oBXvDwInvVYn8Ez8vvJBkUQRENFmApRXBxxreACposj9uQ0PIeh1woGOvd/PtA4kxOyxPaqNg==@nongnu.org
X-Gm-Message-State: AOJu0Yxl2B5qOS7tOhrwmQ41Ify0EljQRDyCR60Zs4lYamubZrM6vv5l
 SchAlTzPsBaegaZCqS72ifoq/0AIrpzJ1L6byvWe5dH+cv3soe1o35WtahIhEp0LcclHpP8MCn0
 5tbE=
X-Gm-Gg: ASbGncte1ROHV9NQASTCnj9CHtpsjfuwU9o12yBsfGdLts5ZWg3MPJMnhMlnq7Be1hT
 glwce4GGvYHCFnFRZEfkHY7ASA4APWRF42112mFhkWlCR1531yxkmdBLM49gnvfCCki00rrIFBK
 cSQ6fK39NKuW+Btdma0m/uZm9Yq3rofmH50taLMidVeEXTd4lY6jtCOycPhH5j9GfXQRf8iuaU7
 cWmdiYWaWItAVfFElVvbEAEnoGA/s9CU+ATia2q0iubxg6/Q8tjexafcEPM1kM0V8hnR8S+5VF3
 v7udrBtZl45XCunE6VyKZUlqYDP0ePVCw+AVBSj0909C6YIfPR1ZOMOzXsNtEBIu1sjOLORGAnA
 WMh2JN6YONWW3
X-Received: by 2002:a05:600c:198f:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-43c5a6009a6mr25610865e9.9.1741363344242; 
 Fri, 07 Mar 2025 08:02:24 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4293250sm84318815e9.16.2025.03.07.08.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 08:02:23 -0800 (PST)
Message-ID: <500e69a8-2889-459a-8172-a57b342ae0c1@linaro.org>
Date: Fri, 7 Mar 2025 17:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Fix status for Arm boards I "maintain"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250307152838.3226398-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250307152838.3226398-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: z9eO8+iF587I

On 7/3/25 16:28, Peter Maydell wrote:
> I'm down as the only listed maintainer for quite a lot of Arm SoC and
> board types.  In some cases this is only as the "maintainer of last
> resort" and I'm not in practice doing anything beyond patch review
> and the odd bit of tidyup.
> 
> Move these entries in MAINTAINERS from "Maintained" to "Odd Fixes",
> to better represent reality.  Entries for other boards and SoCs where
> I do more actively care (or where there is a listed co-maintainer)
> remain as they are.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Somebody was talking about OMAP on IRC and I was shocked
> to see that we claimed it to be in "Maintained" state :-)
> ---
>   MAINTAINERS | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

