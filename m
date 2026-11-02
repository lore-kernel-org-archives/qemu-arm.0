Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6DD60A5BC9
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aZnvhHTy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNqQA-0002NS-Nd; Mon, 02 Nov 2026 06:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNqQ9-0002Mx-ER
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 06:41:49 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNqQ7-0004qW-TL
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 06:41:49 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8ae8607e8afso19975247b3.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 03:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793619706; cv=none;
 d=google.com; s=arc-20260327;
 b=mlq+wHH0c5IgTwvWDdnSDORlXKc+3lmqBMhxB7H+E32W/xkohPj+PN/T1uQEEh34Zi
 sm5wFkZBNquDt1LafojcSVc4zIAIVPVlXk8AaJ9ti6ZPPpmUgnUz6Dr6U1MExyFmA9hQ
 JIPOb6M0/GTNMyXw2AQgoT99mG3NcnVlsm1G1iuNhknDUSyHPvnNu0mUinBf2MGLKg6e
 vMy7h8xrjen9mkNhZgIp+ee3TPxZDwuFVp8Z86HUHv+dyes+QxQAp8VXTD+Yxga6sVu4
 IUuU4Uw3qQ1/kaQEdw35F+VBx6sPuoD2acVhUmwnEV4RiiRH5Yv0GZB9OXsns2sWyNj9
 xXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=J6EZf8qA8tZJdJ5lD4a2jL+sEaX15FOMmTXo2WHYSyw=;
 fh=u5ymSfoMnHAUHrWXlxM+XSb2UNvBPKTw5WJU5naX9Po=;
 b=Wz8y41gC8QmjvHcZnn2NgLysgsPu9gVPrcgaVk32z2qOscPAO3UjeDqHGA8AMtvnsn
 /oYdjiiQsjhN3jetazzbUV23yfb4f2WuUeKPZBnpVsT5yRpqacyU67EOsjzZJtWCN6JO
 C5X5SR7cKVKMCl31c6PYXeH2+TiywgQuJPKUUySYIQ9efvNG3aseRP0R2yau0tV0ULss
 Ha5bCmQmex+aKM8ilVdgEcw7Cal9gbKXqXOqZ419pDyje5xnaWfEyF1UPGTaBcNMA8V1
 uoIyCBgo01kdmczHxVoTGWCjbIOMKAlAnn5MBbY+KXpyE2znXmA1AtCTOin+4k5b+PSA
 Qu5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793619706; x=1794224506; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J6EZf8qA8tZJdJ5lD4a2jL+sEaX15FOMmTXo2WHYSyw=;
 b=aZnvhHTy6TiUjbi/kB3l8g8eEFzZ9cSBSDFv1YD7tyGpZnhhrvCxDqzEyGnEKc91W1
 cpHsFrL0P3Pb2Gq5iJo/UfO5UhS8MkfSPLOvVijD/I2kWJ6uiKxZgh8PYujXHfnhoXTv
 /aBtHIIIwkohQgIbjztnKLogVe8JrNtuDW4cxqjiYJlzF8JXZx/wTiONeBje8ydqSvq4
 b0s5NWaeqUGFxZkzoYo1UOj/5oyRwKyNDOdyMGqHlscpg+zPz9kPIyV0FS8cGtYVcud7
 cVzLDhlZF3lPla1pCXkrJZvI+YJ5kad7/eM8ZSofjcOXddnsZPnomBDZgSAsW//Rakg6
 yI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793619706; x=1794224506;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J6EZf8qA8tZJdJ5lD4a2jL+sEaX15FOMmTXo2WHYSyw=;
 b=x1cGi4dI87sGSDEVL1zbRWd0yA1MwKLDXT6uS/Egguoej7GEwpT6IvZV/90AbIq+WR
 RW4r0he3pdGm+cSlwHIulO1DHahMrWMRp94py2qLmU7a8U5R0cHP1RNY8jfgrl1FBYvH
 o5qLJu3XMoO1kJVZVh7uLNKoEC3cMfE2nMdnagAqrWOsZVHg+jq63L8RqypeQ+AVjH1h
 Tu6iGZOZlZayDUDUzkNty0awvM2F5v1gkM3ADyLwFv5tUukkzLXkKnyUKLcfkknuX+wu
 5jo15oFFbkGho7rgE1wZAgluzZFtjOEDWf1uPcFpcj3zipLEBDai/t3UT/PMYR5xMW2M
 cM3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/4Nb75pv5YurDhF7UEPaIp0Gi5TBwX8kYvN1/ZA2kXprJYUyHtWohYqYYeIA/f3vJWK4KIH85DA==@nongnu.org
X-Gm-Message-State: APuU4Z+UTMzjO5FZ8NKmAaZgP8CmU9dAI3yPOQhDpqlZFIe2jTfxfPjt
 uHdGASixddRrlOHxitn/Ltnkqldx4JgkGNBK2L92EO6U2HDoPHJaL1ga6XeEIm9NRhVVeHKBPwi
 U8e6xrXkUcC7Dj6bCIHwY++J+e1uB4ht1GEIo9bIu9w==
X-Gm-Gg: AYBFou1ulHnKqbdf7mgNijOeAI5HtHTDd9Kcvo/1V0P5EAmdqWTOA2Ak4t1SBJMSz2E
 SqjSiw1oCA5QOHhAb8VqTrwmlL2MawITiS7NCzucVTcHzpRx/hraIojrwEHRSHqUF3sjWGVUdY3
 MNQ7YlqLAk40CmBCSjGHK2YLxiEMMaXqDU2oOujxRKr4wt/GKxH1o8ZfO++T/pIlM8xLcriI0uB
 f7OwrCeYAXR+RdKbKQMAnUxixLowJGXxDIYgJG7PLyLYanpGFEWkJ1xHGR17Uvf850HjfR2HrlP
 sg351n77MV0MOsS84OD3GilDCq+K9AWCZkxqxF6J7MLuv2mISGn+XAGUJyIZbJGzB81/tMz6SvT
 qmP7GaCIABAkdZzQZCk0oApM06YkD/kn8gvvUGsv5H6AmSEW/Lb6dGBZPMvqP9/ijVwEcTMmJDB
 A/tYkxbDTtenZxDW89L2RD
X-Received: by 2002:a05:690c:c4e5:b0:8ae:c724:42b5 with SMTP id
 00721157ae682-8b2b65b203cmr54042567b3.5.1793619705400; Mon, 02 Nov 2026
 03:41:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030141046.2710206-1-alex.bennee@linaro.org>
In-Reply-To: <20261030141046.2710206-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 11:41:34 +0000
X-Gm-Features: AclHuK-5BGHNHE_EWVrkZ3Wr5PSoUFBoJuZg5o7gp0G3JxldCy2-KEl7JPCJT3A
Message-ID: <CAFEAcA-kPe9iko_mqgB7FTC8n1PeaOk0MhhFpntiWf8gLz+jNA@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm fixes (WxFT, bcm2835_fb)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 14:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> These are the arm specific fixes from my last series. All reviewed and
> ready to pull.
>
> Alex.
>
> Alex Benn=C3=A9e (4):
>   target/arm: hold bql when SEV sets the event_register
>   target/arm: don't pass env to the sev helper
>   target/arm: simplify wfxt_timer_cb to only trigger cpu_interrupt
>   target/arm: fix bcm2835 migration issue

I've applied patches 1, 2 and 4 to target-arm.next; thanks.

-- PMM

