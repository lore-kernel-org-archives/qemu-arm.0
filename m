Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp1016842njc;
        Thu, 13 Mar 2025 08:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXq8KmKfPQ5HtaF5miydXwLNfjzzet52YKyxrSo4oYCEB6kM/YJjwh4PRWMUWSetW0W/+dxRR3xTOEbA==@linaro.org
X-Google-Smtp-Source: AGHT+IHPUH9ARtKc0UtXc5PTNatN3SM+Og2AJ0cgAyfNObupLLC5ut26g2cIE67RolCtf6ySkJcw
X-Received: by 2002:ad4:576b:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6ea2dd135b3mr221174726d6.16.1741879332964;
        Thu, 13 Mar 2025 08:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741879332; cv=none;
        d=google.com; s=arc-20240605;
        b=eYL+NJUdf7zivBXwI7yFqn9NaBTt6m6LETIdBtKrrQPCQl7tg63C2OYnEfk77EHZYz
         COEdbnY/v1Jb/MeiJLAAyC0tNz/GFlsAPq+VWOyxvZviTXNZ7hQj9SbNipBMtS2W1R4e
         pn1jslcjoDByUolLq1Z/JSPdx8sBN+2Xj8DYJFMGCBTj1u9t3WlFScZyhwXDiP4XCEb9
         yiL5l8KaQHQ75FXbn+NmqADXl+e28nPxrK1W2vnH+o0FzpyV1aIn9xWAOELkgqVM3DBa
         0K2M76m9yaXqiWjFcd7E9XAQoVwHqIJQ3aFg2ZJor9Q31AZYx9+sl1iXKvxRkWOTpOaH
         9Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=USMSyPlnCMSsFnbzxMQqWxLyP2V8Xer7t4cUAjErJVo=;
        fh=YVPTeh7sblhZTTTM01YE6F4qkEkC60K7fZlD8YI8cRU=;
        b=fUt00owOAeJa1J5SiNVYCiohjRF4WHt/iZ1kvluhj6IcH7B9rVlVi90OxDVN4lFyT5
         HLGsFOeDAMgP69aHM5S4JP+skQkfU9Rd2FmLvIicmyiIcDF5DqetuDvnZs8D2senB4hy
         rESO9fDSqt9b0bPEzdcRxIUbN6e0HMc3pohaZNd48srx46+6B4yeZnBH9EKKp7GWVt5y
         TWusvXNVkQjw408PZTA3r1WLNH5M6buOKceDnjA8vZBQNb+Nlj5cpNc274w6GNllCdVD
         d7Lktx30P3DoTfgBaht1k0ko3WpKxJC66AYCRQ/vpPH1+ydo2I2hW3kYrXnQyPHy4z2C
         5Kag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EPLVEs+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade370a34si19249836d6.453.2025.03.13.08.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 08:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EPLVEs+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tskNg-00062o-SX; Thu, 13 Mar 2025 11:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tskNY-00061s-9Z
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 11:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tskNW-0001Ip-Gk
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 11:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741879301;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USMSyPlnCMSsFnbzxMQqWxLyP2V8Xer7t4cUAjErJVo=;
 b=EPLVEs+piC6N2dup3tTwh0OJuFjhWxCsgNvVPIQ76LiNPyrkt/Qt3uE5ZkKarxbLxHMLNJ
 OkPnIJq4J/bn666E5k+4jmIDlw3/6og3bLflvAZTE0zFrMHsogGOAZ/XfvuD3bTjy/OKte
 0e52P8R4Zb1nLS1JzFlFXuBZrSnF4HE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-gQr5Vsk5N9GJezw_5Ru_ng-1; Thu, 13 Mar 2025 11:21:39 -0400
X-MC-Unique: gQr5Vsk5N9GJezw_5Ru_ng-1
X-Mimecast-MFC-AGG-ID: gQr5Vsk5N9GJezw_5Ru_ng_1741879299
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c3b6450ef0so167006385a.3
 for <qemu-arm@nongnu.org>; Thu, 13 Mar 2025 08:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741879299; x=1742484099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=USMSyPlnCMSsFnbzxMQqWxLyP2V8Xer7t4cUAjErJVo=;
 b=QRe2yGeTWb8HZSDTdJgE+vuElpuAbgCofh16/b+G0PKjjXueD4cDRSW0um96RTJypt
 ShchBvFEJUF16yHD3A5g6vYngUC+sRRSjMOyqbOvdZWDeZzD1LHQTbNQTO1z6ua8BIiS
 gWaALd1bcGJMOTQ98txRitShKNJYGANqfROEn0dDXgUsbnsVzZ+izOcu6b8SsVB+v1mJ
 +mfcdK5nwpKRpAgD4R4ClxqYifl+gQnLLbJyS+wCp/NINWYOI6JXzriNoHi3bFP6a67o
 IWK+lV783zpGDCm/90wk36wM/7KPromjPVUMI8GMKMT7N2LDQBOCb7/5kyrIUMtc8lu5
 Px8g==
