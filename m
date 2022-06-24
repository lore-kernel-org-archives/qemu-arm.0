Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp389191lft;
        Fri, 24 Jun 2022 08:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1viAa2IiahgZB6i1ygPlp0rTDcYvTHEZpBBIMmosKHLBL5Ud4BTzHDkmKNVFRsacQJ9bnj0
X-Received: by 2002:a2e:6e19:0:b0:25a:7bb7:b133 with SMTP id j25-20020a2e6e19000000b0025a7bb7b133mr7757372ljc.374.1656083025512;
        Fri, 24 Jun 2022 08:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083025; cv=none;
        d=google.com; s=arc-20160816;
        b=yZ32+cWup5w2/mqpIVauIB1OaRc/1pxl4vq8Jb/ECgakvY/mEf+JOgBlFc8+fUX+Yi
         wP7BOcXh3N9VfUjJA+GG0/z8oDE16iIaNFHkXLNSrcYI5qO8+/CNP5Ty1svNBolmVmOt
         URifWOzn5qF0bHGVxglqz5md0ZuQgdMOUJaD0nFKQ4jaM4Kn/Oo6KYP3XC6DOuF1eXxe
         iL5veDwFJWUc8Ff8fYfBgXFAwmXEeBcMB/GWM64Jzf/GChRYvI+Iz9wSs9rUmwSIBOu/
         /Y7tmjtFSRMcAu02A2qkA4VKwvSMoSHpLs4T7+qSHvTBwOBy/mSYpop8giIG/D7Wt/Ca
         zZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZMgcQP3SDdix/uL5DAxBOxf5bx/7mqKOZjDxOAb8Pcg=;
        b=fvdNNT+jSCxKm/Kc4f3biA67OGiN6IDkVD0AeBxgFvSqECblxX/sLvj5F/u7kUwcU0
         gIcbv+BHOyR9EbEuOuba9okoIL6B5OGotuZ99beKNopdZsSidTCMKu0/BDTCVRPq9o3h
         lbZPzA41m1pjU0Z4YGQCd0pWbuf2px7ogdp6LLPwiYpq0nc6xc7ROZ1pLPVZWR/C0n34
         m6uj4Jm01JWzxZqKMS1qEnQy8b2e83jWtVTVMcX1j+POtpMm2tuyvpD4C80Dx1jKiIFB
         KwtZdPwyNA+vudyfwhNmD8pmbZQ5XT112dSjmX9wfNRxrAL1UesLm/Z4nAN8WJxscZ65
         dc5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMohoIig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a2e87c6000000b00259b2bf7e77si2450557ljj.422.2022.06.24.08.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:03:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zMohoIig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kqW-0000c5-Fd
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kqF-0000b3-CW
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:03:27 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kqD-0002Uh-TZ
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:03:27 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3177e60d980so27177527b3.12
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMgcQP3SDdix/uL5DAxBOxf5bx/7mqKOZjDxOAb8Pcg=;
 b=zMohoIigwHquNYd7LAcCtmXnb8FNNEaCCx1bE8uhazMByclv/47AQpkkVXBi1SGS76
 Mc2QKw9lAVNKX9yehka3J6a3tzcoGpfN2e0HctL5UBsskzlU0SLgFzvtCjG2zwhvZxEZ
 S5H+5pBRnAt+VBFwQZvn+5qt6RRQ8B5IpP5iHYWpYhaCID9H7Wc89nPtT18kURnmXUCz
 D6HXlGb7tFKKSzYurLfDXsBeMYmgbV1Nn67L+n6ar83/IdUvzbSp4KRaqEYKaFhzKbh+
 Yrdd23OdGe7PSdJmnDiLsdFbzT1XKzMi9RWmj1A2uWENw96l8bN6Z8gazLjZwJaYo4V0
 kPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMgcQP3SDdix/uL5DAxBOxf5bx/7mqKOZjDxOAb8Pcg=;
 b=lje6qrgPRNu02YOBtfwV3mhNjioYnOrVn75L+J6lkxDZzl5SKnoD0QvI12oLAl8+Bm
 hrvXWyGQyXoOgS3uQ7HOXI3NjjqodyLhZunpuKtD4tWv/OyyjKw725siHSPEsDRmQ+9h
 hiFMBDXie1OQVArcw+kIFf0X4sp0V8O5OuBk3dFMvG7z1uDYB7q18aEYjHjX7uO63tYw
 f/kC/uo1LmscO1EbirAvlT992vmzOo0+5Oyqzo241P3p8tQULFIw0ynakhPGfCiJYeba
 In+N2xwQIo3AAxZiUFYgv06D7ArAVFHKc5YV7VOYgK6QeOjBWCvyhNLONiDHlt0KuUT3
 kTtg==
X-Gm-Message-State: AJIora92xhLQThdfAN6bfag6ldEHifL+sBjlNTIAj5r9+PRCAMNC+3jZ
 0suWUEA6qq/3kZvM3VPWvncdasySbMgfEaSv5hOvkw==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr17529235ywb.10.1656083004803; Fri, 24
 Jun 2022 08:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:02:47 +0100
Message-ID: <CAFEAcA_V=W_G1MFnaL9DkOMDouiqT-eqc-daJnqUunqWqKTMDg@mail.gmail.com>
Subject: Re: [PATCH v3 00/51] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: BtNGTzDovKy1

On Mon, 20 Jun 2022 at 18:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * Rebase on mainline (20 patches upstreamed; new conflicts resolved).
>   * Test bit 31 before disas_sme.
>
> The first 21 patches, excepting 17, have been reviewed.

I'm applying patches 1-20 to target-arm.next (with the comment
change for patch 9).

thanks
-- PMM
