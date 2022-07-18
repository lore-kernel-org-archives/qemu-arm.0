Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1225660lfp;
        Mon, 18 Jul 2022 03:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s07Jkn6A8YcFH8zXynvmfkMrUO8HImlxld4Gz2wuGRGudcvp5+G0+g3ELgUAQvDTC/+HoR
X-Received: by 2002:a0c:a995:0:b0:473:4e06:af76 with SMTP id a21-20020a0ca995000000b004734e06af76mr19995392qvb.2.1658140789682;
        Mon, 18 Jul 2022 03:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658140789; cv=none;
        d=google.com; s=arc-20160816;
        b=YJfTcWc8CP0SKmEDcOsykwicDJh2tiKdwvji9eoJavm+awdbHJGzufVd3eY5vgEdcJ
         Q2fO6+x5nNhg+4+rDtkqBQrLNRTLBqOYEWk1RGDPzC+0Zh0sboNhYIAOL3ffOKtDQwRn
         mivHjBrNVxNK9exurdCgJgWXNl3Z1XDCteLVgvk9Ae4sZOmlr9NHosCNJFEijRVlPYys
         G2q4UPBsPURInAgZMXvVRRhEzwOXXtEB428fxsBRui+1gJCw8VztUAgrgnD5uuISBgNq
         7DV6NtH77f/Z2PApck+ewK0vZoqmXdcmryjt8MbQBINHhnNvY4n5yDXJvW0wRm8Y4HSF
         lSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rL4zHHaVlPgCZ4/qggrkbdJg65XrBOsNmaed0DC8l5E=;
        b=S6+4x3xE+GE3xGtB2bgpVPP9gpeEhPFgFqxGpvhTWpKePNzbpe/rRboacXLNM0Ow1U
         P0qtjKZOGEZFNItYh5Jz7v0mOvUbR17nIjDkbUGRC2PtuxkoYQZ1q72kRml3S74CQaZQ
         cPie2quWzYHkCHYUF/PJC2LG2sZri7PGILHAkWmQ5QFsjXCQLLU65/0rlvJ+JuQQpZvw
         GNZJ5WOuEj3ied2J1lVM5jkycNo+Brai3nVgRjos9eF3G6H9WbWogFus6/hMvxFHzPv8
         0Hk/TCaGv2nJKMwDJylsgGg/BdwPxF5vsTRPMw/ZWKQm3UQP3ckzIdPbNhL9L/JWyOa/
         7sfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoyURsev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020ad45f4c000000b0047323df3c82si4892061qvg.389.2022.07.18.03.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoyURsev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDOAH-0001rX-61
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDO92-0007o5-3i
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:38:32 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDO90-0002SA-F4
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:38:31 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r3so20030084ybr.6
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rL4zHHaVlPgCZ4/qggrkbdJg65XrBOsNmaed0DC8l5E=;
 b=SoyURsevO6Mah/hjFYBFhpX5yzTNRv+tynSgQclFldJm5heYoL76IeGHmJqQZkQD/N
 POZbd1QXpxcnujzwYMrUmCxzdrEVf6YduwMqjKEY2JuxKFVarFetD3Lkj9RmxpzHqWJl
 UAiHAJFq7QQojyBN26ZBHpC7wUf2j7NZVR4vAzXadRdiaHZpnNAKQnxC4ctWCwYJLxer
 3Cah4W7Iocem+BXZ4QUABqs/Dhg+KzayLNTK0jzVbQWlCho/qtCPUXPxWDX8gZg7V+TO
 jkY074H9OOYcNueENSWQ5MUUU5577wTnrfm0hmDGoW6InHGvCkvcWQfngwLBQknV81xl
 BgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rL4zHHaVlPgCZ4/qggrkbdJg65XrBOsNmaed0DC8l5E=;
 b=Grc63M/VTFBFOCmo3Kxo9U7S80pT8+Vat6eV1cILR2fAypgY8gl7hMSKF85Z0EBvax
 z2LxwTVdi1QikcZAsatYxrp/z13BFz5mG7WcGkdWLPvb6FW4v+0DesXY95FeLbSThkfK
 8WOvA7KWPA+vplMEP7+ZeI9O/EZ/658rOzF9t9hcJCPuffYE+G9o6Lzg8uCP8mREvsKS
 LaykeVIH7sw8L1RCliE15qNCe5W/pvFQ6FSGDyOyYtFE/ursJdMX+ypv8I2TJ9JMpJli
 QlSrho6rX6Swrn1NnVOMTuPUHQmk0cDAOidPpIrHYyJMKsm7b1ASUNfX5CXwdMdMhq38
 2r8Q==
X-Gm-Message-State: AJIora/4rilbZFOr2b22LRvv3zRopn+KA9HdeJj+/dC1kTLoyJ3mMZHv
 SBUyeawkGOTkTJBnQF8YXT5jplijPQDLjNsoFLaDyg==
X-Received: by 2002:a25:cb0e:0:b0:66f:7b31:3563 with SMTP id
 b14-20020a25cb0e000000b0066f7b313563mr26931443ybg.85.1658140709424; Mon, 18
 Jul 2022 03:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220713172010.39163-1-ben.dooks@sifive.com>
 <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
 <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
 <4e9c6fc7-54c9-9510-654f-4e41d849676e@sifive.com>
In-Reply-To: <4e9c6fc7-54c9-9510-654f-4e41d849676e@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:38:18 +0100
Message-ID: <CAFEAcA-2B7F7zzvSVnfvCzR__vUOV--DPJS-42=fmkLpdzy_NQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: designware gpio driver
To: Ben Dooks <ben.dooks@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>, 
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XQPR383iO9AW

On Mon, 18 Jul 2022 at 11:25, Ben Dooks <ben.dooks@sifive.com> wrote:
>
> On 18/07/2022 11:15, Peter Maydell wrote:
> > On Mon, 18 Jul 2022 at 11:05, Ben Dooks <ben.dooks@sifive.com> wrote:
> >>
> >> On 13/07/2022 18:20, Ben Dooks wrote:
> >>> A model for the DesignWare GPIO (v1) block.
> >>
> >> Is there anyone else who should be reviewing these that
> >> was missed off the original list? I'd like to get an idea
> >> if there is any work to do. I've got a couple more drivers
> >> to submit and was waiting on feedback from this before
> >> getting these submitted.
> >
> >
> > My overall feedback is: this isn't a pluggable device (PCI, etc),
> > so what's it intended to be used by? Generally we don't take
> > device models except when there's a board model that's using them.
>
> I have a board file, but that's currently under NDA, so we're not
> allowed to release it at the moment. However we've done a few drivers
> which we'd like to get out of our development tree which other people
> might find useful (GPIO, SPI, I2C).

As I say, we don't really accept those, because we have no way
of testing them upstream unless they're used in a board file:
they're dead code from our point of view. When you have a board
model you're ready to submit you can send them in the same
patchseries as the board model.

thanks
-- PMM
