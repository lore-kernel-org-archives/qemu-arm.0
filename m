Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2770675ejc;
        Tue, 17 Jan 2023 13:42:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjpy063iN86pkNsb15GXb8LqClyecqUtivOrBBen75f177lGgufjT25+gaVqDi1Qrs/NUm
X-Received: by 2002:ac8:1411:0:b0:3b6:3a8f:ecbc with SMTP id k17-20020ac81411000000b003b63a8fecbcmr7190046qtj.66.1673991760643;
        Tue, 17 Jan 2023 13:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673991760; cv=none;
        d=google.com; s=arc-20160816;
        b=aWcEGURotbCHRN/gdKezx12OywkYaXKhru0cNP5NT4BDBpTJc/O+hEomu1rWJccj1r
         WaYwhq5vfLzB53HvbdDdfgUPy+MyS+ujwDvdDJGExx4mNU1fYkn30CA5QZNPxXn3Uo8Z
         3cOub5Da7p7KbJes7J2OdsVgN+S9ll7TNOfi6tdUX/Z8flCwSlWZtbpf02vBUayAzofW
         h/SfM4Gv8zA0bG2Gwlu888zQq11lm89GBSnirJU7zydSGyiyY2skzhNOUvzNy2nnGQz3
         Ues0EtgqMkH9e/gwBVtOQv9LcD2s3mbf1/lUEQYmaudGMa8LRTBfZ3jdbPvXm3aHEyaS
         BYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o5DxAltWo1aKEgrqrZE3ecb33VrHVfohQgjyfzaFsiQ=;
        b=O58GSNwlCiLh3lKWslyRHtkKBvXN3WVGBrrjQZvwvIo7iBL5shchJIRJmaJNH+3vEe
         r1gT3E2yshSBhj5jGtOcutkuDRlk9H9a95BDw5XSiSJdSu1HWlpVk1Rmfh4uzffbHV2K
         8w4EV3F7zJJl0X9iUD/Mi0zCs2pymd5cq8quil/IOA9SfizB0sD61SlSz5rQZJYa86w6
         WTE7fU+nWOLKFbk7FfiBqIHjwsSYro9zCKPF2B4UaG3ptEZ0p94h2OX4B0OZxRsiLrCa
         VvId/op9fp0VWXjQUodd4CNajvLgoWW8OWeNwAPHMC1eABpBJ4+pSZiX53MJl6o16pnh
         xhPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QiDQHx6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg10-20020a05622a580a00b0039cd5cd2cdesi19953989qtb.478.2023.01.17.13.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 13:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QiDQHx6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHtiw-0006Yi-Ix; Tue, 17 Jan 2023 16:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtit-0006YK-7v
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 16:42:29 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtir-0003Y1-G0
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 16:42:26 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r18so23026834pgr.12
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 13:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o5DxAltWo1aKEgrqrZE3ecb33VrHVfohQgjyfzaFsiQ=;
 b=QiDQHx6G+8AcwFu0hBxmy3kljQ4BCbsJnHGKcj0kn0KxktNX1bZLst9pNFBG3ONIzA
 FLnYuqFvz2QqmOlpLyt1f5FDooT933g1Or08udfcye2QsfVmGl1hvJnPKCou4Sc9L5wh
 BRG3wkhAY928VmO04ao4RzzKaDezIayUoQMOuN7TdIoiMLUtqIzrR5Mu7kVruBXbdOsm
 foM3iqGZ+oOw9GlrzgGPlGWFzgcW6TkxT/lPAG9OVK9BaIjQRRiIkVP/R/HzSrHU9huh
 FTkbIYTbVIA9YPj2gHHVvWqVU545FmNfNv3G6wbcmExHrwqYG7nK/S670ABAWSMfTcID
 8wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5DxAltWo1aKEgrqrZE3ecb33VrHVfohQgjyfzaFsiQ=;
 b=v0BzkPc5VTrsF/gk9WVwkgZ80qbaubkLtf8X43xb/vV4URiSwjseAmU9cHFhUyqAsz
 S5v+zv8B1h/5xz/Z1ux79EwmrCfsmYdAElwzf3aFYmyq+YeXssPM37At2XKsAlXVe4iI
 85uNLv+4KRIffRQBilTxONfncwpZHXzJCXZxSLzEp3zCQsbRyHWQpB8x73Go6tt7+Kpb
 TCXEJCY97frl9bETSaERTidBO12MP2ZMiOvE+xhbjyZwDCICqNxuCr/r2mS7bJZFda3H
 78Tofmfct3EIGblFr/DzbMs54HjWpKoWdxtHcTWXjJCuS7a0wrbKJBp4xyHXEcYkGivi
 GLrg==
X-Gm-Message-State: AFqh2kqiGZxAXudLVnfEYkDV5YlTwwguhDjdyD8e0PyPQrr7Eh5IaIu5
 rHZ+F+WrDFu5ExVWivQu2wtZQJh4AkhdiE27
X-Received: by 2002:aa7:85d5:0:b0:582:6732:ee0b with SMTP id
 z21-20020aa785d5000000b005826732ee0bmr26495235pfn.28.1673991744103; 
 Tue, 17 Jan 2023 13:42:24 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y206-20020a6264d7000000b0058659177fb8sm19115756pfb.86.2023.01.17.13.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 13:42:23 -0800 (PST)
Message-ID: <be662a38-c0fd-daf4-88e6-4adcde57fd57@linaro.org>
Date: Tue, 17 Jan 2023 11:42:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu v2 3/3] target/arm/gdbstub: Support reading M
 security extension registers from GDB
Content-Language: en-US
To: ~dreiss-meta <dreiss@meta.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <167398464577.10345.18365355650640365165-3@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167398464577.10345.18365355650640365165-3@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AQPF25UmYtXO

On 1/9/23 13:05, ~dreiss-meta wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Follows a fairly similar pattern to the existing special register debug
> support.  Only reading is implemented, but it should be possible to
> implement writes.
> 
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---
>   target/arm/cpu.h      |  15 +++++-
>   target/arm/gdbstub.c  | 116 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/m_helper.c |  23 ++++-----
>   3 files changed, 139 insertions(+), 15 deletions(-)

Is there a reason why these are separate from m_systemreg?


r~
