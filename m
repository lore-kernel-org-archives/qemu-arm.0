Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp822854wrv;
        Thu, 11 Jul 2019 07:51:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyOQWQ5uoJ0nDoeBAhhoncbAefdJG6OE7coNSBcADHDs2EXVJ4f/W/MI16sNQWMg1qeM6K
X-Received: by 2002:aa7:dad6:: with SMTP id x22mr3990407eds.122.1562856713401;
        Thu, 11 Jul 2019 07:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562856713; cv=none;
        d=google.com; s=arc-20160816;
        b=EEX7Y4NvvePDj5YJRKQoVOOeM2ox5edA8ibevF4NXS3DBMMkfTeC8Zxm6oqSFJAx21
         +Lo+2Pbbe+YTunx/665glQpw1vIzfi7PX+ptvqjLySPTsiCF0ZYap5nWX9JpaGr+bLkm
         +L5yP+hxLHJqppaD0uqz2E0xX1OLyIUDhDHcyHpatgRTmBsYCy7j/ZM5ufwC1z11kQb9
         iPJAkieyCKenUNuqvn7cYKP9L1/MuU6m3odT/fNADqV+kqC82O8U+ZI4Q4de6EJ70j65
         PnFpQwy32ZOa3latQZqDVjV4jdY8UAwXcCrLRWGXh/LfgnEEivRR33cqJ6f++sxCLGht
         ao/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=yJLyqKsaxzbXx+G9z3/vVff1sRqmJq0mDAb3qNapNyk=;
        b=qc3MKz1ASQBdfBsAbNTqqLRrTkwfdGp9NzAoGBmMyGatIq96GvFG3KFf2/w0eLO6in
         mTiidHBar2I+COs9Kz0UmJRmU9mQ/yY3+oslqH26dDUsaXmBPeXinpkdLrJAt7QPaNzV
         3qiSuPRT4r8LdXlWAMGYph3IgJzWXNJs6zYDJFG4EFHb0xmtItaEW78ExJgHF13A46oB
         85YwME0Q+mHtSjpvU/jlmsIdSNyeVK9ITp8klrz8n9sTIoTnCgpENP/nH8I4VaUi9zND
         WTFLU6Wtg/9R+U7TZXuOCoFu4cr3s4cq3rWQaBdJ2rwp2MoR+cmP0LyW5CfSjlRbi838
         fmBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCZBPtkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy22si3303181ejb.300.2019.07.11.07.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 07:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jCZBPtkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlaQK-0005YY-G4
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 10:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41052)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaQB-0005UH-Lv
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaQ9-0005IC-I6
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:51:43 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:42210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlaQ7-00056g-Gg
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:51:39 -0400
Received: by mail-oi1-x231.google.com with SMTP id s184so4682835oie.9
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2019 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yJLyqKsaxzbXx+G9z3/vVff1sRqmJq0mDAb3qNapNyk=;
 b=jCZBPtkh6AhVo3eWl23zPlnhDDKn6/IfiyC/JFfAdfuKw1qjps8/F/4mwieMIsJta0
 QsMGUS+pQHWZMW2UyJxFUi8rMDEEs5jnCq+7FDQ6AB7TVZmxuPLbc/i3yMX1m7NGH0b+
 X4hePJEHqyWlFCOZuAPX3ay2FztIdP3GN3kMDq861tYJTBbVbDsvQOxFPUG8Xq4iakm2
 n774GqmDktzexV8+xa4NLT8N1tLe6lJ5Wqc0D8TcaTK4SYq6Ofv+DVsGLrS+3YKso4wC
 2DN3gFZPsiz9R3wTC7pas/UvC/mnK/mZDm9tY5CaQLDJq3WACbsYxqhVWx91514QfkbB
 4NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yJLyqKsaxzbXx+G9z3/vVff1sRqmJq0mDAb3qNapNyk=;
 b=GpztkJbyklM4sckxXeo8YAarEZgumotWJdZdhkRl2AFpD73PAibfwZ/TeVNuLWNG26
 bHufJfoy/+NRmEnjwr34lhAOr5x52VDrhEJSQPX7E2tfaA6pgZP4PhDl7qnobInfTchp
 j9B7euGZMtl+xOz5L8QX3vwELn5xL6r42xKKpP5GNc/eQHbdQb8CGgg7qm0p39kFUezL
 aOA43LlJkOoFCac0UmLZjJq85ErogQFng2ofvN5y0QOW6dp6R671rK4Om2RVJsm86ImM
 McTVpRUcLJmLwDSMT+nQAeBKOdF1HDLHR033JIAjU0PRGctfPWRjeDtnxy/ChTNV5rtk
 HbxQ==
X-Gm-Message-State: APjAAAUkdDuXJRamS+qkL0lPEF3ciVM3cTk8tQYglh+fDlFuSDyh1Hjf
 QxMaPxdNygGbo64umDnecexwkIvCW9EsB4vf22JYVQ==
X-Received: by 2002:aca:6185:: with SMTP id v127mr2734021oib.163.1562856692614; 
 Thu, 11 Jul 2019 07:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190709113715.7761-1-philmd@redhat.com>
In-Reply-To: <20190709113715.7761-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 15:51:21 +0100
Message-ID: <CAFEAcA9adoeYeJCnrRU=i=WiYzAuJh2vQupYgL_KRAoomvU4Wg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::231
Subject: Re: [Qemu-arm] [PATCH-for-4.1 0/3] hw: Avoid crash when reading
 empty RX FIFO
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dI/Q5jQ+tFHz

On Tue, 9 Jul 2019 at 12:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Fix a pair of crashes, one is an audit of first one.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/ssi/mss-spi: Convert debug printf()s to trace events
>   hw/ssi/mss-spi: Avoid crash when reading empty RX FIFO
>   hw/display/xlnx_dp: Avoid crash when reading empty RX FIFO
>

Applied patches 2 and 3 to target-arm.next, thanks.
For future series, could you avoid including both
for-4.1 and not-for-4.1 patches in the same series, please?
It's a bit of a pain to have to separate them out again,
and there's always the risk that I don't notice.

(You'll probably want to hold onto patch 1 and send it
out again after we reopen for 4.2, or I'll forget about its
existence :-))

thanks
-- PMM
