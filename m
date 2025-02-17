Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2722335njc;
        Sun, 16 Feb 2025 19:50:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJbqK7bkr89TKxv4gKKdVumeIlZfXBRzUAEDvz2pm6FFab1aB7ocqWSYhupDUzt7OLNC6I24xBKDLRjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFldj9sjqp1eZpeZ/0u+9hSx/qvPh7sE4DF8DC1T6+Gfm1UJaYH542oUQdL4W3a+85V80Tk
X-Received: by 2002:a05:622a:1304:b0:471:b546:9050 with SMTP id d75a77b69052e-471dbcc0e5dmr119877471cf.4.1739764240419;
        Sun, 16 Feb 2025 19:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739764240; cv=none;
        d=google.com; s=arc-20240605;
        b=I0aIvA8X0TankQhBhfsTJvBDuMCM0hGU8++0jsBwIR6TD/6wuH6V432aIOqcmmPwU4
         pQDolu2kK2fwRWC2ToGFOeaKUZ07jC4BAdptseogCmNjXU2ZvSbTqBsBAGXJZc2iuE4G
         FxxaIyCr9GydmSJpI3ubbN6iGuJo+j4GUHY/eB7VTfXizkweBpQu1NTolb6OMNzYOymi
         UFjP5XpqiZvOnLF45/ZFEazP+u+JNMmHu46CCVfGoUSdrYOy2Pdonk5VJ9koFf3WGPlE
         TVRO++2uj4hldK9Nlpfxq1LS5E2TggBuQh5ZY/6Oz6pLxO/HPpafYdaRnh2skftUwJfc
         FUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9ygw7WIDZJrA8UQDfE5udyUyyNV78KT9W3tjyhghz9k=;
        fh=ZWaYY9XDS4Xr14WYP0ZXX4UR3nzOuFLxxNk2LoTHSZI=;
        b=XD4YCFYzD+YDMJ7L6ly16zZPC1Uvm9k6DiHsBmoSU4ZVhlLFCtGLEXrHvOvgn/7axG
         HkaGprTfxTnHkMZX9AIlYpKpr+wvy14jh2K3W7Yd1bj+G/fkWBSgSXfdQd5lbxL6KEBj
         cB+oGGaLVceOybNaz5KP4eMX2j+8V8O0ogygNgzgpe6ETaffhoSzWVrsQKsfTDJqval9
         YHuUu8zBPGs+QEjj2ILlmxd5bXXTIQgDfZSrq1IHeBSE6IiZ2zkXd3zN//trhgLlLJ1u
         MKxK58V9Jbuz/UUckFbt4wHuNCkD6uQfGvjr7Tug+rtiemHPdFel8OkWDwftRCO1AaM3
         axvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P3YmA6Ls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c5f1690asi76349991cf.379.2025.02.16.19.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2025 19:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P3YmA6Ls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjs9A-0000EP-J6; Sun, 16 Feb 2025 22:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tjs97-00005e-G6
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 22:50:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tjs95-0006IY-2V
 for qemu-arm@nongnu.org; Sun, 16 Feb 2025 22:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739764207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ygw7WIDZJrA8UQDfE5udyUyyNV78KT9W3tjyhghz9k=;
 b=P3YmA6LsnM0C4EQVDDPwLe/zWWtYbo8idlh1LUOopNAOnoqOumqN1xbG3W9MMRn3p7qU9y
 2/FvOV2rQst9u+o4NxJQfuySK3ZMP7gGXJwA/U5XAExTtzSe6LnFv60CX/WRqc8TEZMeeK
 1gbZ4Z6fws++H6KfUqZK4j9p3s8Sa3Y=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-CSGvpW-nOLuB1VjerMBfFg-1; Sun, 16 Feb 2025 22:50:02 -0500
X-MC-Unique: CSGvpW-nOLuB1VjerMBfFg-1
X-Mimecast-MFC-AGG-ID: CSGvpW-nOLuB1VjerMBfFg_1739764201
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-220caea15ccso139319155ad.2
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2025 19:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739764201; x=1740369001;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ygw7WIDZJrA8UQDfE5udyUyyNV78KT9W3tjyhghz9k=;
 b=p+1bBVNx/W+Qscfci+CkwCwqeK8JiVrQHPi5YRJpDGKjZsnAXtcO7go8n/xrHVG9a5
 IQBm94+mghg+JLYTE+qUM9lb88MDBzaP63icYvMxnm8hpFwymj9IgqHOeWWA5JPNxFZT
 RL7TIFvOSHSzyz85AoAtf9L5PSl1DotnfI8jgEibPCC1OU7WmJakXLD3m/gqm6Dh/YY8
 z0OV/GOPeITBu0Gu4mznk6Y6YgH70s7eKV8qcWEOKSkX0mSC2E24IAsQz2oa8Y8NBF/j
 HPcds4YI94nEVRqkZcLEjvgRLILN6zRQsnvsHS2XaSmd+YrVMouMvzWRcaOOdA+/GCqJ
 4F6w==
