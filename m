Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp515323njc;
        Fri, 19 Jul 2024 08:10:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWG/KkLEPovtmpuOtil46EcZ66rlPmG9gEjP6oiPOekE1vPb4Hu++POJnkPq9tikVS0+01Vq0xQ+sCVxQnXIfHOoTDVCYul
X-Google-Smtp-Source: AGHT+IHsLQVWTJb8EBfJXssECZRNoNIXGoJwaiswQX3zXodzrGB/wslRozEJq3u/XY507DhzvY3q
X-Received: by 2002:a05:620a:2415:b0:79e:fca5:c312 with SMTP id af79cd13be357-7a1a134481dmr16387085a.38.1721401831464;
        Fri, 19 Jul 2024 08:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721401831; cv=none;
        d=google.com; s=arc-20160816;
        b=GubqHw8tejQasQI3spgh5Bmsge2c1ym7Q8504PmP3bilhaUbdZoDNsj3B7jbhYQK3I
         UwHFRntyVJJ+TYMZEzkvi8wiaVbeVduqdiqgMk/8LCUe5niUtOKSa2crMYCO20awD7eX
         cp9DepOUr2l2RqzDs3qsmH7puaPI93blHgQKmWXbtiJbLWyNVyvDStW1TI+b+C/Q/wNt
         bVZEgOhFNxcVl33b9D/g8sa3jHQUTJRtKulRHxQ9zCvzyQ+HoRI75I27EAc3DnqFyz2z
         96nuRH9Uue/k4F6nYGt+W7UfqE2Kov5nQ+ALx0U2iiaIANGxeWsu9cswiadcAgcERjez
         8/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=whNo2DLVeiwZMXGrjrW6VfVwrvZjjABKDqH5F3p3R7k=;
        fh=y1BPbP83iyzCpna35WWdKj0PyA0vmnevZjWS4Ta3NnQ=;
        b=nJwCCGnVfe5E6BgFLExQxUCbHDeC+2xrBiWmPEBqVSljr6fxtRPqBWm+egY95H5Lr9
         kqffB0bP8gt25YEiP/Q2/Vzqkaahss7CQsWosKWi6elt322wKmOAsalW6KzzQBMc56cZ
         rUgApvzOo0mjVVfu8+LDN0//uNncrLx4xVYq+RILcTjylBp18ITY+GVrWHD+S/KOKqtK
         q0QbFKs9pKa47pN/JnoS5KJpWA91Rz3L6KTRs3IgyP3WYA3esTW2EtmKYLGfHEobMlsk
         SL0rHaPlKRfZlLAl6ne2G005gV6qApw4anU1XKNhlcJLIYUmwbsL2Lzbd7pQQAWHdDTx
         8SYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEexS+Uw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19906dd8csi180790185a.525.2024.07.19.08.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2024 08:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DEexS+Uw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUpF3-000557-BD; Fri, 19 Jul 2024 11:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sUpF1-000547-Rh
 for qemu-arm@nongnu.org; Fri, 19 Jul 2024 11:09:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sUpEy-0004uQ-MK
 for qemu-arm@nongnu.org; Fri, 19 Jul 2024 11:09:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266edee10cso11788025e9.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jul 2024 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721401784; x=1722006584; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=whNo2DLVeiwZMXGrjrW6VfVwrvZjjABKDqH5F3p3R7k=;
 b=DEexS+Uw6sVNH8TZKh/8S0cDMcIvon4rNJVmjr8uANjKJ493u1IQkods0jDRsAbnRR
 I8WH2dwWqZZEphMLmFI3mAY69H/p0IQl+hg2l9WLBphy35cB0FHQxTBJFKMYop76bbAk
 /w4iRvnumvgGcZ48IGu+1WzBmPGMfBD8f4Pt1/d0V8TCv5PoEUkmcbVt3pNGvoxVUXeh
 N8T99pQ0z0GgkYBT/gVxYVIMBXpJ5RvpbFPshVzLjqo+jW/rUxpAR0FxxVzoNxn6voQX
 c/ThKqThRkrBl3zadMd/tAC9yyGzA4wiqLqUzimo6s+IGSwKkhQAHxTM5MxkYnp452B0
 TsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721401784; x=1722006584;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=whNo2DLVeiwZMXGrjrW6VfVwrvZjjABKDqH5F3p3R7k=;
 b=oi+ECn1tj3NORskfxDt/k89RXekZ3nj/nYTm0rFqSXTlb5GVlrfhc182TGhViE+gLr
 rUmQ4h5Iu8s3qWtOjQGJtzm3M26JSQpWbrLEXv3FjGuMjw7Ci6ql82xu2mOup0uQ5FfU
 klIBOeahbIXrHEwCk5q1JR7XPSAHpLGuobrFzgCK5pyNyqUlNTFHvZV40B4+8ni+wZCt
 W9wlw9rocqYIeGOAst75MBvPlTzxsX18pGKQYqa78LohW8CsO8ld3jJDVnUrikrPsifa
 0oOhzCwHi519I8iWFxH+aMtvcgPLDeSGaXVOv1GR0Y+75vdNVMujIgffzCUlluD8mXND
 Vs2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW45x0ZR/eqzdCaWEXMxyKCqThIFwxPS1KVcn/wch6Q0/j2FkbBDC5ywC+yj77nNP2aUlc9bJe0RxH0wdgKArtylig3
X-Gm-Message-State: AOJu0YzLwQYFLPDuka2nVSSJmnM3Qsjw9QMRu1Y45CTIoFwj3nPAdHt+
 Qxwj33lJtY03u0NTqOXGvlitrSpTbv++cGO6lrh8liCJ4vi7Jqzugt7jqvSKlDw=
X-Received: by 2002:adf:fa03:0:b0:367:8876:68e6 with SMTP id
 ffacd0b85a97d-3683175b8aamr6264356f8f.48.1721401783565; 
 Fri, 19 Jul 2024 08:09:43 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878694833sm1850456f8f.55.2024.07.19.08.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 08:09:43 -0700 (PDT)
Message-ID: <172eaa4a-ba4f-45e0-8dfb-f8035d553707@linaro.org>
Date: Fri, 19 Jul 2024 17:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado: Move LinuxTest related code into a
 separate file
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org
References: <20240719095031.32814-1-thuth@redhat.com>
 <02b2eb32-abbc-481c-8b5d-e6b835d81005@linaro.org>
Content-Language: en-US
In-Reply-To: <02b2eb32-abbc-481c-8b5d-e6b835d81005@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BqwpbjYDzuVM

On 19/7/24 14:49, Philippe Mathieu-Daudé wrote:
> On 19/7/24 11:50, Thomas Huth wrote:
>> Only some few tests are using the LinuxTest class. Move the related
>> code into a separate file so that this does not pollute the main
>> namespace.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/avocado/avocado_qemu/__init__.py  | 239 +---------------------
>>   tests/avocado/avocado_qemu/linuxtest.py | 253 ++++++++++++++++++++++++
>>   tests/avocado/boot_linux.py             |   3 +-
>>   tests/avocado/hotplug_blk.py            |   2 +-
>>   tests/avocado/hotplug_cpu.py            |   2 +-
>>   tests/avocado/intel_iommu.py            |   2 +-
>>   tests/avocado/replay_linux.py           |   2 +-
>>   tests/avocado/smmu.py                   |   3 +-
>>   8 files changed, 262 insertions(+), 244 deletions(-)
>>   create mode 100644 tests/avocado/avocado_qemu/linuxtest.py
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

