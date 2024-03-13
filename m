Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2523526ejc;
        Wed, 13 Mar 2024 08:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3smfjYIJC69as1odalT7ZacMipGAXQfeQVmeDdivdBw+PKx9PZ/3m/ZnyWj3rTwgVJVvEef78SeY3LRduqjCLR6WVIho6
X-Google-Smtp-Source: AGHT+IGlf0jmauHSjNSL5/daZ+Vd6WmxZhnXdDTej0K43VkAVMQdiNeQbSX3NraQx5wRSkplkNWk
X-Received: by 2002:a05:6830:10d0:b0:6e5:302c:3d21 with SMTP id z16-20020a05683010d000b006e5302c3d21mr175879oto.12.1710342501981;
        Wed, 13 Mar 2024 08:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710342501; cv=none;
        d=google.com; s=arc-20160816;
        b=IOJfRvF2xQukcQjSBvHFw2vwoUY3Xh2665oJ58Q97+K2VPq1UQ8oPwqUY94zbuEsu1
         6/4e1AODaZUXGD9H/Jr5HxrrlN7TnytflYRUlgnhgw95zNGeDiam7aUeIKb5Ts0BSbMG
         fmov+UHWjTXsn3mR7A7JlCSn3HlkLtMg7Bw5bJMsCO07CvOoth6cwaV5F6xSluvSgWLb
         Rdr3PFHsCuMnEMxEs2pChBh5psYX31om7uoXaM0PwJeo1D5JtzN2kcsxDQup2gAGlT/S
         TZEC/PGtPXatvcDi6AUlgVfuMp6mAqSI9BiZfodgtSAibLrfmSGVJFmeKdcb+9JQnf4T
         6GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Tu0xD7ZBnedeOj/EZ3f7V7ofbAbfcxgSsqyDiiEt/h8=;
        fh=enl3uaWKKceeFZW9C8TvPTn1LLthtvrXvK6SBcK0vxY=;
        b=CkKrEUpgk+NOOagUhCQbgfJ10lsbBOGOo8QKM2QCDwarAKGpg44omYYCfv1Rks5HZw
         Q6nMgYXkQRzevxXu/zrEDsGHt2FsAzAD1Q9HtWm63olhMoF0ZXOcXdTFN1IO88b9WxIJ
         7Se/6jZhe2IpV7+EqUpXsxMFGDvo+RynqLCvAfiaISybCtSP83FIQ4Rcec+D8t65XKMc
         2a+fEwCRx7Oj4uFbPsFQLLk0Xs431UFPbUvUocd7QHCdwVZ0cf+ZCbjtTUUjbxtc033F
         9zJ0TC8J4WTlUC3ReitG4hHeswFgVJuCMnEv7nfKPyOECGgZuAWRKqGK3AiPS564Bhv5
         vO6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6R5OSjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n72-20020a1f724b000000b004d4069c5537si503889vkc.232.2024.03.13.08.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 08:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6R5OSjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkQBs-0000Rw-0h; Wed, 13 Mar 2024 11:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkQBp-0000Pn-8E
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 11:06:45 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkQBn-0005Fj-MM
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 11:06:44 -0400
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-690cffa8a0bso20973426d6.0
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710342402; x=1710947202; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tu0xD7ZBnedeOj/EZ3f7V7ofbAbfcxgSsqyDiiEt/h8=;
 b=a6R5OSjlu56cuwxfIXK/9dsVcNuS1u7Mx9djk+pCZgANlulK/WyrBWApgaUldf67sr
 KXC3VFhu6qefnJOM9uuIxrE/CiwUL0y3JaXbuDmim8f728rxH+gdjjcXy8Z1fwiyQ9Na
 zbtkkTYAZr9bE83hle3ZH0iCK31ecZeaiCfMTRetPUtNY0MWhToP7r8Bdp8+REJoVdCP
 HnIDRx/AqzBrlvzWwTQNms3BrBNk3ir91LZ/tgyHkKM/eBUT11Q5yNkjM2CuCPbLtL21
 S3FJ6KHdq6Y1gRvT3je+AoUnFu2R/7Pk6iOSo6cDl2o57+4anwVwJHNtb4346hKFLC0d
 JCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710342402; x=1710947202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tu0xD7ZBnedeOj/EZ3f7V7ofbAbfcxgSsqyDiiEt/h8=;
 b=IoxO9UWvoP61NdsaRfVTLeiyrIyVmRr7a7wHdZOriHSWZGWH5sLcdXaa9sBi9R9y/k
 67lvv8QzE2ekRf7DsZxw2SxmxpoOwYjSn+oCz+QXtCfLvV853L1jhI//RBislr600cwi
 IUPDDtT4ZGsDqG5rv+VCrWfuSiULEjlAQjDdVDrrXHI5kyd61Xm6BG5kE/CUsonbDyEU
 ofBUZhAMaAvB//EKzlf0XtyRPc8ACWXQOiWYNpqkZtCTz1VX8HG3GFKmN7Qt5ewpU3bs
 BSobRwXVLJa/Vy7GzJy233RcivA0jRMeqZ9vtqKYeLZORjT7JNdX8sJWxjizTWSQ2x8h
 B+1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLD33qdeiDXXLwoAJ+wXhpNuCgTVNv+S0/7QRNiRPCSUVTmILqstQtbHohmVAW4gnmPC7QWAyLw5Z72Up054WE5kHU
