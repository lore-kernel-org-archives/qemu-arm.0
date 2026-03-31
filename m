Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F032B1061B2C
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 02:47:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7P8O-0003Ay-Nt; Mon, 30 Mar 2026 22:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w7P8M-0003AQ-MD
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 22:47:14 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w7P8I-0001Pi-Om
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 22:47:14 -0400
Received: by mail-ua1-x941.google.com with SMTP id
 a1e0cc1a2514c-950bcf4df06so1519523241.2
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 19:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774925229; x=1775530029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9aS435epwemZYToiZqPPar5fabH5RaXniE9j7I/LX4=;
 b=y8q5Tav24Y/k4b0W8ueH5IKxJ2v50OGocs6O7f7hAwwZo0lw1HOVLyOZ+ytNWYXcov
 of57Z1fWgGpcgW1f7aA8jXNz92HHb1TT7dOju8XUWzKlRfxT+4apGJiEfxf6iV+MRGyQ
 BLMD/1BGYUjBpYxXQJYVSNNyqEJ2g2CCnjXr6IKq7IOEa+o7+Ly/zitE68rhENuORn75
 vPbQtWMTSfwIHiFJtzfynJlgBgYWdEussAs5/EsiSNyi1ify+waENGTCDIQrxVnE7W8c
 J+ZSbKMronfPD3Uvbt8HS1BZ5Z87U2+b/vrrJEGD2z1/Md43rmDbLNLM8O30LOF4yYyS
 AJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774925229; x=1775530029;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9aS435epwemZYToiZqPPar5fabH5RaXniE9j7I/LX4=;
 b=Kpu3X+g3cRzqp0eZm40+5+kQQ4cl1FTYEbhmMLT+BWjXAlI9yjnr2uz26Aa292z15N
 3B29hHJO970+pfveAv6WNf685Wb1PLbuKu/j9I2URVA7wHtlD/BzO9dlhVgazTBtwGk7
 xN/ahWg4H1Dx58LJJp9HJQdx3EV4pNCRZMi3wMZ791gE6hLY++V33A4VdWMjpfjKqY8R
 KhGuKR4HHfKx3t/MyKf731xzlPGaOGDu8yz2xiqQpIyTpH6Kk1vKPJnn4dJsRflarvQv
 JUbAg3S3xNwYPI77YxsGLk3s2nfT4QeKCmF8bbQJx42I0cT3uJdwGhuDJpbwD0BXsweT
 A5xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxs8TvHObv3fEVNUifnbfyg6AZZG/pzgLagV6PsMfapUJhUOe3rzMHE9hnhwYe4GWENpqMIAWyRA==@nongnu.org
X-Gm-Message-State: AOJu0Yzu+GvrTAsvOtICP2P5bALulpwA0oeVb99o8Lhv9ApC7YDgLMeT
 NPHJ3Vca98SGRr/5FTDesNL0dugfb3rxrz/yM0YFfOYfVmS0BBoHt6D0lFxqXfgPFc8=
X-Gm-Gg: ATEYQzy3NMf5d0BFZH4TqGfgzaWajZKHm+4iKaqy0LElTG1Gbqr0YSnmGur5XqoJEcE
 2d2t2a3J79yAS6oyo29GOV96oKPwtbCWggRBHaHifCDo7ObQuA95hIifn3+wyo6XNzPlHnMThBs
 9jc29wdF5fVYSwT683vMw0tqkGnjT0oAngYdsZk+iyGLj9BSPwNgW8KVqub/WeSqGZ+vuTe/zRG
 leI3kgpLxKsYQ6TSkOv6bN3folbaJvCkX3MuYIe36kO1ClHGXOe/thPH3FlBpQmW6XP3tBa0QV/
 fpAP+czCa/CGz9TzzG41lvjHuewePjdBHviJAFV2YOkMBFNpidgFQtaw9cDU9IiSvZkixTUfQSJ
 jXHYLTQ9m+0eT6itNmTdm5pI6wxBOvZXbqXaO/eVhe9zR3AQqsxFblDwLZCB2RNHqorid8QssqV
 rXFdZspMYxKRbP38m0qr4cOnZtM7moR2P4KBKswDtfuXAi3A==
X-Received: by 2002:a05:6102:160c:b0:602:86a6:986a with SMTP id
 ada2fe7eead31-604f92f1d79mr5175844137.27.1774925229120; 
 Mon, 30 Mar 2026 19:47:09 -0700 (PDT)
