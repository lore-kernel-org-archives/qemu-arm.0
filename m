Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCBCD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSg3-0001qk-9i; Tue, 16 Jun 2026 08:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSg2-0001pD-9q
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:13:58 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSfz-0007O2-V0
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:13:58 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6606678420bso4652891d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612034; cv=none;
 d=google.com; s=arc-20240605;
 b=ZbCN/Tfp0fQrVAwGfqmMVzaBVWpMgtjM/3oPW8/7U5ZhuXLVZ08dMM+ZV1yQk5650S
 B4IyLhruPpkox1X/RmAjFTGNBpSqWPn5EYz/f39xTv+E8c22drs7PXFcAbEHdgLwhrm0
 38Q4v+Ys2wNjRnwQm/nN0yGwWPyd+YEA5WWOis8u+JuaAYknMGuG/jcTvHVmA6iSL1QO
 2Bc+t+Lu75EnxNATbiwLFrSy6nCrLSUt37vjd7O/mAJiCSAzurUjDEBlX6aXMaVVDJhq
 d+3ViRjQEOMr+7/MKCl/btTAW8XRymrM625AjVfrBzMpz/YD5Gk43+6MtwJOPCrzs6RS
 A6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=i80NjTv+gOcqKRAtL544hW65gkOooUdnIBR/5KAeDyo=;
 fh=mYghR6WZh5dUUe1ZrhhGR/qw8vvQr2fnDG+AZQA3wcA=;
 b=H/eVcf2NMcZnyQng9OdF7S1h8qchyxmC2pxcd4hOpcUKyv6HiNApflMeOolHIFRB05
 XQiqU248L6s8ambn2Nxzoe+jkvodtatsSIerXWz8dNTEY0oRbcI/4By7sDrGexG+9m9L
 SSXaVRAhHTQqvzizfCnxYBxkMY8XRJLB4TsOnt2serTIjAHd3S8lmgv2ti/wmXmIptAB
 Ff1bhkksTmaFSOxDggMif3M8lm5RZuj2ZIJ3upfhsqnoXsWHZryPgG7vfFYowh13ZoNx
 TdQyYPKksrOODAMuupORcIxZfXYg04cnj5+D6EvBayle2+Dw8y8dRqPrxTESAF5hdeg3
 TTMw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612034; x=1782216834; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i80NjTv+gOcqKRAtL544hW65gkOooUdnIBR/5KAeDyo=;
 b=LKV4TtudMzuflgUYVMgsnEwQFvAcKcOGVaJuCFZEiXnu44R2kFPOvi1glkU/+j2sBW
 cJVVp5IFReVsgzbEQFunrsvfigvBzCaa6+3qZa3VbAGpZOo3O4jgPE16/7lYVZ/I3+m0
 AKoTuqN/XSa1MqBo0OUBrIiwxwoELxphEyxt4cklFY7XT9IdLh+seRPVf+ztdTYbKU2M
 z9Y+Eky/jPenMWOzLyTsLWthu91s+8F4wQNiAJlRULH2MYA3DaK7d6qt3/OIt/WJwGR0
 Bx+0Ia8eQVZNzu9jHuk/TApPhakLspzJj2D1+G8q+iSLcB6HYtYHWR/w7QeoNuTsDjdR
 fPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612034; x=1782216834;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i80NjTv+gOcqKRAtL544hW65gkOooUdnIBR/5KAeDyo=;
 b=JFQkdKa5gvvyD8n447jU04+TWNq/K2go0OI1eZb+9hr7quasAEHpny+/D1p/lyo99b
 VwUZ3arY7zrdIF7yRRpwehSPtFj4KgjTvaHh7+nt/I5vvWuobgAvFVsp+PPazqtif0mI
 I4+TafWQRuy8yWzlWu+jJFyE57O3OQF54r0JMtktnsY1r1GXdlMEF2rc+53DFFIZtO6l
 76hUQGFfYTSWgLzYj7wUIStZkRisChD8/1dO5jaZ5+i3R4vq5JoeeTKfvDFKVIAWav2R
 Nzr8hy+JWiJNemriq4LLaOR7i+S8S0UDJ/xQjdtguoYboHKNNOZz4EzyNSkqY8TVMFWp
 7cIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8cV+YaaoF+yB4InBTNA4FAXDegeRkJsqlsY4z0ZJ4u5c1OrSTj+QIb/92D52CGF7B9sattNFRslQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx7YdygAG0AON+a8lAdxAs1DPEZMdmVOcj+QrQyWMct8L+UarQI
 mgx2oCeEdicb8IFMKQkacZoBTcs3MY9qt0XLMM/xNYwZQasLtC2R7bTX3I2cmu7345pgJluJSKO
 DDZFqLjiqcSFUbiTA9TdgaYrSIFyyZSz9t5jIF1+ZTw==
X-Gm-Gg: Acq92OHKFyIFLPhcD2hxjqKyHdNicqxQuSc0Za6xp331da5f/C9drepHIx9Oucsmcs9
 mHAqGIqQ+gmIzjcgdCs8XcLaGRQi2JFSLhOPFFMjxpKY27SdyjTLEXYlwLC5/QqoZPs1RLiMWtc
 murWCq9yE2lXfM5PzvlfOA812E3/ZhFni/CgLvTF68zOKAiFwb8gXTt9fiD0V0bcAieyur/Z3Er
 W6L7lHJ06uWAmOlTUJ6wkEHtFMdD0Xcas2UeyYTmGBkkW6cxHWoj/c9f51kqXVidk7IAX3VpL2D
 /8DFu9snXbUamObYrdHRn646zfd/szKmCnheZRfdLUv1v9k8IHPA9IyYWyoW+QAmaZY=
X-Received: by 2002:a05:690e:4145:b0:660:ec14:ef87 with SMTP id
 956f58d0204a3-6628500a306mr12712040d50.34.1781612034578; Tue, 16 Jun 2026
 05:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-2-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:13:43 +0100
X-Gm-Features: AVVi8Celhm_5i3htRegQ-w_ztro-X9hId-aOVK1VSHnnGUjNzIjSK4jcc5KSOS4
Message-ID: <CAFEAcA8_+K-PZh_d31MKh17MWMF9TXkoS6c6EC2pLMqhWQidCw@mail.gmail.com>
Subject: Re: [PATCH 01/25] target/arm: Add feature predicates for SVE2.2 and
 SME2.2
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

