Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D43CD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 17:06:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZAkk-0005DW-Ng; Mon, 15 Jun 2026 13:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZAkj-0005CT-4Q
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 13:05:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZAkb-0002gY-TW
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 13:05:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c8585ecdd71so1091546a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781543127; x=1782147927; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ec7c+jc3MfD/Km/2O2G99w3HfWZMeN8zn4kcEi+CSYo=;
 b=ZiOH9kCY6eVgF7jFSn3Y5Qc4ckyApPFjJc9hKlOZ9jjGMQbZRH3J/lTTYhtr59+Rrs
 CCJnTBTKkQ3EX120bSmdcgQuCJwMa1eARDItdfU58IuLIqmvcSC9mi4OA5eepdYqkDb7
 YUjBz/fp/cU8RyHYeAviAcsFjQDZIp8ep7Cd/bYLlwA+vXBux0TrfVCGCLSoUsUZdKTF
 ssimqtrsXitvggPUsbaUtqPzqcS7FtuoEyMl4gjPBOpimrLq6pGdoNJpvFD42tZiDjBh
 5Tep2WurMsa1VMGCO5ii/pDdEKT2c8850Z6HLyIaxKsMMpXrqmFWy8Km2vaGIzU3PX1j
 NeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781543127; x=1782147927;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ec7c+jc3MfD/Km/2O2G99w3HfWZMeN8zn4kcEi+CSYo=;
 b=l3Oum1ypciZ1VfiprndQkxZKOha1WWdE1gcTSngKhHePY+aAKiLPti8fNXrCNNuQeM
 wnTMahaJlQN/WTWDRBTHQZL/Hdrda6g2IGoOiW4IJg9iJjY55TleHoWTF9kGJcG0mKlW
 NwWyj1spRB2x61RGYYJ0ej2yoZzMrxFDAubAC99BGQd0k/mRY3t1l/QDefTlCO/XVr8o
 5CfMrvjxOzj5FGaCQKb2bL7XgLW79tYlLM57pGqDOrH241Qy4VKF7S6VxyZQCssww+SX
 d/Npdik5Awp70ULjMjbz0mhmlXKjwjkX6Ys+1qzFmMUjE62x6dtOebST2XD9Bmu5S/40
 mE1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ952c/D9FnYpbPMI0v7OZRvF2r8uMY+6Av24BvZ/2np+OIJG3eWHtWoUhNXVHdNHY/8UqksY77I6Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz4Jmzg6uvVN239OYlDTKp2YiIOde2o4zoFJwgbO0lbK84xuaji
 kUPt34T72hHdK9alOgops+ocgGbpXkvM7OVMnVm9+zY2H8Py+PSgRfhgSVysVcxs1KI=
X-Gm-Gg: Acq92OFLAJP+KDwNJnGqNpjtoii2N5/Y0zUlcJ2aN7NI8QxhTCLFXQiliEI7mWRW2N4
 uu1qLGCUCNPzUBCUv6h1o0SFeP2Fx0E5DqdXAiKLymGdXRJYz6sftpX0MgawhCTl9mpek571G+J
 UZwEBJB1Rg6AlCq0FNY6ZWw/hf+qrcXUQM2VWgUlKbeOX+/Jrxu9Gz2mXrC8heTRhk96gTJQsRx
 EwrZIUmlMyJm5P3UUruFnGr2Wt2VyFnorifz35CBc2eB3zQ5padug6a63nL2CWZKag6ZrDxptAw
 YTg52Bna1Jl4Ut/Yv8bS9/aEzDCex9XA3Vx7Ar2Vc0LFb9Ob6MKysrS8u0O6Hl6m40oITs6pnbS
 S7Us7leEa6ynv3zATnIy277A5z0bJNk4SQ0RlPofj4FmS/smgvnZ2o/4SdYTrxMLr6di2GaBkxM
 jO2rMVKI7Z/v5hkNzy+muQjl8OLPpfbTR4OtdE
X-Received: by 2002:a05:6a21:6da4:b0:3b1:80c7:5f8c with SMTP id
 adf61e73a8af0-3b783f3c781mr18345133637.28.1781543127056; 
 Mon, 15 Jun 2026 10:05:27 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8661a67603sm9689586a12.0.2026.06.15.10.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 10:05:26 -0700 (PDT)
Message-ID: <70f427b1-a536-4ec9-abb1-a13f05eff097@linaro.org>
Date: Mon, 15 Jun 2026 10:05:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 peter.maydell@linaro.org, berrange@redhat.com, philmd@oss.qualcomm.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <93fb3b41-1543-4e3b-922b-043b774f57bf@linaro.org>
 <20260615123354-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260615123354-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 6/15/26 09:35, Michael S. Tsirkin wrote:
>>> +void qemu_ram_move(void *dest, const void *src, size_t n)
>>> +{
>>> +    if (HOST_UNALIGNED_MMIO_OK) {
>>> +        switch (n) {
>>> +        case 1:
>>> +            __builtin_memmove(dest, src, 1);
>>> +            break;
>>> +        case 2:
>>> +            __builtin_memmove(dest, src, 2);
>>> +            break;
>>> +        case 4:
>>> +            __builtin_memmove(dest, src, 4);
>>> +            break;
>>> +        case 8:
>>> +            __builtin_memmove(dest, src, 8);
>>> +            break;
>>> +        default:
>>> +            memmove(dest, src, n);
>>> +        }
>>> +    } else {
>>> +        qemu_ram_copy(dest, src, n);
>>> +    }
>>> +}
>>
>> The qemu_ram_copy implementation above does not work with overlapping blocks.
> 
> IIUC copy is not supposed to. this is what move is for.

My point exactly.  You therefore can't use copy to implement move.


r~

