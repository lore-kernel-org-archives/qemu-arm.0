Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2724455njc;
        Sun, 16 Feb 2025 19:59:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXml6VEAmczg3DZND/pu9pB5vuzcJO8iMB9WNoB1T84/Cj/JkEDnxPyGzWCGLjZ5MuiEhpHoW4sohMTLw==@linaro.org
X-Google-Smtp-Source: AGHT+IEo5P0O7Ofu6jNftrMod4+a1MiyfY09hv6v9GGCNtkRUto1US2LYUCB9XTG9ZCTsOM6iv+Y
X-Received: by 2002:a05:6214:29cb:b0:6e6:5bd5:f3bb with SMTP id 6a1803df08f44-6e66cc8aa53mr114841506d6.7.1739764781150;
        Sun, 16 Feb 2025 19:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739764781; cv=none;
        d=google.com; s=arc-20240605;
        b=Rrsowwp604+4/BQ9qmDB0SB6dilsklWIJ3gP3YvbTSZfWVJjja5IUp+sUyhYiJuvxc
         NqqSFpplwjCPPKbw+mHKvSAXWlJuxCktZsFRivEQ3E23NS19Agck6KbiUyO/dSJ2adxT
         IeMFN6zXs0vt8edJDX1hvkic+0X5D27l1WU8x7nHpwSLxuEarRqdvhgE3ucD1S88I6p4
         8oiXLxK5ntLH8RJPazAH4x58ZJ+IJnNvXlQ/TTJY7/fbTbBIE4Te0E0VKIT4o3kZSR7M
         dptsvI45izQPwKFpCNCC5x9WsAl2+VGWRqkaMaVaDzx+OJIwccf4frQrgYzsyr0uQdGl
         +sXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=h65WkFi/EmB5cWM2abccwfaf8y3XQxyzMfwJRkQ52g8=;
        fh=D5SQaAQHQLJ8B3KMHI7sHb35WI4/RdkISvED0q4/aRQ=;
        b=PLbpZjK/KKVG5/VMReAyo0+aIizXZ29Gigv9iXLMiwk9B/VlhgF5nrWJ3b7eqXi2g4
         aPv0arFw9uK8HFd69ZVxUKAxo8Eltobef6Q3wznDtwwL6wQbfuu5M2aguP2qzP82OlBT
         XmwuvebUQeNQxs0vgy6tX+KhOTdI0MEpL1w9XumH5+sWMgItsDk2o/AQkgClupy9oV3L
         4nZL2DInhjPUIkQOQq/9sx2ivnx7jAONexP8ani8LW7ao78mtVpQGspXml9B2Yl/lntl
         qrOmoG//dnF+qnJPR9hqwozjRW1mBaZ9fiIkLQaHd0sSy29uCM8SMQgmqIJmhDGrBQUX
         wg4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bKxL2mVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e676213255si28011246d6.8.2025.02.16.19.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2025 19:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bKxL2mVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjsHc-0003fF-Sy; Sun, 16 Feb 2025 22:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tjsHH-00036U-Gv
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 22:58:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tjsHF-0006u3-Sp
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 22:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739764716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h65WkFi/EmB5cWM2abccwfaf8y3XQxyzMfwJRkQ52g8=;
 b=bKxL2mVtV/32ySOTn6ZW/Wyya00oOYx6yJ+ME45lMwsUPNd54w/yjdqS3NpystLcjmE9pR
 GkKCeayDZzoBGjB+ryUGmBg/zYCWooLP7RANnLM+2v8dvNSO7Bw3PDPj1F3otreFMe/kGr
 sW8seU1N4Qa/IM3nYZBkbqEQO/xKPbM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-NilbjJJcMnS4-SF5VxdqKw-1; Sun, 16 Feb 2025 22:58:34 -0500
X-MC-Unique: NilbjJJcMnS4-SF5VxdqKw-1
X-Mimecast-MFC-AGG-ID: NilbjJJcMnS4-SF5VxdqKw_1739764713
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-220ff7d7b67so42109405ad.2
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2025 19:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739764713; x=1740369513;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h65WkFi/EmB5cWM2abccwfaf8y3XQxyzMfwJRkQ52g8=;
 b=ZQVaDgkHrAXvw7pY6u3N8zUXmvl3bXnUWeZ21B2bCP1P9C4Gtm++yKuM18eOi1yJXo
 ELGvOQsh7E5Jx3UgCGzHFCIgQxy7bZv1WGxe79ynktBlEwh317wVRQdeQKPHRMbKPx5N
 aGtq61wwcW5ryIs06wDCGp37XKTR1SlvknqUVrHp/0xfyNSAV8wVm4ialNkNNgzVPozD
 jIy1WnLm6t9KZf4d+E1PGrqsYCy6bD4DKZ83Ki1xgxrHFx5ZmSGLBwbhpYzEciWMQphD
 HhEzhlE72OME8cPNRrKlVH4BDrv+CRVI/bNL0UCXIcVF1plYawK9Zke+ZKVjC0zVc+c4
 c7RQ==
