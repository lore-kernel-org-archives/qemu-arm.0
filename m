Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1773149lfc;
        Fri, 28 Aug 2020 13:45:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCFqPi61hX59rtiNmxUWs1vL2UHfXmapG2zyAayq8/MEcmQKQiSwmeM2dPQEG5fszapQpO
X-Received: by 2002:a25:aa72:: with SMTP id s105mr4672435ybi.463.1598647552114;
        Fri, 28 Aug 2020 13:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598647552; cv=none;
        d=google.com; s=arc-20160816;
        b=zNMOhl9pIzD+nM8okfUJhnulE0r9Y0ed7u/+0QZTtlSAAW9b+vfyINjsYeXtc6wI6x
         paYqiaz+R9ax2nm78jG/pienbKS8F+wiNQfA79w2YjcKztR+WvcLaXMcMFY8BtQujf1M
         Om7avcepTnAyfQqZovyLFH++9hnbffmrYp2vJBl4mW2MkPAAse8jN0lfluJlBTbATR60
         Cx81x5qXzKKx8THUbimBlERLCoab6R7f6uGM4v0K1vHtRRj3cZhUI+CKr7rhrG8Gm4rG
         rtWgeVUcHyDHCOmgyEhKf98VGzQqLNyNDv4dVE6xA4iR8oDqxVzcINFL0UXhRe2N+TTD
         j08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OmqsRQtTXhM6bGO6amKdqqdEAbO10Ga7F96OOZZfOcA=;
        b=Pag+m4aOlgBicxfTfKeRK30MOOhtKfwCwvZNjcIXIJjdd9ZwVfQpUhKXokG+Zuzf2O
         zK2sdfuKbEdxQ3Zpf+IsqUmxuJa2A0YOhaUPcBGicQrJNuR1olmvSHSvBe22hUlNISwJ
         D/hhe91DWvUGfKFOi9+MhluHfb64B+qmoTefIJuOQcpHVlJ/PGdLh9O43w19vSgNL6ds
         NM0P+a8eHQ7jQaKCOYKQSrzfBiq1Y/ZUGrQo858p00SZhuGw/Dxp8BSzCEuC+DYKHHxL
         s02LWsoP+2Tu1ojxSWXBNvYZRb7uX4Tnvc7JCxZF5WEHZNjlJMR4HpZt7hGi6DfFH6pz
         bxqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R82+2AAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si370619yby.495.2020.08.28.13.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R82+2AAO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBlFv-00020j-Ef
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlFU-0001zQ-CP
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:45:24 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlFS-0005Im-GZ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:45:24 -0400
Received: by mail-pg1-x544.google.com with SMTP id p37so996857pgl.3
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OmqsRQtTXhM6bGO6amKdqqdEAbO10Ga7F96OOZZfOcA=;
 b=R82+2AAOL6rO83syfVe0Kkph2OzoKobmYfnPZvd6EFchD38w0UQCO0peWNAEjnxnNQ
 lDffFP0kI+DKAk4xIoYEutDeIwOBMZ7wKYRo2VPVVkwfdPO2NTsG0Uhck+CpNvEYTUrR
 kSszSstJ+whOwESg0jYQvpGz6es7jfRjGwVOyFezNS+cQeCSWjQpAOTDOiajFEysAKca
 CedHaYQoSSWA7+j3Vh5J2wBH+jSt7G3TTUTHwWcT6jcPJFEO8Fij8HMYFa4N47Ut2rhV
 tBUGpOhPR0VOgt+m8lcy8084tUs8HVfKXK7lBNkaoXLvPBwtXmNrgihbeZQlDxNEURcF
 Rb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OmqsRQtTXhM6bGO6amKdqqdEAbO10Ga7F96OOZZfOcA=;
 b=IZg8M2qqMK52H4dDE1K/1dOQG5MJkTgr6idmjEf1lH2eQzMpZwyZ1UxHBaa7Bi827+
 L/KEqukER5G8eFXR6RyuU0OH1LCNtnc6bKkJeWt02lEPzsIJvIzyenvXI27k7hhbnuw6
 iqN7sW47+69a74nndho9vJjNtlqJ3YbeetHC+crEzJ7JsObE+qJn4ZDH5ZLdXhfS95z0
 kLsyZd74eWrBroy8+YZmDIFkN8TgLhdF4DdwNyXuYxq/nlTRzz3ZFmWzS5mTUrdGUYkA
 t+8W8xBg8BjhQtf/9usPDuUwlQruU5EBQv36wlsTdpUfgYQCQtfqp6DetIvWJvqjRob0
 b4XA==
X-Gm-Message-State: AOAM532Yh05rZ6q4S9sJ9+EalVfELuJgqVZdeyh6Dt0ePplFySPcJ/KX
 6EQ9sU5RUENwCiPQC0WlqS7gkw==
X-Received: by 2002:a62:7bca:: with SMTP id w193mr672765pfc.152.1598647519689; 
 Fri, 28 Aug 2020 13:45:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e17sm306982pfm.60.2020.08.28.13.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:45:18 -0700 (PDT)
Subject: Re: [PATCH v2 26/45] target/arm: Implement fp16 for VCEQ, VCGE, VCGT
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <725e1cc7-632e-cab1-19a4-431901cef51e@linaro.org>
Date: Fri, 28 Aug 2020 13:45:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ax+/JLcJq9YL

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon floating-point vector comparison ops VCEQ,
> VCGE and VCGT over to using a gvec helper and use this to
> implement the fp16 case.
> 
> (We put the float16_ceq() etc functions above the DO_2OP()
> macro definition because later when we convert the
> compare-against-zero instructions we'll want their
> definitions to be visible at that point in the source file.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  9 +++++++
>  target/arm/vec_helper.c         | 44 +++++++++++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc |  6 ++---
>  3 files changed, 56 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

