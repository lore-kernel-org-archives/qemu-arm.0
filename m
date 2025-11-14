Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83016CE8D4F
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 16:15:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJwSU-0002ra-8h; Fri, 14 Nov 2025 11:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJwSR-0002o1-VA
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 11:15:32 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vJwSQ-00076b-HO
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 11:15:31 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-786a822e73aso24117887b3.3
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 08:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763136929; x=1763741729; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CeESu3OY+NCfrGLBh8dDVMucacYjkHu1cMnctlpj1gA=;
 b=I3xQC7u/AuRXlpbe/OGCu6WZNFTbiwYyF1XfZsxS392HZimmg8bGF70KZAbnknlSLW
 fC4zv5pR2ocldsYAiNJm/I/diS/IXXA/Cxd2OtAf4dlTQKbIvLtN+IZWI2LX0QHZt3rl
 kkV6tQJoASoxgvGOcrqhvZ7BuWElQpAK2YFH1VkDVodcWXuySsUnqK1st7WC/sq8m7Kp
 /tAPY15PDf46iHNCXMJH6FEli0frf2AVXohZ67ESvASejgS8e835H1DXyQuKKl+qpwEF
 doL8s0/2Z00I1/WXZBK4FbZptWrsTDi8QoglXCs0EPawi105+kixG9G0MzX2/kGA1aJr
 CS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763136929; x=1763741729;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CeESu3OY+NCfrGLBh8dDVMucacYjkHu1cMnctlpj1gA=;
 b=OcvF1ccFRKjhTcSHF7WrE3VWRsH/LRh1lFBHAuT+HyxfMCTgSJKTv8YFT8lDT5dTq4
 YLKuYHfm0w79jQM8Q81HDrfkJfFOP2J6TJVuich7+xkbsHMe8YGQCXC9dpXR7XJyNMGi
 nFKsBr72FuKuv8ihdhsugiSM47p8LDewUuQ4vNx9NumqVwY+PlToytnCsK7TND9ReiPL
 /E2jwlOwQU1FMiK89xqvJ6JVx5CCz3sy8Uau5dQq/Bl4WO5bihC+FCzyOeyt2EIXhe1N
 LyF377pE8BnWvjQNq/jTAv71tRFn1+PVT5G46y/aOR4VUxm207mCjcixn2N4K/s4ivRp
 tEkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVStEW/jXhHAxNy6R9dbG/jxMtH42AFNHlF0Py8DMCOTsebS7Hpj3sBhSkqcl3o5IRDq9wqPcHoKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw8tmp+iMRuynW1pdVy78UwwhMqvgFSXlg5AJmmF0VUBArLX7yM
 VJ2cWhs26jEgaQPsWBeoaNTTRc6At/6udwxS618YD3jt0gj8oym699+y8i9PjYzHVMq4Xs8Xtp8
 HF/FVSxuJThFk6dS7F1t5FrToNR9q+6KgfXym6r9y6w==
X-Gm-Gg: ASbGncsTTZff1b5Gwfq1EAyYlTiW0G7JAWMFERvdW9w09QT+Q4YLbcy4ZDcTWxx1aeS
 Qg23g+Wvg27/YcclQ7IhtEZfnib/7CNkiKi9IioxAUZtOr8BEEVblij39oQqzqfIAyrxc8bCBg5
 IgodGd4klL+fJQOKxA9saYpCCiISEzm36E3lMUTtjiRLWa5yG0QocaHTT1AagWH8jui+zHMMyqM
 2VJN50Mj3U/XCEXeveYrDbtoHDsYLyRL2uorhq/0e6RI3vFKyPPM2CBk8J0kbOeHQrFQAc8
X-Google-Smtp-Source: AGHT+IGNKCD6onrOHvOhg29T4vpjlRRUq80YetpYJEr3dTGena0SgwLGZFLHh6EGr+3cgDUWeMl2ap5aKm/uHrF1Ftg=
X-Received: by 2002:a05:690c:884:b0:783:7867:eeb4 with SMTP id
 00721157ae682-78929f3d604mr35916747b3.53.1763136929328; Fri, 14 Nov 2025
 08:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20251111105429.3993300-1-alex.bennee@linaro.org>
 <4d6d7e9d-0952-4158-9ef4-6093a16e9dd9@yodel.dev>
In-Reply-To: <4d6d7e9d-0952-4158-9ef4-6093a16e9dd9@yodel.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Nov 2025 16:15:18 +0000
X-Gm-Features: AWmQ_bkjHdqc2tPZoD8SL8Lm3gvhG5QrzCtn-q8-lzn42fDD9EnVHyTde-gYYYU
Message-ID: <CAFEAcA_H1-9Hygic_c5hw58Q_YHwcq0nSkeGs6+qd48RD2u7bA@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/dma: don't allow weird transfer lengths for bcm2835
To: Yodel Eldar <yodel.eldar@yodel.dev>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 14 Nov 2025 at 16:06, Yodel Eldar <yodel.eldar@yodel.dev> wrote:
>
>
> On 11/11/2025 04:54, Alex Benn=C3=A9e wrote:
> > The datasheet doesn't explicitly say that TXFR_LEN has to be word
> > aligned but the fact there is a DMA_D_WIDTH flag to select between 32
> > bit and 128 bit strongly implies that is how it works. The downstream
>
> At the bottom of page 38, the datasheet [1] states "the DMA can deal
> with byte aligned transfers and will minimise bus traffic by buffering
> and packing misaligned accesses."

Yeah, I read that, but my interpretation of it is that it says
it's OK to provide non-4-aligned source and destination addresses.
It doesn't say anything either way about whether the transfer
size can be a non-multiple of 4.

thanks
-- PMM

