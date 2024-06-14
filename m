Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp155364ejb;
        Fri, 14 Jun 2024 03:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAn2A5hPhl+sGTIPQLQzE2eg86lBbzYnTu+Z14igR4QWSfZMvGD4tUfh7ZR3F1cCVDyoMEcLfSZ0WGJglbm8u0BeLWU8q0
X-Google-Smtp-Source: AGHT+IHp+PzwDM2B4MN5+aa3Rf8sp/2hIK3FnxgAqeQSOoglObRxA0xnXnNX6UNtglZ873x/hZgg
X-Received: by 2002:ac8:5956:0:b0:441:55dd:b4f3 with SMTP id d75a77b69052e-44216b45da0mr20496891cf.63.1718359535583;
        Fri, 14 Jun 2024 03:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718359535; cv=none;
        d=google.com; s=arc-20160816;
        b=J5WCQY7ieJaQZFXiZiOIe711Qn1iH4eIAM/Lv6ByZlBnlqsAM9z44KfGkAP0U5ea6p
         mLLQPuE2yUOA9nxcs2DMRC8YV7VPaGhR/VPK+Xq+/Wln+AbyOsLcSPg3W/DPvLD9hz2P
         348eDj+EZTeBcUyGf8Zl59uTj4U66LNq4PecOXVkzUb9ExIgTfzXoPn7M37NCUKrJxH9
         zsrLRJIYGAltpGEzumU1FfiHu5zLkyXnGnq+xofxay/yAEfKbvw/YiJ5COt/EurC9IhK
         5i+o+Ed4ugV5NkqoBHxDvH+ZoXmk/OKpqzFWZB9L6ZN0t1VdEaPOXs3oCFJdF+S4otZ3
         Y6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Gwo/Jsa13Ll3Es/y0yghFvctU2KH/rcsXeXQKCHBjPY=;
        fh=bEbIFJsManpqhC40Gb/7RUr1cSH29SM4C2Azp4iZO7s=;
        b=KuIUx6CScVVPcnaD6IGehCp+OMHrMcBUVCGc3yfMWvCWyWHCbW3anUpFAVv3inoqQR
         cM1vQHsV21w3IWpDl/1TthGjFqnC5/U0GUhou2Mlc9Fo6NpdfyO6equgjgkfyYd3F1po
         sr182mkzd+lkXHQQVXvte1UyQD711NwRgkKYeuvClzgCHwvwG+1bVSWrTNuRHSZnPQ2y
         mAK3xko2PuF5vxH1os7Ai291HuJfarQV9gO3kiCSTOwS7h7mI9u6uNMpdVhVWyJwREW+
         RDDWoPrkQYMWtNGrBuw9dpBe6JUgvuBdIHJZV3Uyo5/Pyr9BCP88p9egcg97Blq6cNCo
         SKrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PodJ91i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ef3ba080si37111031cf.27.2024.06.14.03.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 03:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PodJ91i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI3nx-000899-L5; Fri, 14 Jun 2024 06:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI3nw-00088o-A2
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 06:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI3nu-0005vy-51
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 06:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718359504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gwo/Jsa13Ll3Es/y0yghFvctU2KH/rcsXeXQKCHBjPY=;
 b=PodJ91i32boJFEpAc2NaWs+GVczNv7leuqK5OxS+vzboYfOKdLcvCeabEJqFASmzamnTCU
 YDFjkt0pnRK5GICdouEA5w0OuhBcVwKesh7I/vKIJIBHyFEGgE+e4Y7hztlYr7ABhnfGuw
 NTDM9foBj/3mTjU5J9HQZQm72KIJAaQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-_PEajnxLNWKJTlXoAGvHbA-1; Fri, 14 Jun 2024 06:04:59 -0400
