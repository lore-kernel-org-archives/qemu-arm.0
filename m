Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3860804njc;
        Thu, 27 Mar 2025 02:12:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmK84fPOQAhi/l4Ie1AIdEsGn5swSvi3wTieHukLcpoLaEs6zQviAGpLcDoMZGfMjXrZZLIn/UPgk22A==@linaro.org
X-Google-Smtp-Source: AGHT+IENvPalbi4FV4m8ZgQKj+s37vNKiXB9d6GW7d1FAvWcbygCftEzOvsi3qyS42bqdiiFIc13
X-Received: by 2002:a05:620a:2454:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c5eda65b50mr406297285a.40.1743066744628;
        Thu, 27 Mar 2025 02:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743066744; cv=none;
        d=google.com; s=arc-20240605;
        b=f7HIzBebpyUgz4ljxDfn0O8PKVslIkrpurymV9YzXdYDzC4JIvP1MTd/RVd2FTkjw2
         OT6gAWJMvch7+PGS+8fvP5Ah4F/qIVlIdYaGzY/MSs3SjqFm+GQ8cq7kDPwjYUnXtKi+
         5H37Y7A3bwhXzrmOy6ewGGl+uDxA46WRDynAvENIJ2/CCyarNcPMLFquChvlHH33+/qy
         MziyEWvj2sxevCCYiiUQ1hQXFP9MqhZEYpthbTTPoLYp8YXtex2Ik9RLN22SvvHMpudE
         GKLo1x2PnwIdS0soJvfcUulgAVd8f4h8N+LyBXmx87BZpIck/DrD5UIm5t1kDLoxEfF+
         oPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KxJ16tDeYAGFS0tk1Xhh+SQUoUEZcKzgVt37yURehds=;
        fh=aZWAMUwNKbvFjGphyBohNHZM/ez7/0rkU6ykXjSs1pM=;
        b=W+60YlkIwNdoFaMc/leSvIDUYXayXlbnPHfj8E16rm07Jlxtv9Cir+uEOIZFA+2cSB
         1pR+82jIU098W+eRsqUUMq3JnQ93wWSlB1OhVHXBzAS/PgzUQvMr3Oa7CW0fmrSX1DdE
         DvSzdhXcmdNp6XmUk4IDsf/rKO+o8fV7Oo3cL1uC4h9S67cgDnLeN1NrjkOW3W5grHqV
         stD71l4vu2QBOp1uByisTibzrLHuSwz+xzuEqoNp2POl5N/SKzh7wwTe0JiocYzILHJZ
         tILzU007s+nC9vtb/oRG7tkbKbw9FGdsTYJhya7jCB2rsfIFVL5Ja86vH6LDzWNu0A59
         /m5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BeS8k180;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b92aff4dsi1342480385a.52.2025.03.27.02.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 02:12:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BeS8k180;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txjHV-0007Cd-Fh; Thu, 27 Mar 2025 05:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txjHP-00078Y-FA
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 05:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txjHM-0005lR-L4
 for qemu-arm@nongnu.org; Thu, 27 Mar 2025 05:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743066719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxJ16tDeYAGFS0tk1Xhh+SQUoUEZcKzgVt37yURehds=;
 b=BeS8k180fyJCN/FXZ3Ih2d5VehpHQwJpoQHUp7GZza4ihERQTFaqdaQ5We/aapfZrqp25z
 11dS7yJfgnsvyZ58FcNQtwb/9IVDRhu/ldXrHrg8VHmbol9VtfV9hxUdrpw1EMJG3v0WUv
 7tSUIHk6aqqEKtU79PJ46E/i5YkB70s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-bEBxooqrOzCBxxHUuMnKJw-1; Thu, 27 Mar 2025 05:11:56 -0400
X-MC-Unique: bEBxooqrOzCBxxHUuMnKJw-1
X-Mimecast-MFC-AGG-ID: bEBxooqrOzCBxxHUuMnKJw_1743066715
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3913aea90b4so262376f8f.2
 for <qemu-arm@nongnu.org>; Thu, 27 Mar 2025 02:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743066715; x=1743671515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KxJ16tDeYAGFS0tk1Xhh+SQUoUEZcKzgVt37yURehds=;
 b=Y5NwTblgF0qr/k1+zPRs4XlNtoazVpF5RWt3DO6Te+9KMEIUpMvHvzsmVgVO+UUx9Z
 lkc3wyGHMOK7JwPIBNbQfWDlpTflD4uXb1772SQC78qJpSvO9aLK5J2VAOx4QOzThmoU
 PqywGFbHYOSCiWR5iCMFg0zIGazJSa2F8/yG31vYp54W01D9OkR04tz9F5p90e3bSI88
 Htan4sduuv9+7+3eftlIfvMX2LXLTx7wnZv5UdAhJZUQHbvBBpoZ30lIOJGJHbDQATfY
 LU2/SsvOcDXv9TnqRkYMErxwlDeVV9J5RaSWfqFPOKTN/NGCGRWf2PRcvQYZXjZe9PDE
 PoRg==
