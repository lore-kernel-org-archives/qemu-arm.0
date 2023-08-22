Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp72342ejb;
        Tue, 22 Aug 2023 10:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVK58lz8eUwTfoGoO0xSdKYgLlS6JMzHKLfUaSfWtQBz3cBmuIZEL/g7pgh9m6fMzWsBiK
X-Received: by 2002:a0c:e44d:0:b0:645:df54:cf83 with SMTP id d13-20020a0ce44d000000b00645df54cf83mr10506891qvm.38.1692723891774;
        Tue, 22 Aug 2023 10:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692723891; cv=none;
        d=google.com; s=arc-20160816;
        b=KsF7IHC5qQkWMj+K+R9RrsvHUluaA5tjE7pvCJY7dmHuONI11wRuf1j8aNWFDC/FJB
         iCC0F/8pUkofbxuiUMn2WITqL0ypQ3pP2aWJ0G/iZMDZvmYbmfo/FhjScjQ/m7EmZn6b
         JWhVMXANBicOEnP274fnfWwKWIZRCicdOHC/AfLTy0C/LFOnp6Qu+QjT8OV4p4gVHGC/
         bYNJRg6xddTGOEUuTRtwrdi/AHXTCvDeYVUcoOsD1fbV7M7hZuRPDPlJKDF+KGVz2tom
         xyD2mizpbPpXA97TYaeZaKsxgt+sJ/1RCO4v9JD9SLXtD5Ypf/L+NunmngDhL8PKQtAN
         4i/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zl/lidmx8ZgQxrNOctprKvX240HkROL8X73axlKfoRQ=;
        fh=udqmx9LSKcjBYX2QmmmNuZq6BInkQmY/o2TngAkK7hA=;
        b=YTZBKCMxddfCl4h71qGWBHiySZB8ZOfGZsWn2FF6ei/83QPOAE3ljs0QsaRl4eCAJz
         ECnvDA0OmLThdkzIWyqF2kl74wi4yCDKSUXmhpFfp/hiFiwhFk++FYaItC2/eWkuiqUF
         e/zW2n64TczfN3Bdx9ksDYfLBuPa2s1KmsHCDJgqVBKfto26vLQCV0lFfy7vsiagNemM
         s96UTwl+MUPsLfKrz1dCVrEld5aIt+4MZuYIcbyFscejUGpTZtaWjM2k8EjntvieN3Un
         IaMb1rucCr+z7vN8fFODzHvKVcwK7hfO5Lm4SjTZmA764hJD/mCyxhNEuZIx729oFWP8
         zCDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=thjZ5M5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a0cf248000000b0064f572979aasi236199qvl.60.2023.08.22.10.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 10:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=thjZ5M5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYUo3-0003Df-Q9; Tue, 22 Aug 2023 13:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYUo1-0003D1-RQ
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 13:04:38 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYUnz-0002eW-0G
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 13:04:37 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bba48b0bd2so30794475ad.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692723873; x=1693328673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zl/lidmx8ZgQxrNOctprKvX240HkROL8X73axlKfoRQ=;
 b=thjZ5M5oZG+P5e1yoGwCTk4oMRzXuhVP6Vdrt4+ynsDt4v0HI392e3VpN7N+aK0A7S
 QEk2otZ6m0RJnhO/rsIQRQlk7qNhvbarv4YVFi4Hzojfltoa/WDyQi9Dhw29U7syh4Gi
 VktlgGUsR+I2GybOttHJ3dBWd3fKIriF2vkfQHhZCcXTe6y1LrPzgOoGnjHCpC8A1Qa7
 +9rVXE/BKaQdfn6AiLXBKM5PEpn/ESLh80MOAdzn11K3oZ9hwZaNSof1PTrCzgIiPCFo
 rteZ/u78b3UVM6PxWltx5c5kROEOD+itpkmMUmQrb16mFu2wURgjfbgNwxU2Or3rU6Lf
 jdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692723873; x=1693328673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zl/lidmx8ZgQxrNOctprKvX240HkROL8X73axlKfoRQ=;
 b=BQLe9YYDbTAkjarbobQqmlT5qWXXY70zfua3R38wRyFsIYWBJjzXtwDUXeUXudpUMD
 G8AaoY7wDIeRzJ/BYy218Fyc0z72FUXgnwdt8XIcWvOpv/PXKFlMFKk/QL/soiV0+vXw
 Ml6XgOk18NSpsFB9PooyFLAaQAfGlzVAU1QRARtW3DIPjWx/BAOMLXaCwQrwuARQ/aD7
 vX8VsGwgCnSU4mPy0F9TaLB2LSLnGUro9hCKKGU9zdUH87+DbhTwNg3iOsD3NAIysnNI
 x/FxCRibDFJj5PynvmJBK3sNeQtFrpOBc+OUX5143M69eO6w5Ax05JDOLoJTuzSl0bRk
 HBSQ==
X-Gm-Message-State: AOJu0YwWYR+Q2QAcFw6KfCKkXXIySlPOvScJI4Io/3Yw0TzqBGJxLQmg
 D0yp2O/MloxAfhE8x7xWj4tnsg==
X-Received: by 2002:a17:903:441:b0:1bf:34fb:3085 with SMTP id
 iw1-20020a170903044100b001bf34fb3085mr7451570plb.14.1692723873592; 
 Tue, 22 Aug 2023 10:04:33 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:4e3c:f4a4:b92a:b5ab?
 ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 iy3-20020a170903130300b001b9de39905asm9284878plb.59.2023.08.22.10.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 10:04:33 -0700 (PDT)
Message-ID: <8ea436d6-029e-20c6-9558-780430ff664d@linaro.org>
Date: Tue, 22 Aug 2023 10:04:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/12] target/loongarch: Use generic hrev64_i32() in
 REVB.2H opcode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822125221.55046-1-philmd@linaro.org>
 <1ea2097b-fb72-29c4-622a-79f96f69c2c1@linaro.org>
 <9ad24cdc-adf4-0a38-9362-e46c559fae7d@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9ad24cdc-adf4-0a38-9362-e46c559fae7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: 686pAAEur3VY

On 8/22/23 09:11, Philippe Mathieu-Daudé wrote:
>>> -static void gen_revb_2h(TCGv dest, TCGv src1)
>>> -{
>>> -    TCGv mask = tcg_constant_tl(0x00FF00FF);
>>> -    TCGv t0 = tcg_temp_new();
>>> -    TCGv t1 = tcg_temp_new();
>>> -
>>> -    tcg_gen_shri_tl(t0, src1, 8);
>>> -    tcg_gen_and_tl(t0, t0, mask);
>>> -    tcg_gen_and_tl(t1, src1, mask);
>>> -    tcg_gen_shli_tl(t1, t1, 8);
> 
> Looking at 
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#_revb_2h4h2wd
> the sign extension is missing, so the next line:
> 
>>> -    tcg_gen_or_tl(dest, t0, t1);
> 
> should be replaced by smth like:
> 
>          tcg_gen_or_tl(t0, t0, t1);
>          tcg_gen_ext32s_tl(dest, t0);

Extension is handled by

TRANS(revb_2h, gen_rr, EXT_NONE, EXT_SIGN, gen_revb_2h)
                                  ^^^^^^^^^
this


r~

