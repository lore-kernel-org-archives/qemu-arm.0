Received: by 2002:a05:6214:3f4:0:0:0:0 with SMTP id cf20csp1718376qvb;
        Thu, 16 Dec 2021 10:49:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKidZVyAmonGO1fXYefmOg2nlH/chzZzWyBLdXfgrg8pNPb8zQ/i8HgaaBaMod742Nfctv
X-Received: by 2002:a5b:ecc:: with SMTP id a12mr15554791ybs.347.1639680561852;
        Thu, 16 Dec 2021 10:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639680561; cv=none;
        d=google.com; s=arc-20160816;
        b=LUUa929TbdluZBJZ0ew0n0Rk/JH3YLz2/GKKftcpySXzxJNDmXkaNRb7ZFwdsvoiAo
         HnYQfSsG0OkQ9eTYY6SDCatxth+zH8jN/cMawgkMY3KAq8CRvpEkbeuvlYMf3HVdzky8
         LAWk0heXqEwJU0wXAkBj6a+dfl8yWrjiSKvnuAmvuWnEvKK+F70oroSnqmFlqhi56tSg
         DUEfgWc3R3GYtD64RD1SdPlOdckJNOWSxoFc1IJ/eH0RckJ4bqmBl3z6/QjoFjV+w2Gw
         jyN3nbxPtrnIgADls8CVUqpb8bb5H+fsbGP4mD3YgG+RFRPft9ZPwYirNMePOxoFRaKV
         jMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ah7hFnqyPldKY1f+xfKUjnDd1bmDVbuCIQ+aapZsJR8=;
        b=lvtAeUGb6j9sJLYjMyQXZ8QOGgHTuIg8LhBzdNmCCQBUEvP9vr7bx4o7ky1oLbw3S2
         SE6/Il3STaVH85C7aYkDY9wkRobZX8E+yYCs8XDq5IW556+0XTZP9pGxf7GZYFtQYS8T
         NodzRV5Ux1xru6qs+IEIwOIWiRuJja3wu6Aq/ZORQ3AVdV/VPmRa6Cq4tkXB4+4h1eRp
         hOF8ZNRGmW+Z2PGAxtsNniqHAtIW97BBewMWPI5er8rRIiSBQmhEwnTmODIYIqa4W7wW
         IH/ca3S80zDofnSfGcevOkJ+0D+TdBSjPbJwUrNbPKJwlxbSi2QkZVYQ5htmAD3o9kMM
         u30A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L1Z+x8Ey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si8032836ybu.218.2021.12.16.10.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Dec 2021 10:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L1Z+x8Ey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxvof-0002cW-2G
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 13:49:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxvmz-0001oE-4M
 for qemu-arm@nongnu.org; Thu, 16 Dec 2021 13:47:37 -0500
