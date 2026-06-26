Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D427C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:29:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6ck-0001SM-5i; Fri, 26 Jun 2026 09:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6ci-0001RM-5h
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:29:36 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6cg-0004vs-TN
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:29:35 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-66493875766so1204424d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480574; cv=none;
 d=google.com; s=arc-20260327;
 b=ZLTW07DVY6DkNvZkYeJqxi8NpyafHp1mOoXwpICqnbu6gyvJ1yVyiZTGVj2ODD/voX
 EuSecx8ChUStzHc5+mh67GGAIcRnj1Mppi0YGtqxTxlQK9t7t0dEOFVsTM/D7RmgaCNS
 dktLtjC/SemZqE2md1Nq71yggerE/1Rl0yHRtZgARJPMTNxYlWqSksvK4W8gOcbtjNU8
 TUIoy4VUHFbwrGPT0rEMjfaFVPbeOea2jqVE2J1re3ltRvwqAzGtBoKkyqGKBJyBL101
 8TX9qZgj30WsUN72uZeMMYPKL5TB+57Kfe0ZZ3sn99tVJdBWiF5hERcIUklrgXKbj86J
 /agg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 fh=VQGt8qTeI/MpD0Vng5U7KkL2Q0rocIFZnb9kRi44dKc=;
 b=DG9T7ONC5bT01rBoUAskXeWUTs3SKxKpmq2kqKOcVfXrcQ9s5R09+/RElCvaQfYM7k
 uAzlTg19nJzeqmMvZhS6kVcTZPcv7wv6dzLvNFVkwapP89b/vx61jf8uWnO1fMW3mWtC
 OAQTT9D6VV4L8AqhD0Hxr7xfIzB6FOgby01gWNuFnfl8GBmp4tUMNLMcsbbUD4DDz52J
 15NJb4tmsh+1iXmN81z+kfacNz/eNmX92+wIfQnU+rLr1yIRl9OG7+XuVsAkBDIlPM16
 eir5c7Gy4lS465qkUvEnfSBYkl3pBElKzPrX5U4aM6pnG3D2LlW1+WCa0giJL6RgIC1H
 /VTQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480574; x=1783085374; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 b=SbkcaE///D2Ei/RAP8gMvEYZtXgSoMtWoQKPnJGzivpgtAvRGbW4N6JLQN0BDN962e
 ZNt/THedHEMcB1X/aWwUh/EsGy9VkjPUQ3dvrDwDZzaoQZd9Eo0DsvkDVV/+twodfsQd
 H3LLKrxnTVIHFg5g28wvzP9WBuUlsSEcn4oP5EsgNXfckiEsdMtKaIHnCxjyo72A6eTH
 J+/IlUU9Kq6/9x2hTxRiYiz86Rog4J8MaECUWMoYr8xYXioKjQ/n9Fov1Ab/2Ll8Mf4/
 QYW4fJqLVG3NRemSAXeU8nWBD478aV45Xw9+Tq0FHugY0yoMIIXvDfu4PQ3Njjl909GG
 4nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480574; x=1783085374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 b=LcEfTEpgBVva2y+Q22DElRG+VaX/hkaRqWca7Jk57BK3JhAV/ZFPPHYRV2pvwM3Ifc
 un6hToDfwSH2RP7/2sv+RtD8kx74mFhfDbLneTpe5ZZaWxMhbBZ8Y58nQ+jU4pPqABCF
 2cin26UmDGGbHx6OKgoCtKhABi7kssbTI7qAUCfk8OPlsW3JDBs9vSmDTM8/0zqFWM7e
 EzycwhavDSRKr0dASOoVfUWmWRPxd3pWkKbfuG7S+QItfoFPDW6RSvvJmDg5h+iK2wqF
 ofIGRuQlYhFTZXIrSFEYqQU+sVxdX7K6zGBhAft5dsWxQZVBcyos0ckq1aZM5wQOjmc8
 AMWA==
X-Forwarded-Encrypted: i=1;
 AHgh+Roa19NFbL4bj/OrfqjUyJCq+lDLgIEPxlsU2nk+TCJGEle8KlwZuBSmJlVnYTLJnkUUcW1/VQs3Bw==@nongnu.org
X-Gm-Message-State: AOJu0YyRi2FWrgNudtCOPJoXRtb7Sg0Pat9jaKA+j409dTfPuAw8gMlg
 h+zKS+Ii5ws98+XZiDPuw2Mpsu51VpOlIpz1W8efrl7wbsQlJWSZ5lQlOW83J+tlcwjEoNQoD9Z
 KeZp4Wh0Legq0vyKd9/ofi1RjRhWm0qW2gFuyRxhAbJrv4lULb14q9alQZ3vS
X-Gm-Gg: AfdE7ckoVkDA8JB1//qNHCX80q2wbgfpHZ2xg1HC5GSPuVlhuzjCdi4nP6EX8vgE1qQ
 d9DtBeFrvAR01kgEEtFjKXZhAtqmh/BigvIR2WTvkVTHAuiuzbtbcUfzUj2YiWaj5NORP4DoyLR
 7GofvlcQGSJtmkib7aULbDxHY5IkkJIKA7eeE+j1Q0Ax5o5P3q/ii1d1DtS6oTkkxvVJiZWOJ56
 xsMc0+e1jJ7L8b0FaNL1NDGf3g3Z5DZcqClfstIdFa+eTHLA8YEm3b1rYTB0aZmsdJMqrGsIfYp
 F8oRYfNgfNt+hC2xMbX7c64ok7gyoFxb5Y+kjE9JPyODC91rAJIfNyJ0MLwcy9K97yM=
X-Received: by 2002:a05:690e:12c6:b0:65c:6dbc:39c4 with SMTP id
 956f58d0204a3-664883cf072mr5358982d50.51.1782480573708; Fri, 26 Jun 2026
 06:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-11-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:29:20 +0100
X-Gm-Features: AVVi8CcEDdxnJVKZvTi54xjK599LlQA7ZpEv7PeXMj_X04riMJs9vcOcLzRq4dM
Message-ID: <CAFEAcA9kqK0TGxO-FFqAi3nvkpj12zLneXRdKS7mvpr2U+ckQQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] target/arm: Implement SMOP4[AS] (4-way)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

