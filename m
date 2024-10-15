Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp71306nji;
        Tue, 15 Oct 2024 07:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6oAnVbqRiJr0efirNVgCjJvd1YWOycTenlNC6SQ5cCPbg9iTlPT99xibAfNw1y8GCVMZNqiPgHpTcVg==@linaro.org
X-Google-Smtp-Source: AGHT+IGT3tKBbRecHqZVq0vG35ZRy8uKIUEI0RNZmSRdRS2htWC51xeQ7gpVToBjro6TWZ/G9mnd
X-Received: by 2002:ac8:7f4a:0:b0:460:3e50:5922 with SMTP id d75a77b69052e-4604bc2de62mr201213281cf.39.1729002898503;
        Tue, 15 Oct 2024 07:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729002898; cv=none;
        d=google.com; s=arc-20240605;
        b=PSQEZJDa8glRSLdArzNszPtm26mS3+CsYScHk4r61rheXVQgmHdqkxtNISmxVOGKHp
         dJsaDGR/Hap9Fz3bruTxM+MGYpFNFdjoYQPaSCU9VXCMSSEJpRsOqmyjlgVafhbzYEpl
         2O5RWdFJ/+u5iA4Bne4FzsOVGby9MramHQROZqp9l9THVYqu7Mz31/2iTy7/rb7kkMoF
         sUyYn1701ui2y/I2rRNODydCYqe/mudDlMqPVOoWaZIY5LHBTkvyMDzddJ+z5Hg/aLWW
         h7ugZQ7fNVGVCOdag80lKtrWv0N3gGQG0xd3UVaZvCwLhfGTRb4DSlC+wL2IvlBKkyTA
         +N6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature:dkim-filter;
        bh=pQ+//zyPjrbjIR7o2OZ2SNr6BUwBDomIyH0iHTZbzck=;
        fh=/Ocgt6CuIp7ufVoRkpSJl84nRt7bG8rVSKLkogVK4WY=;
        b=WVlXMMfC+dwT6AEPl0o1SJB0lPEWiP81f1y8yMTTqgRyd0CZWDZZsDub+Xf7BL28St
         xWo3mn8yBeOv4MINXTPYpu+XaE5H0/vsvpRzF+8cRG8JusVKn45bIWtzjSsTrrSaxYcK
         BXk0T8lK1qxJiYvFP3xSboxBgSXhrqWvmbN1WZ/i4DcfGXVowmJtUckpCymVQbKcELrz
         ZDj05r2uQJnxsgY6sOwCSfOpwQNW2P7J1LC8ilkuJm7qmCwenssHd2R4tWhMkDREHCaz
         t3/3bnZ5vF/UTYSUuT4Q7kYCpbEpI5Se3qcHLrbH46LjohsfZVLGBoUGxvUEJiCHbTZI
         0I4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=TWKLF4fu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4608941b6e8si4755971cf.228.2024.10.15.07.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2024 07:34:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=TWKLF4fu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t0idB-0004SZ-8Z; Tue, 15 Oct 2024 10:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1t0id8-0004Rp-5x; Tue, 15 Oct 2024 10:34:34 -0400
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1t0id6-0005LP-Am; Tue, 15 Oct 2024 10:34:33 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 6CC46A0840;
 Tue, 15 Oct 2024 16:34:26 +0200 (CEST)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id AJy_xfe6odRP; Tue, 15 Oct 2024 16:34:25 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id BCA1FA0602;
 Tue, 15 Oct 2024 16:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr BCA1FA0602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1729002865;
 bh=pQ+//zyPjrbjIR7o2OZ2SNr6BUwBDomIyH0iHTZbzck=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=TWKLF4fumg8MAufG16cz9K5OETw0+sdUGK3mxprj2WV/MfFAJKt0JKjzwaUjSKAO5
 ImVF5CCZwAzWn6nfFJkpS0xN3R3fXAoa4/UjBfAO8AcVLA1cVTFkYmw2dSM4Sf2fSM
 vkIs7UT65Up1QxGKTdPNBKjI4V/HlpcLnwOTRLPA=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id Hnuvo_AQ9Oui; Tue, 15 Oct 2024 16:34:25 +0200 (CEST)
