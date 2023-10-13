Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1293876ejc;
        Thu, 12 Oct 2023 23:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhrQR0AQ0qTjbaBQYKidE/6Yy+Ic5GfPkOBzH3K7jCpOipSiXxuLMGHjCXk0dhsqrhsINR
X-Received: by 2002:a05:620a:1a8c:b0:773:a809:f059 with SMTP id bl12-20020a05620a1a8c00b00773a809f059mr29624530qkb.17.1697177756760;
        Thu, 12 Oct 2023 23:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697177756; cv=none;
        d=google.com; s=arc-20160816;
        b=OL6vQv2EhtlQXx2+p59eZ7ipZLgkIsUi2rj/EDQER2OMBsQ//3q9GhyNrt7IAAGRI8
         Yg1XIrsLfEzHAhvDd4pP8qMq3uw2ADX4rDOfrZq4+VhbhzMaJ/NpGP1j8dp5DeaLvF9K
         /oU5JM1wEEYUhQJ+OEow4lG9214XYIVaQfxgAvWxSj0XvNHC1wwTBMVveiib917PN5Aw
         bPART8or0HZrMBPBEwEPPHDRKw8FXDZiTcZXt+scK2qpW4d1vzgv4xQ9nQp8G7suTkHq
         fmALn3QY8NZjAhrviICvuP1F5XSI/UVsmOCCgIWVCHS9NxMSg9cL8M9iwWHr1SIEW9gt
         HppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=3UrCRGZqL9sg8OBQc4SfklVgJqCd9RjvXeHDnEPNIyg=;
        fh=gGZ8KC2O7OgwRBDPiLtlNf/Vfu8laUlcFY/sAMdpb+8=;
        b=gsaXRVIVV/VG/sfCd+tB9Lzp3psfbksPbJsB5XRMN4lF0dSRnDi/LVC95BUdqRsRpu
         IHEpWe/nJr4OzFiGpfcMr1tjzJEFqJIT0W/LBikPFwyMTdcM1v2V3tLWmHPdn/xxp/jT
         u15wZbvOrC5o9p6HtYCYgrXSr9fFRAh3Y4987UNo4EVqg2eO8vBtO5BCcHQklIGvnUfG
         LkfD2/yzp3uI617zxpnnr4sX/pveTPof72aCmYXf1SjWx6/wk83Lfdff5huntuHvZYAy
         +7BIQtkG51pbIBVLJNvoZcjq+tC70YiVnOKW8tfa4BY1iSTgwdxqYCJn4nZRRtoRPm/1
         nKLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CxbiVL6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020ac87fcd000000b00419c9df4106si739347qtk.116.2023.10.12.23.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 23:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CxbiVL6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrBSi-0002NY-NQ; Fri, 13 Oct 2023 02:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBSa-0002FO-F0
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 02:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qrBSX-0003Ba-Te
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 02:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697177741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3UrCRGZqL9sg8OBQc4SfklVgJqCd9RjvXeHDnEPNIyg=;
 b=CxbiVL6adhQm+g7xUwqoZu2EUL5rZPkU6NHHpSqBuLM8FxykCogp2iDMbASP1gd6LxgDwx
 aGYgyiGmzssxGsfongNSKPW+J3RTqz1GeEqEY+wNczWhX/ISUBQjFCqfPzhQJr/PdIWd/N
 0jzqBM/gMmlcLjQUjZFPxUaZK6umn7w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-I_dssvhSO-C0emgH260iUw-1; Fri, 13 Oct 2023 02:15:32 -0400
X-MC-Unique: I_dssvhSO-C0emgH260iUw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9b98d8f6bafso122737666b.1
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 23:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697177731; x=1697782531;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3UrCRGZqL9sg8OBQc4SfklVgJqCd9RjvXeHDnEPNIyg=;
 b=e71mHEz744Mt+Hbhik4pkGTUivXBcWoNWLx0ZRcZJxjySYugHit3ZsnKHjuhZsh0Bf
 yzW+65ITxAfpzTndu/Wgk0NafZ4rB9IOhAhC2plnvrol1kZj2jbzCJiIE/6RSrByxWI/
 f2wDl8zxMXErNdmSj2ODD0+4VcB+S5M9Q0If6peiNz9fYe3KVeCvCk4XB9Bl8Hc3bCZv
 mdO2dMzNC2PlLumtftRPEFkJUGaIRfz5Q/Ar8UAWlwl++wa3lVPKlAI9WzAF9oOyXc/P
 VPXx4pYegB9PZlr33+RGJkffsco3edbC4mjnDD43HwSJFVwWYEVgos4KfkaypEmYRTBb
 yS7g==
