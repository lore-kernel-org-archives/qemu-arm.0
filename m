Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp421537njb;
        Tue, 4 Feb 2025 10:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgDUhpBmIjqBjKA8i9owCY12k1SMPeXvIUM3kvM7VdPddX/LeF3Y2U4T89VoIyRprEZGieuA88DKLMHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHYLutW7LCgPBNrAONQwZlpfvhHHdsxKzvPNPlL2ZNI4rijUQBlcwWTrUX3KdlcDGztm0Tf
X-Received: by 2002:a05:6214:765:b0:6d8:9ead:c665 with SMTP id 6a1803df08f44-6e243bfafb5mr418223076d6.27.1738695369062;
        Tue, 04 Feb 2025 10:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738695369; cv=none;
        d=google.com; s=arc-20240605;
        b=eqTBj9d4Yuqxcg1DLuPEH5S3awtHkjcbDDdZLIVLiD60hmnv5K1+0EgmPp4cb6fc4i
         yTfimu4Ahq1fkm++kB9THq1i93m3UIKwqWeqW7BK+rpf/+31nQOJlvQ9qZCsX0OphIJI
         BVSplw5GCsoPcI2HuZ5mLIY6eLymmJP3H7e6W+QEqjakJl46HzknpwxShiCEMPB+hm8y
         018f2rvsxI0PsoP2s8JHBJ55ZL8B0LvbMw8KBwcdSB8PdPbna4v2YEsenqtCx3wW0YJ/
         awqkSd0bnE+8CgKjtjR5iCesXZS2+02hQeDTIzz82rQgaFe2hOJQ54NxKJOMu5dRU2Se
         Wskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xZqfIDUj6lqQGwbPGqD0mO3rFCOZzQtE0HWzdBSsE4s=;
        fh=1eqJcAcVC6btCmt3q4/mYQZEicSDE9IXrQfQriVmyYo=;
        b=V7OHKSzo7/28SI49C9M1o4xvJayeGRqFgJcBm7k53sT1tO3+WuMjLumgDyu9iu8rsf
         cRoU5oO5Gx1PdLU0lS5keuZnHzgrlrFYX976jFD54DWwDawcrv0M5mp5k6fKqTjn0pTM
         G8gI2d/2ikX2nfzfAggSzpWOLhibVb9R9kXphuPTaA/lNB1SL4pFTdivQ9a2gc6khxmm
         +EhXr2Dh4xgWD9JznveHAfSZpD80qoAZsLH3vnMWRa/50ROXJjLc4/uTS2ev2dqK2vxK
         aYNKd2dzlzzF+dPp+4QyVrKS8DxjQAD/Y4cuB/ulGT9Vro+IXwe8240KOdmm0bnTDt2y
         RkFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ih6Yq3vP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e41feefbc3si36440966d6.503.2025.02.04.10.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ih6Yq3vP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfO5c-00071J-1z; Tue, 04 Feb 2025 13:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tfO5a-00070n-B9
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tfO5Y-00043G-VF
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738695359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xZqfIDUj6lqQGwbPGqD0mO3rFCOZzQtE0HWzdBSsE4s=;
 b=Ih6Yq3vPEDOBMHLtucJlg6EkDOZ60kp9h0j5N+lqI3hUArxc4mYQcKLJ+k/TsJ0EZrnceS
 0b8MYyHLnsogkEkmvrVCW++ecfz/i3FTL6HKQkmomgMotc5b7LaEJYnDQM+Gg21OiJ+Z17
 120M2NwU/9kPnJxT4S1vb+CBuBVC+wg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-dnun0Yy2M86NV8qP__fGQg-1; Tue, 04 Feb 2025 13:55:57 -0500
X-MC-Unique: dnun0Yy2M86NV8qP__fGQg-1
X-Mimecast-MFC-AGG-ID: dnun0Yy2M86NV8qP__fGQg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38dafe1699cso794428f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738695356; x=1739300156;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xZqfIDUj6lqQGwbPGqD0mO3rFCOZzQtE0HWzdBSsE4s=;
 b=b6Ocs11ny38sKQVyolyKZJif7w2kHQuEB9GXVgC+mBA2pevUDD2EtpbKaJJwDSzT67
 sJ3krpXHMF4vsPBsul9bGMJGz2eUoAbmojdyhB2dCU4ZKwhRButdicpWUBm38N+IiVyt
 jD/5HMsWb1f7/2wVRv9bo/JlNUPdyd3jKIzxvRIhgapezbEUJyiTtC87iCnMnoJ5HZTQ
 vwzCVap5nEVnF98WAAPCCqi2GD0+NRDfI1hGyWNXK1dkp55Wg7e4l/p2hsu3jSDxWIEY
 DIghNQW3V4njPhyJldMPTXwIDlTfDSUuS1isBggrt+BkwR9a7sRqVo2dkGkHxg5LWK2A
 2qTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOpUlhMSAZIrJpdQGh8EYVis9FbUvGyF4e+Z+g+R6WE/FlBBMc7GtGVWY7B4GyXbQtgtuFGWs64w==@nongnu.org
