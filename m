Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DC1EC01CD
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dpJ-0006ke-Eg; Mon, 23 Mar 2026 07:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dpH-0006kK-Ca
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:52:07 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dpF-0002YV-Ub
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:52:07 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7986fb839f5so39846247b3.0
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774266725; cv=none;
 d=google.com; s=arc-20240605;
 b=GVyc3M5SSjlRxAM+8DmbAIKtcouvFe8aEm0RCQ7Aw0FfNA4Xcm+7fcC5xXfjqykwTA
 5bthMwmBBMaPwt9Df2XqvoIUDmlFdYKmcPQMJ3zrIwfpAmc8TqJh3ZQ1jkCQR7358qyd
 zRlJ/fq1DropsBjUO6yFi6IeEQsS50DcXvSbM5gGq8hDkOnqu8fxjx+aHKuQ8aNoCIyL
 ZnWBhEQ5cfWZRtMEKniwU+LcIKKlbIejHaL5CiTHzNhMNGnJu8PlTvI+4bThPUjCeiDE
 VsjvaqamLG3EVcL9pXS6ScFdczUynM13xUJYx7HUZ4to8jZ553NQQgYC3Xp+KGWOP53z
 RZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=g1UvfSSZcwq3ztyFTcdZD9fAwXHnGs75XlDMAXCKIXk=;
 fh=4nj9iRQIMKTCiOXfOkzNY+6w/l84RHR/dZKDl6YVpy8=;
 b=YPPGMoWofR6uHlEqbk8NWoHxTKWs88+h7UOBNyUfdRDLZxhDF/4bdfvdIpAUYN7F/l
 1tBVltH4NJaE7ksEA/vspmLGaPjNPrYkgvRWMdBHHtdL1DeBqKnPWGj5XiR1HVZLFCTJ
 Ya1OsMdw1DOgYJL0Yyl387w7xQXCNX5L/UklgBiwToAY/NcyFFj+4L8KCXP341CqHMMn
 Jxl6NOZjkju2xS6s4SfEpbfwcbgtab3sPjtN2PGYsaXW2gVK09slrZebFdwvc+ypHeTm
 NQJWgnsXMrL+ll5+2etBSy6cg8q/OG9BF68wwCGwK3usvyvK/bhPmstFfK6sybZJq+0O
 /DYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774266725; x=1774871525; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g1UvfSSZcwq3ztyFTcdZD9fAwXHnGs75XlDMAXCKIXk=;
 b=NP50O/OTGL04GE/ahqU8VwCR5lSRar22/9Kult/hKmYYrurw907Tst6yIFQCVLpfxa
 iAr5zUN2xnlhj956XD+kOTzk+39JKGTiBJhqiXnt146vTdky9KkoNZrRJDYykGi8zemD
 X0SBccW/1vjpFR+XNLNtE6lr37Nb+sXguEO+bPvNoU9Ghr70R9DXVfx/+UwzN7SCudkY
 7cOsJq1L6i5fLFGkB20bnG12lhWz7z0u5zBUfd69TpXFOfxcTnc6SFB6McgvEsc+3HTj
 WEtuLRt+ShkDkCopbRFApJoaGSdA4ftSK1ZHjTTQ3/OTRrMlXNyWRIRZO18mNw1QfZ9A
 STZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774266725; x=1774871525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1UvfSSZcwq3ztyFTcdZD9fAwXHnGs75XlDMAXCKIXk=;
 b=G8vbSkGgYiAFLuzry56s0iZjR5PDUS+/To0YIdJnyfgs/AghG21agea21aXdFh7w/C
 gz9nQG6eD4I9Q55xj8DFEf+NpOSFMsYmCAtMJ+TqxpHCxEd/hDorutsSsiQgadU1COCm
 zd3uOtrU/vzt1p616oLQSMwaGRA7WzAZw9cqeuKnO+ttWMfA2wYsIw1vGTx9xc4aN4hg
 +b8qbTh0KummgZj2T3tiK9rkm5BC98COak145/0986YJbuSWC7goaTPoDtwUnOHa+4R9
 jjR+t/2ubfk8riU3sNe3wdouAPGE7d1cJEHLzMafhXLklTbYtVnEVAI4bcJAZKG3bz9a
 fH1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8SCkMcgvjK/4eqJQX5Ip/0yWqjCvPN2kooqxthrFBNM3bmV617rP1Eza2A3AKKRCx+gycEs3l5A==@nongnu.org
X-Gm-Message-State: AOJu0YzDSQuTHry+tKH5dSap9VTEC1D+TWsLYr0mCHm74SJGbC4cZOtU
 i80MnGZRfwnHQOx1HmbqheA1nytoXXr/0Qar7mnLgi2c1TlYcaXtLZTSSCXUK09xk1nXbOU00Gl
 EHwKDUEJv1RI/GWzigbCr3obfR/faaALa8tiClmg2PA==
X-Gm-Gg: ATEYQzxQ411ibI4cgv35o23pEltM1/9nSdfLws7b0NSDMjEvkPkvvZ1WkqJwXXQIZN9
 Ke4kdW2eqsOOHPl1K1EDx/+gU9AUUtRmXPvky89ySnusCn7KK4vmpA0fy/R+liHQz78v/hLWfb3
 JrpaMMsfPK/iOpqQ24kWnZCliwKdqh3kjoUEI2HHkWVW7jcB7ezDXPA83zAjVzoOTKCLokTAY55
 sZwB34Vea5VJ0nqmUo2YmGqxJqxu16TLh4EI1kgEmfpbxLVUuQSDvYyvyBH/BWqkhV2IpF6nvkp
 s6Kk9Zb123bAD2XzLJj35HtYn9xhXLZF9qcxdkDT4azM/Rqw2vlgaJuEodvYZLYydeM=
X-Received: by 2002:a05:690c:c4fa:b0:79a:b6f8:f9da with SMTP id
 00721157ae682-79ab6f8ff0emr27197837b3.58.1774266724698; Mon, 23 Mar 2026
 04:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774099044.git.dingtao0430@163.com>
 <6ade608e668d8fb9e720639333a48120bb814d41.1774099044.git.dingtao0430@163.com>
In-Reply-To: <6ade608e668d8fb9e720639333a48120bb814d41.1774099044.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 11:51:52 +0000
X-Gm-Features: AaiRm51sc1JlAWm3v47rkt73sZ9qd25ionVXSgcqxr5vhnq7jKHRQgyV_7tKF2U
Message-ID: <CAFEAcA97JFytdf1ZZfoMX-Rt92kfOgq304WahUWD2tQY6WsW+w@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] PL080 add transfer memory and peripheral
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Sat, 21 Mar 2026 at 15:47, Tao Ding <dingtao0430@163.com> wrote:
>
> On the interface, 0~15 represents single request, 16~31 represents burst request.
> Access peripheral data based on the validity of the request. For the convenience,
> we only respond to single requests. The number of data read from the source and written
> to the destination is always equal, with a value of max(swidth, dwidth).
>
> Due to the lack of data preparation by the peripheral, it is necessary to cache data separately
> for each channel until the peripheral is ready for processing.
>
> The width of peripherals perhaps not possible to process all data at once,
> so continuous processing is required. Read from source is achieved through "continue",
> while writing to destination is achieved through "goto".

This has tangled up the original bugs we were trying to fix
(that we weren't handling the "last transfer is short" case,
and we weren't decrementing the transfer size register by the
right amount) with the DMA transfer code.

Can you start the patch series with the bug fixes, and then
if you want the DMA transfer implementation do that second,
please?

thanks
-- PMM

