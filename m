Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E582CCD1A7
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 14:49:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vArCQ-00075m-Bb; Mon, 20 Oct 2025 10:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArCL-00070X-NW
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:49:24 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vArCH-0004AW-AA
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 10:49:19 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-63e3568f90dso1302437d50.0
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760971754; x=1761576554; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7q2+5dIa0Yzx69aZayx4LpDkshouazBU6lCeu6IMxfg=;
 b=VxyJ20AX8LEa3VPtNJgQf6vvy7a+ftv8ZQGH4R7pjTBbu4C3+vLoGedU80iy9JMEcT
 W4opmmL6v97Xw1WEEw8DRCsA3mbNAGNeHa9QkU5WSKhmTOXrGmtApqbEJAYR7WU50pOB
 l84BSlRAf3uz0LoooyoHLonmj0dgIkkixojt9HMA4p76aYKCccgrq7fmKsGJhk31zaJj
 C8E4u187Bju9mQdvan7wJdxYCdNHfQxIIsu30MvA7v69u88fAs0h0H+UVi8jkzWfiAtD
 BvcHyqyDm1kGEcgoHT2YG0t61Kc76Hy9FU2fqZLSLzcCt6EGT4U1ls+idjpQgwTXR3CU
 IKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760971754; x=1761576554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7q2+5dIa0Yzx69aZayx4LpDkshouazBU6lCeu6IMxfg=;
 b=LxCIGRVELb1cGXhiQ9b4AAeTPUHTsopTUC35DkpxKqn5mckPzRJo2IPX2ZKueAbM5K
 3zTKyBfJxRYTZfter7RBBqP2k+K2E8BAv1iSdxXDihiJgIMPOlAsW6b+cXspq9XvjlVL
 S817Cri3z327Ni+72+x1SVElWcjzmauHvVN8kQCPjeWqc0eIR0ONObey5F92HZ6qAIl/
 4Oliy4XVL7kXzSt6m0O36iyAjyDECNVYzgU/ncXiPnuNsBaZVYPsLmquieW5W4wgov5M
 58ykybpkisoOkkX/3YBuw7KL20DXXQtmKf6xBiQJtalYn5/VDh6Avk2pyjUoa737N2ug
 RiiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOcp0KNHHAgnfPS17tx07a2G2EKHzNWi0mYTdGQZ9g5WIfOZFmLPVi2W5XCzG5yCakbrJ0JOU+IA==@nongnu.org
X-Gm-Message-State: AOJu0Yz9iKq6RXtRoIkchUndWMdbu8YpX6vr+wF5UDRk5GIEe91qa9NY
 JVumhs1y8jxWMVF0PjzCe2dyZoFBLWf/BzbWXjkFp4GlXdDpSH9lIonGOL7jNFPvIGANBZgDmYi
 1sPa7HkjoFi4m+ZkckN12P40YnsfGPLunohPlO2fSuw==
X-Gm-Gg: ASbGncvnzKNqrvJKQffi/tscrAaivXmEC7/F/D7kKY5sOskscxEemdXIFlCWxFLRuC7
 eAlrYOk5nOZjef1AoSYT64UmcmigP1h3NfCXJWYQaViHRnpoOTpAx3MRmL7Fw3TF2/t5oIgneXi
 OZnKo6zMsu2TBsFNbjWOhFpq/EgxiicGOn6ofAvGp6tG6XJTink0GNN0IHDugeaU/5rR4mNSVYU
 AaAR3FtAXRzfdXsYzTHFfZ5aUSTQ3sgQot4RVKOc/39VzqO9LjQ51HhH5KRGg==
X-Google-Smtp-Source: AGHT+IH4kLVkskDyysny43vcHBZGEk7Ord2q64O9dJU7hjIEVDkP9d2Daq1Q8If40YqQm1gsdxINXy5ajJaUTKrxAm8=
X-Received: by 2002:a05:690e:1186:b0:63e:2d1a:b422 with SMTP id
 956f58d0204a3-63e2d1ab544mr6229657d50.24.1760971754447; Mon, 20 Oct 2025
 07:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-30-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 15:49:03 +0100
X-Gm-Features: AS18NWDe0XWZVZ21CHoV8VbVmrlbgTY5MtvnKKUKQdqQMtvtyg75RQuK0Jv_pp0
Message-ID: <CAFEAcA_hAjuy8GObT3dczmQ-C0vVrMBuLHz6WyPzsSrA2ytErw@mail.gmail.com>
Subject: Re: [PATCH v2 29/37] target/arm: Implement TLBIP RIPAS1E1, RIPAS1LE1, 
 RIPAS2E1IS, RIPAS2LE1IS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Tue, 14 Oct 2025 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/tlb-insns.c | 39 ++++++++++++++++++++++++++++++--------


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

