Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2607506ejb;
        Sun, 4 Jun 2023 23:59:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6U8k7WH8ck5Spk3x92uh6h7du4zrYgg6pDzD0POBln+jyrxKBEjHW0cLS7M9Nf7UBRoWiX
X-Received: by 2002:a05:620a:6841:b0:75b:23a1:832a with SMTP id ru1-20020a05620a684100b0075b23a1832amr22644255qkn.37.1685948381489;
        Sun, 04 Jun 2023 23:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685948381; cv=none;
        d=google.com; s=arc-20160816;
        b=GUzgOypX2uhhERQrBGEO6DbhgNd/3NatGXdcChKKim6vTRXQmo0M1LuQSmYhoI7hM1
         Gwq/l8pKKyrqsrEIOjbH5kE6zRHr+GshGSXtXH5H8eC2NfSS2rp6APkdsRoF+o6iMB/B
         bBsDNK2BBZBVRBj/lQE4QX2jx+lIhhrYN5LIDdHJvR10zogI8m77vAO5SwvOTibAZgLt
         EpsN9e2G6BJOlumd5sR4QiWTtlhqt868nsiRPsZOwRUOC4aoQW25vMjQ3ojA0BOppTu9
         C6sQeHvJqUBJMrzLHdZ0Mh6w4joRH1SDr6Hx+ATw9CFaZiSsev29AHcm3TO6E1HN+S07
         ZDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=cWL8JhpuC2NXntSVDQeoU6AycbQ8o25DAL0aUorczPA=;
        b=WdtqsFKfPp6aXJN2UWSrENsRrpwUEWYmVJEw8Eo3L/jqatmkrWf9GE0iuBVetwfqa0
         qTwRFMgOYYc6ah/uCEsPZXPb5FUEvLFVw4b+dgGmFYPAN/exfJxOmVTER1sf7ziDk97k
         oSWHkQSiXV5dnCobk/RjFVSmUPtXFN7+groIOS4OLkd5dFjPr12L/a/0swKUK3t8NOmq
         NTvrNiKK1iY6fLhTN/OhmOKa3PvYL70HOUpJpzDBehSqLu+oq9cf9mSNbVmEshJaj58D
         2jF85r3WJ32+iHEkzVGFhWwr0EKVhpwlCnmEUlkQaFOQzosaRzHupHyuttnJIZ6YXYBc
         K/uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=jFgl9bCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05620a15cf00b0071d5008ce4esi4059172qkm.210.2023.06.04.23.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Jun 2023 23:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=jFgl9bCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q64BF-0006tI-Oq; Mon, 05 Jun 2023 02:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q64BD-0006s4-8U; Mon, 05 Jun 2023 02:59:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q64BA-0006RA-LL; Mon, 05 Jun 2023 02:59:02 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-977d4a1cf0eso138936666b.1; 
 Sun, 04 Jun 2023 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685948338; x=1688540338;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWL8JhpuC2NXntSVDQeoU6AycbQ8o25DAL0aUorczPA=;
 b=jFgl9bCUAMXIG17REV74pBeY6eO95h9S6G+HGaeAvVsYf0lIyj+aJax43+lklaYy5s
 S6Vg29Yjr4RJCsF903aIjOlDbNrCMoBelBY3kuNTt5sL4tau1mzdWq/sd7+cd0rO0l4i
 1LB27mg+aBuftvZq6VNNhN9NnXjL+izb9phiH3TrT96VR0Z9FgZ+yh10f8U7eXQFE31J
 v5cb+vcZSxiyW+Li161GcqWOajl7MxtWKZXNKnM8fSB3l0w6L453mI0+POgIZSGTgfTX
 DAuchCk5H5gGbcrM1kXqjucS8i/rgjlQ/AtPCB634YUKByLMs5xn9sL6VLd2uDDF7Ffc
 MGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685948338; x=1688540338;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWL8JhpuC2NXntSVDQeoU6AycbQ8o25DAL0aUorczPA=;
 b=LQAX0H8KWR9+LDIFflTWbUyLBnPmiVNpRio9XicpGE13OKbLsGfxhxl6gTLKwGACC9
 9DXonR1mcRAAB1Cjb+URvojGSLHxkxO7/zp8ct4mBCtGWZH2BUhcj7oZylKVDLzSOLKd
 oTH7PDc07zLSeyn8cTDFd7R29wBF194ATG8bjX8rsI/OVRLQ+WHLSVNlx12Xq8yHgpax
 xtD5tCG1xpZq2MDwzAxwrcFadcnHOcnFr+flQfAydUNhOdFT7vX8iPYLNCbjbsVzW0Li
 2SoZyzKxUvF3qEgzy4O4cBwE40u9wbP+ZqWr71eoacEoDuO2qgJz8NgbBugs0lLeUHoB
 tXYg==
