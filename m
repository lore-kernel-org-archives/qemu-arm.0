Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2198121ejq;
        Mon, 8 May 2023 10:34:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ59WqaOq2CjI93WF95ur0glvQhgjIq2tUFHTbPtO+XUItI9oKNVXK/l27fXQPf3uLaAWkAd
X-Received: by 2002:ac8:4e8b:0:b0:3f3:8cf1:629c with SMTP id 11-20020ac84e8b000000b003f38cf1629cmr7544655qtp.46.1683567290727;
        Mon, 08 May 2023 10:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683567290; cv=none;
        d=google.com; s=arc-20160816;
        b=Bz000HEq5wes5Eb8MCwbApNd5sBpVgjpBCyP2LLfAjCxTyrYLizF1ubjsabqxJSamF
         Pk78x4YzaHk3pa3X5BMPbimtpQKP770/XNA6+twFvD3Vl4X43x4QTUELaIlmXIk1a9JM
         3Y+NJoPd8/Zjbf/YmjvYXTDhu09xwJ4Bv80TT+1VIDrrB4vVGXx+mRbytILvi6TUkPDx
         rsJC/MGT47SMU481FtBu10bjL8o2fccXrD5siX17ERL1oobwA+CDKvXzqZdHzOf0iFfB
         ITENtSfDfZQ+2TK++SMa+0kf+MqQK0swiG2wJI4NNqsGtuWZYyORZqU3W3zbF5XjT1Wr
         3bDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2sAeg1EU6WtlPSw4uX/jkzQKtpZTY5VZi71T06y6p2g=;
        b=c5GFJRX+tqp7oqP3s9mFYML2EGub8fffceWfl6GqGxa6mSWSurtgg/TNZWJgbUmoJu
         GMfyut61e78MJqJG6MoUjRddos8lPUUZoAtNw0YcmfB+u1S2nFt7RDaREHrXB2WuKlri
         VTK93b7zSPVzBGp+sHBlrsZ+zUoMtEaX2z/hlApSo6Y84IqabTAaFvi+o/WyqbJYsncn
         4ebSzhp5lo16OShhnhpU6VnJTjBa71WRRAPG5YCKlYyZs0tpoy9bfxsnWjCvhl2UioJw
         j8FfVzuENFUxGUBNz8oJ1iE8yiGKa7V30JNC0tk+YP/2odv5VoC62ub8QhOzX4tCYSby
         LrLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u28I6JZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020a05620a12e700b00757793e679asi1276802qkl.109.2023.05.08.10.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 10:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u28I6JZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pw4ky-0002KG-P2; Mon, 08 May 2023 13:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4ku-0002GV-1a
 for qemu-arm@nongnu.org; Mon, 08 May 2023 13:34:36 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4ks-0005iJ-EA
 for qemu-arm@nongnu.org; Mon, 08 May 2023 13:34:35 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-b983027d0faso6395364276.0
 for <qemu-arm@nongnu.org>; Mon, 08 May 2023 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683567273; x=1686159273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2sAeg1EU6WtlPSw4uX/jkzQKtpZTY5VZi71T06y6p2g=;
 b=u28I6JZBbXL93RaAc5Yvlw/LcNZh7IcPxA+xFuU0rDC9ECDxGtrYUqial++fHYJXm2
 7ZE27+cfqdUVy96bc5RhmtY1FXGkoLhfA9fdqQz4iy+hIlHflEXaOnSVSgmFrKl8aWmB
 XAqcplzyvGq7iuSIbaL1VtzxBHv0KafcU7uAly7pFTFI2/E84dzmIkezyjuInUOTaTo/
 jd01tTX5B19r/ma+tn2WwFMzCg+cP2DN9ACBNTI0KtUSqO/9F4SImubO/YoF9YoX9P2o
 QZ4j46eWsL8xuEHgRkOhV/iH1dsRgdR2BHfKW0EVLfPCN3g/UKTrtbTtSjzyMkh1cLAO
 rZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683567273; x=1686159273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2sAeg1EU6WtlPSw4uX/jkzQKtpZTY5VZi71T06y6p2g=;
 b=aQRIDx1vfIBRaG1AlH51fzCFBOgly4fslMxyX/Rh6zI6C0FNX5HDXfNhJVNHl9CQ+d
 ZM5x6/QvoP99o0xwKBO7EJxZlI2XCrehPuU4oZxiFer0z2CazE5rXkVPcETug+yF+bsN
 ONZ5iL4UprLj0VdRf7wZRe9RhUNt7cn8bYHmthm9gyz2sgk/hspLnGJWbTTRInLUFU1Y
 6aNvYV66D4KWHx76JC7AtlE64tsRLub4OCjTeQYwzeTUEmxbTN+5gaR8Y5ks7hwLOptA
 HBAZCtNVipS/WaZ6Dqad9XGFk6K+/3GIXn1fLCakDfA5hp+JW6KF6/hH91nUTRzacm8z
 Y90w==
X-Gm-Message-State: AC+VfDypm4UdBJmwYGsUat22cFEPyR9ATjaZXWCy9IkL8KhsWZjSopJF
 g1qQpHECkmRMQ093QHltlM9a9g==
X-Received: by 2002:a25:41c8:0:b0:b9d:bba9:b1ec with SMTP id
 o191-20020a2541c8000000b00b9dbba9b1ecmr10087038yba.62.1683567273323; 
 Mon, 08 May 2023 10:34:33 -0700 (PDT)
Received: from [192.168.110.227] ([172.58.139.115])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a252d09000000b00b8f51af1364sm2468470ybt.53.2023.05.08.10.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 10:34:32 -0700 (PDT)
Message-ID: <1798f4f8-9cf2-aa16-3f2e-9b0ef333ce36@linaro.org>
Date: Mon, 8 May 2023 18:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-52-richard.henderson@linaro.org>
 <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iq0fYfKbeD4s

On 5/5/23 14:20, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc64/tcg-target.c.inc | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
>> index bb23038529..4f9ec02b1f 100644
>> --- a/tcg/sparc64/tcg-target.c.inc
>> +++ b/tcg/sparc64/tcg-target.c.inc
>> @@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>>   {
>>       TCGLabelQemuLdst *ldst = NULL;
>>       MemOp opc = get_memop(oi);
>> -    unsigned a_bits = get_alignment_bits(opc);
>> -    unsigned s_bits = opc & MO_SIZE;
>> +    MemOp s_bits = opc & MO_SIZE;
>> +    MemOp a_bits, atom_a, atom_u;
>>       unsigned a_mask;
>>
>>       /* We don't support unaligned accesses. */
>> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
>> +                                    MO_ATOM_IFALIGN, false);
>>       a_bits = MAX(a_bits, s_bits);
>>       a_mask = (1u << a_bits) - 1;
>>
>> --
> 
> No changes to HostAddress struct again?

Again, no use of alignment outside of prepare_host_addr.
No 128-bit operations, and all host operations aligned.


r~

