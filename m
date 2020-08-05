Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp775685lfy;
        Wed, 5 Aug 2020 09:32:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy724pe8ak0nMmEoWG4fwCBC+1xp6LBRhrAHIZcTfZh1IThbeycSaAZYovG5EYxI5cK7LPy
X-Received: by 2002:a25:c345:: with SMTP id t66mr6246024ybf.218.1596645172965;
        Wed, 05 Aug 2020 09:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596645172; cv=none;
        d=google.com; s=arc-20160816;
        b=Hxnf46e4m7tkiHwxj7NtnySOFgsQC5UJdg2MIFdQ5vELMyQzqS8lFyNB70r/JfeezN
         vYyYXLUIRVgZZCM5+YDEp1UeUr+8iNCxeHVP0bcaTmPvHQeASovVY7NTE9N2KPMjEgAn
         E7w48XHUYF8uPvUS5FmtbL77wd+w5Bk2++FEgpB+UmuYrf4cdf2vGXDo8GU9BQXnp+3m
         Z4stLqSXf3HDgF7PkeiMvCZS/MY7S7HJ6Nm4hbghTChpH3EfJszPdtn+kwDbpki9Ivp3
         92VeFYlxkhLHAKr9qYE75dmwXXvR/RkLVzFHA2tOVmVV1k2416EDFq8HjqvzrA+V8FXy
         majQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsQxH89XzZQOtnF97UVCoY2SF9sHY7PsuDgF0KNX6xc=;
        b=l6xy7xVyJh74G+3GJpda+FeBjZ1eCbxnvs60H37yAC3DlLnfmBP5cNASz7SOBfpTWE
         5dbpiTtjdvJ20d6f716rY+BTNgoTS/OHXS0/5Gsxl1v0JkbQU+54nqSIox3axw1MNDl1
         1GgMwcLKLQfHfb2ev5gxeGN5muQZTdH2JnY73NsvZFWWZm86OlKcH8OGwq1ELSIb/UE9
         sLZhb9UfrmQZ7sy2LqMuBLu9TZXxOAxY2s9WjHxn6PVJU8qRceSbMfnWNlU9igmYSzHx
         lq5wACfIrJOOs6U3AAhr36Si5P6RlhxnikWnxWb/Pv4G9lh/g9crC8f/2SH8imWD2lHD
         QQPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZRNgneoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19si2594884ybi.349.2020.08.05.09.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 09:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZRNgneoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3MLU-0000tP-D0
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 12:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3MLL-0000t9-12
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 12:32:43 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3MLJ-0002aJ-6M
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 12:32:42 -0400
Received: by mail-ot1-x344.google.com with SMTP id z18so13340100otk.6
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2020 09:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wsQxH89XzZQOtnF97UVCoY2SF9sHY7PsuDgF0KNX6xc=;
 b=ZRNgneoKd3dPzxRqHd8Ygn8wZghci/+w9SYcENWHOQ9cX0yyvFBUto9APG/WOuTIn3
 zeUm6kFS6q0kyMUCYTSs3d90GerMzVTKABwmwzFqy0X0WUN5ed5kXfQYZklcMuX8Bx/K
 FBFsjeCJeM9zPRW6AeTA2Ha4a8frTBxIbPgozgbT5eo6xONgwTZ8v0zS/fckomsKbKHr
 2fClisuQok4qbXrGc0HRzjiFfDM8LcsuFiCUULI+0FS6/I+qJuaTf4xoS0RN8vkuBIb8
 tu4fkhjbcuESS1Gyzw1hvD2kF1ayq+JddmuB78ZTtKlfufy0a9A69jcNDCDXd45lxntM
 C3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wsQxH89XzZQOtnF97UVCoY2SF9sHY7PsuDgF0KNX6xc=;
 b=KwIX59Kzoxn8NBQ+qwzvjSqw1XVmMD1sU3n+QWCPvNZCTeYOcehUs6n80idp/JLrEq
 RN6x+7FKfCCUy1NfhGmbKnB/rlH9VsIOsjkjXddeEyJ06gB02loVwAhk1VpSK1bS3Gaw
 Q0JUm9t9ww+/puNWqsog98eWHpK0lKFsOJwjXj7xUG4UT595j68tAuzqgesLaTAilZsK
 x3jzsEb2owHd0KfOT0B6gqQmnUOArrGYdtDqcw7iJ+eX6rAPNaiE32eGJYvH98MdPhOd
 tNF9THRW143a6KnJFRVUZprCszSXFRpsNh4LKWGXnzT5Uw1WvVtobJag0mklvCXd8w2N
 F2bw==
X-Gm-Message-State: AOAM531+ZrCexAEhyQeC68VnBaV6LzjG5cCcKpJJB9mf6sQUm5+TePkr
 7BRIFyTOuP1LtzLthKinkHY0VTrSzwZzj5quO5AhVQ==
X-Received: by 2002:a9d:5504:: with SMTP id l4mr3251509oth.221.1596645159741; 
 Wed, 05 Aug 2020 09:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200804193903.31240-1-peter.maydell@linaro.org>
 <e710d6bb-564d-88bb-aa60-894ddc1280c8@linaro.org>
In-Reply-To: <e710d6bb-564d-88bb-aa60-894ddc1280c8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 17:32:28 +0100
Message-ID: <CAFEAcA8bfQucS=0OJRCOvhZdef_d+TUJEyjgYHAx3A7sHMWhSQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-5.1?] target/arm: Fix Rt/Rt2 in ESR_ELx for copro
 traps from AArch32 to 64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Julien Freche <julien@bedrocksystems.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mcQDu4xvuzPT

On Wed, 5 Aug 2020 at 16:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/4/20 12:39 PM, Peter Maydell wrote:
> > When a coprocessor instruction in an  AArch32 guest traps to AArch32
> > Hyp mode, the syndrome register (HSR) includes Rt and Rt2 fields
> > which are simply copies of the Rt and Rt2 fields from the trapped
> > instruction.  However, if the instruction is trapped from AArch32 to
> > an AArch64 higher exception level, the Rt and Rt2 fields in the
> > syndrome register (ESR_ELx) must be the AArch64 view of the register.
> > This makes a difference if the AArch32 guest was in a mode other than
> > User or System and it was using r13 or r14, or if it was in FIQ mode
> > and using r8-r14.
> >
> > We don't know at translate time which AArch32 CPU mode we are in, so
> > we leave the values we generate in our prototype syndrome register
> > value at translate time as the raw Rt/Rt2 from the instruction, and
> > instead correct them to the AArch64 view when we find we need to take
> > an exception from AArch32 to AArch64 with one of these syndrome
> > values.
> >
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1879587
> > Reported-by: Julien Freche <julien@bedrocksystems.com>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; applied to master for 5.1.

-- PMM
