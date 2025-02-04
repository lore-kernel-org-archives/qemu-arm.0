Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp312084njb;
        Tue, 4 Feb 2025 08:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXM0Mt1r8KV8Gm2IGwYdAqGfhz2un6qEOe8XQSbDsq0GyPwnNHElAXcWOx7+eQy7PiRFcVvlZK+O4eMOg==@linaro.org
X-Google-Smtp-Source: AGHT+IGQLzxyng3/L7JosEcbCiNjX4hCXvJlq6ZLcBjHHJnU/qH6siQfMxGSGYGDFXocSe2czwPE
X-Received: by 2002:a05:620a:1a01:b0:7b1:4a2a:9ae0 with SMTP id af79cd13be357-7c02ec1d013mr732674085a.9.1738685187672;
        Tue, 04 Feb 2025 08:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738685187; cv=none;
        d=google.com; s=arc-20240605;
        b=aw+cvLJX6uPNsTZ+ODOWDIZv4rGk3QrqftFLsPciivFIA7Psp+mYR6WkPZYp03ZfOQ
         GI79g+A1DGQ0O17Ie8Iyg7pbZIJskQjQVoPP7wCpaMA6w4XtIvcIFcSHhZryi3TyGUth
         BDXZHVmwhgYCVFm4Aq787q4bYKhPPy3+J2u7RzSgpsVktZGJKd1gRwIpjJL/krifLEFk
         u07IaKGs17LRMNn8gZTDKrcHYYJADOklnMFeS0HYvbTpKKKbJV6MWrTEQ9V7sr6g/XR2
         CBW5abWawq1grRkY1Q3a2RnFZNVj+L+7HeCsaKvZ5AEGfeltTnnwm5AMBk3Hu8dz+Wdm
         OXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ir9X+vggNb1JDseJdZkjB3pT46YLsD2wliPL5qC5q5g=;
        fh=dlIZONJ8xyG+lZNbeCVTgoHJu+sZNjK57abdAB+CS28=;
        b=WdT/24hp5iVfD/kFiNITBWeThjSmdTdinEkTRJP4h59IRG5AD4z4wGxdcX+UMDbcD6
         vFf6zwyPA9lQtfNO7WrwjHvne485AjLYBN4CQR3M9bFWYNX4vuVpRbjjTI1d55YWJAW8
         x+kccbG9CBrk5vv0pLvlZN/8rbGzw8/a1DK6k/FC0idxYFyV4SiHfaH0VjKN2xihB1VU
         WUFvo+/q2yFcL+T8HLxydNCz1O32BFD03jk5IpgCfKCMTtgZPNX71lXV/Rq84Dgz46TA
         WlvS9nhLzpjNi25Ukd6dsLaUe8iHE2hG0rGYb0zem9IudN07vCmR80HUN5AVYIxUM7tD
         aNEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nL/yW+xL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4de2asi334672385a.69.2025.02.04.08.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nL/yW+xL";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfLR1-0007Z0-GB; Tue, 04 Feb 2025 11:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLQq-0007UA-D6
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 11:05:50 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLQj-0004aD-LB
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 11:05:45 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e5ad75ca787so4367951276.0
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738685140; x=1739289940; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ir9X+vggNb1JDseJdZkjB3pT46YLsD2wliPL5qC5q5g=;
 b=nL/yW+xLDVB/NZfKaafV7ZhUYRp5tBj7z4Sld87D6i7q4PxOHfW+intWj2HdF34VN+
 cevcAKEi4sN9PmGAMrqDwz3/+yoj+IPIOuJvzlVHfkLWMvyB3lUmT9r7h3DibINkYp/G
 ZTB5MYY5sNqlzQdqzPt5H5dNtXiI6e75ozj047A/T6JLPorUCOYRApmdPzWnbTrhnROC
 U0ZyuLuTb0nZe4YX5w6Uhoeh4PwpIMHFpCSiyulKLf1mOp6Nz1qPjRqXgG9ZS2SHW5UZ
 ZbFFz1LcU5AjNBHfF3izE4OXnuMOBZ2L37wx5JqEL+9/YjHcGS8aqvMe/VFlsyFTJ5zg
 zmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685140; x=1739289940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ir9X+vggNb1JDseJdZkjB3pT46YLsD2wliPL5qC5q5g=;
 b=dLMcP3+tc/GZhSgnoAanjTbujzfzBehIuTYmxY1CnqXIYRtfUi0deDaNJWhahvxvdo
 DfrHrMVhgCw9xzgkYNVByAhCQ15gMQFxpMKxAn0M5h9vOwt0mRLCjl070HLBDtxr563Z
 4aqk7HGkNNKH5uatjOpS5CP7Fho3GbK26mK2FhkNbQjRdN6PeMUj38EWcFkgEvK3zIfB
 ngG/8HeMpv09Vk8kAYodFAo/9LxrPOqe2ZkPRq4CtO7qTOcDWZlZWr1dPu+7B14BcHxC
 JTBGM4Bv4HlFpA2e9adk9qGYy6NfT8uqZl+Yyxh1YzL7xC8yt4t2HJnq4vqTNuldQYh4
 clog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe40L8LdpN5NJRzy9dNBNdKC/zQgAQcYjY+BIZA/CAN/wWZUkRR4rTwakJSPRcKu86Q06vYSEky2PZ@nongnu.org
X-Gm-Message-State: AOJu0YxA/como/9H4ZVFviZ4RcHZ/dXVBMRxeIdYcdPk/h3himwNxHdP
 erDE2rFchpRYJF5pXny80Q6V3mHm7OLLPCd5xT67r/3Ox2AiC1Uy/vtB9XvcSBdPYp0WyDcLWYn
 5tCAcRqKhL/oN+O/CaYSb46kztzSJzeBPbx7XzA==
X-Gm-Gg: ASbGncuri6WEn5QWwaA21Rpoi3xAWxmCT/AdPzQg9rxJfgPLv+N3ebkvNMqiWQbNpmc
 waJ3A39QFIa8ux7A5XO1qfN2pgzdEN1EaQi9V0JLt5fQcuhdeKk/EaMQixs/JVuebCH8yn9eMTw
 ==
X-Received: by 2002:a05:6902:1ac6:b0:e57:3dc9:1850 with SMTP id
 3f1490d57ef6-e5b135602dfmr3257421276.9.1738685139710; Tue, 04 Feb 2025
 08:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-15-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-15-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:05:28 +0000
X-Gm-Features: AWEUYZm5YIz9bbIrmnaj6QMQzyHqIGaSdAhrhvKUDIOso6BtJF4vbiONAZzRp7g
Message-ID: <CAFEAcA82x7ju1b-mCXQXP=bMU75AUAA8zySd4mGimFP-dJsGmQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] hw/misc: Support NPCM8XX CLK Module Registers
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: esymXfde+2AD

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX adds a few new registers and have a different set of reset
> values to the CLK modules. This patch supports them.
>
> This patch doesn't support the new clock values generated by these
> registers. Currently no modules use these new clock values so they
> are not necessary at this point.
> Implementation of these clocks might be required when implementing
> these modules.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare<titusr@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
