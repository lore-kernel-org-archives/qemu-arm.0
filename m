Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2898839qvw;
        Tue, 1 Dec 2020 08:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl4C7g9EJjwFo/1K/X5ZasGGXtH2+zbhC+opaj+KAQ06sz5SPsc88UbFeVCvDrHgmM3A9C
X-Received: by 2002:a05:6214:6a2:: with SMTP id s2mr3636214qvz.58.1606839118579;
        Tue, 01 Dec 2020 08:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606839118; cv=none;
        d=google.com; s=arc-20160816;
        b=sjEfC4QmO8sZHVvewbuj6yTscvwzH5pWVGnv+Is0+CYIyw8aPGO14Q7LbiSrTfhASM
         RJqpN/Ob2BA+O41H0qwUsT61alymzH20aRpxIDUoE6xLgXfnfRrPKDQf2fPOF4vtaVcp
         +LREw591rD35nJoiJrE/A/U7e2WeJAaHjYfSwqdoNpp3ZRG9qIY5uyF3rjhYJEJhH8XG
         qziNVH+fWJTMJi+T9R+Ltj7Iui29xAx/xn0ZJW4JSkfAjNM50/ugkwBlDOMDntYSNGtX
         GTW4/FX4PnpZ9KC359fTYA+N6o9w9LP+8atrLm/LbjGT/O1/z3WZq3KDvlyykdsJNpO7
         tDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r8ucL2pA34zxj00xR00xsf4UcakWKKM5JP1tJndqbMQ=;
        b=IOMfEjexFcRqiL/PSTKAU5PQY/L2YqhFG5moWm2F3t8USnHqPaydFxmX6mx/Uqc1fJ
         ZMOCKzA4W877TrX73ep3KukXq9MqKM8riKV7W4bATen1W+7wJZZfBaUpUyCli6CtApqn
         mehu76VbebzgAn/M9rRG4d8vvkvkk28yMvYt+NZPpfxJA71DOU2AjfTuPTQKOOIOeMEf
         xMnNZH7q4vJwxkwPxaIVcSmnYZiq89hbrThX0ItDSiFzIbi8rs6fIuo1bxiqYso2XIAR
         XooHWdZSUauY2ZM8ebG1Wjh8cpO1DY9iOgL/W5HHbqMYbODT25ocVO/+JSug015wtRWm
         0jmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qLMTQRez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si279624vsn.388.2020.12.01.08.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 08:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qLMTQRez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk8Fy-0007ls-2p
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 11:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Fp-0007lQ-JT
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:11:49 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Fn-0005N0-4D
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 11:11:49 -0500
Received: by mail-ot1-x343.google.com with SMTP id n12so2170518otk.0
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r8ucL2pA34zxj00xR00xsf4UcakWKKM5JP1tJndqbMQ=;
 b=qLMTQRezIEPiDTwoD9O4V2Khx48UXXIRoh3rxap4bfplb6AaZX3de4B/iinj6qAzko
 FXJtg8plPUgBCmcR78lIc7kbZDy9zm6GAoeYlzWi+LFQte3tfLYfTN550W5SXm++/mgK
 +s/G3ZVCqBZyzQPmliZPtDTIDIJp3R4Bidju8j5sHhURbDaHSBgywFCbai4npv/QwLGn
 rTm9Fkic42ywqAQIa9iB6afQAgEbMeZ7wiuhCkI/u4WttSSy9EiyW/Ml+p4MnJSktJRR
 h7PxGXIk3aRe2rjjA8WHskOo16Qkjf6tmFHlcfe2IEZqH1P3OhKKbKEvgx6KYQxqYDV0
 nR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8ucL2pA34zxj00xR00xsf4UcakWKKM5JP1tJndqbMQ=;
 b=F3v0HvYuZWx1ierN1OOxlaWVwFDk4xHMM0WsHt9UunQhYRVW3rw39BoaTAudMWtjMG
 CGsrhqN3e8rc3/y7tWf1bTBNAQIuVVgNWAWyEfCG3rxeBwvln6BKNaoFD56JwGE/DyhY
 hLLo1td7dK715hh/yYIGo4EgzjfuBlDs8QSUgA3KWQ24z2HQB37v2il7mypf5Uo8LFBX
 8lv35U5AkdebfAXqL14UyfQexpdib9I6n7S9BFzx6qbD4GMY+RALoMQVPt9jVRMBh7Wi
 byMIcw2tb+o2z5wf1V/EA5wY0nFXU1w3Rvzb5+/TsQR8qJLnmd13C55ixImPrs9talka
 IKOQ==
X-Gm-Message-State: AOAM533pAlYS/bJUVrHaOs7A4ezB2XoRIO3aCorRv1QgMTSg/i+cpDJ5
 NTBJ/76U349s8kosu6h8A+r/Lw==
X-Received: by 2002:a9d:68cf:: with SMTP id i15mr2428556oto.255.1606839105887; 
 Tue, 01 Dec 2020 08:11:45 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g6sm36393oov.19.2020.12.01.08.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:11:45 -0800 (PST)
Subject: Re: [PATCH v2 26/28] hw/intc/armv7m_nvic: Implement read/write for
 RAS register block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e3d8da6-0e0b-a064-85b3-895de539fc08@linaro.org>
Date: Tue, 1 Dec 2020 10:11:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Eqs0v6/4psBx

On 11/19/20 3:56 PM, Peter Maydell wrote:
> The RAS feature has a block of memory-mapped registers at offset
> 0x5000 within the PPB.  For a "minimal RAS" implementation we provide
> no error records and so the only registers that exist in the block
> are ERRIIDR and ERRDEVID.
> 
> The "RAZ/WI for privileged, BusFault for nonprivileged" behaviour
> of the "nvic-default" region is actually valid for minimal-RAS,
> so the main benefit of providing an explicit implementation of
> the register block is more accurate LOG_UNIMP messages, and a
> framework for where we could add a real RAS implementation later
> if necessary.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/armv7m_nvic.h |  1 +
>  hw/intc/armv7m_nvic.c         | 56 +++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
