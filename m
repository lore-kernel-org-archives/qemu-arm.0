Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp675555ejb;
        Mon, 19 Feb 2024 05:06:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMM6hgk/vJv5k4jSJv3hHuwjFKUpfvtaW27Ax+DpyysZVjovirmF/aK335yAefHVKyxl1voMJcuoFnDu6BGaT1pWEZoUzv
X-Google-Smtp-Source: AGHT+IGHLJk8c8OR0g2k7U+2Z8KUtSINLxdCxINykiYN/z8KjZRSrUY5kOSgybU0+hAcYB//kKPm
X-Received: by 2002:ac8:7d03:0:b0:42b:ff38:775d with SMTP id g3-20020ac87d03000000b0042bff38775dmr18590134qtb.58.1708347978460;
        Mon, 19 Feb 2024 05:06:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708347978; cv=none;
        d=google.com; s=arc-20160816;
        b=ENAzLolFuIoj02wygcta2ID4TiPCfVB6Q54cGkahOALU3y1GNsEaxekzQB8dDI0XVt
         mWZz4/5nJM35y3Z6Kf1BQ2HITvSytliN7Ocbw8iM3vJWDeUDohVo2dxuOym4swBWenEH
         vpsD+BlL7Bew+0sl/+osFskhn+MjB5Ljs7k+UF0waMtN/78j/ZPS3j0tN1hKurFCS9fo
         3G0v7wwioGdKhVYgeE3r/t4NP3o0tI3CMbKbQyMxurN2Tw1tOLAh2mDP/g3mXP44giak
         zfigNmNw0carWaF4FJ949njZc3LIs8tLrzMkeigAL1AwAApdZQDKvgSmKCC0JLh2DgBG
         WnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lvJENqQxJwJ0qoNic8x/19fJ5CctFxYM4poH/XDfkd0=;
        fh=EKLFRbDFrSkxavL6TFILKF59QXyJdi5ln+1eP8fkx4Y=;
        b=0c3A4ITWv43Q3pZDt4pepj+rUtj1H21iBuOpUYbxvJgoyrowZHHL0GbFJuhba3R98L
         3fIifa48BK5IHkLIcxz0BNE6k2g2yjNcYE7mwfcIUuMrxPQwfftypbvirT8SCJegjlUd
         2wo5e0Ei+PUY+j0X9vTCgDelvMEh9U9sPaFzJDnX7X23BQrfDm1u6ZFvcUC8MVmi/Hlv
         9nqwlMhNpBKQZHgAF9gcweglwBSa58icjmoa2Yw/8hLDKITc0p1nmw48RMHroJcHQ0Cp
         IELtRB1GDs06D9ZODkkZ31Sdb/G4IdJVUb7C+lND92EKaWYCG1L63FsP1rSv7xN6mB0t
         zItg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TT/ezoSx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc13-20020a05622a44cd00b0042dd5dc23c9si5728628qtb.798.2024.02.19.05.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 05:06:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TT/ezoSx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rc3LU-00072I-0F; Mon, 19 Feb 2024 08:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rc3LS-00071C-1n
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 08:06:06 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rc3LQ-0002oR-8D
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 08:06:05 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5649eb3ab68so705814a12.3
 for <qemu-arm@nongnu.org>; Mon, 19 Feb 2024 05:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708347961; x=1708952761; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lvJENqQxJwJ0qoNic8x/19fJ5CctFxYM4poH/XDfkd0=;
 b=TT/ezoSxEbqmEw3DvFywOVuJliLVRoFmOUqqa5ehvNa6YU4lr0LQkej1vDOn3YLYnY
 GVjZ7COqQfMsPj2MaxVG9LFs/ulmgB9vM4q5nnSjFRhv9pTZVIWIVb6coYcahps7P1KY
 edUTNbToQgdUeFFAMXMxhGS9+OkgAOXsGAak8CD/wkqQf6JB5NfnEHaoTknG3yaogg46
 LQWlFCA8OG4PPvzRvJhI4iIxI4vizTS3QRHuqFs+m2x1kMOLyJFZIUC8lSY3n6MzER6M
 vilCC9URhyvbdf3gNNLnAeHbr2wCWapCEwYOMafxCdQR7HNqNFDd1WQ4cTNu+qW+dKNT
 wujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708347961; x=1708952761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvJENqQxJwJ0qoNic8x/19fJ5CctFxYM4poH/XDfkd0=;
 b=KgwlX32E9FbkFtV7FagwD4qwHPe62av/E+3eBR43yIozj1aYTeEDFVydAQQsOwQ1Lz
 LVs/fa0pvWmIG0DfXXVYsi4/XdX82oO/3zG7EkgTFUettzBQq7f5zjVYDNYe8IFBB5+F
 tkjFl70SkpcGGqxAiWPlTcgBwCfNYG5oFBz4CpXLjbJUcFf+TkNGywv+UTUqcwXL6NdX
 dPPccimDIJ1cB1n/DIcFCTU9lHYQt0Y4wYI6+vPMZ/mNwIS9bST/WypWW6RW8qIN37u/
 dV0OPXZc2ilh0b/h4fThNB6FtPLqqA4hCcOaCUcN4EKu/jyKlj+72CACpiuYoxMc3mbd
 g6PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFD/eTgl8KSzQrx54Xi+7EC/7DQll5d7SUqH10kc4Zoj95aZV/ENP7TsBQEuogJK729BJTp8R2XQvYYaSxtBbx4vX4
