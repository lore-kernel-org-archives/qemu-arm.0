Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3679C4451C
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:35:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viWUo-0005oe-DG; Wed, 21 Jan 2026 06:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWUa-0005jx-AV
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:35:20 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWUV-0001ay-4U
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:35:16 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-78fc4425b6bso60605817b3.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 03:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768995314; cv=none;
 d=google.com; s=arc-20240605;
 b=Q94mUJrO63R2H7dOJy3jJ7g0M9FoghW3cg4FlXHeGT/Bevde0iPsskYZAR4205II7S
 7/u9lprxiCGPanyQTa5VjEbJCvkPNUHtc0vFDTjLJkfy5zLnEkveqyVLnow9DZAySVx2
 TG10HHfPUMLlpsn4lfa3u/9M1Ws21qO60gX7TZupAuzBgmiYgTR/ZUeZFID6XF5G+gVd
 zSSq0PFO4YN3lJZvk5biycpMr5zDadN7EVW1fORsn4VyWLziFvYvu07BI448AdLhQbTJ
 1qM3gA0341h75UxG6TWm0F6F9FleBV2pHjpku/A3Edy2u6PGPE9xyZdw8Ekmp/13B0tQ
 rvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sOy3FU1FVyZOzKUYawtQthgZ1eqLYED3LxtlLUFq+ww=;
 fh=0i+GkzPHuHwB9RvMymJnACEZyRVsgbNtu21O3Csajkc=;
 b=VmQi4rsR0q9gMyIvPQkkyMsOBwKbg5UdiAco7clhLxczp5lRIB0nf66zyZhLRQMarz
 QtDeNUsUPRxr29lEQEGN+HHFCU3PyNXtNQ6HvufkWHRFRLDeGVMFysSm8T57rH4EZTPU
 f7NQv1TaHAlyK2cSNl34XBdloJiLT5al9Cc/vhQYEUm1p7b58v3pTZdPsIgQ0UnoOVBj
 mY+LHcX1oNGIFAUlw3f0YApCcVse+E8+t2o8obHaN9wGU/ZXchZqAG9p+CdMAf0Baduf
 cg89weYePDNqUjUSRyl2xdNKuPt1JmeSeeEEUbRFJ5OXc0twncXx/qBnG1iQBL3FGv6v
 40/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768995314; x=1769600114; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOy3FU1FVyZOzKUYawtQthgZ1eqLYED3LxtlLUFq+ww=;
 b=xD+kV0AtYErz55avvTKl8krwMdAuEIh4upm4oyQB2wNJ+cervtIfG8tnEj2q+Z6yxK
 PcLSA87M4PsJgA4oX5jaO8qz38I5DjzBZGWn5YElytq3xzIZxf8b4LF8Yut/8xnfNOEZ
 EOfvCnt/QKSw5aPSvCq/jDLgIm6QoadkaPfmvVi86KNk1Q62AVr0Ui5DVpSDVLxAImfV
 RNGpw1NdMWzAnfEe/Z9yJ97xD//G8pqs715Lszz0Maq9DyrnfDg4kyCPb/qC+wsdQw1e
 VVnlEuuIFwJev3XlkgUnk/PlD52MLrZWPT+fsx891GO7pGHjx0iYdxxWtkdRUYNehjlN
 zOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995314; x=1769600114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sOy3FU1FVyZOzKUYawtQthgZ1eqLYED3LxtlLUFq+ww=;
 b=ilUOjEeT0y+WjH5MLba6IXmcn4/wxxixh5LxIrwsNtmaN0LK/usRCSjkfeL6AUXjZS
 KS1aWh79a7L1XstPFV6l7Lg2zn3R65PH3GFt6cC9sxsxdVY5kEvBQZKsB0qXqVkF7nhA
 2KvJ6fud1/DNiZeFq3e/zGmhZMxAkmSORZ/q24bEJeGj0knWK2o6W5YrrFBsvzJ6By6k
 CEQihFNGsw6KGP3atnba25nC2giCUGdeeDc7Bkeww0zHuKw9zMVMsSpCuhArnf0Cs+2L
 7cNDbd8yt3+a/8BdRkV4xODOHGv77f+LW1dTEGIVnRQFKjNDtttJJxFWtYiQBAZ9wfTE
 2K/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQqWd5cTXNosUBP2W/1LSekHhORw/wjJ5glkI18jjCkSDIIW+dR+gl74QBJtiELV+qwkGT4etw/w==@nongnu.org
X-Gm-Message-State: AOJu0YzVPAQM8Av5Om7yCGCSqhOMUSn6YHUqVnuoOohwpajyQrTHZs04
 2E4BoRIdeQ27SdKXcMY/teieWO1rSUKBaatkLtwiMFDoJasuBSS12oWwpCLW46R1JqqVxkqcwlV
 fZJXL7PQvbu2ASKhEmbi7JfJ4DP1roNlLze+xw3OeIg==
X-Gm-Gg: AZuq6aK8t5BHoNY6Xu0/khiGhdq3C6ALr/WcTxc+ym3K0nzpxUba9bYLVJl8kSK/Pi/
 tumSkqw3/IRPQaaK9yRIpAZFE2lKRMxB4g1thGVrio35psSSgDvi0HvibIxCxelld/y7jY+5qQk
 Ovlu+O8iFrXlycvj9BOiPkBR6SD2mQVfgpPQDt+2RzvSrRNfqt2vkgnggWVgDzUQBzBV58wuwwV
 IfrAwfhX3UJZKEYsV5BTSwD/31URw85wwpsjJt4ICwjfnSAuaO9QGSa174qPsDlVqMqYw==
X-Received: by 2002:a05:690c:c4e8:b0:78c:28b7:88e4 with SMTP id
 00721157ae682-7940a4b09c7mr38618837b3.69.1768995313694; Wed, 21 Jan 2026
 03:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-2-alex.bennee@linaro.org>
In-Reply-To: <20260121105932.135676-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 11:35:01 +0000
X-Gm-Features: AZwV_Qjqb5_4XxhvuTEpTBmwvOV-e9CscKoPP3byuMJGy98n3s8Vm9O7TJ6jtto
Message-ID: <CAFEAcA_NAGoWi2Vra6nVEwQ-+FnrD++eoZQ=QnqVp=nxj3w_uQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/intc: declare NVIC regions as little endian
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 21 Jan 2026 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The NVIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. Indeed the Armv8-M architecture reference manual
> declares:
>
>   All accesses to the Private Peripheral Bus (PPB) are always
>   little-endian, which means that the PE assumes a little-endian
>   arrangement of the PPB registers.
>
> This should have no functional effect as the NVIC cannot be
> instantiated on a BE system but will help the single binary efforts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

