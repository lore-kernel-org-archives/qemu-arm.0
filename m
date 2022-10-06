Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp488738ocb;
        Thu, 6 Oct 2022 06:45:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7HodUDlTbcfrq2Qt4hWn0zad60PBS20OzRiRWvJGNu5//aJbws08w3fLclD4zEKnPRz6py
X-Received: by 2002:ac8:4e4b:0:b0:391:f480:bce9 with SMTP id e11-20020ac84e4b000000b00391f480bce9mr3352586qtw.675.1665063935327;
        Thu, 06 Oct 2022 06:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665063935; cv=none;
        d=google.com; s=arc-20160816;
        b=XIm00mxuOCxVltU7qGenvYpU7qcH/GEoTogKv6byPGgfDg+o2ZWdbe19YlpVVLUivO
         GgoZo+Wa/E2Nq4kyqzbTsdmCzXoDqL+znAAlwH2XexowoLUhImIJ9Wmd5num7x+2h/XK
         j1VagRrINN79vtc+ugQjnlMENXBzKf2GWv0s47QdDDuKrUCEubecYyy8fJgb1B1d6XNL
         iNI+qAYwMxkDZTdBVtm7sBAYNbvDXbS1G0NkVwVGONiPj7NtrrwaqqpgQf1wOW4our3C
         ZLjQwm6PeRnSLaxSbqYH3ioWGZ4DbBfZ+0d7a3eXyhRpXbVeYlZ3te/GiRavD2tmvQWZ
         4Tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id
         :in-reply-to:date:subject:cc:to:from:user-agent:references
         :dkim-signature;
        bh=0honL3yhGxZjwVIvnFLFUOcj27Wgyg+3tbvpoLHhN9k=;
        b=Tg1rCG4U0CMqlM4dJoJJkjVc6cmSsiZ3d4fsGsmAQb5mJv9jfNbgj/8GVvrCPltWLv
         PErLQoltNWzhQwCa66qL9xFC3o8U8uR1GXi6CYDQ1tk9qQWEmtqrH+Cwu6tBrumb6TWx
         rvwpZvSKUDY2FkxOqLyNQ3kr3dyH/VZu3YLADI4+eDuSS+Zl4X9/SKj/qQw4Hz9Ho2g0
         mkviDcw4gLbqiU4s3xEZzS32yHvGR+jz2u09t/IuLaq4hiuLoUSTYhRNptmMOHsRcU/c
         aAxqytWBRIllX+mwS2U5RdElVKTg0vd2wEKY3tAolJimswUufuy+usqeGE4/2LHWUGgp
         jooA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@tkos.co.il header.s=default header.b=IYdJaxhV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=tkos.co.il
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p73-20020a37424c000000b006bb677b8396si7084449qka.193.2022.10.06.06.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 06:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@tkos.co.il header.s=default header.b=IYdJaxhV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=tkos.co.il
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogRBu-0000HN-SV
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 09:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogOw6-00073h-7r; Thu, 06 Oct 2022 07:21:07 -0400
Received: from hours.tkos.co.il ([84.110.109.230]:47914 helo=mail.tkos.co.il)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogOw1-0006d8-Hk; Thu, 06 Oct 2022 07:21:05 -0400
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id C1FB1440072;
 Thu,  6 Oct 2022 14:19:03 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1665055143;
 bh=dC3jzoD9auFoIHAZd8QJL7uy0WTrFUZalGXvAp4PSFM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=IYdJaxhV8Vm/j5vZ7q/2y8HzQfJDuM4MXU5uc29agKfbJkyQgbq0K5QUFcUJ1orvo
 wkQCSLZuLmTqfHcqsLuu7H721fIGIp1sBjQ04dqPcXqYP3LbiXa3CVSsIVNyww8rVl
 6mb4tboKe1k7eLtKBCFU+UG26JrwpdkO8g6ihEmw0X/nxcAN73BjRDFMSTls1YM1N8
 4XhCUaF9UiQObpvqv+cs1doMmnOHLu5mW+rooPP+uKPE08eGShKWuT6s7S8BtvhajN
 6g8q3r+QXN+xT2UqQ3+1BTKC9sgo5HEP2Mz7UMGh4kplZnDcwUEnR0r26MI2bDkHGC
 2GxOL1bYrMB5A==
References: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
 <CAFEAcA8fbToN9D4cm=2VfaUn3GHyYZhbETa3CY-Y0-2jqwbYcA@mail.gmail.com>
User-agent: mu4e 1.8.7; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/char/pl011: fix baud rate calculation
Date: Thu, 06 Oct 2022 14:12:43 +0300
In-reply-to: <CAFEAcA8fbToN9D4cm=2VfaUn3GHyYZhbETa3CY-Y0-2jqwbYcA@mail.gmail.com>
Message-ID: <87tu4hci5m.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=84.110.109.230; envelope-from=baruch@tkos.co.il;
 helo=mail.tkos.co.il
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Oct 2022 09:20:06 -0400
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
X-TUID: iEaH5mo/gWjV

Hi Peter,

On Thu, Oct 06 2022, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 11:20, Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
>> when this is the case". But the code looks at FBRD for the invalid case.
>> Fix this.
>>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  hw/char/pl011.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks for this patch (I'll review it in a bit). Did you find this
> because it caused problems for a guest, or just because you were
> looking at the QEMU source code? (If it's the former, we like to
> include some details of that in the commit message.)

Initially I only looked at the source code while trying to understand
how clock initialization and use is meant to work. Once I figured that
out I confirmed the issue with ATF code that first sets IBRD and then
FBRD.

Before patch:

pl011_baudrate_change new baudrate 0 (clk: 100000000hz, ibrd: 54, fbrd: 0)
pl011_baudrate_change new baudrate 115204 (clk: 100000000hz, ibrd: 54, fbrd: 16)

With patch:

pl011_baudrate_change new baudrate 115740 (clk: 100000000hz, ibrd: 54, fbrd: 0)
pl011_baudrate_change new baudrate 115204 (clk: 100000000hz, ibrd: 54, fbrd: 16)

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
