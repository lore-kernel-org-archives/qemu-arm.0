Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2666034njc;
        Sun, 16 Feb 2025 16:30:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWj9DPc4dF8FU7Xv7QpaGiipLeA8jXU+8NoTkLG4dfM9cGxIxW+1LgdqJqDiumhPqqpCUA4h0GMsPUbFg==@linaro.org
X-Google-Smtp-Source: AGHT+IFPS9dExrbSTvHBDrehb+fpf0gDndcjBFj2iLD64TktBl6Ia82mZ4W3k+GCxuP469bBz4ah
X-Received: by 2002:a05:620a:288b:b0:7c0:7a41:667e with SMTP id af79cd13be357-7c08aaa8aabmr957865585a.44.1739752203522;
        Sun, 16 Feb 2025 16:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739752203; cv=none;
        d=google.com; s=arc-20240605;
        b=UhfgfrpEWJDmoKKBMsZToJFL2P0ISJyen/AwHT0Nbtgexz7sFhB0mz09ATSyCG5zrw
         H63m6jgb1mGMrXmiSEid0GKlIF3m9GFPvsQVUZFA7HJX8Pf2aN24iVr8SA9d7i31BU2m
         DLAISH7QqZzvwC4q+KMLk5VQxEYasUPJUVr8aC+84trxWhR8DdAMb9PKnXa/rwUp25Mi
         5Np37F5riRzYf1KGIGlZC9BQ5bj+0nMK8IcXC+VnxsTLYoTDr3EK90pH0mBdokBB4PgW
         4T2sYiqKILTh7KYBXQWpKHZopiPe9BEtjGnYk5Pd93KkeTSmq0F3de7xMlUPbG+PFqNb
         72ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vXJNdbq4maba12nquUSj5Dc56qd2/s7ETawfKG9qXSg=;
        fh=uwLFj7UEyLkRAnb1NJsr8vL3dG7D5dIVPyn0zl/ZC2M=;
        b=NiSIxXGDC8Km+QEse6UGe0v9IvIKt1GT90GPAWOedD0RH3O9thb/ZqAkYUDVX0aCHk
         mEzTBMvfQfgzazMWvZaBq6V/3667U7jt1WFguPTnhKeyeatT4lyeRBAttUZedAuOWIYn
         kQe2r7hXyngOgN3nGS9BptBtKgjCbpEh5xSXuHcmWVOpkcRsoRR9+fvj6gptcGwbXXQL
         eALdThD8W4YRDRsDvmBhxE5bb8IXCeSHO3CuEkNlnuWhWsYtFfzv69wFFdMFzXMf5A8B
         6C2pveHmLh5ab2GPl8kv8KU6E03pQmBgVPLAbJ6NwE5GE9QPLBS2Z0gtXJ1NmZNww+fp
         Vm0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aR3obX9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c892245si777325385a.373.2025.02.16.16.30.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2025 16:30:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aR3obX9z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjp1C-000256-SL; Sun, 16 Feb 2025 19:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tjp1B-00024k-8b
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 19:29:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tjp18-00045i-Lg
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 19:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739752183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXJNdbq4maba12nquUSj5Dc56qd2/s7ETawfKG9qXSg=;
 b=aR3obX9zdyYNxHLlt9E858JZEZKbwu2dyVz3V5H0UuD3vtH0USszleD+OSRZDXXKMn45Xc
 FktZn3TKcStE8PeIX4aKTQuDUftkrRcoXo4KUBsGIhh1r62HpiCkCimaIH5UfnCX3Qqe59
 StdThYnCJjI2W+cAH9s1v4UpSCV9y2Y=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-6wQfZ7FBOnug14Et2eLK3g-1; Sun, 16 Feb 2025 19:29:40 -0500
X-MC-Unique: 6wQfZ7FBOnug14Et2eLK3g-1
X-Mimecast-MFC-AGG-ID: 6wQfZ7FBOnug14Et2eLK3g_1739752180
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-220ec5c16e9so51870095ad.1
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2025 16:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739752180; x=1740356980;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXJNdbq4maba12nquUSj5Dc56qd2/s7ETawfKG9qXSg=;
 b=NztXUSO25gt3dW9foT45ANeojsiCMeqs/esZaEYHYr4h79sSShQiNsJsAv8nAJUGIQ
 b1akzaBKzeCj9FLzEE5zrDZ+zXoAbUYW3lFxX9SwQfiagxdrjwRV1C6zE1RPpNjGKHtl
 ulU3nmD0LdV/ktM57bEtqtLfm2sA9ZDch/0SsduNp1V9eGO/ZZv/eEtZwcoRDFCpARHB
 9uZzJKe/B+JMICEp0VgSYbhsSx+HFjFTYypXl8SHrl/HeSwVO0VCcvVPus5FD4RZLm0i
 LtTMvXFtgLYeGgHNbHIwzCRM2H/Xqd8Omz0J8oiN1HfVrcutdh3KE4rUT1Obq+T0w4t4
 IoyA==
