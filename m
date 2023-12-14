Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2259734ejo;
        Thu, 14 Dec 2023 03:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBjMq59q62w7q8zbLGhGBgriC+x043QaMkcPQ+FH2g/lswVzoqbNtJrvCmvWcYxB6JJBhX
X-Received: by 2002:a05:620a:1a91:b0:77f:36a7:1437 with SMTP id bl17-20020a05620a1a9100b0077f36a71437mr14528736qkb.114.1702554570664;
        Thu, 14 Dec 2023 03:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702554570; cv=none;
        d=google.com; s=arc-20160816;
        b=dW068cPt/wDFdXjbHAg4eFEwOaetcwM87tax9pEp9PBWGjX5HTmMy8YCqEEMRT8Dpd
         qCJ2IF5uq5Q0HCK5y5DAI7rw3x6ibPBC+UZHlpeXpQS79uTHV9IsX5XeUc953w91l2M0
         Ld75tsGO3aOZqBGvT3DydzBcMZvg4TnN2PSqCdUT/HS0NhVl/QOh3heOJ9JBAEvCR62b
         IFfd1BytOjKr7zG2UQ3VlVSNU0p7O9Bvmi6p+bxUbvHLuuqkmqF6ltKCHIGKrC/eRjkO
         TTQJP9QTJ4o1Dx86z9IEU1yBcnxFb+Id1619sjCAUckSVLYi1CHqDPhT2Z8ZLVsUKw5T
         IHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=o805vYfYnSePSMI831jkN+xNL9o/SrXjbRPltSaRWLI=;
        fh=1komeYtRXe9U4Bqso5Ho7YoGM6y/8vfhzEw8KPv2h3U=;
        b=ZhdchCuazHGE3fmNIKw0s12oJ4dxSEYcGviZWO5y4jbNhOINs0RJTpftdVmnGUFjOw
         YEeuDQkGZjF77cr5HIihY8yLfpjsuP4mo1Zr+eQLTc+JwwEhabXjmRUHcmQcWPJjrREt
         OvzqL0BHwtBRekCiTg3cQHjdT+a0QGodjFNPHj7EjecMRMZn5ZIW5kBnyLOekWQvruvt
         z8KOxcOQyfQXdxVQDPjpBLrJaysEd1SHN/JokpOcENpHIQbioZ/aCgciaB4gMcCgos5G
         ZWtfcq2w6GNe2jK5GBQwXY5vJ7TQueizasSTCzi+ffT6kixQQrnMl9bH16o5Is5tzh+f
         rvgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QynOZlXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw13-20020a05620a600d00b0077da5d013d3si15416785qkb.639.2023.12.14.03.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 03:49:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QynOZlXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDkDW-0006jq-U6; Thu, 14 Dec 2023 06:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDkDV-0006jV-Bq
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 06:49:25 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDkDS-0007ra-Pt
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 06:49:24 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54c64316a22so10114489a12.0
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 03:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702554561; x=1703159361; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o805vYfYnSePSMI831jkN+xNL9o/SrXjbRPltSaRWLI=;
 b=QynOZlXEteh0Qyhg+i9CjOMiXhN1WkuWkMoUVcGlxz5db6OlnGTaMGEDUshp+g4/vZ
 aXyumS5KuD0HCc1kkjdTPgHyHiq+y5waRUSVfLvAjX+IXfWHYkU8gmTZ/qQgpWOnhlNl
 bV4gSHGDmNqPG7y8gwOCYpkQFRBIj0UDnNTi8N3K1fByrA5+N51esc1rL/iVk7qB8ywo
 wb/0otm5Fhh3E/G/JIGifCuYldLHpr8HPBHnXohOli52nUzm6kOu0qoSxbMQvLNOxF79
 HVWdeF2Ds69hjEe448ilCn5SFOV0v8hEeYNbD7d+sLZcaQPcjEOYoL1GONbpAdwjLcVC
 /TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702554561; x=1703159361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o805vYfYnSePSMI831jkN+xNL9o/SrXjbRPltSaRWLI=;
 b=YQsghoT4y1AuRabGBt86/D0CyEUlna/yAjXKT87JHw9FKYXiEPo5zn7Zz9Nz2Jrsp7
 81iDzt5iISt2fe7sw+jgMVlBNBufErUepYmnARSm/MwPeAl94GLdjCTwIOJfcpeCWapX
 /2Iqtnkw9MWIRMSDR3PCohb0aOCn/CJ/Q7uDTYjvVOdyH3o3Ijd2knadyCkLeHZtXsAR
 YHDrOTG5r20DtxDB+WbA6cd+dmZKRilPXcMyuY7LjTOOhqmCDLjizQHJD3xFa4MNyVX7
 UnrggnrnBL/crya4vZwDL2Wnb5FEadLp6bHmPts/5vmWvUDJPCQWXb05+VVcqASn53wt
 pVkQ==
X-Gm-Message-State: AOJu0YzJ2mFTjNWfl8CAtM3271KTEVEvSWuC7dEWcBZoG7+GHLFlKC8m
 QpDa9QZenlnPFmzez7QdVZLwRjJLfUX2G171qhnkXRFlqVbHo9/r
X-Received: by 2002:a50:d0c8:0:b0:551:d08e:782d with SMTP id
 g8-20020a50d0c8000000b00551d08e782dmr1772697edf.6.1702554561012; Thu, 14 Dec
 2023 03:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20231211175215.3216667-1-nabihestefan@google.com>
 <CAFEAcA_j21Vbr6viZtNuCymR1eM1J-dn3KxO1qPiQzuVmY4ibg@mail.gmail.com>
In-Reply-To: <CAFEAcA_j21Vbr6viZtNuCymR1eM1J-dn3KxO1qPiQzuVmY4ibg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Dec 2023 11:49:10 +0000
Message-ID: <CAFEAcA_mT8HOH4Q7zv-Qbiz=H1MnTcJdjyQJObk2y_1f3BPkBA@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Implementation of NPI Mailbox and GMAC
 Networking Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, avi.fishman@nuvoton.com, kwliu@nuvoton.com, 
 tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: XarAJTD1HbJ4

On Thu, 14 Dec 2023 at 11:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 11 Dec 2023 at 17:52, Nabih Estefan <nabihestefan@google.com> wrote:
> >
> > From: Nabih Estefan Diaz <nabihestefan@google.com>
> >
> > [Changes since v6]
> > Remove the Change-Ids from the commit messages.
> >
>
> This doesn't compile:
>
> ../../hw/net/npcm_gmac.c:889:43: error: too few arguments to function
> call, expected 6, have 5
>                              dev->id, gmac);
>                                           ^
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/net/net.h:159:11:
> note: 'qemu_new_nic' declared here
> NICState *qemu_new_nic(NetClientInfo *info,
>           ^
> 1 error generated.
>
> Please make sure you've rebased the series on the most
> recent head-of-git. (In this case you are missing the
> necessary changes to cope with commit 7d0fefdf81f5
> which added an extra argument to this function.)

Also, when you're resending please check your cc list.
You have had a typo in Jason Wang's email address for I
think every version of this series, which means when I hit
'reply all' I get a bounce message. The email address
in MAINTAINERS for him has the correct spelling.

thanks
-- PMM
