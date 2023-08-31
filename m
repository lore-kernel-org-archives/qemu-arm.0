Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4933927ejc;
        Thu, 31 Aug 2023 01:54:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt+HHsPgNT3ratViIcbd3QPiMxh7kVqiTiQTf/UgUVPrGNxRw7yYVN/Pn2eGdzWptCgOr+
X-Received: by 2002:a05:620a:20cf:b0:76f:3e5:8b68 with SMTP id f15-20020a05620a20cf00b0076f03e58b68mr1800289qka.45.1693472056569;
        Thu, 31 Aug 2023 01:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693472056; cv=none;
        d=google.com; s=arc-20160816;
        b=OddW5o0DjLIrpcTabuk+EKmqn2JcMZl/Y89ld/cE1TsOfvP1OXvd8gIj3KSYstKdNs
         jzmpHbebtIGqF8vgmgM4k8fIOlMo4/sW673eicIa0cpvE8Qrrm1V8gz1iYDMccZ+AKe/
         OijFOwEd2lDggYOuK0VUeHzKvKW6HNnfSWwOXMQQJ3gCaoFL9B5oZ+FtVV2MCaAlfUQ3
         6wvfLBV6o2mMDbU5O6qBVeWqkiekhCIH0C0m+Wvi6meQtnpm3jNVrnL+T3oEK87fIiSj
         CCVR9ZE3OgKIz25CgAl5kCX/mhsNztlY1W1lVVYh2WMyqoyiBFmnwr2w5fCKlcBSGqIg
         4xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nccofICTcpy8vRW011/RXLWH6APMxo9jTHGtz1Ll/qo=;
        fh=BM3agg2UbWZyrDjF/r0JJ8eLoJFPL5BmEISe5qXSk+E=;
        b=RQgw0ssdm/2wvlW/WcxzbwzYzl/rWzi86xd/FiA+TWeQHvixxClUAzFzGui4TJYLVa
         5oOeOHwCsGoscSTWn85slSbiYHFOaDz3L0xmYaKN1hhczVstnemX9h8o00JEk50kYreE
         e6MZ0l0mBBXQl39LY6uBlvivu2gOihRWj6zrzKhGJx6MYajn7d2AifP7QUN6LJ/Iq0Zy
         bB5d8gjkNmlx4YzaD7ONEeK3bc/LF8SwgvemOVUVyKlrp9Y8N4kkG54VrrGNoKwJKEAk
         Ifc/gDmWQ7Tod5o6BRkyprLshPabWHb+JDNYIGF1J8sb22CIEMBOmdtKe6DxZvwgV/Hj
         2QsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IlGLwddl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a244300b0076ef65e3814si630842qkn.116.2023.08.31.01.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 01:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=IlGLwddl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbdQu-0006R7-Ov; Thu, 31 Aug 2023 04:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qbdQs-0006OP-Vc
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 04:53:42 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qbdQq-0005Ya-DW
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 04:53:42 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-26fc9e49859so436096a91.0
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693472019; x=1694076819;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nccofICTcpy8vRW011/RXLWH6APMxo9jTHGtz1Ll/qo=;
 b=IlGLwddlTdcryRsNuVtbmvut9O1lZIijIEyko1Bn1xcvKwN4O+3oqwSb2oWwYhD70a
 MM+70BDqzOUD5ipCP/XQyNxEZVf2dsUIJm9oNm/TSDQftESbY0c3zozgcSooWfCxb+Eg
 6ly0GC0bziiQqy1LDqwhThag5VNUCiEFE7ut/z7pzwDKVvttNeUL3/5pV3lr8/th+o5R
 Gt0qaZU3wZrtMx/bwdIQcGnMN2AqbTOYoICOOEqBbCI3MfOTlcsQ5LpMUYTuv9qXJmv4
 ICQOHGWoUFKmHke4YSdcrgNBWy9i5h8gL65FQBc7eTWbYcLGAJb7omRYAlDP9bTR4LM6
 W76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693472019; x=1694076819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nccofICTcpy8vRW011/RXLWH6APMxo9jTHGtz1Ll/qo=;
 b=Hxl/ePNLt71M0fT+tw44CZjtzGL/vVoemNBJ7KNqCczIKUuBVKKvRcbk2PnhJee0s5
 eafZh0tB/XzhuwnTspPcFGIjsCiB3+FiDCrwaktXzxeeiIrF12Fe/W2NFP5ObV6OAqP7
 8fpnzNE3/itmvWBEMpru7E54mEP5zxbW+ACaEyCjm6YhTmOcj7kRA8jIH3cwXbLzyHGn
 vti69RjOexYTDXks9Skgxf6RLtMzkCW5pdtlRjj6fuFtaCnZtzNA4TqntMyrloL0ck2C
 HFpZlE48H16hfOOrLn/sKpJ9nFxtyIC5hEQfnT1htwryveSisdLPgtH8u0w4Wtxb+KOU
 t4ow==
