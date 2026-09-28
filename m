Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B5FCA5FA5
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:21:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDAf-00082j-Jd; Mon, 28 Sep 2026 11:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDAd-00082J-0r
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:21:35 -0400
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDAa-0002aW-Og
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:21:34 -0400
Received: by mail-yx2-x0f.google.com with SMTP id
 00721157ae682-85d43ac8d1eso27237507b3.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608891; cv=none;
 d=google.com; s=arc-20260327;
 b=ZTkDDmyM21etUTpHsDwX8nAT6EsOSRoAjUSklBtlbVoX8X/K6NoMMqNTYPzVxduTbt
 sKs8mkWkZyWaA5m9QfDJpIRQpRpMi34HJ1ACx7VzHJ64JPiCSy8Xtn8ms5GTD70PO1Jh
 UBBia35cyY83Q4SXff2/IYz1m8tVsGAgffLj8d3E5qbjQY4DkJkCMnY0bwy7vWw3lAL0
 jXnmea3YP+PnqEmelbRsFUsycgHqjQx98agQ4yeglxR+yKhJFUeOxkej/h2SBSrdtErJ
 m7lu6RaEjGiH17uqTshErP17baDXWIyXOm/QkZapilt7w7HoddFpRm48xa0XBe0mecAu
 k5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4tIooPjFmR1kgez8sCGC0GwupWizrxuv8RiaCahKBK0=;
 fh=qkv53MI6U8yK9e3hoDG1TVdldYMnEPmVgdmOlrG4t6U=;
 b=XluILrkioM9EOSqWVNMd3Wvc7fgf5aMzDlUleDbb6UV4ybBXihzTHZAZ98G38JcI6I
 fGMptnS2N1NFyYZJCW+2yJMg01RhFzjDNgL3AqKjnQEA0UA6KRZzBTSLH6Q0VukWcNG+
 rF2JJS2Z76asnsr0HoNO3QONzh+FUKoJuCKa+/VFOADUhHRfpygkVPPPuDWnH7kGDglv
 CW30IBK6dhqxBa+HfvZfH2j2XXHi/5aekdtnj6h2BqfTaEJEu6K2WOX9Cvg3ifDpjplp
 8U4rWVmmP+f/zpFxSzGnDjvnVCct8UXzOrZDiXrFx74PDSfnjuFihvcByF/OI8lQlTY5
 iEqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790608891; x=1791213691; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4tIooPjFmR1kgez8sCGC0GwupWizrxuv8RiaCahKBK0=;
 b=YgF6vg4YEHDSNPlP9wgU538lJvNXMyXbbCs27WYsfTpOofiZ0eW/EKUKm/0QKeI5ec
 fREKrZZ6INoDWE3Gp3KBzvI+Lwg9NdNFBfXdpYWST3sJaZLoHriITRWIj04N0e4xG27e
 pU+FPXu+6OwcKT7rtaCuqUkE/CfvfHcmKRtcws8Q0i3xKEeWWfwdvRWvoxt7EzUHjIqf
 11Lt7VuNdAjKNg7VGmeQvl6uXuVFTgyP7kCi8r0wxWSxI/em38jO4toYjpwMCvnSgaDP
 xLkWXNXPdP3JvhjDVFACqdVXZ6TzEf0vVXLA4ctbrrk3MJB3FMbltw0LrseI8SpYAS9A
 H42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790608891; x=1791213691;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4tIooPjFmR1kgez8sCGC0GwupWizrxuv8RiaCahKBK0=;
 b=RgwAt5q+j5fnpLzGN350P0fnuVKFcEyLZJab7JVihIoW7sPvkV9IAeYLeInoULZvBX
 9yOE73251hCObTjtZN8jS2OGGpAEWQcH1d+3f3TXTZNCiy66WwOnJeLZVNpBKbnSv9fi
 PeW+FqQE8lMlfHO6q/aFArI9JrZHR8+TnW4+qXlV7wl+B8pVaZxyIHyjwUQKkiIFd0Zw
 PbYmOKAY4+vo5YO5FnR2aMB5+56ZJRmgJNciQaN/RL55lIRKUYcYzGI4ciCTQmIp3YtO
 LsPgvlga9XJUqDOWmxf446utp6sNHpWfK5bofnHXAolNMNC7N8MbQISh4dPy09mbd8Tn
 2CWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzYIAcgElfObM4cN5ZWKxldr0d3IdHaXb/8wFwEHR7RQ3LIeUDlT5azO2g/VNBait3VlcZbonjX7Q==@nongnu.org
