Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp683763ejb;
        Thu, 19 Oct 2023 10:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqpw/wVyIkRpIF7qYlkJiRLS+AVZui33DbCRL+mhZQhxfr7hUzcN7BHrsHlDI3xHx3RcTw
X-Received: by 2002:a05:620a:24d5:b0:775:9f94:1a7b with SMTP id m21-20020a05620a24d500b007759f941a7bmr3160809qkn.0.1697737279403;
        Thu, 19 Oct 2023 10:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697737279; cv=none;
        d=google.com; s=arc-20160816;
        b=OhNNxwAzDcdNpDDfJwzKWBSqvnv70SoAj5DoX31oT7KFDkYJBwuPnLFPD9zfbDurdu
         ymGkJRmlvkcH2ebWdYS1EvdQiGMzya/cN6+opYX1i7MJN9kubRwiHotfJPle+oueOzUD
         G/fz6toSMvB0VTFZ627wqgKTAmTMXCyV1rctj9BIScUWUwvNNWZW/VmU5Us1MrJb4eOe
         vFDRwTserPj/R8Knr0uQeC/dmd+NHioHo2cjg7jKYAxj3Zi+yWaaAr4aIW0r+ANSAgjc
         aagI1iunF+5c+zHQv4/TCtboryLhOllDoyrFSslabViFriN9O9h0s0uwemcP3bavQQ1Z
         QZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Sb8PmOdPdBX7z9VVSpMrzs4JoG7i6FSASwltQ6OtKok=;
        fh=6GP2OsZY6tTj2H18E/WlD/v7ZJJOp3+19m6wfMcnPzM=;
        b=c2Z11fDw6hWr1rfswWUOqaZWUtkeAqCO4W6gN5cJWd0u5xBUP6LTI8lwEvAbnoUvPl
         oN3/jq0NtsOXV4YlraaBqz0FVSUYAOxzKinpgYor9A+JQeNXeHEITqgOq/8J7tFG09gF
         5LYQCEtN4EKXml45v+S+8APT/RCgd89oEXepi0oFMlhcdK9vhFAoBu5dDAx+7X7ExGaY
         LIxLp6INnl9TzKXE/9CJ/Mq7CvIKDNhe24sU2DTXL4Ok9bL1OB941mXqXMpOV7Kf/cqf
         w1PnlfhnvotMe0St11IhfjKH3m+1d9k0evKED3ljGWq1C1zUc32sgUXyO4+NtllcG5cs
         8B4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hYLEjP8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020a05620a245000b0077703bd9771si1994535qkn.364.2023.10.19.10.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 10:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hYLEjP8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtX1B-0007qN-Pl; Thu, 19 Oct 2023 13:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qtX19-0007ob-LS
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 13:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qtX17-0001Ic-6X
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 13:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697737263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sb8PmOdPdBX7z9VVSpMrzs4JoG7i6FSASwltQ6OtKok=;
 b=hYLEjP8T+BklIvMlOZcAP9aI21jk5wgMMaqJfZnnn6Nwz3FPbp14Gd1hrMRbdZCalmZdx9
 DaM4KdKjDiPXbj5h+PLyBTEDDzG7Sol4ip6vgmfqNG4Bksh24Tgk9mSIGvcWaQKr2WmirU
 nVtOR7f990ucKz7f/MBVmROLIdh8gZ8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-XHLuyAvhPyyS8nfmhEtWBQ-1; Thu, 19 Oct 2023 13:41:02 -0400
X-MC-Unique: XHLuyAvhPyyS8nfmhEtWBQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3b2df828525so3893461b6e.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 10:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697737261; x=1698342061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sb8PmOdPdBX7z9VVSpMrzs4JoG7i6FSASwltQ6OtKok=;
 b=JyyZ4Z4mqNsJVQBaZnWHk7l4Kp9zBCVmc42R9fr2559N8CBPP9aiKS0Zm/LnXF1MPA
 AFZBWBFHaU7cj9xhz4InQJXTtzG+9pwEGVBnn1v2B3dIkZ7tXV4PT6lbfvPuyw/0vfHh
 YDP+9+mHWDQZaOWCYqz4w/eBRDbYhVu9VyFDoDx/wPBJ9VyJ64DHXE+khWEdYle3D66k
 AZ+bJRWIisPHpZLt+nI/azQUVfKWz+Ol51FvDEYhXfg2PhiXVmOcuQNwYmCUrbJC2b2b
 1IWLWowdzjgDZ4wU3+MVXc6QvEr6h8Gf7ZG7ca6RJDHhuc6CzZEfkdBCQHOkrjnSCtE+
 RZLg==
X-Gm-Message-State: AOJu0YwC1xTqnqKMIJzTiQ4f4DoPzEouaVQoO0XAxbrOcFH56Dp0dUH9
 QoHQaI1KndGEZa4BNi18ec5VZ66Weul1ZuoqTOtku2fp9hMi7B3jdBuIKQTyPfb+fvP45Qf/lzO
 PXw5vvV+XbO47
X-Received: by 2002:a05:6808:210e:b0:3b2:e519:192c with SMTP id
 r14-20020a056808210e00b003b2e519192cmr3565589oiw.9.1697737261273; 
 Thu, 19 Oct 2023 10:41:01 -0700 (PDT)
X-Received: by 2002:a05:6808:210e:b0:3b2:e519:192c with SMTP id
 r14-20020a056808210e00b003b2e519192cmr3565525oiw.9.1697737260112; 
 Thu, 19 Oct 2023 10:41:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 d27-20020a0cb2db000000b0066cf09f5ba9sm15658qvf.131.2023.10.19.10.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 10:40:59 -0700 (PDT)
Message-ID: <8f943dbf-5a75-4b82-9521-af8999105d62@redhat.com>
Date: Thu, 19 Oct 2023 19:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
To: eric.auger@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 YangHang Liu <yanghliu@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231018093723-mutt-send-email-mst@kernel.org>
 <9ddc3f2e-8be7-4e03-bf9f-3ac930650a52@redhat.com>
 <9a8912df-23d1-64c0-134d-cc42838b34d8@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <9a8912df-23d1-64c0-134d-cc42838b34d8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rgu5h2PxyVMz

Hello Eric,

On 10/19/23 15:51, Eric Auger wrote:
> Hi Cédric,
> 
> On 10/19/23 13:07, Cédric Le Goater wrote:
>> On 10/18/23 15:37, Michael S. Tsirkin wrote:
>>> On Wed, Oct 11, 2023 at 07:52:16PM +0200, Eric Auger wrote:
>>>> This applies on top of vfio-next:
>>>> https://github.com/legoater/qemu/, vfio-next branch
>>>
>>> virtio things make sense
>>>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> let me know how you want to merge all this.
>>
>> Michael,
>>
>> I will grab the series if that's OK.
> 
> I have just sent a v4 taking into account Alex' suggestions, collecting
> Michael's and Alex' R-b, and YangHang's T-b.
> This should be ready to go if you don't have any other comments and if
> this survives your non regression tests ;-)

Sure.

I did a simple fix in patch 2 for a documentation breakage. No need
to resend. I should apply in the morning.

Cheers,

C.