X-Gm-Message-State: AOJu0Yzl/gYNhLQYb9GU3Ur1kYKUCgWxKB61CtSXvSkF1AfbDLgUd/rX
 XsOktAeDQ7GEUX4GS7LVCFUIB9BRd2XBhCUcWiNQJPb+H8MEqsSGBH97I9xFZRKxHMeKU3vvqRT
 WMwuPGgRDHgleTEKtiDVyD73mCoMyukJqs9RQ2bcohDA4v1DF/Q==
X-Gm-Gg: ASbGncuM62cn8mkmgZUEimaBWnjErd5uJDJmFe+2lMBuyD2/OXX6GaObxdNPhiCsHJT
 DoHn0g8zejDzfeC7/7USCPzv4eELy2WzpIuI/E7L+4kvlgZoE717u2RC5cH8crLTUgO3a1ZJIlU
 JlpWKtoj8ryeNBCyNULVPXGtN/q1OLjit49GRNMdc+KnHA38XnbYCbeiFzDgfZtlxuaHVQ+MsQ/
 lUgoWFRsDT/p52ggrYrZqSjnq3QfjeZkeJikr6wEouue4EAWuP5ZvhzKsz1qbQywnfnesXTxgXp
 Eq/zZUanPMVxhDrvYBdT1b2qT1jJJsCwqfeR0wSogqMYJMXOGHfHGbHQaE3XfUw=
X-Received: by 2002:a05:6000:2913:b0:391:48f7:bd8a with SMTP id
 ffacd0b85a97d-39ad17596e3mr1874952f8f.30.1743066714868; 
 Thu, 27 Mar 2025 02:11:54 -0700 (PDT)
X-Received: by 2002:a05:6000:2913:b0:391:48f7:bd8a with SMTP id
 ffacd0b85a97d-39ad17596e3mr1874930f8f.30.1743066714449; 
 Thu, 27 Mar 2025 02:11:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f2asm19488557f8f.30.2025.03.27.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:11:53 -0700 (PDT)
Message-ID: <c081ba1e-4e6a-48ec-ab8a-36474cdce8fe@redhat.com>
Date: Thu, 27 Mar 2025 10:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 17/20] hw/arm/smmuv3: Check idr registers for
 STE_S1CDMAX and STE_S1STALLD
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-18-shameerali.kolothum.thodi@huawei.com>
 <477323cb-12d3-484c-8ad9-61229ede3efe@redhat.com>
 <Z+RZsES0+Ywxi7Xx@nvidia.com> <cd1393939aaa43bebce8bd926b4b00de@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <cd1393939aaa43bebce8bd926b4b00de@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d1XWmVSRE7hqWCOQLqNcBO4eGRp_-h3r8eqOO_KjY60_1743066715
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: URRmIFdGzk71

Hi,

On 3/27/25 8:54 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: Wednesday, March 26, 2025 7:47 PM
>> To: Eric Auger <eric.auger@redhat.com>
>> Cc: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; peter.maydell@linaro.org; jgg@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 17/20] hw/arm/smmuv3: Check idr registers for
>> STE_S1CDMAX and STE_S1STALLD
>>
>>> Again I think we need to understand the consequence of having a more
>>> comprehensive support of SSID. This also holds with old the IDR fields
>>> that may be inherited from the HW and we don't support yet in the
>>> emulation code
>> To support guest-level SVA, it must support SSID. We can keep the
>> SSIDSIZE=0 in an emulated SMMU. Would you elaborate the concern of
>> doing so?
I just want to make sure we dissociate both accel and emulated paths and
we do not advertise SSID in one mode while we do not fully support it.
>>
> Regarding adding support for SSID/SVA in emulation code, the support also depends on
> device PRI/IOPF feature as well. Do we have any emulated devices that can make use
> this? I would say we can add that support later if there is any real use cases for that.

x86 may be ahead of us in this area. Maybe this was tested by Zhenzhong
when contributing emulation for S1 support in intel_iommu?

Eric
>
> Thanks,
> Shameer 

