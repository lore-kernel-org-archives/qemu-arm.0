Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1387438lfc;
        Mon, 8 Feb 2021 10:19:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFXtwJ69FjtjSSEe8yJFzHUnlC2lRhWXm8oc3M4GIppHZmFaRJLAAznUa7W/jp0jBJrkjO
X-Received: by 2002:a25:9885:: with SMTP id l5mr26175998ybo.501.1612808380203;
        Mon, 08 Feb 2021 10:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612808380; cv=none;
        d=google.com; s=arc-20160816;
        b=w1vgzxbvOKNcXyGXQql9Ri9tq8ZjL6Ath1tqEbnFG3PmPioEuAfr1aLt5yymDkrIu8
         /xkTchL0Q8Adoo4ywU/fhDQiPXH4muj4Deu7ed+RTebS0b+9kbqtu/BD7t7qZ4BgNxJr
         BiB6mc7jnDYqU1LmX056ri6Mjez8Xz22YIh1N4kXE6ZZ4m3wHoyoEtp6escNQD9RzaYQ
         innEw5hRS0EjICKYE/EMUEK3crXpKupOGlx1V/iNZYtRCOY2HYKnPl1vk58hpaLUqXqk
         0al6VMcOnzTpBhoD/eLkiIpsK64Fx0iFjd2+2xMSJLGd9lod1RCDzf2rUChhIDE9ke/1
         L5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVB5FKMzXu8wuueiiHvVTq8Z6UNz6HqUPfW/cauPrSw=;
        b=Uzl3ZUuq2tdcmFqQQ5W6mWPp5AsCunbzb3TXLT8RQUoaBYMddWQWHN7OXpRGu3PA8s
         2s/vN/iAtLviWtwEaF3sSOijWDy8bkYMlADa5IyuuaGLmAMr/97dYqf/nqNe6a0aLCVi
         0Z/uBdm8ugQfFDXb6ezC2jsNbsdWSLqwQ5hRq/fFC4Bw6vRYRAyKApwZ/LLJErz6brEU
         mGlgV8GDn+So5j67QPoPGD8Ws6OJF2Q4qAn/FEMSa+AMNjxMcy3Pu3uAsH9jQ+kJQ+VR
         Pl8vf6n8NmT77ERUhWWUCWFG1sNO9BQu4EIo4VGqUNt5PdbZ7T1Jnt3JisSs85FpH5xe
         aLPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mqtLOQ2F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f139si16508318yba.202.2021.02.08.10.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 10:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mqtLOQ2F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9B8N-00056Q-IF
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 13:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96wC-0004eE-O2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:50:53 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96vw-0008BQ-UH
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:50:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y18so18100490edw.13
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVB5FKMzXu8wuueiiHvVTq8Z6UNz6HqUPfW/cauPrSw=;
 b=mqtLOQ2F9cYoe4HXSmULq6HogOyd/tfxXeMGZYUgIznNheWbbRHYXKggLyZw2/uD34
 a2mniZS+bEW+NHoTeJTuYVwATAK1gLAfhNDpMukJzdLVL/JWJIFioom8WN2EyczrbRvQ
 /t0L4H7HEuZvHMjmAWfq13pXZKZPFLlmyv1eHVhPyhFERQ9HAo/UIulW3KPLzg7CjiLH
 TmAWv57AGw6QaHvh9hVV+cTzs+fURIP96T4xB04BaJTh5jzQIU3xS8BnJiP8HsnCvcVB
 tXNboSjCC28EDVAykPEFaMnczqHwSJVlsYyNlK91jO5E9RTQVXerOFxRQKu/pS0SCkOM
 yDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVB5FKMzXu8wuueiiHvVTq8Z6UNz6HqUPfW/cauPrSw=;
 b=GwXhNTCMUmHI4C0MdMg13Te9XTeL2F53nPFKu4d6ldZDOjSH+oZy4ck9ShFMwBcFJ7
 rjUPaWE+RRITqd7IOSAvkC58hDLL6lt/jqKPrvjl7jnSRTU2UPYKptBtVIqvqktMMB48
 5JHjz1jaxH3EI/SmGZj6M13cmIjvrk37wNYmiBGJfzrNg0TU5Xid6t8xhWDjy1pzeHdC
 6jQthT8dJn8rYNb37t4dn8y3/DJA11k3TXdgyRXBF/ymzPtDXqAylZValyNbFPz3QQzb
 zYe7ABeoVuXTyxSUss2sRwPtw1vQB7GqqiX7lV5Gh6m18HprQW0bwwSuMpYbzWz3KJDN
 fRbg==
X-Gm-Message-State: AOAM533BKjhsE0IuOOb4wJ1hYQteIcPVqHltsLdIulJxaehk4lALFNgr
 uCKH2NYm0Al9LmZOr0EfRmH2XUEaJ2KIjAibjz2EDg==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr16885108edd.100.1612792230577; 
 Mon, 08 Feb 2021 05:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-17-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:50:19 +0000
Message-ID: <CAFEAcA9nvX04L_RBhrnf9f6KrrzumyYzvTRw2z440poM7zJVFg@mail.gmail.com>
Subject: Re: [PATCH v5 16/31] linux-user: Use cpu_untagged_addr in access_ok; 
 split out *_untagged
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OJv+v3m2o7KV

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide both tagged and untagged versions of access_ok.
> In a few places use thread_cpu, as the user is several
> callees removed from do_syscall1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