X-Gm-Message-State: AOJu0YytKimCrJDsG9EwWd0guybN0+cItWvape+tpSQgaj0DochB4H76
 UO2Od2fjguMQx+BuByj/P0qp4PCzrDD/VuZNggpCKJmuLUwRGkt+DYd6qjPr3/WcVlNp2gAEiif
 aJYk=
X-Received: by 2002:a0c:eb08:0:b0:690:74bf:9e7e with SMTP id
 j8-20020a0ceb08000000b0069074bf9e7emr57607qvp.64.1710342402481; 
 Wed, 13 Mar 2024 08:06:42 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a056214163000b0069111c5cdd4sm894321qvw.100.2024.03.13.08.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 08:06:42 -0700 (PDT)
Message-ID: <06fb4fce-fd61-4813-9bbe-aeffdd5fd429@linaro.org>
Date: Wed, 13 Mar 2024 16:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/avocado: use OpenBSD 7.4 for sbsa-ref
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
 <20240313-sbsa-ref-firmware-update-v1-3-e166703c5424@linaro.org>
 <8c197bfe-0cab-47dd-beec-c9752d434a47@linaro.org>
 <fe2abd47-be73-496d-94a4-0b6d95f31bd1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <fe2abd47-be73-496d-94a4-0b6d95f31bd1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=philmd@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: lCrPOINBoaGZ

On 13/3/24 14:39, Marcin Juszkiewicz wrote:
> W dniu 13.03.2024 o 12:44, Philippe Mathieu-Daudé pisze:
>>> -        :avocado: tags=cpu:cortex-a57
>>> +        :avocado: tags=cpu:cortex-a57,os:openbsd
>>
>> IIRC for some reason we must use one tag per line... Even if
>> named 'tags', this is handled as a single tag, so we couldn't
>> filter on "os:openbsd". We need:
>>
>>    :avocado: tags=cpu:cortex-a57
>>    :avocado: tags=os:openbsd
> 
> OK. It worked when I tested this way:
> 
> $ make check-avocado AVOCADO_TAGS='machine:sbsa-ref,os:openbsd'
> [..]
>   (1/3) 
> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_cortex_a57: PASS (16.18 s)
>   (2/3) 
> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_neoverse_n1: PASS (16.06 s)
> 
> $ make check-avocado AVOCADO_TAGS='os:openbsd'

Oh great news, TIL!

> [..]
>   (1/3) 
> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_cortex_a57: PASS (16.18 s)
>   (2/3) 
> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_neoverse_n1: PASS (16.06 s)
> 

