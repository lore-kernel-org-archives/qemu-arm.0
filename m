Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp721349njg;
        Tue, 25 Feb 2025 22:56:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVc0qYI90iRWmxm65sMMjRsij7C3ikq07ztU2l6cjoBpAkfGFa3ta3UN+Mp1+gqgL/FPVvFHj0Ku3SzhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH0a6JKp4P7wAbEjPb5lfcZcl3BtI5nj4/MTyl5aLhlGcMr5I1/ku68UO1cbE6WQ6q7O6bo
X-Received: by 2002:a0c:e9c9:0:b0:6e8:8e91:fb2 with SMTP id 6a1803df08f44-6e88e911061mr3450026d6.0.1740553012026;
        Tue, 25 Feb 2025 22:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740553012; cv=none;
        d=google.com; s=arc-20240605;
        b=YdBFJTIkYGvZsRuThpps6pwtLcXkAe2I2QT9XDNkBDsaUbRzQ1JEa8leUkBPF507ef
         Q8nF8e9zGAhnOQcYzWdHVRAlGp85gmdzXpD448zG6wraG2Ov+JTCmqMPlpk3HPOamfsa
         sO0tRTonLTq+PPecRQQ4UGmElKDMf7TwwOa7BR7Mfgu/NEwAqIhcRffpVMnkURYTv31B
         RAeAzo9fSiMzR+aVnJBCOj46DNo+D/+5RDog2+ZZhEO+Z9i+LlgOve6y/3tagAnRKq90
         SPv1aik5YaCZE1IM3qqjY/jl0gXvjgw36mT26N6T0PIeZmOd/+cvHzZgmfeTh+aL865i
         1sOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gXHq/VsznhwhZ79bk3SCXggo60RrHTjxbjHEu18HB5s=;
        fh=qEeS4W7P8Ver/8tKtEanURgnJI/AQ3LB98219T6HcQg=;
        b=XP7r35TA6je1LXLyw44q548Xs+3ZT2yPDtgS+lzhrdWfFKr0DIWX1QK6W/2hgG7bkB
         DV7Kp2HvxGxOXcRMwZZ0VQJpOo662LTSqo0pEmOSOUIhHj+at8UKZis9+/GmMhw0Phk8
         PzGjmCP3Va7XyQalkEaGL9/XppkiXdst1s4k2T4t+Zl/d2k4zBLN6Ph4wvCt0K1g42fS
         v5KA2PcqLNcMJTDkx7yOLriuF1dQeUPKKi0j4lPZoq2TXaVjOiQuneVxbpw5q7jBIAPe
         ZOFcNNlgx2sbsjLyXAcjyDZpEE6ciuZMTNkTH6woLc+SHNLLkrLFywdV+4djMKLvgJCH
         Awcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PEQky1/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2d8f81si317023685a.434.2025.02.25.22.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 22:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PEQky1/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnBLX-0003hl-VL; Wed, 26 Feb 2025 01:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tnBLW-0003hW-LF
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 01:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tnBLV-0005Ys-0R
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 01:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740552999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXHq/VsznhwhZ79bk3SCXggo60RrHTjxbjHEu18HB5s=;
 b=PEQky1/BeHGUqJQTYSjjsG+6iP+P8qqfcrqMpw8W0Adh3nAABSGmUWFyDRXPSPRFLL9jGf
 5S/KxL1unnrdDh9HtNtH00dcIqtYO1jn8MsNQN3huwpWg+VWFGC3vE03gh6f8eCtnBfgkf
 t+6MGDljaUYl9lSsx59Mkd6TuNDGA3U=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-B0wCYyEAOmWf330Tdht16A-1; Wed, 26 Feb 2025 01:56:34 -0500
X-MC-Unique: B0wCYyEAOmWf330Tdht16A-1
X-Mimecast-MFC-AGG-ID: B0wCYyEAOmWf330Tdht16A_1740552994
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-220c86b3ef3so12484775ad.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 22:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552993; x=1741157793;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gXHq/VsznhwhZ79bk3SCXggo60RrHTjxbjHEu18HB5s=;
 b=WfPOAWeSvV3fuHBRAeZesEVkpF8gdqPDPYk20cd2BTzamU78gEqLMZQS5u8PyAGlk1
 ZlVnY96iauMiXZYMxRhrmclFnfgE4S+lHn3Ol5cqbLDh7cwFMDkwIxNE6z8D64h14Mrs
 iaS79VmDK5CUcmo+Bn7+wIy/U06qs5PkcEBF6xYZ4XbMy95oDS/tz30rU1TDN3F/OpSp
 IpDqdQlIh0gKqBFVUfm0Eb2j3m3r71XPEUTYqr2GMIeUB+L0rlQeTmkqoePkrLhQ0VHV
 szEaXX71N204Bvn5OndWQ/o+6+CXYypg5eFDQqj7l40Cj8KsjmtxXejj/78iRAgEFE5j
 jzlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxE5SC1VGQmkRiE8cNN0GCmOdFdQQ8+zzGoizzsiPSuZCOvAIWVSSjE3y9XxcImGNHV6egsRrJlA==@nongnu.org
