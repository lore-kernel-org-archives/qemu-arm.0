Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2560242lfg;
        Mon, 2 Mar 2020 07:23:21 -0800 (PST)
X-Google-Smtp-Source: ADFU+vugFfRj1V8AQxsJ1M9NSH52S0SrvEUxUV6XpMjJTlqhtgGsWZxsjUPnqlFTgVsUGKg1b/mW
X-Received: by 2002:ac8:6f02:: with SMTP id g2mr261100qtv.52.1583162601375;
        Mon, 02 Mar 2020 07:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583162601; cv=none;
        d=google.com; s=arc-20160816;
        b=G9gmf49Vjf4uhzUkLQgIi2fuuTzE3VGiMFctwGdBjcB7syBk2G9zzDCeDKjbNDrvhG
         fzEcJPyBIW9Y+DlWZQar3mgwsjtW7S+GRrqI+2q2MMqyEyLa3p5vfskRaQ3NKZ5qrAJD
         QtHsxgPyGVU0BlVxT/4G5isz6gts5Ck/xfzee7kpTnsXauE2d5l0pFgiThaOTnniQMRW
         yscOdue8i4NEQVqYHUKMrgaACGhwUTGmNP/B2oNt+V2edIiVXBfwd5bhUc9NnQsXY5Iv
         eYKAnVqKH8lkGC2/Aurgej9kmX0AhIuoh33LH3BWBwJAtPnnQ50jV3PvMUo9Topgu3h6
         6kwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ar178Ow+M8KlrfAPmtxPZRxPSqC9pr2DuMH2dk+bRAk=;
        b=VseZqsECEL0TdiJ313/AzA0E5Ufusw0sSGmcPZg/kcjyNW8fEk9MnQwYtbMqYFkWI2
         yc1zAeyMTtQFuUj/zy+tgD0FlVUKgobpbxyf313AgkzvvOUiDuLZ+pYXoLMj0qAr92BJ
         +4iqP7si6g5k/cEjyWvLzuNG0w+3PL44/VEqueOqQ4yVYtzYlABmD5y6Tc1TkccRsgzM
         la+PqlCUTY9A2m6+tDa31zrP++Ti5U4eHabbfnZ5Lj3xoJrA1COhKLwYO3yCR+l2BOPh
         JV9STVqkiKpfSK9kBUu02Jzw0dWcdvPs3KaEuaFIELO+rAhJCH0p9bgr5AENWlBumjrL
         m23w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JvQ9vm5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si5134537qvn.157.2020.03.02.07.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 07:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JvQ9vm5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8mue-00013Q-Qc
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 10:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8muW-000135-61
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8muU-00014k-Vp
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:23:11 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46284)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8muU-00014W-Pa
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 10:23:10 -0500
Received: by mail-ot1-x342.google.com with SMTP id g96so10025104otb.13
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ar178Ow+M8KlrfAPmtxPZRxPSqC9pr2DuMH2dk+bRAk=;
 b=JvQ9vm5mGlLl6qYV3GJFvBe/CZpSYz4om4vmCQUeExiUqDmff18Bfb/KkrUt/H6sK4
 8nN7VLZ4TMS48+EdkoxakG0/PkrUyLQ0XosW6uEuk0jHpT5wRJTmQlQGCXrnd1Bo7uk5
 +Iacu6DoioUUCad/fHgeR5KIj3UGaaLtCENKnSHPV0GnFvlwkEJi/vG3+i0P8dh8cvfO
 4ZlqX2iRz5o9vWY6t4Z2sz5/4rX2c4rSctA/fi0mpKXCAes4RsUva0BDuAR5RCgzG+/A
 S1I/WjvQY5E0I3WBuBfqKrm0FGM7B3Fon6JNCRsi7sICLaWihfZ5yU/6HQupDqAfQKLQ
 +Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ar178Ow+M8KlrfAPmtxPZRxPSqC9pr2DuMH2dk+bRAk=;
 b=fJuvmitbnmOL/6QX+DAqnDbXMjHJRvi4TUmrdDrCKT50gyp4oPC992+41IovssuOuQ
 Ft2kRCsXFwE3Ez2QrSSjq0b8s9l0lS8d7XkijEbpe2vSCWE2A6kQe/+g325KvMgOLAzR
 1zinnJAWZioalQVpYna8ZMiR+xi9MctiDF3U2L3sBRCHGuR7CwUm8pFR0tMv9/hHLaiv
 /pparsKNCL/1l1ewXiLByc3o03esynU8AqgzvLOFfCG1c5rqZBGKBxkfZ6NFw0sqU9J0
 uxFNblVkMrk3b+3ZQaMU9KVhRYWHCcYgzo+ztbk+NmXPEmCJcRZO3prSi3PLSG0zbIDA
 GcnA==
X-Gm-Message-State: ANhLgQ2ajwEzEhGbx9gIYBz8aNYv43kbkIdxTwp5GOIffBnb1zFFM1UH
 JI8R0NLNgNwqTpZFugm4M6xd8wwTQE7GCX3RfUqtJg==
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr5316509otq.91.1583162589997;
 Mon, 02 Mar 2020 07:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20200229012811.24129-1-richard.henderson@linaro.org>
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 15:22:59 +0000
Message-ID: <CAFEAcA9nk7T34TGLiiET-nVNOOzCZYsO1VU-zm25XMvifpavoA@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] target/arm: Honor more HCR_EL2 traps
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NzuqUpg9/kzm

On Sat, 29 Feb 2020 at 01:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Patch 1 was broken for aa32.  Not just the masking vs the "other"
>     32-bit register that Peter noticed, but more explicitly in that
>     "ri" was dereferenced as NULL -- hcr_write{high,low} did not pass
>     along the structure.  Oops.
>
>     Break out a new helper that is passed a starting mask, which is
>     used to preserve bits from the "other" 32-bit register.
>
>     Check the aa64 isar registers only if aarch64 is enabled.
>
>   * Add HCR bits from armv8.6.
>   * Remove EL2 & EL3 from user-only.
>
>   * Mask hcr_el2 bits that are res0 in aa32.
>     This didn't work at first because we weren't configuring SCR_RW
>     for user-only, so aarch64-linux-user thought EL2 was aa32, which
>     disabled pauth.  Rather than find other corner cases like this,
>     I think it makes more sense for user-only to only contend with EL1.
>
> Patches 1-5, 12 require review.

Applied to target-arm.next, thanks.

-- PMM
