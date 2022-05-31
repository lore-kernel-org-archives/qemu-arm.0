Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3409708lfh;
        Tue, 31 May 2022 05:17:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxiVBCBP+N1bjMrTxApEfnRP904kEmumnfYsDYeKs4Eb7s+0LgFPWGmkvzlVAX8JqXsmK9
X-Received: by 2002:a05:6214:f24:b0:464:3736:487 with SMTP id iw4-20020a0562140f2400b0046437360487mr14096519qvb.88.1653999464146;
        Tue, 31 May 2022 05:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653999464; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3OAhWmad0Tck9STOYRNdIN8fFLXq8FjK+M++MnuD7t38cBTShnfi8RKIcumP49SpJ
         yMgVIa0RHzSa2DLGjqtNb3yM/8kQi9oyifEP1MtrWVfLyFayJJv3JNtZKvZFvf73jdZQ
         gO4u4R/BDqPAIbUTapippcmaMSiIfsgRxpk/XAg56Et82gGtBwPWmWc3zd/UFh1j/tMj
         XKPZb51ZyL5rNMGiD6R7crbMfcUadksetXuFLx79tW5JJ2sPAAS9B2EVKWmpmICVLnKM
         b4pA7vSz9vedyb0svJieV/432w4li5dBrIKceuY0tiOAzZnUXHgHcug8O7aYx0uDiR5K
         plMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KelfOkbq+al07TKUgiaYNmACE0HIIJMErn+5VANXLTQ=;
        b=zoquVE6Z2gXBN7LKaUnQu4X+95XWbZSPXOQUOf/NbqW7ROBB6A+iL4x+oQuBVM0DfA
         hiib6XJJqaJsscDCWpa1jUpTuI0w3XSMj1EVgsPtNedbqN7OONOg2tzHgvOZMpJflR00
         o5oi5YireVXbHnMP/hcvEg9qmGPyj/8jZifLVB1SEyC1hU2mlyp6zlEENFIPWWhadyjT
         0rjEXK4jnaViZj341924VYvgNVk4cM2aK5iiokHqe2f1PcJDV7VQh2yGR+KdKT05eNkn
         Kv2hZD+2rP+asHZAHHSlov4CzCeQNP7mxdM0sLOaPC3XD6JcrN6jO7PntAw+aLmL6tZ5
         yC8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rL45SJLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05620a240700b006a0f9ebb303si10847666qkn.161.2022.05.31.05.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rL45SJLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0oh-0006wn-HW
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0fC-00079u-C0
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:07:54 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0fA-0002RG-OQ
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:07:54 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v22so4944792ybd.5
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KelfOkbq+al07TKUgiaYNmACE0HIIJMErn+5VANXLTQ=;
 b=rL45SJLZKsGhRA8ud8Wdfw1r9Auetvm/kuGQpOG9/edpJ3xuFizJ1GKTJOoMTFjsKn
 VRWxehNOapRyzyJsbsoiJ/kkTKYQO3LimiWWTkG/XhU+5nm4m6fGA/yuqfElpJWQgCJi
 YiTVMuPFgFCJOcRsoHhcMayLpK82YiAlXFvijx03+ETWi50kMV96DAj8jFBXnWEXDmrz
 PDrrQVw2f0/pswLsSfv+W2hj/n0GopAigGCn2lEsjrEOdwKaxqSqNwLTtJ1M5yHQaLjQ
 +YdSwMWnyVikungCcMJQEY6zHxC3iFXvLMN8o0pqc1w18GjebkilvPIa+XwB+9PjC1g8
 FJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KelfOkbq+al07TKUgiaYNmACE0HIIJMErn+5VANXLTQ=;
 b=P7JJB3xJ+wc1MOm/A06bHrp6g1tMSrJ6UKIp4uZ0NRhcz81M9pLEM07GrLviWZ6yvP
 kRo+8cfw9F+9K+L8MPdmbFLR76WP5AX2E1m/E38hX4bpJ9okF2iNkLzNK0O1mzARA2qx
 Hsng7tLeku3NslJBl8A1OV0HZ+5rfUzOqVHALcNQb7GBHZ7evUyMMr9J7bTTHmX0d4nF
 keZazCZ6dujDjXduT0x8uYW13jbo0hPzGqpCkot4ALg3EFrMPoqajGuRIC1hl+rEg4k1
 xJOROg2wM/zdz1oUcEk1hn/6Atu+Wcwy6BFaPntv0sWv5chNCZxwWv3cXAV1Ukyu/9xQ
 2+pg==
X-Gm-Message-State: AOAM532h+F5Fq6/9RI5YbCsQD8IxwhH/5/k3S+FOavjYiUYP0mRbKv8/
 12S27DG3nX3TLdz0tIAH/rcZQFVxTTUnMMcYFaSS4g==
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr42620304ybp.479.1653998871675; Tue, 31
 May 2022 05:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-18-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:07:40 +0100
Message-ID: <CAFEAcA_pFQqZtpqeBLf8htev=sNDEPS1UdJaBonhsPnyO1LVSw@mail.gmail.com>
Subject: Re: [PATCH 17/18] target/arm: Add cur_el parameter to
 arm_generate_debug_exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLW/lSN8u8oB

On Mon, 23 May 2022 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We often have this value already handy in the caller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

True, but it makes the function clunkier to use. Does it really
make a noticeable difference to performance ?

thanks
-- PMM
