Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2470706ejb;
        Sun, 3 Dec 2023 20:55:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF37Rpx/FPj4yj72QlXlNkTrmK9rezhKxLEYLHTRnJRfvLLsfybzxN/t6vYKvaLTrINEsRx
X-Received: by 2002:a05:620a:410e:b0:778:92d6:db0f with SMTP id j14-20020a05620a410e00b0077892d6db0fmr4886807qko.20.1701665752695;
        Sun, 03 Dec 2023 20:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665752; cv=none;
        d=google.com; s=arc-20160816;
        b=E6nsc8NJ1q+z4f0RStYSMlQzszIvdD6sZMK6PPMaZjnUX+BkxYgg53PXfphxdXOcdf
         HBBteL9KF1RO+8O8Og3tgujxhShgPfnWhAipaPL5TZpBoZ8iBA9bj1x57/DH/r211YXq
         dnI3XnRvEhBcUnoLtLZ4oFzTIuhS+PTc173f1DdtDb/RGLvmF4E8IsIBC83RyZVjglHD
         wSCkYn6zuwYIaKRxKcsA7MxA9VI6sw+I0IlL3CcyXI0lD3gk+RtibaJra6w6flJEZxpE
         Kyh0dkyDMNJdLByFt6UkaI1u1jR/7jxahqTQLyp0THZyksGeiEJ3ISQwO5Z0Eu8cEo+S
         6TRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rdKJBSB8SWlkhKkke+4UGVqN6RjryXRG8SYwMu15ntY=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=0OIEh7Eoqy9FDCrBzy24irizywSpQONGesf8kN5gi4g4Uxj9LaNkJVo5tBBhdRocXU
         ZWGJafj2N8JvalrAhiVlsn/YsN59UsGNdgrBwEYtDU34kgRLl2K/3nYneFE34WG9PF3j
         0LQWQhyvMCuW9jqT6j52gXc2xCeIvP8U0/+zdz1QvGwuNLaF0hwr6lumDwhsY+YuC6UA
         jh+D96fpo1lDmhiby8l6DrIhpozSuT7pgI3I2boVkho5zsMxW9LHt2FUbkfzYoye/6pc
         8h2PhetdMtHC9xd492w1q898hgBlNOloh1HRtdbg01RN4G5FMyu5bh3tFT6t0oTQhJ5Y
         7Q5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QThjf1Z+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay8-20020a05620a178800b0077f0ba85196si1867650qkb.423.2023.12.03.20.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QThjf1Z+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0zi-0005cd-Oy; Sun, 03 Dec 2023 23:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0zh-0005cM-Bv
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0zf-0005EJ-Tl
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdKJBSB8SWlkhKkke+4UGVqN6RjryXRG8SYwMu15ntY=;
 b=QThjf1Z+sAl1tO6IfAUOzJIq1gMsMCUYFknZjAU1nWMNvZrE+lgBWEl47VdPXcnwUw5iSV
 s/aoq+kNz48D28tZAbIa0RK4S3Tr8ME7urf6lq2v3Tx7NkhCcL5bjWtbN2avVDnCzuidni
 3QWRI+wBqrprgTFSD6Q53pTiYixk8Ss=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-_19_butLMOqmWeKp6j4dcg-1; Sun, 03 Dec 2023 23:55:42 -0500
X-MC-Unique: _19_butLMOqmWeKp6j4dcg-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-5c5fe3b00f6so2825685a12.2
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665741; x=1702270541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rdKJBSB8SWlkhKkke+4UGVqN6RjryXRG8SYwMu15ntY=;
 b=iBuFrrHESZXuISfG3O08zhBuNkqRkGMRYQFdWu1SlGsDizfw+0cE6Wjpn+QrvCfJp4
 xiS+194L15B1t8KfYN6ipqMLSjx2iobvOvwf4lzdiOqbr6vI21lY+XPfHdRjmycCViyJ
 PuT58b4APjwMVSFxHkPzkakqjmoJt6mV66HyZh3nQ4+r7QB/LsEs+3I+k/zCH8Re9kul
 3BrWCrUfzJ526bxG7ylK2T3VqhCTuWUf292Y6c1j0Bv7gVjyu3u4fdlhQqL+OsDC375l
 re2UiPCzDdnnkt8jCDEG4AUTgTb5ip6sgLzpHPIfryk1HJeUUV5lAZiVG+/kigz9+zgZ
 3IIA==
X-Gm-Message-State: AOJu0Yxy/p77M2Dr1x0FXKYek0sSJWyicKSCMG4aVilF+iAsmLGZ7WPn
 8ReUdvedhyBrQMsFE83vAuxrB14ASdOSrK+0FBZo4J/29bIMnREjcW36ZdlTCxDSzm9SBg7op0d
 DCminYzlduHGg
X-Received: by 2002:a17:903:181:b0:1cc:449b:689e with SMTP id
 z1-20020a170903018100b001cc449b689emr4168539plg.20.1701665741123; 
 Sun, 03 Dec 2023 20:55:41 -0800 (PST)
X-Received: by 2002:a17:903:181:b0:1cc:449b:689e with SMTP id
 z1-20020a170903018100b001cc449b689emr4168536plg.20.1701665740862; 
 Sun, 03 Dec 2023 20:55:40 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:55:40 -0800 (PST)
Message-ID: <9a0b4af4-a91d-49a3-a05a-abb073ac8ecc@redhat.com>
Date: Mon, 4 Dec 2023 14:55:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 14/25] backends: Use g_autofree in
 HostMemoryBackendClass::alloc() handlers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-15-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-15-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: oz/ekGRkMoIp

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> In preparation of having HostMemoryBackendClass::alloc() handlers
> return a boolean, have them use g_autofree.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   backends/hostmem-epc.c   | 3 +--
>   backends/hostmem-file.c  | 3 +--
>   backends/hostmem-memfd.c | 3 +--
>   backends/hostmem-ram.c   | 3 +--
>   4 files changed, 4 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

