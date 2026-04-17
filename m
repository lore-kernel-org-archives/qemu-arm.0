Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686DF8E4A7
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:35:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDcnW-0007Fr-Eq; Fri, 17 Apr 2026 02:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcnU-0007FB-C7
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:35:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcnS-0000B7-Oi
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:35:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso3669295e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407721; x=1777012521; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5NS/1OcJQ2z5TmJfxbTyVH2TsYHDh05FLHASEzsGv1E=;
 b=aJmHN/qM41r28GT7Fml+l67Xff8vLHIjf8t7uNHKPb34KwlU+pFM5yjhXr3pNmp9A8
 GdAjYRhyvDGzsj8EEOufJjcl5yBIP8CAgAK3wc9O7Zucr0FSX2aGG5/8tEsqogtXSDlZ
 27aCoXCzbELeeY117JPVqWEdgmp2Rr31xnKyxdXOi/eIyEJFuaAqJcn8iPMM698QQixG
 LcF1CvZbxU0orF3LSaID9iUcCh4UPqanukUzQalEFs7w7+8ftPMwDdc+8mn8ZNssiqRD
 BGAZxY6cD4DoPpoDfc/xEIG42FCfPn9BCUELMVgOF56c7/8aGIAVZvBS95oqdCisLNMU
 aRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407721; x=1777012521;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5NS/1OcJQ2z5TmJfxbTyVH2TsYHDh05FLHASEzsGv1E=;
 b=CbVBNLqahO0r3wpxngYNn0j9+Dkeu9Xq6QAkXV7hD5PF0et/ofu9arofvBX4Ug3Pz3
 sad0ZUKI6Ior9BszaLUybhZsJvbjqZzH2ZZoXnf+1CcflsXJe27C4rjyC28aL5aW+Y3A
 6cutiWuieBEQrD1jMm8R/ioK9yJ9cWGW5M+MsPktYgCJbBSxb1A0bXs2EbG67aepLWbI
 wKenKOSznmITV3ywhSrn8FE4bPURMd9iaRCawqPiO0T/XEDREKGXbksRdQLDZLWMEPno
 cAWYRkcAf85FWy+6/s4/yjrnS7mVgBqIFMFUEf+dJ8UsCHBUfaEHPP/tw5NV2GT+0dnq
 XDqQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/LJIfNTuNYz7Ryeh94Ge2lHaNIfo6HrKN6IE4JS9mAoF4Be6syENeqY6mf1vB29l+BLcFR53Lzdw==@nongnu.org
X-Gm-Message-State: AOJu0YyEy7/+3P+FP61DAv5FZgQbnQxwGOaIBEAOJR1XrNPMvkKG0oDV
 tNTFJ+nw6pog3ADbsPfBxt/Y/chAgbiSW+NyLcU1TUHF5g+L9L9TH6qhIdIJK854u0k=
X-Gm-Gg: AeBDieuFyjKe5XPRQ8r7lGwQPFscFlrWkOxwasLWfU1HuLozD6f2MwDzt/GPHg48vT7
 rYLmvqUqzD1YlnAqrd4nBc7La4Pr/sLGrL39IVJsktyjTiQ0Aybu4n6O0FMFkMJR7FjBr8rvKMW
 5FOsYqLfsd1ddkc2WwC3QnfTwGPlaW66jrLA/fKAeAOmVzdGwDlZFlTW6MfjclTUWpB2SI1RSHf
 WZr0u09A9f/U6V0FvchdOqin/qYDiaKUxFvPLNCe7Y1OuC/eNyu8zH0WQ+aPik6awuN0NUH/Scn
 CxIgY5NU1TkZV1M0nMUm8f8EGg38mmkf4dWnc9Pf40nefp57WcMXeMXHsWC86PcfKjxeV9/iI30
 Jb6y9qXoIuhn2/76mzbp6kOhUe/sxPb/WvlG35o1IF060wp4iSo5ahpLSEuW7XH0oubXxzcPGci
 NUOhmKLu7A9uU1fby/uDyrk0MRmRAf/AEBHlz9MPxGJFi5VFXbqplVWxfDlF9e1yyYGBFrIqxnv
 vyJ
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id
 5b1f17b1804b1-488fb738412mr17494195e9.2.1776407720962; 
 Thu, 16 Apr 2026 23:35:20 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c773fsm17234155e9.12.2026.04.16.23.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:35:19 -0700 (PDT)
Message-ID: <ba039ab9-e5d3-4363-9159-cc72670756b6@linaro.org>
Date: Fri, 17 Apr 2026 08:35:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/17] hw/usb/ehci: Add 64-bit descriptor addressing
 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Jamin,

On 16/4/26 03:49, Jamin Lin wrote:

> v1
>   1. Fix checkpatch coding style issues
>   2. Implement 64-bit addressing for QH/qTD/iTD/siTD descriptors
>   3. Add descriptor address offset property
>   4. Enable 64-bit EHCI DMA addressing on AST2700
>   5. Configure descriptor address offset for AST2700
> 
> v2
>   1. Remove unused EHCIfstn structure and dead code
>   2. Replace fprintf(stderr, ...) with qemu_log_mask(LOG_GUEST_ERROR)
>   3. Replace DPRINTF debug logs with trace events
>   4. Add functional tests for USB EHCI on AST2600 and AST2700 A1/A2
>   5. Fix review issue
> 
> v3:
>   1. Add Migration version test function
>   2. Add EHCI 64-bit buffer pointer fields description in commit log

I left trivial comments on v3 and expect v4 to be the last one :)

Regards,

Phil.

