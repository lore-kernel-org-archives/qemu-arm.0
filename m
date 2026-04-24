Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373DFFB44C6
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 07:39:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGB7r-0007uG-Jw; Fri, 24 Apr 2026 03:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGB7j-0007rV-Lb
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:38:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wGB7h-0001DH-N0
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 03:38:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43eada6d900so7318626f8f.0
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 00:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777016328; cv=none;
 d=google.com; s=arc-20240605;
 b=CEdyDkbzDpXy9WL+tWiDGpuDBDSokPvj/KfLeCSk2hZ4SNqu8elnM3ZzquUhMm5uW9
 kY9QeFGiTfcnUtY9t1fLOiyCFU/rePqBqml8rp4uW63T8+XFwRMNCypBKE6P2twCUU5W
 TF/7yIu+KvR4NWiSEaIq9MCxyHupmamIZltAXbQ5lWYqqxTcTsRFC4e91/yUZ/u3OKcv
 C6TFpMZQvYDeNqm6lQ1/F83l48UZDc/1n1LzAx764hBP01bdoo/OIaISmRINUTUSGuLw
 CwZIPcTK3zBlpXvNcOJdD3dmjRBT/+gToRDRGwyeX0ZhqfvgNcjvefPyHF+wGtYD9Viw
 ru4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=iebPuHhRXL5sCcfhAsGqYCy/XZgrJIHTP+kOuVyYBzc=;
 fh=qYztU9EkbLZx8WU84b5dPKywMXtV+u/JHDr6sNE1lqU=;
 b=AO8fcUnlQ+4RDKowYtgSdnENTXFEgd6GOc+LjI6bVMqRp5MasCidyr2bWE4AMBqQPM
 EVk9l+0YGtgjo9aEk7uX5hbuQ9nJ+cpq6XuOCID8VwOoRFvo1YvtjjXfoTwve0aAGjb3
 +HWjuBwJ6zBNAojq4WOPuAtU3POlJir+eCcuEJJkCQb1m75MBMCcGb6B+ZKfbdwfUgck
 2vcFXJcCmkSyZm6k357bTI4fI2mWES1tmMgBiHGfVnDm55wcReUUkY8iWcvaAgmVAUY3
 psJiREgv9/Ph+66HCqqq/5Gy/eigjTsps99FYSytkUqL4lS2cOUTYMee2VvKyONZO5KY
 3LoQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777016328; x=1777621128; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iebPuHhRXL5sCcfhAsGqYCy/XZgrJIHTP+kOuVyYBzc=;
 b=DG/Jsp46GUN4EsPu3RpXZhDsfkLqGp5VLW9lKJwCy7LQoMrBVv08zI3MAWWzVbFUt1
 X9QKcUl6In3Htgy7ZM4b19kWMjymDPv93KqvRvVQ8Yaorf69vnmPxccLG9olWkbxR+yS
 72xA+kJ8+cICiGk/zBnfyRY8WpEjCjQMOdFKWv+8tmW7v/EQBh1+EFFljG/HKTeJAMwT
 sEzKD0EpUOEJYC/suxlJg2DEruEXCqcuJ/IxNS8pU7cmVaTghLM1CEZfdBssu0TGLJ5C
 soTCj+NdSm9qkyAHn408thOGgNvX4FNqJIb6Eq5Sq0nbwPydH2ABPmDka3m8/fpa5pVW
 xvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777016328; x=1777621128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iebPuHhRXL5sCcfhAsGqYCy/XZgrJIHTP+kOuVyYBzc=;
 b=QkR/dbHab77w2tkyoAz3Au/fgC5Ec4V3Sj3qCR2h+pliNO0k39Qb10u3prAHtICqn3
 SG7ohCgIW3cgDqeCusOFaR3Rkd1mpR28neNc9PGI7jR0VFbcm/NfUMKM3iK3ngXWRNnX
 XazdEuIPeEnpaBfFEYhca862qWnSK8iV3gmCxmZ7Bv7A63vdVs9/zEGVLYiEhpO9E0b0
 RvB8saA/GqadDvBPLY4d5kzKXurN2N2CLhnpG1RanBXRMmtJrZ8U33zXnfQAi3oGKWwh
 gQJovNCGj7k/IEPDwN4pa/vliBLFvtkQ96gnkvEkUpg7Ib4e5R1vFPr6Q4uc+4L587Dj
 MuCg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/LhlMvMj+NucFSY+i2zlcQG8/gIOgEdXr/yf3dMArtKE+yQrriEdnYjuL281KCsbtoMsuOnOOCtg==@nongnu.org
X-Gm-Message-State: AOJu0Yx0EBxyCU7uPpMGTShxyXL4NuXsaIUGL0Fk+OHH1+0lPzkdCjWq
 TsgG4+GOEeTN6PjxIRictetAdxMKa4a5VUgyhXbeK6CrTs4/tfjWl34vKt9m6dlQdpP+jK0G3ov
 3CEGP/8IMz5ml6KJ+m3Oz2mtWTclfpm5wLLeeaDtR6g==
