Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp552142njb;
        Fri, 31 Jan 2025 08:55:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0K9K1YRoNafgX028+kBGskpOs4HrIrWZgg8pQKtCeVtGYx7YL0DhbM9sBF9R9FBd2u+5h+ZTj+k9acw==@linaro.org
X-Google-Smtp-Source: AGHT+IEUxs+kz2uz7Lp50ndiV+utQOVBZyjMRNa5x89+RbzKKqPDYwv6RTLnkMpNA6t9OXni+4Cv
X-Received: by 2002:a05:620a:1904:b0:7be:8343:df20 with SMTP id af79cd13be357-7bffccc7f43mr1747649385a.3.1738342534605;
        Fri, 31 Jan 2025 08:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738342534; cv=none;
        d=google.com; s=arc-20240605;
        b=lHBTv2tKGFzgfYHEVL+yz+EWw99HlSksY7/3XVDgpDdlphRkpZ/Y4pUa/EqxZtG+/A
         KPeglib+q2Rbug30v0q8TzbLLdsC8wJSLfrtiVBFNwFsRixwXwJ2Tpqrm6bh48IZCFFr
         e88wWRgESW5/vzfk7FuNUXjfBWhbuVTJo0KGN/R5hsQH533dmVtxN5KN0gyR/09kkMJg
         irv30+SAzMzo4cWkXRsVeG5fuzR/Q0HJuUJiKxHCahxpW5k5nNf62XxxQxp2OhO/4bIM
         6/BkEpadaAVecPN8NW8XbVLJE4tvkAL5WU3Zsa5hzn2D6t+Ajao+wMa9rIVUeFWQFJyg
         91Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NIfRarS1wPOBfQNP8FB1B01Y/eiHGZOK3fB01qQjEp0=;
        fh=go7GH5iAMjWzjtXtfwH/mQg6jQzw0IRL80eNLpNd6Tg=;
        b=UDTgHglOGlhtleonDGqx2K/It0YowXurISgjMwdTXIrkrbvXoV3kt8phcsn59ZDNp4
         98jlX+tBRtaWJZuImELFTxsgFGG86LKOMmXOOt3urbXpqTkEqLjGGM/FBKmEpCX2fugc
         GbdrstVMdPt6T/lPRSYjVAVcrD+FbMPnPPWsVj+naWPHuyYu3TL62q/a6+kLayP9SuM4
         7NVBiH3yO2fnXocyfzIWBLNd6nHUSW17WBvKq1tSmdssKjewC0pImXOW/Rqav0qsFJSs
         BewAsSArdmsBZv/1D54tmmICvED8JaDgykwSxgB/YW+vNrNHvp4Jb0DLK9Rl4R0xP6b8
         jmFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LZ3da6tc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a903c01si417563585a.271.2025.01.31.08.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 08:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LZ3da6tc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tduIQ-00009z-Hu; Fri, 31 Jan 2025 11:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tduIN-000082-Ed
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 11:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tduIL-0002fS-Pl
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 11:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738342503;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIfRarS1wPOBfQNP8FB1B01Y/eiHGZOK3fB01qQjEp0=;
 b=LZ3da6tcHSyPEaBrr9nO+TSZnMxpgih/lOl1TOWAiBauJi9s7OmJMFS1iGEEpDXloMUPHo
 nJVnriZrlUt1R+9+5sDr5v5J0GhLwBEqKQD/dqPvFHSkLCP4QdAKFGMJQRZX4hDdbBmthF
 OjDAVNOL/Cz6jZ77Ip4EV2by2o/QAGg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-tzmo0QmYO6Gb59Vljd6b_g-1; Fri, 31 Jan 2025 11:55:01 -0500
