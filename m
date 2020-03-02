Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2354272lfg;
        Mon, 2 Mar 2020 04:01:15 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvraYZyRzGQ+s6vZk5Ya9a28af3+ePjMDQmegAi2zWjcyzV/IV7cVBwoxwQ5DOlPyJz1zQ6
X-Received: by 2002:aed:2a86:: with SMTP id t6mr6516967qtd.341.1583150475058;
        Mon, 02 Mar 2020 04:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583150475; cv=none;
        d=google.com; s=arc-20160816;
        b=0iw+dBFY1V86psrCUq5FhdQb25/OLs5RM9BFWVZoQsAhs7tyi8ISWOUl7R6htlkrOy
         hITR/Okd917/xxXW2SjtryWVPGA8Lm50S7Bra8HOyIoM6q5YCISROgl9StBWkX059tyA
         QnfQGyp/UPkBWoGRgvAVDZHna5sBPbp/Mp1eSbORvSU0VTjAk2jAi2jLAMyxNC0Hdioq
         3iZXb79mJcYgqkLZM4phjrwAM6cjUxX34IBbeo4ZZJ3PHyVZyj8u4aTOmjIo1JDlNp/0
         oAP+DFvY0jXs1emHAMZU53t6Ipo3dxH4SIrvZeL5Pbbfs+ypTR6HWfDDgvu/o2RFCcZ4
         lWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SieApYFXRzIQB5KH3cM4Gzj/UsCbSKojZUWWM5m4pls=;
        b=oavcy+K7vSzDVwG9ygwNDi07H45nx9xYxLi0mpg/xu/vAJxMU2jy7TUet20RpDxcke
         TXwIpoa6pE0kuEbLydF1q8KQ1P1WsXBrVzVh+EQmA042cd8nqsUdYxTDj5OsrhqGRZtB
         8DLekBytIgF9zr68ZMNRygH6t72UtcHzG0TcY5fz0QB9meP5mYQ8LtIIa7uRKSeQJHTR
         qNuLf5QQK/q2vGvP6DP9N6ekNse1n+2YW9xbUM52Obe0ZUkKI1F0aToyrJz3y4FmqG4B
         gNB0dMjPC0sQEMBiQlzV14GbNECgClheamkJEW0WTaQA3RcwNAIVU66eH+BUxmo4N2a/
         bRlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJlclBzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si5631733qkj.251.2020.03.02.04.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 04:01:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJlclBzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jl3-0002bp-2G
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 07:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jkq-0002a2-C7
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jkp-00043z-9o
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:01:00 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39060)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jkp-00043b-3q
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:00:59 -0500
Received: by mail-ot1-x343.google.com with SMTP id x97so9397977ota.6
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 04:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SieApYFXRzIQB5KH3cM4Gzj/UsCbSKojZUWWM5m4pls=;
 b=WJlclBzgN22npSWl6Vd+ZXTzgVd3AR0CbLRkxxc6Bxmuw6SrbxVjK3nU2uR8+fRxuS
 4g42h8tHQoSfLpM5AyPH4j05tS3TksS1vyZj0Db0P9qQuyGZjSBNQRFJzLnJuYRvcX1p
 x8OWF8mFe0lYJf1LQij+s3lqISevxh0w0pidd9/W2mCrIDl3AXphyZKQ9TfCMdNXX/bH
 sY70bEEyu+Io7SsV78xLsiEEGhznhb640jMA6SlS+cDEAfm8nyTwQWW3FUteJzmQJ7o2
 Cs71asFYcR+fnYvrn9nyxV/q0SsZ7EOM1Zw0uP8yq+EmMJKV5VasKM22jCeYoYHYBJ+t
 FfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SieApYFXRzIQB5KH3cM4Gzj/UsCbSKojZUWWM5m4pls=;
 b=sIkIuoTJAsPv/NqPTQjg0n0Phs0Yd+0+jHdNvkuatghF1RFY+yXhgnGvydXVlCXOZ6
 zYkOoWSl03Fz+iixJE/AboJ3+jRk8pv2zE5SZLO7/vZiTU6MdxfH3KBii7eq3LvfNkG4
 /+UrYrcWQgW6jeTtucztWNsDK56UQsgi91ZAUBLurE6zhsEzLnA2GERMVKfGrFvFRpkV
 s5n4YBE589t31TdWbX3pXRObEuy6Yp82yGE3dOX+erY0lrjxEqT/7DjgGHQKfwMTcUcf
 yFzLqs+Awwi6bvfaTHNU1qFFEndGdXcrofrFyyQyMjmww3r9fFpDhJ/NhjbeQbguahec
 pKpQ==
X-Gm-Message-State: APjAAAUPc2w9AF+g++gsSNIFnVQ9W6gzbq1juj3Uq+YCYwmwtNzPYdF8
 BPOzUTBFwUO2bpcnXr+xgtWdAPEejqry7R5WRN/CKQ==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr12229792otq.221.1583150458104; 
 Mon, 02 Mar 2020 04:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031222.15434-2-richard.henderson@linaro.org>
In-Reply-To: <20200225031222.15434-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 12:00:47 +0000
Message-ID: <CAFEAcA9p3O8bz563_fw21SHqvbLPf8Jz-cwFYh9L6QXh61Ne8w@mail.gmail.com>
Subject: Re: [PATCH 1/8] target/arm: Replicate TBI/TBID bits for single range
 regimes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: Kn3WI2hAMA4M

On Tue, 25 Feb 2020 at 03:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replicate the single TBI bit from TCR_EL2 and TCR_EL3 so that
> we can unconditionally use pointer bit 55 to index into our
> composite TBI1:TBI0 field.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
