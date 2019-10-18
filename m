Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1023433wrm;
        Fri, 18 Oct 2019 07:53:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDf0vdP34ztylZLbDu9MNR8HtsMNAY0L7njyXCPlyccdqKxMdgszD0aQFOd9aTRJpwXe9K
X-Received: by 2002:a05:6214:14b:: with SMTP id x11mr10260082qvs.195.1571410426794;
        Fri, 18 Oct 2019 07:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571410426; cv=none;
        d=google.com; s=arc-20160816;
        b=oycavqBHPR/EQ85kerLIXx4aFjiC8rBjBNGSZ1u4o87wBn9/+7IKveQMUDvQrdgqDl
         siDtabePDz0Yb+1MXCARM6gzk18Uef+gXwsVFzceiJkEj0wKHr8gEp9g1brIOMMwRVvG
         UrBOTUI7Q70WVkhjDxX1Akubi6XamIiChtGUsJPCJhhr8RaqaPSsWaGNp7iimoezPJbM
         v/Vko0MQrC+14fcto9NG62o+Y9mpuwDEXXHQgYtD/17swNb0CM/llMEnjfotgIdoTLpf
         miKONSQCbGNzOYuO5cfrhJxdHv6Ie5hPFDKTUqV/FA5VTEGP2o8QX7KM35POFk+aYi8V
         qK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLHBysFJS0lfg0J/jMlw+h6ruLzMa+L66uzwj8PuqEc=;
        b=GcA++tLnfa6maIZtDH1ADYsxCbBqwxtbbVgzeGfxN+L+gqKUQcPwnV8VgrLKG5ZtBS
         eyVgMUO5waKy3e7Jp/korVJGqoNoK4etemBdw6sEMX+HDq5HYvplGIj8VYEay5kmdRHB
         5id6qvGBFFqObuWJOMZgH/NehGX54gjQr+5tHEa+VCPbb1TlhDiMX/0O/Ea7cUcLQQoC
         UQzC0CONrhEgN0XGGTYGcGXY9kKNTY0od3uQSZzjGc9M6Dd+mb4qrnupFK6y1IDHZcZw
         G6yhtypv4fdVYH/IZ3vXH2m+pPCpnGcnTNxEPcNmLvDRLnvLp0fUnSoXSwux9R04cgNY
         8YkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uHVDtRhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si2193908qtn.271.2019.10.18.07.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uHVDtRhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTdS-0003dp-5A
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTcB-0002cp-Hx
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTcA-0003Um-G2
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:52:27 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLTcA-0003UQ-BC
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:52:26 -0400
Received: by mail-oi1-x242.google.com with SMTP id d140so1133554oib.5
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OLHBysFJS0lfg0J/jMlw+h6ruLzMa+L66uzwj8PuqEc=;
 b=uHVDtRhQxtvRL8dMMEJzV8XujeNWDVNp/Qe9STqVBZlcid7jSRKGBDqgSmWqdNxIHm
 NQsxMcTC5yd+PvVFqD+NKCrexbdvadRe32QZ5AAui3fJpXlXEIxTAHsTNdmSpO91oUVy
 6WpWs6uJyuJVwS0Mr5mim/u5p8qmafImRFWwtezJCYYjkVjYAj8bbsX8GB2bJbP1QRRz
 eMPwC1XRnX7+2naVzczoZ7qUJTlD71pTnwMRNUy9U7/jRd+q+vvv1QtFTax0umWNVnH8
 436yNSwRqGCH3zG62gQmyfjba2wtiCXnwcGCidM+NYZprNQT+xmG6JjYscyvEGTlBsel
 H8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OLHBysFJS0lfg0J/jMlw+h6ruLzMa+L66uzwj8PuqEc=;
 b=s/phHMgzB+FrATVtd/Gmrrk3Bw5gNyycsvu5g2XQxjMjzp5FXV60u8yhYzZdgcBG+4
 1o5yyTckAdFp3QJoN/0ldGYqUD8mg0Dp4kQzcdraKf8vwVgoJN+CDwu5423bETM63rSN
 e+aT3JIRzMxuanyiROGyVfS+SWrI6Eg2P2Mg1lW1pIxo+LBXCcXuuwyXOF7YeUC7nNEB
 wXo0MmLvFbKny9Qz23KjfZBNtTmJqE/Vyl5De7WBDkNVjl3Fd46QIjnbcfSU/h4ljVtr
 RGINBFu2fti2uK6EcS61OyBpl4s5QNNiDLkXnGG8b3T2uNmApSzRXrJ+MUk6VnVDA8t/
 LpwQ==
X-Gm-Message-State: APjAAAXQo9xWpc+6vtnkVUtLcmqavVNL8c5x/vF9wzs0j4F87CI0zDuF
 LS0TZc/nBfMtZZbCiTxccHctpWo/NexNtr094Epq1g==
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr8462864oic.98.1571410345685; 
 Fri, 18 Oct 2019 07:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-20-richard.henderson@linaro.org>
 <CAFEAcA9oJ0P-g87caLKyT1mS2k7YhtNXAOhSgXuMy0bCGwX0WA@mail.gmail.com>
 <aa753ee9-40ce-d6c8-801f-eda74d76fd3d@linaro.org>
In-Reply-To: <aa753ee9-40ce-d6c8-801f-eda74d76fd3d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 15:52:14 +0100
Message-ID: <CAFEAcA--tmMXeFauHRAFeeLr+MXmQq4qcsoxpx1vOVM7ZuLoAQ@mail.gmail.com>
Subject: Re: [PATCH v7 19/20] target/arm: Rebuild hflags for M-profile.
To: Richard Henderson <richard.henderson@linaro.org>
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
X-TUID: oEpqdySjytq4

On Fri, 18 Oct 2019 at 15:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/18/19 5:25 AM, Peter Maydell wrote:
> > This seems fragile -- we have to remember to add in
> > a call to arm_rebuild_hflags() for every individual
> > case of a memory-mapped system register that we choose
> > to cache in tb flags. It doesn't seem consistent with
> > the choice for A-profile to rebuild hflags for pretty
> > much any sysreg write. Maybe it would be better to just
> > always rebuild hflags at the end of nvic_sysreg_write() ?
>
> I thought about that, but there were too many returns out of the middle.  I
> suppose a wrapper function would take care of that.

I hadn't noticed the early returns from nvic_sysreg_write().
You could just turn all the 'return MEMTX_OK's into a
goto exit_ok and have that do the update.

thanks
-- PMM