X-Gm-Message-State: AOJu0YzfDGlOLjtpIgGUWVOpPXX+Ot6yBaXONV9RfYhR8rASpcErBtmr
 g93vn5OC0dxjQGIanvNnh53tzVgkkGgkSIv8RN4vzv4K3Z9m71BIy+g4m2Yj2VzHM2WHD2qHSZS
 bJYR2ARXKE0xDcrFtYLRTThD1+ycokPzTYZ37ZtfjG93svf7CCA==
X-Gm-Gg: ASbGncs0lj7WuEMi/iKa305ek/11hUxuH0uu1AzVdEP1kpGYLsmqdlEOBVMgJaCJHDh
 zYE4r9lTqX/UtLLd8s/mhZfuqSYFR/tQTKJs/4HNE1Iw8FeHHWNgsUShW7uLxs08Tq1VFBw4YEV
 wFzzumw509ujiN42HejhLyLq/x/c+ZQ3K5QFVfQP80PdXT+Zk9VMW+VJ0YYlVBMXLiz7f5+il61
 kTCajZcJBdW/4wpHKIxU3CntRbisdxumfqyYt1RtXxpw3RzB6BcP0qwndFuyeah1tf2hURAMcjx
 B0rWtw==
X-Received: by 2002:a17:903:27ce:b0:21f:89e5:2712 with SMTP id
 d9443c01a7336-221040ab970mr94464745ad.39.1739764201030; 
 Sun, 16 Feb 2025 19:50:01 -0800 (PST)
X-Received: by 2002:a17:903:27ce:b0:21f:89e5:2712 with SMTP id
 d9443c01a7336-221040ab970mr94464555ad.39.1739764200686; 
 Sun, 16 Feb 2025 19:50:00 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb57d542f1sm6505740a12.2.2025.02.16.19.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 19:50:00 -0800 (PST)
Message-ID: <e0250e0d-2af8-4b2a-adfb-3f5a01e0f03c@redhat.com>
Date: Mon, 17 Feb 2025 13:49:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: Improvement on memory error handling
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
 peter.maydell@linaro.org, pbonzini@redhat.com, shan.gavin@gmail.com
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214101158.00004f69@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250214101158.00004f69@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HMwQqPdXKqqCaTQyYaloXhNbgZgQTdak4ZNqc0hznvY_1739764201
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
X-TUID: VCwvl9/C9C65

On 2/14/25 8:12 PM, Jonathan Cameron wrote:
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
> Hi Gavin,
> 
> If the ultimate aim is to support multiple memory errors why not
> just do that?  Been a while since I look at how that works, but
> the spec definitely allows it.  I think by just queuing up the errors
> and updating the Error Status Address as each one is handled.
> I think that's what GHESv2 ack is all about as it prevents the
> RAS firmware updating the error record until it is acknowledged
> at which point the RAS firmware can report the next one.
> 
> Or... Given the usecase above of a 64KiB host page and 4KiB guest
> can we inject a single error record with multiple CPER entries and
> just handle it all in one go?
> 
> Set the Error record header -> section count to 16 and provide
> 16 Memory Error Sections or equivalent.
> 
> Doesn't help with multiple errors in unrelated memory addresses but
> maybe removes one problem case.
> 
> I've not checked all the information makes it to the right places
> however or that we don't end up with a deadlock when multiple vCPU
> involved.
> 
> If doing the more significant surgery this would involve, I'd
> love to see Mauro's series land first as it cleans up a lot of
> how HEST is handled etc.
> 

Jonathan, thanks for review and comments. It's just an example that a problematic
64k host page can affect 16 4k guest pages. The errors aren't raised at the same
time because the SIGBUS signal is received by QEMU when the corresponding 4k guest
page is accessed. If all those errors are queued up and delivered at once, the
problem is when all those queued errors are delivered?

Besides, the problematic 64k host page affecting 16 4k guest page is an example.
when host/guest has same page size (e.g. 4KB), it's possible that two problematic
pages are detected by SIGBUS signals. It's also possible that one CPER error
is being delivered, but not acknowledged. A followup CPER error is raised to be
delivered. In this case, abort() is triggered either. So the problem isn't specific
64k host page size + 4k guest page size.

Thanks,
Gavin

