Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1365402njf;
        Tue, 3 Sep 2024 02:21:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRmdA/rphpUSzlJ0ht5TQOvmW+hrAqBJgyhLxJdNY2YNVWLFQkt5u0Nt6UkJbrnuNg7DtGIc75YuQ9eQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFWh84csh3hNJYk2226gZqzuFrvR+euL0/Pm/xIFio2qHfJ3EvA7DorELy/wU0B4d7F1E0q
X-Received: by 2002:a05:620a:190e:b0:7a2:bb:2cc8 with SMTP id af79cd13be357-7a9787fd9a7mr349778785a.18.1725355269816;
        Tue, 03 Sep 2024 02:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725355269; cv=none;
        d=google.com; s=arc-20160816;
        b=bk5KiQudCBqAeuM1X6uLK5ofn1bbpk8/l8PqvsbGJcZ0EJgtm0sFIE5UWrMB59n7QY
         ac/iI63QqnssG4eyfMagLNu1zhNxlCS/vXw6YpymlHvxteCyW+dQLDKugB6iILyRCwFQ
         cWq1BS4cUI2a39kY4mH5BWvE6vCYzTJyJ5W1I3nf4cerHNtPZMajnjYRRCo3xAMHDrfT
         CfiZv6Wee2RNJojyjnwe3UMEA26uiaxjl2DC2Q0P6HEcEyQhXz4qP7ZQiCD1v9OHly2Q
         WPOwQh7RCigitZ5K0MS+cmwbslHF4KkgYSe5/mwgC+G4zECjO5OdfGwMf4NJr4uUAPrN
         fK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LlyPlv8NDt/sIcafW5MZoI6cCy074VTWfgoEBl6f+bQ=;
        fh=A/tJ2/Wmujd4H+ABrYNzRQIyoTMR1oi+kyi39/7VYFI=;
        b=XlNA4TdViyTJOLysZxcPHCT9oigidm8VyDIhd2aIwajjAX3sCZDIOeOlkdtFwkdB85
         kk4bPx2zcBqrpRcTdVccag6oWTwuzgvFQ60j+kV6qlwJN9P/eV1wGr3NyeyPNugWlSe2
         8f3ETK6TExlbhUeuOuuB7UZMDqIhQCBe5amCpiMNWseiZJVZblTCWvZP534nWW1WVman
         cCHSBmug5D95yNPO+jhpU3a177FM/ZNciseIcdigFUptw50JMLnfqlMKtRQY5hzFylB5
         mwxRUMH+r1ROOzi0m/Vk3oDEAC1GD9HkjWQ6v5MufMRWRfi6e28a82W9r8qcIMS2fbXf
         f3Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZa3Emcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806dbb230si1263670685a.622.2024.09.03.02.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 02:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NZa3Emcz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slPig-0008Kd-2c; Tue, 03 Sep 2024 05:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slPia-0008JL-DV
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 05:21:00 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slPiX-0003vX-JR
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 05:20:56 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5334879ba28so7099173e87.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725355250; x=1725960050; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlyPlv8NDt/sIcafW5MZoI6cCy074VTWfgoEBl6f+bQ=;
 b=NZa3Emczn448Y9zfsi06Wmxj5Jl9RhiImkRKVsEdhm4QMhgc2lreaGgbto/KDCjLEu
 Lce0DI2e4iPsDtyiTkTqrxBiKgynNmTCt3ZrvKQksSoZIoXpH+rRYgNbys1oCDvAbuWV
 ocO5GIY/36TmWgoyxi7H6kNap3gbGgrYPidNO/fBQOwJ8c5MLzuNgma7bRLOsK8WegJ4
 W1mhKXmK/vfAoAOPxsIfTLQr878K3XKZ3QXIAEc2CKsOVbUFoldvWcF+Q/DMuReW/tcc
 wowIx9AmJywp2KwdLcP5k0LvMfGqa1iK7SWNmYLeEjKys1FVCbGtwqJKf8BKdXw1mMAS
 DIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725355250; x=1725960050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LlyPlv8NDt/sIcafW5MZoI6cCy074VTWfgoEBl6f+bQ=;
 b=un1wr70Q1wMlE0aHViRfa70Ty/VKrM8S34kZ8VJUUCETdkU4fC1TUpMaL+ZHVKEUWF
 d43kQ9NtyXu9Aga3hH2O3jbtszbBpoRsfmBv59GcNjXnzu6tRS1vHIJfSj9if/1nwuGJ
 nU8jOuZhmXO4UdoAWtZ6uk2S7pdyuFxF9UeSMXhEdLnktxPoB/7syGOHVQBX30hZbYtO
 uQ+llt2RU30om+Mus4/lmGz1zROP0QO49PiX0k4c9mHYQYZtfPNIQBRU1VBjMqP6lwxi
 5ojBR0RObd1Ox3GsotYLo9IGhOP4zgUkk3rjH2vAdRAmxno4zVE6nQgQR9uZfh0pyfrH
 tgsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpy0kHKVMo4jc68in6xLbEBMTOwTXhCJgynVIjl/34BR0SYiOCR24SvZz95PFJ0HueSGYFjDYcDw==@nongnu.org
X-Gm-Message-State: AOJu0Yx+QPYeXfi6SXUnjklpIVqhiLGpJlHnI8GHHMoyBdqHB8O/Sj1k
 Mqdi8AApua5NbU2+iKMGdaurIoGhOKjdoeaMxHMrZfPdWYr7IsGiDqDdgGlzWwMjKPKP6cIYQj5
 aJgXyl6N0akBpRSLAPUNw3yOVNBiYhWFC7L1RvQ==
X-Received: by 2002:a05:6512:3b11:b0:52c:e054:4149 with SMTP id
 2adb3069b0e04-53546b052fdmr9501323e87.15.1725355249406; Tue, 03 Sep 2024
 02:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240830105304.2547406-1-changbin.du@huawei.com>
 <7c67704e-a067-4b6e-8acb-51b33cf17ee0@linaro.org>
 <6c9429e2-90c0-423a-812f-33f98fe1bdc8@linaro.org>
In-Reply-To: <6c9429e2-90c0-423a-812f-33f98fe1bdc8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 10:20:37 +0100
Message-ID: <CAFEAcA_TyjZMcQ+_aCKQvHVow7hB0Q_nZKzRSxPUA2S5EEyBFA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/boot: Report error msg if loading elf/dtb failed
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Changbin Du <changbin.du@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Tj2Mhhn01WbU

On Mon, 2 Sept 2024 at 21:00, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 2/9/24 21:55, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Changbin,
> >
> > On 30/8/24 12:53, Changbin Du via wrote:
> >> Print errors before exit. Do not exit silently.
> >>
> >> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> >>
> >> ---
> >> v2: remove msg for arm_load_dtb.
> >> ---
> >>   hw/arm/boot.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> >> index d480a7da02cf..e15bf097a559 100644
> >> --- a/hw/arm/boot.c
> >> +++ b/hw/arm/boot.c
> >> @@ -839,6 +839,7 @@ static ssize_t arm_load_elf(struct arm_boot_info
>
> Note that header error is also silently ignored and could be logged:
>
>      load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
>      if (err) {
> -        error_free(err);
> +        error_report_err(err);
>          return ret;
>      }
>
> (untested)

This one is deliberate -- if the file is not an ELF file
we want to silently fall back to trying it as a uimage or an
AArch64 Image file or as last resort a bare raw binary.

-- PMM
