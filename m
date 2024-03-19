Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1133176ejb;
        Tue, 19 Mar 2024 01:02:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMofC5U1xe9PWR+eR5AFG+YKN3OuzTdl/x7c+vXf/WKu04vlrWG3FUcNIQYLbqOzJuUQwtiHN4EeBE6RfMSs6v7jO8OBhn
X-Google-Smtp-Source: AGHT+IGVRzH1Ku3oalDHujmKWT1Go1L/VuwIKOyxMHTmtkQDRSzwssJ9g1q7TcdsB5ceVdwhQtVw
X-Received: by 2002:a05:6102:94e:b0:474:d117:5deb with SMTP id a14-20020a056102094e00b00474d1175debmr1684887vsi.28.1710835375870;
        Tue, 19 Mar 2024 01:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710835375; cv=none;
        d=google.com; s=arc-20160816;
        b=eN4sXUHoaXKVcgwr3qY5/0+HDh2ykvTEbiv546rL6At6o1TZbbVZpw9yhEtgQ/YxZ5
         QMs/IHvT8Bqe5b5pBuNCG6kv3WLT3ynMEOaR1z1w5VjvltGodPb7VZq8k/w7r+zbQfyS
         L+v1Rx5f8jkUBAbm3L/Mjp4KiNSWe14md4S4530tHIyPgYAb1Hw17ztJ8z6HMQ9oudas
         R3VAUlDzvwseJrq0gzZD2dOapIwVgzyhSqYOVk+s5H22DeimeHQQYBNjcqk6XwU35Lrf
         SjpXNctMOAXAeusVrDeDeRzbjC0++yJPVYG89wCmsEjd/cNvxsOI+XcdJGKR9fffRVjV
         Hyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6v410EBpftyyuKfXSszObZvMSIhKs2gYmA87nWtbCAE=;
        fh=0IbNWlnWEnaoi1fG2xzVPEnHM6Tz2FBw0ItTz5zJ2wo=;
        b=Gp06gaQoYVBta/UojdMCF4r8tGf4OfZK0x0VaIpigthdOvHehcL6A131Ot2UGKK1e9
         fxKrHed7jIWd665nrWXAL59olG3dUK7RVql4dKFWKEyYaP5AhJ45uUvZ1SGEUAwqn6w8
         CVXxH4UKLatZWg2lzyHZGxl3j+bWuvBMNBboR2zmG3QeKJLpv6FVMczWE826prfvCQKT
         u3cOa0pBl4U7Mqa1yhCrOejfpfr8NJ5RGd75stB6n7dB6HVGSaVmJcRcn8CFwvGzUXsz
         k5XEs1hsjTTtkwX/R1owQEdsp9HkvvjGxvapE1IzvGNvc9V5jG+/WMizMsSxdetsZFqs
         Deng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVTzGw+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im13-20020a056214246d00b00691682e6013si9906543qvb.604.2024.03.19.01.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 01:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LVTzGw+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmUQY-0001A0-Bl; Tue, 19 Mar 2024 04:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rmUQW-00019I-JO
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 04:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rmUQT-0005oL-VY
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 04:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710835344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6v410EBpftyyuKfXSszObZvMSIhKs2gYmA87nWtbCAE=;
 b=LVTzGw+Uvzcx5Okc5P3MUpw6zoD3G7OgexHj4VlrblDGiaXjmM8EslvBgI1kYODCDpxUZO
 us4StVAaUz7ckxukzkZaoDfkY0LO1EOy9knyIsKpCmTHMmzb42FaOItpWnK924RFoxtelC
 diFgb0EWD18Xn31VCyrZ+NGFhkwnuZY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-mS9SvUT_PyCLq0tDQZOd9w-1; Tue, 19 Mar 2024 04:02:23 -0400
X-MC-Unique: mS9SvUT_PyCLq0tDQZOd9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4140dd880b2so12146555e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 01:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710835342; x=1711440142;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6v410EBpftyyuKfXSszObZvMSIhKs2gYmA87nWtbCAE=;
 b=mOsXw5Z4mkuMp9S/g5i3B5IN4+GzVYK5m8NB8f2xZpCEdSI+I3BRxrgwlY0md+4rgq
 T2XcIanRYz4GvS5K54YWSd06oHiLfFahY0KSEE+jl1pcjm0snH1Zcr5ui1wrIEtt+fbW
 tT+53TwwTcTIr8nF/TGNUFch//ca9svrsDx2gQDP1n7GANGiYZ9Oxmu5b6exdYSxIS1u
 /sCF29mZPt08/JB8edYlzFqSjV/taAoPjLVzKtcgzSTQL6U+fbTbuSFk/Dpf2bDzZGCl
 nPYQtqKqcpkZVimwHU/lsLMbe6hFweEB4og9cXlxO8wI90UiAdNIvQee1ZV6twNQgTnc
 U44Q==
X-Gm-Message-State: AOJu0YyZjTSwmkv++H8roXWa76cUea6El2aVM8Wt1qP1ts91TVWSUXo1
 81/x9qrGk/fUqaw4mFlFbxA7u5J6iwu+EFJcN8eX4YaPQ7/7W/HpmcZmVSOwucMT7uo9uswM3Dx
 /1c6YDquJEYZ5ZFPLfd+uwjIjB6kJ7WgYFQStxHAVD34y55URnQ==
X-Received: by 2002:a05:600c:4f53:b0:414:ed4:e959 with SMTP id
 m19-20020a05600c4f5300b004140ed4e959mr4946284wmq.41.1710835342031; 
 Tue, 19 Mar 2024 01:02:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4f53:b0:414:ed4:e959 with SMTP id
 m19-20020a05600c4f5300b004140ed4e959mr4946258wmq.41.1710835341632; 
 Tue, 19 Mar 2024 01:02:21 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-50.web.vodafone.de.
 [109.43.177.50]) by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c4e4200b004146762c289sm315541wmq.16.2024.03.19.01.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:02:21 -0700 (PDT)
Message-ID: <dfb5d303-a143-472d-a1f8-a029c975e360@redhat.com>
Date: Tue, 19 Mar 2024 09:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed/smc: Only wire flash devices at reset
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20240319073320.315170-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240319073320.315170-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: yvGtWcHamA0M

On 19/03/2024 08.33, Cédric Le Goater wrote:
> The Aspeed machines have many Static Memory Controllers (SMC), up to
> 8, which can only drive flash memory devices. Commit 27a2c66c92ec
> ("aspeed/smc: Wire CS lines at reset") tried to ease the definitions
> of these devices by allowing flash devices from the command line to be
> attached to a SSI bus. For that, the wiring of the CS lines of the
> Aspeed SMC controller was moved at reset. Two assumptions are made
> though, first that the device has a SSI_GPIO_CS GPIO line, which is
> not always the case, and second that it is flash device.
> 
> Correct this problem by ensuring that the devices attached to the bus
> are the correct flash type. This fixes a QEMU abort when devices
> without a CS line, such as the max111x, are passed on the command
> line.
> 
> While at it, export TYPE_M25P80 used in the Xilinx Versal Virtual
> machine.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2228
> Fixes: 27a2c66c92ec ("aspeed/smc: Wire CS lines at reset")
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---

Thanks!

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>

