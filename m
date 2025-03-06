Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1691494njm;
        Thu, 6 Mar 2025 10:41:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2FLZUzVkfTPyuJBsQB5POVPaNfF3EEJqIGTSvCDFuIwWRVgiaOs9BNVEil2jfxHEa1MJAVEHdDThhWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGPVAdVqelVDB1UWHCEl5iIzn6cGpBRWBbG4mdnjk/BpDmHkiWzSWWjszGy15rC5fdA9Mmt
X-Received: by 2002:ad4:5f85:0:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6e900668755mr1741966d6.27.1741286488038;
        Thu, 06 Mar 2025 10:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741286488; cv=none;
        d=google.com; s=arc-20240605;
        b=Ve0QGiPS+p1CG5G7mnKWNaPWrDANZYxYdFapWsS0ml7ZdKdxgpYLzeogi1hnLBmeGw
         0TadX1iePjMxXDRsa52PD9Y5YxzgmbaRT4QUsBvlw00pTU6pd4MSpK1MramTI+YngYMy
         NFBQkThIVtmv5dydFVtlk6PgAkhzTFVo8pzihm6NHNLpm7Lq8ujiZWGV+Agd0TgseKgG
         PhSOR7cJqt+ewyOjHz0VvWn2Bcw1jl85FuQ2DewtaBZWhIDzXwI6AQlkaI4KXiTyzuFF
         vs+Xuadqxu7PV4IsjlhIo9g665juDERbq0/MVj/ZCZ1d1u+3csjwgD2cPoqUMZXYDupx
         KOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nlKjR6Qodze2phKQi0H9cwus77utvbmPa46ciFKpdjw=;
        fh=wMpjRcHW3z0MXX/uumvngx3fpIWkdtNF9cghVQJqb6I=;
        b=MWTmQaOKkDWCGy5sRO5u+zqlck6EO+fmLCMkZTs6uR/jPIv4WxWMZMtO6DnOyirKJB
         ruWdMP27ajiSPnqryI5SjqMxKg4Q8mXPSZ9OzScmsTpU14NQLFlhFplhBzIn6H/JnJIJ
         6dFdZKP/C96AEofD9D0xyEwU9VCP3IRMxjocwpmnKsMvfVFTBCHP/VeKyND7ntY5R5IF
         +qQ55aaWg91Te3hthRjcrWuMU9PgwfUF+eFcBAYZ+92dkdNW95c0+i8d3yLRrM1sYXwR
         jn0CtWDZq746Jq6WH9D+Bd1/w2Ad/YdecfycWTjCh/NrnGZEusj7AnCc1Bk50pXVqe12
         48Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CIrifihr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7468ef7si16665706d6.439.2025.03.06.10.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 10:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CIrifihr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqG9h-0002mZ-WA; Thu, 06 Mar 2025 13:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tqG9Z-0002et-BD
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 13:41:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tqG9N-0006Z7-UF
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 13:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741286451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlKjR6Qodze2phKQi0H9cwus77utvbmPa46ciFKpdjw=;
 b=CIrifihrQWJZJUGFmrh2ZXwr4qCPtyQi7M/2912jb1yBG7ahDt286FLQGFYab6vGAbcKej
 Qlskn7txfU/G1DTEqrP5VyVq1QEw7m/iM0YnFplD30okqx9Uhiw2xkgxqIdnoxnN1iIvKh
 lLzdf6QkykUzPbr6TlAt/mfaL+49Ueg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-KH78KnuXPQCDgv5bPQRXbQ-1; Thu, 06 Mar 2025 13:40:47 -0500
X-MC-Unique: KH78KnuXPQCDgv5bPQRXbQ-1
X-Mimecast-MFC-AGG-ID: KH78KnuXPQCDgv5bPQRXbQ_1741286446
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-390f7db84faso939517f8f.2
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 10:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741286446; x=1741891246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nlKjR6Qodze2phKQi0H9cwus77utvbmPa46ciFKpdjw=;
 b=Ag+QS7Fg9MONIRDCUqgrbXIl4C25b970iC1/WIMSvkGv22iY4RCj4jkT+avWLj1Dcr
 nBRLvgl4hPWCvbAtCvjD3kafTsZ8RDZTvG44oUyOVLNBFulO4cJZ6SXbgbNRa0JTop8n
 PqV9H42VWMi8WLJjy7Ssnta7MULbG/3FPUz7toq61sXjipnUEPRwb/CSkCmxTZJvPzXe
 wYvBwf1HDWNxm6o0XA8InSukig7QGUETXQJeVabirpL8vwciRtjXzP1ntn/3Ne1d+e84
 Pnib0YuWh+O7R3Vo+NDrV+0FwSUhAs4ky07Eq2ucGzCazQoEmSWH0NVMb80Xi4NCXB74
 He3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWfiMd4liZum6RWupY2jWWwbvqoqA3qX/8nfGnoiW+ixkXdosKhliCRik9KY8F0Uum+mni55wtPw==@nongnu.org
