Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1510485ejn;
        Fri, 28 Oct 2022 12:36:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7s0b85Af2POq+z4IoVeBGGgFGyK3TU2BAeOexhZ3D7AL2KsQw7LjPF5bFTHyclvDwFLx+O
X-Received: by 2002:a05:620a:1909:b0:6ee:d4a1:fc07 with SMTP id bj9-20020a05620a190900b006eed4a1fc07mr690264qkb.489.1666985779282;
        Fri, 28 Oct 2022 12:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666985779; cv=none;
        d=google.com; s=arc-20160816;
        b=IaEPML/3TxvDWLTZCxnEJYYPmfydsqRdq1sZJtPlzJ7e8AQigfR9hL+6DvnEXp+Kp2
         D3vNMKvNp0MUelGkuvoQwX/b+qmekW1WBQBCGw0ij09DxrbxCh3i/WYynXAD2TB5E0Ov
         qs0fbxNQmpWaB7Behlo7emEdqOZEUhdNis+XKBs8sd/cdrmO+4RxusoyL3MUq+Sy/B2c
         OGnM31NR+goFzLbLBIYYrWg5XHAbCkAhCmszl731m3oVJuLB1EfhN7dIjtfqLdRC4APk
         GVKfW4NPoLNK1p3q0IaFawlLUrB98+sMNqKfnROOM7fsiqYWwDbGRIt7r6aLe6c6oSmT
         IuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3wxcOd4OzDjMiOD5bHmw5ld6INm3ORzb+ri+P+2t8YI=;
        b=m+JV7O12u7STmmANZJM9vZ/scsGDixmRjPyj0K3u4qifhLRrSvaEylQx/u7x0HhsDf
         Du1OFJSkYC2zt16uoNogkIDFctWg0uGq0Yrg0Q0o+mk4cTpCCW/6bWWE7UBWngsHSrBq
         dsvooLpMyxh82ZgzulUH5+oDtW5bdvy693+UA5POYMATv1z5rTvSHj1ds9sPoXlUw0Xq
         qKxbF7rbckO6//JfmnvL53BZMlKwICx394ycloi5X5+CeLesx9FxkiSZC8q6DfmVnrdW
         z6jhssN2gzJVGpPPASeQ2Lo3LD3qlBAqe3iSAnXI8T5B0S+yNMVcOA+0ChOkfs+kjMQi
         aF6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EcJPgJyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm56-20020a05620a1d7800b006b5fc817571si3709026qkb.658.2022.10.28.12.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EcJPgJyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooV9D-0006Va-AY; Fri, 28 Oct 2022 15:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV92-0006Uv-VG
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:36:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooV90-00064L-Af
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:35:56 -0400
Received: by mail-pf1-x431.google.com with SMTP id 130so5605635pfu.8
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3wxcOd4OzDjMiOD5bHmw5ld6INm3ORzb+ri+P+2t8YI=;
 b=EcJPgJyLz71jC7pLD6RDQFubE/YAVDypDILVZgHWCd7poxyW6LLKzC60SUirq3Q31q
 vOXtNfZZpJlHMuFGYoSz4oCnD737P8CjY4RO9fg0FHUcJVS3aa1oNzS6KAQ4xHkWgfK/
 DiBzEsKDbLbTAidgCIEMlxtoYqgYnucr9+AOm6TTfLQrhvvOmxDfsmsMFKV8k2PXUdMi
 HrS/a2QZNVmaI+Vm7rHAKlwAUF/5n6k7XMPoCvmPxw6oWxBWxGaTQlHwgmsOW1hhWGZd
 HSRGP6SN2iZCx8dEUWtRFYgJO63A8lYwlEVu+pF3AG8mtiqubY1nwyyIruacoRr4yUWS
 If2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3wxcOd4OzDjMiOD5bHmw5ld6INm3ORzb+ri+P+2t8YI=;
 b=bYfuMinSfewIR2SNXnaS/s/E4WKBkbUDIwi3YIvPbVO43KOtk/GTtVQyaLVRxTTzrI
 ThjaFvajFdLXaFAhCp4FYme172BfAsrMXiBfYEyJSYjUgnS0Mc4M7YC3mvaQAA15A9LR
 giy1XMLSjNc481FW1Z4I9hkOa6z+eeiEdn22tV+SqVC59S5aD7grJ+KAdUpoPC81Ns7V
 JFtbNmBPpYxPznjaXwHvL1MfsjxHDBmovErF1QxunH7SDGyeb2l6vSqsvhsbc8SwwB5y
 ZyCLOfWXvNq8msn/rXKPnBuLnu8jBV6jnyF77S/BY7Q+8EQbIRbgz0+YZkO/IB+6/VN2
 yMpw==
X-Gm-Message-State: ACrzQf0UfD3dDro8f1zMyNl1VfZEdar5IGi+2lqBuvvYtcGhec1ONIxB
 sa8AiBxQr7CMRRVl8UmKJg783Q==
X-Received: by 2002:a05:6a00:1349:b0:563:654d:ce3f with SMTP id
 k9-20020a056a00134900b00563654dce3fmr745378pfu.32.1666985750923; 
 Fri, 28 Oct 2022 12:35:50 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 ls4-20020a17090b350400b001df264610c4sm13525539pjb.0.2022.10.28.12.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:35:49 -0700 (PDT)
Message-ID: <33814036-bcfb-857b-dac8-ae1b66d6638b@linaro.org>
Date: Sat, 29 Oct 2022 06:35:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/7] target/arm: Allow relevant HCR bits to be written for
 FEAT_EVT
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rf2/E8/jIMs8

On 10/29/22 00:39, Peter Maydell wrote:
> +    if (cpu_isar_feature(any_half_evt, cpu)) {
> +        valid_mask |= HCR_TICAB | HCR_TOCU | HCR_TID4;
> +    }
> +    if (cpu_isar_feature(any_evt, cpu)) {
> +        valid_mask |= HCR_TTLBIS | HCR_TTLBOS | HCR_TICAB | HCR_TOCU | HCR_TID4;
> +    }

You don't need to set bits twice.  Either

   if (any_evt) {
   } else if (any_half_evt) {
   }

or remove the half bits from the second if.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
