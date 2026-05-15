Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B520CD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 07:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnMk-0003O2-QY; Fri, 15 May 2026 03:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnMg-0003NO-3w
 for qemu-arm@nongnu.org; Fri, 15 May 2026 03:53:46 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnMe-0006JT-Lt
 for qemu-arm@nongnu.org; Fri, 15 May 2026 03:53:45 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-65c305f381eso12261754d50.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 00:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831623; cv=none;
 d=google.com; s=arc-20240605;
 b=N4qNcnxKGuRd7o7IzbLY8UfCxIqGQ+Ra+Wb/qzgxlEx6aFd5hpTKFhxLh2Am/CgLSg
 3tWRjzgnvTDrmR9lNzxgJ2q2aWudB53Lgd2pAy7Iby8pHnt+EYFRg0sIQI08Iz3jO3zx
 70H030+g6cMmf/oVjOyCa54IgyqIOdCztD7fF3c3NDJUTJPYVA325BB733mSn8xcqrcP
 o9HDfCFwfLHvLq1flR1VKmXQ+LTvnKMFdbCgsXjuQ1yCkAHfmp8UWoPTXnCjN9VCAqwO
 /PYz87pqPUkNPBK+97f4Il5mdem/AQ7QxyplHBg9KbHCIgQr1gYqO5gP/Dl00QqUZOyl
 zVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IJ+oUe8oGbEUKSRqECazEtaPL7QJvkcdQxXjOvM9upc=;
 fh=sFi3cVwvFNM1gZrcc9Fb39MN46GW7iG2X7v7kZ4zcUs=;
 b=lPB47AhAdxI16ASVt6/q6zpBo/H9FhNOapBqCjKTsH+lG3R9lo4bakJ0T1hZ9zo4aN
 Q/Ap2nMhhoX0sGiXmwMUVIPJz5dlyFiKFTKejjJ3ZmH6BVBR25Q0W5/xhMPl/BwQqIFn
 hIwzD4kZA9a5tFo1c9nuM3AJsyXWIFcTAPBx42uEh9DpHs4Fo96z81DJGACmMtCheR1y
 pk7SIYxyV8uWpii7anpSFezpzU0c4UoRdzmJO44uIuWTMzzbcsYdTympV2ToB3XCOiTk
 LR1r4SAfynUmeyV3UkF6k7jKApnZWuAWsdwsL1c6Zy3ybWOoukhh6qX83rP8847K8px5
 Wr+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778831623; x=1779436423; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJ+oUe8oGbEUKSRqECazEtaPL7QJvkcdQxXjOvM9upc=;
 b=px3Sa+geyvRd4RigBk4pQ+beDTaAbSHJ07/lfAA1YgqSUb3xwU+OtQE7AAOzo1+7l7
 mfKm/b+faYxH5ERvJGoA50vVJD+943840H+htHODAMBLAgRo1tv0K3OWAOOcuK/iH0Wr
 N0x3KSBxPYndVrIhuFs/DxmcKq5Si76mFp6gT6Nps3KvdrBL8WGL0Yj9IdNw+NcxdBbZ
 +ceu96++fL3QltGLC3VzZT6rhmQLLssTr/+jIFoVp4ndu7QUWGlP3L+4YmpAsIvQHfH8
 TBoP9yqRLqrFAdMIrCDsD/j7iZaHJfm/Wey2GGUdO2i1OTDbDJYGdulQ66BrqdvHRgFN
 xN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778831623; x=1779436423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IJ+oUe8oGbEUKSRqECazEtaPL7QJvkcdQxXjOvM9upc=;
 b=gZzwGW8FgXlJzi1FTarWD8X2L06XHgYFMV9w/oVm23d1oCeniTXP/YzdDV5iFWvLoI
 V8RRnaT02LDfj866uyR//6Vkob3ttpSg6oz6g2UeVom6CnCGOLEpTtggkZztgwmiv6Qr
 0m4ui2GqoRRlxTNLue0H0r0YQVHqwmoyk3DNn4JZ2i0EJKlh0cR0TOsQV0mcxSpvpg/H
 /KbnXvekNJzP1FKk9o3WGz31Z1mDIsJXAEnn7TG2TAQ/yN+xu+Oa8C8BJUZjTE0cCsQP
 6KlTaNROwPmM8b53vGRVCKZovnF5eeVA64LtFh4O4kGpM84JZ6JTc0F6sCH+HnohzeE2
 Zwug==
X-Forwarded-Encrypted: i=1;
 AFNElJ96logOFHjM25jC0yktysoGt3PbwsCjJgR70lNPxsm8RsJ8RdjOz5AbMldqxcjw7zt2S1x7ga3fTg==@nongnu.org
X-Gm-Message-State: AOJu0YwISlXYf26KpMPeDi9y0Su0trjo5DIPfXAKYGjzznCcwGFQzB0R
 TKXI2kb/r/tEHiDaRVUzknVSXiZG2NTDGqQMv0gwRcv2VwdBg8qDwK7DnsnAzQ48RU/3pkyGTxV
 s/prcU13PhdYZBxRvm4E/oRWIYcVe2ZDY5hmA4iPl+A==
X-Gm-Gg: Acq92OGEunsmySd+hIT15UFPJb8nv9v844uJslq08RQub/35rImp+bhz+u83/1iehAd
 diXW/0NKfprl9V7vtXZWXNzHtgHwRfo8VXj234InaUnz2a9Xop0unxsLthhWwrZT6KqHHbYOaNv
 cqVPNIVRD0oAJEy97C+EGQLgSFEc9vwzw3JoxIJdqiZXAohRPyfHYy0FXPqb0OsX1ij/NTwE+D7
 RbY6eIjQn0GbhiB5Ivh8eBQu+WwCn1s7kobBB3p5WmX8DBZA7H1hn7BjwGP6ECaXTaT/1jMd4/H
 MvhsY6Q+TzZqVRycz9ILl4ggQOilUasCIP4x/XnakwzrCduRCv4Kilpu1ZjCOcUgrRk=
X-Received: by 2002:a05:690e:1517:b0:64e:a335:95cd with SMTP id
 956f58d0204a3-65e227f64damr2592808d50.41.1778831623163; Fri, 15 May 2026
 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260507134709.70507-1-philmd@linaro.org>
In-Reply-To: <20260507134709.70507-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 08:53:31 +0100
X-Gm-Features: AVHnY4IIiEcqBsWj2187kbXMGwed8ZNnMBs-CBoxAoll8AKJ0fwo4HcjuIvbiLs
Message-ID: <CAFEAcA9VrYhdqPU_Lao=OGOvtXt8KFyfj4Y5P_U1xek6C7x_RQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Extract IDAU interface to its own unit
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 7 May 2026 at 14:47, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Trivial series moving TYPE_IDAU_INTERFACE to its
> own unit, and moving its header under the tcg/ namespace.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   target/arm: Rename Aarch64-specific methods
>   target/arm: Extract IDAU interface to its own unit



Applied to target-arm.next, thanks.

-- PMM

