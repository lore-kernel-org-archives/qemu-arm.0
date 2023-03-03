Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1340315ejc;
        Fri, 3 Mar 2023 09:28:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+Y4181cqmtKZi/bnh6PmooxlIx+uLpss9OyhAlfosB3mJLIB7B5mvcsWX4TyO3PTXZzmf8
X-Received: by 2002:a05:600c:3591:b0:3eb:3998:8c05 with SMTP id p17-20020a05600c359100b003eb39988c05mr1819811wmq.6.1677864500195;
        Fri, 03 Mar 2023 09:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864500; cv=none;
        d=google.com; s=arc-20160816;
        b=I91PmXCC8V+T1rbF312NFTvnlU9iMrywL71bYZ9Y1uczjOOlwzsJmV6zHzgTke2Tbr
         GNpbbuKL4rNQT1tk9YAecuIVTOp7IEzigxs0Dh56GhQy2TcYpyKjoPBp0F8AF0RhIHJh
         oUyp2fXXpnLIQsF/nxvM3ZVWhyKtqywxkAaz/46IgDMssZH7WZKV5gupHhooZHr4GR1i
         lFq0D33TF3TTOERla1xpZub0G7WZfTQiPkqtlQfuVdUqFqHGwqxZI+tHNEtdC7SoPWFM
         wNDvuO91PXaUdD5EtfMIQdALXyQKbZREXCHD3kuYzGxmVjColO5z1ke34wic67nTI9om
         cq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
        b=cB1lqcZZuRqoT4HDK90OVz9kqXwGLRlq26aaQ6D6FbOV/+Ta4kucZ8pB18dkOSOMoJ
         UhEbk8rRpOL/82in6uviDsjMCeblJ+Kjfk1JsM3tcdde8gEiVS650YXLCHG0F2inYIuJ
         B/b6tdlsnePFOJXSVwfpeabskjG/ozL8Q6Uax0rH66TxE1L3RFRPKwpCreYZJWBsKF/N
         3QXfYIkwLw8CKPJ5rMI0vQ7F0gRohqP4nOSSMeuAS2OzxulnGvtuomZVhNGlcT9oH0k8
         EbH5LIOQ2nb+FYOj94gbmKImVHkWM2SZ75SA8wayQHyagnBFxSgMUeZi1orXi6Xxy7Lq
         mnVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dqe9Wr/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y25-20020a7bcd99000000b003ead4834920si1986638wmj.107.2023.03.03.09.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dqe9Wr/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9C8-0001iU-N3; Fri, 03 Mar 2023 12:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9C7-0001cn-5J
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:27:47 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9C4-0006aR-AT
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:27:45 -0500
Received: by mail-pf1-x430.google.com with SMTP id y10so2030197pfi.8
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=dqe9Wr/0rmE64Xh4Yh88Z3e9cpBEwQtvyuIgUVKevqct1CNJD97nClsdlKWVWM5bqL
 AMy2A3k3BhQTXw8Xd/mcdQZmkedJIPma18eTQITDXR2UrL/++lwc3xrn3xjv8fVQSJQl
 PGfz2yV4R+7+xqFLNpHCCK6YwTcMe+q7Np4Ul7XqQRmgjiBkDaYAycIIb0EcoP2tNC9F
 zKTDZj5OFsX+8cJJ6Dz9hFHL8nyEjfxnFSHCiKEakc6u0f6Rfu/sGwaKWIC+e2FFzGnL
 pXYoM90xKp7I5rZ1qNXNbhkFwxfN1wZJqRrQxO5JfIpvV9V3E6rHFfe9GL/m3HhuhWrO
 Zj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=emqjjXsnKYOVgtw3hN+jdYCUgBnYkC5aVn7R1sMpHNtlFmTjEVLpDqrkserikNuQbq
 kSaBLroNQajJNgjAXfNqsUBITUO/uIacLmbRCFthzEK+aIqbPiTuSl2+hPtqBvcq0Xoa
 PSsFnv7/rMUTe9YPnN8lD1+dqIbpkhOyVkL/OtMznbgut+NWzo4bv+K+ww+GcQwS40YL
 ESYiSD5z9uuBWBnL7QKuIj6dm7WsDYckNgWLQ8RjYPfql0JaC5uRxWCkPfIK6rfyNFpu
 SncQ2cLbjDV6mFB4weu36xv+I7DlYlGMe9eDFRLNBqDxUhS8vGExHRuXYE/mVhSgR1NT
 isSA==
X-Gm-Message-State: AO0yUKUFYVmGCf4TTm+Shy3lQQgaaqbQhkewLv3BHagsRxAx6GRk0SNK
 Y+M7UDi1f0tHD8b6FsdoewxLLzw6ddTcomt03hAZWA==
X-Received: by 2002:a62:ce4e:0:b0:5a9:c22e:7764 with SMTP id
 y75-20020a62ce4e000000b005a9c22e7764mr1200776pfg.5.1677864462740; Fri, 03 Mar
 2023 09:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-4-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:27:31 +0000
Message-ID: <CAFEAcA9S1kr8rJwgM=qxoSouBhQ+q_cHoUVmZLFBtuTd3YqHGA@mail.gmail.com>
Subject: Re: [PATCH v2 03/76] target/alpha: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: cqTZUzzg1W+z

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
