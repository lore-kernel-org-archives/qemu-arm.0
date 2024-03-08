Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1835184ejb;
        Fri, 8 Mar 2024 06:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWf5Ngvwv2hjrsgwjKkmLxSWZzGnWAkc6VZgSHYZAssoNEj2sskrZ+zn9EiKJ1mryM73/AtqpY9WtUlw8raAnkRjmpLAbRt
X-Google-Smtp-Source: AGHT+IFS30ivtLPZqRsI33vG6ddcvm/UtQJV9QY2VMa3VHquIFqTLD77hN4Ihg/01JFw40SOLShy
X-Received: by 2002:a05:620a:ec7:b0:788:28ef:88f with SMTP id x7-20020a05620a0ec700b0078828ef088fmr10950087qkm.9.1709907292461;
        Fri, 08 Mar 2024 06:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709907292; cv=none;
        d=google.com; s=arc-20160816;
        b=QGk3mUqhX4XQMLTPsfyRr2ShpaPGS4O+DZhNVp4v4y4WkrgBSZYsufNGV9xM99gvFk
         Hlrrk5vAvTplM1JekFseNlDnPmNafMTkudpqdvlbVR1/u6WUFQ8o9GkE8nL3z9U0CQxd
         /xngKVSqIXOlt/bjLlS77DeqEj9ldqgxUkNLWudTKfyNPVpoXD3NzKG9F4aNzJzhDEfz
         mTx1KpLljnSAjFVIowAtJTmyowSNtd5OohTQXSv2v47AsbHPRpmw1BTIbidxgWNVHF18
         zav/YM9DeBY25fHAP1etlT5PpoR73rvjRO3Y3B0KsEJpAD/U3uGUNkdMinafBxdWwpAl
         X9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fGQ0WxgJBzG4GhLc2y2nhwN4OUMfkZ5zzrhUaQRHaNA=;
        fh=zuatnpb+RrWG7Gw3aM8gHd0AUPXCdMKuJhAQLuR3fLE=;
        b=SkxWKsuPXQ6zjdomENL/B2r+BY84bNciSrLsTrPpyTv3cSTG2fSCcuu4L/82lPqsLz
         aKTCuoaCk4u2qBjRJMr1DeE1TxYfqRLcPV2D4a+ugzgHzFd0C3XCGYODw80Y8RdJY5mp
         rFd48aEpsrhBYrJyOvHU4tTnQs3lnc/66638O0aCz94Ctsi0La9c601gnYBhI1I3nw/h
         vLIGqw/SlL/nGPnXacMH6m4uQWQy23M5yj8me1w3w+8gaIdqSDNPxY5yRHtXvldmvOGm
         YLd9d6x47VeycvL29+ZZdIJCmWsTEeGBlgPJf1OYGjQx15vyT3GA+JfCwAwXXxOj3EVg
         qMBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HiZETNK1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24-20020ae9e318000000b0078833b30bb4si8339493qkf.101.2024.03.08.06.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 06:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HiZETNK1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1riazl-0003iw-2y; Fri, 08 Mar 2024 09:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riazh-0003ho-0u
 for qemu-devel@nongnu.org; Fri, 08 Mar 2024 09:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riaze-0001VU-61
 for qemu-devel@nongnu.org; Fri, 08 Mar 2024 09:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709907277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fGQ0WxgJBzG4GhLc2y2nhwN4OUMfkZ5zzrhUaQRHaNA=;
 b=HiZETNK1EMVCm/zhqLskFGODUzYl9IdTOheQhift7QUWkqQR7HZ1JZQFX80n1b7x1BUOBN
 yXXmmbjQfs4vuIudJ+Y4Af5vMcXosWif2ZTJALXXArGSLOiMZmFqOeF7acziEDoDDW49Do
 oTfxtFllAd9htbFON9WWWdQkRsCeS+8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-THCmeclFN3mATs6ydUpBHQ-1; Fri, 08 Mar 2024 09:14:35 -0500
