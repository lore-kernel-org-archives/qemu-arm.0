Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp176473njk;
        Thu, 20 Feb 2025 08:18:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzSUFkldICGWSiwU/IXGMoLNkYm6ZDv6irlmSU+jD6FouKf0DsY60FkVU4Fs6Jkbnbijpb/Jd5a7slWw==@linaro.org
X-Google-Smtp-Source: AGHT+IFP69XcFtwIQJodnC8KQDIWoirX5ntNmlLvdM2NDcNDZ3WSphXHidsxp75l3mdzSI0vG1rl
X-Received: by 2002:a05:620a:2699:b0:7c0:8345:4e8e with SMTP id af79cd13be357-7c0b523c7aemr1042222185a.21.1740068329360;
        Thu, 20 Feb 2025 08:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740068329; cv=none;
        d=google.com; s=arc-20240605;
        b=diiTrY+hVF0xc0l3YUJ/Ahp9cNB6FWmosoCwcpCqqP3FpEzzLegdzTp7ecBE9+FaFr
         5qjl1nKDJevWmf7Qq+pCmJOztwz+to4ZF7rByX+XO6kRXt6okpvl4cfZppewqjtL02XW
         2z0N2a2dGziztknB3n8j+rIXYQLdLeQn1GaoPRfDTX6Dqk9C2xhqdrw1EHIKDD9NWg2k
         9FBRvv4GQyfIo513U/Wu/rXLrvNWaKH4uuUHj0XnSQY8FFQcuPJT1PSQ0hY77FOQ9Gw0
         6rFzIRyp6CMugu/5cOr7rAbkWuYFkiBHg3AuNai6CkceBcoBHHQih60dCtIOdJ8eRghX
         cVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/+2+xp2QOTlpmadGFD3s6Z51NSxMIA7ENir8nUuuGUY=;
        fh=pWNRCrO7QgUhVJ01Lpet3L5YxckoNzFcVfU87ZsjmfY=;
        b=TA4xT7evSl8cGj/9GqGTtriBT+mDXScWpybAC3mokZ7EJjeS3V6Grh/8ZFH+YLiX9L
         6GHa0KTxaY3TqCaWVap/HICuEkR0VAiOXlYDugeMPZ1tnWwXKxqLYEdzNnWxxorOPJ0F
         OASyKIP6gkHQ2t/QbDHArQS3p2scPLIbRLGJJJnGkjNS5Nst1LAFIl86GVWKVCdBuW2L
         SWT9l6bvNCWIiuRG03uHkMfMH0i/bx+gpspulyS121MZVx4aFYDaeB3ojhozOhzyMCu7
         qeR0aVO5VQsHCsNisrh1Ym+thPpZWWD//4njZ1D/Waz6BQ0GcOSh12sNogZmNnGisF+0
         5umw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNEwLPVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a5935d68si670617485a.331.2025.02.20.08.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 08:18:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNEwLPVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl9Fq-0005hR-Pv; Thu, 20 Feb 2025 11:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl9Fo-0005gi-G4
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:18:24 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl9Fm-0007pF-NX
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:18:24 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6efe4e3d698so9888107b3.0
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740068299; x=1740673099; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/+2+xp2QOTlpmadGFD3s6Z51NSxMIA7ENir8nUuuGUY=;
 b=oNEwLPVATbLbulCAOjYOmFdPuBaqvODUZmZcvOhRLKb74bkeVd+jBvsPsXDv6icHFU
 8GnuZuHDLYEMhp/t42bjnPpKCOItz2Is603CnRQkQXMiMTfD2SZfmo6MtXn8ZFdUefgp
 AufYqAx9ytLp795VCBi0XDuS/HOJxOy+NA9YPI2kVNy/0UwPpfBaxvM6Ajqq8W11M4HS
 I90QkEd3hDskVA3tSasl59F95pNHlBZ2So+bwqPHS7mePI3neFQvaZBEB/CS4/R3JROr
 8vKna0gl+6wzBE5dQM7y4JEt6cJGYWScDkj7cTzzYQd45yr3FctXQ38xzWtRaqFfcW+T
 SE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068299; x=1740673099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+2+xp2QOTlpmadGFD3s6Z51NSxMIA7ENir8nUuuGUY=;
 b=Tlf71OfG16+N7YCb2EG/+fVm1meYdt63PbWZgBxZIpFCEVjomSjzcB2E1TMtCXTg1W
 lEoDSXwmnp2NX3RxVcv/93DkKps2uMeXQflWUvy8/BSEEW3NgDqsgFKDXDYbTZ3cn2F5
 DzOZe3GHhw21Xzu2tOJbW7WP8+13pXRZ54GIsBqYfYdd/iUeERmp/cG4kWwbqWLQ0Xna
 bI7JKyxVSQAYfqNi1/Tb5x/NxIOJIHBY/kEkUCSoddOCpRMxA3WZxd98AOgJNQ3qyl7B
 QTC3W/aXO4a4Ji9vmLGxiC4REhe0So34rxYZfYxivLYT+6FvaJrkxra2W5MA/QCY+ITq
 tZlQ==
X-Gm-Message-State: AOJu0YyTzqypjWyM96t2W+slNVb7pJUd96IossJt2Jboz4ISFcM0s+lB
 CQ/WrYXJGpI/ndzUdqcyqBZuXLFLjzk5qpqp+9g9SStno/DtO9L0Rpr8ou4Bg2TDyV/SkahfXLc
 Y9WmCVyMmNEC4E2NoKmrDL0GT+oM7xqFKunnOIg==
X-Gm-Gg: ASbGnctOFCFwuV7o7sqGJuycvx44fypLN5V0V2p5vUM6BQuij5yz2QumkbvpkZxMjFR
 iHiWj9Wxbb/3coAPPojCdl8B34WJaqzzEWxY6TCyGbWDFetMD6EifDwlBow65W6+hE9dczwe8dQ
 ==
X-Received: by 2002:a05:690c:3393:b0:6f9:b189:3ccb with SMTP id
 00721157ae682-6fba5696362mr81641037b3.17.1740068299562; Thu, 20 Feb 2025
 08:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 16:18:08 +0000
X-Gm-Features: AWEUYZlO8BAo_ZXOdCNXz2xj782SxtnwWNQWB9lLFGme6pjAam2bDPwRU0s77Tg
Message-ID: <CAFEAcA_3FOHVo6q_tiOEE7dHZNDw7_0emdCR5=5cEt7fdKVkTQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] hw/arm: Add NPCM8XX Support
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, chli30@nuvoton.corp-partner.google.com, 
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-TUID: hDkjDW+2evI/

On Wed, 19 Feb 2025 at 18:46, Hao Wu <wuhaotsh@google.com> wrote:
>
> Changes since v4:
>
> 1. Bump vmstate versions on NPCM CLK and GCR modules.
> 2. Remove "hw/boards.h" include in npcm8xx.h and add it in npcm8xx*.c
> 3. Use cpu_to_le32 instead of tswap32 in npcm8xx.c
>

I've applied this to target-arm.next with the fix for the
type of flash_size applied.

thanks
-- PMM