X-Gm-Message-State: AC+VfDw9Z93Pe2wXh1MpBrigS6oKk0cP/4i//XlYMuJpAKi95hY1dLY6
 UmantLnaLuwUrEGPA4T/0J8=
X-Received: by 2002:a17:907:6d29:b0:977:d96c:4394 with SMTP id
 sa41-20020a1709076d2900b00977d96c4394mr1937129ejc.73.1685948337813; 
 Sun, 04 Jun 2023 23:58:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-188-226.89.14.pool.telefonica.de.
 [89.14.188.226]) by smtp.gmail.com with ESMTPSA id
 ks2-20020a170906f84200b009534211cc97sm3889832ejb.159.2023.06.04.23.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 23:58:57 -0700 (PDT)
Date: Mon, 05 Jun 2023 06:58:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/3] Trivial cleanups
In-Reply-To: <5982629b-0ff1-2525-e16a-309257710a20@ilande.co.uk>
References: <20230523195608.125820-1-shentey@gmail.com>
 <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
 <20230601080655-mutt-send-email-mst@kernel.org>
 <5982629b-0ff1-2525-e16a-309257710a20@ilande.co.uk>
Message-ID: <8187BA4B-5031-4AC6-A94C-27AB714C850C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J9CR2QkX+5b4



Am 1=2E Juni 2023 12:45:47 UTC schrieb Mark Cave-Ayland <mark=2Ecave-aylan=
d@ilande=2Eco=2Euk>:
>On 01/06/2023 13:07, Michael S=2E Tsirkin wrote:
>
>> On Thu, May 25, 2023 at 05:03:15PM +0100, Mark Cave-Ayland wrote:
>>> On 23/05/2023 20:56, Bernhard Beschow wrote:
>>>=20
>>>> This series:
>>>> * Removes dead code from omap_uart and i82378
>>>> * Resolves redundant code in the i8254 timer devices
>>>>=20
>>>> v3:
>>>> * Drop TYPE_ISA_PARALLEL since they became obsolete by
>>>>     https://lore=2Ekernel=2Eorg/qemu-devel/20230522115014=2E1110840-9=
-thuth@redhat=2Ecom/
>>>=20
>>> Oh I didn't see that this had already been merged :/
>>>=20
>>> It's not a reason to block this series, but I'd still like to see your
>>> changes to ParallelState and ISAParallelState merged separately since =
they
>>> are a better match for our QOM coding standards=2E
>>>=20
>>>> v2:
>>>> * Export ParallelState and ISAParallelState (Mark)
>>>>=20
>>>> Testing done:
>>>> * `make check`
>>>>=20
>>>> Bernhard Beschow (3):
>>>>     hw/timer/i8254_common: Share "iobase" property via base class
>>>>     hw/arm/omap: Remove unused omap_uart_attach()
>>>>     hw/isa/i82378: Remove unused "io" attribute
>>>>=20
>>>>    include/hw/arm/omap=2Eh   | 1 -
>>>>    hw/char/omap_uart=2Ec     | 9 ---------
>>>>    hw/i386/kvm/i8254=2Ec     | 1 -
>>>>    hw/isa/i82378=2Ec         | 1 -
>>>>    hw/timer/i8254=2Ec        | 6 ------
>>>>    hw/timer/i8254_common=2Ec | 6 ++++++
>>>>    6 files changed, 6 insertions(+), 18 deletions(-)
>>>=20
>>> Do we know who is going to pick up these series? I can send a PR if no=
-one minds?
>>>=20
>>=20
>>=20
>> Go ahead:
>>=20
>> Acked-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>
>Thanks Michael! Is there any objection to also including https://patchew=
=2Eorg/QEMU/20230531211043=2E41724-1-shentey@gmail=2Ecom/ at the same time?
>
>Bernhard: if you are able to submit a rebased version of the ISA_PARALLEL=
 cleanups at https://patchew=2Eorg/QEMU/20230521123049=2E312349-1-shentey@g=
mail=2Ecom/ I think it is worth considering those for inclusion in the PR a=
s well (note the comments re: an updated commit message and register defini=
tions, but I can't really do this myself because of the missing SoB)=2E

What could I put into the commit message?

I'm also wondering: Why export the structure but not the register definiti=
ons? Are the register definitions not part of the interface? I think these =
could be used in unittests -- if we had any -- to avoid magic numbers=2E

Best regards,
Bernhard

>
>
>ATB,
>
>Mark=2E
>
