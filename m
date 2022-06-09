Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4091057qvs;
        Thu, 9 Jun 2022 06:13:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzivD76ZOXPM84fGlLHZ8gnCtburyqU/v6N/6KWfZGyBDzzEOWvrvds50LdmH9JMj0RTJnR
X-Received: by 2002:a05:620a:40c2:b0:6a6:d274:dd96 with SMTP id g2-20020a05620a40c200b006a6d274dd96mr11110038qko.54.1654780405244;
        Thu, 09 Jun 2022 06:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780405; cv=none;
        d=google.com; s=arc-20160816;
        b=jl9mdYyiTBBU41IVaw5A0WiBvNnDWP2+j9nvukqf7n/c+GgVnV8BlkPE7J/VHodn0J
         ZZj9y+Fhl1KJ8F+vCbRKhltpa8VGhmPTMGw3UN1OYADEd6ET0VIE/qvHPhwHn5LVhz/J
         as6pcJLjXAJeVEBShE1xs0EHZcW9RICptEeZiUXApSs26EiQi73Z4e8t8BglL+qCd+5j
         SZ48JLP0HvuPLOTnXlGZlhEO6qt97ey32mxnkhxJ18i4W03iooAV1cgbRE8gU4nSb/Er
         xhUMXuMeLhunlMv261J4dQHCYhoSM/SBFS85xbrZr5BbnbI9TEb/OFWqLVq2SbEJlQ0R
         9Clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c6n6dovJPObm+H3LW5naAheIKSyAqd5cIE43RLXimY0=;
        b=ifVvbELplDpkNO9mqyY9NdT3Irjne3bp8+9+e6gKfgCmu/JUj6+7bzk8wAEcQvSN23
         I1gl/bOzjiumEAcp5wNiJTBh9vlAKpmqgk+1SVa/F4XpyjzAnRru4OD3IbQkPmICQV4y
         wdMWO3yHUGOKaozXtYEb0mN3yJ4gXWLyGgDB/rcyGda9jogFPYC5dMjQsR8FC5L2npKL
         3B4uKMIBVvTakOhfZ20AiEC3hRDYuEOMisj2lhYSH3BN2OCjk7ozN40TUGEiMDgR1zvT
         n5/lPYV5CNsbRPLtlXTZT+mtGpSc8EYuRPgDokup9OrwvybkyvIISZVU/h90wdid+G0A
         TdPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kvmo4Lb9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f33-20020a05622a1a2100b00304e4924793si9523684qtb.440.2022.06.09.06.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kvmo4Lb9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzHyW-00078M-Ol
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFm9-0004PX-LR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:52:33 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFlv-0006p6-Ke
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:52:27 -0400
Received: by mail-yb1-xb35.google.com with SMTP id v22so41121929ybd.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6n6dovJPObm+H3LW5naAheIKSyAqd5cIE43RLXimY0=;
 b=Kvmo4Lb94YhThUT8/U6NUrS50t1M1O7/2T81pCGxsJnxggzrT9qmF1eXxpfTBhouuf
 hhMWB7mIrx3Qd3ANFKJxIkl66OZGjQweZL2ycR4/5ujYBLlzCIQPO+BzVeUgjlp5PRCJ
 ccEVKvZeEIPccPdaaN2tUTI0/FMkf2nK5TV8HllQP5n9P5bPiAjGtA9qR02bOeSeuRzJ
 FJuTqf6hNupiZs6I24+8qLUzPY+y0CSn4qQovyHSmCSjQw2YajveIsAf0tU9KI79Lj52
 T3xl9EAqH8yFHwE3HIv6awFnW3H2YRQvuOWo7PUJu8UtqShg54nGgzOf+P80nZAUC8rr
 2T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6n6dovJPObm+H3LW5naAheIKSyAqd5cIE43RLXimY0=;
 b=u7yd6bWEa7sdXd+hBM7C+ksG8jjwTG8V3DgnFId+WWSjc/KJnaGD/DzLXvW3HxyiQL
 H50bSElIKlXMsuTkkF8ttfCzOF6O1zHTj7FUQdwFO7ao/COqSpZpSiBlpczi/lr/QV3C
 zZWRrmxt3LeXd/XHQktrOM9rWsTMvLr1GaDthJXg+/ogi4qKNmiQQgjh26xArIXnpk+T
 jJYxWWukiMDJR/KIJoPMnXTOtdPgldv+CjXDRzOoYgwuMr/jzxI93O/2noWYdlb9El4S
 Wkt0m2kd97GkXo0f4B1TkZAW8XCL9ZCARebcluH86OnvWjKVsEeYooqEzfiH8qn1hWw5
 PuyA==
X-Gm-Message-State: AOAM532WzxrTXSWRGz0Np8HrV4R8VnX48aDjhMDM0rAJYp5P9Nz6HadZ
 tzOUrTBLPcGAFrrICNWgNhCN/1eUWd0raLs9y9FY2w==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24884038ybt.288.1654771933462; Thu, 09
 Jun 2022 03:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-26-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-26-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:52:03 +0100
Message-ID: <CAFEAcA8GEEZktiQzbMvRKaAiEa-PZcEGQ5vVinPw4ukEOOLM=A@mail.gmail.com>
Subject: Re: [PATCH 25/50] pckbd: implement i8042_mmio_realize() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RAeyu+ePJc8l

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the register memory region to the I8042_MMIO device
> realize function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c         | 12 +++++++++++-
>  include/hw/input/i8042.h |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