X-Gm-Message-State: AOJu0Yxj/xTfBdoBT1obUA2mDE4iELV8pQ/uIMYffPKlwvOLUu4JmRX9
 QjR42k8vEjl45/fkSxDZqh0ccjji0fMN0u4CDNUCx8998UM+DYGu2sYTCOUfDP069Tccx1snLXM
 IT8gAjBor+xfBDA2louS1xPCGMwbJ7FzH6MujRcCcVSMsDIPO+A==
X-Gm-Gg: ASbGnct3AMivRJFIwwR7v5JrfEQuNuHAYOIWdfpECN/XExcmMa2lj0QKxKtZIA4egc8
 NxHwAnVyEp4oMHh8qOaTkJnUDMWk22NplJvSvdIWlwZ6jfMj3bAoMNcZY8b7uYT80hCH3dkIXY9
 D6f96sjSEfN5JYFr1x4ZRitlEbuKnRln5dPX9/3g/stJejExX5112Bg/H0Ya8Qct3eIWhFzGA2E
 7BpeY2oUlpHI+SA4r6fG67SaY2Gi1Ul1l77973afiSFmKXea15Hz48mHzKs6gfNUEw5P1pQLLmV
 xEYdQmU/m+AQMfuc3w==
X-Received: by 2002:a05:6a00:2e14:b0:730:9637:b2ff with SMTP id
 d2e1a72fcca58-73425ca201fmr32964803b3a.7.1740552993554; 
 Tue, 25 Feb 2025 22:56:33 -0800 (PST)
X-Received: by 2002:a05:6a00:2e14:b0:730:9637:b2ff with SMTP id
 d2e1a72fcca58-73425ca201fmr32964782b3a.7.1740552993122; 
 Tue, 25 Feb 2025 22:56:33 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a839abbsm2806052b3a.173.2025.02.25.22.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 22:56:32 -0800 (PST)
Message-ID: <f14e5c46-8205-41b4-aca7-cdcb3456c7ac@redhat.com>
Date: Wed, 26 Feb 2025 16:56:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-5-gshan@redhat.com>
 <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
 <7caa54df-abe1-4833-bb59-cb83f8241962@redhat.com>
 <20250221110435.00004a3b@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250221110435.00004a3b@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZHvoNSXzyt4gBz5HoPRAgaOVKpasJ6Qb84z5O8dV9bA_1740552994
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: edDx4h0XPYRT

On 2/21/25 9:04 PM, Jonathan Cameron wrote:
> On Fri, 21 Feb 2025 15:27:36 +1000
> Gavin Shan <gshan@redhat.com> wrote:

[...]
   
>>
>> I would say #1 is the ideal model because the read_ack_register is the bottleneck
>> and it should be scaled up to max_cpus. In that way, the bottleneck can be avoided
>> from the bottom. Another benefit with #1 is the error can be delivered immediately
>> to the vCPU where the error was raised. This matches with the syntax of SEA to me.
> 
> I don't think it helps for the bottleneck in linux at least.  A whole bunch of locks
> are taken on each SEA because of the novel use of the fixmap.  There is only one
> VA ever used to access the error status blocks we just change what PA it points to
> under a spin lock. Maybe that can be improved on if we can persuade people that error
> handling performance is a thing to care about!
> 

Right, it doesn't helps for the bottleneck in guest kernel due to @ghes_notify_lock_sea.
With the lock, all existing GHES devices and error statuses are serialized for access. I
was actually talking about the benefit to avoid the bottleneck regarding the read_ack_regsiter,
which is the synchronization mechanism between guest kernel and QEMU. For example, an error
has been raised on vCPU-0, but not acknowledged at (A). Another error raised on vCPU-1
can't be delivered because we have only one GHES device and error status block, which
has been reserved for the error raised on vCPU-0.  With solution #1, the bottleneck can
be avoided with multiple GHES devices and error status blocks.

   vCPU-0                                           vCPU-1
   ======                                           ======
   kvm_cpu_exec                                     kvm_cpu_exec
     kvm_vcpu_ioctl(RUN)                              kvm_vcpu_ioctl(RUN)
     kvm_arch_on_sigbus_vcpu                          kvm_arch_on_sigbus_vcpu
       acpi_ghes_memory_errors                          acpi_ghes_memory_errors   (B)
       kvm_inject_arm_sea
     kvm_vcpu_ioctl(RUN)
       :
     do_mem_abort
       do_sea
         apei_claim_sea
           ghes_notify_sea
             raw_spin_lock(&ghes_notify_lock_sea)
             ghes_in_nmi_spool_from_list
               ghes_in_nmi_queue_one_entry
                 ghes_clear_estatus                 (A)
             raw_spin_unlock(&ghes_notify_lock_sea)

Thanks,
Gavin

