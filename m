Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp48958lfp;
        Fri, 15 Jul 2022 00:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sY6kqNJCu29FRY6AsYcTpGekuBcTCfkIahpT8BBmmcbGC52eBBd568ZCkwiAphL8ZGTyIV
X-Received: by 2002:a37:8085:0:b0:6af:2170:6aa1 with SMTP id b127-20020a378085000000b006af21706aa1mr8508931qkd.387.1657871502719;
        Fri, 15 Jul 2022 00:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657871502; cv=none;
        d=google.com; s=arc-20160816;
        b=kcIcy1bI1pmtD4DUpfCLixmURKy5pDQRiN4iab8ZCcJeionjyDH/GreziDKMyJRmVX
         NUmEeQkjE5VHMMHbePI1JodwlEC/0UZzP94qK+E1rGEOKZnVxGSi0nacAags85R8CINR
         6Qh/0a0grBLDarJSSLK2gbcH2irj9dPPCgISLjpAVsJaySNMikSP5kjiWimjzbQP1gwt
         W+QKQA1SVjIdWLEcPk/j2hM1u1ZslL+bsl1my5O5RfrI8h51MjdJI2DxJE9YizRPyOt6
         yrlYu2dW/dQ/M6FPqZnZDnxkyKX4llHTuzj5nt2K1gwpnF89jIU73HnE4o6CNhvWeFAj
         ZU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:cms-type:in-reply-to
         :content-disposition:mime-version:message-id:subject:cc:to:from:date
         :dkim-signature:dkim-filter;
        bh=/x3TMow3XC5OCQNZmK65qFe5zLmUY1gzXXjOBq7BJzk=;
        b=oCeLUisUCapdboRmAejVq+jFZqN4ACZRN3zWffBdSmtM+DyZVT+0mDhpCyJFKIxlD7
         x7eyGAIeQmyZmLC68mR34gQXCg72dmgpWCULrNK0216uAl5m0vBMkTTxnmcV0NIwLwaI
         pNoqlUoU3WBpZGxjCC3GjHT+n8V4T5sWY9femZWvrg4AlA1yrb2uumBIEbQgzrOTER7U
         Fw1LL3/ZzAlIgcT76Pb75hfMCJ3fiJDYJD2vlmv2IqUveI1FIaV0uv2rGvlEow7kgES/
         H0G8HepGz+SoN/xgzA6wyxExCmX4A8EBPVPhGgDqGUEdGdt63sTZKW6AHGNgE8eYz6Tm
         0QBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b="VLtAG/i6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020a37ea10000000b006b56b936c41si2450425qkj.582.2022.07.15.00.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 00:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b="VLtAG/i6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCG6w-0006rD-6w
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 03:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1oCG5Z-00064e-SL
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 03:50:17 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1oCG5V-0006Yx-2y
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 03:50:17 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220715075001euoutp013b13721ad74fde3e200b94f8918203cd~B8UGHiqxI0507305073euoutp01G
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 07:50:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220715075001euoutp013b13721ad74fde3e200b94f8918203cd~B8UGHiqxI0507305073euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1657871401;
 bh=/x3TMow3XC5OCQNZmK65qFe5zLmUY1gzXXjOBq7BJzk=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=VLtAG/i6XmtoF0GgmgAzOyOXn536k5pAH85btJ1biGlyB5sbGTMyPR1HOBbyc2KQg
 +m0+A4+/jzcBejXNBrrwi+bk94rSX5jrNorqJTP2c+Iv0Gg6pmW8xi9fHIL6z/zQmU
 /PfPFc1/SViN2JoYJAZyvMzn3CS6/c6KaJrJKRFw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220715075001eucas1p14220cc8ea43348610165126958d5536a~B8UF3G4Ou0064100641eucas1p1Q;
 Fri, 15 Jul 2022 07:50:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 59.97.10067.92C11D26; Fri, 15
 Jul 2022 08:50:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220715075000eucas1p295fba3c174fda3db9794de5ab13ee093~B8UFPJ8YA1721217212eucas1p2u;
 Fri, 15 Jul 2022 07:50:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220715075000eusmtrp14a8dbd829f1343762efed5c65724a012~B8UFOhqvX2419724197eusmtrp1D;
 Fri, 15 Jul 2022 07:50:00 +0000 (GMT)
