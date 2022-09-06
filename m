Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2792388ejh;
        Tue, 6 Sep 2022 00:53:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5RbPs4XvP+1b/PMmCYvZ+Cdreh+4VtWDdsUCdJLxsQzwmROJUyM8QGYMx2ACw4SfdE8y7Y
X-Received: by 2002:ad4:5bc7:0:b0:48b:e9ed:47a8 with SMTP id t7-20020ad45bc7000000b0048be9ed47a8mr43093715qvt.108.1662450785713;
        Tue, 06 Sep 2022 00:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662450785; cv=none;
        d=google.com; s=arc-20160816;
        b=nwzHsfPSMo57zQokEG2kjfxB2W6vbci9tH0pVUkj37Qe31HnNYou5TAHExYvFYBjal
         Jeb+q9fjEStR0Gxa7Mhy9fUoyDjYLV59rvUnUKaAVkb/QyJd8L5bNRkax2StPEQ/TYHn
         j1Ti8JiqPP7LECaPaIYPMHDtf/j+SufM2FQcqViYurG25+dEaMrKtgs6cAtHfgB7T0yG
         pEKMOityHFNynly7mEfEm7MUDudvhFCmAJMSbtscMZ/q8REt+u+9weZpqQEUgAJPKmb5
         iz97OJEaTJ+c5drpG/ZakATCeYunYE5aBGRkq3hOO0CLfU5vLJ78z6OlVynCrUKRYUNX
         5BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fSAUsbwR0zWqO5Zur6O66fsTnV7KIsoWA8rlL7kmI1Q=;
        b=wxWwroyFq2QW1aU1iPy2MvE085vGSNjJddsV2l/1ZRA5BOomlDyycsCIm0205bm+NQ
         9PkuMoPdsci6HyweQxZnkNv3gwH8O3J6IKg4gCMtC1BO9rKWFlgJ3XT3aRCA12O7R5Vn
         i5nFoIilSuOtKkpaquHz+1PTk5Byp6rpcKWE9nLcJkbgtasapK4sQ4kJp4GJdV9PcYf6
         G/1b8jbKjWIM+AIliS38KO8XrtdgEQhAd7N+YU+sFH11d4CR5WLiYwrtjOFbVPLC9Mwg
         okAuNe1XZe4gu9DR4/v/KPCKcBlO1/OP+VExjLRuYYumLKj2jDX4QrjU2Z5o9iDTxuBf
         oFwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5ti53Zz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl9-20020a05620a1a8900b006b94cdbee52si7344630qkb.36.2022.09.06.00.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 00:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5ti53Zz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVTOL-0004kF-70
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 03:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVTEN-00065t-9T
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:42:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVTEH-0004fO-Ko
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:42:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id h1so6387085wmd.3
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fSAUsbwR0zWqO5Zur6O66fsTnV7KIsoWA8rlL7kmI1Q=;
 b=y5ti53Zz9EYYrVhHgG/eH2OaBswAhyvEkQRXSTXH7Dn5AC2gLSqpive4wk13kxJYgd
 jRvwDiIi0ztLuZxqwcpHVGedULKFu6gRtVyTixeUG+bev7m2nO7X7lUeAKyOhl2S/uDO
 QKdD7gQ1YXTpb6sQka9fTzQ5GpClg9IZI2ITp8eWPqsUiSIV1DI1akiHekvMF5LNxdTM
 b28uYaTRh2nRHXaG67TBXLuneVb8iD1P3ouUSFWbI6XzvaJZHK07bwOh3IPasg0aib1Z
 AOkzfBT7r4ndvC/fRP7UIMiDnjYy6ZQWm9ZP/0+k5vWscf5xpFRGk/vmMf7hMi7opd3/
 d7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fSAUsbwR0zWqO5Zur6O66fsTnV7KIsoWA8rlL7kmI1Q=;
 b=dmcmHvo5kIpLUsVMvfKEBKuDZWngs2b6HNzV8XTJFDEfjtMwg4daTjVzPwXiOPmv8L
 N8UCwdE9XMiA3YsvEKucDKQ1lsksEFKGFNk04FI/ClTmn6+T8lTBC/6F0SHN2V3z0NZn
 xINOq+W8tTjILLlODFkiee5uUKiLenoLmoaPOjw1fNKD0M/7U/+3MNrP/tnImVDEaHlF
 jvq+LrgigmtcXJ/bvZH+310JsFFQaL9OeAS0PqlqRziW2FWZye6239qUtdTAHSG4eBKX
 WZoKqilolt7D4J8l+ifBfrKUbyvwJPDFe5Mhi/yeeae0K1nSqzH2U2O7+k2oY7B90DXE
 ilHA==
X-Gm-Message-State: ACgBeo3Acfc0513SQiNgcDp2bdQtRZYi6yhE7BJESusL2bmQeYYtr/nR
 6Z3TuhRIaUW3YEmzWHzyoQPh0w==
X-Received: by 2002:a05:600c:34c5:b0:3a5:fd9d:7b2b with SMTP id
 d5-20020a05600c34c500b003a5fd9d7b2bmr12868617wmq.1.1662450159151; 
 Tue, 06 Sep 2022 00:42:39 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003adf0ae0048sm10115426wmq.45.2022.09.06.00.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 00:42:38 -0700 (PDT)
Message-ID: <ca6afa63-4ba5-ae4a-2af8-d7c1df9fcc1d@linaro.org>
Date: Tue, 6 Sep 2022 08:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 6/6] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-7-richard.henderson@linaro.org>
 <80ce327e-4381-743d-fd63-3b04006e4228@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <80ce327e-4381-743d-fd63-3b04006e4228@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HExvEBq6mjbB

On 9/5/22 22:28, Philippe Mathieu-Daudé wrote:
>> +    /*
>> +     * Allow target-specific additions to this structure.
>> +     * This may be used to cache items from the guest cpu
>> +     * page tables for later use by the implementation.
>> +     */
>> +#ifdef TARGET_PAGE_ENTRY_EXTRA
>> +    TARGET_PAGE_ENTRY_EXTRA
>> +#endif
>>   } CPUTLBEntryFull;
> 
> Alternatively declare a per-target structure in cpu-param.h
> and here:
> 
> typedef struct CPUTLBEntryTarget CPUTLBEntryTarget;
> 
> #ifndef TARGET_HAS_PAGE_ENTRY_EXTRA_STRUCT
> struct CPUTLBEntryTarget { }
> #endif

This was v1, more or less,
https://lore.kernel.org/qemu-devel/20220703082419.770989-2-richard.henderson@linaro.org/

In the end I thought the "extra" part confusing.
I was also concerned that I might be introducing
extra structure padding unnecessarily.


r~
