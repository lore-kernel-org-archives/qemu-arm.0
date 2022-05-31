Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3405505lfh;
        Tue, 31 May 2022 05:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqn2c5tugy1o7/wOicg3GUUDnB2FBf4spjGY0AuccWXYdu+qtu0w35pFbUqQ+ZXDRqCxoZ
X-Received: by 2002:a05:622a:412:b0:2ff:4759:84bc with SMTP id n18-20020a05622a041200b002ff475984bcmr12570308qtx.219.1653999063752;
        Tue, 31 May 2022 05:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653999063; cv=none;
        d=google.com; s=arc-20160816;
        b=l7KNYTb8S0tKTA3Gl55AUcVCcfsZzEkvtNmS621cyvZdrPhjG7Yw5dsT+6lk56LEFH
         26ikuCA9HYQf0uc5lTwYckruCwdcb9OJOs4zYYG45jrsgitOBXMGSPQ6o7gD4NGnZdjs
         yHtxmhYYwFU3FaAODzHdIE4NbNFgsCR38t+WrR76eM8s8WuM9FEvu7j0gYFZacrUwub7
         tScCMGc/DTpxMEj4CSrS6cNA1Vq5UkSISxK+PNhqHXrF5v31pUv4oolWgehmDVHSZRXw
         g3cwj1m99SfvejwOviQSMr2NTArWO/zlVZ0H7SRAsZB6A2K9d7NkIQHn7Ch0PREApKT0
         jnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oyMZY4+dOuamsYWiMlhHPYG9/sj8ofJWPISXtoYjxRY=;
        b=ZxoP4vPFseeNZNfT9eQ+UzwX9oj5r27+TQaxMSsGFQrS63fAopYJDTEdoUa/GM7UAB
         9HmARQNv/74oTZFQXsuNRQe0NquGN98RW4szPHdvllnlbF+DSaFUXyD7lR9LNnLD4I/n
         yEneNIC2uHnajUhC9W0p0t607UYJi/pZSuHdeyB5jE3h1mV+zqd2CgUWeKYZkh8672Gg
         ADKXf1PmsnUBOpGmAn9fIxSxRRN+9DU9YuOKxCP7W0CinN2rG5fehTzYp4gXiGDXsMcR
         W4+TktK41Zmm5f3x5lLVAd8x//wdpx8sexw7nbR7cJn6XpRCsisbLp1K9yOq4Tj3ZD1I
         Rulg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e205qI4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac87d56000000b002f9357a3a52si9142040qtb.122.2022.05.31.05.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e205qI4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0iF-0007wx-12
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0d5-0004WE-0y
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:05:45 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:41162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0d3-00026X-Eb
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:05:42 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3043b3f7d8fso126710107b3.8
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyMZY4+dOuamsYWiMlhHPYG9/sj8ofJWPISXtoYjxRY=;
 b=e205qI4+7lzSfMC8Iyn+/FIPW0Bz9892YBqopPk+J4/3BRn5m3nVhAFTCwx5CRHkOx
 dfDBfS8jYps4RcW8/Jzj4Hd0a1pWD3O9vgJVe1nsdOv3+y3iu3i2eoGL4k+zdjXVv056
 kceKwGnOClpyq/NhWHvU6AnZJLu5T+t+5lN8hPFJll0p2ZfBqWNszeL9qbG3oHSHbQg0
 rJyTHUb9xJK4MreFPNdIn6KffqCYZ1RPtI6DeLCWKa037G86r4iApDWJjqkfqWQ+ylN0
 IO/hvok0VRa+Xpce3W8P9wk/asQ8Cb/JH/8cTxoMalrYZXanVpJ81QGU+GfCHbIFxsNz
 aPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyMZY4+dOuamsYWiMlhHPYG9/sj8ofJWPISXtoYjxRY=;
 b=UhqezcoAB0WrY44GCj4NI6rJf0qi+umAp/oMZ/aA7l7I93tLDKjEGW66pFNmPZCF79
 tIaaEsLF2qLfoUW0SE9tu/NG3QnwoG1ur8No+A8U7JP4pqTm4zvVED1qvmEuKM4E8ICz
 bQ3KJUvvoiOOua1volhQYcjTN9X5PCpLuqslYD18f6fPUTMq3xQsmkQu3Dt0M98cBy7O
 JwHNR4nUFN3R98iP6ktHeMcgQzjKZVl6wMPFQSYBr5606mc5GlyJxnLdeYVC36jmO9hh
 bzQNkBZiiU0IslibM5sB4bUuMGWM6dHCpPHurgtB4Tk3kS6EI6YPyvExslkkFQAjitIG
 MLDw==
X-Gm-Message-State: AOAM532o5nILElIct2L8tqL1dMwHaGXwcZAxTQ3pkCD1L8UwAfNaDH4F
 TDj3dSOKsxWAB3ISgW4zfIw+yrA6wgIgpkQrcNwEqDrcMT8=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr19638727ywd.469.1653998740414; Tue, 31
 May 2022 05:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-9-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:05:29 +0100
Message-ID: <CAFEAcA88bS+rG+KnqKw23eD9D6xm3d=g4Aw9HCWzV_nrfWNhNw@mail.gmail.com>
Subject: Re: [PATCH 08/18] target/arm: Use is_a64 in
 arm_generate_debug_exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CWxP/bLHXn+2

On Mon, 23 May 2022 at 21:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the accessor rather than the raw structure member.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
