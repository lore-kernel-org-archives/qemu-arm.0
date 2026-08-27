Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132E5C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 08:43:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVhs-0002zp-2k; Thu, 27 Aug 2026 04:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzVhq-0002yH-JK
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:43:30 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzVho-0006uQ-51
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:43:30 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-81f64e8dfbcso10913387b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787820206; cv=none;
 d=google.com; s=arc-20260327;
 b=ETu5MOPRHF7cSZDD+T996/woDzC86dsDVh3FcfA/uH7zrFVX+/i4wKosbIJCGcTy5a
 9/7Du9+z47DKMJy2yn0VQAcY7WXKBTl7tVYMJictQT2c1cPdQFrj9NLB3be5J3U3SweA
 hMpnKRPQzSGYtZ2Du1FjFs9QoQ0z6Lk3Sg7Agc8b5y4HANbgI9J6ls+Pc5aPLupDgM0x
 lBzAf6dlbQrblCJ7qsCCQFGRizAoJqDWBkpGz7ilS1raZPa3vdw35z8nMUc1a2YI0ACc
 M+qL8FkefhcVr1VvXXKR2paTbNawnrMFr1QKXatWZTWa0ypb6Hqc8Pg3ZfYbmMgNU4Wy
 pABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fmTjhSvtnJsTs9f2WlIUngWxh9jpt5Q0EV8XjjrlYbE=;
 fh=bP9f4RM+2ffiwjbSMq21rXiG3Pcm1esyQWd8r5phr4U=;
 b=aiwymKx3L2uS6SqNghMILG/RRmWccR+vl1Wr3bGKKSAcKCWeG7YOLuLuLbWUothyph
 cdfHcjyiayLHLj0UO00wzSJ3HFePiro9b+mGOLYJMMnvYtzUWVQMriFSM2tp/AHAmlzV
 RHuNGqByBAwy20EwIMPTgieODGpazZ0cQE8FjfQwIpIeb0pQhMCicDOtE6rF6Lbjqpv4
 206+swB0bfEYTM5NQl+cJVwKzvK75o/P2gwQiu2KH1S/3bS+InijBOfRUASDJfy9HwlK
 rcz4JkCWQs9RcFsyJ/9Z8g2q9BMP5LW7YvHtyFI6hndyxmPjyxfufV7M+KQFuv0JA+nK
 cVvA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787820206; x=1788425006; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fmTjhSvtnJsTs9f2WlIUngWxh9jpt5Q0EV8XjjrlYbE=;
 b=JDALbyH/7b2B8m5MU68vZwCKhPeGMG4iUwWeCwIrOjO2cO63UWvnXCDSORwd1S2y9s
 1HP7Rzf9Bbqwpkykiad6HtEhI015V36Ri0USQXsEW9vtnqdcNnxJWxWVPbuvqG4tzP45
 9mZVtAM6zZxBWDJ3TxZLcblwpCmEXrkWEmnukmopp2xR5OZAtNswavQUz4ufjl6uKsxN
 Qk8VF/ywU5hkVLRBNW2NrLZgGDkKf9R6blAaVe2Yq0LYkpOYRoJIF9KwKC9ua4Ucg+sf
 6cr1FtO8YJaAHykg70ItS5mwBvcRxWpQFIZfKYe07MKS/3LcxxDVsrcpcV3rHtoliEpN
 UxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820206; x=1788425006;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fmTjhSvtnJsTs9f2WlIUngWxh9jpt5Q0EV8XjjrlYbE=;
 b=CAVuP5KMrwcPJcPlD7nL102z6YcgM9KjtusznEjPdtMyMtuFOAC426BlEQfrBYN6lw
 DGzbHNl+8YFYEPw+p5rMHfUfm5yFOOO8J5RZ9fSmSC8e7ByY5bek/T/1tLlsjo4yt0ZM
 3d+nYxFZpzhyLnH7t0hkhkLtN3s4JxJdyqhbh72UECVD8QpnFXmVmCHmZlxEycW7fj+F
 zHsQpfhRjeHHf20wIBeWMsVDWFYvLj9LhXiDxaMjpbwIK2FhjhHHhKskvEqR0hZwQgKC
 p5+JXUxExFt4OkxUoikrWpicxrfPSF5Q8ZSCS4VRC1x0m+YSViztBhU3NfL0f7v2VY9b
 cv9A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrB4anHaZSu8gdDRP666OhbIWjCCvyyouOcPlLypF94lpRkeZxphP305uhAxaVk2ThB0GrBEt2h4w==@nongnu.org