X-MC-Unique: _PEajnxLNWKJTlXoAGvHbA-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3d22f6e761eso1660436b6e.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2024 03:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718359499; x=1718964299;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gwo/Jsa13Ll3Es/y0yghFvctU2KH/rcsXeXQKCHBjPY=;
 b=jGwMURRksfisw87RrQGCduOhCmJ3YNTCffvhGMRqNdzp8ST5RDbitkENhAG54uZynY
 54rVPPXoRWbE6vhMEU/ONeFB88pyFjwRqdLVRl2iQ/u4dKV7Yf3Qbi5kH6T7SnTcwLkb
 FjwnzLWUcsS/HN8hwA0UQwbOskB1B4okxvmuwyde8X2YLLgSf1i8PU+BYBIiWnCJF7xu
 n1FHFdgQy1dXGeeIQMDGlJjeej3bTOSp4RPwZphaW3rfg+HkXQL50Fk3gC7OzhG8DIJG
 6UgxZbd3L4ypIanVn9oA260okdqAXhkIUQIr04fp6BgXLgoLtItOQ3vApd6uMXqHNgXp
 l4kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlFU3VqPxGEUDY0s9ricBJOBvDnvHzQu7zm8g7RiqR3LFmLjpJ3GStMfzel0KJ5BmCBaeUIn4qMNMlGYUw83e1dQzQ
X-Gm-Message-State: AOJu0Yw1sSMzQ8L5mNpTgsH1+ApIqiwNhNwm8pA6QPPKSwrMcBXuPgEw
 WBwmBhnKx95n3O6/o+lXVXTT8hXtcjhl/TpF87qqRlN95Jk3/hbhG1sQxEMb4ugygOqQJW5XQ2w
 t0r1Bdgd6nrHq0/Vdy+M5oeq+Hcn96rLA3LiaUtwNRettxEAgPw==
X-Received: by 2002:a05:6808:1485:b0:3d2:2293:9990 with SMTP id
 5614622812f47-3d24e8ace79mr2336682b6e.2.1718359498730; 
 Fri, 14 Jun 2024 03:04:58 -0700 (PDT)
X-Received: by 2002:a05:6808:1485:b0:3d2:2293:9990 with SMTP id
 5614622812f47-3d24e8ace79mr2336661b6e.2.1718359498325; 
 Fri, 14 Jun 2024 03:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abf64365sm127898885a.136.2024.06.14.03.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 03:04:57 -0700 (PDT)
Message-ID: <ec740f33-44ae-4d50-be65-5f717122f4f0@redhat.com>
Date: Fri, 14 Jun 2024 12:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] HostIOMMUDevice: Store the VFIO/VDPA agent
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240613092359.847145-1-eric.auger@redhat.com>
 <20240613092359.847145-2-eric.auger@redhat.com>
 <ef400920-dcf4-4f37-b4ce-c5560b92d9c5@redhat.com>
 <f6473f76-1d8f-41cb-9488-73edc960c996@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <f6473f76-1d8f-41cb-9488-73edc960c996@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QqW4kp9tixbl


>> Talking of which, why are we passing a 'VFIODevice *' parameter to
>> HostIOMMUDeviceClass::realize ? I don't see a good reason
>>
>> I think a 'VFIOContainerBase *' would be more appropriate since
>> 'HostIOMMUDevice' represents a device on the host which is common
>> to all VFIO devices.
>>   
>> In that case, HostIOMMUDevice::agent wouldn't need to be opaque
>> anymore. It could  simply be a 'VFIOContainerBase *' and
>> hiod_legacy_vfio_get_iova_ranges() in patch 3 would grab the
>> 'iova_ranges' from the 'VFIOContainerBase *' directly.
>>
>> This means some rework :
>>
>> * vfio_device_get_aw_bits() would use a  'VFIOContainerBase *' instead.
>> * HostIOMMUDevice::name would be removed. This is just for error
>> messages.
>> * hiod_iommufd_vfio_realize() would use VFIOIOMMUFDContainer::be.
>>
>> That said, I think we need the QOMification changes first.
> 
> OK I need to review your series first. At the moment I have just
> addressed Zhenzhong's comment in v4, just sent.

Yep. Just take a look at mine. If both of you agree with above
proposal, I can care of it and resend all 3. It's a small change.

Thanks,

C.