X-Gm-Message-State: AOJu0Yym7A4Km3WifJhsZ++9AH2ioBv97zP/VnZNCr3UwtIneELj0yWh
 CgmTu3bG4TbHYAWiZW+BFDe8yQodhGZCoABb5fDSirqtCy86OjWGp+lc+2Kex1GOSyJItVZ1AWu
 zqaCXsecuUODBpGUTxq4ufhbzaBefrGNGL/txsek8DIvHNq2Wew==
X-Gm-Gg: ASbGncuyw2jYJy0/YewD4wLpPtOhcbvt7sO9SSqj17SA0SGnBtdO656+xEzJJPx0icD
 QoJKEnxXzXlstqRDk57rB/y86lBjI6TIBoKD0b6HFuB1TaHneDYw9mgcO16B8seZ/kfCeGvcQAD
 JLRXLBc/JWTjKaMEgkhvlo49mFmIjuePIHvfg4xxnoZmmn/QaBhbwBBuFfFJw0C3dE24AXEjKQ0
 aid+Omm8tcrxu5DELKpYkkBsHsinf9WPUheX/2caUfjq9SLaeluHI3eFCcwAuHIk7iGRYT5VziT
 AJErAmjHVHZhVQl4UNOKAq3R++tCuzPM
X-Received: by 2002:a5d:4e11:0:b0:38b:f4db:d56b with SMTP id
 ffacd0b85a97d-38c51969acemr22529411f8f.25.1738695356576; 
 Tue, 04 Feb 2025 10:55:56 -0800 (PST)
X-Received: by 2002:a5d:4e11:0:b0:38b:f4db:d56b with SMTP id
 ffacd0b85a97d-38c51969acemr22529393f8f.25.1738695356245; 
 Tue, 04 Feb 2025 10:55:56 -0800 (PST)
Received: from [192.168.3.141] (p5b0c6602.dip0.t-ipconnect.de. [91.12.102.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dad9a8663sm2337196f8f.6.2025.02.04.10.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:55:55 -0800 (PST)
Message-ID: <a6f08213-e4a3-41af-9625-a88417a9d527@redhat.com>
Date: Tue, 4 Feb 2025 19:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] hostmem: Handle remapping of RAM
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?=E2=80=9CWilliam_Roche?= <william.roche@oracle.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, mtosatti@redhat.com, imammedo@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <20250201095726.3768796-1-william.roche@oracle.com>
 <20250201095726.3768796-7-william.roche@oracle.com>
 <7a899f00-833e-4472-abc5-b2b9173eb133@redhat.com> <Z6JVQYDXI2h8Krph@x1.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z6JVQYDXI2h8Krph@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1u7VjfBAfmgJnYBkjEy9k5W_3C5kok29FkTu9gYRr_s_1738695357
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WOgLGwxVQNTt

On 04.02.25 18:58, Peter Xu wrote:
> On Tue, Feb 04, 2025 at 06:50:17PM +0100, David Hildenbrand wrote:
>>>        /*
>>> @@ -595,6 +628,7 @@ static const TypeInfo host_memory_backend_info = {
>>>        .instance_size = sizeof(HostMemoryBackend),
>>>        .instance_init = host_memory_backend_init,
>>>        .instance_post_init = host_memory_backend_post_init,
>>> +    .instance_finalize = host_memory_backend_finalize,
>>>        .interfaces = (InterfaceInfo[]) {
>>>            { TYPE_USER_CREATABLE },
>>>            { }
>>> diff --git a/include/system/hostmem.h b/include/system/hostmem.h
>>> index 5c21ca55c0..170849e8a4 100644
>>> --- a/include/system/hostmem.h
>>> +++ b/include/system/hostmem.h
>>> @@ -83,6 +83,7 @@ struct HostMemoryBackend {
>>>        HostMemPolicy policy;
>>>        MemoryRegion mr;
>>> +    RAMBlockNotifier ram_notifier;
>>>    };
>>
>> Thinking about Peters comment, it would be a nice improvement to have a
>> single global memory-backend notifier that looks up the fitting memory
>> backend, instead of having one per memory backend.
> 
> Yes, this could also avoid O(N**2).

Ah, and now I remember where these 3 patches originate from: virtio-mem 
handling.

For virtio-mem I want to register also a remap handler, for example, to 
perform the custom preallocation handling.

So there will be at least two instances getting notified (memory 
backend, virtio-mem), and the per-ramblock one would have only allowed 
to trigger one (at least with a simple callback as we have today for 
->resize).

-- 
Cheers,

David / dhildenb

