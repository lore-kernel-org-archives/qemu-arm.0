Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp953888lfm;
        Fri, 1 May 2020 11:10:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypIt63/jP3JjR5UmpcgDOfZ2cGwXBidt4m0L5szzbXOZrDMgz5P0w+/3GQyyh6qgIhzovdkD
X-Received: by 2002:a05:620a:41a:: with SMTP id 26mr4661920qkp.421.1588356641430;
        Fri, 01 May 2020 11:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588356641; cv=none;
        d=google.com; s=arc-20160816;
        b=INTl632Gsm0QrNUCcdVFeIlF8P1++4ZdxXm1r5sUImG58SE7M+RfOTJA3vdePJ3jj+
         6+sBO5l1e9rOTxXK/jiXSNyP2tpFszaXK/l2B+73k42Q9FLd1fT2fKsTTukFOcIwgDil
         6Cf4RrryUqi9l0iY767THNS6I8D4p0rBPg4csL+Q9XENJ4nB6NtplLibu9M/Q7osODNW
         rWQR7POKuav67SMB/PqD7W7zAkcyQPFXEVIuOMFovlJNiDHQMhtflAHuCia0ss2DzJ0G
         61vWY8X+67d1hCHlg4Pv6PsPzZKKd7y4+l5bl2gX5HTz2aX8FSE17+lfPwsooUnc3OdI
         l2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6epJaaRgm8vNjSQ5FfAD77JCMjWkCXvpZktB1GowDJA=;
        b=LluMkXW9wZidN9W95wgCLLWzOxfCmcJO5wjVVLjyMgb1nEShJPnwduLWqLJ8yuysny
         v2Z8lrPCwiiI0IhdzHbHaqavgn0bSAZM2LNKRRS3IOZW0ufwE93s+d9cIuASQ5uGj0sC
         RrRb4L+5UZkcJ3SjLNwcH+xz863PxtOfpE+wFQSxrIus0oXJ6mh0MLQxHUlDkMxK68Aq
         kscX46YJQCHD8LGvsgxhixHDImpqguWQJ7hR951RnvkaceDz8JPzn+8sN5O16AVtt3VZ
         KBbCBbSA6vF7qYkfRWivUgbcsFfZTFjNlI6p7DJ+J5qeUoCvjzJeL99HbbLwCaod5Nob
         /LwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sd43+k5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id dh10si2165830qvb.189.2020.05.01.11.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 11:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sd43+k5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUa7U-0000r3-SS
	for alex.bennee@linaro.org; Fri, 01 May 2020 14:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUa7G-0000nv-Ii
 for qemu-arm@nongnu.org; Fri, 01 May 2020 14:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUa7F-0004k5-7c
 for qemu-arm@nongnu.org; Fri, 01 May 2020 14:10:26 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUa7E-0004fi-Lo
 for qemu-arm@nongnu.org; Fri, 01 May 2020 14:10:24 -0400
Received: by mail-oi1-x241.google.com with SMTP id r66so465139oie.5
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6epJaaRgm8vNjSQ5FfAD77JCMjWkCXvpZktB1GowDJA=;
 b=sd43+k5ThjW5bgvNxuv2YZmPBOXmaWiSMDiIVajiox2DDQ9KvrD7obOSh+/PVkzklS
 lyBwlJgWIdC4un4b7WeT3YYVhxJ41LDaM0vcdC/P+hs1pX1freVeQ5Wjt45+2cUalcUM
 XsihIEcF3LwFGc700dtaBQPCO5l7P0G4mU5qw8hROOGre2r0xmFpWjpDwosY57kYHdDr
 YAMxo0fLGgFTCurxlj35DBXuHNWFGKEsGGwfoRnBFsMcUwhDRAE3IdDoHBRJz52VYRFX
 Iv727ZZ+/WYNyZIM0sHhLkbyay8gSMLzFqvoZhGaQRZ0LsGtYtJCBUW3CEvrDGunCMVX
 Jp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6epJaaRgm8vNjSQ5FfAD77JCMjWkCXvpZktB1GowDJA=;
 b=GmZafeOunBGjtCVzXwGZ9PpX8SKRmdOEIeqShJrUOTnkKYPJPVb3FmHKhJodbbZXUJ
 181TSflhWdGjnlcISga8Rtk1kXPyYfGS5ONjcJTrpu/BOwAv+ns9lqhV+vwkJwTnTTS6
 fQ0pXHy0vS6ARBxjfQ3uFT5O2wORBBix3IX6xJHUIUwc+OuqUsRe8enm5etfPCQD6VZs
 ejDymY4EeBwpl09jyPd/UunS94vyZXLMRNPsmOYPEBtGyDQLI1bDUYU2Qz7eyHyFcWZM
 bRZbWRusNMUmaEEPst2ctDQfcGFwpkzujC/lVue3eMOG16ENH7hgn4y681zQWorZlKFS
 2ZBQ==
X-Gm-Message-State: AGi0PuYi6jJ+4Tme8lNK1+tmK8efDoxHdGHmbXdFPvVg+OYNUH/8hHt+
 9KM2HVgMnPWMHB7FA+7+uoqJ7UQeG8tdszHD29YsEQ==
X-Received: by 2002:aca:3441:: with SMTP id b62mr616818oia.146.1588356623277; 
 Fri, 01 May 2020 11:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-27-peter.maydell@linaro.org>
 <b1d8a9ec-a1ef-47af-f07f-3761a51945f1@linaro.org>
In-Reply-To: <b1d8a9ec-a1ef-47af-f07f-3761a51945f1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2020 19:10:12 +0100
Message-ID: <CAFEAcA8Jv096T6gFPutS0DjFxi7UCDQPv2FMJZ5RjLTEVXmbwA@mail.gmail.com>
Subject: Re: [PATCH 26/36] target/arm: Convert Neon VQSHL, VRSHL, VQRSHL
 3-reg-same insns to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: zQDq8GoACMyN

On Fri, 1 May 2020 at 02:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I'm not 100% sure how best to handle the swapped operands issue.  I don't think
> we want to do it here in gen_gvec_srshl, because we don't have the same reverse
> operand problem in the aarch64 encoding, and I'm looking forward to re-using
> this generator function in aa64 and sve2.
>
> Maybe it would be better to have
>
> @3same     .... ... . . . size:2 .... .... .... . q:1 . . .... \
>            &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
> @3same_rev .... ... . . . size:2 .... .... .... . q:1 . . .... \
>            &3same vn=%vm_dp vm=%vn_dp vd=%vd_dp
>
> and swap the operands to "normal" during decode.

Yeah, I guess so. It's a little confusing because the operands
are going to appear with the "wrong" names in the trans_ functions,
but we can hopefully deflect some of that with a suitable comment
by the @3same_rev format definition.

I think that all the affected insns have asm formats like
 VSHL <Dd>, <Dm>, <Dn>
in contrast to eg
 VSUB <Dd>, <Dn>, <Dm>

so it's effectively just that the field names in the official
insn definition are backwards from what you'd expect.

thanks
-- PMM
