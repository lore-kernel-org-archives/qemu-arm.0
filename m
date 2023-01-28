Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1552847ejc;
        Fri, 27 Jan 2023 17:24:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/98P5ILyZkxq1W1YhlSFSCZQlJ5gh31BBtcsWbElQazyG23w7u2h6F5tPrPh4OFbtHyqUP
X-Received: by 2002:ad4:5ca5:0:b0:538:3f5e:e7e4 with SMTP id q5-20020ad45ca5000000b005383f5ee7e4mr11517813qvh.11.1674869076508;
        Fri, 27 Jan 2023 17:24:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674869076; cv=none;
        d=google.com; s=arc-20160816;
        b=mtb6205qP343cC63BwhABSKcQ2JZSmBOiFtFsxWMDBFyzmQdjtLFP57OyPkqnen/JV
         dzW7qUmf29B3h+YBilXR7GF2ayxItGBUp0qCaLIJhs38KEZi4hk+RuLCGVXMui6j/i/A
         dxI6etlHQntvU9uqz7AngNdGUoWbJn9g7e7x5xza1frhF6hW5A5Ae3lbagmixbkDbnNg
         yczFewNO7UojWZjL5rroK5l/bGMp3XoUWAW6G9l1iexW5E2MUFeYmHrGd3UoYQkA6OXn
         nR0z790GcI7rgaQygV+JBp9c5mMqZZmA4HIlopHLTg/ulBOcNSx3D1a7ly5M9qRB+FTD
         ZbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PkJTh+3yRof+qOfNr7I3LAaNy8dJZdNWWm/f/Go7hgA=;
        b=mZpvHbOd7YF8o9mBNIMxz52PbYg/O7lPjvfMnbwX+Z3ugJMeXzKTusisUwzYmghsUp
         cVI3i9T8IkrrAYIqdyMhruHLNJ2Oga0GjXJREqiAGS6dSx0lvy0N/M+ATywp3newCP0z
         C1qX+aZLGfBsdPxGrllj2DCsi1S/otc6OSlJV00Cos/K6z4uLo/iIfgSom4ud2b8YpFI
         zEFMe5n2l4lL1iuAp9ztBjoMm2gOb5kq+cfwLfYYh+KUWf0xIQTT1YYQgANHQANRWS3t
         zTNYqY+CSoxPClrAPD1GjU4n0w8LM78gC9XHiKv+Mto1Hn+6lAedpiNxbqFQYzAlCKnJ
         +Wwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDSMqOsA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u29-20020a05620a085d00b006ee8f3ec6e3si3438466qku.90.2023.01.27.17.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 17:24:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDSMqOsA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLZx9-0007D8-EW; Fri, 27 Jan 2023 20:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZx8-0007Cw-Mi
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:24:22 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZx5-0001iV-P3
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:24:22 -0500
Received: by mail-pl1-x62c.google.com with SMTP id be8so6653294plb.7
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 17:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PkJTh+3yRof+qOfNr7I3LAaNy8dJZdNWWm/f/Go7hgA=;
 b=RDSMqOsAS/9s0C+cLBMWODvf5HjnC+bifZxtaouzxWgLUQxpmdBiPMLtw5TObbmY2R
 izuoVd8ba0TnaQl7jiiJLGvfLJJGdNLiruNxMbR1qsSr0+60VyiHo4TH44oX5ZwyNwUH
 0dNZXqjy6mmOomaqEiDLtjBph+DuZl3uE5uvFWFbmaPz8QuOTSW/B0Cf/ikQme8pbiTI
 5zcz60wnwRtZdBozJKk14+Bom2GK10R+Ttfjbcl35/WVwAXrN6T7harXfopEtbhwN1Us
 q86hYUQwm1jIg0nlapbtt0y/WK6nRzQ6sToQpzr86bLIPSt6ptOIwX3KtzOcMIo7IgxC
 p3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PkJTh+3yRof+qOfNr7I3LAaNy8dJZdNWWm/f/Go7hgA=;
 b=CTQ+XWJigLz5CfUyfr3NG/g0THyEpyA11r5mqXWsIMfGJAs++Y8Hfk7DjEj9DieJmH
 TfsLm1tbSe21sSL3o0iSWLPFhjfVGhswYImLeCu5b9M1c9WOSq7SJ/yeaaEqGi5bSIk+
 vy4ZAX/AS4NykO/zp1vOGZKvV0xxNTiTXe2tquxbSQkTR6MbxVWv1mljwmE8Oa2J3e63
 Wl5WswAqHNzdgDAkCXMn2pwYHcwVy3HTrJrNqC1pqUjj1jPNGJltbKAMVOVQt5VysfAk
 ZJQnyN8zWz/2hgc2xZ+a9P22vsGJBCr6w6OgcGyypsdYvbiw1YLjOAHuRu2Fh6ffwo4Q
 oWDw==
X-Gm-Message-State: AFqh2kpb8a6NXnppsYoG/0FZsxdv3NiZ5wD3xFz2fN4LKQQRo6gxQdLs
 GB1+XcKt0gQOpdHq829mvAAGNg==
X-Received: by 2002:a17:902:ba8b:b0:194:7227:84db with SMTP id
 k11-20020a170902ba8b00b00194722784dbmr39771730pls.37.1674869058052; 
 Fri, 27 Jan 2023 17:24:18 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 f11-20020a170902860b00b001946119c22esm3454486plo.146.2023.01.27.17.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:24:17 -0800 (PST)
Message-ID: <358331ce-ee3e-4355-5982-bf4e0b5aa444@linaro.org>
Date: Fri, 27 Jan 2023 15:24:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/23] target/arm: All UNDEF-at-EL0 traps take priority
 over HSTR_EL2 traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dezr5OORO/09

On 1/27/23 07:54, Peter Maydell wrote:
> The HSTR_EL2 register has a collection of trap bits which allow
> trapping to EL2 for AArch32 EL0 or EL1 accesses to coprocessor
> registers.  The specification of these bits is that when the bit is
> set we should trap
>   * EL1 accesses
>   * EL0 accesses, if the access is not UNDEFINED when the
>     trap bit is 0
> 
> In other words, all UNDEF traps from EL0 to EL1 take precedence over
> the HSTR_EL2 trap to EL2.  (Since this is all AArch32, the only kind
> of trap-to-EL1 is the UNDEF.)
> 
> Our implementation doesn't quite get this right -- we check for traps
> in the order:
>   * no such register
>   * ARMCPRegInfo::access bits
>   * HSTR_EL2 trap bits
>   * ARMCPRegInfo::accessfn
> 
> So UNDEFs that happen because of the access bits or because the
> register doesn't exist at all correctly take priority over the
> HSTR_EL2 trap, but where a register can UNDEF at EL0 because of the
> accessfn we are incorrectly always taking the HSTR_EL2 trap.  There
> aren't many of these, but one example is the PMCR; if you look at the
> access pseudocode for this register you can see that UNDEFs taken
> because of the value of PMUSERENR.EN are checked before the HSTR_EL2
> bit.
> 
> Rearrange helper_access_check_cp_reg() so that we always call the
> accessfn, and use its return value if it indicates that the access
> traps to EL0 rather than continuing to do the HSTR_EL2 check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/op_helper.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
