Received: by 2002:a17:907:9383:b0:a61:bdcd:a6e2 with SMTP id cm3csp8628ejc;
        Tue, 28 May 2024 07:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWASsuop9X1AfWh21bIVoAGyUkEBAG3jjW0eRuogs8+E1FRMD56CYNiOJlzeVvwmy58ZLS4VV9ztgo3R8g7OTsPFOhCUG+o
X-Google-Smtp-Source: AGHT+IEzPG0w+YV4z/uc+qhYHJRlUpLnvcXGz5HOpgeiOD+TU6EIZh+jsuDLPz/abBB59VAtTPdI
X-Received: by 2002:a05:6808:10d4:b0:3c5:fed9:ea36 with SMTP id 5614622812f47-3d1a538ca90mr15375727b6e.3.1716907272663;
        Tue, 28 May 2024 07:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716907272; cv=none;
        d=google.com; s=arc-20160816;
        b=HEB0rTTkoNQTef90UvK2nyO9apjfdelQ0VADLb4UC7e+ISFYqbt2NuaFYJy6qNOWXA
         hBnKCqnkMGHXjPE1e/wLOmZGWEgEPsQnjcEnr2yjIw5Z4o4EhYa3QL3KLBnBY7yeLRuh
         5D8s/5hxmVvPg7cAVbI5ogK5A+u7x47J2p9GMfea7mdmgFhi7lOKWIbh2Z0bFp6K5K18
         zAlxaHP9RPlcZJy3IbEgZrkWiDP3OIflBNpv5+Ovj1bXy1lPgwqtVhZ2rijtW0d8s+rA
         dBnZzhfNkow0+PMTpCuw9hh4TmyVsDLLjliTSxPIn4N/p/z/lI6ZGLFN80HUneXX+BR3
         ZgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=theRZBDNGK++NqeefakMBCJYyb2WNN2sDus0BMaBITA=;
        fh=h8IZuwgkhsGtbccJaJ2W0+IuWKXE/9fLcKXsVPmcYOM=;
        b=O17s1m6TA/X5HZ29kr/6AHjpz9H8eYMQ8HisgW86v06LFORHMg91aymJvy0zH2d9QV
         Bn2YXc4OSRIqXn6VfynmKEOS7LsAnjVY7+ZAdO44O8+nLUkIgv7DoWmBkff2u4BekMV4
         aNPmeIRMC4cay4JyAaZbvwm2Jj3zXBCRwWNDrG5aiDADojUldplonMkyjaL/2g03yrfv
         eVsts40tWFblvzAouCD8WlxI4khqJBNF9Wg0efq4pZuQ69Kn19MITTReBk1q2NiYx0lK
         8kZ0bCoM2QT/3PGsjd4x2ElcXXlGzyj2KgfpAdZfTnpL/PLuvDpWBU4VXmwKBTHXcc1J
         s/Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvQlph9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac070f1437si105036716d6.216.2024.05.28.07.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 07:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PvQlph9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBy0E-0000yb-03; Tue, 28 May 2024 10:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBy0C-0000y4-O2
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:40:36 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBy04-0004GG-27
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:40:36 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52449b7aa2bso1132389e87.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716907224; x=1717512024; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=theRZBDNGK++NqeefakMBCJYyb2WNN2sDus0BMaBITA=;
 b=PvQlph9tm5jRn5Xi8VTea8hnnX7gujkdi3Ah6eyb5kbHjmH9jZX3ETmLx0+oCjwz4g
 wxzJcZhXdp1/AwSyodmDjy3XrNF+bowVSuffstL71NpsV8SXIrdlNTp7SMDk2hdr7Xoh
 tuySW2W1A2zsimAfQzhDwXEDJA+BWBWc+HPEOvG3OQxdUaD3VMfK+zQiKXIDM59KWzEF
 Hny7qK5bkpdkw9vqgsSWX137akq3Pt0+LR0E/5O2qNm9pSIwYNBW99f06lKGv5KxY4wm
 /PMfypCvMtfpMDw+l/vNiUMynPrkC5h0hh3NNOePtq9wI2gkbA2tPZAPxwSWImnt8SIL
 i4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716907224; x=1717512024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=theRZBDNGK++NqeefakMBCJYyb2WNN2sDus0BMaBITA=;
 b=gqoJHoRN+wFSISwEn5FxM2JfQ75ifjhLvs1IuQq1sqQQukRtiuANfvsUVYWUSYQPLu
 3Foivu7t6o5VHHuLj6PRrxFyqZKg6gvsk+Nr/dFZ+GcD9qTgr96eqX5psMnOzCG2Mj0B
 vaXHw543WfigrB1ZcQjHN8d/HSiCw8zYTR9GDtC1iI28tx27XuFHcoFYDVF08XymLUlT
 6hqx5HKf2Bwt+BOEtvsSc8nHnzUTHUQ+9jCblcfkZlren+bpMTFmnm21/BLY9AQEFlxA
 k41poDCszBf24lmrEwvt7ATmFmrWnQ55gg58RWgHe24KSPHMsnexwmYhOiLbBmNuUNNq
 hkNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtGjh7L/TQ1ci94TeCc43OZjlOK7l/VSRNAJRNSgU6DSl5sChdNBiB2cMivf1kUsck0tdz86BLHAfaed/w4M+Cq9jL
X-Gm-Message-State: AOJu0YxRzkjAVDjyv4Y2glyppmLkqCGa6Gq+Bfovn55bNG6Jtguuw5uF
 UdRXaM+nWO3OdhgGZfUeNjHBdUUJkPewI9cS1TUyc6SNE8pZkmRsEPT7PnITghw/DQ1txGY8Mbs
 D8k4wLrtVAer0f1oiYEJfA5rk/Fzo7Lu7nfTP/Q==
X-Received: by 2002:ac2:4548:0:b0:51c:348:3ba9 with SMTP id
 2adb3069b0e04-52964baf3ebmr7241761e87.22.1716907224210; Tue, 28 May 2024
 07:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-2-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240523194441.21036-2-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 15:40:13 +0100
Message-ID: <CAFEAcA_ib6MnFCSbigVcqUHYzD22nVQHQYVCDGN7fkqLduFQvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] hw/misc: Create STM32L4x5 SYSCFG clock
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: qzRPEXJeU56U

On Thu, 23 May 2024 at 20:44, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> This commit creates a clock in STM32L4x5 SYSCFG and wires it up to the
> corresponding clock from STM32L4x5 RCC.
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
