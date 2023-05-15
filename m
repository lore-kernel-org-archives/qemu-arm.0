Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6326286ejq;
        Mon, 15 May 2023 00:09:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pFtRg69/QT2o4rxO+A/brx9pC2jCqSM790n0PO+y689E8dgit3BMXwWStjoFT71RahW26
X-Received: by 2002:ac8:5bc9:0:b0:3e8:11ec:620c with SMTP id b9-20020ac85bc9000000b003e811ec620cmr53526726qtb.62.1684134576098;
        Mon, 15 May 2023 00:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684134576; cv=none;
        d=google.com; s=arc-20160816;
        b=dNWsdAGZUPc52Oc0+n9h1SrNdvY512Dbp1XQjPO2BUWrXhCEUKtAHBwnvFMksIkgGk
         wkkmQbbH2l3zP/U4G8+kLVMF0yq6sYEgJax1iy86rY9gMOuTfOZN9I3UvUhT0zQS2J0u
         4T0iUM4hYy570/tSpwqa0s4Nnmx7L6qZS/DgoWSzCeukCWuvHehnXs8I3Gtu/Q96WMDB
         mbw+zLB7lu6jah4PphwnNrPLBTJbKhwdj6ngD77gJkUr7UjNA8l3XilbIAy0Coed6ygd
         ax84YXz8S+n0URrqxA6LrTtSlH30y5s92og39i6YePBnAkBoPNgU8O/nyn2BoMi0gUNy
         3lBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3TiKq1J8IY0O1HXOuweIKO2GcSqXLJr9CSOV6xyifKU=;
        b=Rxob/ECkJxPU+UcI8rYg2kXTSt6+ujcOPWTCiT6ua+1/duEAnr9d5PUgzlF51kM8FJ
         8He1DfducKNB2Dr/+FSeUCL97CK9rbQkGkxM9JYrUZKNj0rCNxRLpDInOiLUytSwz6Ni
         IaXHdSCeO9L11nr53N94ZTCZ/Dt4JCz+P05YJPuRnwQODySQOoRV5RQT3jlqi/4oZiT7
         2dj23iACPy76sagwSpY7AajibGALO2Lcq/FlsfPNqsFx7Dvk6/sDmQBfC+3px6pf03wX
         fQpb+wFaI9ZdsnJOSxyR4K2Aq+Oi761ZjnWkNyv5nk/5pL6XBnmok5I7rrEtfItazmyf
         ZD2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4zHuoNQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020ae9f014000000b00746a86ebd9bsi12426476qkg.614.2023.05.15.00.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 00:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4zHuoNQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pySKj-00027b-KW; Mon, 15 May 2023 03:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySKe-00026n-MP
 for qemu-arm@nongnu.org; Mon, 15 May 2023 03:09:23 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySKd-0000aK-59
 for qemu-arm@nongnu.org; Mon, 15 May 2023 03:09:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso53219905e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684134554; x=1686726554;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3TiKq1J8IY0O1HXOuweIKO2GcSqXLJr9CSOV6xyifKU=;
 b=p4zHuoNQdtjg/Ro515Txj0E5Az8hhdRAQQf68trgMijhenQGsx6o4RvtcKdZUBIDj9
 NbzrkV0YwM2UgdA5ouSPT+b4AtciI+AWVfQ0y1CgOmqJQw9amNqxtccGGbVnvaa+N6Pu
 zRq+ZmOYMr7cja4HIRxKUwMGSLYfni/MJYyEjAo9ihtcYym0Tg/QZ1PjioALmiCQSzPQ
 on9gX/FoR1XTpwCsC66bXwT4X+Dyd49N8jfpeG2Js1JlyniQJ8GaSMAissFqzBf3Qu80
 RJhyj+uql3I3kFeRtQpPuOIS5esgunw4tYSBSyzwIa4ebosxdSScWFCOFc2D7szu4g5v
 tbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134554; x=1686726554;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3TiKq1J8IY0O1HXOuweIKO2GcSqXLJr9CSOV6xyifKU=;
 b=UTQpy3/GHQ9WE6J5zqx2CVg7vknJfcCg2B9JlMmRFvw3vyz3h72ikcQAT/Vw3EMhJ5
 y8LHfuW0vLZwXcwla/z0yK+X1UoQsS4VOp+gFKZsGQsblFYl9Rkuuzz092PHtk8ynSiW
 XxaEMi935gzM5FElsBPabb1a5NWzP6ALYXqTYAMXFXl7mQQmFMTE1b+hpUKnQyLbDfDy
 U/6sQt2rpRJtwJamsIHTRWUaN2WIQOZndizRsolrcP1ckoOyiX8ZSS67Tut6zDSbXFIy
 bQBarvI0anjpOfesIjlx/C+cW4MLZTRui6SeKLBf2qmrP8tkiBYWo6tI2zofk/x+0VFL
 qBnw==
X-Gm-Message-State: AC+VfDxa/LdMUUJ6+lLRn1uK+ZAsW1E+yyugyHiKaDOzngsVGek1TXXs
 tL4pbd40AawUWX3McXxpGqF3xQ==
X-Received: by 2002:a05:600c:2905:b0:3f4:e7c6:989a with SMTP id
 i5-20020a05600c290500b003f4e7c6989amr8599785wmd.32.1684134554025; 
 Mon, 15 May 2023 00:09:14 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003f42ceb3bf4sm17443413wme.32.2023.05.15.00.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:09:13 -0700 (PDT)
Message-ID: <75a51254-55fa-4030-baf5-234bad51d97c@linaro.org>
Date: Mon, 15 May 2023 09:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] hw/arm/vexpress: Avoid trivial memory leak of
 'flashalias'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
 <20230512170223.3801643-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512170223.3801643-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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
X-TUID: kNddZvLfFk/c

On 12/5/23 19:02, Peter Maydell wrote:
> In the vexpress board code, we allocate a new MemoryRegion at the top
> of vexpress_common_init() but only set it up and use it inside the
> "if (map[VE_NORFLASHALIAS] != -1)" conditional, so we leak it if not.
> This isn't a very interesting leak as it's a tiny amount of memory
> once at startup, but it's easy to fix.
> 
> We could silence Coverity simply by moving the g_new() into the
> if() block, but this use of g_new(MemoryRegion, 1) is a legacy from
> when this board model was originally written; we wouldn't do that
> if we wrote it today. The MemoryRegions are conceptually a part of
> the board and must not go away until the whole board is done with
> (at the end of the simulation), so they belong in its state struct.
> 
> This machine already has a VexpressMachineState struct that extends
> MachineState, so statically put the MemoryRegions in there instead of
> dynamically allocating them separately at runtime.
> 
> Spotted by Coverity (CID 1509083).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/vexpress.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

