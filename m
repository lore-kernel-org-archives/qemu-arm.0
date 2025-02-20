Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp72555njk;
        Thu, 20 Feb 2025 05:47:45 -0800 (PST)
X-Received: by 2002:a05:6902:15c7:b0:e5d:ac56:c3c3 with SMTP id 3f1490d57ef6-e5e0a09228amr6470521276.14.1740059265429;
        Thu, 20 Feb 2025 05:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740059265; cv=none;
        d=google.com; s=arc-20240605;
        b=Bg0hm1TCEhCMPXAYNOx2W6+85nX9jb26bb4lcOrUFkVqbFyvXwomItVzE9JKVMoX89
         x0INeuR7iUYjUkBMSVfuBggNOx+SQYUssn3deCZqvohTFtnnyB5x3GqBEAH8PzrNHMZQ
         8H2DYrLqZmy+dKxSw8Dm5znsQEr8pCRrMz/U7D5uQP+SxSs7ly5+e3ofFAZM0ja9ITbd
         Dn0lH/gVpw/78Wx9AQ5xPMz4ldWbUkT9Gc7YyxzMmsFmPIqdbo4Xih9ube+ealcjPd5o
         AOe+6VKIuoqNMUv7SdOR74+i6/r2XKAJy6t6u4aLLS4te+8p6bkfLqUs1uxCTb4ZjRyR
         fVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MRXbKCZYAbAUSTZO6GXGqX5QlIgXZzqmfvbZFu52Bso=;
        fh=Wpa46SpZDMN78hZs0lGDVz32mDHT0NNZcNlwn+8G+j4=;
        b=XNUxOkUEeLoGWdahWZtOsKpTBw1lcm/1cpIYqsC9v8S/bW94Mi/Llf2ByVgW4nk32+
         8YVYmXmYU9erlyjk4gpOfBF2Af2bHhZOTHlF8tjbUdXoYBPF7p8Q1Y1npOa0VNK1/ie6
         6nMVW8/L6SR8b9gmUYFTQD3k8954en11hRHunAxYlp8hNErabAKaErdKqA2kTLIHUOYo
         YXN25fqtn/jH6E5rrbty++R6jNv2/YUCTuOLydaElTZl281oNttH75z/DGYiyFtUQCo+
         CNYODqIavhTlq5RGHJDK1JU/TYn3pTfAcyHLGo5bjWrfKuziMKipGUU8Ua3/O+PoRedF
         f8GA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UE9LgCTb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae09de23sor8262542276.15.2025.02.20.05.47.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 05:47:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UE9LgCTb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740059265; x=1740664065; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRXbKCZYAbAUSTZO6GXGqX5QlIgXZzqmfvbZFu52Bso=;
        b=UE9LgCTb0PwKIa/3+8gj0HhKf67dmBWDVlfFQ/2UlinQQ9f5eq4ghrtMhMpO62Hkrq
         gLmHig5JYNUWjhjeyXcl3RW3RbC0BjV6ShavffaooI7H5aqRDKRJ7jLPftyEycm/ykgF
         P6Ri0AcHx3tMYtofpHnkXFCARfVz8z7/ANXMehnPRsGN7a/X34zmzxagT61/acPe0+lw
         ekUh+L88zx7R7aMI1feEPnesUZ796eOzYrMXBcwKCdyPi/czTTtwUtkySDPrnErl04W6
         e7ho6xo8sF3poRyT276yOQOauXRRycSSDH0x8ithyXR57n77YT7dwBo4VbhoX2MlJN2E
         V1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740059265; x=1740664065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRXbKCZYAbAUSTZO6GXGqX5QlIgXZzqmfvbZFu52Bso=;
        b=ZW5bALtzTALffwLTQj9WyVofKg4ZVcdmG/W81cTHZrOi6VkOIJP5DouBANkkUr0Saq
         R6J2rl/pgMRMDHF+t7CeVAV7pCEe41A9sdx6jcqdiNI84aJeiXuLvgSPI2tj16GW0aNq
         jR5Cno1oU4Ttu58xEeTkvniA0qIS4W2ZWAaoRcDCg2rCJENVM4lXF9+PYLXl2xLtxYU/
         z4IIcJ5Ji7bbMWuR83n1yGP21Bkay36TP9ahkuCbBme/dcsLuZXK+XtkJ0Hj7VH6XWST
         4KdDbAsAwpuep/qzADjtRt0ov5TFcKgb+bm6nDd1CqaqFLrzfsZR/EG3ok/P8TotVNMG
         r1OA==
X-Gm-Message-State: AOJu0Yw7YQrnrklepfyvH314C90btpsdvH7e3Rl6PhUUs5qq+9IhzJpz
	xHEQIX+lsDPvJuwilySBct5gXwoIIuB4VAAB1y9BjXyPZRjMivh4tr6fx/LLKnyrJPn62+8Jx62
	AtbZqmG1kj2Wquw7HJbIXvB8mias2goLb3Low35Py36YJP0OnPXA=
X-Gm-Gg: ASbGncvId44zbLq1YvQi5WlEI3A5KOe+ZimGRVlk5e69Sxyu7+J94YtbjNC0GTqkXST
	qTMJfo83JoBd7pm71VrXFfDk2Vv4bZuMXPKRT5qnY8/nILiAAjBOCP6vkfSQL3tiMBtepPcGZnw
	==
