Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3434575lfq;
        Tue, 15 Dec 2020 04:12:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvr3Bkk0bwS/nZKcT+lChL7UcyH5sjQFnWjYSKKUZWF4vW40O6pgSw8IhV2YMndJkQhIVQ
X-Received: by 2002:a25:d806:: with SMTP id p6mr14581058ybg.68.1608034340587;
        Tue, 15 Dec 2020 04:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608034340; cv=none;
        d=google.com; s=arc-20160816;
        b=aelsONtbIyoPNwlnhOFaCWva9JDfd4aBgsP1KuvadYWhe5xKKFPBP0JHQSkNdVcSiR
         1M/aEm5UoxB3vikBc51bOkPDonFWrMOiYzbCymqL2qtQT27DII0cueS6ntY0AJBgphU2
         0OO1hTetrCxYP3XWy/F3zsCHjllJDZt4r29Fd3BEHjfHl+K6zUwlsoouPqWiGkEeUR+i
         FQwfcPs/UkB9A9h4d2lFCdD9YP8YGsrKAmRqoCynsMm1Ooq+7ruu72ZLNzGVDSsmpUHj
         J5h+Juc1cQ2cGq+nY/PTeFMsC8CFXKaFgkLxNL5+x/7+xT2qugtkAtGIWmBozF8plef1
         xGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T3wmvyqJWlarP3ZvbflhYdwwiPtd1k0f5gRDmYIDKwY=;
        b=ic48Fi3RGb5hs9di0iJgK7H8PFFJ3XTxbZRYagdsTbTLIKZ08dg9gqNDQHjktjRKt7
         FygtYaMd0yEOgsZtDDgWT7iV4uq6xzJB2Eb47GfObNmCeuMUIjheJIFhuFa+J04CIzRd
         z0OBHLZn3XevIS6hOCcOe1iD7b2czlsaIKf34S5nE7vsUm/5qRe4adCPpNKAZI+as3lS
         TjNdcCk4ruZotp6t5Pmmovfey+1rPz0SpVMvs4CpsYoAH/QI/kCe6Nu9s2r7uiHzwv/M
         Hiz+xX2jljovMaLl+MCPAnBof0tBra7Ga2wdqJmlILNuJ7BpiONyAF6CIS9WTAgArFf0
         96kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcNsKqjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si19022299ybf.73.2020.12.15.04.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 04:12:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YcNsKqjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp9Bj-0008HX-VF
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 07:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp9BS-0008Gv-2x
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 07:12:02 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kp9BM-0000P9-9C
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 07:12:01 -0500
Received: by mail-ej1-x643.google.com with SMTP id lt17so27352718ejb.3
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3wmvyqJWlarP3ZvbflhYdwwiPtd1k0f5gRDmYIDKwY=;
 b=YcNsKqjz19f9PrRsRSliusEHNTP7cNS7J+LCxjuN4SS7We2h7gaXw9yqMIaLlOKajA
 uYxXyOckPUf1leQBZrn+DMo4RoWgjjnsHsWggx1Qzi0ub9J7gkU7Il0FAS+v8tasWkxD
 Auansd7B8PSZ3QOA5LWkIFJmC1Czi2JhWbgsZiBIbRTvTCe0x2RfbaGpXLsrWj7MYBU2
 t31c6XkgyPu1RSS9j8jOnQzb9KpAlziDQXu4dO67OWW9N/s5qcxILv1I3bFUve9N+b4E
 J4SLaz8QBpPtWZrj/xBUKfdmBEidoQPTVm8nWUJ3+1K6RH3hj4kAOrE+P0btDWcsNvXp
 gq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3wmvyqJWlarP3ZvbflhYdwwiPtd1k0f5gRDmYIDKwY=;
 b=DrK4r/cuGDcT0izJkEt/hfMEe2KcWATeCutwpcDPsON+pFxEQIhxdmzrDQdvOZMpKU
 /i+PcpwsiycSS1fipq2I6lXOcepQFgfi9lihMkKedzHJ1vdjoF2vJcHlkv/oQEBHCmj2
 Vv7jNU8pC1/Qx+qZYSn6ksUb5aVmvC9InZSWb3qqm3ZBy/wZwh/zqpY762hfe+3JHAxf
 erwCPywamtY9v07m9fh0Ybkajc+zfahW68UwU2K0+n1Ku/YxCmrF9b7bT3u4UPyv8eRQ
 15SVnFUfmVNbppkkh8mIv0Urm7UC93pHS28kXAQLgx5wNls2F6MXquz72CKcjT6OFr0T
 SM1Q==
X-Gm-Message-State: AOAM5338lMekcZkYcJzF/f+5MyjJ7F3WzqT9214p2kOedpN+hUgeyFsC
 TIUNJeWkHMLQOYZPdB7J/kRxyGDmIuM4OtG33vJf9g==
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr26871369ejb.56.1608034314742; 
 Tue, 15 Dec 2020 04:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 12:11:43 +0000
Message-ID: <CAFEAcA8i6vAaOFPFRPPYjQgj6gnvS_GutH1HBq=trvrz-Ud-2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] target/arm: various changes to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AF9fFaFNOQVT

On Tue, 15 Dec 2020 at 11:48, Leif Lindholm <leif@nuviainc.com> wrote:
>
> First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).
>
> Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
> by the ARM ARM.
>
> Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
> I was unsure of prefererred naming - Ttype7-Ttype1?).
>
> Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,
>
> Lastly, add all ID_ (aarch32) registers/fields.
>
> Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
> submitting shortly, and some of those features also exist for aarch32.
>
> v1->v2:
> - Correct CCSIDR_EL1 field sizes in 3/5.
> - Rebase to current master.


What happened to the various Reviewed-by:s that people gave you for
patches in the v1 series ?

thanks
-- PMM
