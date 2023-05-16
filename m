Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp300746ejq;
        Tue, 16 May 2023 03:05:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cAmBj4nqOt0tyLw0P54lGPAeSuh8ES0Z33Ta6pPq/pPq6fhQtz4eyIMSN/wzXKhSLd8y5
X-Received: by 2002:a05:6214:c68:b0:623:7c92:d3e7 with SMTP id t8-20020a0562140c6800b006237c92d3e7mr1090133qvj.29.1684231545477;
        Tue, 16 May 2023 03:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684231545; cv=none;
        d=google.com; s=arc-20160816;
        b=ScPSoB4jF+ULNx+XOYy1AgqRzFF94Hi8l+rlx1vQkQcF5vvK59Zd9iwadC/VSZ7/4r
         mL1IBYy38rjJZ9/2AwefA9MEY5OgZfc7nULcX7TxKSWs1RNYyWSZQVmyAXO5iGawQPgQ
         hlv/X+2jZLfg6hAI8lGRyQT57UxbNOaULSFk7SiN+4RluOf1Srbazw/xqpchIaTB+zv9
         p8gNY/vt0m1RWGpTfk8tT/tcaRceMPEWPDxyzCRsTrW53RSI05R5+6fZaxkhJp6NUTMX
         13T5Lj17+Bq2aX1xrwq3Iz+jxoNf0+6qcp8/bxmZPzOgRtaX06eg09ye1RZJ1LLLyM7c
         NHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QzxgDcYwQp88v2YbsYtCLeF15hP9kQIN6nEJJnHCTe4=;
        b=tHmf1/0tGYLvQMGHcYtVWySfMOZohhF+7D2imxBKIrk/pnAnuV/utJjKENWE1JjU04
         GaftvrjSLVsG8QLEp8JRTQ4TJWhL1cPUEitwKhuZg640BxWmo3yR9XscEbT1UMu7hAMk
         ej3qofBWv2vSZ/nS1kntsGZePt+oP8Fsj5CZEpV0UGy14Konrf89pi5E3g6vxhsOBqOY
         ZLSyEe/C64aoSDgCrlNmaNJclzymxl69O8+eyayKWaJEQVsjFh2oYkUJHiezkaixFWI4
         xyDavqjwfC7VYIjUccMwRpu2/223AQuNNdKqEbc3lvbtfhfXXhf5CvB3GrZ9aLJZpsLJ
         oAbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x1t9D3vl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq32-20020a05620a612000b0075789b5b895si934741qkn.4.2023.05.16.03.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x1t9D3vl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyrYb-0002e4-Rm; Tue, 16 May 2023 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrYa-0002aj-M7
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:05:24 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrYY-0003oe-Ch
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:05:24 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510a59ead3fso53876a12.2
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684231520; x=1686823520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QzxgDcYwQp88v2YbsYtCLeF15hP9kQIN6nEJJnHCTe4=;
 b=x1t9D3vlq9I+g4TfXU6j2z6h/droLBDqntcLRGTmnxobM4tz/IuqjeH3bq9jAWid5r
 uUEFRsU2ECymnl2jQ9zILm9TOkrMaUNIvtf0UPeKsTYgoJ86A7CPaxywkNQTvfGVFC0f
 /bhGzdskK59rA+2nUHmAHu+CIVcKZ/A2RRhsqTEHfkS+nn0yK2/E8LtF3K0Or1hIB4DF
 IEAbC/UB5CXyTHpOeIExK9c2QBxA3bNPjSYjIdC/iOQqeC0S3juI/+fBCy13e3tkcIHZ
 qWVP0HZWHsCHfyjvqaR8V39dnogheDTFDOf7TU9cqhjO9z524scB5O4mQLVo0hS4ZjPN
 NVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684231520; x=1686823520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QzxgDcYwQp88v2YbsYtCLeF15hP9kQIN6nEJJnHCTe4=;
 b=YLI5ttmVihflDI0xRkG9U8DG6KMhvcbmQP840JFJBR2gNNE+H/GWuWZ7osQ6EsZVIC
 epdph/RfdR7H9+6rDTN/Lpv09IasAjKYIFhDnzpEgEUlijz+mc5qt7BNZ1atau0rWSDm
 tLitKzXlnCuk6c/dVijlmgvE9IA7kBpOyZkd8321IbX/w3HpKxWtbiI8JwOf7AtOXu4P
 Qbi1egdctZqM5X5mY7DB5uPueR5rTSjCJvS+aIfRBvMp79fg8RxajED4Js1eXcDludj6
 v+vBvt1N6a0teipLHhzZ97pVkH2f7Th1pUZJA9qSsvuDfPwp/l7PgJfKDSuiyrABA+K2
 AtOQ==
X-Gm-Message-State: AC+VfDy1mkdqq5076LyxVtFbIC6mmNeQPGS2mmNIZSSYH1IwQ8mOiePR
 q19RQX3DSqLvWruMGuiOBEYQ/YWEvW2ZX+fckix0A/VaWYIQHJaw
X-Received: by 2002:a05:6402:352:b0:50b:c804:46c2 with SMTP id
 r18-20020a056402035200b0050bc80446c2mr28656087edw.23.1684231520096; Tue, 16
 May 2023 03:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-38-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:05:09 +0100
Message-ID: <CAFEAcA-oFi3Mq6V77PAksyeNfvT5erj_Vwsu6a1xCrLcxei+Fw@mail.gmail.com>
Subject: Re: [PATCH v5 37/54] tcg: Merge tcg_out_helper_load_regs into caller
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 3iWKTSSyPWfE

On Mon, 15 May 2023 at 15:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that tcg_out_helper_load_regs is not recursive, we can
> merge it into its only caller, tcg_out_helper_load_slots.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
