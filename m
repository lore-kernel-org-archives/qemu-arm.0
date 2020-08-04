Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp651455lfy;
        Tue, 4 Aug 2020 08:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnkmTQr+A4Ypd9V4xpBD1LDantuO3l5r89JWf8vjpjJ0qpK/i7ruaChmnLRbAiWRWKEbon
X-Received: by 2002:a25:5056:: with SMTP id e83mr35308367ybb.507.1596555688524;
        Tue, 04 Aug 2020 08:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596555688; cv=none;
        d=google.com; s=arc-20160816;
        b=tB5apfWwGi5xjTPmrf1UpNYhGt6VBJhHBP1bBVssVGasfPgoZavlpFtg0tUvvD+8rK
         TBlDEnBlcRjf0Pu3KU7bp4+1DZJ9c58Q55OJSKCSTLGndZMnH5sOBTNdjqgk2n6DqyKq
         LR0m50haq0NlEuG47yhqcWOMMSu2uXxwLZoc6yz0p6diuxb6wiVd2LXPL3KIBleE1om1
         iZ8SuCuRRgTSkbN6N8DrdbYGl2BWneO4JzahHaTrn5G9XSJGvyFnSp4nvkjW+okVlYgZ
         UJH3XZzxL7/H8NOpli7YgsybznCIMJdq0EvCOUKFfNLAwCfKJgAxGUyWF/EHCPSnXLPA
         v1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=icwaD3ONbbys87ArRJGLhZ1dgH00TxYUTCKLqJ8UDdM=;
        b=g+klYiYqbi6efQzku9Vxjmu4cv2Aw2FhLx+4heDPMe+9FFHhocMw2z7hz8ElHSzcq4
         fp/U/Fxe6sGn2bm6TkhAx1ByNiUm9LLFWNxPjiafJPN+0pM9mMn2+dKX+MPbAt0ZFCKZ
         s4lt2/+lC18wTCsHfC5PtU5/8GGxHsG41UoLIIGaMaFkYLLQDFdNQ468aqe7HrBG5KjT
         Bag7Vj75EhGm/QsYbHRUfgII1JhlMhJkpe1YxsRQ3vjb2NDQEHaFv6HotG5BwI+3WCOu
         Pn3C3wCMlqXny1nGP7WLp0T8OPiMgU7lG1MSdPP6xL3WdbijLYHn3CtNl9nwHVsuqV6W
         zaCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oV0m3Gns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si8671653ybo.134.2020.08.04.08.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 08:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oV0m3Gns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2z4B-0003Ng-Rt
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 11:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2z46-0003N8-1S
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 11:41:22 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2z44-0000jv-JM
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 11:41:21 -0400
Received: by mail-pl1-x643.google.com with SMTP id w17so23138302ply.11
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=icwaD3ONbbys87ArRJGLhZ1dgH00TxYUTCKLqJ8UDdM=;
 b=oV0m3Gns00Sfsrcjpznbw2BdOte2gLe75Vasr7IkAZyafqzJFxE9oicvnZ6c4+92J1
 AVxj3lKRXxix+82Gldjgxvsd4u1tfGZ0SYg1lZAWF9KWWYKWDectjmvDHh8Ext6UWOYf
 RsPPoTEvrM3Px0HXY4/UCmLGZtrQw80pp/KVGLz7c7kD5y15LE2A3LKg6TLonq5bfvwh
 W1hjqzSpaI7I5Vh/gYhHYOuX2N28uEIeBfaqXPob7dZnnsOYh9MirUV4sLo5MlZNKIN6
 sybdDI7ka2NqcOG1cqEB5o/FBXNcfUI/SndCaXRkU46Fl8q7TPLKmCH0KE4kgR06Qa3u
 a4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icwaD3ONbbys87ArRJGLhZ1dgH00TxYUTCKLqJ8UDdM=;
 b=uO1LQMMJSTYdIR1Ihx+M23ku3c5WSMo60AtlpM37SlDta+mY5iQpid28pF0PLLx80o
 it+azh+mthc3MXDLLYEsPUQvFxHWDOZDY+A7PsyjsOyMRMYCTvONuMTS1IHiaQu9tZdB
 vf1D7rU87bHXB6WzAa892k0FpfDw6UisRysDhH6hIF998BHZDk661E1YmjRhQXHQre0t
 mWKlpKFu4nz84rwzCXib1HSu/E/EG4gEHIPa6od8njMpLUJ9Nj5l/hdjJDIaqHx+Pssj
 wgLRrGxCOjeRW8fRVYRBlT9mQlQ27YJ9aRXJ4tMoB9muOZ4Sti4V5P3Ct4ILu5iPNsrG
 PUrg==
X-Gm-Message-State: AOAM533ffpGxYdayxD+PmzlLBR5f0q2kVhbUXzjVFhyHsMKLtsnC/UWc
 A0zz91Zx7o5oqKOPjylag+jxdfg2o4g=
X-Received: by 2002:a17:902:e906:: with SMTP id
 k6mr20342458pld.333.1596555676240; 
 Tue, 04 Aug 2020 08:41:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g9sm6760200pfr.172.2020.08.04.08.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 08:41:12 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Fix decode of {LD,ST}RA[AB] instructions
To: Peter Collingbourne <pcc@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200803222656.63936-1-pcc@google.com>
 <CAMn1gO75w=oaCp2TjhFzr2nrbKhHOP6Q20bnvuuAzgSVe+thMg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c14ed0a-da1b-a265-d5bd-2dea42764032@linaro.org>
Date: Tue, 4 Aug 2020 08:41:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMn1gO75w=oaCp2TjhFzr2nrbKhHOP6Q20bnvuuAzgSVe+thMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: YCk9H5o2VNIN

On 8/3/20 5:21 PM, Peter Collingbourne wrote:
> On Mon, Aug 3, 2020 at 3:27 PM Peter Collingbourne <pcc@google.com> wrote:
>>
>> These instructions use zero as the discriminator, not SP.
> 
> Oh, there is no such thing as STRAA/STRAB. I must have been confused
> by the name of the function, disas_ldst_pac. I will send a v2 with a
> fixed commit message, and another patch to rename the function to
> disas_ld_pac.

It's called decode_ldst_pac because the Arm ARM section is called "Load/store
register (pac)".  Page C4-311 in the F.a revision.

But yes, there are only loads defined in the section.


r~
