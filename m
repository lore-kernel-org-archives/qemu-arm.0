Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp154021lfc;
        Tue, 19 Oct 2021 01:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2knlO2ezlDSTCV1ikAKHfiItufQjZGEPVW8StKqgZkJgptEdBkhmgvNvxd0geqIeaM+pq
X-Received: by 2002:a37:d53:: with SMTP id 80mr26082315qkn.490.1634631072475;
        Tue, 19 Oct 2021 01:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634631072; cv=none;
        d=google.com; s=arc-20160816;
        b=cdP/iaTF0wo/WcnP/m3KP0ztUvBmM/3WyCp+CbbvE//g3XR5uqTqIsTN0pOpCc3DUX
         11ZuotmN4rlIkDRaCi7mCtPLPHyFJLS6RmuWHXOp63cikwZYlF64hF9QKwjyf7w9ghFa
         l/rxaYSywkrKGlS1arZs9ETwnp7AtuPw4tWEonwQen3ByDGbk79umcwgqcQQVoKefj8+
         FmOFsBrW1wh4lrsUe2KrrX1Mz8AcqvHcmeZHenx7QimCA2pkJNaoOlPuOG56R95oi9hO
         6pbF93QdkOU+xormP+j9FYmkTUI5gakMmqV7QMsi+aBlhiJmhB0F/BABQdk9jZUdsZLT
         H+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6E2ak/cYO/40XPTNbbXa/Fna5o65qCLumBTNqFrRdJI=;
        b=aV/s/Ionot9NCcH/YQUGTE4qDNN/gyjrAMaGGO5yD2urgLAqJx2nBbCRjTsLJXOmi6
         zz25Y1IyeaoLEIbb3tM2pwlDCio9jDJGfP7VCnm8+A2fbOBRCoPMLsGp0bhhjt9/ias9
         7JZaMsAhNQRt3xrlVbMKEdPOAd/Z964v3L14npXajIKn/Lf+Tr2azfGUrcsLDFDVohqK
         NlGkcUKpH45Fw5lgx6Rqdzbj7szudmdKloqc6hKZcBlUzXOufte/Act0kq1GyFhY6ZE9
         oR3bm380mGviN3+t3fKrQrxfjeJrhTyBPZlJ0d4VKp404OxZn7Y0QoTcnYzus7eQSEXA
         lhBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ti+twxDk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si12595088qka.15.2021.10.19.01.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 01:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ti+twxDk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mckDH-00037K-K4
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 04:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck7G-0008C5-Dc
 for qemu-arm@nongnu.org; Tue, 19 Oct 2021 04:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck7E-0004SP-8P
 for qemu-arm@nongnu.org; Tue, 19 Oct 2021 04:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634630695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E2ak/cYO/40XPTNbbXa/Fna5o65qCLumBTNqFrRdJI=;
 b=Ti+twxDkwnxmY8e9JRU85y2DEf0KPWGTYodttBAdLvSg1xd+vh+uAgRDyYAimz2p89aQg2
 cPqBJc1NG0j58Jmcha0jFd8ZqC7YMFkwiC2JsEisWu1rDGymtb7a3NDB8tneCYedP8c5b9
 HwSoYU2asIEHRM2BEGU/whyPH0vqVwM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-wVqJtCvHMiqOoFZSxxQaig-1; Tue, 19 Oct 2021 04:04:49 -0400
X-MC-Unique: wVqJtCvHMiqOoFZSxxQaig-1
Received: by mail-wm1-f70.google.com with SMTP id
 k9-20020a7bc409000000b0030d978403e9so2417670wmi.7
 for <qemu-arm@nongnu.org>; Tue, 19 Oct 2021 01:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6E2ak/cYO/40XPTNbbXa/Fna5o65qCLumBTNqFrRdJI=;
 b=zTk8133nSGseocl9jUy/cdmr6VSWOviKbUT95APvJRR9110Nok08FN69loxeqEtmPK
 BEI0YIfXGqYrMSEU7D+LbrlDfHR3Rb4Ed6IkE1LREWbjqt2VuPn6rWAGXzaA++o2vaMm
 mRBPUDqma2a1o3tT6ZQW2iPbUbQiCYKqQDaQsbBNBBHa1DkCFjXAHXczCQDqg0r22RL6
 DHHIwhFzljA/zRDUJbiaoK+TMV1P3R/X/MHnTp12kErqJMRU5zLig+SD+qUlePxggG2u
 BO3Vut6q9SleHP7kFud5tnI/oojqOI/b8SGw3FKRoYXpHbK07NukkTgtSkBgmPtbGDlX
 k3zg==
X-Gm-Message-State: AOAM532gvcLkVryWSVLdEd+Y+daepMQ/lxni9OH2lBxhD1qQRCoZcXDR
 4DcHkv7ESv6EY0O9IgOPdUnqzrnP037J+hHm5exzXvZX1h7uy63/2+sqm9QrG0JT8raEN8KNzFm
 WiNEujE/sSKLb
X-Received: by 2002:a05:600c:ac1:: with SMTP id
 c1mr4349999wmr.99.1634630687841; 
 Tue, 19 Oct 2021 01:04:47 -0700 (PDT)
X-Received: by 2002:a05:600c:ac1:: with SMTP id
 c1mr4349978wmr.99.1634630687576; 
 Tue, 19 Oct 2021 01:04:47 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i17sm16697185wru.18.2021.10.19.01.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:04:46 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, mst@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, ardb@kernel.org,
 drjones@redhat.com
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-4-eric.auger@redhat.com>
 <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a79bd0d8-741a-497b-d9c4-61a71d6a6c85@redhat.com>
Date: Tue, 19 Oct 2021 10:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PaInu9+LvLrD

Hi Richard,

On 10/18/21 11:00 PM, Richard Henderson wrote:
> On 10/7/21 12:29 AM, Eric Auger wrote:
>> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
>> index
>> e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
>> 100644
>> GIT binary patch
>> literal 87
>> zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
>> TFmQk+Il-a=3=Gcxz6J~c3~mVl
>>
>> literal 0
>> HcmV?d00001
>>
>
> Something went wrong here:
>
> Applying: bios-tables-test: Generate reference table for virt/DBG2
> error: corrupt binary patch at line 75: --
>
> Can you please re-send?

the v4 applied on my end (?). I have added Igor and Drew's R-b and sent
v5 without any other change. I hope this will fix the issue:
[PATCH v5 0/3] hw/arm/virt_acpi_build: Generate DBG2 table

Thanks

Eric

>
>
> r~
>