X-Google-Smtp-Source: AGHT+IGmYS6MprX09YyQXwXopVtqlVkaGZkPDhPVIEiGapAzZHcTRMUy7RSTVf+/WQ7h7JWRidIyiCwSHu4kjoayFM8=
X-Received: by 2002:a05:6902:270a:b0:e57:2ff6:945a with SMTP id
 3f1490d57ef6-e5e09faa9b7mr5744161276.0.1740059265073; Thu, 20 Feb 2025
 05:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20250219150009.1662688-1-alex.bennee@linaro.org> <CAFEAcA_TJhgrcfZ-9JY74OvkiGXPuYHJF16=_3Y+=r6+JfXMGA@mail.gmail.com>
In-Reply-To: <CAFEAcA_TJhgrcfZ-9JY74OvkiGXPuYHJF16=_3Y+=r6+JfXMGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 13:47:31 +0000
X-Gm-Features: AWEUYZnI94sD-sjuHR9Xv11WRR5BfWfHATHRosMwlxXVYvTJIDzU3XeJvtJXigk
Message-ID: <CAFEAcA8MpGGGeYvBKB4kcx9-_F2KTViwKtbbixBF9jNhE3Ok5g@mail.gmail.com>
Subject: Re: [PATCH 0/4] testing/next (aarch64 virt gpu tests)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Buuu5PFk8CTr

On Thu, 20 Feb 2025 at 11:29, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 19 Feb 2025 at 15:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > Hi,
> >
> > As I was looking at the native context patches I realised our existing
> > GPU testing is a little sparse. I took the opportunity to split the
> > test from the main virt test and then extend it to exercise the 3
> > current display modes (virgl, virgl+blobs, vulkan).
> >
> > I've added some additional validation to ensure we have the devices we
> > expect before we start. It doesn't currently address the reported
> > clang issues but hopefully it will help narrow down what fails and
> > what works.
>
> Running on my setup with a clang sanitizer build I get
>
> ok 1 test_aarch64_virt_gpu.Aarch64VirtGPUMachine.test_aarch64_virt_with_v=
irgl_blobs_gpu
> ok 2 test_aarch64_virt_gpu.Aarch64VirtGPUMachine.test_aarch64_virt_with_v=
irgl_gpu
>
> and then the third test timed out.

vulkaninfo --summary as requested on irc:


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
VULKANINFO
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Vulkan Instance Version: 1.3.275


Instance Extensions: count =3D 24
-------------------------------
VK_EXT_acquire_drm_display             : extension revision 1
VK_EXT_acquire_xlib_display            : extension revision 1
VK_EXT_debug_report                    : extension revision 10
VK_EXT_debug_utils                     : extension revision 2
VK_EXT_direct_mode_display             : extension revision 1
VK_EXT_display_surface_counter         : extension revision 1
VK_EXT_headless_surface                : extension revision 1
VK_EXT_surface_maintenance1            : extension revision 1
VK_EXT_swapchain_colorspace            : extension revision 4
VK_KHR_device_group_creation           : extension revision 1
VK_KHR_display                         : extension revision 23
VK_KHR_external_fence_capabilities     : extension revision 1
VK_KHR_external_memory_capabilities    : extension revision 1
VK_KHR_external_semaphore_capabilities : extension revision 1
VK_KHR_get_display_properties2         : extension revision 1
VK_KHR_get_physical_device_properties2 : extension revision 2
VK_KHR_get_surface_capabilities2       : extension revision 1
VK_KHR_portability_enumeration         : extension revision 1
VK_KHR_surface                         : extension revision 25
VK_KHR_surface_protected_capabilities  : extension revision 1
VK_KHR_wayland_surface                 : extension revision 6
VK_KHR_xcb_surface                     : extension revision 6
VK_KHR_xlib_surface                    : extension revision 6
VK_LUNARG_direct_driver_loading        : extension revision 1

Instance Layers: count =3D 4
--------------------------
VK_LAYER_INTEL_nullhw       INTEL NULL HW                1.1.73   version 1
VK_LAYER_MESA_device_select Linux device selection layer 1.3.211  version 1
VK_LAYER_MESA_overlay       Mesa Overlay layer           1.3.211  version 1
VK_LAYER_NV_optimus         NVIDIA Optimus layer         1.3.242  version 1

Devices:
=3D=3D=3D=3D=3D=3D=3D=3D
GPU0:
        apiVersion         =3D 1.3.242
        driverVersion      =3D 535.183.1.0
        vendorID           =3D 0x10de
        deviceID           =3D 0x1cb3
        deviceType         =3D PHYSICAL_DEVICE_TYPE_DISCRETE_GPU
        deviceName         =3D Quadro P400
        driverID           =3D DRIVER_ID_NVIDIA_PROPRIETARY
        driverName         =3D NVIDIA
        driverInfo         =3D 535.183.01
        conformanceVersion =3D 1.3.5.0
        deviceUUID         =3D 0a44d8af-913b-892f-1603-e76ce29ac9b5
        driverUUID         =3D 526ab2c8-1f4a-5dd0-9559-81dab18f1e08
GPU1:
        apiVersion         =3D 1.3.289
        driverVersion      =3D 0.0.1
        vendorID           =3D 0x10005
        deviceID           =3D 0x0000
        deviceType         =3D PHYSICAL_DEVICE_TYPE_CPU
        deviceName         =3D llvmpipe (LLVM 19.1.1, 256 bits)
        driverID           =3D DRIVER_ID_MESA_LLVMPIPE
        driverName         =3D llvmpipe
        driverInfo         =3D Mesa 24.2.8-1ubuntu1~24.04.1 (LLVM 19.1.1)
        conformanceVersion =3D 1.3.1.1
        deviceUUID         =3D 6d657361-3234-2e32-2e38-2d3175627500
        driverUUID         =3D 6c6c766d-7069-7065-5555-494400000000

-- PMM
