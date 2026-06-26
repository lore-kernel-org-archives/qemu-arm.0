Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF1C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 12:58:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd68N-0000Xy-Qi; Fri, 26 Jun 2026 08:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd683-0000NY-M9
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:58:00 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd682-0000Y7-81
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:57:55 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6647c26a4a3so871169d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478672; cv=none;
 d=google.com; s=arc-20260327;
 b=PMptR//bVgdL1fLrf1baFKq0mc9KyMJ6zz9kn9yJMqCIjCXAJk9tfGvvCSQgaJgI0l
 DJW0y6JDC8DQd3sqhQl6BIi2Mb/YTSPiFrkqSNqgnH5oX8pMPVM0PK78yCz60+b6NBvH
 1bPhSb8EZndaB3WKyEzAJnaULZJr5cRUr8pm0y7kZ7yBmtZXyYUMYw+Ggo5EqcTdxWyf
 N5hPhZ9sTbQ3dgPhCsKw3XaL0gvhvWMTCCfIlYayi/YpSQL1pfJqhNvJLGGYb9KXgvLm
 O5BP37uXGK/W1TN5wJvBL4TMG6JbvVyBCxIzMTWVCLuCFJXj/Tds/xcRCOlQepmfAvl/
 Sp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 fh=tJpQ8RNTRDGt/D+ejaO/dEPyzg4rGWcXxw9pcHFA3O0=;
 b=rMf8+8aOQIxr8z91i4Ou4TSmvzRk2u2GiQD38Az0HFUH3iMnzkPRYyZvOCEoH1ljje
 YRLqGak6aEri58MW4BbRD6rTv0jJb7aNqlLDgvBPhJvlGlmxCmP+4HBp53Wq9whQheFE
 NY5JjVCSbFcpGIfmKuE6aCLhIjoO140m224dwybQ+INF3G9YbTnUWxnZjzYYIZ3KeCds
 SldmmD1BM5mvQB8LRl6fdWyFgQoU7B/tEuxbiQmfplLNUOG7QpLOg8Qq2dc1WAeghYRf
 eJIUsXVz27Q+B3dLi9kNn8P6BW+Mlh4K6pq58U+h8CHylFra5oJE87zSThgx22aHZkpR
 +gnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478672; x=1783083472; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 b=vV2Z6ufXYZynAAQLsXZjqnGdhkXZXP+j1pik3kD4uaZqdiOWZXlABv+BgTuIlbzLRG
 HIWi/8A5j92m5OC2ge0F2tJbwZZiCVawXAFvCSOw5e2KBCzlyGtEYcNHyTDfeCGDAFVt
 o/benpiViEakAEV2lC88243CRSnnpF3ZtZO0jB+Ymxsq4b89dqxtgVoDWLUXPhSP24EX
 I5XWjBr1N/izQVxKbxf3xIZfqg3sSGNEtnGPSI+FeSTVNgXH15GXoiurkTpnMDSBrUWy
 9rE7KTHyrLYBXA589SVAVOsrrohtB2mF7InJ3RzXgT6Zj3ZuvuXWI4q+W+Scgwpjb0E9
 Qo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478672; x=1783083472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 b=O1MEiKEAdsREQdAAVyjOUqluYT5BztSe9hkWHfUV9XYT0PZcljjPmvUCWRepLpERjL
 B0A2OKBAsvp/4fHpqdFNehmowQzRT2CK/ZXNK/CXQk3S2mpqpoCoDIdbtrt05rB0/qpl
 DwzR7V30eJxszmrxIyX9fl4rZbIV0jzf5aUrEjWhOjKxqW6xvD+S6t2wg518UvCZ5Lhm
 kLdp2OrCN5ARrkCSbrt8xHrMnu/e/yT8/UJNzXC83UKyR7Zrh8RfdC41ZXiZetBgSjqg
 hi1HY3v9CZL99DmsJmlNBV5Wsoq1PdN6Hk0piYsjsyFS89J1CNK2GhSl8LNgusv0Vh//
 ESZw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq8Vv2XoWQcrSzEymHE6uUt0w+Nw5gKK3uXnJ5O5TU6eag5hyzDyb5EpF/IFRl2yKfdcsfZMoWneA==@nongnu.org
X-Gm-Message-State: AOJu0YzS4t4jBQYh3Ro27nJt1dRt/1ZZsCmgQkg1cE/pWFBawoL8zZZl
 kf4jJmINTNnsK6in47f3Iw8d96d3txAzyR0G0J8lZ+Ay1n0IdOaGXJbitjfZPbK1+sz1T9N2F70
 7vTWDXZOR/MpMUT/bRrRRLWpkUFJFabKlulHDLaIS/g==
X-Gm-Gg: AfdE7ckXGsy4+QIb6mZoMgXs0/3/Z0oExDJHUuQ5ZahYzCt7VIhQY44SfxLuc8dccmM
 RQyKsSQpmtg6d+8iJB3OA7qNdg0aMreNkbLX+A9CISNT6pMNZoD4sZkzdwnyW3h/N04RmtXR5AT
 3+mXgAJSI7xEp6qXaByxTCHjns73nEhWRmSSqmSIA9flYqKqoy2n5dXlm/zLLb34begk/W2EvRQ
 igsrhAeHJET+Kt0806EH/SNlMBy24RV4yKDh5qwdD2oJ8I+m3/kn1o/Ln9mq2LEcaz2+z+bOAcQ
 6itipNj/i+4jUPFazMSqy6aHhGpCQ0ViLsh2vsF5Pf6b7lPk7+ImdNJo
X-Received: by 2002:a53:ac93:0:b0:664:af1e:e9d with SMTP id
 956f58d0204a3-664af1e139bmr98711d50.43.1782478672447; Fri, 26 Jun 2026
 05:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-4-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:57:41 +0100
X-Gm-Features: AVVi8CfNbgKeeXjYSP2hx2Dm7X6I4uhVgGiBlCawov6A9egX96CXfl0sWqAHgVY
Message-ID: <CAFEAcA-VRpnD3jeg_KWGJ2rdGs9OX2J+8RHVeQJiZcPamqeObQ@mail.gmail.com>
Subject: Re: [PATCH 03/15] target/arm: Implement FMOP4 (non-widening) for
 float64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 25 Jun 2026 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