X-Gm-Gg: AeBDievO8XMoX/o3jQzcnxi04CkTfwhQjG0yuvd24hbZ7tVIC4jNEiD1oV8CnRbok9t
 bzZ28H4/XPb83N1AoslDTDvFf9FVLYSN1mxKCGwqB0oRHcL5JPNi67LJnEaTeiSJlC+YM17vRUQ
 faA8vumxZp7/mhGWzCqU0x82/nB6Bx0mjCYUveZvRfA03P6zbEFlEhAOejb/cOQ/dNVJMsaBx/+
 ZrSOYpEJO9jJZ3eNNqxPgAiPCkUyq0ew5ezYCxv+/g5rahWnAM6WKfj63vZ6HWzUmuRSeYvStA8
 qehKs3h9hluNhMDlEAEk39ptx/Mj7l3pfhW8VFJQfAR4uepXhXutDr3qac9W
X-Received: by 2002:a05:6000:1acf:b0:43d:7946:bae6 with SMTP id
 ffacd0b85a97d-43fe3e236c2mr46481284f8f.43.1777016327594; Fri, 24 Apr 2026
 00:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260317174845.31768-1-lucaaamaral@gmail.com>
In-Reply-To: <20260317174845.31768-1-lucaaamaral@gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 24 Apr 2026 10:38:21 +0300
X-Gm-Features: AQROBzDKzobipnk_P47dSYupdE1fi9miSCt-6llUWbdYTtPgrSLQVyM_Yh0U9bA
Message-ID: <CAAjaMXa4yye0PQVGXN7SMgHeYC2kuYChJ_ZCnfepExMFGqfH1A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 peter.maydell@linaro.org, mohamed@unpredictable.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Mar 17, 2026 at 7:50=E2=80=AFPM Lucas Amaral <lucaaamaral@gmail.com=
> wrote:
>
> Fix a bug in the MAP_FIXED blob mapping path (introduced by 4eb0aace)
> where non-host-page-aligned offsets cause mmap(MAP_FIXED) to fail with
> EINVAL.  This affects any host where the page size exceeds the guest's
> (ARM64 with 16KB/64KB pages, macOS ARM64).

FYI VIRTIO 1.4 has a VIRTIO_GPU_F_BLOB_ALIGNMENT feature that allows
the device to expose the necessary host alignment in a configuration
space.

>
> This series introduces:
>
> 1. MAP_FIXED alignment validation in virtio-gpu: check that both
>    offset and blob size are aligned to the host page size before
>    calling virgl_renderer_resource_map_fixed().  When not aligned,
>    fall through to the subregion method (which works at any
>    alignment).
>
> 2. A map granule abstraction (hvf_set/get_map_granule) replacing
>    hardcoded qemu_real_host_page_size() calls in HVF memory mapping.
>    Non-aligned regions return early instead of proceeding with
>    add=3Dfalse (which attempted an unnecessary unmap).
>    An 'ipa-granule' property (auto, 4k, 16k) on the HVF accelerator
>    object allows opt-in configuration:
>
>      -accel hvf,ipa-granule=3D4k
>
>    The property follows the kvm_arch_accel_class_init() pattern:
>    ARM registers the property in hvf_arch_accel_class_init(), x86
>    provides an empty stub.
>
> 3. macOS 26 IPA granule support via hv_vm_config_set_ipa_granule(),
>    reading the ipa-granule property to select HV_IPA_GRANULE_4KB or
>    HV_IPA_GRANULE_16KB.  Falls back with a warning on macOS < 26.
>
> Dependencies: none.
>
> Changes v3 -> v4:
>   - Rebased onto current master (no code changes)
>   - Resent as new top-level thread per Alex Benn=C3=A9e's feedback
>
> Changes v2 -> v3:
>   - Rebased on current master
>   - Add MAP_FIXED alignment validation (new patch 1)
>   - Move #ifdef __aarch64__ property code into hvf_arch_accel_class_init
>     following kvm_arch_accel_class_init() pattern (x86 empty stub)
>   - Use MAC_OS_VERSION_26_0 named constant
>   - Remove Venus blob mapping warning
>
> Changes v1 -> v2 (Mohamed Mosaad review):
>   - Replace hardcoded 4KB with configurable ipa-granule property
>     (auto, 4k, 16k) on the HVF accelerator object.
>   - 'auto' defaults to host page size; explicit values opt in.
>   - Add fallback warning when macOS < 26 can't honor the request.
>   - Add Venus blob mapping safety warning.
>   - Use KiB constants instead of magic numbers.
>
> Lucas Amaral (3):
>   virtio-gpu: validate host page alignment for MAP_FIXED blobs
>   accel/hvf: introduce map granule abstraction and IPA property
>   target/arm/hvf: configure IPA granule on macOS 26
>
>  accel/hvf/hvf-all.c           | 30 +++++++++++++--
>  hw/display/virtio-gpu-virgl.c | 45 +++++++++++++---------
>  include/system/hvf.h          | 15 ++++++++
>  include/system/hvf_int.h      |  2 +
>  target/arm/hvf/hvf.c          | 72 +++++++++++++++++++++++++++++++++++
>  target/i386/hvf/hvf.c         |  4 ++
>  6 files changed, 147 insertions(+), 21 deletions(-)
>
> --
> 2.52.0
>
>

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