X-Gm-Message-State: AOJu0YzGv2unoz6zYubH8XRGuy3TgxDFeO5Hf72ICaj/nUHdCyep1Tlx
 tUcc/6XadNcapZx1tqdrJloNLVOD6ZISneTelP1QK/wtewevKaQe8Hc6BDknOYKMNuDSWn1JLW6
 fSVGWp6Dtxe3oR2n4sku0h7BK/FDIbNfOaZpN7xWglZyWlR7UTw==
X-Gm-Gg: ASbGncuZkY///MxbvONMx+yCw4qbIn6cs2f33Q40qKGja5H5uBZTjjPUDT/jsEqYJXp
 7MKVKEGXZdz4ZOqrOxcd9h/ave36iF5RmWuq4hs8bPqXR1zCRc56TKpLviNLfepmjOtCycpBS3D
 ISgQ+DUQSklI0OngbRp2kKXUGeHK4PTTdS1Y6hUkp25auqsZsxlaV6sGFxYKb0E3oKhz+rQR5NF
 xXOjAvhEcxMfj8y5irlPRjZuAXGVazP9UgYTICpX89OxkDkS4Z2Vk33ETwI7jKlE7Gh60Rd6a9n
 aJhar5HWPmdIe4GO4eukTa5UQ6f/EwaSGrF+s+qq1cSa4xGGHuiF3w1WX8R5Hew=
X-Received: by 2002:a05:6000:1548:b0:390:ee34:228b with SMTP id
 ffacd0b85a97d-39132d465b1mr261965f8f.24.1741286445875; 
 Thu, 06 Mar 2025 10:40:45 -0800 (PST)
X-Received: by 2002:a05:6000:1548:b0:390:ee34:228b with SMTP id
 ffacd0b85a97d-39132d465b1mr261949f8f.24.1741286445483; 
 Thu, 06 Mar 2025 10:40:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e1d67sm2805750f8f.74.2025.03.06.10.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 10:40:44 -0800 (PST)
Message-ID: <d4b7ebef-32f8-497c-9d55-306dd02edac3@redhat.com>
Date: Thu, 6 Mar 2025 19:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Donald Dutile <ddutile@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe
 <jgg@nvidia.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
 <329445b2f68a47269292aefb34584375@huawei.com>
 <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
 <568014f5-25fd-439b-b70c-9cf50f31255b@redhat.com>
 <Z5HBJOgO4tUJApY+@nvidia.com> <8fe09b60e6f04cc6aec99b72b46b2fb3@huawei.com>
 <SJ0PR11MB6744943702EB5798EC9B3B9992E02@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <SJ0PR11MB6744B3D96A98584525B0401292FB2@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <c975f6dfaa9243c5a2db9e37d592ea51@huawei.com>
 <2191c0b3-f3a4-4d90-9448-23c3bc876372@redhat.com>
 <e049b9f0e97d40b39e20ef3f330bbc94@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <e049b9f0e97d40b39e20ef3f330bbc94@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3O_x_q4ByCAMLjy-6BFu4aD--vBjFgkSkt1b6-YWx_w_1741286446
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: NE/ajpy6VCa/

Hi Shameer,

On 3/6/25 7:27 PM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Thursday, March 6, 2025 6:00 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; Duan, Zhenzhong
>> <zhenzhong.duan@intel.com>; Nicolin Chen <nicolinc@nvidia.com>;
>> Donald Dutile <ddutile@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>; Jason Gunthorpe
>> <jgg@nvidia.com>; Daniel P. Berrangé <berrange@redhat.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org; Peng, Chao P
>> <chao.p.peng@intel.com>
>> Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
>> nested SMMUv3
>>
>> Hi Shammeer,
>>
> Hi Eric,
>
>>> I am currently working on refactoring the SMMUv3 accel series and the
>>> "Add HW accelerated nesting support for arm SMMUv3" series
>> so will you send "Add HW accelerated nesting support for arm SMMUv3" or
>> do you want me to do it? Thanks Eric
> Yes. I am on it. Hopefully I will be able to send out everything next week.
Sure. No pressure. I will continue reviewing Zhenzhong's series then.
Looking forward to seeing your respin.

Eric
>
> Thanks,
> Shameer

