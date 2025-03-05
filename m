Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp767745njm;
        Wed, 5 Mar 2025 04:40:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSz4bQ72V+dM4fg5/9uU6qKrwnE3XJ2/sLoUXpKZ0nMoYUXJnnJYZNjyDWQZ/WW9582e1zXurPUBBi9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF163wLdTJW45jyycT13EF/9A7ptnnoK6kmz96bJTwUFcdAG4FDGyzyPlQz2M/bW1vrQ9PQ
X-Received: by 2002:ac8:5dce:0:b0:474:fada:48c7 with SMTP id d75a77b69052e-4750b4e5b15mr44589391cf.50.1741178435050;
        Wed, 05 Mar 2025 04:40:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741178435; cv=none;
        d=google.com; s=arc-20240605;
        b=Rj+0ocOCuAX0OiC7t8PCm+Ca0l3PUgGojsb2GkTuq/Fl2tnM6r1mt9apZqc1dur0KX
         gn7QNA+k1F2yf1GUaDPebl7CJUkqSUBPrNhExkH+ZtXQ1jx4xfxN63PEp6RNmlyrGcuP
         Rg1tKxIW/0b6QThB3BTYo1Q46kFBGJjysw4CXAsBed/KV4mdy/jKrYX5FIRWVxMftIkl
         8sa2/SoNFAvVRVCEykMYTwFqXhXKeqLQvvaJ4my8+6AzqxfEjxjDZYXzJQahvHIsWNjD
         hnQuveIuy3hBKK0h0XIblKhvDKenEbUG+ApyMBT7CU16VOCihXjqAXt855L1lbnbLjXQ
         5jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=81czC9BRFL+bcNlT8OrWk8I8+lLa5badvyUN2rQVNdw=;
        fh=DYK4DWMzIh4tag9gxXyFGU6Y8p6stGkO1t9+siFYZbU=;
        b=PDMEBArGcKyhSCNS5jxio3v92/I++V5FXdusgdMimqIQgOuJ7QOlXsfYRMtbOYeR16
         Ky0VJGIXca1VeWXm1UTv+7krYHDxZQxExfvW9wUxLTwEBzppFGaGAamDcjPRqrRcL5WP
         f5jWqjfebPQpiiG04oj77GcS8cM2IEL4aXfq/G+lYuEcQG/prXZbED8EABg940vYLV4b
         4V+/mhco2E+oqJj+FkY5C5xfK8IgO0iQI07ywMH0p7PWe+cUY1BJzFfJjz2Qqw04Fiul
         7ykhnSboT2LXNOdA+8wD3ifhEyigkGduQEnqxxuj1xr8JdUZzSND4YCWqzlFT3HPGtOd
         RO4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGOSx0jC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474723fddcfsi124540521cf.258.2025.03.05.04.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 04:40:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGOSx0jC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tpo2x-0005JR-HB; Wed, 05 Mar 2025 07:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tpo2l-0005II-DN
 for qemu-devel@nongnu.org; Wed, 05 Mar 2025 07:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tpo2j-0003lR-AY
 for qemu-devel@nongnu.org; Wed, 05 Mar 2025 07:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741178408;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81czC9BRFL+bcNlT8OrWk8I8+lLa5badvyUN2rQVNdw=;
 b=RGOSx0jCZUT3kz9gPBxxRXfZK2eC27kbo7XExh4SQJSe5j5ZDx0X9B0iBcEL1yToRjg+o5
 RxFeVqEnLp5jqQP2KQIB23kw6gEkQoIv+XD/IpqHor30UXS6ur8U7EppPnqJkF3k8B2WLB
 r6UJBAcGLJNtOH6ckSnYUeIlsSs+py4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-o_1A_-a2MbmakBucJamy-g-1; Wed, 05 Mar 2025 07:39:56 -0500
X-MC-Unique: o_1A_-a2MbmakBucJamy-g-1
X-Mimecast-MFC-AGG-ID: o_1A_-a2MbmakBucJamy-g_1741178395
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4394c489babso36242305e9.1
 for <qemu-devel@nongnu.org>; Wed, 05 Mar 2025 04:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741178395; x=1741783195;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=81czC9BRFL+bcNlT8OrWk8I8+lLa5badvyUN2rQVNdw=;
 b=SYRKb38GTEtsxMIj50wIRpqYvqbVcRulbX1QRWI/IPjqMWva3VQLxs3l1CoeY6lFuo
 Nn+8wCu/P/mdHXWs3Wu71kqBU3Pzy7FB7QP162Abd9p9OittnKKqtArd6p+jnGN5Wr54
 bfh28UjkRpApdeiWlk38qtTL9K+F6Ee39HNpI87MvWEPpYSb+8BA5U81Tw/4KprvnZma
 CSrcx1PkUBOLB9NKy5olgoWe4n24DaR1bVws7vy4g7zpVhkfxRIpJG4xG3NRYV2eulVd
 Fsh/FUKRCjKzeRaP2dcxnM4hRuckFB+5crbXVRAfWUiW8+LZrNSt+GVmJhKIKmrPWYQ0
 BpyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPFXCtEtuPr/WDK4VAfghzeQbd5jaAEMLgQfwfatR65nJtTmZ6j1j73ZUa+jBnXCJLI15ZEf56ACfX@nongnu.org