X-Gm-Message-State: AOJu0YyeScEcvtFY+M5AY12SebLgpXTRgC7AexlvW5fAsu2yOKNMAS+P
 nh1nBWjTT7nrj1u+Fc5REksaZh9QqLW//pyoy+iyjQXkunuvbW4swlaRLtio8gF9aoFXlWEFfif
 UwUsbuyz710/Eq4uNEFL5tUaK4MQEk1Ree5mazg==
X-Received: by 2002:aa7:df8e:0:b0:564:6b09:9300 with SMTP id
 b14-20020aa7df8e000000b005646b099300mr2051292edy.15.1708347961461; Mon, 19
 Feb 2024 05:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20240216153517.49422-1-philmd@linaro.org>
 <20240216153517.49422-2-philmd@linaro.org>
 <bcfd3f9d-04e3-79c9-c15f-c3c8d7669bdb@eik.bme.hu>
 <2f8ec2e2-c4c7-48c3-9c3d-3e20bc3d6b9b@linaro.org>
 <b40fd79f-4d41-4e04-90c1-6f4b2fde811d@linaro.org>
 <00e2b898-3c5f-d19c-fddc-e657306e071f@eik.bme.hu>
 <2b9ea923-c4f9-4ee4-8ed2-ba9f62c15579@linaro.org>
 <6b5758d6-f464-2461-f9dd-71d2e15b610a@eik.bme.hu>
 <bc5929e4-1782-4719-8231-fe04a9719c40@ilande.co.uk>
In-Reply-To: <bc5929e4-1782-4719-8231-fe04a9719c40@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Feb 2024 13:05:50 +0000
Message-ID: <CAFEAcA-Mvd4NVY2yDgNEdjZ_YPrN93PDZRyfCi7JyCjmPs4gAQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: ZrqnzZo9d9u8

On Mon, 19 Feb 2024 at 12:49, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 19/02/2024 12:00, BALATON Zoltan wrote:
> > For new people trying to contribute to QEMU QDev is overwhelming so having some way
> > to need less of it to do simple things would help them to get started.
>
> It depends what how you define "simple": for QEMU developers most people search for
> similar examples in the codebase and copy/paste them. I'd much rather have a slightly
> longer, but consistent API for setting properties rather than coming up with many
> special case wrappers that need to be maintained just to keep the line count down for
> "simplicity".
>
> I think that Phil's approach here is the best one for now, particularly given that it
> allows us to take another step towards heterogeneous machines. As the work in this
> area matures it might be that we can consider other approaches, but that's not a
> decision that can be made right now and so shouldn't be a reason to block this change.

Mmm. It's unfortunate that we're working with C, so we're a bit limited
in what tools we have to try to make a better and lower-boilerplate
interface for the "create, configure, realize and wire up devices" task.
(I think you could do much better in a higher level language...)
sysbus_create_simple() was handy at the time, but it doesn't work so
well for more complicated SoC-based boards. It's noticeable that
if you look at the code that uses it, it's almost entirely the older
and less maintained board models, especially those which don't actually
model an SoC and just have the board code create all the devices.

-- PMM
