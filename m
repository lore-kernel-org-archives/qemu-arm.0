Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2155043lfa;
        Tue, 13 Oct 2020 10:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqTxorSBlmGmRCMMXQqKBzssl9aQq4ts8H/woGRCFX+iR5l6Gzgx0nhG9AEZxv/89nfBQM
X-Received: by 2002:a25:360d:: with SMTP id d13mr1294670yba.362.1602609239235;
        Tue, 13 Oct 2020 10:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602609239; cv=none;
        d=google.com; s=arc-20160816;
        b=ztq+Xc6yYHLnyCtny+K9XadSML3pCdI/miyLGbKjUPfPJmSBpTj/i6fWqYdR5OmBgm
         mCZrf0wu+hqTyw9QwkOqmZdyLDA9z2oUmG9R5UJLa1fv2dulabQrwEayBd3UB30cFZ5I
         uokl1EntVBLvRQpgy//LpIYl7ey874DDT7njy4L236wa2XsqZGgk3j+N6uerK7kxoH+b
         Ag8t1lr2K7Tkqq5uTIblikPTnNUrUBbGvj2IHmgB03evWFsv2WcIjfqNTTuWrcQrMBni
         nbKgdh8U6/dxH0cdS8n5YpYs9BZMUjBVkXVVz4BueuAtMNXeRrfcAzNPQtutIeeDwgOE
         GhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNCQ+A264eNjHHRrYDrcPo/630F18xG/AyB0QQv1cqU=;
        b=lSA4iIRD1S6P7fhr0Nh8m7BxU5JFzHI3vo48tYQw3nap3P8uxRsnM4cMGAWLSTfL/e
         kx5HckE7LmVpW4AYLG6iKjNq5f6i95KF4PLjaPM7X+Ga9TL7oKtgbJDV7QUwJ/Z76ja3
         w/QJA5ewRjKQhwksFTHmsGgCvaHTbsLB4am3fsbV6t8ZrjSM7jH3s0ndhVwiVpbl76f8
         iLRkQGodnhtwb0QAMtHJ0bWZQkIUaOWCA4TLYQkqwwOus22695BgEw+hHvvOgBuX8KGz
         WsrQcFLGrNR+kNqUkwoyaw3jfhbqSCoWZZvE1XX2A1ERKCTJ909GW7MP1N4GVX73N3ge
         +4sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8AiV7Os;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si483866ybk.287.2020.10.13.10.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 10:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8AiV7Os;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSNs6-0001zD-Kw
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 13:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSNqu-0000l6-Kc
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 13:12:44 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSNqs-00006I-4S
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 13:12:44 -0400
Received: by mail-ed1-x541.google.com with SMTP id x1so286903eds.1
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNCQ+A264eNjHHRrYDrcPo/630F18xG/AyB0QQv1cqU=;
 b=M8AiV7OsmdW//xnnxSabYNlrXrQTZ1plfc9mYdiJqPQ9litqCZyIjnan5qdFSitqjf
 CQcwzQABrN4KiQIq53ui/+IzPJOk0va0BlRhX5J2cIMygQvk1aLuTcoGztI1XHIbZ5M+
 Uxu8suc9kPUFsSoKFluszFYiM5COKz3rVBn+B+8Ms0WMT2CtP7Johhx4LcQjm8939nKz
 ECqlSIXHv65D5voLNi6/AiPw8ykjDMvWHITsodOLV1WhLZOs/7BD/hDFp2fl3xKubhqh
 tHaHLfo4JE30G4yR5o5UBIfQiuE7p10kOeSeP63qAGssQ0RsaUUh/sgrG3b0AGt1Ofmv
 BVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNCQ+A264eNjHHRrYDrcPo/630F18xG/AyB0QQv1cqU=;
 b=FUl5MfXFOJs3H3IxaqUu80lfts9ja7889ps8DlDPxFXW1L79GJ195HBEvBO+naGGbh
 KUdoPPl37gFUVS/cCaW51qMhT+g7pSbGi9Hj+sExsItwM1bxr9+XvhA+TezNgIKRLflg
 EkJFzOBGiVa3EkgHAHy6wyEPIHHphWRkCr9KwKqld9iZN8oMt07br6JH+5oYX+N+m0yX
 hKLS1R1+sDCkcqxEB/aBbefcbr78qQOUXXfv059Od43IJoeiFHiGgAGQ+lMXnRvQToNG
 54swQk7BQgdFx3YieWzsn0ot/Ztw7zJP9e7zhMLtalbdYagyx6r2FrK5xs7ll2IcWaE/
 9Cgw==
X-Gm-Message-State: AOAM532lhNkWG7bAs3FtGOeayfS8mptNNrrcnK5bd6RuHkHucQ+AwIsy
 nLcPqEY1dlvdJRqzTO9ojUVAoibEwdv6JhRvDSB2xg==
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr603042eds.44.1602609160525;
 Tue, 13 Oct 2020 10:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
 <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
 <9a06ae91-68e1-47a7-c6aa-19c1e2c47dda@linaro.org>
In-Reply-To: <9a06ae91-68e1-47a7-c6aa-19c1e2c47dda@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 18:12:29 +0100
Message-ID: <CAFEAcA_EHAsJTDV3JjriUC4rNj829LWCp9PNWScz+7uWFxxCGA@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UoH7eYvjmqGj

On Tue, 13 Oct 2020 at 18:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/12/20 12:56 PM, Peter Maydell wrote:
> > On Mon, 12 Oct 2020 at 16:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This turns out not to work, because gen_jmp() always generates
> > a goto-tb for tb exit 0, and we hit the assert() that exit 0
> > was not used twice. Here's a fixup to fold into this patch:
>
> Indeed.  I was going to suggest that here you should use arm_gen_condlabel()
> like you did for LE.  Which I think would be still cleaner than your fixup patch.

I thought about that but it doesn't really fit, because
the condlabel is for "go to the next instruction
without having done anything". Here we need to do something
on that codepath (unlike LE).

thanks
-- PMM