X-MC-Unique: THCmeclFN3mATs6ydUpBHQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5136f815e65so960852e87.1
 for <qemu-devel@nongnu.org>; Fri, 08 Mar 2024 06:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709907274; x=1710512074;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGQ0WxgJBzG4GhLc2y2nhwN4OUMfkZ5zzrhUaQRHaNA=;
 b=o7vzUX+FUV2Vz0HNp6dgqZeV5NzkI9EZWIabGymb94mKEDo6wK1WQxrdoNFG2oLRal
 Z2pxo0aBCZT5WleE7aA8SXL+BJTs3BinFQxusOfGvM9d8vzpxHKuFLYV+djyIbUQ3W/w
 ZN4ufBpVKKDKg0I6+w8V0ovDqfWf/ZL/Oq6sgwY23lbggV92XeKGDl/K/9Oackd+MdwP
 XJ7VJkP/QH84svxoiPuL1h5MUd2/OqvO3FULmufGyrXQ9xKJ0Z6pFl4kU7q9aWLly734
 gbrTovaXJV45gEeVOAJN+HbxuWWmu5QNHdVJBuzGxZf4jR0iR04lHpuwQ0qhAvcQwTU6
 1xEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIXbty/4RrapzMv0BDVuwPfBgsbXbyDwSdXaXeWrvzGEKHJg1abnA1/KMaS/HBcklRTo57NmXdFIOhefomizgstc8XvnQ=
X-Gm-Message-State: AOJu0YxvExjttbd8L/nj/ED8g+16DHB4dJ+21infO1GWIpjtFX3IYPB8
 hVoKrnA8z8bV9gI3qDr2ervsHfvRx5LUyo8P/LCmV+AuWA/kDv/H0jQmjW/9naOhtAqzW79GwwZ
 y6nMBcHA+KF7gC+/vXmAUx0DsNhGh/Xdd3zcdBkg7ttRxeGheIKW9
X-Received: by 2002:a05:6512:2003:b0:513:4acb:6ea7 with SMTP id
 a3-20020a056512200300b005134acb6ea7mr3697432lfb.33.1709907274325; 
 Fri, 08 Mar 2024 06:14:34 -0800 (PST)
X-Received: by 2002:a05:6512:2003:b0:513:4acb:6ea7 with SMTP id
 a3-20020a056512200300b005134acb6ea7mr3697417lfb.33.1709907273974; 
 Fri, 08 Mar 2024 06:14:33 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-151.web.vodafone.de.
 [109.43.178.151]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c350c00b0041312d21a35sm4421350wmq.7.2024.03.08.06.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 06:14:33 -0800 (PST)
Message-ID: <940be9fd-5adb-414c-a8ac-e02b534f7df4@redhat.com>
Date: Fri, 8 Mar 2024 15:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] target/arm/tcg/m_helper.c: Include the full
 helpers only with CONFIG_ARM_V7M
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-3-thuth@redhat.com>
 <CAFEAcA-yL8BAdtkF2xaWJOeFPUWRoBbuvPSEeorwjyei3oFjDQ@mail.gmail.com>
 <d0ed3f33-b641-4e46-bfaa-f21fbcecbeb8@redhat.com>
 <CAFEAcA-ye_3AqCkNS1acJ7GPzLEf=WCmjN3WXe9eRWB1x3y=7g@mail.gmail.com>
 <f952b2d2-90cb-4427-a726-ab126ade8e71@redhat.com>
 <CAFEAcA_oMMRdJ78PpPjCtT_TFaS0+yPhOH8Dc-qwrEEM_v+vsg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA_oMMRdJ78PpPjCtT_TFaS0+yPhOH8Dc-qwrEEM_v+vsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.572,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vsUZjQ336cwt

On 08/03/2024 15.00, Peter Maydell wrote:
> On Fri, 8 Mar 2024 at 12:54, Thomas Huth <thuth@redhat.com> wrote:
>> I gave it a try, but then we end up again with the problem that I already
>> mentioned in the discussion about patch 1: CONFIG_ARM_V7M is not set for the
>> linux-user binaries, so m_helper.c would not get included there anymore and
>> we end up with lots of link failures.
>>
>> So if you don't like the current shape, I guess this needs a little bit more
>> pondering 'til it gets acceptable.
>>
>> But could you maybe at least pick up the first patch already? ... since it's
>> a patch with lots of code movement in it, this is quite ugly to rebase it
>> each time someone touches some lines of code in that area...
> 
> I don't object to taking the first patch, but... it doesn't apply
> so it needs rebasing :-/ If you can rebase and send it out this
> afternoon I can put it in a pullreq I'm working on.

That's what I meant with it's "ugly to rebase it" ;-) ... fortunately, it 
was only a rather simple conflict this time.

I sent out a v3 now, also including another try for the second patch (which 
now includes the stubs that assert() in the m_helper.c file itself instead 
of using a separate stub file). Not sure whether that looks much nicer, but 
at least it seems to work from a compilation/linking perspective. Anyway, if 
you could at least include patch 1 from that v3 in your next pull request, 
that would be great!

  Thanks,
   Thomas

