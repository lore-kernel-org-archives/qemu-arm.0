Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2078504ejt;
        Tue, 28 Nov 2023 10:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAcAVMGa0XuYyKuujNRvDGfl5rIaM8WY63Mvw6oNQecuBHOzbLVnE8S57BNvw1YebQNPsd
X-Received: by 2002:ac8:46d3:0:b0:423:b51c:a2c9 with SMTP id h19-20020ac846d3000000b00423b51ca2c9mr8632920qto.22.1701194595583;
        Tue, 28 Nov 2023 10:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701194595; cv=none;
        d=google.com; s=arc-20160816;
        b=MxivYIO7DC5+fsEz+o3lHVTcCK2wymKsCCAIbCbyMT3sbSU3p4RNsYT8/4V2BM2Doj
         k+7LmygBSVX2IW4PoCkygvYoN6UANaSp8N1el4rA5/xxqPOuTGerCzpFxaj9zaQlXeTV
         kQ9MnJJmIEFvUoFGnyAOCw5Qm/Mn8sjsO1i0GXAVy8qzdeTKKoeSfWY6R2bbdGPCwCaW
         7gBzfydTeHAR3lZWPBuM0TDZuNLQ4LyvHaOqiP9R3kRFZAH/deOrPosycvP8X0C5pVvL
         6dO0zrVIgUFOsA/b3MqxmpiE8WCWf39mxLt/QyESSCs/jIHFv5CSdVMzDyewJ/2C1Uhf
         F8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2lEzZanP7/CaHmG+Avp5B41ij/SnJl+RpexIA/tsw5E=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=seFgaHFXC6WNqit6daYCXIKUG8s30ukRLmAFLmQ8xIj/RJXsDbXIKP/nHjGUX2FeO4
         76gFR3rOuFrpxhLHfwxA6a4hBa4yPsFXGH2DdaiPTr75bD1PaB85p3UiRLvrsWQPqRqN
         clpHlO2vcr8/pwibTNR5e9HbaFPQqYrDH0Yplum9yjmW5dbvfzWTWNPbDLSGalTkwksn
         EI7tt5ZY3q34DiGBaYCXe8fXhcsmtnYQ03KbMvBy2WHKN2GBCUXgfPsmdB7YcGBvpHez
         lc5tXVj3A1nC78sHo6OpZV7Da6REHvmzlxU8GFgYXOj2M5/DNZADshZkwFfQgJnjwnjJ
         Hmhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ud/Hfq3g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc10-20020a05622a410a00b004237636452esi8450896qtb.526.2023.11.28.10.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 10:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ud/Hfq3g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r82Ps-0000Pc-5j; Tue, 28 Nov 2023 13:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r82Pm-0000OS-Gx
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 13:02:34 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r82Pk-0007rG-2v
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 13:02:29 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so8377502e87.2
 for <qemu-arm@nongnu.org>; Tue, 28 Nov 2023 10:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701194545; x=1701799345; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2lEzZanP7/CaHmG+Avp5B41ij/SnJl+RpexIA/tsw5E=;
 b=Ud/Hfq3gQ/7fXaJnFQMYK3IJ7Xr5n4DKU3ojow90rgu5A1dBX4KmuDCQya4PCf/cKi
 iAG1F+Rb0GtbZbX5nCD1Tsd7C7KVeNOYzoKmAsIjFqr7NqOowgnEUpkIzvjlsFsq+nsJ
 HrSeNKTcEoj5oRdYYjRCwIniicXKqS0RQHYa30n/MfZDD79aBVkoBRmahlduFaLQ1/fM
 Zpl+j2/uhlttjfOKzwKg0s9yHRFET0ZXrQbnITuDXTWv16tbYM/DLIYuXQPpo4rK4R2d
 DThdKAIcvec6B4/0MQ0wTYkx/XM9k7jrArAnkrHQ6iyPtay6z2ZKUepsdjyHabg3Cn8p
 QgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701194545; x=1701799345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2lEzZanP7/CaHmG+Avp5B41ij/SnJl+RpexIA/tsw5E=;
 b=IHAjoe1W4uo/BmqP3DUxi/udYlWZuW4fXKfpYQ7CEwH6B249fJ7yT3KnwTFXE78sCx
 9LhzLDCtaH0jRpoXwqSfvuPQWt+wkoJj58BcVUMWUhLSDaXxnNxbO9h8/V5pywFdkoxe
 BofGu8UhRoZsEsGsGg0xslq174zf2kLr/qfGiqzX1c4Ii0kq3d8XEskUCsVpPpMTKQn8
 KUVQcizosGja3SdP2Se9JgqZLk2G+G/33plNbqHdhTcNMT8j3lT0muDblezGqyXrUipw
 cSwGtJJ3mgVtReZeRx9ID7vP/LHNWNPEDo+kUA1qMqE33Mx+PVQ96w5jrTfZ6W1dZ/pI
 LPWw==
