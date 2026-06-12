Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B34CD98CE
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 15:30:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wY3pF-0003Yc-2F; Fri, 12 Jun 2026 11:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wY3pD-0003YL-V1
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 11:29:39 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wY3pC-0007LK-9B
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 11:29:39 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c86559a08fcso406184a12.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781278176; x=1781882976; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xSPDG2Gv8G0uKlSMK8i5QtDw48PlCxK1P5Vtx4fk0Kc=;
 b=riMXxfIuMEsbSnYJECtJFMb0C+l0xHC4CUen/ysnwR6b710E914K+Jp66lXOuRnNRc
 1R/SyZoIeWanDMi+uwuR16YKDrqDVLW0wr6VRFL6Esa2zy5+uwaR2AO3iVxo3LqfrjK3
 jUfa7Hyjs5atcJZDGs7NaHXMfgpUB4WCKb+y+4uypAmdZCnWcb0xcPyi2aM00txplbJa
 C/zWtE4MiPhExi35yfBVBkxclnTZ6fyn8n6rd26bYvA/1lvmqOHqKaSCpmABdEfvZ8jq
 SeW9i4hV0AFC6zQaYyqojADGg8v32saJXt1w7xIrW5IyS+BmQEPpeEbXgnBv4hxawIio
 byLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781278176; x=1781882976;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSPDG2Gv8G0uKlSMK8i5QtDw48PlCxK1P5Vtx4fk0Kc=;
 b=Z7so8BhYjUfyF9QtmIqVnjLGt7b5gM5L74hp+NVD0h56uiCHV0JmiBN1jb2RF4YuJr
 Nr+xdCFYxQve5AzYbMKoiHAvI9qV02M3nXNUZDKnLQnAI+SUJ1wn1goTFClxR+5sUirL
 o0crtjTonM5IKHEG5I6wVdl+FUw0/9QDA2Lza2HGkjYiwHa0nzxrRurCOW5O+PZ7oWlE
 n/PMS1qp1eJVEngIHdKY06NcNknh9pguvKk0MQaDglFCjjym5hhQ3VV9oNjQEKGTHl0R
 pHpkz8c+ocD9ToPhbZUhF+GzBdWpxxpKy/WCLYGGQBz6L+JasERfiCL6C4pq+uGA9cF0
 V+bA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/r8bJGfYIoMYAryRlYZN1yx5zvipdbUPN0RBACCR3tW0/XkWQVZKumj7KdBbi7R17PMxehbGz7mw==@nongnu.org
X-Gm-Message-State: AOJu0YwgMX10jpot4OUwH72m4Uy5fDLVsDhOKe0yJXbafX8bTsxZ6SdW
 v6VTLWJMxTWg+6PYNhIgkCjK/Nl9Bb7kp7o6dPIc2oBkHWtZtTkwNFNzQ0NsFGRqk1w=
X-Gm-Gg: Acq92OGIOOOpxRdKHk3uwl/twB2/SJJsHtSf/phPv/yq0gY5c+5tRG0iyKezcAax2fI
 7ZPvKSQxEaZMbL8MTFx3dXqgSibSw1wwqqsroPeAwJ3lP6IhM2Am4ed0jMLJ9g9zer2px+tnUVW
 4LGcJ19f2kVFqv3o32YUSPKVGdrmOa/2Z9+Ot0OwzWQlul9JkUhpyPCeMef1YWE405M9ciQJEt/
 1ox0RVw4ChpHhZXXn892CEALm7o09Yb357xTYEdCEFEsNMsG1ZaBnMKb17fQG5R/LtSrVC8PMG8
 6dRK2ckULl1Cyod8ALyZZZilcGsJnka2r7IT2YErReYMoxkf3KgKCEke+OtELzlhXXx6auHRGoZ
 QlcGTAX3n1lZAKwfPs6YNu2dde8tdkW4FauILIYExcD9D5omqzHh08KqRENXsFWh4JLcgnEmgJH
 bIM8IilTD6mdgjSJslR3C5s8gSyZjpYQ94nQ7IufdiEEdBJmQ=
X-Received: by 2002:a05:6a21:6190:b0:3b4:81b4:9b79 with SMTP id
 adf61e73a8af0-3b79642264bmr46318637.40.1781278176428; 
 Fri, 12 Jun 2026 08:29:36 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434b020b53sm2591115b3a.47.2026.06.12.08.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 08:29:35 -0700 (PDT)
Message-ID: <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
Date: Fri, 12 Jun 2026 08:29:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com,
 peter.maydell@linaro.org, berrange@redhat.com, david@kernel.org,
 alex@shazbot.org, clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com,
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260612110307.1264798-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/12/26 04:03, Gavin Shan wrote:
> All ram device regions was turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to guest hang on compiling 'cuda-samples' as reported by Julia. The guest
> is started by the following command lines, with a GH100 GPU card.
> 
>     host$ lspci | grep GH100
>     0009:01:00.0 3D controller: NVIDIA Corporation GH100 [GH200 120GB / 480GB] (rev a1)
>     host$ /home/sandbox/gavin/qemu.main/build/qemu-system-aarch64            \
>           -machine virt,gic-version=host,ras=on,highmem-mmio-size=4T         \
>           -accel kvm -cpu host -smp cpus=48 -m size=8G                       \
>           -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=d0    \
>           -device virtio-blk-pci,id=vb0,bus=pcie.0,drive=d0,num-queues=4     \
>           -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.1.0
>             :
>     guest$ cd cuda-samples/build
>     guest$ make -j 20 clean
>     guest$ make -j 20
>             :
>     [ 54%] Linking CUDA executable graphMemoryNodes
>     [ 54%] Built target graphMemoryNodes
>     <no more output afterwards, guest becomes frozen here>
> 
>     guest$ qemu-system-aarch64: virtio: bogus descriptor or out of resources
>     [  555.814025] virtio_blk virtio0: [vda] new size: 268435456 512-byte logical blocks (137 GB/128 GiB)
> 
> When the GPU's driver (NVidia open driver) is loaded on guest bootup,
> the memory blocks residing in the PCI BAR#4 can be presented to the
> guest through memory hot-add. The page cache can be allocated from the
> hot added memory blocks when cuda-samples is being compiled. Afterwards,
> the page cache is sent to QEMU's virtio-blk device as part of the DMA
> request, the bounce buffer has to be used to accomodate the request as
> the corresponding memory region (MemoryRegion) is a RAM DEVICE region
> and indirectly accessible in qemu. However, the max bounce bufer size
> is only 4096 bytes by default. We're running out of that space quickly.
> 
>    QEMU
>    ====
>    virtio_blk_handle_output
>      virtio_blk_handle_vq
>        virtio_blk_get_request
>          virtqueue_pop
>            virtqueue_split_pop
>              virtqueue_map_desc
>                address_space_map
>                  memory_access_is_direct         # Return false
>                    memory_region_supports_direct_access
> 
>    (qemu) info mtree
>    memory-region: pci_bridge_pci
>      0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>        0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4
>          0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4
>            0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0]
> 
> This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> accessors to ram device memory region, preparatory work to make ram device
> region directly accessible and bypass the bounce buffer in the DMA path
> in next patch.

memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later 
decides whether or not to expand inline.

So, this doesn't do what you think it does.
My real question is: what are you attempting to achieve?

(1) is the problem unaligned access to a mapped physical device?
(2) is the problem vector access to a mapped physical device?
(3) something else?


r~

