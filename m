Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1200764lft;
        Fri, 1 Jul 2022 05:26:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1syeggXoQGqd1RsGGb+aX5eLXaTvsMevNbGxI3lERPZT1jCZ//CefSUroqUf2+irCUPGQJz
X-Received: by 2002:a37:a448:0:b0:6af:dbb:e3f6 with SMTP id n69-20020a37a448000000b006af0dbbe3f6mr10386537qke.356.1656678391962;
        Fri, 01 Jul 2022 05:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656678391; cv=none;
        d=google.com; s=arc-20160816;
        b=LO2i23+/A3z76KjH+0rdgq0h7KPsWyqKGRBZZoulbIIzb8fFQ2GOhoX5Azgztlrfwo
         tOw3mqcS+fNRd80725nlLiaKKBMU76AED1pOjiopZCMyj98bQ+iGlfKmQkng/kG+bACU
         O/HeE2qTtDuoFIOYcQgnETCqe0nHgGB7NG+Xk8wsUY1DQtqqEkrZG3SQCP3VKN21weoE
         /4kOrn4UI7UmPPfrxADBRD6x+yZFIstXaDgBvcZNZT7QvxPNJhKdPvzROn/rFe+KF3fM
         8BpSKXGzUYIg+fCr4NeEJpmNFGlX34bQYVJNVMzPQADJSBSY2ifLmtHSv35yDUFjLUOA
         9bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1HAE9tbimNVrGwXWOXZ+AOUgTZ1SN+6rxBaj40/mJkA=;
        b=oG51NzdJhLihCu6MJhUCHGRNcpi8nkbOendfhDfLl+qWv+3aMNNhG+L9WQRVWuzlEx
         RZ0fgfeF4uaHurovpPv+Rk8yC/H/yAUOqV/ONu+PHpZuq4nZn9VMobPv1VgdO+oJI0F2
         apQyKJjjHNpPQg9JCSle+GLc6fe/APhTcBeTgXlCuCbewk0GB/8vob/wy51KLDih/nOM
         tVZLBtMNBX6pkv8/8nLKMHSMif1kZ3C2JCVTD0lRlGPD74QAw8oAhqfdo1M9U+ixZ6s7
         sDirAH+WlZDibRj9b12Uyg+mwW2cDNUaH/qUFbaYPqXaZOycaNVKFZkclk+A1fYSRiN6
         ZrDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=louvrRcE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s65-20020a37a944000000b006a6a24b3398si11559865qke.157.2022.07.01.05.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=louvrRcE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7FjD-0004I4-EJ
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Ffm-0001Th-8i
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:22:58 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Ffk-0003wr-Sj
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:22:58 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3178acf2a92so21926407b3.6
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1HAE9tbimNVrGwXWOXZ+AOUgTZ1SN+6rxBaj40/mJkA=;
 b=louvrRcERJDjpqO3Nk0D3kLBJuPmK9rkfrNS0qrpnI1c+A6/wSbV7dj4JNWb6Ko+nu
 ouTOehSExGWkSLQh9wB5QAuem67YbcfzvC9VDUb6Q4ftthuvSG9wgpDNpN1sBzauf1s2
 RdFy7wdH8u3JDTH6jOk0sAG7cAm/zzbvm91Bg2PJYBb/IvQpRzLlwJpAKQbDWDccw9Bl
 oy/hpEL8KdAnShY5j1jpDTJqwbtv2Hmg5WyJbGU1pq/kTxaEtjRYUZ9GZwI8h5FmOXRu
 ZWsUmiAbL4WJ9s0EpjTNej1y5wJq/5mq8mqI5DXyJXZy7hRLsH5icNbprvCjGYKvbhud
 8gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HAE9tbimNVrGwXWOXZ+AOUgTZ1SN+6rxBaj40/mJkA=;
 b=J5QcSGmi44378HUz5I/q4L8vv2fVSqMPFdk2lZXJf7W2kIhG1KqP0WsJjkYJdNO0u8
 kkQ7u0vMRxTXJ+NGunIk2VxmvlZvHBAAno3WcGAdOeVSYDNlhPlDzrAXjlHqrYdaoJpj
 tkjGss0Y1l+WlJOzTf+Pwhcr73Lk4VoDK5UaVe5dhBEUmJ8juqa8p/ivyNDWnXBPoAAw
 zdnCqf80cIr2rCHha2dCw+Sk94j9xC+Ao20kCbEh7YVzdR0FfevYCxrPKj38O+7tbKC7
 WgPkd3d5kADzPYd3QC4Y6WYmatXs9YWbAeXWv+Iy+eAykxHTCAV396g75/JAjS+BFu3T
 RCrg==
X-Gm-Message-State: AJIora8d5vIPNWdfJeSG2hDlaxmdb5K6FT8L/BjW13se0AKnavWcOSTU
 Fjl2lgpSzc9V7OQyiloSA3vEH8P9PJ7fFP13aFQSTQ==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr16007805ywg.329.1656678174017; Fri, 01
 Jul 2022 05:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-10-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:22:16 +0100
Message-ID: <CAFEAcA9B=2dHJ7m927scmnLuW2V2_r5_Bi=w46QX4=hzVWf-nA@mail.gmail.com>
Subject: Re: [PATCH v4 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: oNV63l5kF77h

On Tue, 28 Jun 2022 at 05:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
