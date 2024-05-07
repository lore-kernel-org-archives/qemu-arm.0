Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1897914dlb;
        Tue, 7 May 2024 02:34:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMD/VAPXHcp6e+WLqQJFgI9bfkeNSxaOtAjCEPzAKhUe7NodKb8waLWqRV2903xm0WUAU+ScedmdvbwhKd50+LNDqy2ViM
X-Google-Smtp-Source: AGHT+IEXOc7YV3L177HHVbJt1wpdTKYQiLGduYqWku27U0uAVVD2l8T4HWJnRHZgREiuSEr2gpN4
X-Received: by 2002:ac8:5807:0:b0:43a:3620:f89 with SMTP id g7-20020ac85807000000b0043a36200f89mr17169772qtg.50.1715074462814;
        Tue, 07 May 2024 02:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715074462; cv=none;
        d=google.com; s=arc-20160816;
        b=WW6U4nkXORDQzlu2VrRG6en/VKl/uwwRpphCQ+c1dXPjS42T+P8wMkTpK7AnP07Bhy
         bBeDwWM3EcA5M0UKaQ9uga5LaPNGt7lBwxFQb6Zm3kvaXm0UfN763cyjzRbGuDW0skp7
         zfkjyqdo30Ma10dpZog6AzNg4saCM1nYy4XWF2DdBW+ja990CGpL5YlEqflJe3cYpyrL
         GttXlArNpJoeRi20EZS8mJxlhiWkFSM8MkE/GYoH27xGwWyXBL+fOru6BwJ/UETweJ2Q
         mf+VFqsH5EB1BYeEQoTwhVvn9rLgJOqozAqxPf/VXqLXkuE45f4wh6lKBtphp8gYDNn+
         8qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=q55ABqTCNonI0FXQbPBXszur4ikvmXTqLMyy1VF/Rvg=;
        fh=jhctn7rjf9SltVMFBe4C0lxnuTsVRZNOMX6T2xrgM2A=;
        b=0gClPgZDoe/EGe/OCzZ1Akl49yaFu0SiUmlWwwOCpY93YmuV+pdZaVVjYUh24UR+wV
         RyxIyg7+dmVwRSbaXE1Mq1FXCh3wQSS23oHva8bq6OpEnRvi9GnlSPBL4jqTMeT1JwdF
         R9+KI8bw2Gc++rnR6Eufy5ZmVM7916vodC45zUjx8KQavK3QWQfJ5rpeyOcnegMHgrLj
         xKBhUimQifOLgl4t7udhQrWLawX2AU8T1n1q29N7LXKq/vKlRhVoJ2GnZj8VzNVmHSoU
         BLpIzE3OaEEutQG+8qR21JHfVuKycSK/uBfVSGGTKoyLc687JuXC6fSydb1pNbJnkGz6
         Z9Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VLmnnpPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020ac87d86000000b0043acbc18507si12002378qtd.145.2024.05.07.02.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 02:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VLmnnpPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4HCj-0000iL-0e; Tue, 07 May 2024 05:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1s4HCh-0000hr-Kb
 for qemu-arm@nongnu.org; Tue, 07 May 2024 05:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1s4HCa-0004TU-VO
 for qemu-arm@nongnu.org; Tue, 07 May 2024 05:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715074415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q55ABqTCNonI0FXQbPBXszur4ikvmXTqLMyy1VF/Rvg=;
 b=VLmnnpPns19Q6vhYrlJ9u/L3S2xeKG3nXwcdDi++n3jn1TDPDovlRDbUnHlf/1jl6/PXCN
 FusJDBU+mQsMh3BSRuYOQRUOyBIRgQo+NEJfYTAslL770KShsfvS3zFBHIaCY9NwuooSzb
 qffrjcKMtqn2LJVb0i88ki9utHT8dec=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-Yyf1vcOyOzSNSdlvheG9uQ-1; Tue, 07 May 2024 05:33:32 -0400