X-AuditID: cbfec7f4-dc1ff70000002753-b0-62d11c29b6d0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 96.DC.09095.82C11D26; Fri, 15
 Jul 2022 08:50:00 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220715075000eusmtip1cb3eb257668348bcab57a5edb2dda4e1~B8UFG_AoE2047420474eusmtip1e;
 Fri, 15 Jul 2022 07:50:00 +0000 (GMT)
Received: from apples (106.110.32.102) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Jul 2022 08:49:59 +0100
Date: Fri, 15 Jul 2022 09:49:58 +0200
From: Klaus Jensen <k.jensen@samsung.com>
To: Peter Delevoryas <peter@pjd.dev>
CC: <clg@kaod.org>, <cminyard@mvista.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: Re: [RFC] aspeed/i2c: multi-master between SoC's
Message-ID: <YtEcJlagrpVajaeM@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YtDZxbUWbqO9zIKk@pdel-mbp.dhcp.thefacebook.com>
X-Originating-IP: [106.110.32.102]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsWy7djPc7qaMheTDFY+4bJo6N7HZvF4ykQ2
 i60HDrNaLOheyGZxvHcHiwOrx95T0h7nd89g9XhybTOTx87fl9gDWKK4bFJSczLLUov07RK4
 Mt5PuMVcMFW44vibe+wNjIv4uxg5OSQETCQ6n/1h6WLk4hASWMEosbnlDSuE84VR4uWmmYwQ
 zmdGic6981lhWtb9vgeVWM4o0fanmwWu6nXTQkaQKiGBjYwSx/+VgdgsAqoSR791M4PYbAKa
 Etv//GcBsUUEVCSavq9hB7GZBaIl3i3rBIsLC1hKvLi1E2wOL1Dvk1XX2CBsQYmTM58A1XAA
 1WtKrN+lD2FKSyz/xwFSwSlgK7Fk32YmiDuVJPZfv8QMYddKnNpyCyp+hkOi/5srhO0isWzW
 RkYIW1ji1fEt7BC2jMTpyT0sEHaxxKdJDVB2jcS11YtZQdZKCFhL9J3JgQg7Sqz4+IsJIswn
 ceOtIMRPfBKTtk1nhgjzSnS0CUFUq0nsaNrKOIFReRaSr2YhfDUL4asFjMyrGMVTS4tz01OL
 jfJSy/WKE3OLS/PS9ZLzczcxApPI6X/Hv+xgXP7qo94hRiYOxkOMEhzMSiK83YfOJQnxpiRW
 VqUW5ccXleakFh9ilOZgURLnTc7ckCgkkJ5YkpqdmlqQWgSTZeLglGpgmpJi7hX9gntxtiHn
 Kf4i8zS5KZVfeZwKrnbJx31TYCvz+8vw5H9SYve/Le28xy/GPeV4uT29uKT+VttFKy/Bls1R
 oeI728uO1wqb1q+OKHkhkbnLVaWg/fPhPz5GaXqrm4ovXlQ/e/fvxau/i/fceaBXftr1RelU
 kb93V0zdZtbEteLUhamZ78OZH8Se7n+4WqeZe9/uSduME1dcFHRwTfyhJTmVaZmn/lJZR8N8
 7T3FrfKbhSVFb+7WW2867eiu9nXqLB2bDRNDw/b0XWyQCJsff3RldkqD41r7ee1SzUt1xCw9
 1x8JN97x0cFMouaA9fudnWf1zpgcEJy+wFH4a7JHwok5OdrfIl9s0HZUYinOSDTUYi4qTgQA
 e5dDYJEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7oaMheTDOa9ULFo6N7HZvF4ykQ2
 i60HDrNaLOheyGZxvHcHiwOrx95T0h7nd89g9XhybTOTx87fl9gDWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mt5PuMVcMFW44vibe+wNjIv4
 uxg5OSQETCTW/b7H2MXIxSEksJRRYn77cTaIhIzEpysf2SFsYYk/17rYIIo+MkpcP/UDytnI
 KHH+xjVmkCoWAVWJo9+6wWw2AU2J7X/+s4DYIgIqEk3f14BNYhaIlni3rBMsLixgKfHi1k5G
 EJsXqPfJqmtgm4UEJjBKbP1dBREXlDg58wlQPQdQr6bE+l36EKa0xPJ/HCAVnAK2Ekv2bWaC
 uFNJYv/1S8wQdq3E57/PGCcwCs9CMmgWwqBZCIMWMDKvYhRJLS3OTc8tNtQrTswtLs1L10vO
 z93ECIyobcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4uw+dSxLiTUmsrEotyo8vKs1JLT7EaAoM
 h4nMUqLJ+cCYziuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYJqT
 GaV2sX59pVmWdtvf6b8DHLofG8tILeuZysiTevuX+52yJ08S1ES4nX9vn2UpyFw26/jJrRse
 aht4FZto8v8TUeZZqfZpz5aJyRWi1Tl3dK59WMlx2eTV5d3SYSefnP7Ke+WVSEPL91t75niG
 POqp5iur0In3EfFRPMLp/Ul16QXVDs/o78H7rA48m2TO9K1vnvPuxZfP7lH5v6as9zhbVl/h
 orWizm/sN2t8O3LL6dSfo35KzBviPqw+vNW1PfHZlB7ODfNvnViuW7/gbJD0fa4ci6DSjEmf
 ePSklnqk/zgXy/ovOKGouGy3xTL3S4wBEbP2b7c23Dnr056TMR0c7pxmAnGcS8/2H7YWuqDE
 UpyRaKjFXFScCABmMaFPMQMAAA==
