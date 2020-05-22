Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2629847lfb;
        Fri, 22 May 2020 07:32:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD1VFBScNM3NbWkhNqPb0C9uq2BnmsjRjWW896czIOV9dVSez9mJ6tDkFq0Zoz1QCqZaaa
X-Received: by 2002:a25:7102:: with SMTP id m2mr23090482ybc.327.1590157961974;
        Fri, 22 May 2020 07:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590157961; cv=none;
        d=google.com; s=arc-20160816;
        b=JcdKsKv3LXwLx9Mvj3MwUs/E2Zigo5rxfdwCkqODQlm46XgA0QxJSi3H4+16Lbnx7E
         NUTbc0C/J/vapdphcbJnft8BHspB0GcUFMBN9HMwhmn69o1N0FQigLeXFaWC9aj9CSQ8
         n2VL6Art8xXWBi78VJ5KKEpjBE31wA58h96bOEYfkMHj1RmrxumACRinIfOuj/1FzUPj
         s8Cmv1NcSgi2Rc2zKv91XuITuS52RoP9OBrwB57ZHxz8qHx2eW7QSovmpjIs2Em9kQ5N
         8XCJub7OxKcryVCwZThsof/agwfCbkJzjnxsW+Z2mbvJAcYV85R20fRSdZGDBd8FtSA5
         ta3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Os3q5btY6LuVi+A8WytGUb1KrFMmt4muWaugIPZFic=;
        b=htsqHtA1wqKY18wJUnrO5dXc5XddgLEqBcaEpscKQ9xNZzD7UdQBaJHaj+LjnedneE
         V3/RFxsQgqq+jPEixHkihNhXyhhMaN+QZNn9j/cgAB9bsNG0+E666Zny3YHNyE9oL0xg
         pe7eDUIMlx/7e3g1ecQV+EWkrmtJnSrwuHOX7EInC210lsai1OwQQyouNYY7GAeFybih
         nRhkYGIWuX0uVm7WaJ132GF0KqW1PUVas6/mEv83w4ksg5/3jDmfiHH6BGpk9F8EW+x6
         SClW4O4a2JdHRHbfAd+By/6OuvKDAoJ94HnQ72usibWlGXrxQ0LLKbkpYdUKpsEieUn8
         amgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SS1aMVKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x142si7559245ybg.415.2020.05.22.07.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 07:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SS1aMVKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc8j3-0007au-CY
	for alex.bennee@linaro.org; Fri, 22 May 2020 10:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc8iT-0006kl-NA
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:32:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc8iS-0001qb-Oy
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:32:05 -0400
Received: by mail-ot1-x341.google.com with SMTP id v17so8425526ote.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Os3q5btY6LuVi+A8WytGUb1KrFMmt4muWaugIPZFic=;
 b=SS1aMVKYvF1mJJIOqI+/TLgN19vqtK+ofoBLs7HGoyHWPK6vnD91MZCuFFSzEyszvv
 4wHsFz3uymv04rRzGfC4oCi0+q1b+UwRaz9G3D41pniQVVq8wuGY3NC3Ta4IpwUFncmH
 fHk44QmT0wYYxpoxZ3bqjfCCtA1F6+izvC57QbFo49c7hMKCgF5w9GhE3/K1qtUmVPnr
 dIoc7Ahj2OhRkujUkn3tkiNDQgoAszERqoOqTvTKAgklxD11sR6RAaEev/7d7BRj5eIJ
 kugpP60XqgEAvw4cPd34eDrhwn9l8Kqqzi/3TdaXGnZweZmd+n2qQ6h8rWmRzxKCCGu+
 BGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Os3q5btY6LuVi+A8WytGUb1KrFMmt4muWaugIPZFic=;
 b=gsJAWLNYlBSIp/Qmwib0nIGK+H+O5OYENJ3TdjO5ngWOREhl1Mk6KVnLIeSiFw79iL
 sZNyq065piMVcBVww6Z+Ir+JUwVqTd7oMCpE5JVxo/LS8YHw3r2oHUDGkXSOSm02qOq+
 XehwLf0FlQoBR5E/mSQXdZ2j2q/eNGhXIxLPu/VfRdkpeQUkQmoX5i09EiS9vXuJ3QYN
 lIIkvOrSR3V412JHzoxt8z7IhkNr4VdvrUVrk15kjwZqhCXgiTAgwlZhq3n+3G472IL9
 RhLnJk74b+7PrDPBQ8s086FK2FU6GYEyDSnccmG1RZpMWfOPs+3nykUHMsEGsaeN8MYw
 u8gQ==
X-Gm-Message-State: AOAM532c4hE6QpGhsDqPqtoCWGPobnaIOKKEvoVkYDa2Yz24VkSIrnZB
 yxWYYt1sj30jtnRqcSmQ/IAmcWDmD5ZIwDawfW2Lbg==
X-Received: by 2002:a05:6830:158b:: with SMTP id
 i11mr11464006otr.135.1590157923388; 
 Fri, 22 May 2020 07:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-11-peter.maydell@linaro.org>
 <96522b6c-8d33-51b4-cbdb-e8973f6487b5@linaro.org>
In-Reply-To: <96522b6c-8d33-51b4-cbdb-e8973f6487b5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 May 2020 15:31:52 +0100
Message-ID: <CAFEAcA_bpUD0aK4kxpeRofGX2swKBU6OgZhVBvUAhmcnUOH=iQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Convert Neon one-register-and-immediate
 insns to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xDJHPoKHppws

On Sat, 16 May 2020 at 03:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I wonder if it's worth repeating VORR/VBIC so many times.
> You can just as well do the (cmode & 1) && cmode < 12 check in the trans_ function.

OK; at that point we might as well just have a single
Vimm_1r pattern and distinguish VORR/VBIC/VMOV in the
trans function, rather than having three trans functions
which are all doing decode on cmode/op anyway.

thanks
-- PMM
