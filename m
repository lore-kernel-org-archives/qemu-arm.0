Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4822637lfa;
        Tue, 8 Jun 2021 14:43:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcG1BOn+xfg4YS/t4+5xGI3w+zEMHZ3Vfs44XJZGDhkcIVVTcO4iLEu8p0jz7b9CLuOyZ4
X-Received: by 2002:a92:a053:: with SMTP id b19mr20458468ilm.284.1623188617402;
        Tue, 08 Jun 2021 14:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623188617; cv=none;
        d=google.com; s=arc-20160816;
        b=HI/o+iJnTUHjvmPhkkODRcq5EsyFHsJujeSLxLnfZseOfGPUK+LCWghgkWSHVrnEM6
         x6HPYLdqR/ig3KBhdOIBDPPtd1JPZKmjzeRZX5qw2ih7NiTWqHZsqRa6cL8PfZeL9U3k
         S6AxlUgt5rUj9FR+4/Dcjx/Z0gRHMxSteQN5dujiwu65jFS1Do4TY6NEIwOWFkoN53ua
         0NfHhJiL/9dy2d44QURn4xPRrVHGqkylwqQQYvNG/ekoedwmDihMuHzIMQFVX34q7uzI
         RcIsZqYUtcxUbnJEFviy/iLD2bxyjfnGXVRv4vZfeT/fmsultP0CKDvIenkXWGfrJXQ2
         /yVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=mKdpvDDDh7/f/2lUu+Ih0bHWPmxVoxiRmcXaKviEDVQ=;
        b=TzA6cOKhuhndGzC/TSMR4Jpv5Gg5Uy5BiIH4BOFOqyoJCzdo80Ffaf3eHfh1pitIxx
         M9IlcSjMpOTL1H/3dMbJFXh/7no9MZZ83SuNY9ptVXi58zjs/tNFgpEMLPwI01Jw/4hE
         8lOIzDKiyqzuHq/ExZX01rDowtQ8t0gPr1BquDHkfqfQhbU8xsjd5SGk2MwKQ+mBJNLk
         SudvuYTc4/oTclXjGCtAnvYbESOLp8buDeq6eUaAVikzXFcBSkKezT4TNGHYFGn7ZDRK
         esPy2qPokLX3z3/f1ianHZCW5FPsnMYUTzCyLTfiuOOIY+EECYfHdl2NoJ1kjcmPehDG
         68tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqLReeTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si1098037ils.14.2021.06.08.14.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 14:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqLReeTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqjVY-00005N-L3
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 17:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjVQ-0008SK-Ay
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 17:43:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjVO-0005OR-NK
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 17:43:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id l184so2111760pgd.8
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mKdpvDDDh7/f/2lUu+Ih0bHWPmxVoxiRmcXaKviEDVQ=;
 b=dqLReeTikT4MqdPzXxuFLWNcdsyae0uHfrxCVLmoPUD66R6d+nzlOchoThBR77QGt3
 gcOXgXqdRbc8Q9VQnOEctq7tSpLNBIKIofnHZGYhO/3WrMl9FPjsljU/W0yhjvlu0Csx
 sFQiEYLxOPqO0au21dGJb179vWORlm6rxqD8hkI5QhUhH78nMsD/Idv4YtujbjrlhMpj
 P9O0a7m3wl/crSolMZMamZ5aMlYsfha3R6cTYAuwPUjhqtxQRMe8qCiEJQe/KHUDS3+k
 xqK+t79luZtYeMkVXeaDniUh2PtVF8ehXoXWXA2zXc2svlyqzadq+WoX8sqybGM98EBa
 /DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mKdpvDDDh7/f/2lUu+Ih0bHWPmxVoxiRmcXaKviEDVQ=;
 b=irHjKAUWPVkzxBh6PplmMTD3w8/P2TpnuqNtIqBifpGz0urRxsGoti5vL/F6GcS4O1
 Cuyl3m2ESGPCt69sISNTpUak0TIpKnQj6OcCK/uaRPqFOxWVX5paL6zQc+JGD4JR/5QB
 hPRGVAwsrTaXrb/z73dm7jb5KHiWseqeeZmklkUFxM7HMUgTrOZYRSZHhBntr/uysRF/
 Fia3s4TNvPsbr5DgJHDZiBLM9zEPvizbQ4HSs+n5dKr5EZ4qbVnMhd3GOS88z4ip9bf5
 o//mCPTGnwgnjNP//PzwGCJU2eIYadCjt6QjkjzM3hz2dGDBLb9XRmSBf84lcxr91aTC
 nfHQ==
X-Gm-Message-State: AOAM530cUUIkHjGrjc2NMKGcEzqhCvQysdG52oERiMPkqp5a6iAQmFL4
 i56jQ2KKbwdZzOjMNNyLon/vLA==
X-Received: by 2002:aa7:9a97:0:b029:2e9:e1fb:2f0d with SMTP id
 w23-20020aa79a970000b02902e9e1fb2f0dmr1945979pfi.45.1623188604883; 
 Tue, 08 Jun 2021 14:43:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ei23sm3219385pjb.57.2021.06.08.14.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:43:24 -0700 (PDT)
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
Message-ID: <d0b29c94-f143-ca81-82a7-ccbfc2c37281@linaro.org>
Date: Tue, 8 Jun 2021 14:43:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rCAhVYT/+wlv

On 6/8/21 2:33 PM, Richard Henderson wrote:
> 
>> +static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
>> +{
>> +    MVEGenLdStFn *ldfns[] = {
> 
> static MVEGenLdStFn * const ldfns
> 
>> +    MVEGenLdStFn *stfns[] = {
> 
> Likewise, though...
> 
>> +    return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);
> 
> ... just put em together into a two-dimensional array, with a->l as the second 
> index?

... or separate VLDR from VSTR.

r~
