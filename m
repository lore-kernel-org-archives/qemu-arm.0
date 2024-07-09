Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3322673njb;
        Tue, 9 Jul 2024 07:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU553ELHhTCZUNFCzo6FfIUkRUUDgMAmIQZCBnfroW1/JHVC2TZZtJUBRLjbfnvJ9w3uRyAI2Tc4r/47D2uvjAB7UeM26sz
X-Google-Smtp-Source: AGHT+IFstKz15ZQsnHL0ns+UrC5EfSx1L/NznJ3jdiKNHdXlvBWs6YMdlo8whhDk2112CY+Mt2+s
X-Received: by 2002:ac8:5f95:0:b0:447:f907:5296 with SMTP id d75a77b69052e-447fa91eec6mr32946951cf.42.1720534923982;
        Tue, 09 Jul 2024 07:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534920; cv=none;
        d=google.com; s=arc-20160816;
        b=ixjED7UuQuLi34Ve0hX4BHfZ2+xi2Taq+YVL5emLjE+sU+51SwLKNP8+eNVbbbWS1F
         YD6yNS4zOr76S5rzsZ5uMMhv63D42HOpeudqnPqtQtNGdhQviMsB9enNYUOg0DB7Hof2
         AplMZAxpJzi6LrnXgpTYx91wrFVsZT1+lBHcwgPJMnAfDouciilwG4l1z5qbAWRZybDu
         7mZVQD7m8Qtg4C0iI8APu3mY5TIzmkjQNk3kveiGhmrmTMzMWFe35Kdor7V5ug2KyduT
         xMQpKUcssJDIlQKTka12DdQZ25Q0JKbWi9SPdTT6cFZLjsPJBztFu/hEZhQYVtaC3Piw
         eWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6D/9RMjKtvoqhRxf33uzC2d8AED/S/Pv/V6JQ++ckuw=;
        fh=JP0/oVIHyMRSRGU2425BbsGCMnqbAuhxEGkQn5FQHMA=;
        b=YkpJzswkDdCaIH0N+ZbNGnP/BFSTZB1NvxRD5e7KGd+wwVQUI9ZWYogBuI+9ZEhqvq
         4gyl/ETAZVYBLtV4OQMq6FFDhK4RkOhDhsXr2VTicYrxKa5WWCM0I3CsWaH7BWqZ6bMq
         XDnJ34ZAwF6HudGPlAf4qG/WgHZHMrsHDuw7qOHQM5UPOahfoImt+QSBtfPqVRoJpsN1
         bGk7KETWnVWeceHl6txqGQUzdtfovfeJGgU0IaNju6P90JFsg4KaPxTfwg1zs4AnqcAN
         XoTOygMRD08biITjaw60F52D5WpA/aaHvoS140uVsz+hlD6XFcB3U+fg8iNabr84AVfb
         Ub6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xfa113Ff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc344csi22670891cf.394.2024.07.09.07.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xfa113Ff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBj4-0000xl-Nl; Tue, 09 Jul 2024 10:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBj2-0000nv-NG
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:48 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBj1-0001oy-9J
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:48 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so8454508a12.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534905; x=1721139705; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6D/9RMjKtvoqhRxf33uzC2d8AED/S/Pv/V6JQ++ckuw=;
 b=xfa113FfJEi96Scj6DlumDRc+YW8n22z05f2abLCMemTQU5OTKbmEXa2xj4QZVjlRW
 Au11kjje/p5SZIje3e0DFTkJMa31GAo43bVVTViP75uPV2CfKAaTEhixXdYjbInC85Lh
 pomFVmx7Efmm3+YeIsk2tAfabhk09f+Hpy7TvqZZ7UDvLon+Iofm24rDj2RE08e//AvT
 77h+N0GYKxNDUfo0V+4iKmIAryb4iUCgXVABcvmzHcQQWBsh4/JrZaaltz5vOTVl7Rge
 DSKy9p9Uk45K8eMguHhnJjl943wLJ09K05SgAlW9v2iRTA+wJMigjxtci4L9ZAcJqioC
 likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534905; x=1721139705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6D/9RMjKtvoqhRxf33uzC2d8AED/S/Pv/V6JQ++ckuw=;
 b=HIaxFTBHLpdDUYPFzybl6kLcETcmAU6trUj0YXdWpypXAmaRZ6bA95r6foHHNhM8GE
 KGxXw6KV1CW62ZffSQVUd38/K1E1j7QT8h7MdnhXwXGe7uaMI8xjO9mJeGCvcMuce1wq
 F7fZtG0HIU0KzkYLn437hOa9kdH9WcXX1r7rSSSbOinsjZX1Ax8ahUvrWbcacA7LDQio
 tavxbvYlHm3ps2EhZtNKk9BViSSRd8sNXNG82YwT6eGugK+nhA6oz6TWVS/SPlWQcTWN
 iFX5WNH0oLSyxIRLJPnwjClsieuKX/kr46fCJq1uuZ8CL+1p72Ic0UvmF9MY1jeI4KVt
 NVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgYSygXIJo0lQXvrAuwB1dvsyHvFLohLQqKa9oEiA6ogRQbe6rwZbObRUFPyYQFaJXZm5UHVYShJFznv6TE09PQ5fX
X-Gm-Message-State: AOJu0YzgVO6CeRc735wR7iqDZMdesgQ31UOHWWLF+EwTZlSf4dmXSadV
 KQLSF7YFFNd8Lb3kCeVaRDApPWdxSSyGlvjTKA4XZURot9dyGHwaf8R1cW5rZN5TswSWEVPMetm
 6VP653WDaHWfo92okY6Iz18TdhjZ6Crom8O6izg==
X-Received: by 2002:aa7:c315:0:b0:57d:1d9e:d1fe with SMTP id
 4fb4d7f45d1cf-594dcf70159mr2010506a12.9.1720534905463; Tue, 09 Jul 2024
 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-5-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 15:21:34 +0100
Message-ID: <CAFEAcA__vKaph1S+jWGYj_JyR_NPGzxuR2muVMAv2jY3XE7EOQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] target/arm: Convert SADDW, SSUBW, UADDW,
 USUBW to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: EiBGC6Sjuv9E

On Tue, 9 Jul 2024 at 01:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 86 +++++++++++++++++-----------------
>  target/arm/tcg/a64.decode      |  5 ++
>  2 files changed, 48 insertions(+), 43 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
