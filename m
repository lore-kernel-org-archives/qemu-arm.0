Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7320141wrw;
        Thu, 15 Nov 2018 10:02:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5fg2PbFMbft4RUMmpDjLTX+Yiz7+I143lpcL3X5KvC2sMXtbLBCVhB3MC3xhZBdLF6HhgVA
X-Received: by 2002:a0c:e091:: with SMTP id l17mr7137126qvk.144.1542304946440;
        Thu, 15 Nov 2018 10:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542304946; cv=none;
        d=google.com; s=arc-20160816;
        b=zskVpFzOmtME8tGQK/moE4uaE2MDtD+sKma5D+wd8uNyFI8zfm9oA10NFHpewbOyza
         s3aHJwNtBWbMA1MkJ97U22rfHjlCc825pGcE2+84Fo/bCv588zlDdb9QVoLhu6p0ISkx
         fONNltTDFnWr0RTCPwxFvMmj1gprZFXL5RIB5rpOIuiaPt8vyQopOpmET6rbowcntJj7
         wsMsh8BHZFfMpv9PAREk57+kac2wOjGKDlngCEeRaFS79U0MlwDx0QAHY3UmNWrXnxk0
         sThGwW1eMb5U4u08ckZAdkXJv/UVQJiHLYx379jHdel4+PweCaR4OmBqIxCGJmu1dK2x
         2N9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=dXuYs3rcYZEBWX2a80LBtek6SfVywFbhLJJLFsoRots=;
        b=r69FO6y+N5tGi+9I0CPVd0xLWpstOKHjnpY9SlamZP/Jg7ljx4N3/CDuVE7d8aDAWO
         wn3x4AWXEaqFPJC2Uu+PUuAPxEhuLLkWgF3wbLAj1lQ0njMxTRvwB35xyTmGgDY1jEDG
         IhHC9kc8FVKxYh926LnATwvoNrelLNx5AkbWEBywxI5BY6/4rteJGXGTvMPpAaiKaPhQ
         /f3CXvn5dJepTSvq/fjoY4N++9UTQkeqM9hDYfZysA04QF9q9geRg+vbU2JW/vccRxQ2
         dWw2FXQk2DoqHdjnWCt7nfknxVNavbDWczTsAUTOLX9sFGbtZcwxTb92+DITC2pknr8n
         jfoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YdjWh7S4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p190si2231083qke.19.2018.11.15.10.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 10:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YdjWh7S4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNLyD-0006Um-Vt
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 13:02:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLxT-0006TF-44
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 13:01:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLxJ-0001A6-JY
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 13:01:33 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNLxH-0000Yc-J5
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 13:01:28 -0500
Received: by mail-oi1-x241.google.com with SMTP id p82-v6so17468051oih.11
	for <qemu-devel@nongnu.org>; Thu, 15 Nov 2018 10:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dXuYs3rcYZEBWX2a80LBtek6SfVywFbhLJJLFsoRots=;
	b=YdjWh7S49HLdoaAAeUBA7YFbPaF2dXB47zucHXC1VSK6M920blGeRCfx/uF2Izs6uU
	6p/48qh+sQhu6aUERcNxqEScEEcCQPkBwqfMmoKjRBAh5CO/hdFUk2wCs3fsZtpC/lwx
	45U8NcC0U+7KG922ONodV5C0rYrAQayKXfHL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dXuYs3rcYZEBWX2a80LBtek6SfVywFbhLJJLFsoRots=;
	b=QpYHGlml+dqjYdIoVDoTgobJSUiIDfhzoRItfWc0cRoVfD14Cnr6lPBYSPEAUq9Uce
	Mj8SAdM6M4PNhBeeWD8AU6DBh2m0pQg55t2i9D9wHTrP8ZS++FyoSU201+nO3jX94Vnd
	rSw4WMumTEbeFEx0+5sVxP+Smm8+YCy9W0WusM2Zd7bVnHS979s6RhQVeBGQO/Egnsc4
	FQkBfXnysYS2xOUH2DJO1h+0YMoU1XGpzSPtRcr0jyQBPZH96qT8AhfTXyTByyjUZ42c
	97YHjL/nfb38VCVBnliRe8seREns75wgQ6geR5TidDjNexZ8h1BnQfLTn2UF9XbuKRwe
	zrEA==
X-Gm-Message-State: AGRZ1gKALiWbmxpyPzW4jBGRhj88nmjT3FBjcWkk1vK+Od69ZP1I587k
	gM3t2T8osaemyMGUxv0PsMZpyq9QEA4yO8Tv93TPVQ==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr4335255oii.337.1542304879812; 
	Thu, 15 Nov 2018 10:01:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 10:00:59
	-0800 (PST)
In-Reply-To: <20181102134112.26370-5-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 18:00:59 +0000
Message-ID: <CAFEAcA9RU_FssW4yA+=8rVVVatRPgOct+S1zUwj9TT6v7bsF9g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for-4.0 4/4] target/arm: Implement the
 ARMv8.2-AA32HPD extension
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9NojQnNdJww+

On 2 November 2018 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The bulk of the work here, beyond base HPD, is defining the TTBCR2 register.
> In addition we must check TTBCR.T2E, which is not present (RES0) for AArch64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  8 ++++++++
>  target/arm/cpu.c    |  4 ++++
>  target/arm/helper.c | 37 +++++++++++++++++++++++++++++--------
>  3 files changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f12a6afddc..a253cdebde 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1517,6 +1517,14 @@ FIELD(ID_ISAR6, FHM, 8, 4)
>  FIELD(ID_ISAR6, SB, 12, 4)
>  FIELD(ID_ISAR6, SPECRES, 16, 4)
>
> +FIELD(ID_MMFR4, SPECSEI, 0, 4)
> +FIELD(ID_MMFR4, AC2, 4, 4)
> +FIELD(ID_MMFR4, XNX, 8, 4)
> +FIELD(ID_MMFR4, CNP, 12, 4)
> +FIELD(ID_MMFR4, HPDS, 16, 4)
> +FIELD(ID_MMFR4, LSM, 20, 4)
> +FIELD(ID_MMFR4, CCIDX, 24, 4)

Why all caps for SpecSEI in this register, but honouring the
capitalization from the spec in the equivalent ID register
added in patch 1? ("FIELD(ID_AA64MMFR1, SpecSEI, 24, 4)")
I don't mind which, but we should pick a convention and stick
to it.

thanks
-- PMM
