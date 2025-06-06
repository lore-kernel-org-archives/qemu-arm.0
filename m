Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp765335njc;
        Fri, 6 Jun 2025 01:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGp2PQONyRTXZgEKVW+nxmmnCJXqWAzS+4x/EuvnSO1ja5XgJbC94t9eYNMR/lqhLtJhB6gxovTjPJGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG7re99HK4FqbwIJZCOeDrZQshpU6xLQt9zVcrHYE6iDDdUhtCKNm3C7uD3QtFgP8Z6blvI
X-Received: by 2002:a05:622a:4c05:b0:4a3:fcc7:c73c with SMTP id d75a77b69052e-4a5b9a04187mr44502691cf.8.1749197226537;
        Fri, 06 Jun 2025 01:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749197226; cv=none;
        d=google.com; s=arc-20240605;
        b=M4GkOILYiVbyEj0KsRS1o0UeJiLCpilll384TWoVn1AHn86aUHBz27e+eVwieE18wz
         ujeZJWpY0VK/YR8rTgAat7bSmKsxAcL/HVDts9LBwePvkG6DucUXtcI6yfQ2BtP/274b
         bqrtewWVmIbcDv71PhffNcVvvsjLAElUbeID/ciZ1MiiV7SGrM5TooDiVbjZFGqPN2oS
         a5SQs3EOKVf2/bXezYOSHDdszfFkwEWeI81UGu3R+cy2vSylVa9XLqUVxO0cdb1w0Yf4
         u1cdVPXe1g9Fg37Nn+uTI1KFcFaC0+lUXBM4JGxqL6FWeNnvKmZRTmuiQqDMywlKbVzR
         s6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=W/k3GfmdiWOW6nGw3logUEsxs0tADPWnI5BWXYdRa68=;
        fh=ydyNT9E2q23kV4kSXEevumSPKVP9MJ6Vptmf/0Nib/Q=;
        b=UYF0vl5XcraufF7U8IB/kvKp9bmCtZjWoReCgDEc/HU8f+He0IMQALrk08L5WEOpeM
         NrT6bnX6EyGhFCp1ZPOB0oBWNx/TizKSsN7N11sur+NXlJCfLQG72ytzelEbYn/XRrXK
         YGGyK/nKotnOaEY3mLh858anGIQRdFuX5HS5P+Pqi09Ay2J96x1HEJBhSt1zWSb6JDkP
         PqutpzU4/rLdDnp5b1PEPeAXd7YPgrg5wHB1XWhIhi0wLXMzOCwxv6ZncT7xVOLLTEwU
         ar3LePYi5N+osRcUXWQlFj6H84rEowpBRlZwc3ofMJiahswFaNhexzHragUTDlGZ+7mD
         Jweg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GbGvIMUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a611169a74si12157941cf.55.2025.06.06.01.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 01:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GbGvIMUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNS68-0000VH-NK; Fri, 06 Jun 2025 04:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uNS64-0000Tt-OX
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uNS63-0005rA-4b
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749197196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W/k3GfmdiWOW6nGw3logUEsxs0tADPWnI5BWXYdRa68=;
 b=GbGvIMUKoKxLNcK4zWfqU+DWoQM28Ml1SZDaORTjDBKeEBszTI6kp4NbZbsyEhslBwIouy
 kSuNlamIpbtUsJAxbS7O6dcHELkm11hdXMNacrMuRRhnsJvZuAMZDhGw1QEZszC3qK5qQ3
 XdNHIt6Gcg5Rih+KAtJELb6Ayp8Ve2Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-w4uC4pO4PMOxNUPmn7nClw-1; Fri, 06 Jun 2025 04:06:35 -0400