X-MC-Unique: Yyf1vcOyOzSNSdlvheG9uQ-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7d9f35c5288so62514439f.3
 for <qemu-arm@nongnu.org>; Tue, 07 May 2024 02:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715074412; x=1715679212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q55ABqTCNonI0FXQbPBXszur4ikvmXTqLMyy1VF/Rvg=;
 b=pXk5Z5ZD6qm8sF0MtTn/d/PTSOvnvkL13J+g3facXruMwxe27beDd4wwXjiKkHpPtL
 Xei1qrHR6Vp3RKpjbCN+wZnZ3mSZzOfT71L06Nix41kcnRVhsmriyrWT/Jx9nzVVepXQ
 YG9GtpwGPTMDeTVhuzTVsm4dzIJZnbZGoCJ0mqfebqz+fUVQsSFhshA224mfHqOIomRt
 7Yo0S1XFoDNmtPLrJjEDt+3NhV6kArsm3RwBWOYQ8eSBixLiIxzGZ88BLo8U8DVdngrk
 gW7eSnTkmv1D6J/Ts+HnH5u+3bHD4H2DP7ektNemZhdBOc30q+z82Kqv6zO5FsHcPYmS
 ezbw==
X-Gm-Message-State: AOJu0YzKMS9/Hi8l6hQnqA2PeHY4YJZhJp5hlJbdUIkJTVcfF1jahDR3
 RJ/QxLystC84nBdpZcqE6su98vIFDzkboPjgRWFlnkS1uoKi7/3zxsmpXEjSUX3gdBim7N/5+Z9
 fiC6ddtqaKHO7Qk+pO5NzGGObWORcy2+HDNhTgm9R+3z/t6BZ+A==
X-Received: by 2002:a05:6e02:1d13:b0:36c:5572:f69d with SMTP id
 i19-20020a056e021d1300b0036c5572f69dmr14984571ila.1.1715074411801; 
 Tue, 07 May 2024 02:33:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d13:b0:36c:5572:f69d with SMTP id
 i19-20020a056e021d1300b0036c5572f69dmr14984557ila.1.1715074411415; 
 Tue, 07 May 2024 02:33:31 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 n10-20020aa78a4a000000b006ea8ba9902asm9025877pfa.28.2024.05.07.02.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 02:33:31 -0700 (PDT)
Message-ID: <2df3915c-8928-4c01-979e-8c71603a2279@redhat.com>
Date: Tue, 7 May 2024 17:33:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20240409024940.180107-1-shahuang@redhat.com>
 <Zh1j9b92UGPzr1-a@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <Zh1j9b92UGPzr1-a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.581,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4XLdVEo53edr

Hi Daniel,

On 4/16/24 01:29, Daniel P. Berrangé wrote:
> On Mon, Apr 08, 2024 at 10:49:40PM -0400, Shaoqin Huang wrote:
>> The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
>> which PMU events are provided to the guest. Add a new option
>> `kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
>> Without the filter, all PMU events are exposed from host to guest by
>> default. The usage of the new sub-option can be found from the updated
>> document (docs/system/arm/cpu-features.rst).
>>
>> Here is an example which shows how to use the PMU Event Filtering, when
>> we launch a guest by use kvm, add such command line:
>>
>>    # qemu-system-aarch64 \
>>          -accel kvm \
>>          -cpu host,kvm-pmu-filter="D:0x11-0x11"
> 
> I'm still against implementing this one-off custom parsed syntax
> for kvm-pmu-filter values. Once this syntax exists, we're locked
> into back-compatibility for multiple releases, and it will make
> a conversion to QAPI/JSON harder.

Thanks for your effort of reviewing my patch. I think if I need cost 
more time about the QAPI, that's outside my initial idea and deviate 
from supporting the PMU Filter.

So I decide to not update this patch now. And wait until I have time to 
look into the QAPI or the -cpu option has been transformed to QAPI format.

Thanks,
Shaoqin

> 
> With regards,
> Daniel

-- 
Shaoqin

