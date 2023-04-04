Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp791026ejb;
        Tue, 4 Apr 2023 09:27:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350bek0MrVdmSBBoq8E0Aqh8yY2tbkPgWp7JO2sVtaY+4iey3PlL6tICdEznEQllu3XQcnyQS
X-Received: by 2002:ad4:5bc5:0:b0:568:c5e3:a0ce with SMTP id t5-20020ad45bc5000000b00568c5e3a0cemr4399448qvt.20.1680625643085;
        Tue, 04 Apr 2023 09:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680625643; cv=none;
        d=google.com; s=arc-20160816;
        b=iYK7cdj8OYO8Ai7oyUCykjatUUj94KoO5uNC9D13zM/JXJe+z1ozRmRogmhA2bCfqv
         vSJtU+JZ5W7+6sKiCbPk18A47fCscHeWoq/dFme+FBZwFMShsplxjEuDiPnj2+t4dW7V
         yI9ffl3wAgVQxZnHG/FHgNzsEZoQYZqbabMYryI36jPnOLJh8mL+lYIZ/A4fxUjExfUX
         B1bM9idCLiN1CxV7JBmTQ+Peu1F9DPt31lrwxTFRMwqI1pAtKSeykhAywNv8cXJVXDOJ
         Z4TWHohtzzINYZMkrU2nj+ZWbiK4/9LkWSqg/Py/EtgUHo3NpaJJ94v+PCNcpER5ZQfl
         gV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QgcTG/L39fN5XsY15DUy97fsvXEO6bd6AgJMk2vVYVY=;
        b=jWLJnuqe5BVXr6EROXWBUtSryc1NeiYDE7kF1X+rfuMLrZ5kuIWZk8q2XaVIDtK9AH
         RLrO7xlsP+JvVJVGUq0d8K7vC7ZDiSSNVliTtLhmH5nosySkfuRLpHEOcFtygqxnYqi9
         b86KQQK9AX+n/B/2WhI1DOxxRUn+liBts8FVBV7InztWsEqLuxzkp5PN4FCL7m0CuFlg
         wHb11GVjoF0rtJZzCXKMMhdOQBg/x4q5FYhd8f5t9h1dlfpFZhw/OzYVMP9DBvi21RXr
         jsnZxqpnYd2z7hw2MUeK8a09PzVpAv00XuErCduX21cd22vWc8NTbMMafM5GfAfu9t1n
         x1jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=bUPPqWnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu1-20020a056214234100b005a3ad4d0a4csi8010377qvb.482.2023.04.04.09.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 09:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=bUPPqWnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjjUm-0001GG-O5; Tue, 04 Apr 2023 12:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pjjUl-0001G3-8g; Tue, 04 Apr 2023 12:26:55 -0400
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pjjUj-0001Zr-7W; Tue, 04 Apr 2023 12:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1680625608; i=axelheider@gmx.de;
 bh=QgcTG/L39fN5XsY15DUy97fsvXEO6bd6AgJMk2vVYVY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bUPPqWnwYY1YBZ9dc/eK5gnW+tWHlYVjKWVn/F9Itst5xTSmGpt7IkmghlW6pbR27
 efGpNOI6X8+ezzS0NVLoHQgZKeha3HEZ84wDk7IwW8hakWJIzqY3neofYljZ0y+3by
 9+xIouHjGbpfSvOMCtjq+bdbpjUGWbF08i1McA8DBAmwdOjAAc6SIgb/xBBawvjbPG
 /dQLvar3Je5SvhjOQF9xdovWdRcG+WHT2D2SRjjErjklWusO6OpR68LprGvmqEmK7S
 cfTZ2zVfs8gaTqfpSfyIYtwPQ3duUsLjtgKGjbOB/4BN3cw1El1++sSeOS+O74BY0u
 5WjqIXQsQ8ANg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.125] ([5.199.177.82]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1qYw8Q1NpS-00tn2q; Tue, 04
 Apr 2023 18:26:48 +0200
Message-ID: <941a4787-6a24-c2e0-fd01-51b489512831@gmx.de>
Date: Tue, 4 Apr 2023 18:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
 <CAFEAcA9JLOhxa3LeiFJ8YqinuSV33N4Vbj2m4ZnoOxry0=YGGA@mail.gmail.com>
Content-Language: de-DE
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA9JLOhxa3LeiFJ8YqinuSV33N4Vbj2m4ZnoOxry0=YGGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:983sZNNfx6CrfuiV1PSGdn8aoh1UEthYhkBYeiuIIHUyAE43aBh
 2qW8KjVbaD5edYhc5U2EvVkfxf57NZM9ExTupoCLgXl0a5TY3GuRtTEUN3nOVJ5teXTUsOs
 s/M0bw3LFzl+G3gkvu3ARLN1lnFABZvHRg5RxXXDHYLNNCdq1R2P05PSy9V+Ki5BQRUUgdS
 DgKz2F3J/rdaiuZwRK0pA==
UI-OutboundReport: notjunk:1;M01:P0:ihYQ6Wt/Lis=;soz0Nrt/mLqtzCaAl1j5NcZnWAU
 QGeIAV2/I8Z/aTddFNwzWQgHgxAN9qiqKGPheap4N0u8Ue6UhRaKOvVtYUBYBPTAXApw0zd/2
 wGpNwr5DrzU03oQ47eQxCaSkMTtRMG3q2g1ze2hDWk4NO1+uzUb8kMAn1jSytGSN+wguJePbS
 Wpb3qwNYyEIBzDN7namsOfXxqs5senf5pjownvLH76V2Dwkz/cxqZmAaJKag3ZjeOnpol/iOc
 J4G4cusq4x/DWirLyDXUUxZJyuXtKCiHxv2FpcqiAjM2uhYsUWXgldWTWvfHTJzeqikvrYBQ3
 bqWSF6LYa4xmED7K2t7ckSF3y19hdMWkvWhWdtvxaN6ZfKIIM/TZcx1Vt5I+77m0WDwNh2gvZ
 cDbMUKW6xKciE2Ig4BRKqjka/b2GsOSZ8cKOKGqc6EYcz3dUcMoeq/rGyuN2dYghvUx+evXjY
 okI5eVQgT2P6fgkUtrx9+vbQI3ybs4ifjDHXQVkdCXk3FB6TqFDgSfuexUBLSwrii7MPGK1jC
 rXXKf2WwYICtHEHg18t4DnqzTv6kL3kte0M3ErBRHThoKbviNpt0M1JRFzbrObeYXYMuVmi/p
 uJmRXBadk2KspPJtJ33vPkMsexYUuCV5xouxzCtnU2zBwR80gxcaBKCQbxMVS8vmWzuFrGOHK
 3FWo3tjLiYTKyDW5+VZuXw8Hk9f+7Ps6zFDk+DmxwrgOhTSve/FJ5+zOaCneszNlczabeU4dF
 qqiIGlvanaWDO9p1eYoivrfImpIEIl1M/QMqpMYwFkkJOf2zXGBIjzFOiqUwD9RIQoX5qInLY
 bfEyMIM21wHJnxDZOjir7KFr61K1IzIuQXuZ52M0xEVDEx+Psk52ynpmBmzbuib7cMu96zcEp
 bUSSRrI4k8PXt0qKQpAX+Q+ojkjUSCV9xqG/nqpsV/1n+7jaqpirmLsH7g31fJIEYuAzAEZK0
 C6OIng==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6d95bro5MmWw

Peter,

> Hi; Coverity has just noticed an issue with this patch:
> [...]
> Here we declare the is_oneshot variable...
> [...]
> ...but here we declare another is_oneshot, which shadows the first
> declaration...
> ...so here when the inner variable is no longer in scope, the
> value of the outer is_oneshot variable must always be 'false',
> because there's never any assignment to it.
> What was the intention here? My guess is that there should only
> have been one 'is_oneshot', not two.

The shadowing is not intended, as this does not make any sense. There
is only one instance of this variable, it is FALSE by default and can
become TRUE.

> [...]
> There's also been this bug report:
> https://gitlab.com/qemu-project/qemu/-/issues/1491
> which suggests that the condition for setting is_oneshot
> should be "(limit <=3D s->cmp)" rather than ">=3D".
> What do you think ?

The Bug report is right, that the check should be
"(limit <=3D s->cmp)", as it's about the on-shot characteristic and not
the periodic characteristic (which earler version of the patch had).


I will provide a patch to fix this.


Axel