X-Gm-Message-State: AOJu0Yz3WUXNJ8JYVu004DsOLIVYSe/8iY8zXE+jUfXweeWFjpS7kZ6t
 A1wkQoqC0sIMO4zBuK+FPbk+GCc/X3Qn75ucap9VQnz2VQC/lCW9zIfhcg6KjAyeKWSJUDVwfRy
 zcL5+/urI2Hjy
X-Received: by 2002:a17:906:2210:b0:9b2:8323:d916 with SMTP id
 s16-20020a170906221000b009b28323d916mr25451897ejs.17.1697177731300; 
 Thu, 12 Oct 2023 23:15:31 -0700 (PDT)
X-Received: by 2002:a17:906:2210:b0:9b2:8323:d916 with SMTP id
 s16-20020a170906221000b009b28323d916mr25451884ejs.17.1697177730925; 
 Thu, 12 Oct 2023 23:15:30 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de.
 [109.43.176.176]) by smtp.gmail.com with ESMTPSA id
 gt26-20020a170906f21a00b0099bcf9c2ec6sm11926505ejb.75.2023.10.12.23.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 23:15:30 -0700 (PDT)
Message-ID: <9f9f8a1b-f656-4cda-a1d5-b15cfb91a3fc@redhat.com>
Date: Fri, 13 Oct 2023 08:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] tests/npcm7xx_adc: Clean up global variable
 shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Tyrone Ting <kfting@nuvoton.com>, Markus Armbruster <armbru@redhat.com>
References: <20231009100251.56019-1-philmd@linaro.org>
 <20231009100251.56019-8-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231009100251.56019-8-philmd@linaro.org>
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
X-TUID: VJ88Ye5BFLxS

On 09/10/2023 12.02, Philippe Mathieu-Daudé wrote:
> Rename the global 'adc' variable in order to avoid:
> 
>    tests/qtest/npcm7xx_adc-test.c:98:58: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static uint32_t adc_read_con(QTestState *qts, const ADC *adc)
>                                                             ^
>    tests/qtest/npcm7xx_adc-test.c:103:55: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static void adc_write_con(QTestState *qts, const ADC *adc, uint32_t value)
>                                                          ^
>    tests/qtest/npcm7xx_adc-test.c:108:59: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static uint32_t adc_read_data(QTestState *qts, const ADC *adc)
>                                                              ^
>    tests/qtest/npcm7xx_adc-test.c:119:53: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static void adc_qom_set(QTestState *qts, const ADC *adc,
>                                                        ^
>    tests/qtest/npcm7xx_adc-test.c:135:57: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static void adc_write_input(QTestState *qts, const ADC *adc,
>                                                            ^
>    tests/qtest/npcm7xx_adc-test.c:144:56: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static void adc_write_vref(QTestState *qts, const ADC *adc, uint32_t value)
>                                                           ^
>    tests/qtest/npcm7xx_adc-test.c:162:59: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static uint32_t adc_prescaler(QTestState *qts, const ADC *adc)
>                                                              ^
>    tests/qtest/npcm7xx_adc-test.c:175:64: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>    static void adc_wait_conv_finished(QTestState *qts, const ADC *adc,
>                                                                   ^
>    tests/qtest/npcm7xx_adc-test.c:196:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>      const ADC *adc = adc_p;
>                 ^
>    tests/qtest/npcm7xx_adc-test.c:207:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>      const ADC *adc = adc_p;
>                 ^
>    tests/qtest/npcm7xx_adc-test.c:235:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>      const ADC *adc = adc_p;
>                 ^
>    tests/qtest/npcm7xx_adc-test.c:267:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>      const ADC *adc = adc_p;
>                 ^
>    tests/qtest/npcm7xx_adc-test.c:293:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>      const ADC *adc = adc_p;
>                 ^
>    tests/qtest/npcm7xx_adc-test.c:311:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>      const ADC *adc = adc_p;
>                 ^
>    tests/qtest/npcm7xx_adc-test.c:93:5: note: previous declaration is here
>    ADC adc = {
>        ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/npcm7xx_adc-test.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