X-Gm-Message-State: AOJu0YwjPfVsWMvEqr5TDN1mooAhFrqQuIqAb3X+VN0lv/PPmH8zSRvn
 3YDaMqCwaO0RupL784zFJhhTjw==
X-Received: by 2002:a17:90a:8a81:b0:26d:20ef:1d32 with SMTP id
 x1-20020a17090a8a8100b0026d20ef1d32mr4518862pjn.38.1693472018644; 
 Thu, 31 Aug 2023 01:53:38 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:d54:e521:8bac:7bed?
 ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a17090adf8b00b002696bd123e4sm862407pjv.46.2023.08.31.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 01:53:38 -0700 (PDT)
Message-ID: <c933da5b-92fe-47f6-ade1-9c1e2770aa23@daynix.com>
Date: Thu, 31 Aug 2023 17:53:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] build: Only define OS_OBJECT_USE_OBJC with gcc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230830161425.91946-1-graf@amazon.com>
 <20230830161425.91946-2-graf@amazon.com>
 <996b4057-6d64-3803-792b-f6c49dd9f3bf@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <996b4057-6d64-3803-792b-f6c49dd9f3bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tyIG/+neeP65

On 2023/08/31 17:12, Philippe Mathieu-Daudé wrote:
> On 30/8/23 18:14, Alexander Graf wrote:
>> Recent versions of macOS use clang instead of gcc. The OS_OBJECT_USE_OBJC
>> define is only necessary when building with gcc. Let's not define it when
>> building with clang.
>>
>> With this patch, I can successfully include GCD headers in QEMU when
>> building with clang.
>>
>> Signed-off-by: Alexander Graf <graf@amazon.com>
>> ---
>>   meson.build | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 98e68ef0b1..0d6a0015a1 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -224,7 +224,9 @@ qemu_ldflags = []
>>   if targetos == 'darwin'
>>     # Disable attempts to use ObjectiveC features in os/object.h since 
>> they
>>     # won't work when we're compiling with gcc as a C compiler.
>> -  qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
>> +  if compiler.get_id() == 'gcc'
>> +    qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
>> +  endif
>>   elif targetos == 'solaris'
>>     # needed for CMSG_ macros in sys/socket.h
>>     qemu_common_flags += '-D_XOPEN_SOURCE=600'
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Defining OS_OBJECT_USE_OBJC does not look like a proper solution. 
Looking at os/object.h, it seems OS_OBJECT_USE_OBJC is defined as 0 when:
!defined(OS_OBJECT_HAVE_OBJC_SUPPORT) && (!defined(__OBJC__) || 
defined(__OBJC_GC__))

This means OS_OBJECT_USE_OBJC is always 0 if Objective-C is disabled. I 
also confirmed os/object.h will not use Objective-C features when 
compiled as C code on clang with the following command:

clang -E -x -c - <<EOF
#include <os/object.h>
EOF

If compilation fails with GCC when not defining OS_OBJECT_USE_OBJC, it 
probably means GCC incorrectly treats C code as Objective-C and that is 
the problem we should solve. I cannot confirm this theory however since 
I have only an Apple Silicon Mac that is incompatible with GCC.

Regards,
Akihiko Odaki