X-CMS-MailID: 20220715075000eucas1p295fba3c174fda3db9794de5ab13ee093
X-Msg-Generator: CA
X-RootMTR: 20220715030653eucas1p1424b94eec7ad76c32ab478916e64d337
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220715030653eucas1p1424b94eec7ad76c32ab478916e64d337
References: <CGME20220715030653eucas1p1424b94eec7ad76c32ab478916e64d337@eucas1p1.samsung.com>
 <YtDZxbUWbqO9zIKk@pdel-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=210.118.77.11; envelope-from=k.jensen@samsung.com;
 helo=mailout1.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dpxbx1N4kVn3

On Jul 14 20:06, Peter Delevoryas wrote:
> Hey Cedric, Klaus, and Corey,
> 

Hi Peter,

Regardless of the issues you are facing its awesome to see this being
put to work like this!

> So I realized something about the current state of multi-master i2c:
> 
> We can't do transfers between two Aspeed I2C controllers, e.g.  AST1030 <->
> AST2600. I'm looking into this case in the new fby35 machine (which isn't even
> merged yet, just in Cedric's pull request)
> 
> This is because the AspeedI2CBusSlave is only designed to receive through
> i2c_send_async(). But the AspeedI2CBus master-mode transfers use i2c_send().
> 
> So, the AST2600 can't send data to the AST1030. And the AST1030 can't reply to
> the AST2600.
> 
> (By the way, another small issue: AspeedI2CBusSlave expects the parent of its
> parent to be its AspeedI2CBus, but that's not true if multiple SoC's are sharing
> an I2CBus. But that's easy to resolve, I'll send a patch for that soon).
> 
> I'm wondering how best to resolve the multi-SoC send-async issue, while
> retaining the ability to send synchronously to non-SoC slave devices.
> 
> I think there's only one way, as far as I can see:
> 
> - Force the Aspeed I2C Controller to master the I2C bus before starting a master
>   transfer. Even for synchronous transfers.
> 
> This shouldn't be a big problem, we can still do synchronous transfers, we just
> have to wait for the bus to be free before starting the transfer.
> 
> - If the I2C slave targets for a master2slave transfer support async_send, then
>   use async_send. This requires refactoring aspeed_i2c_bus_send into a state
>   machine to send data asynchronously.
> 
> In other words, don't try to do a synchronous transfer to an SoC.
> 
> But, of course, we can keep doing synchronous transfers from SoC -> sensor or
> sensor -> SoC.
> 

Yeah, hmm. This is tricky because callers of bus_send expects the
transfer to be "resolved" immediately. Per design, the asynchronous send
requires the device mastering the bus to itself be asynchronous (like
the i2c-echo device I added as an example).

However, looking at aspeed_i2c_bus_handle_cmd (which is the caller of
bus_send), it should be possible to accept bus_send to "yield" as you
sketch below and not raise any interrupt. And yes, it would be required
in bus_send to call i2c_bus_master to register a BH which can then
raise the interrupt upon i2c_ack().
