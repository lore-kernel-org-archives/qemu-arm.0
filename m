Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC7CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 12:36:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9jg2-0006Sq-Sk; Fri, 17 Oct 2025 08:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9jg1-0006Sf-7F
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:35:21 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9jfw-00083s-4t
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:35:20 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-783fa3aa582so1607377b3.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760704505; x=1761309305; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Im8n8W1Z7g5zp9YF8c/Dn0qzXY5azv+YP1D6jqojBE=;
 b=mdA0r5rzRowKBFZFqFExDwJhjSE3fK79ODrxLZow2186V9I9pwI+WtMkLg82M/Vnjk
 K3Ie2J6IpUiDqCiB6Yv3vWXPZDlAbK4YqSOXmfpEiJcp5RNX64dGBdbdrgyoik2stIBx
 QvjqqT5SicKRB1Ce88BHRRbisFcZOGxtqkqpGlAwd8N2+8+4UtqXL4FsrVofBlQKYWFZ
 i5Lksb70qLEFs8MVeHeRUVAx4OtNS9xcG9zdJeV9GjGwT6B8V5eYb4D1AbVkx6BIMC3J
 /vOVaw3xC2kKpxqSD52koilCbSD05268rTCePMNYUONec5oRY7yLpnQPw9Jpxy5BnPNi
 q25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760704505; x=1761309305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Im8n8W1Z7g5zp9YF8c/Dn0qzXY5azv+YP1D6jqojBE=;
 b=KVkowPtIkESWxP/9siRXWcDS9lseUb8b52KbwbDrFlnTEx5r+6qb/anArcjfTBBQei
 1P+cbqyWlFu4b0fP63gUD2B6hXLKIW1/6zTEqp5Ut7E+RCFM6w+Ny0dJSwaK7Pt0rXpH
 9YuUjTsr9qgXrVC0MD70ScOUOEx2h+l8c5a/QWf1PUXqhxk0uu0CqaCDwXHWHeMzVB48
 9Xafv8t0A98jtr8eW15GcoSpvm+F36jEFoqji7fU7o5j/Ciu25G8KVf7nnJwSkmD4W7K
 +EIjTmbvbcmxlwhoPRcW9J60rUieIJ4SQGCT8uAYwgQXOUYvBl1aNMTVrV5r81Op+N1e
 FGrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLaDWKLW5yaC6y0i/0T69FnkusU8G5xYGrPirA9zeD5urflgHetUXLAfkO3HKjrdRJ92LASAi/EA==@nongnu.org
X-Gm-Message-State: AOJu0YykqkuhyXP7gE7CBdZnM2d/TYqW3KNROY+4/upEFQBsZmS00I0m
 EOivj2/PQzGwSYyPaJEKnIjEVBSO4OTeJKyLDL9PJpTqtXmuj03ddlipJ135GaD2gblEC855xHI
 C/v7u2Bdpn5B1IPj5iQ7EA1n6wKyYOfI8Ajc1susoXQ==
X-Gm-Gg: ASbGnculOVdo1l9q6SwBdPHH6PiZxcM1d8Aui93TisfY7GXsSaljkDtPpUD0662yhJm
 47My14OGZl7Iz4duyKu6sBvIl69ABvcuCRL68RSnDSvVlxqwVa4bgIAI+zWAeoCiQL8hSIff/Kq
 xBiBMkGx6nUsD4wqBbseoDzLROE4H0GQdlWE/l3OS59JDHgEFpnTfU9JEqP2BRicbf/dGfyFNPD
 MsZ7aodjaRa/UINCxmggcSn1M75CPzOx0+YlL8vj5pHYpNr/4UVzCR8ZPWX7w==
X-Google-Smtp-Source: AGHT+IE38sTrckDgXthyVbtXVmG5hifkfeN/QP0Riq5nsw6+tu2sooydYSno6qgHjIWy4uo8Mqe1Og9fX1PysmQqV1Y=
X-Received: by 2002:a05:690e:4182:b0:632:5ba8:1bb5 with SMTP id
 956f58d0204a3-63e161395c5mr3287979d50.21.1760704505435; Fri, 17 Oct 2025
 05:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-2-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 13:34:53 +0100
X-Gm-Features: AS18NWCfNdJXFeJFOInNNx-gLywkQeyWWc4On1e5LCbjUCYPG1fcf59ATJc-jBs
Message-ID: <CAFEAcA8R8u7D9Hh4h68q3h-38Mjfmk5qB0Z-=u_18s1j-cFzFQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/37] target/arm: Implement isar tests for
 FEAT_SYSREG128, FEAT_SYSINSTR128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Tue, 14 Oct 2025 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

