Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp416342ejy;
        Thu, 29 Jun 2023 09:02:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DEVJXshCmOOLowIkjAuocP4QIDX/gBCIJNvshFjvc+TRIe3p0G3ZoLgRlZ2se1E1BZQWj
X-Received: by 2002:a05:620a:3902:b0:765:70cf:d7aa with SMTP id qr2-20020a05620a390200b0076570cfd7aamr15556407qkn.70.1688054553389;
        Thu, 29 Jun 2023 09:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688054553; cv=none;
        d=google.com; s=arc-20160816;
        b=TQQ4yB5dBUFdYfO8BDNrXa8n9ocuwbqt8pYkY1CmP+yz/azcUF6Xz7E0NRjKXH6LNa
         wN3iIpYm8RvuSNlbVUVhiJ6u0ulU9A2YlevEJMylerXImb25ugnozcP45KfePrXTMifi
         r5A16Pk2438cHrFyqCDn5Fs+kboEm6EMjPlmIYdYPbhKh3D+eAHwAGjGFUMz+iH4yY4c
         Bg3VD2YxjfCT5Sy8Mq5I77VLY5aawiAJyozCY+vOSHAFttjwn508c22+imYdQ0oE/av+
         ShntWXSgFg4hwlqivQeDhvsJzwh6y8Gc3P3a45TYOdHfmRXbO7SOnJQbbA3OhUTAtlbQ
         tOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9YAU/rvGGYg7OeBZOQ9232GFeKjs7qr+fwrW3NFCu68=;
        fh=C4jrgEFNDgVJiCfSukY1sak5R6OufbUgpVC4kSD2/9Y=;
        b=CCbOoz4aBRAH+U5ToRMQd1UoOu6A1LORGsq4Y6c5oegEtvEveNC0SDAl7qyYNuHqWU
         yISpQyqudkRaPl0h+kLPa8ISGhGFiIm5IsABkv0DUSFJ90XvGkV2MvL6Yb35QFbP8fo9
         Vh8RVxjNh4/4aHC36BV3mXXmWsoLIbD8tbPcyfnVeQwuqnkUZTwHMlMyfHr1oBm1QRZd
         EDEURXCe19JW1m0ozjbp4JDpZ+YYPE59KNUsQaHL1ap5jxiCIaKiDZ4DOyqoTglxqecc
         Kazhp2FhFIYe8g0EkKSMrNsAoVnAJox+dFB9CniNtm9ZgVlMlzhR5ZxJqEp49TXzsb1D
         XYiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HcxkB5ZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020ac85b0e000000b003ff405e90cesi247306qtw.756.2023.06.29.09.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 09:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HcxkB5ZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEu6C-0001IB-Ry; Thu, 29 Jun 2023 12:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qEu69-0001D4-S7
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 12:02:22 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qEu66-0001iR-3E
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 12:02:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso884479f8f.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jun 2023 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688054534; x=1690646534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YAU/rvGGYg7OeBZOQ9232GFeKjs7qr+fwrW3NFCu68=;
 b=HcxkB5ZFVK3baNvYbxmEy2J2yiHX7teLZhIPzVn5EE8sUR1lwPUtXPuUK28RTLSYTs
 g6yw5iyfUXMgFNs1+NENK4CAhKjHMnczVqhYpT+mM95RAcqrrOmrJXAj3Pe2fLu3XdN+
 o1rkQZpKBYhcYZ7k5KF5TpjtE0IBGYBvZC3/2cES65qgBbhOk/LjrTH/nPLI/9R8O1nU
 xTVoBzeMc3Rsb37Xv6SqH1Z3hZkhiHaYyV1rbNc0OwTFS9FrFoSKoiJGpW7Zelc3tBsR
 XfA5Q199aeClGNax7WYil+F8BlYLhKn9oe2Aaf+tQzpmn/UIMAXH+C1LXTarB7MJSQ/D
 Gbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688054534; x=1690646534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YAU/rvGGYg7OeBZOQ9232GFeKjs7qr+fwrW3NFCu68=;
 b=BG+urjK3KZl9SdkTBAIs0RMlo/Gw8QLTNBkk+0slgwgaoIMMG5dGmUVC+fDQiVJHxo
 mfxABGzY5/oSEfkccmCY2Oz5+kFUEo722Uh3aPPW8pB/KmmF3bdb6MOG4uY9Z3irJZFZ
 7AmFHT1LZHKwwkNXka83cIiSIvElgrnnpnOBw6ZmWHV+dm3q5ncAmjhapECJkirR7RR0
 jh8mz0dZenOCyu6WcCS1mnHu6LR/deIeIL/pwMdetTaMa60wa9e6u+OkSmlz/9rw9xbw
 VupuxGRfwKPA5ReD94XEzWa2szSv9jEjTYBoWHSf5kCNhjxFcFU20IUtag6rKC/AtTx1
 m3bA==
X-Gm-Message-State: ABy/qLajPRR/ds5SP0I8V0MWFmvNamMg1f88i1UoE1EL1vO2uKergmJo
 loJsQT9V/jJK4MnxoOxTj5zJgg==
X-Received: by 2002:a5d:554a:0:b0:314:1f1e:3a85 with SMTP id
 g10-20020a5d554a000000b003141f1e3a85mr84793wrw.61.1688054533662; 
 Thu, 29 Jun 2023 09:02:13 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a05600c365300b003fa8dbb7b5dsm13081658wmq.25.2023.06.29.09.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 09:02:13 -0700 (PDT)
Message-ID: <5787edb5-35e4-2fd9-c4c6-1cc09ca5bc2b@linaro.org>
Date: Thu, 29 Jun 2023 18:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 05/37] crypto: Add aesenc_SB_SR_AK
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230620110758.787479-1-richard.henderson@linaro.org>
 <20230620110758.787479-6-richard.henderson@linaro.org>
 <a2173165-9bd9-fd1e-a778-07bdf6379659@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a2173165-9bd9-fd1e-a778-07bdf6379659@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ESJuUEVkSSNS

On 6/29/23 17:45, Max Chou wrote:
> On 2023/6/20 7:07 PM, Richard Henderson wrote:
> 
>> diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
>> new file mode 100644
>> index 0000000000..d675d2468f
>> --- /dev/null
>> +++ b/include/crypto/aes-round.h
>> @@ -0,0 +1,44 @@
>> +/*
>> + * AES round fragments, generic version
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + *
>> + * Copyright (C) 2023 Linaro, Ltd.
>> + */
>> +
>> +#ifndef CRYPTO_AES_ROUND_H
>> +#define CRYPTO_AES_ROUND_H
>> +
>> +/* Hosts with acceleration will usually need a 16-byte vector type. */
>> +typedef uint8_t AESStateVec __attribute__((vector_size(16)));
>> +
>> +typedef union {
>> +    uint8_t b[16];
>> +    uint32_t w[4];
>> +    uint64_t d[4];
>> +    AESStateVec v;
>> +} AESState;
> Should we change the length of d from 4 to 2 ?

Yes, definitely a typo.

r~