Received: from zmail-tp2.enst.fr (zmail-tp2.enst.fr [137.194.2.199])
 by zproxy3.enst.fr (Postfix) with ESMTP id 39464A0889;
 Tue, 15 Oct 2024 16:34:25 +0200 (CEST)
Date: Tue, 15 Oct 2024 16:34:24 +0200 (CEST)
From: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
To: peter maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc@lmichel.fr>, 
 qemu-arm <qemu-arm@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Samuel Tardieu <sam@rfc1149.net>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Laurent Vivier <lvivier@redhat.com>
Message-ID: <698508180.2421226.1729002864954.JavaMail.zimbra@enst.fr>
In-Reply-To: <CAFEAcA_0eyAa=XjDnobYqkinEnW1wOetKDBqus7k1BTWTyLLpQ@mail.gmail.com>
References: <20241003081105.40836-1-ines.varhol@telecom-paris.fr>
 <20241003081105.40836-4-ines.varhol@telecom-paris.fr>
 <CAFEAcA_0eyAa=XjDnobYqkinEnW1wOetKDBqus7k1BTWTyLLpQ@mail.gmail.com>
Subject: Re: [PING PATCH v5 3/3] tests/qtest: Check STM32L4x5 clock connections
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:861:4680:b1b0:b400:8d99:1692:e69c]
X-Mailer: Zimbra 9.0.0_GA_4653 (ZimbraWebClient - FF131 (Linux)/9.0.0_GA_4653)
Thread-Topic: tests/qtest: Check STM32L4x5 clock connections
Thread-Index: 4f/g2E/kFYRd7h99URcQ2H0ATraGUw==
Received-SPF: pass client-ip=137.194.2.222; envelope-from=ivarhol-21@enst.fr;
 helo=zproxy3.enst.fr
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qL+sfVNsJSTV



----- Le 15 Oct 24, =C3=A0 16:20, peter maydell peter.maydell@linaro.org a =
=C3=A9crit :

> On Thu, 3 Oct 2024 at 09:11, In=C3=A8s Varhol <ines.varhol@telecom-paris.=
fr> wrote:
>>
>> For USART, GPIO and SYSCFG devices, check that clock frequency before
>> and after enabling the peripheral clock in RCC is correct.
>>
>> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Luc Michel <luc@lmichel.fr>
>=20
>=20
>> +static void test_clock_enable(void)
>> +{
>> +    /*
>> +     * For each USART device, enable its clock in RCC
>> +     * and check that its clock frequency is SYSCLK_PERIOD
>> +     */
>> +    QTestState *qts =3D qtest_init("-M b-l475e-iot01a");
>> +
>> +    check_clock(qts, "machine/soc/usart[0]/clk", RCC_APB2ENR, 14);
>> +    check_clock(qts, "machine/soc/usart[1]/clk", RCC_APB1ENR1, 17);
>> +    check_clock(qts, "machine/soc/usart[2]/clk", RCC_APB1ENR1, 18);
>> +    check_clock(qts, "machine/soc/uart[0]/clk", RCC_APB1ENR1, 19);
>> +    check_clock(qts, "machine/soc/uart[1]/clk", RCC_APB1ENR1, 20);
>> +    check_clock(qts, "machine/soc/lpuart1/clk", RCC_APB1ENR2, 0);
>> +}
>=20
> This new test is missing the qtest_quit(qts) call at the
> end, which makes it hang when run on OpenBSD. (I fixed
> this up in the pullrequest.)
>=20
> thanks
> -- PMM

Thanks for the fix!

In=C3=A8s
