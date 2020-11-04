Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp134812lfb;
        Wed, 4 Nov 2020 10:00:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLBvWw51q//mzF2SQ+zoXRM7ZoHJ9aJHEguPWKV+Ri+zy7zn0uPmvEnQ1pkA2Sk/fOfAdF
X-Received: by 2002:a25:2c0a:: with SMTP id s10mr40136576ybs.217.1604512833343;
        Wed, 04 Nov 2020 10:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604512833; cv=none;
        d=google.com; s=arc-20160816;
        b=LR26uJUAc8e8h9BOAGVELa2l3P2FVKwhFONtgP3e21h+lpPGZ5G6HDZwNX3SBJJy1z
         yuqvx/W5EG4i3k982OrnEDN07ozeak4G1MeTnNmWwqEiAx3DuaUcUQFi927zRwcINnp0
         mG4CXtLvqUfmNqsb7O5g6bhFrZ5hDlEaWlnozBCy0DiNTExbHkeM2SHFM2Qm5HkquAMe
         M04b3lRKZsUnsiCmPBVnnpFwUWLJOGxIYqrljPbecjo9pyxWtzuPXRqJ3HwXk3RZAFcK
         oJNL2JUc8ly9BBMlVd26/ctfc+1CYxo/HHYM/uH6bhFTdIm+fQpyCjckDusE/8pQhXRF
         Yl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tiMc1SzEb9/AlSm+lWxWCGF+8aQOAj16s2TaXghW7V4=;
        b=dTmZJKHJNsE+I+1kVYN7MWHOPzX+zx5nxV80DwJi6FxksrMwoyWWZBsFbVGJz2ohxb
         F1K7kwPWZb1nD5/kialRoRLVr0m3biEAoh7wFZYfkqbuD9j0bdvGmeoZ0NPwOpfmnqNN
         b+w9lhLpcgMu/EILk3DFxURElYvfq1OCscJ/HHkhZz/Pkohdd7TYMBtas4W4LD5lsiw0
         fDrj0vR9johSC+qNKpx4+WWEdSR5v6ho4w8qVJ+e96xJZwIpUNObozM/lNiz20lIR1WL
         yHJ9RvcZ/BtucQq9s1UjHwWrZO4CwngjPmAjUKnGiodh5d2liG2e89lloC7+mcuaM63V
         1Nbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pegGiYYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si1195009ybq.271.2020.11.04.10.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 10:00:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pegGiYYn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaN5E-0007LJ-Nv
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 13:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN3f-0006Bn-G2
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:58:55 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kaN3d-0003tD-Vg
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 12:58:55 -0500
Received: by mail-ej1-x642.google.com with SMTP id dk16so30413676ejb.12
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 09:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tiMc1SzEb9/AlSm+lWxWCGF+8aQOAj16s2TaXghW7V4=;
 b=pegGiYYnGCYQtZMM+ZRIsr0ezlbbyMQDuvsUPE1h08A7zhWAT0W5C1RzX0wDTGSx/1
 bSkNzWInS1evWUmDjytnJNUOJnzhrDw5WSgOO51l2QXnmSAR1Zp/NwQ96DJpkUhcAsmS
 KuzUCatyIG8ANIKeWtedwViTwp+ZYZskkMBsoDkMCHHXTiZohyPrTAz7YPyw5Sm2pjdW
 j29q470gQlvMa6LWDUuKZJ7MQyYYfR5rSx1pLdAMKj5NMoPBYmKd740ir+nNXUuEgJNP
 HM7T0gA0MXkzrkhGyliX/jUUykEBlDUJx2Ectf9VgFx6jGvAxmEdmK7BSPSwAeiXgwhI
 etjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiMc1SzEb9/AlSm+lWxWCGF+8aQOAj16s2TaXghW7V4=;
 b=WY3ZXfbTT9yZ5Un7WH5A4stQCqOrMgGzw9o+8x26PzEJyFjRaq1YvSWrcEVu+ZGJ0p
 4HP8Wd0zuc3phr3sHYG/qeMkPlryeEaIJGd3/+qNQYW0pNiaNeG8KYhqxDL50I6kK+9d
 3mlnO1nqPZ4F7zStmt5PKwCzQ0qcSyf+GVj1FZXpU68xfyjxPdjbybwyNjYTiaK4NuOd
 lU/ll968G1MJrdfOtqb27jSF1qoYDDNXRUmPiwely3EDHFEtqTzSATRAf3W4bVlXOzBP
 hVlPIZ50OkkZco7Egom1FJ8GoU4khAynFyJZdmryamOmqCQG/kWIwkhz9JtOY5E46VAW
 O/SQ==
X-Gm-Message-State: AOAM532FIoNUphaGmjneBn+XnH4IjVyG5xXi+/u5QzAJzXgrEpDTWG2s
 wyzaB+TprZhPiHmAZuoCvefE1sXe/hqsNKx7N2qQWw==
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr26048032ejd.250.1604512732596; 
 Wed, 04 Nov 2020 09:58:52 -0800 (PST)
MIME-Version: 1.0
References: <5FA280F5.8060902@huawei.com>
 <CAKmqyKOS4bALKNTA9wMK=HANz4Dc=fffq2pZafCxGFqsJ_LMkg@mail.gmail.com>
In-Reply-To: <CAKmqyKOS4bALKNTA9wMK=HANz4Dc=fffq2pZafCxGFqsJ_LMkg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2020 17:58:41 +0000
Message-ID: <CAFEAcA9bq8Fs62wD6dsrRcYvSogrdzK9cDrzoVmMFcpui8=_uQ@mail.gmail.com>
Subject: Re: [PATCH] ssi: Fix bad printf format specifiers
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, QEMU <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, AlexChen <alex.chen@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSqxJIk+/XYU

On Wed, 4 Nov 2020 at 16:33, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Nov 4, 2020 at 2:23 AM AlexChen <alex.chen@huawei.com> wrote:
> >
> > We should use printf format specifier "%u" instead of "%d" for
> > argument of type "unsigned int".
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Alex Chen <alex.chen@huawei.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>



Applied to target-arm.next, thanks.

-- PMM
