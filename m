Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp918953ejb;
        Fri, 2 Feb 2024 05:50:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzVvFguLnrsMiV/0pbbF6OTl86Q/uoay591ZfeOSEwzaQ4SK4Maa+h12oFAkvbSOHKvq5g
X-Received: by 2002:a05:6214:51a:b0:68c:8acb:9617 with SMTP id px26-20020a056214051a00b0068c8acb9617mr919732qvb.20.1706881851585;
        Fri, 02 Feb 2024 05:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706881851; cv=none;
        d=google.com; s=arc-20160816;
        b=sNjlXH5bBLY+d4cg6/KBAHP9P+rqCq0kIF+oCWr8c8fDGM9CwcJJTLdqql7uXOS/DT
         ONij0i97O1o+vUjdtY7UWL3cEJTskxYM60Ks8QgBEq4CkQgLyCDzHAJF8s18A96rsAHM
         MyBc5Ltr8I5e8GMYSNGZX65c5nSFv79lM9rJDm7eRe1ZNTS3SBylZQCq/WTsBEumoLyY
         pahbeUbJMtsiLnZKWOhIEuKW91XAvWKpFwBnw7bjebdGOgjcQL7XbNdiUaxb0G4ZKxs8
         m4SwROXyPeqqEuiJoMnKQdfQb619LV6OfFpStAAlinqoEPQ+LA5ezlWJaxmFKVTt2yLe
         17AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dAa6DHlW9fMifpfgFla4dpxHkFu9hAjc2PIyHtjRQ5o=;
        fh=xx0sq1sRPnClXbwYEdho1ZJfgRODm0heNJuq0o202Yg=;
        b=iLiQZfy9frSmt5PnPT7g83mlvLzIE5gC5SZybdgIeniS+uhLFE8XBotRDnVUC+Os+C
         0SK2FJyPN5ETWuf8Jqu/u47YssNnPnNg7Gxs3X1OYjD+rfl7E3Vu4n5bIZu0eJANWHZS
         TCKqsTqefiyHedgM81UEnu1wMAZAw/R/OpydAVeSVLm2YeaxAPlDfqsCRxFw7Gm7mSEF
         Ad1Y6oc8Wvwhxf1oCaUhb2B9kGSvYuEWEHi0FBGiZJkLKbJ926BUfJJLksJjXPBBRLa8
         KRYUA+/m5bgaHnWLsGh3mFwTtMZTUCq94Nm79/IoKrosQu2+r4R5Vsmqe10F/fhoR8fk
         p16g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3M4qQV6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWCaBAj61kjmxXgj5cwhgZIz+MA0OqkID7QaEu6pdnGlWztvs7+wLv9is2zQKZcA6il0a0IMJqJpAmjW2W/k9TPaqYrOVIn
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a0cfc46000000b00686ba294a01si2047671qvp.157.2024.02.02.05.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Feb 2024 05:50:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3M4qQV6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVtwG-0001mS-Eh; Fri, 02 Feb 2024 08:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVtwE-0001ly-3h
 for qemu-arm@nongnu.org; Fri, 02 Feb 2024 08:50:38 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVtwB-0004gy-Pq
 for qemu-arm@nongnu.org; Fri, 02 Feb 2024 08:50:37 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55ff4dbe6a8so843427a12.2
 for <qemu-arm@nongnu.org>; Fri, 02 Feb 2024 05:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706881834; x=1707486634; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAa6DHlW9fMifpfgFla4dpxHkFu9hAjc2PIyHtjRQ5o=;
 b=H3M4qQV6FDaFtQESTecpZkuKJoGyqWVA+aO2UCQlBJqbJ4ElrY1/j2HWqonFgk6I0+
 Dgh/8c6GFq2JbRd7ekgZ7pJZAE4cRwdY2/elL/tugVYaVDilN2tV0r+jF0UeWUvPiW0T
 89ZeKlJ2tA0/HSYjxfauoHo12BSbVemE65SSfmxIwj062iCbLc3LScoLZLGzfSoBS51n
 OZnNCO4Axvxpnkc6hd+3OI5krwtQesSDQEt+Brh3tkrsybvvUjEpdIfDmQi9sCyLoG8b
 QP91tEWZf+qvOwlgaBNPgkp5XgFv/QulYDJ7K7pqecagH58VHC6++30/q4k+t2d6yb21
 HapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706881834; x=1707486634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAa6DHlW9fMifpfgFla4dpxHkFu9hAjc2PIyHtjRQ5o=;
 b=IoC6C3fcwSLs/336fDO+Fzqqd5+ckAUTpbIu1Ld/3p68mrccJpvAs9+wwO8HYS5fxr
 Jjf7SskJKN3y1QoMeUIyAu2Mx1g7y+8apOCzYz0E5ltboeXb9AV9Q2HeB8X+VLk0Dt14
 N3hfknGi1cYOKyCx8IpbBmCcSQjVWv1JUv/cacdZUt+LjK0BVDbXuwZaNWncU4h0lJOT
 7RuUvUEOFaLVqTnUC+6mT38UCMx42dB9lgAWCHayKVJ+b/y879MwyvAX2PCRq0I4S4g2
 iWwYz6KKy4tK/4RSO45U7rTnCeRURICa5mNozGmx5SUxS/HZ5nQbwQC9U3J7MAHvSKRw
 Eorg==
X-Gm-Message-State: AOJu0YwFisc9BB4mAyc2jNIU34qr7Nh9YCgjx4AOwHSBzBjhABGe7O7x
 Ivj94d74onQDVYTtv6wGQdr8eoLqMZ1iXiesqgWPVpJmmb9yxkfR83T7RP2/uvWeyTUe+NBSyS2
 Nba7e4mdTBF4pOaLnF+MuM+fBDJG9MNvztRI0HamlfTSza5Bp
X-Received: by 2002:a05:6402:3d7:b0:55f:fe85:ed4a with SMTP id
 t23-20020a05640203d700b0055ffe85ed4amr877231edw.34.1706881834314; Fri, 02 Feb
 2024 05:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20240201141253.806055-1-clg@kaod.org>
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Feb 2024 13:50:23 +0000
Message-ID: <CAFEAcA-pkSRWRLvmxGL=v1H-UV-VemGkXJEXAMBASfkfnJ7A8g@mail.gmail.com>
Subject: Re: [PULL v2 00/17] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: f8AhQEfbESim

On Thu, 1 Feb 2024 at 14:13, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit bd2e12310b18b51aefbf834e6d54989fd17597=
6f:
>
>   Merge tag 'qga-pull-2024-01-30' of https://github.com/kostyanf14/qemu i=
nto staging (2024-01-30 15:53:46 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20240201
>
> for you to fetch changes up to 649b8ed20543f1b7f7e3dd8fd409092639bb345e:
>
>   hw/fsi: Update MAINTAINER list (2024-02-01 08:33:18 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Update of buildroot images to 2023.11 (6.6.3 kernel)
> * Check of the valid CPU type supported by aspeed machines
> * Simplified models for the IBM's FSI bus and the Aspeed
>   controller bridge
>
> Changes since v1:
>
> - Endianness fix
> - Renamed test file to match other filenames
> - Fixed file list in MAINTAINER
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
