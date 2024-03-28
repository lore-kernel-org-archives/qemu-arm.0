Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1230521ejv;
        Thu, 28 Mar 2024 09:02:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCyJjMhBjTzi/uvMuwx3+4NvWo5xyYRvORB/qvVqMpMxQt3/JMixd9O/336+HS9JFlDQ/QShHUuECTWiQFhOkgtTFR9DRN
X-Google-Smtp-Source: AGHT+IGo9Ro+QiMF0N+ENfWJP7LnMOO1Ge46X97iKB9bUifBE8TFORql42rcRjXl211ZcUOzdzKn
X-Received: by 2002:a25:a06a:0:b0:dcd:2aa3:d73b with SMTP id x97-20020a25a06a000000b00dcd2aa3d73bmr3245431ybh.50.1711641763381;
        Thu, 28 Mar 2024 09:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711641763; cv=none;
        d=google.com; s=arc-20160816;
        b=gXkJC7SY2wnoyyWOM1u9xyX6cNgTckED//gLU+4EVQYxIeDxwWRZY9oO9BBRWo4OX3
         /uaYjV3xL0TBMcK4Mx+S3bAeq+PkNSFXThA04O5x4JO5MyWmZ5KsZGgoodG3Be/xU0YL
         f8v0mzPcb2ulCtculaV1uTLYK2lfVXtVghMvjwrK7pCzw6G2IeQyju84R3NaStrNGXjP
         u9orVuCtBT43aRO6r+8CdBbcYFACzx4+k46EPsRoYDLGMdCXRt8NJjYWMuFR57fzgq/a
         rRLL0UH5S07UNzjqH0E0YAINPRDNzNqdnCNFkz01bpAoZShOsSEgApan30UOp9X1P0Ze
         El6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QcldUbAIFy0PkGeg8xYS7bg6xqgF5gW9ha8ipSjrP8g=;
        fh=/Y0MHFkvUw+FYhiQ/1w4D07er21AB+DCOn0hUwVEeec=;
        b=ttCJWXPx6bl0KDoOIHMqMW8qU1ycW0BqYBFJbCLARTbP9izeR1SkR9QrPeAXQoEDQt
         gUCZSzhk1TTu4P/qiJXxbUQs9lSStYtqQflsF10eq7CY0OtF6nLZd1gPs17Y9IMYscMs
         szQMbp4kfiUU/jrLgqqRv5TC355QX/2ew2jV8Nrdbw5yAVZ/2BMGs16gJVA8brc4mZIo
         TR2NdHAVPfTLs138nIXNSXI1PrE+C/j4T79fsh/WEw1cYH+jUPJBltE6bZspXgQVqQ/T
         RqdeP9QjMUDZ3RGhRqfIqejR5lDJWYMxO79miJjvfMJXxeSQiONPDyQleUu8N2pPrW0j
         P1Kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCG2HIRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e83-20020a251e56000000b00dcf16967925si690720ybe.618.2024.03.28.09.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCG2HIRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpsAb-0007MS-Tp; Thu, 28 Mar 2024 12:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsAZ-00074x-Um
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 11:59:59 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsAV-000327-UD
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 11:59:59 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5688eaf1165so1566867a12.1
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711641586; x=1712246386; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QcldUbAIFy0PkGeg8xYS7bg6xqgF5gW9ha8ipSjrP8g=;
 b=sCG2HIRnVlZl6DF9R0M4WtC5GXFJ6ewJsHYwv3R0xmN0dsIoQ/We2mD39zyd+G2aGj
 /AyZDN/L5QWFXzSKg0Vy5ltem+qquOuiBJSVVc5MNUZn0CYzjSzAc6JcHzGBr2mQFyDO
 Xftd7UrL8PwoVXLBPn8j9OfIxy5QOf2vOPM8pKJrs+DFl36TrbN3CKDK5bYSXZopUi76
 1Ba4E/KLPq2fhAK75YKTJUOrkbYccRRXMLXLq/9jFHISFsqz4Hbx6+qlQmg4jHNZpCaC
 VOIrH0SSg6Kz66t0UtB5TmecqsrIFRtVcN6ksfwwA91s/t5pWT8uZl3wo2vqeQlUi3TE
 utrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711641586; x=1712246386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcldUbAIFy0PkGeg8xYS7bg6xqgF5gW9ha8ipSjrP8g=;
 b=D98TiyZ6ZJVKR0KiKjZDelR2d77l6N3zceJJOXDPIyCzJFFV00NwPY7XRgD2s7ge4x
 1qdrNJPbIQ+qG0luuZuv2R2nCcbv+63qxaiB3t22hj96JViHhePjpL4kmDTCLc8APsyK
 oUoxJgxgeStBHckQj00/hlWWlqAG/LrhznrTglEOEqA9b3iy3VlVPCPJTtkCWgpgNBAi
 Ht+C5/+qr2lAqONj2VNjNQ2c9MrTCtil2ZnqG/j4W+v+ZpaTOl6iUL6dutbjojfqeWfX
 ik8/hTf5ZQsQ4ngazSp1+HpzkCe7LQXoY8pmiaic43imJW0TKLM+BXT40bjFSD7MgeaW
 obcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFOuF4o2WsSc6DWG8Dg7ETaFx8gRCC9sTCfOyMSOgivlA2pmTWNZRe9+b50IAHSRApbLag+HqFt2AbJ5T94nPlRdy6
X-Gm-Message-State: AOJu0YyYt2UbScxHJBwqI47h+m+Seh+fq6zgfWxFluSfRpYHFE2dxiRR
 /zOP944A3T1fIl5mbr/Nll8Q6FxeSFpXOPaR6tdNJeo4bYwU7sHhaLol/X2+Ix917QqP7fBrDXK
 hZobrsD1LmlVQ9YaW8spU2SisKQMmKOUnk6W0yg==
X-Received: by 2002:a50:baab:0:b0:56b:d973:3a0e with SMTP id
 x40-20020a50baab000000b0056bd9733a0emr2694348ede.12.1711641586086; Thu, 28
 Mar 2024 08:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
 <20240324165545.201908-4-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240324165545.201908-4-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 15:59:35 +0000
Message-ID: <CAFEAcA8V9+gbFS=YmwDK7r_e4nXuZOf-z6JaVd+RJPVu1AMvxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/char/stm32l4x5_usart: Enable serial read and
 write
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: iJ9IViIp6+Ru

On Sun, 24 Mar 2024 at 16:57, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Implement the ability to read and write characters to the
> usart using the serial port.
>
> The character transmission is based on the
> cmsdk-apb-uart implementation.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>


> +/* Try to send tx data, and arrange to be called back later if
> + * we can't (ie the char backend is busy/blocking).
> + */

Coding style wants the opening "/*" on a line of its own.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
