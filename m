Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp480260lfq;
        Thu, 7 Jan 2021 09:36:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVklKhZPLzCZRQQs21+7yV7m7a/FHPGNuW5mNH0dpbm7P1cdrf8FdalU93m0I5eG8XpWZ0
X-Received: by 2002:a5b:148:: with SMTP id c8mr14836674ybp.45.1610040975064;
        Thu, 07 Jan 2021 09:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610040975; cv=none;
        d=google.com; s=arc-20160816;
        b=vrtgbUQJuj7QS+R/DWrK0O7Nny87PiJeACDPUF2MUe8vEfm3O7u0zYBzT0KXDNcff4
         +yC9A+SqbB150u0yGBD6x3e1ef77ZRPKsoxjRwvnr2WTUEtXGWxkddz4LXRDy7F8dSjA
         XCmP5EJXGQrppVN8Zz87AMqU/OZdqw8cLmJHmzN5VV6bLiGg0acyjj+fpLe/pCoTAcbr
         T640WLScnqxLwRlUAbbgJtxC9jM9F9xtr4oEfl1A//VvipKWZHixcYpfhUwEAjB9QTJ/
         mgUeEDP0DqBoSDa1DwmmjrHy4PdeO+XAI2NLdzbeDfRrjtidNtgfx+gq2wrAnNy37f0b
         5oQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xxA0RceEX7B6Y0wkp7hOU2XVUKZhAf9ydhuV9MK9370=;
        b=oWD/qpRHM9LDepOFg2cBQnvKDh2+OzvTCRkFtOpzeOIxrlWtSStxSnYGgxEqSeO2px
         3F8RhmsbnVRmKEe4oUq/C8BAm0JZsEF9HxR6vUY7b4plL6qzV1greNDGYNnF+34K1oaw
         fWCGpozYJKe8QVBj4G4ySTO3o1QfO9iEh7TzpUNRMOF1QI23aETMD80btTRhiJPChzVR
         gYwCrpKtrLQPStZxfBpRXx39ZMDZqCzLam+6tYsrTHM9dCzqpNJ4IfaWdl22nORZF0hM
         oHEFZ0KpxXe60h4Lh0OzfpycKv2VUovg+ithrLnH4weVSgEa0Cmt1V3ZsxWdMWDHNnHf
         VUwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HNs4AKl3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si6960515ybi.328.2021.01.07.09.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 09:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HNs4AKl3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxZCo-0000am-Ap
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 12:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ9o-0006cC-Bu
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:33:08 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ9k-0000XC-9d
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:33:08 -0500
Received: by mail-ej1-x633.google.com with SMTP id x16so10787605ejj.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxA0RceEX7B6Y0wkp7hOU2XVUKZhAf9ydhuV9MK9370=;
 b=HNs4AKl3r+8mqJKrrSjQzNhwscPz+K5oNgcXCUVM9eBJeif0IzNN3aqVbO6ieGbJDe
 zkaOm3DhOoj8gmbyHb0dqAEViEuS3JNBT9lx0MYRMQF7yOYS5g318hLHIJtz/ONHBLR6
 zZVx53GG91BQCyNOM7Edm6c/F0UKne7MYX5s2x4xIE3CP0z9dDDY0BUtlYgW6x2AmbVD
 weFEFwjpLRxt9sdA91Lv1F53MMmAVbu5Y0UeJCXYkbDohQ/icVU3vIgBhyXuudEYB83s
 U61M/9/+LPV0wHWT0ir8nmo3EnpsnFt7UjgaGGypMqnoBBmCV2gYdNT1qKdyIfSLEjMI
 diOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxA0RceEX7B6Y0wkp7hOU2XVUKZhAf9ydhuV9MK9370=;
 b=t+mFI4MW67t217smmmrW6RMpR/yG0bgZkmOyxcYu57ZYGuswfMEulu8/hfJ+YE0FQ6
 1B/kou9ydIFfnxNjmOkWiK80J4Egb5zmOTg5464963dRDhHbSrCrPCto2fvugs/93L2Y
 5n3QmLE6+iM5635gipkH8nusk6GFloo6j6inb+/Dzl3S+HJIyuopBzgVMxyVemVw3EIK
 /kaqRygsYRzDyshOhzZ1IUHnpVmLEN2qmqyMBV+eR4duBSqeJC9gyX1P2K6XyxyNpFcf
 nPU1ORTiEQ60VDKCR0VKhnZ9GyokUo9lRkY+iwmSLOJfuLN6aI1WTv2tGtMcPnr9622C
 vZhw==
X-Gm-Message-State: AOAM531p/GZtnTa/v3e1wrPzEtOlTZnGmt3Jt0eVj/GGgjH90jZ+fBeS
 WIgSP8dvFMmVNQWpJpxmODon/hhis+Iu7CbjhMev50aVooA=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6985796ejf.407.1610040783111; 
 Thu, 07 Jan 2021 09:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-21-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:32:51 +0000
Message-ID: <CAFEAcA_r6=vF+mvEdCS=w+3hoheoDOeSwio7cbHQ12LHuz9DKA@mail.gmail.com>
Subject: Re: [PATCH v2 20/24] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FRpbwUwQwj+n

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
