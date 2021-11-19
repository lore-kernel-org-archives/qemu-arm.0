Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2317717lfk;
        Fri, 19 Nov 2021 06:01:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAamghzi5XAAtz3x81s6mMf5CX9vIDVJodG5xAAN85FaiU+NHzA6b16BYdNs9cQBV6qheO
X-Received: by 2002:a05:651c:a0f:: with SMTP id k15mr26968254ljq.298.1637330474909;
        Fri, 19 Nov 2021 06:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637330474; cv=none;
        d=google.com; s=arc-20160816;
        b=H3pGaLLMkF7xBihJTU1T/cfm6OnyEQNPtfhv9k7vX1yTQwXjfne/WV8UGkz72B+elj
         Swawv6F+4C3e9H/nDNfuBhOtfgGTalgtXX49y5Ypic+892eZrRlt1LwLbFfw5sXF9uvr
         c8/2G4L4/6f+rpaZPe2NERq/l+tHrhy9jCatjUkhhvJDdLnnd+23x2LlQneXpLrYJP/b
         bpA8Sfsr/YWPD3KyQgGMS3pjSqaHFvfwPmF1Da3pF3BrhZJ6jW2GkuMtRH7Cukx0iehx
         k8PnhJOL5kkpjBhYOR9bIJoALawh50kGhureTdIaTHPm0v4OX0X+EGmsXIz+Ej/yERjo
         4riA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ab+zuzZ68LPrCqNyaFwoMRgx39ctk6/sbm1gto7HII=;
        b=t9+r6rOU5t0+Cv5gSvHfx9Cppyh3oL2kRKVOMfbn39V49LB3XOkdYBH2LAbMA7+ikC
         j1JCA4ugl9qjU8ukHDbtgreiAGW1bx2HPhu1Jn8wfHJosdjfklvivAeLlShBvdE+fqxN
         l/2umjdLFD3wV2MVlmTkqN6V8XFnGf4mS726aqS18svQLwJzzJ/0OrVmP2WfjOWz1H4j
         kAVI5yygEnZ6hUKZ76gVfzsyt4swekb4WA9WijJW+rRVfnfYP3xq/+1OPaxrmZez0r7F
         dNJQ4o6ns7btXB3ijen8YHMBhtLQB0LVS/Sbv47A/MVqh3HYUYXxSboEZDq6XbWKyfyW
         RrwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SO+LeBpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si7564407vsv.159.2021.11.19.06.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Nov 2021 06:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SO+LeBpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mo4S2-0002O6-7g
	for alex.bennee@linaro.org; Fri, 19 Nov 2021 09:01:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo4Gx-0007W6-Go
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 08:49:47 -0500
Received: from [2a00:1450:4864:20::134] (port=41947
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo4Gv-0000Ob-88
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 08:49:46 -0500
Received: by mail-lf1-x134.google.com with SMTP id z34so43793749lfu.8
 for <qemu-arm@nongnu.org>; Fri, 19 Nov 2021 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Ab+zuzZ68LPrCqNyaFwoMRgx39ctk6/sbm1gto7HII=;
 b=SO+LeBpgPEK5NCXJXs2gnDTabnAj+MiHeAZcIgQ/OBr7RXNGfL8g7YrH2d6JmFQw8Q
 Y2m88Txo3Wo0kJkNXrZE2OHv2C88PpnALLk+SQpqNsvPlRBCBo72OH3XGB4GuvH5B9FE
 TDCzCOI+WucPdtinKGdE9KX2uPvSwUXMgeJzejJyyfWXEtwu9Rtcj/EOdYvPd/M5C5Wt
 0gAzqDQb/xJtNQuOeYC6L2AlybQe9dPLorquaHg/LI2rCjX8PX9EtHobHWTx22jBxiTa
 03qKGtjZWhjHEk3TDiolir/gnfKrulaHKPNs2ePos7E61GM5WkcGOY1Il7vtt7ZkelbO
 +f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Ab+zuzZ68LPrCqNyaFwoMRgx39ctk6/sbm1gto7HII=;
 b=KnLrpNNxyUCs//1gHI7MzzsOfOi6fyPBBmAgwUGMk/6P8pIklJdjtkxolS6MYMxjdt
 mP2yhK7U7+DOlLLCYfFA/ZIFa8cxhM8jl3H5nIC2s4it5E2YhUnEFK8cxtHW9Zlkfx1i
 nCuagboCb53SWYlm7u42oGJZ66pPtxwylpTdrDYZCmFe1LffpA0Fq+E4lvChDQGOCUHr
 ZrB0oQwN7QqgEKJnznMjgPRyK+S84jW14BiZhkQ+5KjqMUtwZcIalpluSnmt3VNfB/To
 3EuhP69e0tNG+WvnN3ZZnynidXpeTda35gEcRygJvN96l+SdqoUanX0hBCdNgcATviup
 mFMA==
X-Gm-Message-State: AOAM530OSmGWdHOJ75rz41Vagx0SFqlbzzlnQQl7DRUm0k7lKpCF9a80
 FFrMwh+kli//lVZJnd606hsgAhS2XI+eH29VP4o=
X-Received: by 2002:a05:651c:1503:: with SMTP id
 e3mr24423568ljf.181.1637329782125; 
 Fri, 19 Nov 2021 05:49:42 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
 <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
 <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
In-Reply-To: <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Fri, 19 Nov 2021 15:49:31 +0200
Message-ID: <CAE=NcrZ3jU2K4a7tqhKxOSGpbEf=9-z6P1vhc=ep6JWXB0zxsA@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wYi4jo72VU6u

On Fri, Nov 19, 2021 at 12:54 PM Janne Karhunen
<janne.karhunen@gmail.com> wrote:

> So 'at' reads in regime_ttbr:
> 10541         return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
> (gdb) p/x env->cp15.ttbr0_el[regime_el(env, mmu_idx)]
> $1 = 0x41730000
>
> Which is wrong. The runtime reads:
> 10543         return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
> (gdb) p/x env->cp15.ttbr1_el[regime_el(env, mmu_idx)]
> $1 = 0x41731001
>
> The determining factor about which one is used is in
> aa64_va_parameters, and it's the bit 55:

I stand corrected - looks like D5.1 in the arch spec does state that
the bit 55 makes the selection.

Interesting. Looks like just padding the address linux style with
0xffff8 is the key to happiness if you expect answers from ttbr1_el1.


--
Janne
