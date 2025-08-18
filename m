Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F6BCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 13:45:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uo0Ac-0004Qd-CS; Mon, 18 Aug 2025 09:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo0Ab-0004Pj-Cg
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 09:45:05 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo0AZ-00087I-Qa
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 09:45:05 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e933597bc2eso2464752276.2
 for <qemu-arm@nongnu.org>; Mon, 18 Aug 2025 06:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755524703; x=1756129503; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B5zxMdUiJZoLLAH3MeBZgRIfGQ33xoY7R1O30qOfsLI=;
 b=rR5nF1s32J/MRrJ5qmqqnUmlNxC3Xg2V04h7Sr/7tVHIfpBeifRvcGdJmSHjZzCS+N
 u99taQbEcM1wWv+wcPUc1gnJqOYA45Pe9oXMtM+oIyR6U8uPfEjKkd7OFsUYNfweUEfU
 Xj6UkLqTCCumSOKhAcNkhCTYjXxABR0nkT7dRE8u0DjEu+VXoueOWAd3iF3202wnVa6w
 h6NnPlUELonW0NKSkURfaLMZwKrkbUkeUHLgxFCpZbgzYEFeOBmup+0Ra1pX3U8lIqRK
 3B87YnCPqsLrVgBcMvWmRZ9a0Y0EEg1+/EqgtrGQfWWjfWg9vjRKFFRy106X90gBO/+/
 dtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755524703; x=1756129503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5zxMdUiJZoLLAH3MeBZgRIfGQ33xoY7R1O30qOfsLI=;
 b=p3qVKLhPm3TChhfPsDTGkh8/KAHg2V5HURIz1K0K998c+QoatI/+yKeoyjm2ZIymX/
 bqZbWv2GG5tDi1QmkRjulKGrDYG4fz1FSEg15WdHdQFurc8JMjILNZaJ7vay5mRtD8iY
 gtL0x6fmVAfapyHELwz5V6I5MpX0zWd5qUcJ7U3Y/lPphwdVuoUgsLD4JZjybfk3adKc
 AIYdDab0dL1SLi8Ykp1U4uEfVxtFODyGQetyPMwRLX5XmwnStdAGZlaOYI7qOwvEAHHT
 Fln+hbonci5Jd+dAWUm6meC2s/CIja0dNhgxMJhrYLM5mywpEj+NNGjbEC2lXP+cOUZk
 X7dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu0azKrFXHzvl5W4c8uwldSU66typNaPBywRKYtgIAeAQ2TnzXunWTk1of6WXkYzXoalsHwhm0CQ==@nongnu.org
X-Gm-Message-State: AOJu0YwXuHbZd1gVWUtiPGmUc475FaNfff6MOgEc18PVWaUrJcyeNsVt
 IzLgHr/vwOf8ALou69JwWtHTP+QJNrwUPUkoJxZY0hb6MjGv+x9CMKf+tcBdiyc3Rw5nTg7odQn
 u2lgeq/JBBLArlc2JRO9gIpYYPuCzW7Y/bej5QSSmRA==
X-Gm-Gg: ASbGncu94t0gcrYcb6U7bMPmJMAWZxs0RbfmRxgTB5+n3xniFZ5GK9f/ldTLfwt4mCw
 MoXUBGQNbZQU8f9CAxMi+rSglH/uEGIdicrCntEOqdDz2fLvvTyx4iTvX6DXiy4h8B/r863RIRu
 YkNbgPh9VFnj6EvVPBn4t8vI+kg2WS5LNN7Rbg4025eyLPW/f58oeEkMmYkNGElr1SRxUVhFuzN
 Y1ZSD8a
X-Google-Smtp-Source: AGHT+IErEBpGdZZ6BQuUNvaUQL8D/zvR3Uns3spJtAPbvWmXB35duS0x07n3Hn/mUfUGmRSrH5KnMW3/m2nFA8lMe4w=
X-Received: by 2002:a05:6902:20c4:b0:e8f:e77b:a404 with SMTP id
 3f1490d57ef6-e93323d628cmr14804693276.2.1755524702706; Mon, 18 Aug 2025
 06:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250727074202.83141-1-richard.henderson@linaro.org>
 <CAFEAcA-Cm6rn6N+H=v1aaeDZBeJVUQQ2v3XDVsTu=PeLpc76QQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Cm6rn6N+H=v1aaeDZBeJVUQQ2v3XDVsTu=PeLpc76QQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2025 14:44:49 +0100
X-Gm-Features: Ac12FXw3r2AhHhg7TToFSX5X3GgzwGq_hSDf3fLVtC05siOcRQlftEozsoYrJ28
Message-ID: <CAFEAcA_sURdG7vafcPcxf-Qr6mc49j0+-26mxOsmTdxCT5PeAg@mail.gmail.com>
Subject: Re: [PATCH for-10.2 v9 0/6] target/arm: Add FEAT_MEC to max cpu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Fri, 15 Aug 2025 at 14:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 27 Jul 2025 at 08:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v9:
> >   - Set bits in arm_hcrx_el2_eff has bits whose effective value
> >     is 1 when EL2 is disabled.
> >   - Include Pierrick's firmware updates.
> >
>
> Applied to target-arm.next for 10.2, thanks.

I've just noticed a couple of late things about the FEAT_MEC
parts of this patchset, so I'm going to drop patches 5 and 6
from target-arm.next.

thanks
-- PMM

