Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1711534ejc;
        Mon, 16 Jan 2023 12:16:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtp8LG3Yjf0Fi9aUhduswvNryDOIIK4bti7qEJcMNOynu30vfgWSsUn7CCBPJS+e1pIGTyt
X-Received: by 2002:ac8:12c2:0:b0:3b6:3349:6ab3 with SMTP id b2-20020ac812c2000000b003b633496ab3mr463438qtj.20.1673900191385;
        Mon, 16 Jan 2023 12:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673900191; cv=none;
        d=google.com; s=arc-20160816;
        b=tIH7UB1OrBKLft+eAa+pGxPqIcw3HKo/X8ffO+cU/TgB0UmlyLsQFk1G5ge4q2sxQA
         yKxxujjm07xegiv1T5/Kr+mhs9iRX3W0axOex0oB2o5HtZLs3e/SSPt4QV1trPg5t7Kn
         mPE9IUbuXLV79fCblpbNz/UEQLkssSYpo0rlj9xXBp8bO//b/MH3pCbjvq3GcH5FF24N
         jnaqryIVE693iNv/Zt9EQ+OLU4B97ExtXpZ+Tf0sXiWKS12pI8PEhaZYN3T9+YEryppj
         BJWRQRzr5eO+PwN1wSaL75Vd8dJan+KUWQoV8o3UDfj98mqCEZIxd4oy+pR+etcjjj8g
         I4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/a+mPmC9TPOjkNF3qNNdOtO5M7BdDFvcpHOMGaqfT3c=;
        b=w4l0ZtXJH8DVv2k+1CvgjIEyQvZ8nFVV2MwDWMD6XrBwivI85jlaX2sj2rkNqUgATD
         OVY8maXUXNXL+EWObpd2jZfQbMOj4+iRg8fnabmqlaRFN8O2bpyjoRZNXjoUzYkrJxzV
         R+sLqccRmEanL1MizyLpnUvYMtxZpRPfGQLghELnzQQae5RR/+HF0/QanoYzRqrD+CqW
         obS9WYS2fWkXKD/IkLUr7z7141GnOSpV30tC4mYJAa2jDfCmbwHV8r2krg2Ie1mAyDjW
         dogRcSNbmQPprttZxhftfbo7ErQ/QLgRd8VgjvkISU1wlLRlIR4HGihJP51FbBuwG80C
         /seg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CbGnaim5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020ac873d4000000b003b62ff83003si2240911qtp.222.2023.01.16.12.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 12:16:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CbGnaim5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHVtx-00016u-BK; Mon, 16 Jan 2023 15:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHVtt-00012t-Lu
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 15:16:14 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHVtq-0000qd-TZ
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 15:16:12 -0500
Received: by mail-pl1-x636.google.com with SMTP id b17so23871993pld.7
 for <qemu-arm@nongnu.org>; Mon, 16 Jan 2023 12:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/a+mPmC9TPOjkNF3qNNdOtO5M7BdDFvcpHOMGaqfT3c=;
 b=CbGnaim5UOqJzoPIaTEu2edCSt64wSqjW2LHPDtbvods4a0bAs2SvE1Kl7mK8dd1kk
 v4nRk8zVD+fJaQy5JpR2IrGmiL3ECU3/lIMFH+p7sNPqev8BT1NPLwHOUSF7A0ZjIj9A
 XCrbewEYW623ViFPkBQ9F1FnKBlZlvEASFgyHM7lPlzsJgMCz37w3ysta54Ads3nRrSr
 Epxnd4NARs1KzZ8bHEJbFHf7LrB+YzLW1oEBtC2TajkKdnpKZMfoi7cHV+h+DUhcm+Ch
 p81tRBNfkJpCbnA5trkhMYM7z3u3UBQ39uY7J0O8ATaxz/XjRtUU5YBK6Ltkdn0HLurx
 Pb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/a+mPmC9TPOjkNF3qNNdOtO5M7BdDFvcpHOMGaqfT3c=;
 b=CwWGvVsswlDD5F70TX8jkxVdvrAhjjJR6ZLBv+8XAil6s6TlmzrDz/ZdUZxGS0gnhK
 jjYX/KymS8TLLbLGs5hUmJsACxhONNXrd+oJawIJoiYbQDWyBKjCUgWsA6k+nxZYjSAz
 QgaEcEpN98Zk29qDjgCijuHoeaBNjHMH3tpI0pbJ8J2GifsBRfl6zpFgOn1eaQ0CF4r2
 vLkcPKM+UD48N6AMw4U1Wyblz7s3p3Z32ejSy6usgAbN5Z9hDwG/YXYo8WyL9PGQfNex
 3056c06y/rS9EoaHmRQWf0vfyZ0g4c+ZaO80mjmOe8QmdfkSsipx0EKn0+NBbxiOaRgk
 F7LQ==
X-Gm-Message-State: AFqh2kr3LznQE9QlyfN2UnqyB6Kp6rnSpylfkMnQxyY/nLEs5EwTVcbl
 SZAHUmUSbHElOsEfKgKkk9kSWvWtzfeI3//0
X-Received: by 2002:a17:90b:60c:b0:226:e59a:f869 with SMTP id
 gb12-20020a17090b060c00b00226e59af869mr381394pjb.43.1673900169099; 
 Mon, 16 Jan 2023 12:16:09 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a3f0800b0022984422236sm1518435pjc.11.2023.01.16.12.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 12:16:08 -0800 (PST)
Message-ID: <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
Date: Mon, 16 Jan 2023 10:16:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
In-Reply-To: <20230106194451.1213153-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: jBAQpiAZWJ4g

Ping.

r~

On 1/6/23 09:44, Richard Henderson wrote:
> Here's a short-to-medium term alternative to moving all of the ARMCPU
> cp_regs hash table to the ARMCPUClass, so that we're no longer leaving
> dangling pointers to freed objects encoded in the compiled
> TranslationBlocks.  (I still think we ought to do less work at
> object_{init,realize}, but that may be a much longer term project.)
> 
> Instead of giving the helper a direct pointer, pass the cpreg hash key,
> which will be constant across cpus.  Perform this lookup in the existing
> helper_access_check_cp_reg (which had a return value going spare), or a
> new helper_lookup_cp_reg.  The other cp_regs functions are unchanged,
> because they still get a pointer.
> 
> This ought to be enough to re-instate Alex's linux-user patch
> to free the cpu object after thread termination.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    target/arm: Reorg do_coproc_insn
>    target/arm: Look up ARMCPRegInfo at runtime
> 
>   target/arm/helper.h        |  11 +-
>   target/arm/translate.h     |   7 +
>   target/arm/op_helper.c     |  27 ++-
>   target/arm/translate-a64.c |  49 +++--
>   target/arm/translate.c     | 430 +++++++++++++++++++------------------
>   5 files changed, 285 insertions(+), 239 deletions(-)
> 