Received: from [2a00:1450:4864:20::42e] (port=45640
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxvmx-0001GV-6K
 for qemu-arm@nongnu.org; Thu, 16 Dec 2021 13:47:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o13so45787087wrs.12
 for <qemu-arm@nongnu.org>; Thu, 16 Dec 2021 10:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ah7hFnqyPldKY1f+xfKUjnDd1bmDVbuCIQ+aapZsJR8=;
 b=L1Z+x8EykT1FfSYcYZX9x9wzFZTxiNViiLtAMVvX+rS71QCtreSi41Gy8MvC+YdRqK
 FGL6BYouEEmR9b3in7Tma4s0T4y3L+JatE+JJ14v/oBJXEW/C7n5iTvqbeW+VVGC8XNt
 VUC30dM3J7nh9kYYWidxYqXZYniZLBC/cDUTEhIRzV2K4Q0nXJD8bV+AqP6RDpR0ch+R
 A2BVBiwiA8BHKyvCj8aUt6KB5T5iLRste/w7YmiPBHn7WO7thr8CLpkMi0PLrtxAOrWj
 n4wV0I0YvLn9A7Aoojm5p+B9iKIF45Ip228Y7NyTfoUXUq2bX+9G7gwwMsrR6Lmf6k/C
 U0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ah7hFnqyPldKY1f+xfKUjnDd1bmDVbuCIQ+aapZsJR8=;
 b=Djf6V7nhuHc1kjdaCsuuQmURVhAqdcgw0Ph3jviPPelu3fyrCF+5t8Ueu+CvmMb3Es
 mH4QmjWax3TzU3Jag/Wga4V/0QqZRBJVan1drfzkIdWC5aPvGal7LhKGGqY+6+XA2kuz
 0ZBoDs8u3xRslyiivqRRxgaXa67NElck8EY48enwI1bchc6yNNovnAMHOsiBGgDrJ1Y/
 gN09mhfN6kRzniAtJgHBwwS9+raFOtaJ4sI1G1M5QGK1Z/HhAG/efNc0vzMML9I4rYnK
 a4fohjvlf9KzQyLwC2SaMG4QYfK/IOMW2f1HBj0My55mLq1EjDPpw5AHZeKmiGq+Z9h7
 mElQ==
X-Gm-Message-State: AOAM531UngZxtCq8VUKroaV7ucelmHIrfvkFTHhWiAazH7sEckhryB6a
 w2l0gio7HB5TKGgzZ33P3PO3/Mow3PMgzCouDvoJkw==
X-Received: by 2002:a05:6000:3c4:: with SMTP id
 b4mr3614406wrg.172.1639680450136; 
 Thu, 16 Dec 2021 10:47:30 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
 <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
In-Reply-To: <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Dec 2021 18:47:19 +0000
Message-ID: <CAFEAcA9v6JQD3OR1tKL7yJaY+=-ohhvMCzF4xpSRAATXAB59vA@mail.gmail.com>
Subject: Re: Exception return
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: abhijeet inamdar <abhijeetinamdar3005@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +GAsTKf6mqzs

On Thu, 16 Dec 2021 at 17:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Cc'ing qemu-arm developers.
>
> On 12/16/21 18:31, abhijeet inamdar wrote:
> > Hi,
> >
> > I was running my .elf file on my custom machine(CM3) and was hit with
> > this error when debugging and had the required -d flags and single step=
ping.
> >
> > IN: Hal_MemFault
> > 0x7004e794:  4770       bx       lr
> >
> > Trace 0: 0x7f4faa471100 [00000000/7004e794/0x312000c1]  Hal_MemFault
> > R00=3D7004938d R01=3D00000000 R02=3D7004938c R03=3Dffffffff
> > R04=3D7005e410 R05=3D10020000 R06=3De000eda0 R07=3D00000000
> > R08=3D00000010 R09=3D1003f8e0 R10=3De000ed94 R11=3D00000000
> > R12=3Dffffffff R13=3D1003dbe0 R14=3Dfffffff9 R15=3D7004e794
> > XPSR=3D01000003 ---- T handler
> > Taking exception 8 [QEMU v7M exception exit]
> > Exception return: magic PC fffffff9 previous exception 3
> > M profile return from interrupt with misaligned PC is UNPREDICTABLE on =
v7M
> > ...successful exception return
> > DRBAR[6]: 0xa0000000 misaligned to DRSR region size, mask =3D 0x3ffffff=
f
> > Taking exception 3 [Prefetch Abort]
> > ...with CFSR.IACCVIOL
> > ...taking pending nonsecure exception 3

The logging here tells you what happened:

 * we are in an exception handler
 * we do the bx lr to magic value which is M-profile's exception-return
 * ...but there's something wrong with the return address we pull
   off the stack, because it's not an aligned value (its least
   significant bit is set)
 * moreover, it's an address that corresponds to an MPU region
   that has been misprogrammed (the DRBAR value isn't right);
   the MPU treats such regions as not matching
 * and so we take an instruction access fault

So you have two problems:
 (1) the PC value on the stack that you're trying to return to is wrong
 (2) you're programming the MPU wrong

You need to investigate and fix both.

-- PMM
