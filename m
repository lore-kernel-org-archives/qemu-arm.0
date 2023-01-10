Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2977093ejc;
        Tue, 10 Jan 2023 00:02:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuv1Izsc5hGuCj1UsNrTM0+uW1MGMBkvvNAvyAJaP8gyZLI1Nd5RLKi6h7/0qWd7wo8v3TL
X-Received: by 2002:a81:c85:0:b0:364:1ba0:e6c5 with SMTP id 127-20020a810c85000000b003641ba0e6c5mr17983413ywm.33.1673337773701;
        Tue, 10 Jan 2023 00:02:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673337773; cv=none;
        d=google.com; s=arc-20160816;
        b=zLYPpcN3DXrAZ3+pA02cwUNoL/E2u5N8nB7BUpLAMMp0+W29Q2V3ts9rt+ts6H7kmw
         Kri1kWPAXJfs1BEu7bzhOOe5i2R4IXO0CUtY3X5oE8pmTsR5X06v1FJYbRDndZUMWThg
         Bj79We+0yn6F9c4tfrVwns1llJUqwklRWY/iLXQHvSV5riCaHXFNIlGxsqRyfatiBEsq
         /zH/qvATaRJ1gTKaQIr6FpT9SzOi4srYbQFH/IF7WH7pqrh0qIPWABJ9C2PoDfa3Ve13
         CbQhh0FlMCPYrs7VMyAzPApao1bcNv82YO5OdIzlw89jOR4ZKer4tU9WCaOGKMlg6c9m
         3biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y47hS1pQCSzr0g6/KhG82kNdxko1grv51BWAxeVXKpo=;
        b=QafKTLaxvlZAKOTdg/tGJ6eO387vX6UcgQA0dAjA42TXTZVuhPDv4TIc9EBSPpto1f
         nMcVJTThiBoQQHRUSlGqtwbU8ad4jS7ZapHODnMa7Ru/7iP6fTa0mNgaUY1nok8urs3P
         s8pb5hpWUNn26rE3tFelO2lQAznGG2z8a+97sLaZjxW46fZLUHW/gPVrE+HfbyqEUFtY
         y8ktZVD9Tt2wKS8sjXi0ntmbz+SQNZk0celaN5R1/84C+lb577YyUQWqQLcJZZyU2abX
         bYk2eEhc5kIpt4umZTnbKXVqNUqawyJyvxxIcLVWJ0tVaMLQQnZYuWjR02vPRz1JfjlI
         G/9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FuJ/45sU";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b9-20020a811b09000000b004bfa75c0820si12028590ywb.276.2023.01.10.00.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:02:53 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FuJ/45sU";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673337773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y47hS1pQCSzr0g6/KhG82kNdxko1grv51BWAxeVXKpo=;
	b=FuJ/45sUvy66d9aWPxhg3yBZ+3svX/txE4DcT0csq06PgR9GyYJaRJPvgznFqfmKwp5x8w
	hdPDPaxeZEHLMrn9/D91aqpjSI31ts+NAkiBQUBMINfHkikm8LgaNfkqJyFe3FX6VcSiHc
	sofcgbVBw51GGB8IvbeyJ8yRsOmNRIY=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-q-IeMsjvMSmjzfXUkAfy7Q-1; Tue, 10 Jan 2023 03:02:51 -0500
X-MC-Unique: q-IeMsjvMSmjzfXUkAfy7Q-1
Received: by mail-vk1-f200.google.com with SMTP id s202-20020a1fa9d3000000b003d5ddec0bccso3532589vke.4
        for <alex.bennee@linaro.org>; Tue, 10 Jan 2023 00:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y47hS1pQCSzr0g6/KhG82kNdxko1grv51BWAxeVXKpo=;
        b=MNWCVegIdQM8Vj1b9Q0imvCfr8ZJRm3VyOVOd0f2Y0kwOwpgeGGmjUZvyPoflelIyd
         SgYN3Vpse4R7xlxgjCj25xeTpvG6oc+UnaCg6GmOBA/vOvEB6qBj8Tj2nHH73OSkBeeG
         +pcOX1LhAkWKQJISIe/rJ8loKIPIqFEvSigyxqNE7big9YntgdaCgJWAEfRaUV7N/+BU
         JqUEakDRz5APnhBXv7t9Zadej7RNSgOCiIdS5l24pehnn+Q6sTtPcjmaF5ZRGwsUbrDz
         jwLZJFfrDruvE4pL/sjo/AU9XAH3hhVS/ftl/vqODzB1/ac6g/DSFHkoYyRSIOeBVrEv
         ikfg==
X-Gm-Message-State: AFqh2kp8dzHtj5SlR42znZkPxVdRULvmBXCBbpEANKHz4J+jCHKkWOPV
	Mk719A+GKYvTVmVo3691Z7wm88imibnEKhXudkNX8JRWwVx5+GNUxFZeXJOjqazXBBrHdAT/ppr
	YV6qbkEIvuC4qJXq1
X-Received: by 2002:a05:6102:3d8b:b0:3b5:36cc:a5f5 with SMTP id h11-20020a0561023d8b00b003b536cca5f5mr36418814vsv.35.1673337770797;
        Tue, 10 Jan 2023 00:02:50 -0800 (PST)
X-Received: by 2002:a05:6102:3d8b:b0:3b5:36cc:a5f5 with SMTP id h11-20020a0561023d8b00b003b536cca5f5mr36418802vsv.35.1673337770562;
        Tue, 10 Jan 2023 00:02:50 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de. [109.43.179.237])
        by smtp.gmail.com with ESMTPSA id y15-20020a05620a0e0f00b006f7ee901674sm6752235qkm.2.2023.01.10.00.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:02:50 -0800 (PST)
Message-ID: <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com>
Date: Tue, 10 Jan 2023 09:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <20230109224232.11661-14-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: EKTqvFkOcGxb

On 09/01/2023 23.42, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.

Why don't you fix it immediately? ... it shouldn't be too hard to add some 
"depends on TCG" statements to the machine entries in hw/arm/Kconfig, should it?

Anyway, if that's not possible (yet), I suggest to add your hack to 
qtest_cb_for_every_machine() instead, so you could change this in one 
central place instead of adding a hack to each and every test that uses this 
function.

  Thomas
