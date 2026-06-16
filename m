Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9DCCD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:49:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTEO-0001CY-1y; Tue, 16 Jun 2026 08:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTEN-0001C4-4u
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:49:27 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTEL-0003HA-Rf
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:49:26 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-662bcc30fafso513932d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781614165; cv=none;
 d=google.com; s=arc-20240605;
 b=V62GdlNAfEZOrRhwYuTrNJ+TVROLfNigO/YzBPgxd1JNlnTW6+r3ZUTy7d1fquDh4A
 tUNrJgPg2r3rPFhucZ6oIVpBuiUhjqcpof9TTpXhcH064KURIy9cyRAOfaG5h76tRVYt
 h4xU7qmWa+FxZhfS6zZfkFd9lF0h/JjXCyhdKG+bDJdtIaiPEXfI4TwBCcYHKJBW/63x
 l2iFY/7QXWtRQk7L1qBjNltwS+kXHUsUYE7a16DN322B3YV38a+Z+fU3fSdqkqXAxED8
 ufRcCf9NSjmr1bfcuQePoRZli0iC4hXg8G5yAL0J60DDu3ODN0dSj2N94eJshD9U9mDy
 kaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5JbEuJns7zAobiJzmbg9EVXYlQ4aN3eRBrXEi1fjQq4=;
 fh=n6KceOZ/FOE9KHDuIK0r5zOkzxbIsfMv7gfOdRJsErM=;
 b=ekzb1UlubLr3BuP1LGxiDsAbQzvjAAZJ+uD9ZgLv9LT/ojJQk5r7HyrZ/m0zJ5d1h0
 EXOWxP0UmDyYFrOPqmSolhXFxviXpVrF/sgvkMaCXCuZ4ixTxxb7YDqAtUW3iwdpg/93
 D95wXTdgOIb0nHT7rfn7Wphfqm6eLoWIhfBkNlzFBd7hF533Iol8ie2SwPXYhH7LdhnY
 qogzOs3FrDxGZIXbPuhb66R65ZtfmLjP9Df6yIeypxbPoJ7Df7DFBfjgPMqPBzf3YgsR
 z3K1I/VpgyCa0ykLajl3/SOYPjiFT4jYPEHKRnMXYtbYIJB+YbXXQRu1ri258m7uEYwA
 Hjsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781614165; x=1782218965; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5JbEuJns7zAobiJzmbg9EVXYlQ4aN3eRBrXEi1fjQq4=;
 b=WjuVEP+/0dlWnZpJIely8Fta4bfEHf463yukM0KzbMdCUDwcgstK6CBZB7Xvqn1Hja
 XVCw51ftwcT2+EBFIeuIvzdVb81WdgRX2REHEsfsnTP23jXj86fvNHvnMPPOs91AFLvb
 3qOfnPMsDrv4f7SXhY2dJhe1XioPpoOTxTMSwvbrkVKteWu09DuiLhIZyoEWX1rD0mZR
 NVlSV6zQwECT2AI1Pej0D1uCgRUBjP29RWIINFU8mDvpoUEEi6nvsCpBRad6tw58vgGf
 Iu4jYPlfSPgTs8sPI2GqphLunB3tC0j0h6gQR6/26YFgPv4xIfg3q6SswkBdWsEeBcZR
 W6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781614165; x=1782218965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JbEuJns7zAobiJzmbg9EVXYlQ4aN3eRBrXEi1fjQq4=;
 b=pGbrL28NceuNhUaa8Wrd9GQRCaJ4gok1D6mu3ckHAGTdXfEiE5a0BmR6qWqs7j+lT5
 oycAv1pzeLbsFZY4EZUwIn7SUOk135IsIg9M1+8ShpwQadCsOQ3la88hI02/9xo6CSWO
 BofeMhyEg2aj1FATAMd5OQuaknRmdQP5/tpz+I+4fmnrsu/8fLp8iXoImHjn3vZKp5Uf
 1vs/CvrWwlWLwW28EHs0NgSWVNLxDFQp/3uid5kpYGMnwHvgTRMxs3xHFclfmLQC3Cz8
 RQgXbMWTVdV/CKKoHWMH5LEQ78+QoRRpLbSd5xACELNJrPTQVygyjcDGBVnt7ZiFSNsM
 dOyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xHcSLyVune574yWHoNMb/cTAtGpa3Z32dv76C9PzXOlfX1rnH0T2PJwSdjLNWIsG1miFwtvi/CQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxipVAApstH074c95WcbeULSJFya80PelBWjXMrfT+qukrrSKi
 o2cm1mEyOJ68kktb7XuV71ua/wu2busTbtBsu/MFOf7V57+Q8+0GMJAtBiGD4PgmmYh/sIlIyrG
 v1mUbl/TzSgMmNth0Y0Azn0cMj/HP6d52QUvKIx0zsw==
X-Gm-Gg: AfdE7cm9MBEeycbJkIKXWQGtGJb+JvX1IJ7oOVr9TC9vHBo6p0hgajqcIDIphfdHtp9
 lqDEY1eVCHb+EDDj+nS39kHSCpz41dIToNAimjyo/XNcCDXe9eE4zE67fnDMknjcawR0/ebfQLr
 0WGQUUsyZFOkWms1Sea3IiZLc51dNvPRPakclGZWRbi64Kh30IfaHp9exCNjFlymQV+0OJsZXlI
 SmgyNGsRKK0OLROWVmMSFPsQoe5UZ0wDgfsufAb25dKfZ9qx1tovjBgR8srx1QNjlSz6ySVQgOC
 aRFiudZeUuK996JkQ0gmnV69aVcBlMwoQJ+Xzgb1NwVtv9Ojl0NDq16Fdhf9A+tXQ6o=
X-Received: by 2002:a53:c092:0:b0:660:877f:a5c4 with SMTP id
 956f58d0204a3-662b61cdf60mr1809187d50.50.1781614164561; Tue, 16 Jun 2026
 05:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-14-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:49:12 +0100
X-Gm-Features: AVVi8Cc_TVA49BConFNItOuRlD0YGpS2LQOau6VGEej_WBHQx_6cVpvBsGuvqPM
Message-ID: <CAFEAcA-r4DqADgn4cmeK-9eY9CAr4nKEusTvVSRRpw8FM60hmQ@mail.gmail.com>
Subject: Re: [PATCH 13/25] target/arm: Implement Floating-point square root
 (predicated, zeroing)
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
> This is FRECPX and FSQRT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

