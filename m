Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E85CCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArHC-00036o-FP; Mon, 20 Oct 2025 10:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArGf-0002dP-GK
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:53:54 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArGd-0004gw-3Y
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:53:49 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7848f763982so21724657b3.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760972023; x=1761576823; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zU23yWGtSetwuWLS5SAyqN+GewwgZYsp4hXqLSA2xTQ=;
 b=dfSwZDGlgFebw1Ea7d7jONrMErboDijUxlpLMO2K5PTBeIxFo0adN8BxhPv9eyYGhL
 RWmmUSi4qtiTx4XkFsM+j7y3nDEVR+fQfjxPrZ+JqtmSEJ7pCZkvZ/azCPnepPiLdiN2
 4sQZwowCp4BGnC+GaAvzHLiosgTLLKjXtbUkFTEvtU4yuEOrfJGcEdqK1KIMaM4B+Xkp
 9rFjHAA5i8n50nOajbhx74IFBtTuOk8sxjjDfEBSvqeTyECCFV0CUOdOjrds0ASt4AW4
 J3QqaS3S0aO1l6fu1fm8PkIIkCkE97iRvidtKQbO7Oei4Ka6HXX3XS3O0bhOlwvi8pgh
 COdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760972023; x=1761576823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zU23yWGtSetwuWLS5SAyqN+GewwgZYsp4hXqLSA2xTQ=;
 b=BV2dWDbEzu924/y/PHNGPn34bWqND7LkhOyxt4cJRDUZhrpBaGYCb3/dBO8LL0NZrE
 HNYnshDvUt/2fhL6ZK9rwq/7g5PexEffcsqjKhOkQAS0jCkMOdB4t1mh//yhDIHPMdAN
 c1d4DGqM4M78jLE7E0AIOommHJVKZ4iU3eU81vqSVgv8GLo0SrTiHyY3njP+sTtffFSc
 pqtxB3RDhKA3fgdnDkO+DvCbTfIzXAaXODlUE87nMHFiZyxK14lJ+GEvrvVsHfgk79at
 tdH/IDTakzkguGZmTwPKzko1ej2WG+0Hb56tM+WYIm5TrQqea8CVzUOBdLMeu9/yrPIr
 v07A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYqzhn9COanUMj8CiqWGkglvoSQptS0BSsKsyTLDDXrEOiAJnVURKUfVSfj3gycfFnFFUtH8n1ZA==@nongnu.org
X-Gm-Message-State: AOJu0YxjxcDKzHfRY4rw+xO8ZNOYQCRL7mvulTLY4dVs2uUfB2xGVfUI
 JRUEWhauMj5L2uDHqODc2vF0pQT8JrE7E9CCIO3L1TAU93M5CH81xQdlRa5Hlv799Erml1/Kwmv
 Ua+0knwNskgM7tB9brn8zejNdThrDKRCmbSPgAEbghuXWkN5VZnyC
X-Gm-Gg: ASbGncvdKq08v5cWV855/3DN1e9Vn/r+LTBcb5ukPYMhGuobvpiXvLrV+IKHS5wNeUF
 KcQaovkG45rwg/lp43ECZfxTIj5QOP1ivoYXG+50EjLpzuxAz4itlqjkiyZHSMRSBI3g2pCyciV
 /h+MSLcyk/C4Fl89GV3EFwoqAe56EswVH/10biLh8CRUW6kk5OHcWDyOnT9H34LHAP3YSarIDvQ
 52etxdU01/nrXNNxv+Jv5rkezB97+v+xWVARLOzDQFal2LdY4jVG3me0W0gQpwSCQWq3d8e
X-Google-Smtp-Source: AGHT+IFO0YgcTul+xEqFCMxYfaz2ABP6GsxtLdgznHaZBF0+DKOm6lmKv/9wQVGcrCr0rP0NMaWjLNW9feg9mN3MrD8=
X-Received: by 2002:a05:690e:4182:b0:633:b317:9cea with SMTP id
 956f58d0204a3-63e161794d9mr9544651d50.8.1760972023132; Mon, 20 Oct 2025
 07:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-37-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:53:31 +0100
X-Gm-Features: AS18NWD2v-qwuj8fxHMmfGbNiDThL2ftN7YvbhaAYBvBv94_M_4mI8vloIfGrr4
Message-ID: <CAFEAcA8Kvqa7vgSk-FhOfb_GCuNq3cnEihUaV08QSv8sVjmiWQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/37] target/arm: Implement TLBIP VA{L}E3{IS,OS}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Tue, 14 Oct 2025 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

