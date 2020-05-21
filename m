Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1767330lfb;
        Thu, 21 May 2020 10:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJQAmGLP1FBCs7XqpL9TWehCt+LqOxa7/ARI8wK06m0UN7uVnluCTsI4poeGozxG4vwIVi
X-Received: by 2002:a25:ba8b:: with SMTP id s11mr15640815ybg.310.1590081647108;
        Thu, 21 May 2020 10:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590081647; cv=none;
        d=google.com; s=arc-20160816;
        b=XsjZQ/31ksuJV9kRuJZCDnl+EPQUL1ugK10FA7tGoDn4dSyJbJqUXL6F/obpIFZneW
         TEphh1HEEEAs7rwdNVZ4yP61+mAuVuuFZdBjDNh6pmp3YJpENN/vfrMpcrDJqkucwgg4
         vIak3cETBgiXoKbyX5+K9xxA/O5gwzBp5NE70xdUWZQFlyrGWyEtvt951a3iLRPDoNVe
         pKVVYxc4NeaYfmCdtCxdo3ISuN+1IwDsCS0HAj6KPHcgiKXvdHMjchkoU8rtmRzIAGpi
         BWg1HznncNcm+3z7wawlpJor6b5IEjzXr/8ZPxCDTorM5rFjX4famsRmX4hnWEEtpTSJ
         TcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVvQ4BnC7G1Cm6dall93+lmFqFNZBQ6yoJcC7Zbwr9s=;
        b=iRbGhUrpV+5oNM8JrLAsxCrHoTIj11pAajrVdRrkPDd3cdxtGRtlOqt1urwn/vgabp
         I3SMzkfrN95eFsznmGX1PMDwHDDQnyS/X3+qgOeB19b/2Q8VnNw8ngQTcCzo5Yk3RlC0
         0PFAXnkcLIIDODQKy7NypaSYiXQlO/qEsR5NPe6C4bgtL501S1pHNH693x+3dIz0Rspa
         wrCyxOdV47RO2BkUS5ShJxLC3oDsDpFXV5U+z2hhZ1opvfcGNTsdgkzSvAxU9PRA+6Ka
         KzjwnF69gAs0TK3A2wUMXfkCR6NpWzQiAWo5kJ65kuu6QHNg+Tj0Obcax7Ni5Fvr3mQx
         umhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0FtSt16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b132si1556751ybg.314.2020.05.21.10.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 10:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0FtSt16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbosA-0005JO-CV
	for alex.bennee@linaro.org; Thu, 21 May 2020 13:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboch-00030O-DK
 for qemu-arm@nongnu.org; Thu, 21 May 2020 13:04:47 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbocg-0002YJ-2j
 for qemu-arm@nongnu.org; Thu, 21 May 2020 13:04:47 -0400
Received: by mail-oi1-x243.google.com with SMTP id s198so6813980oie.6
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVvQ4BnC7G1Cm6dall93+lmFqFNZBQ6yoJcC7Zbwr9s=;
 b=M0FtSt16hrFEPgUdCTy68KJLezgkuLQTTwU5Y93/VSYIMXN2l9Q+WL8IrNswX/NQjD
 fYtm8awR4R5FEgSQtbYGXrnUkqSwu+0EHmFevRwg0Q9Dz7+QD5Wcmmv1DeyfEp4kXiwy
 p9K2uALB+4EaYYI8WjJI9nHuOR33vy27HABY1MfrRyMehtGXzMd5JBJPRn7VTh5I+YEw
 xa2ABFFg/mUxZyffs7ou4g+y4ot17gmYDx5NbLCuAmFg3Vh7n777SB+SuHCCRT9nq30K
 Fs6cJxM3h2NacmzHJtjZ83vwpuztjoe1kzPSWbjASbvNMp93zy9ANeKU9SPYZ0bIo2jb
 +ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVvQ4BnC7G1Cm6dall93+lmFqFNZBQ6yoJcC7Zbwr9s=;
 b=JfImSJokAgDa56zbAybObwlVLmvjgP6KWdBkEWO1ga8fj8nZ3nS4JZn6BQNvURe0QD
 yxCPxWQdV9Z3YjFqgeYqarcbRT85q67b0R/GFW7KKrsSrBMEP5BZItUH5bjPHRXy/3Cv
 3gycU+0YFVMZxj7cFAfMHTAdXaqptZizKu+HWREZzvL9jAarldVzHzD1Jaq4dOE2FKv5
 ShAt4OXi+ijxGG/GOivUszrBlhE5/XALMwx7yJc8ME5IAfcCQFaTPHv+4pTF5fd5YRtG
 9qYr6ygOydIrIv5qyiOO/AhSHiLI9n+6psP5dmrBp4q5/erxKjhMfEe8C8agtq8Z9lMb
 H6SA==
X-Gm-Message-State: AOAM5300p/GRQ70W1QEsdT9JIH3sz4gFzS0mfc02r9EGrdjw8VRh8lcQ
 /5QGzDeMfcMfA0NJFJCRc6fj59DCybtFNyxEWiP4FvoT
X-Received: by 2002:aca:eb96:: with SMTP id j144mr6872783oih.48.1590080684653; 
 Thu, 21 May 2020 10:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200518142801.20503-1-peter.maydell@linaro.org>
In-Reply-To: <20200518142801.20503-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 18:04:33 +0100
Message-ID: <CAFEAcA8TDGUX-3x6Ha9skH8rO7mWEXzrDPYvqe=e2+yTiOQ1eA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Allow user-mode code to write CPSR.E via
 MSR
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Amanieu d'Antras <amanieu@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0JUPe1bswfYV

On Mon, 18 May 2020 at 15:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Using the MSR instruction to write to CPSR.E is deprecated, but it is
> required to work from any mode including unprivileged code.  We were
> incorrectly forbidding usermode code from writing it because
> CPSR_USER did not include the CPSR_E bit.
>
> We use CPSR_USER in only three places:
>  * as the mask of what to allow userspace MSR to write to CPSR
>  * when deciding what bits a linux-user signal-return should be
>    able to write from the sigcontext structure
>  * in target_user_copy_regs() when we set up the initial
>    registers for the linux-user process
>
> In the first two cases not being able to update CPSR.E is a bug, and
> in the third case it doesn't matter because CPSR.E is always 0 there.
> So we can fix both bugs by adding CPSR_E to CPSR_USER.
>
> Because the cpsr_write() in restore_sigcontext() is now changing
> a CPSR bit which is cached in hflags, we need to add an
> arm_rebuild_hflags() call there; the callsite in
> target_user_copy_regs() was already rebuilding hflags for other
> reasons.
>
> (The recommended way to change CPSR.E is to use the 'SETEND'
> instruction, which we do correctly allow from usermode code.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
