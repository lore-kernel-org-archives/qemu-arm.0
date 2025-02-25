Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp251629njg;
        Tue, 25 Feb 2025 06:29:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZJNJjx6dEL0Dqb6APvC75DHrGH39nFhGb5fJ179i3terq+J0VUeiuNeDRF1ND470w40WwDbptg+5kcw==@linaro.org
X-Google-Smtp-Source: AGHT+IGriFnxVnCBQupv5Wvghp2lf+X4IsvSw34LrdqKgNoLveJFqzHE9gYMP2YknTIUIboFuQ/T
X-Received: by 2002:ac8:7f0e:0:b0:471:ef27:a316 with SMTP id d75a77b69052e-472228d9611mr239179591cf.25.1740493788214;
        Tue, 25 Feb 2025 06:29:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740493788; cv=none;
        d=google.com; s=arc-20240605;
        b=AqK3n5j87WrwNvKFzRfAITcqFxJ7VsvNg19ku/3X8KU7X9+Lz19yj7UZjEAKNIQ68w
         4DwC/QpPfvxXQewEMKwstTU++r3iUbualxTC9ohMbd5yuJKLqLuDSkwG5m9PcErUyzy2
         oyQ3jnlOWeOCNP5Wv6AMmeOxxQFgBXB5u/yQY4PaCmjk2XGlLDQi29CQEzfxj+/G0aJr
         +QKb6dIdXiiksy/KiJKFKOnEdZSmJsfdQ2JpGMB6VLZUNTXhYh2rDLn34EMYWCfJvNIp
         6Q2Pm481q3EsyfevVmjWMplBYfKYnrsxrE4Lni2vpaOErCEqUDial5TvYoDojykfVZva
         M3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lPHujlsLhltShdBoB8PvpgOtSi2hhPzbNlYdJCzOuL0=;
        fh=K2uuYXxa5jtBsARDq+pNklcK4gg1Cxr84+AD2eKuwcI=;
        b=YUhQoxvIn4Q/p5cXPtHL/8yZgjI8IC323SEOZrAF74ysRr0eVIumTLjWwn5ZhkIyMH
         dpJL9etgSFbFkJWclxnWS4IYHAXGc5iP71K7ASRwSDkaIwysvK28M4BjN4Rn+sp5UE8S
         3lNSMQ0Mf4TSBMUjmmepk2daxT7xR0TtkN8O4RS/qgR+viEkXGCe8gsKkzcbs41k/VxU
         DoqEMwd3Rrs1b/maMAo57Iai657z9S4wP24+jlvOOXml0JueBCDflGlsW9XQF6Ni8glw
         bl4Ry8iwA0RzuD5d6o9vQ0ZUCeJwB1A6RmYchwMf0ao44iEHu5a0JHyatpwBAa4ovtTG
         R/WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWDazoYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780abf35si16280541cf.566.2025.02.25.06.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWDazoYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmvwF-0000m2-Iu; Tue, 25 Feb 2025 09:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvw9-0000kz-RH
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:29:29 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvw8-0008KI-2P
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:29:29 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6ef9b8b4f13so49557057b3.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740493766; x=1741098566; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lPHujlsLhltShdBoB8PvpgOtSi2hhPzbNlYdJCzOuL0=;
 b=LWDazoYDAPe2NKeaq0P4RqNwEccWIYjmsVxSwea0yBLCIh7u/T+nHO9gLkoi68NODQ
 Ek1tPPT08FOL9BV0OrpvdRwXnrwI7tgb/SOspukG1Bl1iuvu0+tg6gQYTwr5Zm3QrkaS
 km39bRlpKMR/hDkaoXzx9JTBWADYn0GBJ8jLUj+7O99it1DAWAinSXL9NeL1sdyB6m3d
 FWUFIBf7u9P3MJyKUV/g8XSdw021TEltVLk9iEzWfP7yq/S3iHceSPcf9pfdBvK6Cvoy
 DblOKxm9WdR/xNUzw0eAIpVPAJh/1+vS4uefUziP2Yulw+RuFS9hb+nLB8UHh7w6eS3V
 Ey7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740493766; x=1741098566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lPHujlsLhltShdBoB8PvpgOtSi2hhPzbNlYdJCzOuL0=;
 b=AP1BtcDBSMlpQMFvXpdcNYk53PIk+sJvP8fiRRu1jiuzcQaRknGe61XGlJ+HlUFPJd
 /P7XaR4wHOYGj1I18sAV1pbar3vRVxLZ4r3cobmq8MGIRZENywfSwjUObqVIMDoUmk9w
 khb2RIvRS8hGXPzBd95LliGm28oqcooB2GSU0DTkrtaCTCXCmdmJy+DPKiwgFGRKOVQx
 +zjtC8dkKbHxPfAIx/ORcN2Enyf78uCciC0Zk7nZQMtpGuBSnLGxUxOZuNlq2gev8CRh
 zZScSV+/G2RGCxQ6y6jiOfp800jjXYRUNBklCDN/POjyThDOlYvK3LPJeMKZa2AppGRi
 NyfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXRlfKxfexL+yORhwmQ2DlPutXh8mNiz6laAPTFINuc74gEfO52fzSLwwKbLAJxWkmDu15qOGAVQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxUX6Vg91ARVf2xaU7j0anG/HU4XcmbdeFUvTmOpU4MmzA/bJe
 yS/prS3obhvLkPk3VTgBnKrvjqhF56se5fEYEY21r6fsyykXXNie43VKDtj7EFX2fmzvQhrr8S4
 leOnDYLzqA0jHid+XJaicLHGipKGCoWahZGixUg==
