Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1601329ejy;
        Tue, 20 Sep 2022 00:07:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6B9rkm9/rq5AK9HqLf3jBAoT5dvhjyuGbzhqJyF+OuwGVp6wHEySOE+hjZIbokE/SNPM7E
X-Received: by 2002:a05:622a:18a3:b0:35b:af14:401e with SMTP id v35-20020a05622a18a300b0035baf14401emr17686579qtc.200.1663657671423;
        Tue, 20 Sep 2022 00:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663657671; cv=none;
        d=google.com; s=arc-20160816;
        b=xfnhvc6SIM2AAha1tGLqUNpcoAao1WW7cRTJwMNS7JZMbWhc1WXPY5QUltgoOO5S3W
         WLLM6Q1r71TTY4FRG1faVMaPZvM/DmMMipWadUtebpQVRNC2AezR8Ktl23dqkDzey2Am
         VDUW8E+t/gwaboST939KrPPgO7SP3qeTqi7SeSlx/k1Af5ynf/T2EB8UyXC3bVB+E+d9
         rA11pDsp3mtcDT7nMzzGO4csfwEN5uqxjPBCSPTcGzIOWqx2cciyaqG0hTT+F+Dti3Al
         XeR3zSOZK7mWCZ13BdhNECwBOC8EIUsrPy/4OdGE+vcCVKmndVmVQy4AtVrqRmR0bPPU
         lJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SGwX909Gb+syIQD2vf4rn9A/9C8ljwxBynEmiGkdZe0=;
        b=SPZE3viKPQUx6kyBomPp6NdUK6fKvD/ENveqZE1iOV/pDRZjrBbvW01ZqG6sRy0/l1
         Ir6TlgplZbkcm8NrVfONkqkNGywXaY7Ssu3Ts6am0GV+6zcmgy/CB+y+X9a0jNSP+GL0
         v9Dv20A5UJbTorFtdBbbhtE2WlUTI7pi8MMW4b54/4h7Y7edkp8rfCJ1VRnlVn5vT1oW
         EZeY1po/KUU290ynvTabOvN2n1wMP6xVICGWHpPA1hIW9PxB/pTOU+fR8KxPm1L9rezi
         WkeWt9veQyhjS2qp2P/TUWrtdP7YwewF1BAmA+vGEPYR1Yk7bpcipjX9ENNeQaLxPV6o
         6vsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LPUsmY4+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i126-20020a375484000000b006bae5b577cbsi318156qkb.259.2022.09.20.00.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 00:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LPUsmY4+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaXME-0003K2-35
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 03:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaXF9-0001Hz-2e
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 03:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaXF6-0003NX-5g
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 03:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663657226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGwX909Gb+syIQD2vf4rn9A/9C8ljwxBynEmiGkdZe0=;
 b=LPUsmY4+K8ddr9Ktqr4Gqmj6kg8fLFEfxbzuWMcgBwVnQLb/DIlNYMgezyK9ZnQTaBhRCD
 x4Av8Z+MQiQR2PXxhh+EWXofvjaoTP00/L3SQLPbny385gyaykE2HgALUR7Sh47dvdMpkI
 cz6/AwPdlLxaBE+3wK9j1AotLjX049o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-s2SnLZOONMKQg3YEq3TYnw-1; Tue, 20 Sep 2022 03:00:24 -0400
X-MC-Unique: s2SnLZOONMKQg3YEq3TYnw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so746732wra.21
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 00:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SGwX909Gb+syIQD2vf4rn9A/9C8ljwxBynEmiGkdZe0=;
 b=ffhrjvx4GcJipKzFI0UzxtUguFZ/mcKcmxlGbtkylYhMNv5eXhyRAo25zPLWnZ+DGO
 sHdX45bsJolU0kLL4/jV5JEIV+YBU8Yw3v6OyJiHVtUD8no2cEfDdsKDE/JMWxTj5ztM
 gms7Rhy0Oi7hIMMqFrG+syqsRt0S5apAY2ZhvvqKEL88nnh9xJussydA80yNnVOcqlQV
 bBUVk4JSCOMAs4RsJdi4PVwFbaPzLtrBuSo0EXowc4uQMeeGMHzoE+eSOwZDIdd2YHH+
 u6ROjmbogn0ZMym/LsRkqDBBAG5PixogbhXXTwrgpdl+uLNp5l1RG8PGbgcZfZVQ/qso
 Z10Q==
X-Gm-Message-State: ACrzQf2qr41q3iarmUNSv6gaK3c9IKnLlLp3sHtMExm9C/nsWHFf7FwC
 rAHMp6O9ztqz6JsrHHgIm/GOVJ3CH7DNlFwK7khm194seg6b2gDhKS5tJu5BOA1A+tjKR8fCPP8
 c8T1TDKXNhCY0E9A=
X-Received: by 2002:a05:600c:3595:b0:3b4:8378:98d2 with SMTP id
 p21-20020a05600c359500b003b4837898d2mr1260535wmq.64.1663657223042; 
 Tue, 20 Sep 2022 00:00:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3595:b0:3b4:8378:98d2 with SMTP id
 p21-20020a05600c359500b003b4837898d2mr1260511wmq.64.1663657222846; 
 Tue, 20 Sep 2022 00:00:22 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-8.web.vodafone.de. [109.43.177.8])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c511100b003b4935f04a4sm1581955wms.5.2022.09.20.00.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 00:00:22 -0700 (PDT)
Message-ID: <eccfd9bd-2900-f437-778c-74a8052fc045@redhat.com>
Date: Tue, 20 Sep 2022 09:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
Content-Language: en-US
To: Patrick Venture <venture@google.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing
 <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
References: <20220906163138.2831353-1-venture@google.com>
 <98b23697-00ec-2952-31c1-258419bd5440@redhat.com>
 <CAO=notzNRHaJvqnBx34qN0ovvwiwXNPRt73VnWqxyYhvnZMXnA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAO=notzNRHaJvqnBx34qN0ovvwiwXNPRt73VnWqxyYhvnZMXnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z1CxxSCA2zD4

On 20/09/2022 00.37, Patrick Venture wrote:
> 
> 
> On Mon, Sep 19, 2022 at 5:44 AM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     On 06/09/2022 18.31, Patrick Venture wrote:
>      > The register tests walks all the registers to verify they are initially
>      > 0 when appropriate.  However, if the MAC address is set in the register
>      >    space, this should not be checked against 0.
>      >
>      > Reviewed-by: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>      > Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058
> 
>     What's that change-id good for?
> 
> 
> Oops, sorry about that.  I can send out a v2 without it, or during 
> application someone can nicely trim it? :)

I can take the patch through my qtest branch - I'll drop the line there.

>     Basically ack, but one question: Where should that non-zero MAC address
>     come
>     from / when did you hit a problem here? If QEMU is started without any mac
>     settings at all (like it is done here), the register never contains a
>     non-zero value, does it?
> 
> 
> So, there's a bug in the emc device presently where that value isn't set 
> when it should be.  I have that bug fixed, but for whatever reason, probably 
> not enough caffeine, I didn't bundle the two patches together.

OK, makes sense now, thanks for the explanation!

  Thomas


