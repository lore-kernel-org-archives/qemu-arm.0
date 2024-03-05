Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp114382ejc;
        Mon, 4 Mar 2024 23:12:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkhneJ9Sem3Q6q6IWzP5AzNfIVjK6ojsyooAc0xQKGaojzmKag2bFstK5S/eddy/VxYytzkd7t0bn0Mj/UNWWFAao17xUQ
X-Google-Smtp-Source: AGHT+IGrf9JbQA+/e01D1Vk7uS/KU071RSSAf86ehIh2KKQA+jAseoBL7rkkHNggAjyetpApSy9J
X-Received: by 2002:a05:622a:104:b0:42e:68b5:da8f with SMTP id u4-20020a05622a010400b0042e68b5da8fmr1109076qtw.1.1709622763182;
        Mon, 04 Mar 2024 23:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622763; cv=none;
        d=google.com; s=arc-20160816;
        b=jtZCcqVj58QcUuJy22uZ0l9HdS9w90WSJePG43xJ5sYhBhEKPp8ZjbyW6dS9w2Lp7I
         7pzbDilTw6G2aWvyhHAXEjZejK5hgcDhxPuQ9BM+JJZ6omgN1a5xKb+iOz+c0WXafSld
         ms2eGNgkCS89nNWjZ8dIONKKbTyvfRaC9DYTfQVsehd4EOQhpcdzYq2xY9fUrL1b8DVp
         UG0OZ9RbKZURUWV0vrWS0QyZD4KRkjcK7r0H9qbLcrHAn57RmZmhFoDgTZP+uDQEO5y1
         fpPOAwcQ8mzB930aaIMNdLP7rKyzEqvLV/LxzKArTdsYmgwL2dpy72Ax6Nl7f3xOshfX
         f4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZJXSIOH+YBRZRygDXtueZZ6Vz07xd7JTPPO9WZ0Ig8g=;
        fh=mAaFec1PVepxmBtnXMLFzElNyaVs+AdAq2uwC8AZdPk=;
        b=M5sgIDrDLIr4L0Uet+tEFzxZVjNUvJcClQ+e3QUFFqd9ISkHEXsmA0TqLIJZbVxNJ9
         9GTFJkcZIwyopnBVBrljGa0KrnfV0Hnz2L+78ULP0UBc4yiYEkTuarmIogw4AnilO7AL
         ecg0o5nuU+khsd3EC2Eo+kGtMTwId/hPTYOxyq7b2N+WjKJRVh/+MWGsGNGOIYKiWThr
         kln37ELsI+c2cWmtcFTWjm+oD9OqsUKo3zXNexHv1mqLK+gp0rJhaRZi7r9iw3EOobj4
         hx+Up7+RzpZDTzYWItxqjZLBWBfauDye0CuEIH/20Qvdm17zxDIJ1gzoLo5IzWFl4GNn
         21qQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="e9e//2je";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa2-20020a056214480200b0068cbacd748fsi11442466qvb.520.2024.03.04.23.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="e9e//2je";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOyB-0004M0-Gt; Tue, 05 Mar 2024 02:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rhOxi-0003zZ-WB
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 02:11:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rhOxf-0001ks-Vq
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 02:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709622696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJXSIOH+YBRZRygDXtueZZ6Vz07xd7JTPPO9WZ0Ig8g=;
 b=e9e//2jevDBJQg2gD1CsYdrdlA5txRBBna8QjnjyIcpjx3kr68NZlRzdxLhhDd0884QFIl
 mwBj5FbfF/fc2l0l/B+1HxteoVpXqD3l21fIa7pEba0CzGsmpuj+3S6RnqMy6FhQ5Ev5lW
 QLct9PQWLg/hSq5TYTIJap7/N7GjmEM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-v8v4vYi6O4SLiR9hPoK3sw-1; Tue, 05 Mar 2024 02:11:35 -0500
