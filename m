Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp392196lfk;
        Fri, 22 Apr 2022 05:04:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3sDYZj7kErZCIIs6PIoiZp90Y03r+2nfxITq9bz/e7+nBR8NBgrrLQfmZRCf6kijh4tHz
X-Received: by 2002:a05:6214:501b:b0:446:480f:17f9 with SMTP id jo27-20020a056214501b00b00446480f17f9mr3026830qvb.111.1650629075500;
        Fri, 22 Apr 2022 05:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650629075; cv=none;
        d=google.com; s=arc-20160816;
        b=HB1bgVG1WoOLi0mY1NZTaqUJe1PgXxEXk1hSqse7UKVS45jXZZlDJ5LA2QgU1KBIcC
         5fKfwBboYZzuAhjL7flbLdEYuunnC5QbzwcoRlpo6oQtNZpXMXZcnLNP7J3ah/vpmWzd
         sJN2+LGZ99npKsbz5/KKDoZEmYRjcdEBOwhMcAL/ZbEbKd/m6iSAlJpk60XXXADgAisx
         i/w2WEF7Djf9jSo1QKK6FEoOZ8Zc5Sfr4pVIowsW3QBblYFc9yRIHlSKx9bVB5I0Tqiz
         LvbqWrYQAUdkeCsY9JEUdo+aZbaVGfLooJwQBbl2Cca55usVskVQGPlLrNJH29TP3oio
         ffmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4LC+Zz99JMG5l1jU+lb1vsE/ayQU3XqxIVGwQz6wcJk=;
        b=AWg0GDHBIG0SIk7+kpMWU9qJCiWKZE4H0gQJ27udhRFQQT2Bffl47n7BUS7HFte6Vd
         S2l8UTrMeN8NIGDdvetP6xPgyoXx3vcQmKjH4zED5UPch2ibYDZIMtk8cXKOg3O/8OuV
         /eag02PiL3Wqr2KZSDk6rL5jm2cLNNe9sbBpbNZ6uupncQhm2beZq2K2es+kEJ1Z25xz
         n03ssmlCSvjtxvO9ml+veq5Pg2zNntSK3etHBLUQB9nbyJ1bFkFQ+lKkSXFd1y+FgbPc
         VyZsUIBNJOE3ya+q+qQWrGWrBkWu0flbAJaPl2HFtwCi5R+Wsx2qe5eo0n65CBTGz4hA
         NsCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RIxssJXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac81249000000b002ed0be49c7dsi1936766qtj.649.2022.04.22.05.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 05:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RIxssJXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhs1W-0004yP-W1
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 08:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqz8-00042G-9b
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 06:57:58 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqz6-0002RW-Oz
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 06:57:57 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2eba37104a2so81738937b3.0
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4LC+Zz99JMG5l1jU+lb1vsE/ayQU3XqxIVGwQz6wcJk=;
 b=RIxssJXnm5xqRdRGVcQv25B+n9DmCSs+eDlRfcisP1znSdG8OqIygxyOQCbPjcBWUq
 UidS6yF9NLBrqFAfGl5Ca4GEDWK+pUrJ8Qk0apjoxpHI0bcdZRRF4/T4peXRMD8TjCdJ
 IR9zoE34CT6eRY585SyqIEsfAz2FTqc9WSecOHd9TgBarI0KvtXp9QWjP8pqve7BrOfU
 WdS2FzB4ubU0NxKAbFmv4T/9swi1GohbHYTBpaT1JIFA1cgqMdu0E42QBa7dO0eZ+j6f
 9/Rz451rO7vzqdmBwZvG5kU0NObZgAPAQHVVSSGHIKi/NkNcmv/FTuKI+ZdseG1Gyz+5
 vTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4LC+Zz99JMG5l1jU+lb1vsE/ayQU3XqxIVGwQz6wcJk=;
 b=upASMJDqi8pvYYYA9iV4IcUaWKu9mH40Sm1q8okmWMksLH4QJgLWUu3YQTYqXopexx
 ZEdaKQfaeYoZYzDgLxOlvtBLiKqPczMUzMHKiad2gf252ty0ss8JwwYoqZ7mVBr0gPnK
 xTFesBmfSh67bngzzNe74zEhQg4cd+JoBzjDwa/D4/pQPu+a4kN1GhBEgd+LfA6NmMxX
 6uIxTthjbSqmD7ba2XM1fzHzxTKxcsd/XxY7yvAuxe3+eDi2mLNa4EXTCY/GDVEKKQAf
 bFx4qPEprDtIA0nrBwbxziJLcm/Hh8dUG5d9Cf3MFeoXsQem4fDdyo5oYDJ2/iDfAjQj
 ukEw==
X-Gm-Message-State: AOAM531WSFaIieGQ6P7voMsjWUO5o/lO04LugLhbVxBmcopegO3CBHBX
 FTSarIb1aOX/q0w9FZfuiYVNODGJpqYIyoyLFwzaZw==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4036071ywj.329.1650625075840; Fri, 22
 Apr 2022 03:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-36-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:57:44 +0100
Message-ID: <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
Subject: Re: [PATCH v3 35/60] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fvP5fIey2fQd

On Sun, 17 Apr 2022 at 19:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> More gracefully handle cpregs when EL2 and/or EL3 are missing.
> If the reg is entirely inaccessible, do not register it at all.
> If the reg is for EL2, and EL3 is present but EL2 is not,
> squash to ARM_CP_CONST.

I don't think we should do this unconditionally. Just because
the architecture usually defines that an _EL2 register is
RES0 if EL2 is not present doesn't mean that it does so for
every register or that it guarantees that it will continue
to do so in future. (For instance I found ZCR_EL2 and TFSR_EL2
don't have that statement in their documentation, which might or
might not be an oversight.) You could add an ARM_CP_ flag for
"RES0 if no EL2" or something I guess?

thanks
-- PMM
