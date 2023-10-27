Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp8134ejc;
        Fri, 27 Oct 2023 00:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi50zealxMLxoHFE5AUJSRAPimPLyxGIxxMwKyVrEpXbYzBbszb8/jUZ1Mo4gF4m4CVcea
X-Received: by 2002:a25:ae49:0:b0:d9b:2477:b625 with SMTP id g9-20020a25ae49000000b00d9b2477b625mr1717989ybe.54.1698392408717;
        Fri, 27 Oct 2023 00:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698392408; cv=none;
        d=google.com; s=arc-20160816;
        b=sIAvLPHgXIkI6fDmoWWolqg8KsLbtBsDu+8yf4YznQcEZ1KH8voyTyuDKNDOm6f1Nm
         5HeFAfSspwaq27nDvUJS27BxviTcGYgLj8kyrfebU3UwRITGJ3SkAgzwH9ArLS2KX0vx
         VBSSXnep3vzkk3lYodlAc1CrIHS4AUtRrpJoUmBGKUgtg6atrRk7Xl7WDLPFA5r47qUG
         7OoLafGpwqsU5NLHwt87l16jqG/Nx1Mo9Pu63Co36qNXeAFd3E0R5uBPhtJlW6ajZPVN
         /Q9BziiRUiO/U1si9xMYVPw0EfySuq8yIQlO7C0woGIHtgm6RgPrGOLbq7d/F9O8w7EI
         sgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=X16oWHAKHVh7ZOjJDOzt1MishKwF/5kUpmtZNz+c0Dw=;
        fh=gGZ8KC2O7OgwRBDPiLtlNf/Vfu8laUlcFY/sAMdpb+8=;
        b=sKNUpXH9DNGOdm/hVhvq2BgNEHdjJB5ZCHBZIJCys+xsRQLXSRy4KI2o0576cfaUVS
         Ub+NjmWLghxzrF8Ooz+1Ocx/rFekn0rV6iyCJUoMzHRzD5C/cepOlQQulSGsQJRYnTLC
         h8tgLejcpGztp7dnAGUbN30PCtE1BUZZ3M3nLURsQI57mKZ4fhqshzc05cTig698xbaX
         Qc9Py5XvsFA99pBDjrVYOXlpfhHKV5ZFowcNQguj1iko4oY3QC2sz/c6BZ5bm4fwLIuv
         jMCI8MiXqxQ2YSL4Ifzmg62O2dBDa92U4z2urTVO/Ti4QKAyRPQk+bBrptDKinVQth2G
         0Vmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F9O/OAug";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a259108000000b00d85215d6519si1517951ybl.595.2023.10.27.00.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 00:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F9O/OAug";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwHRl-0004W1-DG; Fri, 27 Oct 2023 03:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qwHRk-0004Vm-K0
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 03:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qwHRj-0000h9-9e
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 03:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698392394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X16oWHAKHVh7ZOjJDOzt1MishKwF/5kUpmtZNz+c0Dw=;
 b=F9O/OAugoCCozC9i+KZVZs44kef+trur5y4LEr/K9JFwthoJeBYWvmQGsKvKhRYr4/6phU
 vMnf3MfdiB9ygQAZgH0wYwH6mT5TQub2NcLDWsXuzJSi646SKLIXsDwqnED1nq23IUqBpY
 w8NqnGySUK2PeukAxM+xKuMaQa8eRHo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-WtN41DTcO8-0-c7AYzFSqA-1; Fri, 27 Oct 2023 03:39:52 -0400
X-MC-Unique: WtN41DTcO8-0-c7AYzFSqA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-778a738a523so259152585a.0
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 00:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698392392; x=1698997192;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X16oWHAKHVh7ZOjJDOzt1MishKwF/5kUpmtZNz+c0Dw=;
 b=TmJPP43rfxbnGarfZJbXapiPXZWjymdF26hajpF1R8BrZG7eMsBZxfDTl9JYym2w34
 Wj6kxE53mJubybubGs5N3YiSXfZoSxnQ3lDsbWiyy9xAkJd6m0A19o3ZL4yHxau2Ep+b
 Vm6iexB5HCF5783aKbM0fi5t9kHQm/rbL9Lh7lXL061N4AL+6OyZG8AR5kip16K/qsYf
 n5q0KYaRCAZN/oOHfwZzB9DvdqcRwCjzlRGkdQaCwmLiosD36oFjfTc8Ngc2ksmAzv3k
 /CBsffxHCQ1u74+dXE7jhaNyWPx6M317TGp/OVJ/gkWF1Y3F+LQsxmEYCnVdbS+oZay2
 oezQ==
X-Gm-Message-State: AOJu0YwmYK74Yv4WNr8TRyeUIE1r3DIwsQtWqxU5/LRw7qL+ev8nVQoT
 zF4NaxenHK+MWghRZhZzcYpe+wXG/8J3WcOLb5nE8zVYtN/wP+OhBOlQS12mcgMoCiVm6rabHhe
 oTOcHciKs4b9B
X-Received: by 2002:a05:622a:183:b0:41b:826b:1bf5 with SMTP id
 s3-20020a05622a018300b0041b826b1bf5mr2341174qtw.59.1698392392184; 
 Fri, 27 Oct 2023 00:39:52 -0700 (PDT)
X-Received: by 2002:a05:622a:183:b0:41b:826b:1bf5 with SMTP id
 s3-20020a05622a018300b0041b826b1bf5mr2341164qtw.59.1698392391846; 
 Fri, 27 Oct 2023 00:39:51 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 i24-20020ac84f58000000b0041a6fb444f6sm385994qtw.86.2023.10.27.00.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:39:51 -0700 (PDT)
Message-ID: <a623167a-6f33-4a79-9752-ead9f1bc7326@redhat.com>
Date: Fri, 27 Oct 2023 09:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] tests: Clean up global variables shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Tyrone Ting <kfting@nuvoton.com>, Markus Armbruster <armbru@redhat.com>
References: <20231009100251.56019-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: VX377wtBufRf

On 09/10/2023 12.02, Philippe Mathieu-Daudé wrote:
> Clean up global variables shadowing in tests/
> in order to be able to use -Wshadow with Clang.
> 
> Philippe Mathieu-Daudé (10):
>    system/qtest: Clean up global variable shadowing in
>      qtest_server_init()
>    tests/throttle: Clean up global variable shadowing
>    tests/virtio-scsi: Clean up global variable shadowing
>    tests/cdrom-test: Clean up global variable shadowing in
>      prepare_image()
>    tests/hd-geo-test: Clean up global variable shadowing
>    tests/rtl8139: Clean up global variable shadowing
>    tests/npcm7xx_adc: Clean up global variable shadowing
>    tests/aio: Clean up global variable shadowing
>    tests/aio-multithread: Clean up global variable shadowing
>    tests/coroutine: Clean up global variable shadowing

Thanks, I've queued now everything except for patch 5 and 9 that both still 
had unresolved comments.

  Thomas


