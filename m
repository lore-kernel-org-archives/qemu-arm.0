Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1237983ejv;
        Thu, 28 Mar 2024 09:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9lH1yatgB84Ik8QrS2Wnfk+WWGrYHqsTEu45O4Jjfal/WBfKYHwwOal/d7jth0fW4R2uV42NgGw3XeuaCLzi4u9Zrmgul
X-Google-Smtp-Source: AGHT+IFsbx5CPiMn6wOCl1Ie64rZeGYQsAClwWHHItzsF0R6KPhwaA5N/gmEj7ikWA6nAH0+gvht
X-Received: by 2002:a9d:6e88:0:b0:6e6:8da6:a216 with SMTP id a8-20020a9d6e88000000b006e68da6a216mr3378841otr.25.1711642279862;
        Thu, 28 Mar 2024 09:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711642279; cv=none;
        d=google.com; s=arc-20160816;
        b=MZ0kJXYz6o2TjQdC30RoACRElEYQpBZiskfgEIT9YNbEzrDVegVt4eVuEmeUKxJQMy
         5n8T5VBlv6EEiG3WaGhi8TJErp5wp3/GiIxThaLKxyrqpIF2f9gHDyyFMgfMl8wK06yr
         SXI/pDiCSTm899YlkbjEZmq0PvoxU8OIuMypPakCi8Q4abXfE431zOJ4KLylmTzjFlXP
         60gSMk6QRhkuFwsYKz5E66gUf2hMr/jFdtBvLQvKtY6Yt0N5GOWpDTHysSN9B67bJJiq
         9UtOs9TnDJOmpzOThjQle6aOSMiGwDggLXP8owGkPZ2mkHoqkzATJo7IiqDYIPZU2b14
         TilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zXbJUC+4/ewayfZwdMBa0QM6amBki2z9IDumPrJGiQo=;
        fh=8rBebX8pjO2aggyLV8ntcCRGsaSQgyr72rFRyCA2py4=;
        b=Nkk+iuc53rEw1O0xWdWNk7VrWwAtdsJONJ9+TOLIwbPRKpAofqns5tPknv0zoFT40/
         UHcV1ggyMNiLhPBkx3PVGBtyuGJ4vmN+sYSR9UPGp7/7sUp6BUisLPYlXAt0a9M/ueGT
         H4vt/7C6sPO0TOqtSftLmT3euVdjr1K1rXt1J4ROwFjxSssW+w1/eiXblXaqjArrhuLq
         1DYtPkk8pT31tmJYgPf+7XPPSW6LSN4uAQ3hla7TRPyHi9rZAH/RHrbcUIiQ9orbtA6D
         TsX3GjvufEb1OCEDXl1/s25ZVY/JksDXSxNMWPryWnZj5fU2GldK/cgiJmIy8gm/umPO
         7arw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFGb7CxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020ad4414b000000b00696a33fa20dsi1696752qvp.317.2024.03.28.09.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UFGb7CxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpsKx-0002wB-5U; Thu, 28 Mar 2024 12:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsKv-0002vr-FE
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:10:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsKt-0005m9-OM
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:10:41 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so1767363a12.0
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711642236; x=1712247036; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zXbJUC+4/ewayfZwdMBa0QM6amBki2z9IDumPrJGiQo=;
 b=UFGb7CxLe1jJv1njapIF6i7dpYouFAfS+MXKyN37JH4GhELuet5K0zJ7bZNFQFCJjJ
 pIvKvJLpOkuXxodvKDsML2+8ObwCwdH+qSu92QgGOm9dUquKx+vNcsVoNUqkZqRGNLdH
 Z07NXJN6Zzj6OX6xn3LUnDfuW2qGnLuWhHSk+LmQLKgzqwxSxioEZFBTIxhZnOVA6zXy
 jt4x+gBwlY0CBbk47tNEHDuKyWxcNfLWWmVWJ7O16/bd3hZvg429zf6YaXyZmhYdcuoW
 3LC+feXiJpSlhVDw/yc7Ify1EGuA70SmhIOkZzZMZbZir9ekSoHc3S7PBuVx1Aa1rtvK
 5DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711642236; x=1712247036;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXbJUC+4/ewayfZwdMBa0QM6amBki2z9IDumPrJGiQo=;
 b=gKnjkusR3ebzMhp3HuhJpy04/3ZhU074fj9XLY4nibfqN6Qqa6zIhL93Mk3G5f7Xu0
 yGQG8jrU9uMqNqy2k6Rgh7pP6xkQUnWeMv0Bkyupd8dpTgZifQTHPvvBqueUB/3zPBkd
 Q0s6rlc5tO8QsONdUEe21Sj+UXNxINdZyZxgqj6LbwJXu6mI6IYOny35RoSFrMXVEhAT
 vSBBPIHdeICStFe0x8wPTI3PmyyvjUJSHKBcsjIYkthxpIYOE63RDASgPitjLdXpoDIj
 IMtm6cH8fRzIRxxIAnq2mnM097vWaj23hKXCD3knwtlx7k1tYOy8jvxZBK3wabijOyg7
 Y2SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDoSfUVBtRNHBFYsY6rNfIJiUYtN/hQi00DK09US/ELU7qJtb3rBqj8yrzD8hGtySZfSAhFs/ZDTYnCPdNVSs8rPpj
X-Gm-Message-State: AOJu0YxWdmS9iP2l74dk4vf5z5PW1nK2h3gMyYopNw1uBsNMHUwsPtUV
 YcMxDj2Cavi2d2jKDrbl+G8MeNu5VrOiaeJBiibbinXhGDQ5Yf3h8P5BaNvN1Z6aaOEUm7BXZhi
 G1PJTfrRupiDKVhntDT03NZW2AdKTb5uf/WRMnw==
X-Received: by 2002:a50:d71a:0:b0:56a:ae8a:acc0 with SMTP id
 t26-20020a50d71a000000b0056aae8aacc0mr2458150edi.21.1711642235679; Thu, 28
 Mar 2024 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 16:10:24 +0000
Message-ID: <CAFEAcA-h-ddfyNXaa_swFJVc61cDbR9tg34AC88nqZLgfbzCsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/char: Implement the STM32L4x5 USART,
 UART and LPUART
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VAv6H43oZUld

On Sun, 24 Mar 2024 at 16:56, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> This patch adds the STM32L4x5 USART
> (Universal Synchronous/Asynchronous Receiver/Transmitter)
> device and is part of a series implementing the
> STM32L4x5 with a few peripherals.
>
> It implements the necessary functionalities to receive/send
> characters over the serial port, which are useful to
> communicate with the program currently running.
>
> Many thanks Peter for your review, I think I addressed almost
> everything.
> I'm just unsure about how to handle the waiting time in the tests.
> I understand your concerns about the unreliability of using the wallclock
> time but I don't understand how using clock_step() would make it
> more reliable. We will always be waiting on something
> that is out of our control (i.e. the OS).
> I increased the delay from 5s to 10min to match the microbit test
> and added a comment (I paraphrased your comment, is that okay ?).

I think I was slightly confused between two things. For
a lot of qtests we do want to use clock_step() and not
have wallclock-based delays, but we can only do that where
the thing we're waiting for is purely simulation time
(i.e. where we triggered a change via a qtest write and
then want to look for the result via a qtest read).
Where we're triggering something via a different OS
pathway (e.g. here where we write to the socket that's
backing the chardev connected to the UART and then look
at the UART registers) we do need a wallclock delay.

I recommend you follow Thomas's suggestions about timeouts
in his comments on patch 6; I'd forgotten we have a
meson timeout now too.

thanks
-- PMM
