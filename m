Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5265669wrg;
        Wed, 12 Jun 2019 00:41:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJgVVqXuburgXvnusUK+EJSClgs5mIr68/w8POcO+1Bsmu8/mQxSA/bTJ760dvdEE6RO1t
X-Received: by 2002:a37:7c05:: with SMTP id x5mr62506773qkc.313.1560325318142;
        Wed, 12 Jun 2019 00:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560325318; cv=none;
        d=google.com; s=arc-20160816;
        b=I7246iC702a9uPqvjnhfw+uSgRk2Kw3+3UvTJ2kuHeB1biFrPX6F9oLvTxmqk2mx3L
         /EGCXtCsf3zIQL48dTC9TvnOe1mssoyhUPlHLPKMiei6qWz0iu7GvdawZJVNruE9PyXi
         Ti3dgt39bgb3LB2HwXMXH4ik+1D2F4Wtdotu5qgYeLAUwOh7XtN4ty4aSEXfAInFmEfY
         uPgwekfGsJnxgvCQnXLiOzvhj1GXVBcsOYACwzVj/0dK45jIvGC9pM69+Qy0w+9mbK/H
         RzXbFm+iR4V5ka/EbBU2Ep34EmLZePMnosaj/uEmuzG2/SFqW7N8WvBmrwgTAI2JEgUD
         dlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=7JaS57nK4mU0rquDzA6lceoe5VvBxZCySZFQB8vZXe0=;
        b=RpkKyc8WDzGmIXaB1oOcqL2/1Hpca1E/SVSqBceXXZ2kXuD1Q3JG6UC8di/xmoVCmS
         WRcSct0l0phc6otUQ2dLadDOBMkFYYrtCtnEJP+HgJADZhVAf8Bx/YV+kEc/fR7/WKaw
         mLodBUVoCZZ1HumLV1E8MLs00VqpsJlQ6xNAmzsZZK19nQZh5XkyRASByq2eSBH/hLxI
         dPxmcoGWsEMe6VLHIWblP9x5I04f1jEL4g8oI1RZB27uCw/zmQNb6vFzYE8aGjTHhOkg
         aFELnuV3JtSG3X1ywtRos9MoYInKqQESmfVeRw4Nhx6xLAU8BTqOg8Zb4CM8jSBP8adx
         ecng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si11107866qtf.381.2019.06.12.00.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 00:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haxtL-0007G1-Sw
	for alex.bennee@linaro.org; Wed, 12 Jun 2019 03:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46507)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1haxt2-0007Di-Af
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 03:41:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1haxt1-0006F2-8K
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 03:41:36 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60383)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1haxsx-00064A-CF; Wed, 12 Jun 2019 03:41:32 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6lxY-1hjDjX3LWY-008KXl; Wed, 12 Jun 2019 09:40:45 +0200
To: Ramon Fried <rfried.dev@gmail.com>
References: <20190611145556.12940-1-rfried.dev@gmail.com>
 <f826d073-da60-96f0-9a37-c33761844cc2@vivier.eu>
 <CAGi-RUL2QThfiYPeZOE6iuryxT7Daj-y-Q=SSgUBRFcDsWP+zw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <200eff56-ffff-904d-eeef-408b52ce2fa5@vivier.eu>
Date: Wed, 12 Jun 2019 09:40:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RUL2QThfiYPeZOE6iuryxT7Daj-y-Q=SSgUBRFcDsWP+zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BsPGHZeY2BWZFr8n9SJ70hVxDx3hghq09Xw7QHJE+aXsrMaRomk
 N+suyzkqFLmC54y7xWw+nS7+meiXFhBHv33PWWsoC6lD1q/uDMfTW79Btc6ttVoq/8E4nfq
 KcdidPn92WkVloVfh9crQfviTx737spEcNgBE8/bDjFhB1C1enS0y8GWr92f/lfbofqaCW4
 tbdxh4RHOjjwb+yQt0urA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LJ0Em5b2cAY=:CtLt9aLQ3LCpYpezKTk8uB
 niqqvamLb4B59Mq0eEF4waqZDi1DMZrpTA1lTJqcyBZAnc8sQlCyllpCbrwZ6VmY+uraaWQaK
 DP7kwsMYyWMMdhCVsSDxtLmxlf64tpz3ncwjiEo+e0dKNabWeDcKUGJv8JCmH6VcXcF8i7EX7
 Hzr7JQQFaSFelcRAwwWxL7dLLAqsSR+Z1UL+yW7Odi2MJ+ps4rMSLws6T5Tke60YbInkauTi5
 RRSGwpPyQCG5S/qXV5Jm/ImpuZy1oKhk4Nzaj8eXKLutCy+qWYreH21WSOX5U9vdeS66c2CUa
 DreXCVM8gMMlXDNvrv5/cQc/RDcGoaGYqRz8HsobRi6LecKC+koZj1BkQ0cTncgb+7tV2chjq
 vgex5SdcsuBc9PghCwrYwIOseEdqvkJmeGWrWWZDJsorzPgE5fg4oZmvYjyWFTVMda4oYvEKv
 gOr7iH+nhuhlUNHvU1S1yilC61VCt2lK3o3puf27YvTQOf4KHInOoOWmHznxP70H8aLjHegZM
 TfBTXZT0YJOfydijaUm1EutiIVoF1ixcG3jknWQZ8Hz2TxAgHTMKy7S35bg6UllRW5Ftd+pRw
 fkt12HKJLHhi8Zq1AdT/Yl4Y7oYQBAm9PVeAEWZzvGm+a7T0yKZjjaVgF+tyhJwAm7ZC5uTXf
 Owzo/QR0q3FhmXwGfCenoK8FDhqzcpq9TcD47mziZ3TRr9mtlcmMl4OsM79T/jEb6eSwu8cqE
 JicBeCJXMpL1rUXOUr+eJn+PaRh5eSkAcZISOFQmUAUSyAjZIa1iXwO0B64=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-devel] [PATCH v2] net: cadence_gem: fix compilation error
 when debug is on
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IolKaQ9lj9MQ

Le 12/06/2019 à 06:27, Ramon Fried a écrit :
> 
> 
> On Tue, Jun 11, 2019 at 7:21 PM Laurent Vivier <laurent@vivier.eu
> <mailto:laurent@vivier.eu>> wrote:
> 
>     Le 11/06/2019 à 16:55, Ramon Fried a écrit :
>     > defining CADENCE_GEM_ERR_DEBUG causes compilation
>     > errors, fix that.
>     >
>     > Signed-off-by: Ramon Fried <rfried.dev@gmail.com
>     <mailto:rfried.dev@gmail.com>>
>     > ---
>     > v2: change %lx to HWADDR_PRIx and %lx to %zdx
> 
>     HWADDR_PRIx is to use with hwaddr type (packet_desc_addr).
>     rx_desc_get_buffer() is uint64_t, you must use PRIx64.
>     It may be better to remove also the cast to unsigned.
> 
> Other places in the code also use HWADDR_PRIx with  rx_desc_get_buffer().
> Should I change them also ?

No, in fact you should change the return type of rx_desc_get_buffer() to
hwaddr.

Thanks,
Laurent
