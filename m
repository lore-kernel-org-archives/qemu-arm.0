Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5700073ejb;
        Tue, 7 Feb 2023 11:32:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+AnVAmAsdIjuQ50Z0BBNmtkDEI7kW2dL3cgcFqRYYRH7NOk967apNK5byZBY0L8B6w4P5l
X-Received: by 2002:a05:622a:cc:b0:3b8:2c34:b9f2 with SMTP id p12-20020a05622a00cc00b003b82c34b9f2mr7337819qtw.63.1675798352467;
        Tue, 07 Feb 2023 11:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675798352; cv=none;
        d=google.com; s=arc-20160816;
        b=m4WMM0VQwDcVM5EvQHHygFVNs4NVW+1bNGv3eGrG/ol8nRgoipM/BsAWXP8QxlXorM
         eyikJQtI02hArByZIEVL3L/o0kCa7e1xL9u5q7q2zPF+8PVD1oYCDrldO+v59WZlHWFX
         DkSwSZdatlIKo7clhgaz/HczL3TgHrnm40MtrRM4u2dNYUQL4poIv/UdPlztoVUh+pkZ
         8wARsFRdrvOn1RpomDVuKSwc6jb2OZVYv2Bul/T7pfXIVImEPKwr/5TEdOVNt7jABotN
         DV9oS3yYOMHeWHy5ywVBbKHgQwzsCIyz8KCDC17+S6VO4awZOtRQ6MYiKYqp7yslXyXL
         7bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=c8DxGxHyLHz6Ij/kNiJqQ6UwvKTZ9779gTDQJgz/OR0=;
        b=kV142iQ6MZn0AXfzXDe/exWnbsiCq19ub13anrEM0PqZNwYNYVlVcVsBHTb2Qcbtvg
         ufh+j4hS2OaU4Hp07KEJDEAOD+49M6DhyGCavmtcVf3bad1yTcBTqeVSI6UZ0tCAFJ9b
         Hy89Ep7U31gXJTaLKWEfsJZ82XI/X11dJ1whSSMrW0RCcANgiIh0kLvygHMmCydopTSw
         eZp6qMJ2UnzWPXlSwzGXKe30FZWTpYGbz0WhKjS/x+C+lCgouJrNnSzGGrMycvc28XfK
         sYb3fCLIsGVzDiRh04sMDzB/rn6fwa3vKpUJ8sUzQ9Ep4vjFjm7p8xI+T4DrWNcQOKTS
         Tk2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xdu7gS9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a05622a050600b003a824014810si11581346qtx.112.2023.02.07.11.32.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 11:32:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xdu7gS9H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPTgu-0005lb-2l; Tue, 07 Feb 2023 14:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTgr-0005kH-RF
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 14:31:41 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTgq-0000Qh-5j
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 14:31:41 -0500
Received: by mail-pf1-x42e.google.com with SMTP id n2so11533588pfo.3
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c8DxGxHyLHz6Ij/kNiJqQ6UwvKTZ9779gTDQJgz/OR0=;
 b=Xdu7gS9HlHRWsxF7ehiWxKESugg/JDCgY+uktzIN26LZVqc8IvQiT50j3PdIq2+zPz
 T+5gVIbryXwUf+xi4MyoAaTJOgFCfBfEcscs2kk82h99drO5Tnz3q0m+f7X8Z/jGlQO/
 7vCTNCL9m141sP52kMv0UDFNo/yFu0Xwmew0I73T78HZpLgwU1S3BSuZ+Ew4XTRKLvhg
 aso17Yw9VRVZ9IErlFlYJ9cFYu9tqVpHG8f6eLQc+pqfomZRea6S/qirwQOoqotY0OBI
 UB5nlOxxjGwyVzDpNr+bM2si3zPqy1IF4zSqi4DLm2NIevms5lNyFIhGJD5WEdjJhz+Y
 +P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8DxGxHyLHz6Ij/kNiJqQ6UwvKTZ9779gTDQJgz/OR0=;
 b=wNv3mpeiVnW1kTccDZG1Ql+jeWUzDaB0MjBmT1gE6SwLFwV1jKX/8Qka4qJDRjzxJZ
 mlCnTo34ce8dkYL8oFombqo1SdRka4yAiLL4zD5BfkDfXmK345TCd3J2varcrJeYUFc2
 mGqK/80FGWJvx8nzNSDYNVegNAu7XWnjmx2an+XoSxdcl/LBIXFjatUwB0VxGmQvh+6f
 slSf606xQq0GdfpbQc+RnseCRMPejiL7/4f+ufPIOKVa0w3N5YDTa94WR1AejryNSoPv
 cgJltFYMwPhuXFEcbDUIQvf95mnnziJqnw4UUBVOEfmaJUOcPTnkX5xRIuUH7+kddFys
 2w+g==
X-Gm-Message-State: AO0yUKXdCVZfmO6pXjK4LUjvYK0bSlVAaGFcM01h96aMI+oLkCbvWPoI
 +xI1gYWXcen2gZ5/yjvA+K8wYA==
X-Received: by 2002:aa7:9a0d:0:b0:590:7526:713f with SMTP id
 w13-20020aa79a0d000000b005907526713fmr3704733pfj.25.1675798298150; 
 Tue, 07 Feb 2023 11:31:38 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 c18-20020aa78812000000b005818d429d98sm9557801pfo.136.2023.02.07.11.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 11:31:37 -0800 (PST)
Message-ID: <ca9fc552-ea38-8dd2-abc7-a9ade0c2b277@linaro.org>
Date: Tue, 7 Feb 2023 09:31:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/22] target/arm: Rewrite check_s2_mmu_setup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-3-richard.henderson@linaro.org>
 <CAFEAcA9+BLL3m+SO6ht8hZktSHN=AKpmK9vzJwoWoZeGHC=hYQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9+BLL3m+SO6ht8hZktSHN=AKpmK9vzJwoWoZeGHC=hYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: i+dATGThhY+O

On 2/7/23 06:00, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Integrate neighboring code from get_phys_addr_lpae which computed
>> starting level, as it is easier to validate when doing both at the
>> same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
>> especially S2InvalidESL and S2InconsistentSL.
>>
>> This reverts 49ba115bb74, which was incorrect -- there is nothing
>> in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
>> pseudocode is consistent in referencing PAMax.
> 
> I'm having difficulty reviewing this one:
>   * the latest version of the Arm ARM doesn't have the pseudocode
>     functions you refer to, so it's difficult to cross-refer against
>     the spec

DDI 0478 I.a certainly does have them (typo: S2InvalidSL not S2InvalidESL).


r~