X-Gm-Message-State: AOJu0YyNBmn+OG1R8U/amGdvc5upPoLmE/JgDX44aFbINRCHUfvW56G2
 3N+e82rrGFCO8KauvM+phmOOfKgAczCrw09gelbvNwHcsuKtsVjpoyegdI1buOn8/nxXj51rWe1
 XxMFEbnb9MvRoqhFzwk7CGKKoM7/IbH1nzcb6QzZ2wt1WByRCdw==
X-Gm-Gg: ASbGncvfNpGENkixXXOfBCMHmhtl8VR8oLIJyNufUntphHlHZjo7PVsbJSF3DxW0569
 7ko5reEYOPY8ghKf2Pwmw6Kv8CFPvLSY2bCKoQgJL8+iR0STuo/roVMaDmVpNj5UFAxw30en4HO
 2S7DOfq/Zv+uRTS/oWg7PzJnFPBNz1hzw7ewdcgmJZ8iOv1JhK13qwDQHLcbugi9xkfF92prqEx
 xFtP0/wRhdJZg2zL10qZFCNqguyJlqgph2r9xfx7RacGuT14onkGmGnRXObGYXkctaIzGIRwlVr
 0Fi+pw==
X-Received: by 2002:a17:902:cec9:b0:220:bc9e:ff4 with SMTP id
 d9443c01a7336-22104062cebmr123387385ad.28.1739752179787; 
 Sun, 16 Feb 2025 16:29:39 -0800 (PST)
X-Received: by 2002:a17:902:cec9:b0:220:bc9e:ff4 with SMTP id
 d9443c01a7336-22104062cebmr123387045ad.28.1739752179352; 
 Sun, 16 Feb 2025 16:29:39 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d558527dsm60793765ad.219.2025.02.16.16.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 16:29:38 -0800 (PST)
Message-ID: <b6699187-a720-4fbd-a57c-a7bd86d7621b@redhat.com>
Date: Mon, 17 Feb 2025 10:29:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: Improvement on memory error handling
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, shan.gavin@gmail.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214095353.00007afc@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250214095353.00007afc@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r-BMcZdCWeAC2zk2_YZjtJ7HkantFTxC327zCAx5k2g_1739752180
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: IXHD7qNYXfJw

On 2/14/25 7:53 PM, Jonathan Cameron wrote:
> On Fri, 14 Feb 2025 14:16:31 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Currently, there is only one CPER buffer (entry), meaning only one
>> memory error can be reported. In extreme case, multiple memory errors
>> can be raised on different vCPUs. For example, a singile memory error
>> on a 64KB page of the host can results in 16 memory errors to 4KB
>> pages of the guest. Unfortunately, the virtual machine is simply aborted
>> by multiple concurrent memory errors, as the following call trace shows.
>> A SEA exception is injected to the guest so that the CPER buffer can
>> be claimed if the error is successfully pushed by acpi_ghes_memory_errors(),
>> Otherwise, abort() is triggered to crash the virtual machine.
>>
>>    kvm_vcpu_thread_fn
>>      kvm_cpu_exec
>>        kvm_arch_on_sigbus_vcpu
>>          kvm_cpu_synchronize_state
>>          acpi_ghes_memory_errors         (a)
>>          kvm_inject_arm_sea | abort
>>
>> It's arguably to crash the virtual machine in this case. The better
>> behaviour would be to retry on pushing the memory errors, to keep the
>> virtual machine alive so that the administrator has chance to chime
>> in, for example to dump the important data with luck. This series
>> adds one more parameter to acpi_ghes_memory_errors() so that it will
>> be tried to push the memory error until it succeeds.
> 
> Hi Gavin,
> 
> +CC Mauro given:
> https://lore.kernel.org/all/cover.1738345063.git.mchehab+huawei@kernel.org/
> 
> is more or less reviewed subject to some requested patch reordering and
> whilst I haven't checked, seems unlikely that there won't be a
> clash with this series (might just be some fuzz)
> 

Jonathan, thanks for the pointer. I didn't notice there are pending acpi/hest
changes. The changes clash with those included in this series, I will take a
close look.

Thanks,
Gavin

> Jonathan
> 
> 
> 
>>
>> Gavin Shan (4):
>>    acpi/ghes: Make ghes_record_cper_errors() static
>>    acpi/ghes: Use error_report() in ghes_record_cper_errors()
>>    acpi/ghes: Allow retry to write CPER errors
>>    target/arm: Retry pushing CPER error if necessary
>>
>>   hw/acpi/ghes-stub.c    |  3 ++-
>>   hw/acpi/ghes.c         | 45 +++++++++++++++++++++---------------------
>>   include/hw/acpi/ghes.h |  5 ++---
>>   target/arm/kvm.c       | 31 +++++++++++++++++++++++------
>>   4 files changed, 51 insertions(+), 33 deletions(-)
>>
> 

