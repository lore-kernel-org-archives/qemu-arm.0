Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2159496ejf;
        Mon, 26 Feb 2024 08:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWy6ISjCRslI4BUeL6HsHrjuA7h7Q7M5+sNs4D+nfVp9G+FALveegRO0vEDBSyFANfzIJ2X4hJy3umJyjVGuOObPd9jEkr/
X-Google-Smtp-Source: AGHT+IEeU8CpNI0JEI1tKS31WB6ojcCw+a9uui5Nr3fH6xyslaL5thjD7ERDv+D71oswB24mvP5y
X-Received: by 2002:a05:622a:1a86:b0:42e:68f4:6027 with SMTP id s6-20020a05622a1a8600b0042e68f46027mr8645498qtc.34.1708964570588;
        Mon, 26 Feb 2024 08:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964570; cv=none;
        d=google.com; s=arc-20160816;
        b=yLYwgvCgMA/BCVCYZnQ8/AbvHeFZa+wbfl/5u/WSaqfqf81mPMVte8vBQIv4WFUz6E
         imFzNgmdc7UQsbXI1Au9t2HGaua8M/vJ2RSVKRyyXxSLFMm5UiHDpwv4FNukBQ4LsiDh
         lFe5lqu/jdnQiVceM+VCjB5paiXaENrpHohxXbUHWRDe03beISMzoEo7B7I7aGg/SUI/
         dx1I99MAMuLWnzigTZ1wnqEXm6+1mHQzUGZ7EcCPa/+QwcPdhtFHC0z8PmNIRt9iMAGl
         kiHOcrIUc2KjtBxWW6d5S92/rGTOjCqU7U7g1FiJHz1flXfH3ZpecbDisXH5TYVIL0LC
         K8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IujkR6GbivfjAPk1KUxUVi/ADUOFIc3YhreRhoG7fMc=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=HAQF5GfI5fVTjoxQ9DdwG+cy1voVVfXhzHrYzw+9VUCWEbIQLlWCtHDzc0cqRK5C9Y
         /ytBI17UORjBZNFHk/OVUxieZlDXa4povW0MNgPR8p72/sNqvNY7XZmC9Rf7/sUvk6vb
         58+AxjFmxh8Ze3RZssiG8Mc7hlKyFLKYqm94w1CVEWEnWnE9iT58onkKaDOIQpt5qofk
         xtYmIfNVUGqCFma+qv46Saf9gCmrhYZins7ozI01P4DYmtZL1IIFAkOKIDYHxCGwrJEc
         lmuRZ4sQ+ljcaw4ZPxdz+Kc5uUFut62waALdcwiX8LjmS5MVtt8gKeVPMajk/j6Uy/MQ
         YqxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7vCDLxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05620a038c00b00783fb39241asi5365921qkm.416.2024.02.26.08.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:22:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A7vCDLxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1redk6-00081L-VS; Mon, 26 Feb 2024 11:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redk5-0007yw-An
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:22:13 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1redk3-0000s1-IZ
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:22:13 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so5005160a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964530; x=1709569330; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IujkR6GbivfjAPk1KUxUVi/ADUOFIc3YhreRhoG7fMc=;
 b=A7vCDLxenk6l0jvTTd5tD4S8/IJLjwveW5hEKIOnKU2oUdv7HVBsQw2djLcMrdCc+e
 fXmZx43xwa5HOQeJocdzROSNiGn9YizwEkbEluwMU42cYMKv0bgimwN3WtNF02aJUCwK
 OQfJryrhPXJ2URHstH5Hc2iTVf2QiBL1XBA4WPVUEuC3cG2pooIfB5qzz69MxaYASoAN
 KX9DwJ9OXH0gGEPmMjZTFIh7O9H4ljh+yd6bMvn3HWzDEQhJtfiboV6QhP5+in3nUk8e
 +7t60YkMnSRGaUFG9SvwYRvSt8tCViE2dtv+gRh9R+jIjW0I/d2aC4qCtBCJmbtpnZXC
 evIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964530; x=1709569330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IujkR6GbivfjAPk1KUxUVi/ADUOFIc3YhreRhoG7fMc=;
 b=eG6ltGYqVePSsZTiP7Ium3nFmapItmr7ALTqFvimPXVdnqogletKEmyKw6XObG+rsa
 edpjGIGgFxV1hml351V03xHqvycyJKdKMEzQ/7G+qUf6pamG9Fll/q1yG4i4MBdWgHRa
 EyR1IF+U3qlqx4sProFZd6PCGFK0wSz8MTwlaCVXqEJUwfd6uBo4YbSU0fml7NwISjoQ
 MlgBAssRwTkcq/UqdJ5sYqHTfcz+MWTQPOxaiVAdf+KqF+58VCQnnKfAlr9hgPI04n18
 1a/FcXj+nodbS+SOYR0kpFvkgykNMABJKn2vHSRLMgo/oRO5W1yeR4y2dmHEjuBDlN8h
 5s+Q==
X-Gm-Message-State: AOJu0Yx3xViZrTcKQauoWsRBa/klfMnbCb2Imq4IPTsXVeakqVyfow9I
 qZmLxS2DkHfWcJbomWkDdFNT4sPObmUdrfnd0ZR1Ch7CwrSIm287bGu9lXUdeZBuEatZBigcjES
 AoCLdm+Gsn1RgdyQw/nFjSBt5M0ZjEBjt4ocuVWZMxVwIMQN+
X-Received: by 2002:a05:6402:1a30:b0:565:bc3d:d9dd with SMTP id
 be16-20020a0564021a3000b00565bc3dd9ddmr3425054edb.38.1708964529902; Mon, 26
 Feb 2024 08:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-32-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-32-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:21:59 +0000
Message-ID: <CAFEAcA-2_j3fbkJKyR7N-T__iewrt2OfP35dJLZC=MqdeONbZg@mail.gmail.com>
Subject: Re: [PATCH v6 31/41] Add mailbox test stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RJY2T+KTW3Uw

On Mon, 26 Feb 2024 at 00:07, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.c | 60 +++++++++++++++++++++++++++++++++++
>  tests/qtest/bcm2838-mailbox.h | 37 +++++++++++++++++++++
>  tests/qtest/meson.build       |  1 +
>  3 files changed, 98 insertions(+)
>  create mode 100644 tests/qtest/bcm2838-mailbox.c
>  create mode 100644 tests/qtest/bcm2838-mailbox.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