X-Gm-Message-State: AOJu0YzUQapWgh6COsiDLo74pLcXOSGQvcmdQEqPsK1fsU/n+bkIcCHj
 6E3agxneYwDu5w2+inZLV29Gdg==
X-Received: by 2002:a05:6512:3709:b0:50b:ad18:369b with SMTP id
 z9-20020a056512370900b0050bad18369bmr5525910lfr.29.1701194545032; 
 Tue, 28 Nov 2023 10:02:25 -0800 (PST)
Received: from [192.168.174.227] ([91.223.100.55])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056512350500b0050ba4a21fdfsm1543929lfs.39.2023.11.28.10.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 10:02:24 -0800 (PST)
Message-ID: <4a6ed3cf-e714-44c2-b438-44e59b469e7a@linaro.org>
Date: Tue, 28 Nov 2023 12:02:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.2] target/arm: Disable SME if SVE is disabled
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20231127173318.674758-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231127173318.674758-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ee5eQ1JUU5U8

On 11/27/23 11:33, Peter Maydell wrote:
> There is no architectural requirement that SME implies SVE, but
> our implementation currently assumes it. (FEAT_SME_FA64 does
> imply SVE.) So if you try to run a CPU with eg "-cpu max,sve=off"
> you quickly run into an assert when the guest tries to write to
> SMCR_EL1:
> 
> #6  0x00007ffff4b38e96 in __GI___assert_fail
>      (assertion=0x5555566e69cb "sm", file=0x5555566e5b24 "../../target/arm/helper.c", line=6865, function=0x5555566e82f0 <__PRETTY_FUNCTION__.31> "sve_vqm1_for_el_sm") at ./assert/assert.c:101
> #7  0x0000555555ee33aa in sve_vqm1_for_el_sm (env=0x555557d291f0, el=2, sm=false) at ../../target/arm/helper.c:6865
> #8  0x0000555555ee3407 in sve_vqm1_for_el (env=0x555557d291f0, el=2) at ../../target/arm/helper.c:6871
> #9  0x0000555555ee3724 in smcr_write (env=0x555557d291f0, ri=0x555557da23b0, value=2147483663) at ../../target/arm/helper.c:6995
> #10 0x0000555555fd1dba in helper_set_cp_reg64 (env=0x555557d291f0, rip=0x555557da23b0, value=2147483663) at ../../target/arm/tcg/op_helper.c:839
> #11 0x00007fff60056781 in code_gen_buffer ()
> 
> Avoid this unsupported and slightly odd combination by
> disabling SME when SVE is not present.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2005
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> '-cpu sve=off,sme=on,sme_fa64=off' crashes in the same way, so just
> turning off FA64 isn't sufficient.  Maybe we should support
> SME-no-SVE, but for 8.2 at least turning off SME is better than
> letting users hit an assertion.

My first reaction was simply to change smcr_write, so that it does not compute SVL unless 
SM (as otherwise the write does not (immediately) change vector length).

However, as I searched for other uses of sve_vqm1_for_el, I immediately ran into other 
places in which are gated solely by isar_feature_aa64_sve.  So I think this simple patch 
is best for 8.2.

I also slightly wonder if SME && !SVE is a useful combination.  AFAIK, while v9 does not 
*require* SVE, SVE2 is intended as a replacement for AdvSIMD, and I believe that so far 
all v9 cpus have at least 128-bit SVE.

In any case, I'll work on any improvements in this area for next cycle.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
