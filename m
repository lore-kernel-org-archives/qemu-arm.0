Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp975311ejb;
        Tue, 13 Jun 2023 22:01:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+TRECnpg5IoN3w/fSebboIrUs7kVLmBdq/YMfA6LLi9g/JC/o0lDifPocGkdT5nt9Ge/t
X-Received: by 2002:a05:622a:11cd:b0:3f4:f210:95a9 with SMTP id n13-20020a05622a11cd00b003f4f21095a9mr847466qtk.64.1686718902960;
        Tue, 13 Jun 2023 22:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718902; cv=none;
        d=google.com; s=arc-20160816;
        b=N1xnN/of2jZAy1dtg3PcspCgcs2d5AJdiJfhPAl/I+Fw9YU0YOx8BclIaycyEZGK8S
         l4T5d+9reGK+Lmngdjlc7TQimJof4kjsp+aTY46fN3sbX/VzjJDcAz45qrl+jmcPhSQL
         /xBBtorZnWDbqZ3911NKLPuvCOCC7cN/sPPYkQnoJAJUyQCeJciesQqyuFZzzpkrvuRp
         BdZNhVsZiDH6QOqSCvOdSGO9eLstYzXTJasHJC7c0WuckcQn1Nja56byFEgnxoa/cL7G
         1gwGvVoxs51cB/GsfXn0cZe7FuVK6YCKADaJxGMQjmnpYK3txZ5Ek+C7/yodk4I9U6z1
         jY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rIUbRwPXyD0bCNaHCt68EH1wEvTMGh1zBWnuUUIDOLI=;
        b=hI5ifWNZc+rHlHs8oTv7hdSDx05M+GohhwfRGSwxWktVWvxbQMGC/nxsngRwRhlyiy
         O8+J9RMyF9qZxfoOiSqTfl93Su0CF1SrG8ZbdZR/nroW7rd4/q1X7qJ4svF4ILZdBQyp
         dxpJOdw9dKfNI6rclNH+ywspJp6arcubmlV88rKssl410S7QCu/vR7Kbo3RfANaqwRKL
         goSLu3vdlHr3DSGSl7JhZEAMwU7sm3vEvUisPzVhR7pgYg1xxKq0+OD3r9wMG1J2Ef+0
         RKBfDg5xbo6WhoN4pK0dYmGl2e8buMayxYp+EnfN+aLoyWajxsMM1284I0Cbz3+0wXWc
         rBEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JsU3aymI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a014b00b003f9bce26440si8284690qtw.422.2023.06.13.22.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JsU3aymI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9IdF-0007vK-FL; Wed, 14 Jun 2023 01:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IdE-0007uo-2b
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:01:20 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IdC-0006ZR-AC
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:01:19 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f6195d2b3fso8046517e87.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686718876; x=1689310876;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rIUbRwPXyD0bCNaHCt68EH1wEvTMGh1zBWnuUUIDOLI=;
 b=JsU3aymITPnHNLv5vXK9gwl65mjHTJlQO+W4cYisuVnF4OqVmbrF6Msk6V2bfkzrqM
 +xeuVTOva7d1yvlsSp0VVhqvZwOhtmMSkslBD9npNPx4tjgksCOCcWCvKpgqQCqpgPuA
 oNstthbqpkovMV2HHBe8n+fPH9T9kkNXki4STE8kIPAOb1c5i6RdcA31c2aa2sUVgGTG
 6MLs9w7pE8Ph6ATCyngJVZMvVFAJ49ZwMAVpNve8Y2CzCj8X81ZY5C0FlepzYt19sv35
 2os0ATuvtiLJWUoQSjKcq/pnlgBu43XGfiaGNQupCHC6JTT8qpr2jThcnKllqVML280a
 jmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718876; x=1689310876;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rIUbRwPXyD0bCNaHCt68EH1wEvTMGh1zBWnuUUIDOLI=;
 b=jjiBV6RoNYYAgtCdQXuIaQUQUbjoWgOdOOJAK5rJFUTCkk9Igi/Y2E0oO5rnek8u1O
 DvoCVpXj/HWBiq9fiU0j1I9RbBzlj8Nx76UpBXVIQ9W0oJFvNQFuQzLpjRqbsEgbMqJ8
 Uhdu+c+51hRqYWRg+DgFo6eZESgUWgcbedDEJxS7bZbqM3rVpB57R0cfDSCw8zosUAvZ
 0LmNoUE+msS3aVfh5LbFa4te31O00mEmUoAhiwmFxWxUu4tDFJ9n9VuuK5DPTt3ZDLhV
 TkoBBfQHG53rFUzIZX4LzU7lmWCjsvYHAsxkYk5ovvDOFrKvaoNa8Tqel4hflVGByXmF
 5mWg==
X-Gm-Message-State: AC+VfDyML8M1G2Ccnka99JkupmkEwEbcOh6nlCPLVJ6Er8CFj6f602fm
 RUV8f093lYDENE1MZUfPR2aE6w==
X-Received: by 2002:a19:6749:0:b0:4f5:c86b:97b3 with SMTP id
 e9-20020a196749000000b004f5c86b97b3mr7151073lfj.1.1686718876399; 
 Tue, 13 Jun 2023 22:01:16 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 b14-20020adfe30e000000b00307a86a4bcesm17071019wrj.35.2023.06.13.22.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:01:16 -0700 (PDT)
Message-ID: <82a922ac-2c1f-97c1-2949-565add323688@linaro.org>
Date: Wed, 14 Jun 2023 07:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 23/26] target/arm/tcg: Inline 'exec/helper-gen.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-24-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-24-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: w6nLlzT6iaka

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/helper.c
> @@ -26,6 +26,11 @@
>   #include "qapi/error.h"
>   #include "qemu/guest-random.h"
>   #ifdef CONFIG_TCG
> +
> +#define HELPER_H "helper.h"
> +#include "exec/helper-gen.h.inc"
> +#undef  HELPER_H


Why is this here?  helper-gen is for tcg code generation, which should not be required at 
all in this file.  I can't see how the modification to translate.h affects this.


r~