X-Gm-Message-State: AOJu0YxEGwyPA3A3J3INJsibD10k1s/hbmv3ibpg/w6g51s8PyvuCCyR
 0WZGffOLZGZUzVnBE32dYILzoVNfTEuNd1VrpyS4DfN1G56B2AmcI9PNrNKCw315OSvFHXfqQum
 114MUMsM8+HoRtgDIrSBDav1Tvsj74hNUxu55xoCRe8FqNO469jvE
X-Gm-Gg: ASbGncv/UI2aCyzJeK01lIS18fx19e9YVvZKsRZBMd5DiLYQmBYa9JNhGFFwl3s36mO
 OG/+oC3e2daeRCKpjuwlS7b57zHlQyTrFP+nnHpaaOEsfi0/uZR3HiRucYTcWzA6AlutnbQnOpD
 dTPonS58TCoCln6KlD4jCfdmyOiJFyJ2IYkmOLHmOp4NKXUhqlBhNoY3sgnP4dj7OxX5DMD7vP9
 IWNgGQTsAmIGGSFuft63F2U1jI0lg5YqYPvE0xSN+ahbz0sCh5F7Q5ZiB15VS2jAifHF7NoCIHT
 i9OzR2QIVNb+OeurCNbxiajjc7kXQsg5/Q6agXqtsbQ0CAjyLxXsB29nRzlM2uY=
X-Received: by 2002:a05:600c:1c9f:b0:43b:c0fa:f9c5 with SMTP id
 5b1f17b1804b1-43bd2aed752mr17754015e9.21.1741178394578; 
 Wed, 05 Mar 2025 04:39:54 -0800 (PST)
X-Received: by 2002:a05:600c:1c9f:b0:43b:c0fa:f9c5 with SMTP id
 5b1f17b1804b1-43bd2aed752mr17753835e9.21.1741178394217; 
 Wed, 05 Mar 2025 04:39:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd429136esm16196825e9.9.2025.03.05.04.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 04:39:53 -0800 (PST)
Message-ID: <915d5167-14a5-4d25-83f9-297cbf113dfa@redhat.com>
Date: Wed, 5 Mar 2025 13:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vfio-platform: Deprecate all forms of vfio-platform
 devices
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org, clg@redhat.com
Cc: zhenzhong.duan@intel.com, will@kernel.org, maz@kernel.org
References: <20250305105800.949153-1-eric.auger@redhat.com>
 <66093554-5d13-44fb-8c80-3c042f0c12c4@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <66093554-5d13-44fb-8c80-3c042f0c12c4@linaro.org>
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZoXMgRb8c6+0




On 3/5/25 12:45 PM, Philippe Mathieu-Daudé wrote:
> Hi Eric,
>
> On 5/3/25 11:58, Eric Auger wrote:
>> As an outcome of KVM forum 2024 "vfio-platform: live and let die?"
>> talk, let's deprecate vfio-platform devices.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 25 +++++++++++++++++++++++++
>>   hw/vfio/amd-xgbe.c        |  2 ++
>>   hw/vfio/calxeda-xgmac.c   |  2 ++
>>   hw/vfio/platform.c        |  1 +
>>   4 files changed, 30 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index abadf8de27..d11a7004df 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -434,6 +434,31 @@ Stream ``reconnect`` (since 9.2)
>>   The ``reconnect`` option only allows specifiying second granularity
>> timeouts,
>>   which is not enough for all types of use cases, use
>> ``reconnect-ms`` instead.
>>   +VFIO device options
>> +''''''''''''''''''
>> +
>> +``-device vfio-calxeda-xgmac`` (since v2.4)
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> "since" in this file means "since when the option is deprecated",
> so it should be "since 10.0".
>
>> +The vfio-calxeda-xgmac device allows to assign a host Calxeda Highbank
>> +10Gb XGMAC Ethernet controller device ("calxeda,hb-xgmac" compatibility
>> +string) to a guest. Calxeda HW has been ewasted now and there is no
>> point
>> +keeping that device.
>> +
>> +``-device vfio-amd-xgbe`` (since v2.6)
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Ditto.
>
>> +The vfio-amd-xgbe devices allows to assign a host AMD 10GbE controller
>> +to a guest ("amd,xgbe-seattle-v1a" compatibility string). AMD "Seattle"
>> +is not supported anymore and there is no point keeping that device.
>> +
>> +``-device vfio-platform`` (since v3.1)
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Ditto.

OK thanks to both of you. I will fix that



Eric
>
>> +The vfio-platform device allows to assign a host platform device
>> +to a guest in a generic manner. Integrating a new device into
>> +the vfio-platform infrastructure requires some adaptation at
>> +both kernel and qemu level. No such attempt has been done for years
>> +and the conclusion is that vfio-platform has not got any traction.
>> +PCIe passthrough shall be the mainline solution.
>

