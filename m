Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FF7CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:46:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZXq-0002kq-D1; Fri, 19 Jun 2026 09:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZXp-0002iv-Ej
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:46:05 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZXm-0000sO-60
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:46:03 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66077e888b2so2120460d50.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781876761; cv=none;
 d=google.com; s=arc-20240605;
 b=R1yPp27V1pW4GoJ4LXBSb2c446p+8EPk5rgtBXslZCc1TqVO6YHQwo4FCbZEPhLU7s
 9MEobFj2k3t0k1W1wtWqxrlxcKi2K+EkTTKLpIodgfGtWqoj7u9ABT4k9D2X8+6A2STm
 c6OFiWGjGdpK1safmfayLXySSzn783lAoZrM7/4kMNwmz8TTcUuSm+lsjpoPIw9z6Kv5
 6tZiz4sbkxgSbdn1Pf4fBhpw9nsJBQcYEVaKQbZHJ9iuGqHa8HMvRr/2QpecFOPg101M
 2w/Z5ZRfbY/wjP3DfDiIkwolFz0H6cobz+0tZJrVMMRQsWkFRXsL+VGyJGgnV+bvpMfx
 Dx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Gh21bSGzICET5QSLCfmfqBZ8RR7gAGyR6ylIzI85FuU=;
 fh=y4nBKt2P+wtCQahSi7g1KhmpDEtYlN9kuz+K7brruOU=;
 b=L9RRqh6uyhDJm49MAlFmYtFnKnRMIPEhf1hCK6n1ad07Uh2HH5cVEggVO7AaDe9+KK
 Xm14Tdl1MUJ9/mR/9yMdjFdhEbJlbj0emkhVOGwhpAxfazliUUIUD6tbX9mRcRayfoyJ
 Koropv5SEv1af5Xn5ciIJNsbm6Jop4hrI3nIGZsBmutiuWTc6DbLWmdux+zM7Zsly+rS
 +KvG7nUIPJ4yIiWoF9hG7xAu7eGuHIdCd7wsoItoRn2yDRkzv7yNOP0dm7dRQWcG2BB4
 g+FpSGofQHbC4rNR7S5H1/7fhDG7z1lmmn77C+kL9q5SqcpOh+atWr0R4eATUFHvsleF
 Ja8Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781876761; x=1782481561; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gh21bSGzICET5QSLCfmfqBZ8RR7gAGyR6ylIzI85FuU=;
 b=qCmJeoHQsQHruUY+FoGemp0LN6XSsx+22qNKlx0nTeZBNCRkLowcEaXjDoQRyCk027
 IG/UdgoOqs/lPULBGZkWKF4RDs3gxyagJChW55fZHOR6n6+dCmj2YyoHRmqRnBoWqljK
 dEZWfKJcSYupAhNIyIWeyr6G4A99A8KwrVrky9Ao4Vb1gPphQACr5EVYzXQVxmUbwlLT
 ZtVLFe4HRsG58/GKSROAVXjUYjWa5o0HKKAna//GyTK/mFk04OIrRu8nXtowjc1nImMf
 fIt2j6cC78kyA6OxtIBCzqqSoqas2mMtFFcOEXvFKqg89kBXDeAhnm0mtcOfxY93c7Tx
 Mynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781876761; x=1782481561;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gh21bSGzICET5QSLCfmfqBZ8RR7gAGyR6ylIzI85FuU=;
 b=BvOmlwLkT7Sa6p7xszYZvV/9u2oWvF4zcimeAZZieQJdAes65FdGEK9HXoalPwFmCT
 9NKtv16ypcBXnNJi1vbGOpu8AfzJUDiO5TPrx/q+12qYfj+Ml3lKY/xG8cg8PmKa+QNN
 QMSmW2K4bQ0Otf+/50Z53AGIduLMP0GB5xdozamlTjKqIDIHFnakYXtS4Lvz7twxvX3R
 LET486jdLrvuvup2JX16uI3zq3RLtx1U7Q/Io8tvsClDcCQN0sQNMPamDEJbB3taV2eP
 Ra6Xg7O/U6U6hP7pMbzTOlnjLZv1iqQF4tuYK577rEgYXxVyIPj2JXT0BVOkllb1yJkR
 Evdw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NhBfe701oxMGPpmzSv/g8Acu2nrQD0uE7Iu32Ko1SVjGtLjtQun5xxXmC6KMhK4rAUEmJ1zsSDw==@nongnu.org
X-Gm-Message-State: AOJu0YxnWC9wu/OpGfKhyRI05czvNqeiDi6Eu3sQEr44yGRoe25Ojgk3
 gA8L0FA/gPD0CBCWPpxnVndzoMn3Ggd91wYeghK7yjF8bfJeegaOfmFcbI6y2sbqFPVr+0XjqXq
 zjPzNbLUqc7Z2hAQu3rO1V27txSIo4jQj3hA7BWIwzw==
X-Gm-Gg: AfdE7cligM0IEWFUUO9hjzKc8TurMXGlS1Ii5Hr/HlXe8zhBe+58DsskkNl8lseJQSM
 RSRPGhzDHcPfZ2hndOSfEtrBpdHwItk1v8kUtw1KCURea1pMIhVPUNReoDgF2a9/N/UsFRDtfgt
 TsJB8SqslFTBUd0tR9G+UBlO5ngqmumpJFE8x+3hUz2JF0/613yLfpnqkSckbMv8vflK3ESncZp
 HIN5Box4jGSKn0W7w7um4ZMmTa7RrCpwiWfctAJnAFu707uxTuhm89mHAZihcfer0fOqn5XVzgU
 iVgpuNqQWD58qWZSS0KvppUGV91x2yuh4sh1VkJMLkaDOh3JHGqTyi3F
X-Received: by 2002:a05:690e:c4c:b0:662:f9a7:e4ac with SMTP id
 956f58d0204a3-66302ef7a55mr2121613d50.6.1781876760659; Fri, 19 Jun 2026
 06:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-7-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:45:49 +0100
X-Gm-Features: AVVi8Cd5skPzp8FhT2NgTRKG4J1ADudgr9jxXl45tBwa3aE2nkskPZfEFGeehAo
Message-ID: <CAFEAcA9ObA++6+3pTjciW+F7vVP3RBR9PtYCDVqsPSyG0DJajw@mail.gmail.com>
Subject: Re: [PATCH 06/10] target/arm: Implement FDOT (multiple and single
 vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Thu, 18 Jun 2026 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 8 ++++++++
>  target/arm/tcg/sme.decode      | 3 +++
>  2 files changed, 11 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

