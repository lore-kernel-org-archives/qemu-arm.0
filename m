Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4EECD8C9F
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 18:01:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWeHj-0005PP-P1; Mon, 08 Jun 2026 14:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWeHi-0005P5-37
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 14:01:14 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWeHg-0001kE-6p
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 14:01:13 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7dd5a8dc8a2so31171387b3.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 11:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941670; cv=none;
 d=google.com; s=arc-20240605;
 b=LdZgRehUkXUm7foyvQCEaa5uRixaXYJ73l6ySkqnUXzL4v/reo7YYdFhQzbB2OVamc
 k3pOPdD1RI7xVXm9dBn4s8U9yJugE4YjUQDi+/PTAvUNTOW5yalSoVQFHR+Ya1+T7x3w
 Z9oO/DXT1lPWJDOty9wEJF8KdcgGacWTRf1iavHOQquD3+YsxOswZV4SHo6mpqYEexvc
 o/Lru+kTOi3vOGfwwWUFSdGsD9jJIjud99jdMW3juJq/Zq0cwrHQF0/WJjTYXgB1VtRT
 6EnHVbQESeTxedUwi0e4JyAkA0lK2+UGo1feqBUFg2uOsVB6pF84oayZDShZ6WT69qf5
 3a0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CfifY6sYsF+eHso0dfjYm0PoKpEJEwLqFe6CgVK6Mps=;
 fh=nYQXfjwSt3WivKcmMMltkr8n0f1DGi2i2oC6rlEjNzo=;
 b=Z2V7Ls8yLmfde28isLX5Y/xAMB+QNVUywAMXnsT51i5idPiRxXFQjp8YEjr0QMVrKn
 p1IEq6eGtu6Ys3HyFkJYPIb4yPhM/L4gtkyOKBPZsxLc6PwSYUh2WxxWtmJHiE/mQe64
 qn0VWLV8FlkWxYhtIpROqkziRUilNrkZmRWxc9dRq9t2BICUVC4AjqV8OV+t2HDu1Nra
 zv+O3QNInQJBp38XydOSmmevhinWPpXW5D536jixwE4dtZwtbRS1Fp/XxQE/Lz77CL8a
 SmdFOQ2XZBlvyiq3ooLAaHEPoB0Loz3TZrw6xI7OZK24dqVZQPHP1+FCOn+IfCOWLYDr
 0I/A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780941670; x=1781546470; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CfifY6sYsF+eHso0dfjYm0PoKpEJEwLqFe6CgVK6Mps=;
 b=sUO9C/5oCUpAWcXzyYQPff37oYNfKbLBA8/x7C5cLzxt0iSDtt+OGYI626stdSnlwA
 77KXsr7iLXEFrdeeKmi5Hapv1KFtoxosyXfpCAohCPImn84V2QlZeyxT6CNUQQ32zhXk
 mr+c0Xk1SrGHYiVqnzBCITIIOfXQfWamceqB6xFVYXcL/5lhn/v4CqeK77BVMB0IKRKU
 msc/5cHU2srZV1GSUd3qiYLMTHYg4Fx6D6jdxNg8a8hH4PYssOKudy4SrFeVZUeoHt0G
 82r438E7R1vY1kXFltuLJZE4AAIVsO9b8960o9XOuZVswLqgfPK5FWkw0JbZM18V3fzm
 C0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780941670; x=1781546470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CfifY6sYsF+eHso0dfjYm0PoKpEJEwLqFe6CgVK6Mps=;
 b=tVktBOwwD1Y9/uPinY4piTXfyleHMwM5cWhbx4XqCCXN/TtZyT1ZlrNx31zNxH3U9L
 GCk3mlZwgjhD3GR73kiHWurfrX0mPBNwjZG4RwfMZgel8nA5waMbRjXMLCKBjP6WDIv2
 Cb7texwh5VpiCvMCrZFgjBQi3p/I6pCRu8x2XplY4ysrrnuoiQtRyOZYophDR0LMgLWX
 uPILWo0h2XLgDUEPiZTg9u3EthAF3nB5e0/zh0AFl/oSBKaOWXCCoNOTJzf9dWWhNyo2
 Q55v4zZDXU7juxG+SmF7MSoZRlvLhOqNpLsCIZXnnF8+ARu7C65Eq9QUZpB9YRqGBto7
 THFQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+80apitp5XcpDWpsyH+Uxzj6BBQx8A3W2S7jXJ8l69VKZcIAXYxlgSevXsI3U+X5RUirXB9HkRsA==@nongnu.org
X-Gm-Message-State: AOJu0YxyVXL06ShiRgz1ZlBLtejj99lY0budVmmNM7rys0ROrJyjyw1c
 uTpN3LILTPqKVFOEg5zROk7iU0B+UzV5wVJuujrWVv77eGeO/c37LuNA7IjBEQq8rb1wvjxgiBX
 rwXGYKIIl7wdQcUuVIdaE/SXGZWLpbXRfLcdQ3YXiT6qAaWvmzOQh
X-Gm-Gg: Acq92OE5Noidqxn4aG7kt1+XGHKHEhbSwlJwSWy6eBnzHVYSbLmGvB2Afezns60UKTt
 7gX6LZhiaNbzq8h7CXT+iZOEej/tH6l4DZ6vX4P2L3EDfNWCkA7b3/l7PyMWJ8ZC/ko2ZCyT0z7
 0SNgE+KalZwqsaCG/kYvEMQFoxPJOJLGGtQ4bOb4+MuaZmlI4CYSpQR639iXF+c5UPwFNUldPCE
 0cH/lWDy6TcqjsZuluaoBsfg3L2ZqNNWQOJht9EmxRQazuk2rM1puoqfwctkHlmlBIYGWDu2D0B
 kDIeQLMtb6VrHfjkOXU6K1tv6zkLzeRZ89239eXRJ/eKsvNne7zsjp2R8aZVj5Ul8n1G1vFsSdF
 DPw==
X-Received: by 2002:a05:690e:1c07:b0:660:8e61:1a5e with SMTP id
 956f58d0204a3-66106e156b2mr13890129d50.17.1780941664154; Mon, 08 Jun 2026
 11:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-14-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 19:00:52 +0100
X-Gm-Features: AVVi8CdKn-p8wzMPNKO_czrcm0sWR4D0bYTOMLcQRtxI4XOkPTmUStDV_nU-fnU
Message-ID: <CAFEAcA-vB9axYoTFeHAUdXS+tHH5rScvGEecOq2gEOc+xsvASQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/45] target/arm: Implement F1CVT, F1CVTL, F2CVT,
 F2CVTL for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   |  5 ++++
>  target/arm/tcg/sme.decode        |  5 ++++
>  4 files changed, 59 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

