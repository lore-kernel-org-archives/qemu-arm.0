Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp274805lfg;
        Wed, 17 Mar 2021 03:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7h7rG3pgfAh8P5kllPSQjkoOUe0fla9XVJmAHppeDrW3307ea5oFdAhsfn16PG2PZPBwV
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr3467915ybo.279.1615977651611;
        Wed, 17 Mar 2021 03:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615977651; cv=none;
        d=google.com; s=arc-20160816;
        b=bTeG3vX2V4sl6P0lQvJ2sy0RbAdMfEjSzJ1R0RZ+djNExknwWJ7eRfamk+3/iNJZGq
         fXmr4Q/lidnhErswdwoTT1u/5UHuA1z7EvZCVPhgJs8Kv+swN6KUGtJ156pwOFm1W543
         PCVk145gwJd32uUs5WtOWjjodgeGj98DDvw3cMQ9kUQTx2PJpc+7EuMTmzf3/bcs7CaV
         ZIkQkkioJIPqqPn+LmxCpDQc9QQVLot4QVP+3uJpf5Xd7MeXW9KqugtQ9/3mvnuyFOZ0
         kMNwxuy0ATlvvkphmsdNdp9N8KjL2KilCHF0yxaTIAdrZN5CF4HDRB4Qjto5ucIVDdNk
         +FwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO6DA/9RtWnpxx+P6uJyRpQ2n1tpRIoglDA6TlGPVcI=;
        b=VWKr+QJClZa2aC+Zvxp5dlFuCSsRQZXFoEmRFK9lyGugkxlGgXlJLdibYY8pfwVqRA
         VaBzQjZHZ+fMnoMngJjkGSQGqhKDHhJl4ZpN9cKyJWrQTzbSbc8fA5sg5h4dw8svqoWJ
         qXuDlwYdnd63XvHL+tsHNGlWF0+NAaq4qMGpb3/EPXXxp3x3g11rA6TYI2+oEup19OpW
         8APHoOdWtyDsbVpRUcNA8VGCrVCkAzzDH/Fb/bz46zA8fznb8fPBL6TSKMZIQnmvHtLD
         Lvb+Rq8tVu88YRswwxOYaeeGWA2cK0DlID163Z/zFKAacSD0EhB7MIApCFELc1hN2qEB
         SBCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KgrSSnPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si20271823ybc.68.2021.03.17.03.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 03:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KgrSSnPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMTbe-0004Td-V0
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 06:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMTbQ-0004S9-Rr
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 06:40:36 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMTbN-0001Z5-1u
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 06:40:36 -0400
Received: by mail-ej1-x635.google.com with SMTP id dx17so1788157ejb.2
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eO6DA/9RtWnpxx+P6uJyRpQ2n1tpRIoglDA6TlGPVcI=;
 b=KgrSSnPAjOYdvNpL+LIZej1A7O9GriQtKwjeVem25jqQPedouGRM6xWIx6bZyFJtcL
 SmjIrzrGvgNXfvBsQ3chNMoIpAv6xvkyyd7lmrqPPcF8FzI7q6wBFxpBqXO5Bk5mD+/y
 etiejBnevt5RRUgDgChX0DO4aCsbhHxltGOxi3sb51xCDJY6TE1ySgAYgJhkchsO8QXq
 G6fT2k5sRf4Zy4F/nni38FUsnkXA6ePp3D/n63nFuZyefbV5XP4Jqh0ARP1dnhkzTY9z
 NDEZXoOoyl093YWwCp2rorpb+GvbFmq0gyLXX1XQY0DKrKHBqDZvr19Vn5uMPvuYMpic
 iufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eO6DA/9RtWnpxx+P6uJyRpQ2n1tpRIoglDA6TlGPVcI=;
 b=OrQup7+f+FRS0eOuoO6F2SMguKKiaUn8zUb8tjgWURLhBCdMeHMQaNCJQRQcgMviSy
 iKuH1fySA9oMYZ5+bvx7yzGD2doY5l42rTbyPvzopaxUoRY+znSoYtI0M7TMNKpz3XL9
 2cnql02lQNLVwo+heCb1X0hPDDUI06X/8Ee4V85NxHspGR9D7eJ68yELsAA5geyxcmoF
 rHnTyPbPn28iTZKwbuHzyiyUHPHfHR3CGDilQcGfE7yY7GsqV45BQ+iL7sPTCATc2xEb
 Do/2dXwcZe7jT5BeO+Gc8JtggBf6+oPnpbcrh5oMJqG3978tolmzEyIE0wCcPD2nC9AC
 2UxA==
X-Gm-Message-State: AOAM530nGUR0alK20fgCfAKMmkT/Iqbwc06Rmq5NRiQp9jiBEXyvAEQF
 ADTZxSjZOTiVsuJdkda7r9JbTCF8tp/P24KdhiQVqw==
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr33889780ejz.382.1615977631613; 
 Wed, 17 Mar 2021 03:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
In-Reply-To: <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 10:40:08 +0000
Message-ID: <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vz9mZJOpRG0S

On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/17/21 8:09 PM, Peter Maydell wrote:
> > On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
> >>
> >>   static const VMStateDescription vmstate_pl011 = {
> >>       .name = "pl011",
> >>       .version_id = 2,
> >>       .minimum_version_id = 2,
> >> +    .post_load = pl011_post_load,
> >>       .fields = (VMStateField[]) {
> >>           VMSTATE_UINT32(readbuff, PL011State),
> >>           VMSTATE_UINT32(flags, PL011State),
> >> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
> >>           VMSTATE_INT32(read_trigger, PL011State),
> >>           VMSTATE_END_OF_LIST()
> >>       },
> >> -    .subsections = (const VMStateDescription * []) {
> >> -        &vmstate_pl011_clock,
> >> -        NULL
> >> -    }
> >>   };
> >
> > Doesn't dropping the subsection break migration compat ?
> >
>
> It's why this patch needs to be backported to stable branches.
> In that way, we won't have migration compatible issue.

No, migration has to work from the existing already
shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
the correct "virt-5.2" &c versioned machine type.)

thanks
-- PMM
