Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E1E9B249
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 10:23:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vupZN-000791-BS; Tue, 24 Feb 2026 05:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vupZL-00078k-Vd
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 05:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vupZK-0007Cn-8A
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 05:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771928585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyTNj0WrUG82kCnVjAgz2sgw9Aar9CWE6bbTe6ra1UY=;
 b=Jt09AdK7j6ueXdwcP7mpXjBD1sjNZru7BMR5dFot+0dAgdH+Ry8S7WHizqyw76w3RyJUHy
 jt7xqwzfE+Ajl4HEmzWDwbFvEDHCpu9dZh2KgEiNQOCJ7mYSV84zZDL4svfHvmXqZm/qms
 ov9EmY53r/ZWzNwm8sTL9FRE/UhofeM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-4Q7EbUDIMEyJemcykzc6wQ-1; Tue, 24 Feb 2026 05:22:48 -0500
X-MC-Unique: 4Q7EbUDIMEyJemcykzc6wQ-1
X-Mimecast-MFC-AGG-ID: 4Q7EbUDIMEyJemcykzc6wQ_1771928567
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4363333c102so4064115f8f.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 02:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771928566; x=1772533366;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyTNj0WrUG82kCnVjAgz2sgw9Aar9CWE6bbTe6ra1UY=;
 b=mHCy3/MzUSh1PjGZX2zHwra2SiK6lG4WP47+KP1xGef+HEx2v0wdx0oEs0gnEH6rJ/
 vt7heBUArpy1n17nU3xg/mJVCuBN+ttKT9c+IZ+dANYx6nImWpZc+P2Adnu0CcRkL7rS
 8+IcfcrkCAZS1wTtH5ggN4Zq/3R9alT+u47t+v+qmdWh1uKuSqRjBfKpmDEegsFRtKqw
 lnHH5Yq4oN4D+AerAgYvSekFmrfWilIfjSrvDXNU0P2pxhL2Cs+CyRUzp0dN0Q6QUVxY
 P4nrrygJMQvQY5pQ6r9pc4Z6yat5MNgfX37N44jQ6bF+I2ZTYsu+ASqmanUj52fSwOzx
 8Uqw==
X-Gm-Message-State: AOJu0YxTcKCqnoomNBDtUq+xxIA7kwMrhoV7+3aiR4AXtBAdMpmJvwi5
 LtqXu/kAR2wY3u2KOWHkIQOSATSO61nsBIUPQDls7ScZLWzRYogqYaPfNHSvOrMS6dGlwY9RH1r
 /xOrBHRkSdC4U9sX3lUVGXKOpPbG4y6/blMcbL4TisUmyNWleyBQsoMLhF8m7FQ==
X-Gm-Gg: ATEYQzwPz1NQm4PKhX2xFEW4mnvysgrLipTNUfrysapo2biXw/JK2Bk8wuXTymfwesh
 qJLc2h8lO08oNGanaBa0BIfdk+xaFVYLbSDIQpgL4yyeezG7WhBVT15U7IB2pkuKsgi9hA4PWkS
 OWe4n9i+Va3t43meoJLbivuHQbe94MMjED4FZeLDUue7fiSol3vVpEPGCYDEr+dD0vmdum2SFWU
 Jh6vJgxKCdwFMUeWyUFgUlMZVBUFbmRpMjdwKP4MIeLa6a3AIsBJY6o5deEkolebjXyhVWYEPJg
 4TUb3Y7cZ3pmZEv8ybGov6ZgVK8tYaNOoRVjlGLazUKap3JgLsxt/zUR6SqO/gidoRahE6mzEps
 kAhuMVxFlyKYvCyOPnxWLrcnlbPk4xpaPodg3Ij+bEQPAjbWWiCZxBPfEGW90i0jK/siHm4tJQS
 4lI4Y7WJocCK+iisb7aEL+dx5u7yg=
X-Received: by 2002:adf:e7c2:0:b0:439:89e6:9776 with SMTP id
 ffacd0b85a97d-43989e6980amr1435911f8f.25.1771928566347; 
 Tue, 24 Feb 2026 02:22:46 -0800 (PST)
X-Received: by 2002:adf:e7c2:0:b0:439:89e6:9776 with SMTP id
 ffacd0b85a97d-43989e6980amr1435866f8f.25.1771928565817; 
 Tue, 24 Feb 2026 02:22:45 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4398bb96b90sm832650f8f.9.2026.02.24.02.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:22:44 -0800 (PST)
Message-ID: <2be88699-f77b-4236-a959-bc999a3e4caf@redhat.com>
Date: Tue, 24 Feb 2026 11:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] accel: Add Nitro Enclaves accelerator
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, philmd@linaro.org,
 berrange@redhat.com, marcandre.lureau@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, mst@redhat.com,
 Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Tyler Fanelli <tfanelli@redhat.com>, mknaust@amazon.com,
 nh-open-source@amazon.com
