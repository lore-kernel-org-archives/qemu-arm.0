Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4174819njb;
        Wed, 11 Dec 2024 08:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1lhxLhHBKIzD1MhqW3A+n5V3/wR7+EEQlo0jt9vDxD4BOkb9HTqwTFYcKOTgsHalf58VSN3MmjAsWLw==@linaro.org
X-Google-Smtp-Source: AGHT+IHlX1sgTJ2sbep5vxsuzRfjEkcNbffUJ3ZYOCYV1ZCJhfosBjwswNF09HGz6po1CpHcvJ00
X-Received: by 2002:a05:6122:250a:b0:518:91b3:5e37 with SMTP id 71dfb90a1353d-518b43002b1mr721222e0c.5.1733933569120;
        Wed, 11 Dec 2024 08:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933569; cv=none;
        d=google.com; s=arc-20240605;
        b=RT5XwJQMeC2T/pnFtbUJw+PTmrkCIp+MwJS7oKRRgHZPxMhT3PfTDy7RxvfD6OkeCH
         SmwdAi7S3Bjq1ZeON1gKtRDOzzb50z1jULtN8ekN0NuwvAjlNtUHk5bvnS5I/rZoJZtA
         D/DmFKsHLsXsuZfK1xkZKrxg9++XuiKhR7XSFSx07SQOi7TwnjnYJfohxF0VDumPEVy9
         GWZ7Uwq29RVKfvGiz5LK/AX1LadVwpdG+BfVBFrAk63R8//kK0na5O8t5RvS73yDAC+P
         KDgnqZ7noNZ7JJhgsaGsFZAgaWvWxjJraCheZD7e8th8+KtyEf3vsHvAVsAD0KL6MOBU
         elIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=A52QEXv8FOSRjKI59L4HXMitBwhypcyabijsi9jeNsg=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=HV65ilsdqKy8FHc7tpyXfA8TFMwkKaD+IUD5FwXsm2dZqwx06li8x65PceZJ090IhI
         myWX5RXfTHmMOypDZiE8ZD2eqTk2qS0meLtvctSMXJZAO4/iCMqekox3Es2HHpcHJZSh
         1mvLrNH6aI2ACQSaNh9oAhPMRq13I5TQeV9Sq/KLKqiRHsjrKy6PZ4CG79dV7r8P+jtL
         aF1Rm/KkHUz7erNMu9X0iPk4W1AbimFriILQu9hi5TCVHRBmnFhmeBoZeYDF854BsspX
         3bKbMUQ1sGCpSDx/sv2U41eAYU9BbBzTP0RYrdBZz6xEU8YFltT0RQFC0T/HauY3zwOP
         txVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKLZ0C3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515eae16018si3596275e0c.53.2024.12.11.08.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKLZ0C3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLP15-0002oV-5U; Wed, 11 Dec 2024 10:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLP13-0002o0-Ay
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 10:52:45 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLP11-0003rS-UM
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 10:52:45 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e39841c8fd6so6301036276.3
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733932362; x=1734537162; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A52QEXv8FOSRjKI59L4HXMitBwhypcyabijsi9jeNsg=;
 b=BKLZ0C3+Kfn75zQG20qu2nZEYB0l/iTVHBIJrpdRw+y8GL/OcGIJHVKOTA3k8X4r4E
 ai7SP3ljzd3ttK/REeEX/TKpzdpXbjct6fv1GBamVohqOylZnWvZ17Yn7cQPjvMcpGQm
 v3f+LyqJlcRNCNPmeBEOEC1+Ne4Eqe18H3pssBtkxRwFEehefN41lNDM+KucjlMPjcNr
 NGEsE1sM9BG0kmzHfbRj9KiYMAKBaUULHmQg7LCLITeled2fw6rRnbVDSrmHX4Zv/hPf
 fzmBek3T7RW0OD72hW88tn3fQwIZyfmCZEc+Qtsj+YowOzlAplFVnUtpQ4zsgUUN2LTK
 jlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932362; x=1734537162;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A52QEXv8FOSRjKI59L4HXMitBwhypcyabijsi9jeNsg=;
 b=fqt/RUGBV6E9bbTy2cqih+vWvfsmKTAe4c+nwhUsiBhkOnheUy/RJ4eZSTOKsOlQnh
 jXv7LkWHgHzG4MBExAuTGqtngO6RhNxbV5E83Zbw/5D6tnafqpPqtPULdkawoW9ywYrx
 BfFuB1QvmsVrVbokQnHVrEmz003ot0zN1lHZlpEyIH1xvnL6PQ7I2kRAbHpLRAN6zJB2
 NpwBern0cK5rU01n1wbX3+CkQV8sevQ7m0sQsfMcaKMaPHLU/zqUXCiH3zyHyB522HFE
 3nLKTUZfhfJZJcDcvy8qhj157Q2TIOZkBUvmjsfQ4yPVK9yeGJu1y8dAsPp56H9+eJ1N
 JE6w==
X-Gm-Message-State: AOJu0Yw+zUPh+Lhg9EzS2hdY8FzsJLZYESXNBNNozpB1Uz2BVmteTual
 845K30nTG0VAsARwvu6nG86aoQenaC5XozQB5fJJy3RDAcCxWaykk1sS5Qudg/N2156S7fav3kY
 rA5ZWlg6p7ouPl2sha1TAcv3cVGmdyH3CxgIrbA==
X-Gm-Gg: ASbGnctsG5GFJ0R2Z65XaToEVYn5j8XWcDjAuFb/Hnv2Kn4+HkR/XXDyPC7vSDOkiCi
 T1EjE1hkXI8Qx7Z7euWsMzEbwi8nosLGJXhER
X-Received: by 2002:a05:6902:1505:b0:e39:940e:3252 with SMTP id
 3f1490d57ef6-e3ca0585b0cmr230004276.52.1733932362695; Wed, 11 Dec 2024
 07:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-30-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 15:52:31 +0000
Message-ID: <CAFEAcA-hnRuQ_rVhQU3+cfroZaa9xvnKZDH7xjhNCu5Sgxma6g@mail.gmail.com>
Subject: Re: [PATCH v2 29/69] target/arm: Convert BFCVT to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jf2k2M8u+xcD

On Tue, 10 Dec 2024 at 16:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 26 +++++++-------------------
>  target/arm/tcg/a64.decode      |  3 +++
>  2 files changed, 10 insertions(+), 19 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
