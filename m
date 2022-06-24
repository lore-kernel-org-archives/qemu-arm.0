Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp591206lft;
        Fri, 24 Jun 2022 13:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/2PNdCLi5tIDo8WWlcgfPlXjZX8/P93Un9i1MOnHWGNVNPJVJELVvBp2GvhnnYVOtxz4U
X-Received: by 2002:ac8:574f:0:b0:305:fcba:3ef7 with SMTP id 15-20020ac8574f000000b00305fcba3ef7mr770098qtx.40.1656102939501;
        Fri, 24 Jun 2022 13:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656102939; cv=none;
        d=google.com; s=arc-20160816;
        b=zYdba5K6HyHUDj63mOkHEbAKcjrIAfP3Ez5thsAyif+li32HjS2l9tbIQs55j2+QVr
         t3djBM+kxxhmiDS4cX7VYsPn/ze1aX9GDk7Mi5w6VivWSEDgeaBhzfvqwbrKFNegruG4
         4bYeLewe+LgVHsnLukuGoFSvWgoqEt7ySKWYXyQx/u/uGwYMRLAQOODAkv0Xq98Kk/Jn
         Pyb5+2lcmlxFMYY62kiMA0fmpEZaLvmAK4aKPkIzC6BkdMKdOAZTU1LTsQZR6i1NjKDe
         F24z+pohw+D0meV7DQ1MMkLy1MrvO3ixaRIo/wId7jsCq89lmyHMIPDnw7zIhPfwV+Vk
         VBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uPspGSoLk5kGw/SBQ3chHEEQNlFlq4lKRA8mHfk/xdw=;
        b=nvDzTaK0Vnbz2hXZ6MHkk0jReUa8bea5QdJgozmZmwqiV6GNoWooqCNfhBuKjHdq6+
         4F5XtWE4EMgAMZWbUprgynURs4E4KGqGZrabENtYyh74faxWqG0Le5H1VKuNqR6KniRf
         zp+XQ+iD0oaZcP/+kbQ6JiC+R7mPMGwkFy2rDRkLlVwVBGOG+E+xH0t+il1TieYiG5fZ
         Ic6qzWTX8ojduSFsdmdzQPNM3xygqZpEdMQM20y2khLInfcxU267P4DR/Y5lr/W0xK07
         0PLA6dpCvNKKlhHJk18isAwxSBtHhWQtuUw6NTvm/XgOkuJHUbECZGS+atrjlX2FwKgA
         dcVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lJup/DFg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv5-20020ad45ce5000000b00461ccbd3589si2326473qvb.163.2022.06.24.13.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 13:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lJup/DFg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4q1i-0004Hw-UC
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 16:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4q18-0003gb-QR
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 16:35:02 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4q15-0004UQ-F8
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 16:35:01 -0400
Received: by mail-pl1-x62f.google.com with SMTP id k7so3043602plg.7
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 13:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uPspGSoLk5kGw/SBQ3chHEEQNlFlq4lKRA8mHfk/xdw=;
 b=lJup/DFgxyS42cIr3BU/FdOfIpA4x07jsxVoMixZHzmZ8TdxMqqG1qC30grHOkMl4+
 8YISzeEwCTLNeRZWDbwZbj7+a/2JD7c25zH2Puzbx7Hk2UzjeChmzhrM6GKgReYE7Igp
 366x2ecrWvewie3ccuZ3xwmERWzWaEl5QYQyz1bgftGHbwgl2vQFiH0VBdzmwnpXXY5J
 JIfzIzk+A6T/Y+6bwIl5hQyThJr6DNiFegpczckRnebIkwYmMM5+e+rYVz2UEUe32MTT
 qb2/BmbzFL45S3kzEEoUTvbrU6AscWY1yzKK9PwaWlURZ3V7P91njFfYySBGsXXNlX/I
 DkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uPspGSoLk5kGw/SBQ3chHEEQNlFlq4lKRA8mHfk/xdw=;
 b=iJ8FH46IohnBeS5AGw2pV1ZrOrQMdR/jv6KwG1fpWcvwINOYlIwG3mRslHHboi8yD+
 PIMtZ3yj9nGq3u4ltE/KgijerOaznER4k1f2h3GbW/+E9TqK9gvdiMs1m2RDoJ/5u1wQ
 OKihlAqhM5Em8CXr00mngxGA9414VB7Q01xV8fzRpkvyGQDDl2ZZozLOLekzo3/yXE+J
 SE3k18mjjV77gSwKtA0DLWVSoao+3ZgUZbNonS6lJffWR6kOPqThw0YS/Ntsmy0G7gBe
 grojsVVmz/VyCbP01VnZ2QZzzLuGDdozWUkxCVbvz3gyzx1N2fCnL8Wj3wcqBWtYIRer
 BPAQ==
X-Gm-Message-State: AJIora/MMpj6sLGMf9OVuxIMQmrndRlvuI1XzP/Cu5l1Q2zeX7w8NrQg
 5gIz16BKIafN4faoXBH7msY/EQ==
X-Received: by 2002:a17:90a:fe16:b0:1ec:a69e:d135 with SMTP id
 ck22-20020a17090afe1600b001eca69ed135mr6106429pjb.31.1656102897974; 
 Fri, 24 Jun 2022 13:34:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c1c500b00163f2f9f07csm2241241plc.48.2022.06.24.13.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 13:34:57 -0700 (PDT)
Message-ID: <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
Date: Fri, 24 Jun 2022 13:34:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
 <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MGTuTMPl1wzB

On 6/24/22 08:30, Peter Maydell wrote:
> So the thing that worries me about structuring this this way
> is that the SME supplement appendix includes this caution:
> 
> # The instruction encoding tables in this section [...] will
> # require correction if subsequent versions of the A64 ISA
> # add new instructions which overlap with these encodings.
> 
> My guess (based on how the H.a Arm ARM has incorporated
> SME) is that these tables aren't going to be included
> in the Arm ARM and updated going forward. Instead the
> behaviour will be documented based on whether (existing
> and new) instructions call CheckNonStreamingSVEEnabled()
> or CheckSVEEnabled() in their pseudocode.

I agree that this would be cleaner and more correct long-term.

> So I'm a bit uncertain about how awkward it's going to be
> in future to maintain this transliteration of the SME
> supplement tables into decodetree: we might find that
> we have to look at new instructions and kind of
> reverse-engineer back out any required changes to the
> tables here, rather than simply "write the trans_ function
> for the new insn, looking at the pseudocode to see which
> _access_check() function it should be calling"...

I thought about this, and if it were simply a matter of annotating the trans_* functions 
within translate-sve.c, I would have done it.  But I would need to adjust A64 AdvSIMD as 
well, which is still done with the by-hand decoder.

Can we use this solution in the short term, and fix up advsimd while coverting it to 
decodetree?  I'm more and more convinced we'll want this sooner than later.


r~
