Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0AFEC1432
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:26:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNsu-00065G-Jz; Tue, 03 Mar 2026 06:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNss-00064i-Uv
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:25:51 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNsp-0006Oy-Si
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:25:48 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64ae222d87dso4991995d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537147; cv=none;
 d=google.com; s=arc-20240605;
 b=XJp6s/b1VoUJkKlO+EKIUtNtxuEoaf/Tnt+n6S604zQlo8e4lqBFdSKjuuJTOTtcRs
 GU9UpLo215EdQSN5IRpzjI7tGzI4sxEXVeukh82NpYjITUkLVnHggIfhupSuo5FK4gZE
 VA0T4f7uQ91sZnPnfQrEeiNElT0/yfPXcwlALRA4cvqHmLglro5+ljynxJ0yOEKtNBri
 J+RfcsF+sq4JU1F3WU8C7EaQNIlTn/FF2Wmo+jxUTXkuKunFLd4o1G9P/YVrTJUNhOOu
 9CIMHLbE5QF7iyc2dPJetU5YRUwydgKvVbgBFmZfNISYVYaSrKoNAhLnitr9B5+JQbSH
 uUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wlBn0WEfQJ+tIVomWPQfmh4kj6g122O/Tv3r4t2YMNA=;
 fh=ELD8SMj9GIBq+uGI2+MUw8aMPH4wL7J83osK1cngXp4=;
 b=h4xJ4dgmEDljeuaZb7bQYB8EQhOHDL1MukHEaNXZbV67sF4ZiYurVz6o8x0cA4789g
 L8fDT6hmvwQCAZ0128uvgH8XCY7N/QAvIKIUtjwexhiShoGY/gAIYGDe+M9gM90/ZHqv
 RQ6H8H5kwW1CqV7OJCNyoRzzH8X3zsz9Z3+9MD7dvxkp+A8/a0b2EsAZYm57khxtwak6
 Ucgsi1uWQ5jHoqK0WCLQusm2RX3J6PjzEGMyCUUrqeWHP+QXjmgJ/Z3QPQspvVE/ltXe
 3Zuf1EAK6JCJB8JXSSuFqg/kHaLxR+bgwU6yWAmPlSLGyQZD1yx2tBYznkSzjtlqDrrq
 mPrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537147; x=1773141947; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wlBn0WEfQJ+tIVomWPQfmh4kj6g122O/Tv3r4t2YMNA=;
 b=x0m5GDVPQEhhG1efZg6fDZnAmKqARBrWniru3bgDjhg306JCG1FaUsoq73U6uSfTKb
 zZ+jcMBRQ8hcLokfh2SoWjSXD29oajCHSZpINWnUGBOQY8vQyxZkBd9XWSJKgroIpB0M
 y1pAhpB9iGU/h3rFQapQ80xHwVigywV/DBHFjl3Blc2eyL8Cgundx750SdgcYsx8DTgo
 wY24aBJaUuCoViOH50VjihVTmuO0EZi1PfLj7IRc/LZfAOoKELgv5aKOZkdop2tXrdv9
 pn9GuSOu78GTOzlaf+/Uh1AK8Vo8RDsFvAmn6lFVY2De4/wty23D/hamG8ApuFTOMv0p
 qOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537147; x=1773141947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlBn0WEfQJ+tIVomWPQfmh4kj6g122O/Tv3r4t2YMNA=;
 b=tLY+Z7QEBehPSHzL8TXHNN9em8kqf2dzd96ukf46f3TBryol2if92qAn4s6QK6d7bb
 R5rY8yBjITnnG2rIe+MaJgJgVXbVbTgArPw4mPw6LgdRzByUf5j2VMt6742pAQT1nDQE
 6hkEfzhFfbu8lE0GqnQLYST0ZisrL9l6VE65jdoBB57Vi+MBhSul+m3Pc3MyckFEQHPd
 6KNqmjoHOcYuYZyGmIB2UL7gaf7mTnUNtfYw01Udu4fDuHI7pqjlLJKbh9I3FA/JX5T/
 R6S4gRqjA14Qmr9TY5Dd19QbCtCQe1UahAAtWKGHi88OojpriJ4bj7IWJKcsmYeY1Mwt
 i/DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeKxPRyJv/Jnb5bcK+2tzTudFDfoQPH41RsY4oy8eON/ha43vdAi1RjOUh+pfg68yWk+S/ExK8VQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw6DPavd1AB9MSOLqC03klBy3DhBv+wq67n5vcUSN3XzKRqOsUu
 VL3Cy4spT4uzRj7nlptSVXnMoHqfSs+Ic4siLoXLgvB7+OHIu067qqrGGzNsXqIEQCjWqlgfhZd
 iawycWbw12G7rUv35+3JS87krMVU0a0RztvrBfUdXsA==
X-Gm-Gg: ATEYQzzGfEDYr2eKZUR+J5sA9VY8dlgOh+1c9je0SJ3v4I4aPk8OkV0iG+omxVcI8HC
 ZEn/Yf4sgeF5QPXSHrZs3DUC6y7f6wM4f3yWGvl4wOg7sAo1YvQI2su9hqIviwjfm50yCbVrQ5p
 cuYZGx9BskhIRk9c7PCeTE20pDW34Qn0r+YBFtAcSIixyaXa7jwcDtM80iSySOoWOQdYCVmy1Fm
 Nfw/Cgj3o43KacAlZ49TSJgzd9zmcInSeenqWqsw8Wn1//NsFO76CmZmuJRfiQHLHNhRU0p/Phk
 KhGcKK38DgB1rUhjR1WChrke0+6TtBKgyxin8rPdXtUwyxauSfV3+owO/Sk2UHdA7T8=
X-Received: by 2002:a05:690e:4243:b0:64a:cf34:d9ac with SMTP id
 956f58d0204a3-64cc20d2d3dmr10091821d50.29.1772537146620; Tue, 03 Mar 2026
 03:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-4-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:25:34 +0000
X-Gm-Features: AaiRm52_aAmb42dXlBQMmKQAWPnkMY7-5TzxobI5-majXAkfREvhExiRWMQJgGo
Message-ID: <CAFEAcA8Kc_Nmvbr00zH_5MQKjhtt6USUg7fio-5V8qkG-gYnPw@mail.gmail.com>
Subject: Re: [PATCH 03/12] hw/char/serial: Prefer fifo8 methods over
 open-coding
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Use fifo8_is_empty() and fifo8_is_full() to improve readability of the
> code.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/serial.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

