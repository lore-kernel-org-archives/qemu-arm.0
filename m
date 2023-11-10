Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1124544ejq;
        Fri, 10 Nov 2023 03:35:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJwqqxVli3W+GOZ8wvHQjFaE6kmUkh73q5/EtABlGLJMRGyshEOB8/bqPKWrgEAlbpHNc7
X-Received: by 2002:a05:6122:1051:b0:495:bd61:a184 with SMTP id z17-20020a056122105100b00495bd61a184mr3565955vkn.2.1699616154433;
        Fri, 10 Nov 2023 03:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699616154; cv=none;
        d=google.com; s=arc-20160816;
        b=ifWvSx7EtNXhwsds9hb4nQPenjf1M/JZXKmnjaU+A8xU5t3t+Y8jG9qmptQz37rsC7
         ACBqtEa4ewb2PFaP//qaTv400aBhlkIuilJD/phyVDOFQP9twrvwpZl0IUaEgCA18eJT
         GoPhgccskpzHhzO7Ttflrn+eiD/5q9oYjQiIfWfv0xdxgipn4GAb69dkVoTANvJGGRK2
         P4trh5vu32DfxON0PDOEngJAQeIhy0tSsIErUBqSzBo6+AIwnGWpEHFWRKjwXqPYUeLK
         PDXT3aymGRUn5HTPo8pssd5HvVAYM1cW4dvn4DXvsrsTpVVgf6Pf866HP4m3cB2ljIDZ
         Rp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=RNm2gDIga0Cejcv/9ohoHiE73po2JdyBHjSnzV/oqUE=;
        fh=tZ7qLP1/zGJgJ18RmwSslNo1NH7yRkmO9+XAgTiKCa8=;
        b=MRa8B85utqiL9TT/JFk9JYjSU8lIPzJYIa0bicwbD3AnJsVdAiukD/cEULWPv2HPHN
         XxpYaq6mOxcmpZwMJ5PP6eIvNR07O6E0OsGtOFTQzsrmfl/UJjJ9lobAWKerYa7BMk6/
         LLvOZ9iekF1+KFQ/G+pxVRMOz0api8VzYjX1tB9/zOs6xfhw4gJ4eNWgZgkKwxku/D+O
         hkEL0baUpEIv1Vpp9F/5rvSzAvUKaPv1jPqA4mAwi61y2+zd8QyVV1qSew571PuQMXtb
         8YYIN5gC0RjwwsZfDHo3DobTMnjNLb3EPW48vbrXIBltUUJnZrMBaMGKrKpmitDQW+/z
         EnFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jd15-20020a05622a718f00b004219c4d39e2si2543708qtb.225.2023.11.10.03.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:35:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PnZ-0006GA-N9; Fri, 10 Nov 2023 06:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r1PnY-0006Fy-Ew; Fri, 10 Nov 2023 06:35:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r1PnW-0007uF-8s; Fri, 10 Nov 2023 06:35:40 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B8CF975A4C1;
 Fri, 10 Nov 2023 12:35:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AD01C75A4B8; Fri, 10 Nov 2023 12:35:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AB46175A4B7;
 Fri, 10 Nov 2023 12:35:56 +0100 (CET)
Date: Fri, 10 Nov 2023 12:35:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
In-Reply-To: <ZU4R+08zuo8xvlg8@redhat.com>
Message-ID: <02562baf-3d92-f5b4-2592-a9d868586451@eik.bme.hu>
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org> <ZU4R+08zuo8xvlg8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1631310355-1699616156=:56818"
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +++KNtTx4yBJ

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1631310355-1699616156=:56818
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 10 Nov 2023, Daniel P. Berrangé wrote:
> On Fri, Nov 10, 2023 at 12:44:56PM +0200, Manos Pitsidianakis wrote:
>> On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> This kind of thing is why Coverity's unused-result warning has a
>>> lot of false positives. We shouldn't introduce extra code like
>>> this to work around the fact that the tooling doesn't understand
>>> our error-handling convention (i.e. error_fatal, and the way
>>> that some functions report errors both via the return value and
>>> also via the Error** argument).
>>
>> I respect that :). But I personally believe that clinging to C's
>> inadequacies, instead of preventing bugs statically just because it adds
>> some lines of code, is misguided. Proper code should strive to make bugs
>> impossible in the first place. At least that is my perspective and I would
>> like there to be constructive discussions about different approaches in the
>> mailing list. Perhaps something good might come out of it!
>
> Your approach to the problem:
>
>  if (!AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal)) {
>    exit(1);
>  }
>
> is adding dead-code because the exit(1) will never be reachable. So while
> it lets you squelch the unused result warning, it is verbose and misleading
> to anyone who sees it.
>
> Perhaps a more viable option is to pull in gnulib's ignore_value macro
>
>  #define ignore_value(x) \
>    (__extension__ ({ __typeof__ (x) __x = (x); (void) __x; }))
>
> and then we would have just this:
>
> ignore_value(AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal));

I wonder if just casting to (void) without assigning to a value could 
avoid the warning? In that case you would not need a macro just

(void)AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal);

Not sure it's clearer than a macro which states what it does but the 
definition is a bit cryptic while this cast is simpler but may also puzzle 
somebody not familiar with it.

Regards,
BALATON Zoltan
--3866299591-1631310355-1699616156=:56818--