X-MC-Unique: w4uC4pO4PMOxNUPmn7nClw-1
X-Mimecast-MFC-AGG-ID: w4uC4pO4PMOxNUPmn7nClw_1749197194
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d021b9b1so8151385e9.0
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 01:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749197194; x=1749801994;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/k3GfmdiWOW6nGw3logUEsxs0tADPWnI5BWXYdRa68=;
 b=gwJcSOaDOtOKuXUIFaH3zJ2i6+kkewcptrWkLtm0QAPAMLQlVJFznNgsaY4rQggY7n
 t/TeITKL+QvHnWKh0fLIFp8sJu5dUWtS0XWFRH3cE+kWT0o3Cig72m8gNtPjbArssDJd
 XbIfwB/xo7veS7dYUfbh/GS4FPLg1UfozlBL1cb+FIun93ZnCD+/tR6/2o/B6mz3qnrG
 aUUOXRSopUbtU7VybSJS9y4ePoQCQzfoAfiIPJzRICj0deCQmgnND9apB87bUBlfcxkC
 wlk1i3wyp5kw/wracbyVDynstrwBI4KYmLd89OEh1vhOpk3sJcHipJBdbhkIMldEqkZH
 ubOw==
X-Gm-Message-State: AOJu0Yzr02bbsQfM9gYtcy/V668GcnIb4BIaKjpocGs09n+ZY+1VSPMF
 jMKYMUyk3xU/L1wqsXx7bnFYWGMo+8iCHu/tHTtF44w9zhbC7mfyokMLJLG3aS124I1AWZ9aZiE
 o1Udm1tnK6JaPYZ4r5pUM1jlBvQE4lQ3EL6xru9ABWVForMbLqi4fAg==
X-Gm-Gg: ASbGncvKQVgPK2x1cDYUh7Iy0uXZbDIys6Hx/O2t7sVltEtmeLX3tVrnOQ1JSJRcx8E
 MVNDswlxsyu/o+LeyaEWnIPr+UeQ+3CuF4yvuviQpU1oCMirspyhrLrVwac/Z4IwDLgUPYF2moV
 CvRt7gLWQ+MqF/TcKYU3R/RUfnwlRVH3kJ1vtDtmmnbdHMxScaMgbAK7tY7fXfEP4Z5pfMh9oTp
 fJ7AnvoPkJgz/MOqSs67faWECOrs/VvEZOsTaS9I+cABp2UfIuWQxi40J7A/2X20r5HMtOQbuNX
 FsWMTI3iua3qLNa7noKhKSytaGk6P69X2ttbZTkY3H0MLaeJac+89pV4XpGC
X-Received: by 2002:a05:600c:3b10:b0:450:cd25:e69c with SMTP id
 5b1f17b1804b1-452013d1f6bmr22918625e9.21.1749197194345; 
 Fri, 06 Jun 2025 01:06:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3b10:b0:450:cd25:e69c with SMTP id
 5b1f17b1804b1-452013d1f6bmr22918365e9.21.1749197193962; 
 Fri, 06 Jun 2025 01:06:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452137290b9sm15529725e9.34.2025.06.06.01.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 01:06:32 -0700 (PDT)
Message-ID: <cf34f5b2-d422-453f-85d4-15938ae59e9f@redhat.com>
Date: Fri, 6 Jun 2025 10:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ramfb: Add property to control if load the romfile
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20250606070234.2063451-1-shahuang@redhat.com>
 <aEKeNSc8mAZ8vhGj@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <aEKeNSc8mAZ8vhGj@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t9MM6iNPtCfLD4XFUzeppjEKtJ0WjF823hyf5PHO-Cg_1749197194
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RbAvnnHNRP0h

On 6/6/25 09:52, Daniel P. Berrangé wrote:
> On Fri, Jun 06, 2025 at 03:02:34AM -0400, Shaoqin Huang wrote:
>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>
>> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
>> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
>> for ramfb, so they don't need to load the romfile.
>>
>> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
>> device, because the vfio display also use the ramfb_setup() to load
>> the vgabios-ramfb.bin file.
>>
>> After have this property, the machine type can set the compatibility to
>> not load the vgabios-ramfb.bin if the arch doesn't need it.
> 
> Can you make this a series, with an additional patch that updates the
> current in-dev machine types to use this new property, so we're clear
> about the proposed usage.

yes. And please change the vfio-pci property name to use underscores.

C.