X-Gm-Message-State: AFuF++l66maVZg34NAVEX0teH1918XqKymEi22wMwcsF3Qd2YlbouwwU
 O71Cb4IhA2CtF0mRZQvUEds63/cf9ylm26Omq1+PzR9RuL2XvxVVM8hAUxxTs8VZXmWwcD3eEbJ
 rP8zJpxKqx0puBupTkDzxmfT6VXLPAUOkVG6re/eBlw==
X-Gm-Gg: AYBFou3YAA3jhw664uWss3sWFNsTTKknZBqMIii0MPshwC9n/xzznXMh/KccRujqI76
 yw+fSQ7xw+arx9FWz/GtTQ2lJebk8/5RPDmHohFVtzHxoCQgVFhSVnDCmzyTxPm7VgnOGGopLtY
 +8719UigIHy14fABRcgzAiqxk4zwOKoRE0qOGj112GJfwsN4VGCGNwn2VQq1ytxxTE0CRqtLwCw
 ab3DbCQw20E1ZlTc8Pm30n6TUsR5Xogf9Errt1/b8vKE50ltZCu8LERwWVoyU0SVpTnXAJA5rjl
 sozVlUhgzQDRoBfbqVDFKAViyhpA3Xgfv+rgGzRwgAiB6BKwUsihhqEzx0JVkW0PcLMIXymoZuf
 ZYCvGpAuPkmRpepOPMBRvtKrkGcynjc0ziUMcMlY=
X-Received: by 2002:a05:690e:4084:b0:671:1208:d6d9 with SMTP id
 956f58d0204a3-672ed0194ccmr6035271d50.21.1790608891194; Mon, 28 Sep 2026
 08:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260925234136.1182108-1-jeff@borto.fr>
In-Reply-To: <20260925234136.1182108-1-jeff@borto.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 16:21:19 +0100
X-Gm-Features: AclHuK-nCZhwdanwtFZLe0QudTxugsEdJ1UHoHv7UkKM8rrLNZkuiDZEh-aQ2Eg
Message-ID: <CAFEAcA9jtwi6=YSw6xQrton8zub=bJuzrrv_N7wY0qq_455Q-w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix PMSAv8 shareability decode for R-profile
 MPU regions
To: Jean-Francois Bortolotti <jeff@borto.fr>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0f.google.com
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

On Sat, 26 Sept 2026 at 00:42, Jean-Francois Bortolotti <jeff@borto.fr> wrote:
>
> In Armv8-R AArch32 the shareability field of an MPU region lives in
> PRBAR, not PRLAR:
>
>   PRBAR: [31:6] BASE  [5] RES0  [4:3] SH  [2:1] AP  [0] XN
>   PRLAR: [31:6] LIMIT [5:4] RES0  [3:1] AttrIndx  [0] EN
>
> (Arm Cortex-R52 TRM 100026_0103_00_en: Tables 3-80 and 3-83 for
> HPRBAR/HPRLAR, Tables 3-124 and 3-127 for PRBAR/PRLAR.)
>
> Without this fix, address translation instructions like ATS1HR
> will return wrong value for PAR.SH.
>
> Signed-off-by: Jean-Francois Bortolotti <jeff@borto.fr>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Yep, this is clearly wrong, maybe a cut-and-paste mistake, since
we just pulled bits [3:1] out of matched_rlar for attrindx.

Applied to target-arm.next, thanks (and added a cc:stable tag).

(I did wonder about v8M, but this whole block is not-M-profile;
the register layout for RLAR and RBAR is the same, we just don't
bother to fish out the SH and attr info since there's nowhere
that M-profile needs to report it.)

-- PMM

