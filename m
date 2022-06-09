Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4078806qvs;
        Thu, 9 Jun 2022 05:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBm+gZSHhZpzOtzKbYOL1OYdaJoBylFehe1GX1/113BL3+YpSYhJmm/lgt7tTeZ0skPMpE
X-Received: by 2002:ac8:5710:0:b0:304:e64c:382d with SMTP id 16-20020ac85710000000b00304e64c382dmr21293600qtw.280.1654779424437;
        Thu, 09 Jun 2022 05:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654779424; cv=none;
        d=google.com; s=arc-20160816;
        b=dPrZO3hVnH5B3BDPRdnkygniJVamwO4A4CBW3lSFRr3Hsa7w1FhZy6y9ezRuAz2ATC
         hemRhl91PBOgIK4zgkuqKkHwOndXYv41Lf7IohTdXeq81Fz9AsEiVuaCHxH5x/EnlUiC
         CEG/yNZDAgjsZMrh2pDbQj+Na83N57XhQyXMHkZlozHE3iz/5Z3CC56eXZLTVkIJ84re
         3G0a4dutQps2aEBSNl0d1TggIoYRd/R57VkcEM92up854q1hANvWPeD4o7Q9o6kBJmwi
         mJLFXpbcRcFaRmMQPKX9lRv5HvhR+WFsQjd2SuONrK5inP0lI/RXK3pge6fO08Fsegfu
         oO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DhiTJ6emla+dj7pCGXl+CkibsRJSmRN7Mhy+ne/JKYk=;
        b=ZAS0Wki309q/O9XDCdtEWUO8tG6i2XstD6IC17yxG2zIkt9VLExTKbcwhLKxtIjCg3
         9R2tWS3pMz3H08WVhszQwCiJ6xAP4Zqjwv+oBc1KXmWoAEeRxWKI+NYfwa45T1pK+nYP
         oHzOhn5lxwokZJ+fayHMs/fQciIgxzwYte6QNY0JOoJDgd8CSwwbRlOgO0bH/FufbAv9
         dJ/wxgcYkFILdq/Amwx7B0v/Xct5GlqBvbXZIr5NbT9kn4N54jJoLURHrARgSR6uBEGr
         ihwgWRG0Leg4DDg9Tp2AVZ40B/3GVYlR8Wm6uh/L/XOtr87BjsMsIHUBxXp1KoRrFcE/
         vcaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQTwchoC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85945000000b002f3efee407asi12578887qtz.202.2022.06.09.05.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 05:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dQTwchoC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzHih-0007WF-Vo
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 08:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFlV-00048X-R9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:51:51 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFkn-0006Go-3q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:51:49 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3135519f95fso66553077b3.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DhiTJ6emla+dj7pCGXl+CkibsRJSmRN7Mhy+ne/JKYk=;
 b=dQTwchoC3lyNdHd/b8ovsln3ZlEOJ+DlpZkVmhLu+TwOhmQ+0B1wp6Qpg8NmAb8WY+
 0ERpyFXP6X1cSO7ABfdikV+ii0fE8rmm2muwHfw3jOlmC0eqiKSz/2xljlEoLLsKhWYx
 aIQstKCHGQ7yQO+E+hkCSJ15WmFQOE8m89K23UHAdYBHiFADaEzT7BvpxE41qyM23GaV
 UbxvgDZahgntO7Pvew3K3Gx56U+u3ohoMUPiTw/J03SvLy3aNy0SkNeuRqZy7dj9/pVC
 HWNq+YKTkXk26n9x+DBZpshHhVu5M5n6odF/VSL8T7d1znbLCJkJurdENA57wlxU3Ms7
 ubHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DhiTJ6emla+dj7pCGXl+CkibsRJSmRN7Mhy+ne/JKYk=;
 b=ctlEfixDnobe1Pc0DqJifNHgQV2EE58Ke3D1fPdlZTU0h4SSvcBeFdFvCKOCIOgqFL
 oYGJKniT6h4SDtgVqEmEEQsVMcbIi/c1t0yXSpSfVEOb+AQHxYbw8TAPdmw2zemikjVi
 fzndflwzcr+U12BPxszFB35IiT/qL7OpPNQUK2BCwN5v7N2slrYMDpeWulMsdu2ESr32
 nPYESEvtgH59qolBm9UYj3dsx9qsollolAK9SUGLLrdbN10Q6du2gmgpJVDEqdmTYUWn
 SXUqzjWYBkENj1BOZs1h3c5gFhk+eSnwrq5Ds01FHX7sRSR8FOjzdh7VveXwgc2rqOsk
 myNg==
X-Gm-Message-State: AOAM530hCfl6SGAC1Zind+7EIY0YoYEFfUhAR3YlRSsD79o+da+SMf9N
 gHmseWQfJW4E1Oz4K5kRAgIsHgHDzxD6KXADoEK63Q==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr40886384ywa.455.1654771863428; Thu, 09
 Jun 2022 03:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-25-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-25-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:50:53 +0100
Message-ID: <CAFEAcA-64EaQbu205_jyYGyta+0e7edQYQPGJT_HCQZ5JgTzsg@mail.gmail.com>
Subject: Re: [PATCH 24/50] pckbd: add size qdev property to I8042_MMIO device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mkfvr3pMaG4z

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will soon be used to set the size of the register memory region using a
> qdev property.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c         | 2 ++
>  include/hw/input/i8042.h | 1 +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
