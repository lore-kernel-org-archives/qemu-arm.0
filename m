Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF26FCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:06:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usO5P-000477-5S; Sat, 30 Aug 2025 12:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1urkiZ-0005Ow-Q4
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 18:03:39 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1urkiX-0002t8-HS
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 18:03:39 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-246aef91e57so19963695ad.1
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756418615; x=1757023415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4M9cm8Aazb+KJpA5IGIdk2z8pOTonrvhPx7widSniyM=;
 b=UgMpIIAh8fsA126b2mU0h9YjiYxPaKTwvHDJi5o4/lI8UifirYIViLb4/vvJrSMo7i
 MHr/BjU06GLIQQ/SVbgXBNWwFQymOfq20o/Q7TVFsuWtFOxHmkWBqGU38gGvEf+mKKtS
 2ADxBv16lXYFf+CPjlZUV8FEUTEOKZFzL9fImBrg+JiwToGRJPFvEWvOZGCpKAyOg6ZA
 M86jLGMqoYMHlG6rahaPzzH9GaSdu+v+Ruw057HpLB+4Zj6rL31thmm1pazryELLfNrM
 OCx2VJsjEyW3ZpMJrdkOzoWq1bSfmaPRpx6roHq8Me8634Rg0IU2qDXH/UzZjWNxBSkb
 sDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756418615; x=1757023415;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4M9cm8Aazb+KJpA5IGIdk2z8pOTonrvhPx7widSniyM=;
 b=khSvuGgIFltFkEfPLftVFsvr5/GX5B1sBWzZ2krvs/fEeGCLtPf8dfpPZansYcT4Io
 9h5oItkNQTADKevfmv+Y78gOxTxmops5+xqdo1qajJZmbuWIR/AMhg+0GU6wH3hplVC7
 08Umy8HGaagGpnaV9SOj7zEDFsZna2AHKV8iQ+wYKf9Erp33Oy7cxauH2R/ZV2UR7SGT
 /B+tqfDgEttBE5pf1au2BsHLx9sHapZ+YN+/zAtydlVhWF17DmCdvuR7Yz9a4yO0kYD0
 KfZbzmUfLd4OXniWYW1w6D6aUXxDeCknjiTYC7F6qSiggpdLugoW8jjCMb1kGslIImPu
 pvFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuZ6wuJB7yzN5Grh7Rdz71RsArRIF6fiVn5Wde5Sez7mqtjS/zEkKRTM+Lm8lx143cWWRY8I+IXQ==@nongnu.org
X-Gm-Message-State: AOJu0YzuReKiDSM5FUNF5dKEy2eyAmnArMnFZmpy35/1KUlEcNrNfVS7
 voZh+klvTONUyTe6I3Kivqb+8k2wnhx1CRkuRovxLdiI/ya8N20qVrAQDFkimTvme00=
X-Gm-Gg: ASbGncuRp4vN3Vw4gEPjB95smEsD/+fVfDl1emyKvTE8f37lxvDmLWMD847fuh20sG9
 N79GqyZhewhzQ9E7QqtVgvllynaXulKOcQqdYeKY8a7K1IQreUcunK46LZMXIEOXVj8pLQfLe9h
 vHVovk0nuLM1IOjxv1TTeQxAqLigcUDOdkZ7MtjDPFgCrmiGmsitC1siJMoo9kN6zYgOo3pIswK
 TQ05yKDPaDdlvV2s5pvcmtYMmM1yzHfx/T/2Sy/z4ws09OJuenSlAI8bmGo6I/jFMLvwAY+Vr7R
 3unbivMHAacxIdHc3/B9qz3BGNMUO8lcvRQ7kVg0X4mP9Phg8kPAjHx3pz6ziokm8nvZVLcvz+j
 ct+AsGyvQgIrX8uoPgydPPdpZDkjwJNf3G9/x
X-Google-Smtp-Source: AGHT+IH77HgtphMfUjDHKo0mPZwZLG1fwVuEfdqHuo1XrojWzDdV3y1JPJ/b6Odi6n+kC0DrGfpXwQ==
X-Received: by 2002:a17:902:f543:b0:246:7a11:3775 with SMTP id
 d9443c01a7336-2467a113b1amr258167335ad.48.1756418614818; 
 Thu, 28 Aug 2025 15:03:34 -0700 (PDT)
Received: from [192.168.0.195] ([144.6.121.55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249065d1ef4sm5032555ad.134.2025.08.28.15.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 15:03:34 -0700 (PDT)
Message-ID: <fec1ee2a-f141-4c5f-b7a8-debe404b9d47@linaro.org>
Date: Fri, 29 Aug 2025 08:03:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] target/arm: Remove deprecated pxa CPUs and
 xscale/iwmmxt code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828140422.3271703-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250828140422.3271703-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/29/25 00:04, Peter Maydell wrote:
> Peter Maydell (5):
>    target/arm: Remove deprecated pxa CPU family
>    target/arm: Remove XScale and iWMMXt translate.c code
>    target/arm: Remove iwmmxt helper functions
>    target/arm: Drop ARM_FEATURE_XSCALE handling
>    target/arm: Drop ARM_FEATURE_IWMMXT handling

Woohoo!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

