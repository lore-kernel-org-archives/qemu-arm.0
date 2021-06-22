Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3297019lfg;
        Tue, 22 Jun 2021 10:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnKSdVToxiGqkB/JF3dOi5SX4KO+gBiLDnoaYIHN5+VIS8QyWlRPkO29zSKTKW1pVTC42N
X-Received: by 2002:a17:907:a8f:: with SMTP id by15mr5262984ejc.91.1624384259100;
        Tue, 22 Jun 2021 10:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624384259; cv=none;
        d=google.com; s=arc-20160816;
        b=LZTIZ3qNNZwAEGDWsi0hj+3AkKVmUUuA2G7Xd2MbGacS4riZdlP6JLWnwhJHKdmKog
         1GDoNvbKLsaQfTstK2OcJH5rSUKoqHP8wU0Toac7m5EHxaeXvoJMU9fycGm/sKW0Kp44
         k+WgeVVZnlT3tXVYoqUOMsdy3ZskUutPCOxMGpBpTRfzzlF2aNA+R39ISx9HpCUF+dOr
         4k4894wXTIJSlfcRDpA1v2PfYmFYIWl7zGtiAXEgcsRQ2sYP1i3p5oF5LqhbEfRdr16O
         uJq0LEdTct4hfxuwObB/ihBzE2PPotxxJKofN8tmhkxrVfIBuBDRpbAllw0/MRY4JFwm
         bd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Qu3YRmsXDsVT1SMpbAgAzZuETiefGJlTpu4KqA5lQBo=;
        b=RfsIxJqhAumO52fopwn3aHi+j34j0RDqUvO/IP8MWqIMyQzVxJKDiIofP20kGHyzRM
         +JcfjgV/ihV4cA79+OBsUzvUCoWdePkO49hIYoFL2R4X62/8vN/nXVLHhiO1teZmxJSl
         Gz2EqMRnOUofp6S4Mo9HMg7z3YBlp+PnP3trJuHpgt3XetQkneLBUpJGFtW4/lmGH8Bq
         pqhxl4awgDbiIkDc74rMY22Kp4/w1CvSi+zuT0K+xuI5iOzVQR2f/E0C3Snhrpq/JpPq
         aC0+hTwpzkph3eE173NdnX9wuh1CU+8XvTUhMVNew3ckVS4AIeAf2dC2YG6cgztAg/zV
         OyOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MxUvnGS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si10591605ejl.117.2021.06.22.10.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 10:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MxUvnGS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvkY5-0003Xk-GR
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 13:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvkXl-0003Op-Nx
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 13:50:37 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvkXi-0000NJ-VR
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 13:50:37 -0400
Received: by mail-pj1-x1032.google.com with SMTP id h23so652475pjv.2
 for <qemu-arm@nongnu.org>; Tue, 22 Jun 2021 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qu3YRmsXDsVT1SMpbAgAzZuETiefGJlTpu4KqA5lQBo=;
 b=MxUvnGS+7n+0LaDead+NX+GmseO0wPM8UpyY/vkdcIIXOzrYpYO9/obbx8EkbfgZfQ
 UAmYOmE6YPLJnJVfqxiylMbADyIdkDZ50jzIOYBOKMzfYhFV7lPCJWina/cSrH9VWtP5
 TmEnOEidIM8Ci2p5CgK3CJ0Wc22ArMLT/yI2RRKgmgBjWBWm9ZkDYxbWMgmHb4BhFKAA
 s9dlbR4lGIjT5Yq3zYE2y3YDjGf2Amkc+vrxunKao02o6buLAnXID1j8OdWgBLdLFqYS
 GW2qkHfoWmMVQ3qB4TT9ZJhlZ5Nrlwh7J8sASgruaizohM7xWyjzvrHkw1YObzY3jHqg
 Ew0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qu3YRmsXDsVT1SMpbAgAzZuETiefGJlTpu4KqA5lQBo=;
 b=Jj+LqnDwLDj/5NoSgeBNw/BqfU7qViFDx3M5hmm4qsKScAX+MxkI0RYVo1/NB+FBrH
 IFSsgVT5EyMgDmzd9VdGtrhiNQg+0dWmxQ9qvb++RQRKmQXPkkIdLF0vco8KVSKIfNUh
 L8/kf5j3JV3vS/Lo56apTWJUTlRVjeuvZ2j5aJgJrELIcb3tA/PE5CbJ9LzXJsGf2OdD
 b16Xj95Kv/yCC3bi0rAqEIzY07YtaToStzN0dEIxuaSa1GyyoOEuWhT2ZhJKU6WAGW1F
 Y85BwnAHfOmLMrIRyahmzdi219Mni3TzUYMf+STpvcvAiOZsIh8MKwPUCVtbp3U5UPPe
 wBKQ==
X-Gm-Message-State: AOAM532c2nNWQRk7nxB5wuBdGViMsBI+w3xhS1xCainssgHMENKBWX0m
 fDcXh3FJ/zCTDdAAX9lCetlvMA==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr5030199pjn.200.1624384233182; 
 Tue, 22 Jun 2021 10:50:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 205sm11119pfy.40.2021.06.22.10.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 10:50:32 -0700 (PDT)
Subject: Re: [PATCH] tcg: Avoid including 'trace-tcg.h' in target translate.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210622161534.602428-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e6ff32b-a8fb-014d-3cdf-068c38949a82@linaro.org>
Date: Tue, 22 Jun 2021 10:50:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622161534.602428-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Greg Kurz <groug@kaod.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sd2GopxYnewA

On 6/22/21 9:15 AM, Philippe Mathieu-Daudé wrote:
> The root trace-events only declares a single TCG event:
> 
>    $ git grep -w tcg trace-events
>    trace-events:115:# tcg/tcg-op.c
>    trace-events:137:vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
> 
> and only a tcg/tcg-op.c uses it:
> 
>    $ git grep -l trace_guest_mem_before_tcg
>    tcg/tcg-op.c
> 
> therefore it is pointless to include "trace-tcg.h" in each target
> (because it is not used). Remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Thanks, queued.


r~