X-MC-Unique: v8v4vYi6O4SLiR9hPoK3sw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-788228e459dso263325485a.0
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 23:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709622695; x=1710227495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJXSIOH+YBRZRygDXtueZZ6Vz07xd7JTPPO9WZ0Ig8g=;
 b=Pk8wUMt9w9hVXXRyp6Tv5LQnWbmW8UnsTQs2AK71vfXjQMW4DnEb/9YYQs1BN0GuLk
 1Ah9jarmgna18s0P1ZwLldqlpaBiHL3HOeJfw6pIdG36X9B2/pRFmEswbCcwUN1r/IfA
 yglPem1UGuKHDzH1gAeV6N2ztanqh1CwJNJfbne0oQGf0WGWyVHeRQaN01UCiqwuuJeS
 BYn2CKMJeo/0ej6Iy2WZUOivM5AKKYr5U5eS8XzCPC+blkf+9ragSlciCuEks1D3Zoum
 Xd+P5YAjK8RXoTAaHibRYOoiIVzE8AzXbGdxyMimjQidp5Qd988YCydPzllIL9Ku0Npw
 zwqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuYrcL20pNgpQQ8cl3VGtOOI8z8hBN4K+1RrLfxbU9Hh4Rh4FSjmxMv8UsfnL627L4V2EXLBIxUGF3kz6/GF0aTdg
X-Gm-Message-State: AOJu0YyRnTTk/y/h4ifEO3z9ScNE4sgkvknEjafc+/XlIpGXVbDv5UCJ
 MFv1Z73wvHRdsFPMDnHS2104/kF1Dk5tGlM/BgpNtOPLDRScLj0P7vfZAOUty3EaX/TsWzGPy3q
 4+yssdVlC/sI3dBVz37sgaGueYjjYM2UjnBMw3cWLVs94CP+qpQ==
X-Received: by 2002:a05:622a:104:b0:42e:68b5:da8f with SMTP id
 u4-20020a05622a010400b0042e68b5da8fmr1107488qtw.1.1709622695101; 
 Mon, 04 Mar 2024 23:11:35 -0800 (PST)
X-Received: by 2002:a05:622a:104:b0:42e:68b5:da8f with SMTP id
 u4-20020a05622a010400b0042e68b5da8fmr1107465qtw.1.1709622694795; 
 Mon, 04 Mar 2024 23:11:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 he29-20020a05622a601d00b0042ee1ff302esm2592910qtb.66.2024.03.04.23.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:11:34 -0800 (PST)
Message-ID: <533ccbfc-7d90-42cd-9183-a5b128c41fad@redhat.com>
Date: Tue, 5 Mar 2024 08:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
To: Ankit Agrawal <ankita@nvidia.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "david@redhat.com"
 <david@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
 Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
 <20240226164229.00001536@Huawei.com>
 <SA1PR12MB71995AAADE78D3D0052FAC01B0222@SA1PR12MB7199.namprd12.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <SA1PR12MB71995AAADE78D3D0052FAC01B0222@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
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
X-TUID: nqnRDdXZdB5O

On 3/5/24 06:59, Ankit Agrawal wrote:
>> One thing I forgot.
>>
>> Please add a test.  tests/qtest/bios-tables-test.c
>> + relevant table dumps.
> 
> Here I need to add a test that creates a vfio-pci device and numa
> nodes and link using the acpi-generic-initiator object. One thing
> here is that the -device vfio-pci needs a host=<bdf> argument. I
> probably cannot provide the device bdf from my local setup. So
> I am not sure how can I add this test to tests/qtest/bios-tables-test.c.
> FYI, the following is a sample args we use for the
> acpi-generic-initiator object.
> 
>         -numa node,nodeid=2
>         -device vfio-pci-nohotplug,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
>         -object acpi-generic-initiator,id=gi0,pci-dev=dev0,node=2 \
> 
> Moreover based on a quick grep, I don't see any other test that
> have -device vfio-pci argument.
> 
> Jonathan, Alex, do you know how we may add tests that is dependent
> on the vfio-pci device?

There are none.

This would require a host device always available for passthrough and
there is no simple solution for this problem. Such tests would need to
run in a nested environment under avocado: a pc/virt machine with an
igb device and use the PF and/or VFs to check device assignment in a
nested guests.

PPC just introduced new tests to check nested guest support on two
different HV implementations. If you have time, please take a look
at tests/avocado/ppc_hv_tests.py for the framework.

I will try to propose a new test when I am done with the reviews,
not before 9.0 soft freeze though.

Thanks,

C.


