Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5D0CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:10:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz2I-00060x-VU; Tue, 09 Jun 2026 12:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz2G-0005zv-SZ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:10:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz2B-0005o8-KD
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:10:39 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bed2b9bfa02so779465366b.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021431; cv=none;
 d=google.com; s=arc-20240605;
 b=BcTRymY4+SiXwsJIG0mgcJAFdKlmieG/nmHho3IxN3RmjpT1Uhux8IRpMEB34QdkQ7
 UErKSzK2qgzJ4CVgePJ94fWPXB6jWT9oJbcWe+tIQeomZzpuh0hQpAOwzGFyBAfAL6e7
 OnsXX4my0nad3UxKlcv/JIrVQ7RvKmMWle7v9mafObZoyp0ZVqilnCqNMKyF84au0g3R
 enkWb4hFQRBmh0/b16OoYkizSkYHkzk5f6I/BujsC/+Sq7qXio25G6e7HyEoVZ5TNHmE
 dpAJDCglUKR10TGWxbo6aXkN9EYCKwsBYGcUqIptOJdPDqeaBIJ3BZZXKjUa3oyxQINA
 fy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VIG0MZnjHRSVsFBrIeDs2gVQ0G0tC69GRVVdufLEJMw=;
 fh=YPVfs/bPZBUGD/oURsZWhehfQu9aprJG/eJRPLfiyNI=;
 b=QuZRI/xQ9rmeGgBQixK5WmbwV89gNFBTUXDlEmI3lmjYApXIaehqHhSdvdRYdZtCxn
 IyMx2QO4qO5QoCUq61vkiNvaDdnTbePmJaM8PFBhONX6pCnvjh1g69UeB6BaITqNTHqW
 UbIJOiR1ZksNFzinO/cYP7X8NGQpYxvUsAql/l7k8ARCQbIzuFSpfovFk6DPY3Ddzd3L
 WuCapevYevaEj7bLcnKdOg9FYMxZrYKtI0HtLK++rocuM2kYdFKJZpkvwVTEW1sqJ5ov
 iXN0zArmq2DI6aCzYofbmH7MYeYdYTM1VBjbCAFmBowZVWzr4HLYLT/FMAmTQyYGDREn
 1WgQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021431; x=1781626231; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VIG0MZnjHRSVsFBrIeDs2gVQ0G0tC69GRVVdufLEJMw=;
 b=cjybZTCB+8aamQNXtJig/anCJj+WLzDYubfCespm2qLNNCu8noZ3o6VZTR+0MSLF58
 aEmtzaEOh30xhw5Bc5ddvAUn9rrYbkuM3KzX6ceWcp/1tZqqcOXQNNrlsZwl6jGkfGpH
 Fy0+ZLGhhgAN7j7HOkcE9FdrAL+tDor9vAKHXECpz3ejDNk68/JmiXmExT9GbzR/zw8D
 keW1k53ZNUko85vxBGn82tuMkrT9gV3iko0bA8jf+NeneX6Z4EJBvs7ncLEJ4UQeSfle
 l98zuxhXzZ2IgKdfwoacaDuwjGN2oAXikb/teSM1NJKdDY0wEbvujt8LQoWJT6ICAAIC
 Alwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021431; x=1781626231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIG0MZnjHRSVsFBrIeDs2gVQ0G0tC69GRVVdufLEJMw=;
 b=KlZoYqDeSbVGwzfJieyLEuZBatsL2gS+LkLOJmi0fdrKO04VHs0m+YGCJH9awRvdgg
 m2DSzskYz8lrLsFm0gg9VaGilGFSNsZBYa51S7UwtK+xGgf8xXM2KmxBIVYO7/ggyTwc
 tQIIChAS3nTnq+8scQGzQ8FniCvygLxo70INppQajRH+2oQCsOtc1c2oJ8md0Gyg+mR+
 kz9H6M6puVfRNBfzEOiHmQFhMB7wYovpSF4rVFfZJTwEM5VGX/bNW8pP+pjN82g0wNHx
 EDOYK/PnE+S8RJacuQkrDYCHf8AgFvECY7p2171g5p2idc0BSPUMP4D41eM5EJFvhRgt
 jZhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9llTUBMLt/7Rzo9gtn+DIihTQq1aLqA2ltQgzpVuOPfcPgM30zYLblyvMYDNJBBarUYA9r37HSGQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywx7QLhkC3IUNG/cA1qoQU17ya40/46S884DXNH0/kuLPc6jeMe
 rxUtOrITcMmWGPx1aUbn5xGrAC3Yd1N2GOckDOVVuQKdY2GbxBEhtmf1EXsAJeNKdX0qaM6eyAC
 2PL5LfCyvdlOjrusA/zf6WsZ9cRn60o9MJX0DYTLzTw==
X-Gm-Gg: Acq92OGbpWlzBjPxxNmMtoDCxm1TMW9FPxDRpQPBV9uxz+zUzddYHukUb/xdYnQZHH3
 oU14IsjndypkRwjwv80y8UVwcM0Xl7D5TR4piRukUz5+o5LbnnzZ2ddUlH3PHpoMgA7m7yQ9TtQ
 g0yO0EVqb5LIGowzAHOGEQhCgJ1b9CC8vaoBfAu9Evu3pD3t9i/ViScR0Y4Xt6/WmIJmScswnuu
 N6ArvX2RxYBPKQQx+iyxFVNNRWDgyKJ0cyKb6hnyWaeSXibEzmNiAyiZj8qFoLrFn26uhuri/XC
 MKj6k+YWlXKw2isTDywNrC7EKEXr5N00l2EUUQZv48KJybfMyqiQdxzlj5BHlr2jjYfvgqG8vV5
 l4Q==
X-Received: by 2002:a17:907:a44:b0:bd5:2c3c:616a with SMTP id
 a640c23a62f3a-bf3743e3051mr1079574666b.37.1781021430792; Tue, 09 Jun 2026
 09:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-33-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:10:17 +0100
X-Gm-Features: AVVi8CdRY5ThLQElmzgJukreK93-MzxXx4iJs8SRVDtMPE-EgEE4Z_b1A3ZTIso
Message-ID: <CAFEAcA8fCEU6hmDOGpFrdzu51=MoGHzU2YHUexQyowF1Zn3-5A@mail.gmail.com>
Subject: Re: [PATCH v9 32/45] target/arm: Implement FMLALL{BB, BT, TB,
 TT} for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
>  target/arm/tcg/translate-sve.c | 3 +++
>  target/arm/tcg/sve.decode      | 5 +++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

