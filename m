Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6738133lfg;
        Thu, 4 Mar 2021 17:19:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwArDFhxp6ZB6lcmzF5rs7yTP6MsIjGI4bCbYnoIvaSvSOZZV+PrF1SwZmv+Brex/TrH1w6
X-Received: by 2002:a05:6214:20ed:: with SMTP id 13mr6638617qvk.34.1614907192339;
        Thu, 04 Mar 2021 17:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614907192; cv=none;
        d=google.com; s=arc-20160816;
        b=qo+VBUxI3J2Z79bsFvGokSvd1eEjgQlwYjPqtjh6mczjDI8jCHj101DHfazlqjb6GR
         cpBCTEbu6UciGvPaN6BWX0QL68an1ZslkHugZWfCuHbtii3LfQJtX3psIvtmLA1D6gaJ
         OsuIGeV8yP6WOgqGRTshMfTy7YW71Bg4bzKpZXWk9jivEkjkOdlcV8xzzH2QLy3q/+cQ
         4Q4c7jvwrnR4pphXhKxx8mxOVROlobtVWQTWpPgGiUt8FiO2iJ0qq6y4i+uRAbisqFRB
         z3m3ZJXEc47VDn1kb7PiSTYytcOr21BLAxBVFhbH3/fYJ0Owc/+fSihHyG0L9LZCJo6F
         ziDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ayLgJnga5wCOs28bIBEz0ril0NLq24vAY9SKwi2x/dI=;
        b=N+O2hkIDELcwU0NJsnMuZUPlIymM9YP8sm1diNPgtU7AcTlxvRjIC759f8Shi4GDwq
         ODMRr6jFNaUZePcWPBkT+cV3CGq4lH3Ocm6BePd5M6NiASeILTt4IW3cpaQOmRN5wDUP
         jnzCzPjKcPDrRdHNLoMVCGa9AK/5k21QJ7+5ANo6l4DJEVMxpMg/3EI/WsPWEgAqQJgm
         z3kBimjt0hI3RX454hSR1yiATIw279wpLGFhx5wASkyeismm/NNijIKibqb6xqe2s0wz
         ULvECngIicydyQOP5ZLOqDbMExzAG4OhSlEsS+KKWkaKWQ96q8RrvKyRROcL/Hmec0cH
         x86A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H9fu/WQL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si644539qkp.86.2021.03.04.17.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 17:19:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H9fu/WQL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHz8B-0002kl-LC
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 20:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHz7d-0002kK-LP
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:19:17 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHz7c-0006ne-3n
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:19:17 -0500
Received: by mail-pj1-x1033.google.com with SMTP id s23so888113pji.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 17:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ayLgJnga5wCOs28bIBEz0ril0NLq24vAY9SKwi2x/dI=;
 b=H9fu/WQLf4/gcCdwLJj5iYrQ2GCZzweX9G0shfE8CTFioAMBSN2OfDUQUvlWbfBn0r
 FTeSvWD3OS9S4/iRFOccTqkvzfN2VDSaLU+0wyZY9iILLdLZic4SM3H19UajciAy4X5d
 y2eEYikCUZVer07oF48V0baQWu0im0DnaLpQKutOW6pHZ3S/HG+KDHeyy0TXVs9a1BJ8
 BKuYRHJy9PsOpPibvdhNI1WxM5fus8y6EMuffEYzOPPVRqGEH6TQ3xAOGbyAPEk749be
 bh2pVkM46mHpMQ2DPCPi8FHnlYKHZKgMmP1DdwnPAX3+O50J0KfT5x9nfomsbelEsFiw
 lKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ayLgJnga5wCOs28bIBEz0ril0NLq24vAY9SKwi2x/dI=;
 b=aqOvj7Iv3SfgYNXT8Un2AKLWjbVRJzfXc/t8LyJacYsGTQ9+UUuWDrRvYEv1EybFfY
 BWAUCCdICFw4/GmsGf/9OaKHkkauDkEOn01Sv0SWwHLJmp7/etwmL+YJUZeJTMkDXTVV
 Rl07+86fZzf72P9uxJUgfAloOgh9GkYnKzovO8Kz3vHRDFXbIutC1EBAakG6d5YnBqY/
 HmMKcGnsQ0D/tt0BXK4+Epoo/FUE/ZZh/V4j3LLRdROicSTVmKsxUDY1hVlUgQurEp9V
 D++QsqEQVswfaoqd52PtppanMSII8rjH22GBe3owyAanBddgdAeMjANze8lWFGRwSVpZ
 t2lA==
X-Gm-Message-State: AOAM530j4g/2bYoNErZ+tZtSPBq+lPewBzxZCLUeSCM16zYwfFjNfQqw
 ILeOaj4sw15IB7uth/if4qym7A==
X-Received: by 2002:a17:902:d893:b029:e3:f3ce:cc6a with SMTP id
 b19-20020a170902d893b02900e3f3cecc6amr6631812plz.28.1614907154255; 
 Thu, 04 Mar 2021 17:19:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g15sm529295pfb.30.2021.03.04.17.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:19:13 -0800 (PST)
Subject: Re: [PATCH 42/44] hw/arm/mps2-tz: Add new mps3-an547 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2fdfc9b-11de-3b39-94c6-dc2a5e87706a@linaro.org>
Date: Thu, 4 Mar 2021 17:19:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: wV70tSFrrY9o

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Add support for the mps3-an547 board; this is an SSE-300 based
> FPGA image that runs on the MPS3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
