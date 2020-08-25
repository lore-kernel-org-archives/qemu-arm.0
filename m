Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3527958lfy;
        Tue, 25 Aug 2020 08:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznoY9WVV+vaCH9mtT1qfajD7JZeSQjVj+nI/NtXXjNF7J7e6JfKq31S0HKldDHc6xwlIHo
X-Received: by 2002:a67:2787:: with SMTP id n129mr6056286vsn.219.1598368724310;
        Tue, 25 Aug 2020 08:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598368724; cv=none;
        d=google.com; s=arc-20160816;
        b=XBOtz8X38qhLugwdiItNOxEShI7BgM5Is64QF2lRl06bIMe8N0G74Nz8aN4IdIwDfF
         n3c+8ERsezxjc1hfDURebPf3icHPaXp0RA3mFRs+xlecF4MkbCEzDEwBXnfuwJ4OKosg
         tbNpLxsvdjcbz7mCekIZv9hOwGcB0lK4UEsvgKlqLBhzagfYR8kuc9D2HfQBUxjLSR26
         IN2Wwax9slmotWViPKEfOtnheFYaGTGEWnO//e0kWxABBDSFTJe0D5PaDdIRJSU8Cac/
         DfGp0d83wxJZTD9ipM22eocftSXB84EG2nQqhs9VRAyUYNbQuVvjyb/HWzEMVV9d7/c+
         un1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GD8vABY/m9QvuX/7MfAI9rjpW0f+q+G1T72CQzvCM8o=;
        b=VEC2C75jV7MhT0fkbSMZAwizzGxX5cakwd3fCRm/D85KahqV2gJDKNHlZMVj8FF6X9
         V2paqyqCXIhAWXMciN4mNd4Zen+LAbBSbvsYfka26J+3yLEwCEG5fd69N4r+0YWogRhO
         Rw9RPIp+clTDs7CKQCsfPLIeAghVF3PeSWmJjVhj9JitFj57f0YYCJQllLHKSUkB/DYO
         GNS1uLhPWfaIEp6rZyKVr6Y8XXWTMR6ab7A2h02W8QwfAzFSoYt+QfioRI9k3GLg3b2C
         ogrghxtpZbaP+4gVSea+PThR5KY7mGkncqs6jBnXpfOBCXIgsnYDb/vE3iMl59kD1+4O
         2iKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=urgY6okH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si2245505uad.77.2020.08.25.08.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 08:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=urgY6okH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAaih-0006qC-MN
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAaiS-0006pe-Ck
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 11:18:28 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAaiP-0005Nx-Ux
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 11:18:27 -0400
Received: by mail-ed1-x542.google.com with SMTP id v8so1752790edl.7
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GD8vABY/m9QvuX/7MfAI9rjpW0f+q+G1T72CQzvCM8o=;
 b=urgY6okHsz2cfxzlbzzCT+Bw93aKTAZ0X3EBVvqULrDq1WiqGUCwzbBoyaaYPE+dLG
 FU5vMaxEaHYrPyum2wrOm82SMpl3+3wlvw0UI1SOuWbVhG2nE5zQOcSmeAcTNjn1Rn6n
 hwoqjKnVuP7bRJ0K0RxXBXFG40sEJFcYkSQaniwNX67+mHXuldztVeCAXNL7BiUzToTU
 HxIdlgseSurPztsWr1lvQpl8HBmPFy3Yx8NKLsESIKdk4FpYABCyO6Wxsi1bUo6nLnjR
 6OiyftW5SyhEtSvddDs/LBy+YNZeSXDRtflNKyVwtJs5OezWDXKbEhw1oIGHLV5NSfPA
 L4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GD8vABY/m9QvuX/7MfAI9rjpW0f+q+G1T72CQzvCM8o=;
 b=Mke62O/YF1lzOQVBB/WJWmaUfOfb0iBdUNMA+kGpQMQ2woU1yKZWytgrdh24VsVQ6j
 FMPfr9lNVaHpSFGIJMN908VjwFA63bRZDsefrEtxcJ99zFsILT6qXGZkGJ+IbwWzzK6e
 Ya4ndYNmceaTsXGaJaz1P+7hkyuiBbIIErYvGya/DSPnL0vFFqFgLWwExuo4qnrZmRRV
 L6offYfvD58Z8i99Tp9AZNI4jQLcwOMn7XSBwERFHL4vqZOf5TlQVhewbMAkqwbDAyUO
 apNlHnc0El0YwCozD713eVG9O+PAAf5UYEBgYmNAjM983ySdWDBTAmm1O3qw5qMWYtLT
 VDWw==
X-Gm-Message-State: AOAM532dSCisYCwvaHqGAOlBnUGTQFNMP9642yDVoDNwwig58rcjhqSk
 8ZjZwg9pL/NvOiwypBtIieZ6i+xNSItbaAlx02p7JQ==
X-Received: by 2002:a50:8f45:: with SMTP id 63mr11051082edy.52.1598368704299; 
 Tue, 25 Aug 2020 08:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200819100956.2216690-1-clg@kaod.org>
 <20200819100956.2216690-6-clg@kaod.org>
 <CAFEAcA_GwY5qqLFYcttobLRnt_b=HoMNHMXEZrDHyRZJ4mjGug@mail.gmail.com>
 <CA+MHfou4eE3wYCMv4ojLSnnUeffKy73V6FhpaBC551bsfkqa+A@mail.gmail.com>
In-Reply-To: <CA+MHfou4eE3wYCMv4ojLSnnUeffKy73V6FhpaBC551bsfkqa+A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 16:18:13 +0100
Message-ID: <CAFEAcA9e=wbzXD8-Fim7JE4etNc0kmB5_Uuh7=q3tUa0vmk__w@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] hw/arm/aspeed: Add board model for Supermicro
 X11 BMC
To: Erik Smit <erik.lucas.smit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2mzv3k4Yxi08

On Tue, 25 Aug 2020 at 15:37, Erik Smit <erik.lucas.smit@gmail.com> wrote:
> On Tue, Aug 25, 2020, 4:33 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> On Wed, 19 Aug 2020 at 11:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>> >
>> > From: erik-smit <erik.lucas.smit@gmail.com>
>> >
>> > The BMC Firmware can be downloaded from :
>> >
>> >   https://www.supermicro.com/en/products/motherboard/X11SSL-F
>> >
>> > Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
>>
>> Should the name in the From and Signed-off-by: here be
>> "Erik Smit" rather than "erik-smit" ?
>
> I don't know if it matters. I'm fine with either.

It's supposed to be "your real name" (ie not a pseudonym,
email address or username); obviously for some people that
really is a single word or all-lower-case, but I usually
check because separate-words-with-caps is the more common.

thanks
-- PMM