X-Gm-Message-State: AOJu0YzhxMEVv5EBU44oEbu5tMP6ZR4yyYAVWjlCo+jfxd0+NAfh222G
 UseQooWZGNiF8Fi9qRXw43aH6QdwM+dAOIP7gC+iN4F2sLFjGG6w/7dI8Z3L7NpbusL6MxhAtl0
 Y2ClBOLeIOITp+4pJn0Ju64PRUkYIEBcToA/vjbuqu5wx6DHAmQ==
X-Gm-Gg: ASbGncufFT0jfNJYkM/x5TP8993ixCmNpEYehEmmyOppJ9HSU08Y6Ta9fm162gx2Rg7
 1pJlOiWD/6AmfLs0R8HLkKLty1w4eurkZF8TGHdp+v2q6DytAcQVS1xhXhrIBdCBljWeAdjENAl
 3qOCRXCP4F/TPPOGM51QfhXLyqBWmvXKQOWs6cA41yvnqMICpCvm/s2m5YXvz01OrC1eSi4Usxo
 4nhAXnsD0EekzBPPtSMLIEYBigg88jycWdshPiT269DtR4Jwf2BeSuo5YyXHew+rx4fuczsyzx0
 kmJHUzaeLjPtxvZ+VjKuJhsk2Xpv2X2PfNo+MECf0YDXCp2J0gZeSoIAfmvcqSE=
X-Received: by 2002:a05:620a:26a2:b0:7c5:444e:3f5f with SMTP id
 af79cd13be357-7c55e85d77dmr1921427885a.15.1741879299387; 
 Thu, 13 Mar 2025 08:21:39 -0700 (PDT)
X-Received: by 2002:a05:620a:26a2:b0:7c5:444e:3f5f with SMTP id
 af79cd13be357-7c55e85d77dmr1921423785a.15.1741879299078; 
 Thu, 13 Mar 2025 08:21:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573d89b9asm108637085a.99.2025.03.13.08.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:21:38 -0700 (PDT)
Message-ID: <64152d6c-4125-426e-9102-ec3e3afef1d4@redhat.com>
Date: Thu, 13 Mar 2025 16:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
 <79bcc36c-1a12-4b18-a54c-afe734d6bef0@redhat.com>
 <9ffee8119fc441aeb760073c5f152fa4@huawei.com> <Z9G4sj9sHNYb1t78@redhat.com>
 <2f44b284cb854844889b9ee8b6239e0a@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2f44b284cb854844889b9ee8b6239e0a@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fxava_yHJhInO16ItlThtkiGzlBs2gOYDlYdyLJXMHc_1741879299
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wygSuSNRSCcs


Hi Shameer,

On 3/12/25 6:28 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Daniel P. Berrangé <berrange@redhat.com>
>> Sent: Wednesday, March 12, 2025 4:39 PM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: eric.auger@redhat.com; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
>> nicolinc@nvidia.com; ddutile@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-
>> pcie bus
>>
>> On Wed, Mar 12, 2025 at 04:34:18PM +0000, Shameerali Kolothum Thodi
>> wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: Wednesday, March 12, 2025 4:08 PM
>>>> To: Shameerali Kolothum Thodi
>>>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>>>> qemu-devel@nongnu.org
>>>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>>>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>>>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>>>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>>>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>>>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>>>> Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a
>> pxb-
>>>> pcie bus
>>>>
>>>> Hi Shameer,
>>>>
>>>>
>>>> On 3/11/25 3:10 PM, Shameer Kolothum wrote:
>>>>> User must associate a pxb-pcie root bus to smmuv3-accel
>>>>> and that is set as the primary-bus for the smmu dev.
>>>> why do we require a pxb-pcie root bus? why can't pci.0 root bus be used
>>>> for simpler use cases (ie. I just want to passthough a NIC in
>>>> accelerated mode). Or may pci.0 is also called a pax-pcie root bus?
>>> The idea was since pcie.0 is the default RC with virt, leave that to cases
>> where
>>> we want to attach any emulated devices and use pxb-pcie based RCs for
>> vfio-pci.
>>
>> The majority of management applications will never do anything other
>> than a flat PCI(e) topology by default. Some might enable pxb-pcie as
>> an optional but plenty won't ever support it. If you want to maximise
>> the potential usefulness of the ssmmuv3-accel, and it is technically
>> viable, it would be worth permitting choice of attachment to the root
>> bus as an alteranative to the pxb.
> Ok. I will look into this. Though I am not sure when we have smmuv3-accel
> to pcie.0 we can still have additional smmuv3-accel with pxb-pcie or not.
> It looks like pxb-pcie will be plugged into pcie.0. And if that is the case
> IORT mappings will be difficult I guess. I need to double check.

Indeed it makes things more difficult in terms of id mapping but I think
it would bring some benefits to be able to plug the accel smmu on pci.0 too.

some logic should be there already because you can bypass the SMMU on a
given pxb while enabled on pci.0:
see

[PATCH v5 0/9] IOMMU: Add support for IOMMU Bypass Feature <https://lore.kernel.org/all/1625748919-52456-1-git-send-email-wangxingang5@huawei.com/#r>
https://lore.kernel.org/all/1625748919-52456-1-git-send-email-wangxingang5@huawei.com/

Eric

>
> Thanks,
> Shameer

