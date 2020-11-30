Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5610901lfb;
        Mon, 30 Nov 2020 14:12:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPfGFyUiy8jT+uk13aNwpMjjXlEaAnvcjC+UJ85o6fja0YAt4dZOdXdoQnM4v7SQjkin63
X-Received: by 2002:a25:db10:: with SMTP id g16mr42409509ybf.227.1606774321764;
        Mon, 30 Nov 2020 14:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606774321; cv=none;
        d=google.com; s=arc-20160816;
        b=nvB4ggEIEmz7pKnY8pD4F9Gx/I+nXlMxr29QmgNZEOyjJE262H3KJx4dmX/T/jLf0x
         WJ6xXtiYXVpz4bQ5gFf2/EqgIhJ8jWfCY+ceWoeBrkKIDeAC1WfJaL9GV3c5YKWl3loN
         yke1YsFE3WdtGL0Cfr2YGxo/kMzC4wUbvKU6LK6N93PAwyJ1mPMEpdMxwaySSUARFT35
         1VaDRBSFnvAdPiH0Kc+p6kuwhqaTzO1rKRyca2fJU8gm9p6qnDuE8cbW7tM+OnWFeook
         crL4IfPtCEdijfPHGTMfQMJglbf/0g+dwvlfSTpcS7qx62Q8W6uj4edEIQCgm1kqMgW0
         xkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxvj+4jFjrctmt5T/OARKhAErFN/MNyqyd0CViPDpRM=;
        b=LMtuV0DMdxWEwF6jU31BYqF0Op2C6j+xH2dVtFiJmkJ/vJCSw2zADnAACb5jOKcxqb
         fokfMYLl0VrlpFz1Md5gWHs4PW7lN1pWNc6PfLD69RXJCHkAC6MPu1h8sSPdeE8q4H/l
         qTGXyAu3PJw65b4bjsUKclVqXobTJajpBDlRKnMic5qV/KsuVO/mjvKWVdIiKSFrwJxj
         o7PdseDgmmGFreofmxIjoTIR03QkCsTBShKo4+wLbFBNegd2Rpp4o8Ll1I8/Eg7kgUeg
         6aJzyQLPPSQgT5fhSE2sKMFGB8M/diKDtAtHeYpwvqZudsVwRSZmBn/3zv151jNvTbBL
         zKAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mZuB4J2a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si18770080ybp.201.2020.11.30.14.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 14:12:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mZuB4J2a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjrOr-0004Yq-6H
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 17:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjrNo-0004Xp-QH
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 17:10:56 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjrNn-0005kI-58
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 17:10:56 -0500
Received: by mail-ej1-x642.google.com with SMTP id s13so9659360ejr.1
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 14:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxvj+4jFjrctmt5T/OARKhAErFN/MNyqyd0CViPDpRM=;
 b=mZuB4J2aPq2CFADbsCMFo43phP8GNp2uR7lIpA+1MllKpo4455rOPNkCSgYHK9a+YC
 w/q+G54yrqmPgd5CsNUlCLNQOWbNxRkjkjd27ltIBdbng5pLdasfRAh6otJvPsljieni
 LNdsrOV6Nsdup1f0kaln33NNTlQWvQJgFkiOvTHHZx9+DdQeTcVg6KN8zpV4E5Ow9DuC
 zVtBPtW0WEGHd6FTnT5Kp7sikt65KzYcCQISn7Fe300Qz1U+S3xhd211sXJ2fCCm3tzT
 Ku96ssEukvx+d6riv04Jg6b+jsPdivEJXxemBtXU6+ldJFvx5t7z+2FyaKU90musmCWw
 ROMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxvj+4jFjrctmt5T/OARKhAErFN/MNyqyd0CViPDpRM=;
 b=SOfvDM9uT1xmKfZdOXQVdRJM+aZwToIY+wFGTfoZf1KGwVGc4w8JR0k0fA+egwHu+H
 XTg/aC4CYOnR/qm6mJ6cNstjae7YAab/hL9jQnI+qJW/B2HZSrAPMw6vz2G5Iyx+U+8q
 hyPcX4ALH1jU5P2UBw3c/iWsXg8KOz9fHoeyMEUoYSF0hXnbT3rDQMwtAvhy75l/d0ko
 fQvFtqCjfkSP65Y5LKUOLgxSVwUGZ9bSI6QMO1iRwRvaMjY4RqudpLAeXJE/zI7Mhz6A
 D0OdmpX98gPP92RlmdPzeTjlYzfdbS7Y7LBWwXXKMV/t9uDsWevazo7q+BiSDNx9MeEo
 3VGQ==
X-Gm-Message-State: AOAM532Ap1/JLqdUIGoC+/+B7RvoUA8GSx9+FFbIpMMZv7KhN+r2s31n
 fhBRczG3VIrXPSJAEJOygto2rWtE4XR7tOjP+o+yHw==
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr23453117ejg.250.1606774252361; 
 Mon, 30 Nov 2020 14:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
In-Reply-To: <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 22:10:41 +0000
Message-ID: <CAFEAcA-GbGeS+95GB2YZGM_nifYOfggYPvMfG6ms4PmhFjHE5Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Frank Yang <lfy@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mPc330SClwM8

On Mon, 30 Nov 2020 at 20:56, Frank Yang <lfy@google.com> wrote:
> We'd actually like to contribute upstream too :) We do want to maintain
> our own downstream though; Android Emulator codebase needs to work
> solidly on macos and windows which has made keeping up with upstream difficult

One of the main reasons why OSX and Windows support upstream is
not so great is because very few people are helping to develop,
test and support it upstream. The way to fix that IMHO is for more
people who do care about those platforms to actively engage
with us upstream to help in making those platforms move closer to
being first class citizens. If you stay on a downstream fork
forever then I don't think you'll ever see things improve.

thanks
-- PMM
