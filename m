Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8671888lff;
        Thu, 16 Jan 2020 09:33:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqzc2LHbd0vghGDtb3Qh1xNCuppbWNKRCifqxMg11adlEhdzvyHX55Yq9bh0/PuKRKebBgUQ
X-Received: by 2002:a05:6402:3184:: with SMTP id di4mr36820024edb.59.1579196022070;
        Thu, 16 Jan 2020 09:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579196022; cv=none;
        d=google.com; s=arc-20160816;
        b=XzZAaJBquOZEk9ptAH1V/fzmsEv89n2xQSXmdertIAsJPOp46lX843uUrNPWT+UoBr
         vYcOzy2AoPzRGCeyMBZahFNY6COCmq5OkP+LBSFHdG7T/5fmamMJ0q1Nl/d6Xmykp46O
         dWuNL9QzxBau1FdYynVuro6Jug4jiSQcgcwbFq3QXheJgs3px2TQFqvusL00N2Wos20m
         7ET750MDfiTVdagWdy50cyedPbzu997eaIiN7SLa+d5+Ralnx/IqssmUScKEkiipL3ZG
         LXFDTKKbiolVI98NpN5AoVmpJup6h0BMFeQFDvJbof1FdStnTxIy1otuAbBkUxCZbpI+
         0l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ZPDZo0jMU1ikuXpVDiiyq0aSPvd42ukajRTz1Bdats=;
        b=oF7fkTKrVPs+ESzjz2K6YBYx/evh0b1JRd6/DYV+d2k1CSWJGrXmHuaDFJtmMItKp8
         fpm4uczvdpgr0d2rt1ikRcTKBRXp1TIusYURGQ7NJJ3zIMKGt9WIXQE0bsY27H/8Pr6Q
         ZTe28TmmY4iuJ4ZrvAQvJSOX0oVc5K4zUUnXGXxiXquRTtE0DWXae3vLPtLKP1NYw4jx
         rXB+JYpT/sZ2sIJ5OX7vlzBTbB5xokSYVbE25QkcLsPk8bVaxnJVzPOtK15mM4Ix8YCC
         AUitPVRxnyBhOFQDZpkzvXAsU8vIp8zrc1RhyawAFd2NxLkNTPfA8Y+fnv+QDV3DT4ua
         7MJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZRDE4TWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si15817542edn.207.2020.01.16.09.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 09:33:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZRDE4TWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is91Y-0003ao-Kc
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 12:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1is91H-0003aX-Me
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:33:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1is91G-0007pr-D2
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:33:23 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1is91G-0007pK-7G
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:33:22 -0500
Received: by mail-oi1-x242.google.com with SMTP id l9so19559637oii.5
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ZPDZo0jMU1ikuXpVDiiyq0aSPvd42ukajRTz1Bdats=;
 b=ZRDE4TWGmwxZIi/9SHI7x3kquTv9WHQ60uRhPs9+KM32HVYmUxnbD6sZyijh+Cagb3
 ruhdjm8AT17Cz4BAYCf5cbxAZ44I/JSQjVIEeDIJ4zmz8kOxBjcZHbYP1qTTrkyDrcn6
 frm6JPg0aZKFbUXEqz96C0MJTvJCNYb4Hug7bHIA/okQNroHer3y1MOlaEFy/XJAq0+i
 be4Tu+l40KP1qAqbvKyNPJ6HD19Hp0MmfTl0P9/RSbt63u/8Tv+tmfot68Kcf+qBMuon
 enFWrfzRbDgyXg39u4onqHcyYUWcaH8hVeNxnOYXLPyKqYkto2u0XoCR2qkX6O14wjW7
 z+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ZPDZo0jMU1ikuXpVDiiyq0aSPvd42ukajRTz1Bdats=;
 b=ZrUVMB5zR7zM3V5oHAxwG6FXx0hls5WM1Rh0vkhznFZfqN1hM/G0F1VRP+OypT4BWw
 EnyMaZI67NUsFzaMFTbcwBQ7ZA8UV8IP6lMBI4zXIhb2tqNcNp/D1NX+WbarAe6l1qMA
 5uCe7j2Aim50X+PP7KQ8Xt4bw8dZFwPW6zEcQbCrapLMKrtIRTtxpci3pAit4Wzq9nEH
 FTX2gxHwdaktHU/zjl71r35tgjSP5Bduevlecp4431budA3yOptxvA1kxZkkYIchlcBA
 SjtPVdNQGcYGuto1s+ajsBIk7+d0Ozw3ikmAh1xuVJ3pFDtGbN+PSuKpH8PIwrvVyGPn
 ypkQ==
X-Gm-Message-State: APjAAAVV1LCJnhtBzpGVOziISO2IZdtawDw3oGFCbNnB++3v2cVr5j3W
 fEpu9XENjA3Q5y8evEkxS5/hoz5KZt2d2a7zoZfC9Q==
X-Received: by 2002:aca:d78b:: with SMTP id o133mr108518oig.163.1579196000981; 
 Thu, 16 Jan 2020 09:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20200109041228.10131-1-masahiroy@kernel.org>
In-Reply-To: <20200109041228.10131-1-masahiroy@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 17:33:10 +0000
Message-ID: <CAFEAcA8Z486dBHo-zkjw4eqLWRD9ukSdMmxqCk_rsV-oAkWcAA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/arm-semi: fix SYS_OPEN to return nonzero
 filehandle
To: Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: X8n/EaTB3csB

On Thu, 9 Jan 2020 at 04:13, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> According to the specification "Semihosting for AArch32 and Aarch64",
> the SYS_OPEN operation should return:
>
>  - A nonzero handle if the call is successful
>  - -1 if the call is not successful
>
> So, it should never return 0.
>
> Prior to commit 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting
> code hand out its own file descriptors"), the guest fd matched to the
> host fd. It returned a nonzero handle on success since the fd 0 is
> already used for stdin.

I think this bug existed even prior to that commit, because
in the old implementation we would handle the ":tt" magic
file by returning STDIN_FILENO or STDOUT_FILENO, and
STDIN_FILENO is zero.

So although I agree we should fix this bug, it would probably
be wise if your code using the API treated 0 as a success,
because QEMU's probably not the only implementation that
decided to use "just pass through the host fd"...

> Basically, there are two ways to fix this:
>
>   - Use (guestfd - 1) as the index of guestfs_arrary. We need to insert
>     increment/decrement to convert the guestfd and the array index back
>     and forth.
>
>   - Keep using guestfd as the index of guestfs_array. The first entry
>     of guestfs_array is left unused.
>
> I thought the latter is simpler. We end up with wasting a small piece
> of memory for the unused first entry of guestfd_array, but this is
> probably not a big deal.

Yeah, I guess so.

Applied to target-arm.next.

(This also reminds me that I never got round to fixing a bug where
if the guest does a SYS_OPEN on :tt and then a SYS_CLOSE then
we close the host stdin/stdout, which we should not...)

thanks
-- PMM