X-MC-Unique: tzmo0QmYO6Gb59Vljd6b_g-1
X-Mimecast-MFC-AGG-ID: tzmo0QmYO6Gb59Vljd6b_g
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7bb849aa5fbso436052485a.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 08:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342501; x=1738947301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NIfRarS1wPOBfQNP8FB1B01Y/eiHGZOK3fB01qQjEp0=;
 b=HEviHubesHW0jSxJdZA2SMdLOpWL5O/vL7KG9U7xWQWQU4YwYHjfGJmBmdalIH6wQJ
 XpvcCZZcuOxOXMyd9IcYqHazlRPKOUNWOmjOuJtJPpgRYPiEulVu+62cX/KtXXK+sX3d
 VpwOL1yFNbTabl6pxliu9sPd0aNx1y5/ksr0WGwOwu7HxbMaZDlXkxhkccZAMoynaNXN
 d5Talq7oJ1RwtCyyiPT6evltp7sFEBWeeZePPyOveb5XAI3A297MFTuan2QPD/PLlVFz
 L8o1e8wVVKb3B28PqZfPGYlD8MWcGYk/KjsnZ65e7cgxjVa1pIuyo5sz3lgJZbiJNYj8
 Og9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqJF12fKrlnvKZoikTpyifWeTseHPjxmYKNbjAnmHpqAQG5JWwOxWF8fQ6DzseNECJwNvfuWrXAQ==@nongnu.org
X-Gm-Message-State: AOJu0YxM4wcFOYqHMVcI4jcHF6RcNPfDrjrxDTn8g4z9VI3X2+WV+p4b
 SU2CGdHUyDu7bcnXed+yEUAqwC6WLRoHLRpiRN9y/Ac0I1leCWB3RnyeFyFyV+SspJarPmjJOOR
 ysMSJ+HVMiuludOfdNnkyhhSeJMlpHqGl4iROS/0Z3GryXo2A3Q==
X-Gm-Gg: ASbGncsU5cBIWiFyWo8wo4RstrVg1vrTFszZ5psmnpjyOixvD32azrYkXRhEF9WvumN
 7ycvPdiEdWngHl3uAsSbeFP/xHpecGP14SlBhjDwlVxd2WohIOnV26X766aHGvANt8wYZj7U9Un
 q03KRBzvWoVJIxl0l8MWast+O9/zO3KX7fa30KFRLbouEbPBekdxPisaYuHWugM3Hb0Zts7IBYK
 TB28GdSbibEK/f2NUo9IrdSxJmLJF6f68fY4g07aqLshkDWWEqiG2IohGtym1u4OV40suh0O/yb
 U5taoBy3nCXCGrWDSvwpilr/MAwdwk+SmzqM7ZAO3mVdzCo25Rxl
X-Received: by 2002:a05:620a:371b:b0:7b6:d237:abe5 with SMTP id
 af79cd13be357-7bffcce5880mr1694512285a.20.1738342501140; 
 Fri, 31 Jan 2025 08:55:01 -0800 (PST)
X-Received: by 2002:a05:620a:371b:b0:7b6:d237:abe5 with SMTP id
 af79cd13be357-7bffcce5880mr1694510485a.20.1738342500867; 
 Fri, 31 Jan 2025 08:55:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c00a90d3c4sm211636985a.111.2025.01.31.08.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 08:54:59 -0800 (PST)
Message-ID: <f4e64a3a-5c1d-49f2-ac72-b84ecd353c9d@redhat.com>
Date: Fri, 31 Jan 2025 17:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe
 <jgg@nvidia.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
 <329445b2f68a47269292aefb34584375@huawei.com>
 <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbRwfQLfyIgf56DV-_O7y9BLAJVUVQ2lkFO5GNORK9s_1738342501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cN0wOAqszcbr

Hi Nicolin,


On 1/9/25 5:45 AM, Nicolin Chen wrote:
> On Mon, Dec 16, 2024 at 10:01:29AM +0000, Shameerali Kolothum Thodi wrote:
>> And patches prior to this commit adds that support: 
>> 4ccdbe3: ("cover-letter: Add HW accelerated nesting support for arm
>> SMMUv3")
>>
>> Nicolin is soon going to send out those for review. Or I can include
>> those in this series so that it gives a complete picture. Nicolin?
> Just found that I forgot to reply this one...sorry
>
> I asked Don/Eric to take over that vSMMU series:
> https://lore.kernel.org/qemu-devel/Zy0jiPItu8A3wNTL@Asurada-Nvidia/
> (The majority of my effort has been still on the kernel side:
>  previously vIOMMU/vDEVICE, and now vEVENTQ/MSI/vCMDQ..)
>
> Don/Eric, is there any update from your side?
To be honest we have not much progressed so far. On my end I can
dedicate some cycles now. I currently try to understand how and what
subset I can respin and which test setup can be used. I will come back
to you next week.

Eric

>
> I think it's also a good time to align with each other so we
> can take our next step in the new year :)
>
> Thanks
> Nicolin
>

