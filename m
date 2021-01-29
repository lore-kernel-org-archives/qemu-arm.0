Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1130291lfo;
        Fri, 29 Jan 2021 05:34:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlvXaP6wEqyeXhyWiEUiT/DGbC/Jj4mUpLPCYsLMAGJISpksz1xloiyMkGBpegCp2Obymz
X-Received: by 2002:a25:2e4e:: with SMTP id b14mr3735724ybn.135.1611927267712;
        Fri, 29 Jan 2021 05:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611927267; cv=none;
        d=google.com; s=arc-20160816;
        b=DdTaCJFXsfDBwgcBeS5Ovl6dHmP9gikkO9n4jpQM1vCAzG2tybH8u3blVLV8aJ/WTC
         7lDjQ5Qm2GbuBkCnhf0dmK8t6SlkI7pUTO7IP06M1c/oWtCjDVBGCQ4OMESHt9bJt8Bi
         IN5yxESkpmJk1GwL7DQYg2l8DyoqBJfgYwsrejPFDBgU8AJL92U1vQ8jI1yhwXgHLl6u
         SpWu4T7q8mAcZE+RQ9kpkn3oDmtPP5UJzgN70HOlI7efJwtgpeHji489EXx83Cz6UZz2
         LThrKM7WKIAlEAs70LFb82tCtvniXPn7gDnQq1b2LI+6vEbh68UcolD9IwtL81i3WPva
         2ZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4DTIlqlzKHu/MH0vna3+FLcXFx3UeJ+NZ435qFT+9Cw=;
        b=SGCIIAggDAeWg3b+bB7Q+Zy0XQv4Sgwaui4y5SrJ2DQN2pHS/xH+jNKkj1iWYtD6y7
         f+07D3FWzA5SgENFNGlY7reEja0o+Nj98W+u+lEf8ddGmPGKaajK3gBEr8pPm5Nttn/D
         bGqpbCi5+I4R1cPD6bAbxfvficJ/AhCQl50b6nvs2QU6vRq1rW1Lv9fYB+s623n9UoaQ
         E/5Zm+d5HYgWl5p88Tkw8o6/6cGL0KL3oKeL/N028qC5pVP7kaoN2lYwGUN02Vioqcal
         W/SNjfwCnY4M0hMTCYUr8GdsnS+iJZ1DAIHnPFtE/rG+crO9Gx1YuyAG7TKZENt8x4P3
         ZvUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DkIqsUC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si7845462ybz.51.2021.01.29.05.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DkIqsUC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Tus-00048L-LB
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Tmz-0005Nh-23
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 08:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Tmm-0000OI-6T
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 08:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611926762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DTIlqlzKHu/MH0vna3+FLcXFx3UeJ+NZ435qFT+9Cw=;
 b=DkIqsUC7gAnx+QdJ8cpzQK8wt87DA434CXyGFEa4tZxUdCijIE0oyV6IZeU8CQSg5BM85B
 VeT+JjgDOGsi6xMvlVeUC8BPVgv/M67f4qTP8dXmd3PXfZJ8+LOildckjl72rkGeugN39V
 TtFuNGYYDYMpkv5vRU64X/PijbZHQzE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-oNI1fABRM0eiqQJZg7bkyg-1; Fri, 29 Jan 2021 08:26:01 -0500
X-MC-Unique: oNI1fABRM0eiqQJZg7bkyg-1
Received: by mail-wr1-f71.google.com with SMTP id j8so5056533wrx.17
 for <qemu-arm@nongnu.org>; Fri, 29 Jan 2021 05:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4DTIlqlzKHu/MH0vna3+FLcXFx3UeJ+NZ435qFT+9Cw=;
 b=JDpHCB8SEgkX/rEl1RufcL9xifGx/Op763PQtYMYWAF2Rgjl7FGRBUA36YPM5Y2Xbe
 kEmz/qX9hZcxPKmQMtLOs5lVBRVSZtuJhoKCWf34YptN3uSVLNNxJyhu37heAhWW9TUV
 JVhKMdI/M9XgkV+omovqnMMj3LP/eS+6txUjd5sYxhUJN/pVNoU4SDXahP/luUq0g/by
 GIolA1VbNo+MtWgTZX28BH+YfuG4dYJGb34W/AT7Vo6FKUthnsr62hSWluY3Toqa6Olc
 Nv5BwvpacHStKnng8LKYzppiM7bgchgHRHTFrXlsYpNNDQHs2Lq4I2oKiLdLsXjQYjtj
 2CpA==
X-Gm-Message-State: AOAM532POeP9BJCVXAy4m1hL+GyTd8PWcPMH+blw8EnOjSM2gCAfG2E6
 FVjXMF03L6GDxRHCoFyjQgIYZ6t28OiOM/2XT4l7Xx+QNReMlU7au/xBBBUzRyUQsMG9OagmZf8
 puZf2czQ5QZoq
X-Received: by 2002:adf:eacc:: with SMTP id o12mr4541818wrn.202.1611926760041; 
 Fri, 29 Jan 2021 05:26:00 -0800 (PST)
X-Received: by 2002:adf:eacc:: with SMTP id o12mr4541778wrn.202.1611926759874; 
 Fri, 29 Jan 2021 05:25:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b11sm12236438wrp.60.2021.01.29.05.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 05:25:58 -0800 (PST)
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210129081519.3848145-1-armbru@redhat.com>
 <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
 <20210129121752.GJ4001740@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bacb8bab-2719-ae96-f1de-91e598b98abd@redhat.com>
Date: Fri, 29 Jan 2021 14:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129121752.GJ4001740@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: plWrHcyK46gV

On 29/01/21 13:17, Daniel P. Berrangé wrote:
>> On this one, my vote would be "no". "Versioned machine names
>> include the QEMU version number" is pretty well entrenched,
>> and requiring users to remember that when they want version 4.2
>> they need to remember some other way of writing it than "4.2"
>> seems rather unfriendly. And 550 uses of '.' is a lot.
> We can't make  keyval_parse() accept "/" instead of ".", but can
> we make it accept "/" in addition to ".", and then encourage "/"  ?
> 
> People simply wouldnt be able to use "." as keyval separator if
> they're using typenames containing "." (or would have to escape
> the typename.

'.' is much more common than '/', and is shared by about all programming 
languages that have JSON-ish data structures natively.  So using '/' 
seems decidedly worse to me.

Paolo

