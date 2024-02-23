Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp684628ejf;
        Fri, 23 Feb 2024 08:54:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7ynChUs+7qJIsdVN6QgVv563L4zEZY2upqtaWdGg0teIS0vZ+6X4pjD7Izch1WBwRe3YuCf3kL4HvOMzTdi8RAmckhr/O
X-Google-Smtp-Source: AGHT+IEhnJX/Eca9DVXKWmYVqIzRNYdMRzgxcBTjGSgSmPXeCLaJFq3c8ms7KU1Nenu77oq+I41X
X-Received: by 2002:ac8:5990:0:b0:42e:58a0:3513 with SMTP id e16-20020ac85990000000b0042e58a03513mr346017qte.67.1708707264711;
        Fri, 23 Feb 2024 08:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707264; cv=none;
        d=google.com; s=arc-20160816;
        b=FU8zbMnFpAJJxya/E9nLEEHqOEQjgwM1GmRM/sr/vZv00y4MqFl3ZVuvlW8+PRRcJN
         ao/gyV6Rgqm3XYab0jHgkA1525mVz0beIPmJgyvBWcgeQODgxweIsT8xumcSLgyCWjOl
         SiiaP97Fh+HIrazFa9QNPnj+o5clRzUYjabk7zWtpMH+mhoCMDM/LjW42Zi5IA9edbhB
         sLGB6ysrk5nIMLMtzR+h6tBTQNZBlttQT2zqicboAK+OYkVvUXD3FCQsxwlxdabj8zoY
         NG4LUbTlkE4YtZgGsJZSOh6q8VEKUiJUOZ8AKUBp+vrsj9LQcVvfTCksDTe9qSM5kpEQ
         HlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WFBKtG++m5WB0UPPcxAztOZ7fOz1Q+/mOVR2jUOw6DU=;
        fh=TkKiLr5MBMflPq/SiD4917XdcszMGSctb6d/vzqsOes=;
        b=JLrZKBCt5Ui0vDMlQrrrXzOmBaeMkdNkX9gmxeeDfvAQuAyl+DZe6JJJY1FIopoA3b
         dx2C/s6Oi2Mj5gOqOnmu1AqHDLHDmVoSMivCF62kq/SeOW97P8u/cdQD4PkYWvxrSGod
         rJLsAqRF1W97ThQhR0t2UicQR8/ZIzSU4MWrlfnpKKAdgQQ9syasVmTbgOtNXdoqIDZR
         RvH0kUj2YA7G0MPYBN5mkeJ6FwXmIvbRgtSjUtDr+EPAlMhGjddi51u0ax7odggCyg8q
         j3vs+wm+OA7as7bQYzt6m208ztl5k750OOLvOj9HlildpKePMa8hGW7qaHS3LpvElHvu
         Ky7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pws0Y2NK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020ac84985000000b0042e6a478d99si512796qtq.367.2024.02.23.08.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:54:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pws0Y2NK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdYnG-0006Sh-2R; Fri, 23 Feb 2024 11:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYaQ-0008T1-Qq
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:39:49 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYaP-0000X5-0C
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 11:39:46 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so831439a12.1
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 08:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706383; x=1709311183; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WFBKtG++m5WB0UPPcxAztOZ7fOz1Q+/mOVR2jUOw6DU=;
 b=Pws0Y2NKOf90gzhOkkSR02yUjgmve23syBH6Th6gzcOhdyPXwMCkC1sMHoynXsytlY
 hEGhaRP3p/keAxRtavEOC14rhHx+xoojjyAZ9AhvkKMQ1vrKGMD70uQnOTpTWERK4XH0
 Bxnia+JHn9X1ob94QsTyfBjcR8EQktRApqZ7G2qlB8K0JQfltdz1dnzCQlUuew+2tCDj
 h0srVKjCzRNIwnAdlmTPm9TFSv4bsWRSlsHXbM26zLrEjJGyT6UDu9seZ88CLz+laRtx
 0FtN+cWppM0qjLlxfW1qj5K7wdJIUL2YR26cB0ByDCbEv5K24OlC8mjyFM37f0RRoqLR
 ymDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706383; x=1709311183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WFBKtG++m5WB0UPPcxAztOZ7fOz1Q+/mOVR2jUOw6DU=;
 b=vtXxOCJyJ2Uh5HGLPVLBHLixySAeoJEEE5V0//MN1g8YnwaQ0Z9l1sqVeuSAoSJnDI
 fcvQNsAPrCFf0dva1ipiOav3EqqAfEJrZfkcJiHejKxD23j6BdI1fIOB0m9nQ5J4RfnS
 H6xfF2aG7oG5c4WYKYqCdwgOqscxWsncpXIlpKECZONa2hvbolmJeOrW/RPM6ZeT3zUq
 LEnCdjNjvYcN3pJaM600ctsTct1bbXtq9GWbPifaVyyQRxS3U2jcJPFAjhi194ocN1jb
 DvNiSOCycmUV+kWYDgEMwguxGbaf4znfqFMy67u1w9j2qP1NUysn7in4xqz9Rf/SRax3
 ilyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpPcwKohlbB1Oh+KYl8QbsfoJ2oTDg3q48mRylSkJcgdo84YtkCxRgOPKZJqQwuvSMTeQDPaRDTZBPvfWbQNu1VGg6pqk=
X-Gm-Message-State: AOJu0YyqxlNQoupROpxpDYe4H+ASRutGZqCCphhllHNyxUzOKXbZ3/Fk
 5A5XZ2Ozd8psW6TEDylrLBkxaVpkYVG64ht7nE4zy3nFBu54O0EBVT0Zmwmk41bNy0mFsytuOqI
 7WMYoZUdXk9sP04+88yEc38+2xumaPbiLgKsIkg==
X-Received: by 2002:aa7:d058:0:b0:565:71ad:e1a6 with SMTP id
 n24-20020aa7d058000000b0056571ade1a6mr230634edo.27.1708706383354; Fri, 23 Feb
 2024 08:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-5-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-5-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:39:32 +0000
Message-ID: <CAFEAcA9CJ4XG2xdh6zLj85QCJOLRyzJwtjtUk8R5CxDW8OYACw@mail.gmail.com>
Subject: Re: [PATCH v5 04/41] Introduce BCM2838 SoC
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: nX7iAdbYaFLS

On Mon, 19 Feb 2024 at 01:20, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838.c                     | 98 ++++++++++++++++++++++++++++
>  hw/arm/bcm2838_peripherals.c         | 72 ++++++++++++++++++++
>  hw/arm/meson.build                   |  2 +
>  include/hw/arm/bcm2838.h             | 29 ++++++++
>  include/hw/arm/bcm2838_peripherals.h | 36 ++++++++++
>  5 files changed, 237 insertions(+)
>  create mode 100644 hw/arm/bcm2838.c
>  create mode 100644 hw/arm/bcm2838_peripherals.c
>  create mode 100644 include/hw/arm/bcm2838.h
>  create mode 100644 include/hw/arm/bcm2838_peripherals.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