X-Gm-Message-State: AOJu0YwM+CQZEV4oFyjzGKf23IAVrfSs5049kJ+GWtdUr7gy/3KqPpRt
 h4yyPuSi/FTR8LD6DtpY3fPKUIs+nWxZ+C9fESeWUv5GxaXF+ryIEbiKqxYpjXe8KmKfsxJXZqE
 pONcvCUSCOlh/pSdGfawllLumz9mp0hT96vQQIZEGOGpQJezFUg==
X-Gm-Gg: ASbGncteldOfpQa1PFmmjHLBUW7itdI1ofDixxTEIG/FA4QxHdBLPbw3GzixFGIhMNe
 Q4PvN+rKUZum3YrqK9QNENhwIWa6rQkaPY5l+40ilouzXubq12HrxSKZttUnsmbXfav8WskEPz+
 EY28PbkPNXYMYCRSmeWFO1+Pko0aF4o4VxJ8F6SQ4Kq7QVyh5YWuKdmUBYperI3deiTN821nOZt
 s4QwgD74rYw1Le8+Rv6JV9XyxJEOWt45Hgiw/H5M+Y+dMqzgVY0S7uiUa4rBQdwug1/AI8OBLew
 BEnnZg==
X-Received: by 2002:a17:903:41c8:b0:216:3466:7414 with SMTP id
 d9443c01a7336-221040bcc46mr148178125ad.44.1739764713099; 
 Sun, 16 Feb 2025 19:58:33 -0800 (PST)
X-Received: by 2002:a17:903:41c8:b0:216:3466:7414 with SMTP id
 d9443c01a7336-221040bcc46mr148177885ad.44.1739764712757; 
 Sun, 16 Feb 2025 19:58:32 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d534af3asm61917705ad.44.2025.02.16.19.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 19:58:32 -0800 (PST)
Message-ID: <8a5b8897-0754-41bf-b044-15b85fe155d7@redhat.com>
Date: Mon, 17 Feb 2025 13:58:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: Improvement on memory error handling
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, shan.gavin@gmail.com
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214135945.322319cc@foz.lan>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250214135945.322319cc@foz.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0WT118_Pq2-qB38A8sxwrAbkRakg6SjpRoI51NFihGY_1739764713
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: Qa+SSL4lWkGq

On 2/14/25 10:59 PM, Mauro Carvalho Chehab wrote:
> Em Fri, 14 Feb 2025 14:16:31 +1000
> Gavin Shan <gshan@redhat.com> escreveu:
> 
>> Currently, there is only one CPER buffer (entry), meaning only one
>> memory error can be reported. In extreme case, multiple memory errors
>> can be raised on different vCPUs. For example, a singile memory error
>> on a 64KB page of the host can results in 16 memory errors to 4KB
>> pages of the guest.
> 
> There is already a patchset allowing to have multiple CPER entries
> floating around since last year:
> 
> 	https://lore.kernel.org/qemu-devel/cover.1738345063.git.mchehab+huawei@kernel.org/
> 
> I guess it is almost ready for being merged, needing just some
> nitpick changes to satisfy ACPI maintainers. Such changeset already
> adds a second CPER entry for GED, and allows to easily add more as
> needed.
> 

Thanks for the linker, Mauro. As I explained to Jonathan, the bottleneck
isn't the number of CPER entries (single or multiple). The bottleneck
is actually the acknowledgment mechanism. With the mechanism, a single
CPER buffer, which could contain multiple entries, can be delivered
and acknowledged at once. I don't see your series changes anything in
this regard if I don't miss anything.

>> In extreme case, multiple memory errors
>> can be raised on different vCPUs. For example, a singile memory error
>> on a 64KB page of the host can results in 16 memory errors to 4KB
>> pages of the guest.
> 
>> Unfortunately, the virtual machine is simply aborted
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
> Having a retry buffer might be interesting for some types of errors,
> like error-injected and corrected errors. Yet, it doesn't sound right
> to buffer uncorrected errors that would affect the virtual machine.
> 

The question is how the uncorrected error can be delivered if the previous
corrected error is being delivered and not acknowledged yet? With the
acknowledgement mechanism, all errors are equal in priority when they're
delivered, correct?

Thanks,
Gavin