X-Gm-Message-State: AFuF++k96VVZFNV5lCvJJCcYv6bK9G2o6u5r312Ql5aBGUruOjw3wfy/
 F84E0AqCWZHBviyDCeo3W8PqFh4dS+uhYxG9oyL6DTstFY2rSo1vYD0cz/5Ws9YgA/9W21v/lUp
 PCxHJBTnziiddnHk9L5FYGYmGjVry5Zrq0kW7XkbctA==
X-Gm-Gg: AR+sD11Ob/3h3mQPVScUO97CPstjgd6mrMg49wjOUW9Pbe2vagn4gQTfgDFzRv9WljE
 LRdBztW7JGBz7k4oTTB2a4Uba4qvTKvcOzd1AONnI3t9/GQg0gDjjaUvvJ3FhjcWPYbLi64iW0D
 +jLrVj6py5gh8Jhp9Czwa008MwzVb7H5JNKO2Yx/Ntvb86YyVcDLEz3BS+/AW+zQQkcIThwf6UL
 OYyJ4qAeS6/PdiRuqKGCgpUME1K9aOqfPLIKD8jKqnAnqaqdJkkZvVd6zpXsSKFMhZ2J3s/1Tw0
 qCkyPIy7Ad3pqP4ddqlypkpFlQEH5tIGB0qIxGlBMgfxenyleOe9roeY+aihaj/O96JZqH8OcJq
 qNnGtjyqnvum//qbJyfZqlyXWNujW
X-Received: by 2002:a05:690c:e296:10b0:80c:d342:955c with SMTP id
 00721157ae682-8573c2fdcabmr48193347b3.3.1787820206006; Thu, 27 Aug 2026
 01:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260826074635.2850931-1-kchiu@axiado.com>
 <a665849f-3b20-4ad3-a35b-02259e882628@oss.qualcomm.com>
 <c15422ab-6a58-45b8-8df6-b2f54e0620cf@axiado.com>
In-Reply-To: <c15422ab-6a58-45b8-8df6-b2f54e0620cf@axiado.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 09:43:14 +0100
X-Gm-Features: AcwNN1V0V9pI_S7sEMSJ-Wr_3nHSLX4cvEHbr4NU9oGIMUrGy3_hZoalRiqLJS4
Message-ID: <CAFEAcA_2GiDUY36TAEk3OhJfJLLDkQja-A=x9UTFGeHAP86t7g@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Add Axiado SoC AX3005 and EVB
To: Kuan-Jui Chiu <kchiu@axiado.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 163wangjack@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 27 Aug 2026 at 07:39, Kuan-Jui Chiu <kchiu@axiado.com> wrote:
>
> Hi
>
> Philippe Mathieu-Daud=C3=A9 =E6=96=BC 2026/8/26 =E4=B8=8B=E5=8D=88 04:18 =
=E5=AF=AB=E9=81=93:
> > Could you add a functional test? See:
> >
> > $ git grep -l obmc tests
> > tests/functional/arm/test_aspeed_anacapa.py
> > tests/functional/arm/test_aspeed_ast2500_sdk.py
> > tests/functional/arm/test_aspeed_ast2500_sdk_515.py
> > tests/functional/arm/test_aspeed_bletchley.py
> > tests/functional/arm/test_aspeed_catalina.py
> > tests/functional/arm/test_aspeed_gb200nvl_bmc.py
> > tests/functional/arm/test_aspeed_palmetto.py
> > tests/functional/arm/test_aspeed_romulus.py
> > tests/functional/arm/test_aspeed_witherspoon.py
> > tests/functional/arm/test_quanta_gsj.py
> >
> Please allow me to add functional test cases in another patch set
> because we did not release firmware package on our Github for
> downloading yet.

Can we get a functional test for the machine model you've
already landed before we add more machines in this family, please?

-- PMM

