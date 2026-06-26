Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2722BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:01:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6Ag-0001xY-Be; Fri, 26 Jun 2026 09:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd69a-00019F-Lv
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:59:33 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd69Y-0000xX-4t
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:59:29 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-664a09bc459so634634d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478767; cv=none;
 d=google.com; s=arc-20260327;
 b=fC8jUXyg7qccb46tAKuXNmqWNLSwqZSmqNFGqhW3zbMFY32+lQKZMF/+EVTDtYYLIq
 IEl+u7sxRTpd3kQd3EhAIYxs50rqpjHb4ZHhQd3qk6bRdOKYy+fV3h9Lmtsa4wy0rKfO
 7FMBpiJ0ABrST1BKH3bKLoQvuF0htelK8ouoSStLTldxOE0TAeLSufBJBYu2UCjvuDVg
 +uVQ4Pzl/kHgw80jaDqyEqoQlUXcAGHess0i1JJQi78L0a2r5SOvCvx2aSpGhKznm1pT
 7hq3S9VLnzO4gRdpNQfe1qtWI04LAz7Nbvai4fDH2oGIxNVcdrSMGCk3Txydrg7aOJvv
 XoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 fh=TLlfO83h0hQMgpGHyEqFtcki97TJT6B9Qjh3Yfb4+KY=;
 b=aytavXmAZaXnmLyHYfrTcrnF6lv43mC8EUUgvg42nBdvtj+b0nH5kzH874xGTh7tGW
 rk2CmuQ3gkUS1VrmaDYcIWsQ5FIPkG3V4tAqGavcPW9gc4lX1ieweMDCx7MZitbsc7S4
 Px1nPn/0N2VZ3ILzJ0ZHvtbwXDTWDTFgR1QDyfiGv4vM9H1gccKaaSi3hqLWi9j39LPr
 1UjCmr5JnHDfts9cMjcZPJA2OJxqt55ycT75Fp8nEgWNSOM0sA5d3birexDFa+UELijY
 Tw+OeF4/IywJEXXUMJjRQaMchFxpETcgDa3dTvn/M1RIO166u/dlK4eNa5gtpTPmvwLn
 hTLw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478767; x=1783083567; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 b=hz8yJyqgtIg0wQlJ6zHEplek1ZdVZ4pHn1Knx57aBabxKsCo6oZN8OANheq0akynWs
 dBAVjZW5lmwSC1Xn0CanUdN624qm6ixhqeBqqm+52ns5OL1BlXI5Ul6ZD10lw9M4jowA
 Uxbr/PI/ci7pzSMwgqqv6S9ukZ8fIKmOdSzigtGFG4GVMFsfgKa1jq27HAG9QIrpN37H
 X/UO8f/TXEvpA1zuzlXeMUCUfy0zcv0fRatRgyfm9PoqniaBHFreX70B1Uu9huNU96Ha
 BgaJjY63pUSAfuMKpqo4foGJMU+alSHsf7sjnBkSa8b3TbYbJWL1g8b+s1uEiFpeMiFT
 Zw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478767; x=1783083567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 b=CVzefr0SONvPtV9i/nWMYXhfrOOwA5LzuYtxVvkRRLMGoh7HpwnOobQ4pscWenQKII
 5BVDj+opzWoqnDGeg7pJm+c06FVuCB8fhkcmbI6slQFLep7T2fPCgkX9jJdnfIrhVvuL
 JmtvA7QZJ+iDZ670TMMOtdFnBKIu5retTb/95DE27/i3gO9OccG9SQxLCd5JZmh2ZMMI
 sv4VezFVI6u5wzgw/o4jK9A+OxC0tXGSLS+47r8byX5bGBvu+5kBX2QpDOvlIqJdE45q
 vsh4dbhS+ELwyuQGFmfqtksQkUPz1feFflpgCFRHuvgeSpGAaOykkdUAgqgGeXJNSFvx
 9DsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqbz/oDGhCeKpfzCET2y3sY+YV2FwaVUyhq9UAe+szyEllVcjRv1tCuYi8ucFh/zQylhQLplpyoEw==@nongnu.org
X-Gm-Message-State: AOJu0Yz/tEio9Mw/rMRi2yld4W3+LakrV/3mqVvWZ9UgPmMAhBHOucs2
 7KinNyHCTAsCm+IyDhsCpwjFP3D6ldCa7l1RoDKiB7gu154p2n8A+ntcdW5qhlPUqEY6mCLFQLs
 VLR0V/PUTAjpOrsdHuGrCyDSjNwyaEH5IMKY2ipSE3A==
X-Gm-Gg: AfdE7cnqPPobSHEd2MfqHzu+waQZfJ+UhKXJFYYs3ihTf2FY3QP7HWdv0KVLKxqYhXc
 CgrngG9+HDWLol/Dd4lA3JlQrQQsaoPYLso+eOKEdT6k820q5wj48afB5PGK8LfpW1aIVhO6sDj
 3OySx78CtxC3wdr5sLrUYkDQkqeidebn/uOZZb0Qy5zaT4cuMmAny3rVvp6yu4BQKF/nLxknFWb
 i0FYTSdzwKlM2LW/bL61PXhb4HLoq43L0cf+IJ7S37/lYDJchmetTJRifVLVai6PLRisRNKjZCU
 eGr6co8V5zxXQ185pYED5aQV4MW7cgfoKvHuvxYUmIwiWPFtkWHAxDZn
X-Received: by 2002:a53:ac9c:0:b0:660:36a3:b23 with SMTP id
 956f58d0204a3-66487cb1a7emr5369635d50.21.1782478767090; Fri, 26 Jun 2026
 05:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-2-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:59:15 +0100
X-Gm-Features: AVVi8CfrDJphaSmvzZ0eHXt4XtBQ6fwnjslSQcdVgNO7YKMJv7m-hBsF9c3OQGI
Message-ID: <CAFEAcA8rCUy3S7AtqRHh5BkqeFAWai1odN-VMfLOLJ=rsb9hAQ@mail.gmail.com>
Subject: Re: [PATCH 01/15] target/arm: Implement FMOP4 (non-widening) for
 float32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 25 Jun 2026 at 23:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

