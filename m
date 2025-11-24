Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D94CFD313
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVbv-00045F-H5; Mon, 24 Nov 2025 07:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVbt-0003fC-T1
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:24:01 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVbs-0005Ab-Bt
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:24:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42b32a5494dso2231115f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763987039; x=1764591839; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zinTWrL8ZAAHhEEiZe9LYYVqgEUqufekn1GhfX31NXc=;
 b=hLVRZ4TGs6dTy31IKjbsrWHUvJbalYMJaSd1NL8/SrivN3qt3Pf8jpB6/a/ie6cw2J
 XRQdFjoqrDPSYJI9jj0ifi5gWKSPUrQN5yYm+NTYNsidv7jTciFSUHEkt9R2B2GFFKn+
 7pW9xFxMAEX5li8tLP8IMLWPi32MGMMCvrzLF/Yb4kceMJZ33oOeZ0mo6IM6B0h+Tffw
 XvelTWorOF1L+JJb09RcwNqFKHEUqYpxomyg/ZybSeuIB6la7bHseScSZCl7VUeA2yXy
 ZI+HoyyDw3m+EjC8RX124j6PFCLCULBSnk30Ei5iqdddpz7mHX+0Lw3zStwCcnMWKYz3
 5G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763987039; x=1764591839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zinTWrL8ZAAHhEEiZe9LYYVqgEUqufekn1GhfX31NXc=;
 b=Mf3ej4Tz1y5t+1IbkZRBM7kuzT09S+PdIAGkyCOlj4Q/NotqryDSCcNukxxOLZTvnT
 fZOD1IeKRjMlhwwI1IixtgTlUmjfDdntjDnl1Xcej+UxtK6jotlGmHlnvX5egcPY+SLk
 aG4uT++CtsgDRhAeAu41WRPhcHXmkIg5GBeUOAzbPH1rgcS5DdWj4kkmuHq5+1Co2NlS
 K7ZUVoaoSvG8HcGdphrf78hmUz9eOBHvz8OEeVsZSCn7ujsmHWauEMbSi7bF2BEbVlGY
 2EKtY6B5L+v4jyb6kY7Nyiol6btiaP94WIGPZ429J4z92+P2+W+9AphJS4dpQ7osPNNW
 LmtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxPK7XX9pave2qW69osA1zI41rQYVe168vrbQgfr+6R/paBIMTrJfmHYNG7BsXAcT8CKwzlCvtvQ==@nongnu.org
X-Gm-Message-State: AOJu0YzE0S0yIygUhhnJf4PyUGuVJ0Afyw2M5Io2cHLLY3OM4fjECQGn
 zY2MtLoCUd+ON/Fp0abam5VMxFps0Ii8LKkw8pyKeeIpZTDcjnilufMvjlakmmlllwA=
X-Gm-Gg: ASbGncuaW2zBAdn+LPJ0D34eA6Rnpbvs5pp4guLCclE9og3x13XlqsKBWRDLOXmszwE
 87TxPRP5jtupkPOks6wQtruzqEHS6VW7wO3W2JHcC727NBi0ZxCqUsmYk6pfF1vyRM9gngxY94X
 LZ6SdTFyoD5FSu23OZfi+4C+Gohw24XhdqxGPvYKsxIlH5IMwNKjcrSxSSts3LlsOLNhyPJC3f6
 wu1xcaD+MFvzxTBpxAI5w33rpEIyoTMIU/vrRBY+gidpUl5ZG5BjQw/w2MQODHKcLIuUe/5iC7C
 yT9xvSB6PG9nE/Bzym0Eegal+XSiTz/fQ49w1ntbf+AdH3pMUbyt44OL8b9+EWLGCWXvmrB+tNK
 U0dKzEpZL78wi/Sz0Nodr1A4hFDqGLCMixwr1jVj2UsRD5wILjK2THqaNvMOROivD2IxLGTLdpm
 zQiuu6thkQlRsepi5Z/pVIReQd0nUKpK/0A8lIh00PDqLSuJKH03poug==
X-Google-Smtp-Source: AGHT+IFP1Cj743zqo++MnarxA4ruIY6iw6bO3Ywlhf61Vgnrc0lsvAoxmlvpX4y7bRwndD9+Yydlrg==
X-Received: by 2002:a05:6000:230d:b0:429:c774:dbfc with SMTP id
 ffacd0b85a97d-42cc1cd9b39mr12539466f8f.12.1763987038634; 
 Mon, 24 Nov 2025 04:23:58 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cc231dc6esm19847409f8f.7.2025.11.24.04.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:23:58 -0800 (PST)
Message-ID: <877d3bb4-5f76-4466-a3ac-3fe4c2460d7d@linaro.org>
Date: Mon, 24 Nov 2025 13:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
 LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
Content-Language: en-US
To: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
 <20251011081553.4065883-2-daan.j.demeyer@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251011081553.4065883-2-daan.j.demeyer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 11/10/25 10:15, Daan De Meyer wrote:
> Preparation for adding support for zstd compressed efi zboot kernel
> images.
> 
> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> ---
>   hw/arm/boot.c       | 2 +-
>   hw/core/loader.c    | 8 ++++----
>   hw/nvram/fw_cfg.c   | 2 +-
>   include/hw/loader.h | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


