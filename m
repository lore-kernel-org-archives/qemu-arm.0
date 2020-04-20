Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3597033lfm;
        Mon, 20 Apr 2020 02:03:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypIir989OQYQxnVayjFpB7DpmFmqRJyBSnz9EG53cq1mBVmbPsdCL1cr6uJ7einrXfVG/qOm
X-Received: by 2002:a37:a407:: with SMTP id n7mr15347542qke.235.1587373412523;
        Mon, 20 Apr 2020 02:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587373412; cv=none;
        d=google.com; s=arc-20160816;
        b=gUnzCaedVrGPbOu9HRVchMhMX52smKbkIZXS35GH7CQQh74L6hF3Rr83XpSv5BuPYa
         PSgtNiwzgLzkjkZ+HGUcdgMsCcIEdGdR/32hdt18DAsfgYEzIIWp6U0ACfof+fnEYgyL
         G+iKbqQ0sHR+rO9XsE0KbhNeNJOEnT4FtzWPmEHiuYTyJ3lHGSiAMfQIFfytShVu75aw
         uMM8p4J9UiXAy2xaK1KgpktEKEY9IwM+wHcEIXHlLjVXyrHLjSzFZ3nXkQBDlugbvspt
         byw7veuVCxPlsJHFDpsSmQyTXAw/j8QDw9Imjedh9GNQltPJYQEN8SiImhUVNOxhufCS
         D9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmDtXQVBA/J/84N0HPePEXf/5fmclCdstH2yA26a3ag=;
        b=NeGzW1LKe67X3uriPVJghfDVbWsUrSIhmwdaNjmDJf+W+e0PS5E9gKG2ls6aQzjq2P
         HRZDtzVZjQWY29geRVlgP+sxJQI93DlsaP1guPYzFI2NKfamcY5Yyd/mxOFr9quEkAFF
         T3kitLiKKd7UeFPqUW48Rjblw7vw3uS1GASqU8UtyIrSy8EQaVMh1upSK394S3BIRtmC
         dCSLw58ie1thNVKhRfuUvp4krTH70hEkEa3WcJtgZDaiwcQn1I/5G3WapET0TkCRnw+m
         lyY5ZzLATf6V702eNBrlIaYCQwRhwvaBe0av8lVcWitYcBPkXiiSmas+phc9i9oxt2Jx
         f6HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k69KqVa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si197348qkj.24.2020.04.20.02.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 02:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k69KqVa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQSKx-00008q-Tp
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 05:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQSKg-00005t-S9
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:03:16 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQSKg-00072x-Ek
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:03:14 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41880)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQSKf-000711-Aj
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 05:03:13 -0400
Received: by mail-oi1-x244.google.com with SMTP id k9so8116270oia.8
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 02:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pmDtXQVBA/J/84N0HPePEXf/5fmclCdstH2yA26a3ag=;
 b=k69KqVa2Qt2GbpDUHyDTA+ycMWvzQLdwbKzm9ReZk6VzS1tXfH9QKP0AYFRk3WibzH
 dnU8Yjcssy+fGqRXnWomvKLjn/o3jEd35GAwEOE8vL4qV6gX9Gdqu9paK9oVA0phHIKx
 JcXLkHKdXFZsES6QrYkvJRuS3Y5dvG7izCWBSsLpU4SAzm/LCRHOVf+S1wOLTKRihFNF
 D5+5UUbkHpifwddtan+3XAdR6pCptlGp8w1yYv8FRUlWbyZXFRwfJ8h5kj/tzmDsQq4y
 OTZ9HveMy2bIjYqWxDEoDzBY/RxMsIxguHSdxvW0iBPuRvxl9PIOdWS0cSncrV9Vd4R7
 w1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmDtXQVBA/J/84N0HPePEXf/5fmclCdstH2yA26a3ag=;
 b=OsPLt2gQJyqozMiATd+L6K5DguOAzKMwi2PuWA0HYlKrFZgTWiuuCITnNjWaKaVmRc
 5sSXn30TQnObOfLjtrGn/YnitEPi/6XCYAhCyJAfDZRlzZ7KPn4tpppeIWqvwowJVUYN
 MBvP7SHfCCoAtnBBxIjjAXAku1RYL4cQeA3dhCFPWH3MeM0A4kWJHksDLIH34UTFif2N
 VtQXDb4SB00bVEaN8GNOPdKgMOW09VL4QxeQ5MtDi79Si/vHxc05m+R5/Zz2UXeOr1Ew
 /K5OQwQol9Hrh0Ef8vNNXNOFC+Yzng8/2xsv6C3Zk4lrLOHfspTMYtAyKpPkIPc+z8KP
 1CdA==
X-Gm-Message-State: AGi0Pua5Jirq47LK6xIhVhz8FrlZPlCkwnwqYZQZrRodxCnNUTwk4E9s
 wwUmny6a1O1O1jSgcogTRceyCbsu08JlPDLeSm4fug==
X-Received: by 2002:aca:dc56:: with SMTP id t83mr9321432oig.48.1587373389863; 
 Mon, 20 Apr 2020 02:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200417153800.27399-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200417153800.27399-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 10:02:58 +0100
Message-ID: <CAFEAcA-F0Y+_XWCgBhaHxk2V_MwiSRSp1oTX+KeaJYnP+A0A0w@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] hw/arm: versal: Setup the ADMA with 128bit
 bus-width
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hFnhUG5OSYc

On Fri, 17 Apr 2020 at 16:38, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Running more testcases on the upstream models I noticed that the
> ADMA was not setup for 128bit bus-width causing some tests to
> fail. This fixes that.
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (1):
>   hw/arm: versal: Setup the ADMA with 128bit bus-width



Applied to target-arm.next for 5.1, thanks.

-- PMM
