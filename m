Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1066313ejg;
        Fri, 19 Jan 2024 08:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaNh4nodVYye3TDsapcrjQHOw09P9m9ZCHmdJNo3doD+p8ket/6aYR36ArIKPu5qTzUwti
X-Received: by 2002:a05:6808:ec4:b0:3bd:9949:e83c with SMTP id q4-20020a0568080ec400b003bd9949e83cmr32199oiv.30.1705683448509;
        Fri, 19 Jan 2024 08:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705683448; cv=none;
        d=google.com; s=arc-20160816;
        b=S8Lxu1jihu/DSv0RtXQSlK0XRaI/Ge1dyTI64Ido5pz7h9JypfMNITX2lqrk+q/Wx9
         D+bm5NdIbdbuVdM5tMeUlfXUebBLBH1xkQ815nL57D9c2WRyh7te1RLB15pAy3ruDibj
         iMX93UZAk10g0ceZUgbIe/GbSEUTcSNT4ZNTclY/hXA5BjGuA0NOl14/AG+N5eEWeZu2
         Da2GGaQvUmEBSIlN7JntLLvH0BKh4727zJDtycb16hM43K2JQXSVhXUq/d0OdDhrh3Tr
         G0OUPGV9gWJ00PYB79NWPCza3DdHF7LAIP7+cR72nNBkvtVw/imYVewYI5AsV3YUS5DD
         ix5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q4FCqIHqGBn0EIj3tJzU929L370wNjr2+F3kjp425x8=;
        fh=6ffT6jbUceESm2XnCSoAWJAaHkpRUnWS9YzclW2Hmq8=;
        b=d2GONbcqjY8hM3uulB7Qxsc4EfGHQvR5zS5kCHiXxcID7MghLzbQLjqMdRF427up/d
         hAPwBxliwTAd3/oAsKV4hiFy3jV/NdpsBC4LVqJVixoM+miasJqedllCp5zzLp2KxRky
         wFA+pN7sOEN9m+nLiG709+0FOKfqDq5dAF2qWKPNUB6JcRAXoGKgCCpvDSQaL74KJhSC
         uAsDCGIOo2e+iALk6j0zzkDmD25aHcp9kHo75ipQiZ4k/PSVOPdrMbRUNJ7ma840NqP9
         EQNAJhqBSTni+lcraIGk6r7bHy7vaTMLH5zZWNEGrUbDVLQ4GlbdEDkEisMzsyXCjWTO
         Ttag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hH1aV4qy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4-20020a05622a020400b0042a0b35d217si6988108qtx.189.2024.01.19.08.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 08:57:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hH1aV4qy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQsBF-0005g0-W1; Fri, 19 Jan 2024 11:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQsBE-0005fg-4L
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 11:57:20 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQsBC-0006Re-Gc
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 11:57:19 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so10357911fa.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 08:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705683436; x=1706288236; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4FCqIHqGBn0EIj3tJzU929L370wNjr2+F3kjp425x8=;
 b=hH1aV4qyv7S4jp7iVLqavxcCMvVs4YYef8rqjW7jRIra57js23rED6CdHCmfHMAnfp
 azRvp7zZ5A2Bq9uo6Tl+XHCf6ZScfVNi30mQl8rwO6MO/OEAhomIM3DXs0alOcpfOuS6
 E/hJCj/vGzHfNBz/GMGT0ywu94FcE/6xuwier4U8nfj3QxmN4mS0V1IExEHvn3eS3eFX
 eMfLeBKP+0lfH4WUjL2YiUCHSgi8jVhtH7HiyZxsGZW2/sF6fTbMQITRTJeMUXp4Tdjf
 1GqiGP3Cz72UqXcrgFc+0zcdNjaacF8KwT2xjst2fvDDVpF+VYh7+efeeq4lQRbd+f4a
 adJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705683436; x=1706288236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4FCqIHqGBn0EIj3tJzU929L370wNjr2+F3kjp425x8=;
 b=W1gW0zxG/sXmqeYnPfF5Yjs/r5LSrDC0W2pYBynumybMHgNnEJk9qOg/4fB8VpELhC
 cHqlxmNeTewCIxMRSwLOvb/zXt81QVbBJomJC6FTnNCNqSZE+YjF0l9I8HlCP/w9T0/B
 2ivi9ItcNuhnuLZza0GkLUfCnNt6W5y3VZ1BaBpmE89sJnNZ30CJyVm2QD9a+Fxf5478
 hEz1R6F5mOUdrj8zqfMlKJ3ym9RnU7h+JPnPdnXzm0p5PZmvWvM383wSzsxDLaRgWQ/v
 RA7tZre2XdhEcY207aR8sp2bLzkHs9dMOaPTiHDA5Y4KcxpWLiAPy6FyNBIxm/pYTSG6
 4/iQ==
X-Gm-Message-State: AOJu0Yx8YalWq5lsoVjKpRjY9xswEu/0RORWlrFAlWnZz8uV+iIjWpGI
 HOkcDZ0+EWSG05f4Osd9l6DPg1oARtKCNkghV+8PDepoVF8dr/A1qOQudcG06ZVsX6xfmVInoeK
 2oxIEE2E2nwjDCNUx2F8B6mva7J5PpucbGBHw9g==
X-Received: by 2002:a2e:730b:0:b0:2cc:f126:8b16 with SMTP id
 o11-20020a2e730b000000b002ccf1268b16mr1828423ljc.69.1705683436641; Fri, 19
 Jan 2024 08:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20240115182757.1095012-1-linux@roeck-us.net>
In-Reply-To: <20240115182757.1095012-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jan 2024 16:57:05 +0000
Message-ID: <CAFEAcA9xMRWv1FRbAVoQZNQw7Tj2=yewn-Uw2F3ddoqxBYbarg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/arm: Add support for USB, SATA, and watchdog to
 Allwinner R40
To: Guenter Roeck <linux@roeck-us.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sG2zS/IwoJmR

On Mon, 15 Jan 2024 at 18:28, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Add support for
>
> - USB 2.0 EHCI/OHCI
> - SATA/AHCI
> - Watchdog
>
> to Allwinner R40. The hardware is quite similar to Allwinner A10 and H3,
> so the code is derived from the implementations for those SOCs.
>
> Tested with bpim2u emulation by instantiating EHCI and OHCI keyboards,
> by booting from USB, by booting from ATA/SATA drive, and by manually
> testing watchdog operation.
>
> v2:
> - The USB Controllers are part of the chipset, so instantiate them
>   unconditionally
> - Add Reviewed-by: tag to patch 2/3
>



Applied to target-arm.next, thanks.

-- PMM