X-Gm-Gg: ASbGncte81QE7L7zN3ynLvVaT7WZ/U08mWrR/oybGpguQ26si08XmHQq3+THPL+EdHf
 xTTRzDKgrnsXBYvR4fBHPquJu+7hey2FA3enRMKrmj1M9M9V48H46y1veB+7yQgSDRe8GpViyP5
 kbrEXhOqhI
X-Received: by 2002:a05:690c:6f85:b0:6f9:7b99:8a29 with SMTP id
 00721157ae682-6fbcc3a3ee3mr150342067b3.34.1740493766452; Tue, 25 Feb 2025
 06:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-17-shentey@gmail.com>
In-Reply-To: <20250223114708.1780-17-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 14:29:15 +0000
X-Gm-Features: AWEUYZkQXFmCUgjaGJfkSE_kqM2ygGc7gci1ahus-kgRhkWasr957dmm07STbk8
Message-ID: <CAFEAcA8L6CFvuTC+UqG7r5R27Yohc9vSVtPBHttBKKj-s-L0oA@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] hw/arm/fsl-imx8mp: Add boot ROM
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-TUID: ch2U6A57QYH0

On Sun, 23 Feb 2025 at 11:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> On a real device, the boot ROM contains the very first instructions the CPU
> executes. Also, U-Boot calls into the ROM to determine the boot device. While
> we're not actually implementing this here, let's create the infrastructure and
> add a dummy ROM with all zeros. This allows for implementing a ROM later without
> touching the source code and even allows for users to provide their own ROMs.
>
> The imx8mp-boot.rom was created with
> `dd if=/dev/zero of=imx8mp-boot.rom bs=1 count=258048`.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Hi; I've thought about this a bit, and I think we should just
postpone having code to load a rom blob until we have an
actual rom blob that's not all zeroes. This makes this
board the same as e.g. imx7 which also doesn't try to load
a ROM blob. You can create a memory region for the ROM,
like imx7; just don't load anything into it, and that's
exactly the same as if there was an all-zeroes file that
got loaded.

This doesn't prevent users from experimenting with providing
their own ROM code, because they can do that with the
generic loader (passing it either an ELF file set up to
load to the ROM area or else a binary blob plus the
start address of 0).

That way we aren't carrying code we aren't using and an
awkward binary blob in git; we can add those when we need
them.

thanks
-- PMM