References: <20260218015151.4052-1-graf@amazon.com>
 <20260218015151.4052-4-graf@amazon.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20260218015151.4052-4-graf@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SyMgwnrxuA54gjkolA-MYckkhr2wcJIw3mPzhcgqitc_1771928567
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/18/26 02:51, Alexander Graf wrote:
> +/*
> + * Start the Enclave. This gets called when the first vCPU 0 enters its main
> + * loop. At this point memory is set up and the EIF is loaded. This function
> + * donates memory, adds vCPUs, and starts the enclave.
> + */
> +static void nitro_do_start(NitroAccelState *s)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int nr_cpus = ms->smp.cpus;
> +    int i, ret;
> +    struct ne_enclave_start_info start_info = {
> +        .flags = s->debug_mode ? NE_ENCLAVE_DEBUG_MODE : 0,
> +        .enclave_cid = s->enclave_cid,
> +    };
> +
> +    ret = qemu_ram_foreach_block(nitro_donate_ram_block, s);
> +    if (ret < 0) {
> +        error_report("nitro: failed to donate memory");
> +        exit(1);
> +    }
> +
> +    for (i = 0; i < nr_cpus; i++) {
> +        uint32_t cpu_id = 0;
> +        if (ioctl(s->enclave_fd, NE_ADD_VCPU, &cpu_id) < 0) {
> +            error_report("nitro: NE_ADD_VCPU failed: %s", strerror(errno));
> +            exit(1);
> +        }
> +    }
> +
> +    ret = ioctl(s->enclave_fd, NE_START_ENCLAVE, &start_info);
> +    if (ret < 0) {
> +        switch (errno) {
> +        case NE_ERR_NO_MEM_REGIONS_ADDED:
> +            error_report("nitro: no memory regions added");
> +            break;
> +        case NE_ERR_NO_VCPUS_ADDED:
> +            error_report("nitro: no vCPUs added");
> +            break;
> +        case NE_ERR_ENCLAVE_MEM_MIN_SIZE:
> +            error_report("nitro: memory is below the minimum "
> +                         "required size. Try increasing -m");
> +            break;
> +        case NE_ERR_FULL_CORES_NOT_USED:
> +            error_report("nitro: requires full CPU cores. "
> +                         "Try increasing -smp to a multiple of threads "
> +                         "per core on this host (e.g. -smp 2)");
> +            break;
> +        case NE_ERR_NOT_IN_INIT_STATE:
> +            error_report("nitro: not in init state");
> +            break;
> +        case NE_ERR_INVALID_FLAG_VALUE:
> +            error_report("nitro: invalid flag value for NE_START_ENCLAVE");
> +            break;
> +        case NE_ERR_INVALID_ENCLAVE_CID:
> +            error_report("nitro: invalid enclave CID");
> +            break;
> +        default:
> +            error_report("nitro: NE_START_ENCLAVE failed: %s (errno %d)",
> +                         strerror(errno), errno);
> +            break;
> +        }
> +        exit(1);
> +    }
> +
> +    s->enclave_cid = start_info.enclave_cid;
> +    trace_nitro_enclave_started(s->enclave_cid);
> +
> +    /*
> +     * Push enclave CID to all devices that need it.
> +     * Each device handles its own connection (console, heartbeat).
> +     */
> +    {
> +        BusState *sysbus = sysbus_get_default();
> +        BusChild *kid;
> +
> +        QTAILQ_FOREACH(kid, &sysbus->children, sibling) {
> +            DeviceState *dev = kid->child;
> +            if (object_property_find(OBJECT(dev), "enclave-cid")) {
> +                object_property_set_uint(OBJECT(dev), "enclave-cid",
> +                                         s->enclave_cid, NULL);
> +            }
> +        }

I think it makes more sense to have a "nitro bus" with its own subclass 
and an enclave_started(NitroDevice *dev, int enclave_cid, Error **errp) 
method.  Properties can be set with -device and that gets either awkward 
or buggy pretty quickly.

> +    }
> +}
> +
> +/*
> + * vCPU dummy thread function. The real vCPUs run inside the enclave.
> + *
> + * Based on dummy_cpu_thread_fn() from accel/dummy-cpus.c.
> + */
> +static void *nitro_vcpu_thread_fn(void *arg)
> +{
> +    CPUState *cpu = arg;
> +    NitroAccelState *s = NITRO_ACCEL(current_accel());
> +    sigset_t waitset;
> +
> +    rcu_register_thread();
> +
> +    bql_lock();
> +    qemu_thread_get_self(cpu->thread);
> +    cpu->thread_id = qemu_get_thread_id();
> +    current_cpu = cpu;
> +
> +    sigemptyset(&waitset);
> +    sigaddset(&waitset, SIG_IPI);
> +
> +    cpu_thread_signal_created(cpu);
> +    qemu_guest_random_seed_thread_part2(cpu->random_seed);
> +
> +    /* vCPU 0 starts the enclave on first entry */
> +    if (cpu->cpu_index == 0) {
> +        nitro_do_start(s);
> +    }

Can you replace this with an async_run_on_cpu() call when vCPU 0 is 
created (in nitro_start_vcpu_thread) and just reuse dummy_cpu_thread_fn()?

Or alternatively with a machine ready notifier.

> diff --git a/accel/stubs/nitro-stub.c b/accel/stubs/nitro-stub.c
> new file mode 100644
> index 0000000000..186c8444f8
> --- /dev/null
> +++ b/accel/stubs/nitro-stub.c
> @@ -0,0 +1,11 @@
> +/*
> + * Nitro accel stubs for QEMU
> + *
> + * Copyright © 2026 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +bool nitro_allowed;

Maybe all these *_allowed variables should be in a .c file in accel/.

Paolo


