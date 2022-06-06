Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1394352lfb;
        Mon, 6 Jun 2022 07:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy//jddxBWmJyKSf2hbW+L6A4KvK3Kop7s6A3Raql4lXRuxeNM9WfRPxoP2030S4YMJt9iE
X-Received: by 2002:a37:b384:0:b0:6a6:35bb:5a31 with SMTP id c126-20020a37b384000000b006a635bb5a31mr16061838qkf.386.1654524451686;
        Mon, 06 Jun 2022 07:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654524451; cv=none;
        d=google.com; s=arc-20160816;
        b=nQZ4KML/p3xt/0th9IeCYKIuuB9wG4gPCyvpGIoseobG7HhnRMmcYZmkaJweGpd3i8
         jos3AJQCAP51OqZVOePx9+b/TLF+3fo1gA6vV2Di3lm1P0MtHiFOADg1LQPWvrJT6DrY
         MZ607sRzHkAFpuGP5Gq5i3OoKGEMlQxA5ndCzvYl4UPonJYLL3ZXw8LLjybDVNOrVe66
         5+kZ+tzVfyV+huM4R2OOA/BHCkjB5hQYTV3cxFbvSVexGGTSuJSqbKx0pxxS197KMbq6
         xKJhbP3TvSrHCDYrVQzFoxq+tYBfIqy/prul+QTJY/W6Jck1R6Dor5QacJ0xoiuNbc0+
         J73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2PG5BLRf+s3MS866Vujfdfb6AgiJolKj9pgt66MCgEI=;
        b=sDVozMNDBqd1QsrG94n7xHxTQe6WzzH5/WGD6rN0hOHtnSqnhnsUYv0I4CTRAewNxJ
         rEs3bh0vm49OynCnpj0jMtJ4wbwSp/jREuAL2t7NL3KX4TPPzFvDm6sb1lfZYXDflO97
         k3gp5P3/LleFDJ5bsf5qmKRwAjdBXrZmSwizE/Kybanxa7UXlHmDAQSkTF1aVxzjbsyw
         abop1HkwaMQlhZ2oSZV4vl2DcipOAjrP5eYAmNakt0+MVnwTPdPDuFJK1pgjZGQw1xW0
         C107PV10GAGs7pgPypushCwggXa9XdBWCN9x5XQFjH8+4DW2na8fsPbQkVzbraKsiBkq
         mbpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F42HkAaT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac87f91000000b00304ee82f25dsi957737qtj.783.2022.06.06.07.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 07:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F42HkAaT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyDOE-0006MW-88
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 10:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCja-00007j-Tv
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:25:31 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCjZ-0002vd-Er
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:25:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ec42eae76bso142757317b3.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PG5BLRf+s3MS866Vujfdfb6AgiJolKj9pgt66MCgEI=;
 b=F42HkAaTfh6Io7wBdebUlkOETz3gZvJtEcO9M7xlg7yhBKPbsKA6KXYEhFo3Bd5OvV
 hThxn5eZRmuai6GTWpwnTg7RQcqyO1mOuSbBLf5whDOiC2otYcDwHqgNO62NYgFkGEFe
 gERPHy4x5DxPD/BR2rekZvpCdPROlE3FWashI96fchp/yAvldySRwRLbUB29IEGaxzzw
 AggxxRNb9+2BLbRRAUbhbcOizoEwc7hSHT3tJ2IbkQfefcw3tUjY76UicDqiwOmdfnPh
 FRWhfHhFQFxAOXi15If758O1kY6EAcAZVELc0sM0hevbkwfrI5HPEhZNGtYuaJ/eMpbZ
 40tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PG5BLRf+s3MS866Vujfdfb6AgiJolKj9pgt66MCgEI=;
 b=CqNCLy8h9OQWpyijNF9vdvjjjPb+g7FNyz4q6UTpHLLVUNw26qedMa/jGPEWKOZDj2
 hKFa7pbz6rIZtsSBGpuAS1X1OF1gkDrxqVHiEYFwISOxxPeE06Ei21xATmuR6Kbnkj2o
 R+Qediv/WrSTxQCOHiGwQI1SxDAYbkgtumPAGY4KyW2KClzy9xmyp76S7p9KYGHGj+mX
 a+kS27+JTdy+P+saXrqR43Dap8VKopf1XRB6mvIpwDsi947ej6VBbckqfoA7eMhTFSyk
 DutmQnINvW4zj+ddbcu1OV2hCZeRBhzkYy2xhc10jryoDofUUWFODPEh7LRe1eU/Rfqs
 yrwA==
X-Gm-Message-State: AOAM530qheauDzWByqFolFUR0I/igNcEuN3CR72H1EBzE/hAbUOn98PV
 XYX9mmHcMazrJLQB91X0H8Zju8WWdfOlVd3K3M8WLQ==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr27184276ywd.469.1654521928331; Mon, 06
 Jun 2022 06:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-23-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:25:18 +0100
Message-ID: <CAFEAcA853A-n7w9_jZ5VgQrLCrcE-JLHHQTcbHmdMiEsyxJhSA@mail.gmail.com>
Subject: Re: [PATCH 22/71] target/arm: Add SMEEXC_EL to TB flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c2cidiRJJCar

On Thu, 2 Jun 2022 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is CheckSMEAccess, which is the basis for a set of
> related tests for various SME cpregs and instructions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */

Cut-n-paste error, should say "ESM" not "EZ"  ?

> +    if (arm_feature(env, ARM_FEATURE_EL3)
> +        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
> +        return 3;
> +    }
> +#endif
> +    return 0;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
