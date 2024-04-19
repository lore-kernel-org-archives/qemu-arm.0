Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2448066ejd;
        Fri, 19 Apr 2024 07:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtFXMup1O4X/CtgzdcsH76Kna6QE4R6Hog2/VQUnyh88xuy0C3PHn5g+UwuLSyyoYGYMTVSLsbL5ED9VtIcGLid314b0ON
X-Google-Smtp-Source: AGHT+IFsOMVL7gMDh9ogjk95a5OcXW0yA/kQZIUyaVCw2BfC1glzII7gGbBldIongI6FpQlSL9gn
X-Received: by 2002:ad4:5145:0:b0:699:2754:2e8b with SMTP id g5-20020ad45145000000b0069927542e8bmr2520969qvq.39.1713537811121;
        Fri, 19 Apr 2024 07:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713537811; cv=none;
        d=google.com; s=arc-20160816;
        b=J5tKzM4m/iQMXwmjaqauFhZJaJec/AU5QzD87UNMcUr+0GTY01dcg5AlaSy1eye3dP
         QdCdauiR43EtBw0arVyp+2HjCnCs9QyL09tDlMzOEV03R7CWcbOEmtw7Q4yTwKT7fg/d
         4sAxeuJFQ3GF8N7KeSNZorY5+nnQYODtTxDnvQgbPH5aWY9arzPopb9FhmjU+8R00H/b
         mQgAvARTn42dJjeWx5qBXhE7Qdr3rHoHFBDLwuQNGDOt3G4oRM5eG3SP0NjXNrPSaK/m
         Yj9Yhsb4sSL9MNXJfEL5dWvwaZ/tNQXakZpOoBBcSiBXbHYKv/ahZF7SFop8yU71GH60
         UrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TrM9X4uMslc4/C1Na1YYTRdStooeAAUKzGJl409xXY4=;
        fh=3GeTgMOoB3lc9IbObTQJY1v6pe7T0zh/KswxmAKVyU8=;
        b=Cinvc0XjXDHI+AAmJAQXhhmisIT+BkdbBGd8Ey+W9axuQD1hZXZ01UoGRuEnN8Z1/r
         VggPiwUTbkm/AgaD8jbroftOqB9yLFBhRU0b98VlpNyJB7jw+FIdbkJCHKqd3WGqQnxQ
         A9y4s44vgs0UxOAFvzUCyMhYtKaESkTOU3TtdmlCl6utK2cJBMXJNbmLuhu8OCGvQ6Fu
         f1lyK4yjBKOARIMg4N1X6PihWaD6fnDmI9FASdELqxRVKdM8xxggnEwkVgYcpQrqtKnx
         Z7NwtSdn5ke0KVItKQgpUTMQB65Q6XyPRzc1VSAtaHhVo7LRQHEly0PuXCuIhQpEWdDp
         5FFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K0yx40e0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl15-20020ad45e8f000000b0069616bb77f9si3943407qvb.612.2024.04.19.07.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 07:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K0yx40e0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxpRt-0002Cx-2y; Fri, 19 Apr 2024 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxpRq-0002CF-UC
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 10:42:43 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxpRp-0002Jo-BS
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 10:42:42 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2da84f93c99so27487921fa.1
 for <qemu-arm@nongnu.org>; Fri, 19 Apr 2024 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713537759; x=1714142559; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TrM9X4uMslc4/C1Na1YYTRdStooeAAUKzGJl409xXY4=;
 b=K0yx40e0v54DbrISlaY2hMkpoQi5qRJ17WNke5nm0GE+fUSnNj6VjZFXYeecu5J0Wt
 p/6gn0dAix/X3wRPUY8DEnURE1qWvKa2utH6YXk8QsxvmaAhECNHTygviLWON1ObeqRd
 Jb5rqIda8Wc7Hy9EVCojvdo0GdW7u6tkk1nvpHAI1GO0yWF+nUkhe38KFw/K83ZF59qU
 TFP4NpDE+6XK/24iDbAIG2v3djitIr7DcD/ikc9UdUKISD//UH9j7+O9qtKWOtYMcwuc
 90v8E6gInAsgSeo/RoWuc/NtB4npZpcS+H2gj1KzUPg7aj+UO9hGYvQ3VCtOt8ElRMVz
 RjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713537759; x=1714142559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TrM9X4uMslc4/C1Na1YYTRdStooeAAUKzGJl409xXY4=;
 b=E+uUKwuarRFLA44QI3SkZQeY7NMIO/5REUZET0bHUPsPcNDyiXqmCDGVr2eimuncuF
 lSpm3rwfvdrMsc1nEAkAteDNTbKYyLUbyMIYCjV+/aebsgGHTGqop8UEd+S/6/Yt+tOh
 hYJfDmXo3tPsXpRBphZW1qGpIBrLc9AYuWlxqgcteL7Wt6VrQmG7OIKGkj9wdqbZUqOD
 Mxf/nRTsYHCzS5kU/f6fLv88/v5dBp4MNZXuy4y+cKR2/aXwigdzkPCZ66if1klrddRV
 VWeyac5zk2z4ukM+4i0acfa3mUxWgA8VTsEL7cgsBytutdy67unnYzr9iRiY6bK4fZQl
 f2JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7W3CsUHdqkRcK8qc4kodrguMvD6mTQy6OF6eYOjX58XLWiIk1uACstzlFZnMzjqm2Ld3havLSAi/aMJPzeOQsiO5
X-Gm-Message-State: AOJu0YxPPgX+9yYrQaP+6+K9/xzKfd9ybVltHPsJLTPaXpTqYLFK87N/
 Yu8cUme01hlrpNH8CJWIW+eaVAea+Vm2cRcjX/33VBjUPuzm/VGpUMzr+BaW1Bg5Q3oonfOFzig
 LfDEfQpIvE7mQr+Q535jcnR/JOOgwgcOMmQZ97Q==
X-Received: by 2002:a2e:8195:0:b0:2da:4bf:ab14 with SMTP id
 e21-20020a2e8195000000b002da04bfab14mr1922719ljg.45.1713537759226; Fri, 19
 Apr 2024 07:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240329174402.60382-1-arnaud.minier@telecom-paris.fr>
 <CAFEAcA_xuXMRnmFMs_GzfrDN_kpR+c4C04OcPjxtz+hSB_ga2w@mail.gmail.com>
In-Reply-To: <CAFEAcA_xuXMRnmFMs_GzfrDN_kpR+c4C04OcPjxtz+hSB_ga2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Apr 2024 15:42:27 +0100
Message-ID: <CAFEAcA-mQk8XZ=nBRqRBCotMVP_cFW3V_cn0efHq0UbKfDgZow@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/char: Implement the STM32L4x5 USART,
 UART and LPUART
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wpVexm8dne1J

On Fri, 5 Apr 2024 at 15:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 29 Mar 2024 at 17:44, Arnaud Minier
> <arnaud.minier@telecom-paris.fr> wrote:
> >
> > This patch adds the STM32L4x5 USART
> > (Universal Synchronous/Asynchronous Receiver/Transmitter)
> > device and is part of a series implementing the
> > STM32L4x5 with a few peripherals.
> >
> > It implements the necessary functionalities to receive/send
> > characters over the serial port, which are useful to
> > communicate with the program currently running.
>
> All the patches here are reviewed, so once we reopen
> for the 9.1 release (in another two or three weeks) it
> should be ready to go in. I'll keep it on my list to apply
> once I start collecting 9.1 patchsets.

I've now applied this to target-arm.next for 9.1; thanks.

-- PMM