Received: from [192.168.0.104] ([186.215.53.158])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-60512a1dc2asm10554516137.4.2026.03.30.19.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 19:47:08 -0700 (PDT)
Message-ID: <23634eb9-95a9-494e-92c8-60615213f349@linaro.org>
Date: Mon, 30 Mar 2026 23:47:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/8] Specifying cache topology on ARM
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com,
 mst@redhat.com
References: <20260311160609.358-1-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260311160609.358-1-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::941;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ua1-x941.google.com
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

Hi,

On 3/11/26 13:06, Alireza Sanaee wrote:
> Specifying the cache layout in virtual machines is useful for applications and
> operating systems to fetch accurate information about the cache structure and
> make appropriate adjustments. Enforcing correct sharing information can lead to
> better optimizations. Patches that allow for an interface to express caches was
> landed in the prior cycles. This patchset uses the interface as a foundation.
> Thus, the device tree and ACPI/PPTT table, and device tree are populated based
> on user-provided information and CPU topology.
> 
> Example:
> 
> +----------------+                         +----------------+
> |    Socket 0    |                         |    Socket 1    |
> |    (L3 Cache)  |                         |    (L3 Cache)  |
> +--------+-------+                         +--------+-------+
>           |                                          |
> +--------+--------+                        +--------+--------+
> |   Cluster 0     |                        |   Cluster 0     |
> |   (L2 Cache)    |                        |   (L2 Cache)    |
> +--------+--------+                        +--------+--------+
>           |                                          |
> +--------+--------+  +--------+--------+   +--------+--------+  +--------+----+
> |   Core 0         | |   Core 1        |   |   Core 0        |  |   Core 1    |
> |   (L1i, L1d)     | |   (L1i, L1d)    |   |   (L1i, L1d)    |  |   (L1i, L1d)|
> +--------+--------+  +--------+--------+   +--------+--------+  +--------+----+
>           |                    |                     |                    |
> +--------+              +--------+             +--------+           +--------+
> |Thread 0|              |Thread 1|             |Thread 1|           |Thread 0|
> +--------+              +--------+             +--------+           +--------+
> |Thread 1|              |Thread 0|             |Thread 0|           |Thread 1|
> +--------+              +--------+             +--------+           +--------+
> 
> 
> The following command will represent the system relying on **ACPI PPTT tables**.
> 
> ./qemu-system-aarch64 \
>   -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluster,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
>   -cpu max \
>   -m 2048 \
>   -smp sockets=2,clusters=1,cores=2,threads=2 \
>   -kernel ./Image.gz \
>   -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
>   -initrd rootfs.cpio.gz \
>   -bios ./edk2-aarch64-code.fd \
>   -nographic
> 
> The following command will represent the system relying on **the device tree**.
> 
> ./qemu-system-aarch64 \
>   -machine virt,acpi=off,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluster,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
>   -cpu max \
>   -m 2048 \
>   -smp sockets=2,clusters=1,cores=2,threads=2 \
>   -kernel ./Image.gz \
>   -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=off" \
>   -initrd rootfs.cpio.gz \
>   -nographic
> 
> Failure cases:
> 	1) There are scenarios where caches exist in systems' registers but left
> unspecified by users. In this case qemu returns failure.
> 
> 	2) SMT threads cannot share caches which is not very common. More
> discussions here [1].
> 
> Currently only three levels of caches are supported to be specified from the
> command line. However, increasing the value does not require significant
> changes. Further, this patch assumes l2 and l3 unified caches and does not
> allow l(2/3)(i/d). The level terminology is thread/core/cluster/socket.
> Hierarchy assumed in this patch: Socket level = Cluster level + 1 = Core level
> + 2 = Thread level + 3;
> 
> Possible future enhancements:
>    1) Separated data and instruction cache at L2 and L3.
>    2) Additional cache controls.  e.g. size of L3 may not want to just match the
> underlying system, because only some of the associated host CPUs may be bound
> to this VM.
> 
> [1] https://lore.kernel.org/devicetree-spec/20250203120527.3534-1-alireza.sanaee@huawei.com/
> 
> Change Log:
>    v18->v19:
>      * Rebased to 1fd5ff9d76d23ab23a68419cbc76d5ee33e8b455.
>      * Addressed Gustavo's comments. Thanks for the review.
>      * v18: https://lore.kernel.org/qemu-devel/20260220141128.789-1-alireza.sanaee@huawei.com/
> 
>    v17->v18:
>      * Rebased to 07f97d5da04a9f97e273de85c76f5017d8135a6e.
>      * Addressed Mst's comments regarding documenting build_cache_node function. Thanks for the review.
>      * v17: https://lore.kernel.org/all/20260106155828.643-1-alireza.sanaee@huawei.com/
>    v16->v17:
>      * Rebased to 0fc482b73d8e085d1375b4e17b0647fd2e6fe8f0.
>      * Addressed Gustavo's comments. Thanks for the review.
>      * v16: https://lore.kernel.org/all/20250827142152.206-1-alireza.sanaee@huawei.com/
> 
>    v15->v16:
>      * Rebase to e771ba98de25c9f43959f79fc7099cf7fbba44cce.
>      * v15: https://lore.kernel.org/qemu-devel/20250812122829.204-1-alireza.sanaee@huawei.com/
> 
>    v14->v15:
>     * Introduced a separate patch for loongarch64 build_pptt function.
>     * Made sure loongarch64 tests pass.
>     * Downgraded to V2 for ACPI PPTT. Removed PPTT IDs as was not necessary.
>     * Removed dependency as it's been merged in the recent cycle.
>       -- 20250604115233.1234-1-alireza.sanaee@huawei.com
>     * Fixed styling issues and removed irrelevant changes.
>     * Moved cache headers to core/cpu.h to be used in both acpi and virt.
>     * v14: https://lore.kernel.org/qemu-devel/20250707121908.155-1-alireza.sanaee@huawei.com/
>     # Thanks to Jonathan and Zhao for their comments.
> 
>    v13->v14:
>     * Rebased on latest staging.
>     * Made some naming changes to machine-smp.c, addd docs added to the
>          same file.
> 
>    v12->v13:
>     * Applied comments from Zhao.
>     * Introduced a new patch for machine specific cache topology functions.
>     * Base: bc98ffdc7577e55ab8373c579c28fe24d600c40f.
> 
>    v11->v12:
>     * Patch #4 couldn't not merge properly as the main file diverged. Now it is fixed (hopefully).
>     * Loonarch build_pptt function updated.
>     * Rebased on 09be8a511a2e278b45729d7b065d30c68dd699d0.
> 
>    v10->v11:
>     * Fix some coding style issues.
>     * Rename some variables.
> 
>    v9->v10:
>     * PPTT rev down to 2.
> 
>    v8->v9:
>     * rebase to 10
>     * Fixed a bug in device-tree generation related to a scenario when
>          caches are shared at core in higher levels than 1.
>    v7->v8:
>     * rebase: Merge tag 'pull-nbd-2024-08-26' of https://repo.or.cz/qemu/ericb into staging
>     * I mis-included a file in patch #4 and I removed it in this one.
> 
>    v6->v7:
>     * Intel stuff got pulled up, so rebase.
>     * added some discussions on device tree.
> 
>    v5->v6:
>     * Minor bug fix.
>     * rebase based on new Intel patchset.
>       - https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/
> 
>    v4->v5:
>      * Added Reviewed-by tags.
>      * Applied some comments.
> 
>    v3->v4:
>      * Device tree added.
> 
> Alireza Sanaee (8):
>    target/arm/tcg: increase cache level for cpu=max
>    hw/core/machine: topology functions capabilities added
>    hw/arm/virt: add cache hierarchy to device tree
>    bios-tables-test: prepare to change ARM ACPI virt PPTT
>    acpi: Add parameters to pass cache descriptions to ACPI build_pptt()
>    hw/acpi: add cache hierarchy to pptt table
>    tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
>    Update the ACPI tables based on new aml-build.c
> 
>   hw/acpi/aml-build.c                        | 203 ++++++++++++-
>   hw/arm/virt-acpi-build.c                   |   8 +-
>   hw/arm/virt.c                              | 335 ++++++++++++++++++++-
>   hw/core/machine-smp.c                      |  52 ++++
>   hw/loongarch/virt-acpi-build.c             |   4 +-
>   include/hw/acpi/aml-build.h                |   4 +-
>   include/hw/acpi/cpu.h                      |  10 +
>   include/hw/arm/virt.h                      |  17 +-
>   include/hw/core/boards.h                   |   5 +
>   include/hw/core/cpu.h                      |  12 +
>   target/arm/tcg/cpu64.c                     |  10 +
>   tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 516 bytes
>   tests/qtest/bios-tables-test.c             |   4 +
>   13 files changed, 649 insertions(+), 15 deletions(-)
> 
> 
> base-commit: 1fd5ff9d76d23ab23a68419cbc76d5ee33e8b455

Alireza, thanks for addressing my last comments in v18.

Peter, I have no further comments on this series. All looks good to me,
so feel free to take a look and pick it up when the tree reopens.


Cheers,
Gustavo

