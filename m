Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp774227njb;
        Tue, 18 Feb 2025 07:41:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwrN8YPXRBAkhwrkIrJUwswI3wz4z9krv5DYLywK3A5UBatkJTwoeeMXjuuLPx5ZF3SePNCAISbOdgVw==@linaro.org
X-Received: by 2002:a05:6000:186d:b0:38b:da31:3e3e with SMTP id ffacd0b85a97d-38f33f2f612mr13837554f8f.28.1739893309136;
        Tue, 18 Feb 2025 07:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739893309; cv=none;
        d=google.com; s=arc-20240605;
        b=OgpPDUn8urnlmfTssVV7SEM4UH+ecrF3XONlDicXcFzGRC594hJeHG+ZhZZynlV0uE
         T9t40T4DOmxbQ7CZgtBRsh+xs0arxUA1zEBbDfpbcY/LPDDwQBrLqbJv/XgYkqbQRdRJ
         lMjdF7ktzSepmgTv0w9Y6rV0Jqm0jB5zITbPJSQyU+yvoct9GG8rXbL/m4LPKTvBc5C1
         cGibXurdV529Vc2G8qESz/X86PyE+vl6GPsRqBdGM32MY43ai4GMZc+16q9yigDvtlV+
         pJwxyN9ueK4WatTGhpmGxwzFzGFHdAfeYKlRRtWRqkBqL7YvhRhnTR8RfZF+S/DCfzBI
         RYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rftezDm0PXXAzXVMv5QO3Kp9pkZEb9I5IaKVIiUl1+w=;
        fh=rhNx26Wnnb5XINQpz3RGE7E36gS8S8m4Gp5l31i/rvo=;
        b=iLJT4OOS2sQQ3lAutJ4KXVlLDUGH57UmY51UZo/HnJ8rtfMZvb9tGS6XYC49zbZICR
         V2AjvQeQDt7Ny5D9bo1k2uaQk/VUCgwj0F5V+DyCVS2DYAmlTmckzJrSNRT4ackKrbwM
         z3ushu+m15mnWEAvTuvgwNOqMNRdSkP5jQ2O8LhX6qN90h6YGhTOAC52oEGigHM+f6OY
         SWWKEuvllClMmI3HpaVJu+6cgjNClJfKgDLvBuU+O8bx1RtR8feP2154DABu+pPiBG6+
         tsuHxKKoqUHZBaJSXwHrYoxXHRkK0XX7xbVLBt7vfztl0WYuL60MYMpbaK4Bp2ZCH3UE
         FUMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bDZvv7X9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439989c7835sor2624725e9.10.2025.02.18.07.41.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 07:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bDZvv7X9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739893308; x=1740498108; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rftezDm0PXXAzXVMv5QO3Kp9pkZEb9I5IaKVIiUl1+w=;
        b=bDZvv7X9G/jxuNLz0q4h1TX1WMs8l1SFpaSHT74PfmpSQuHeq5Q98bxxOxSFbqbKKO
         cEbz0TnI33WI9lvSuz85GSElZUGombPKuJeT1rHXz6a1G2KE8RVFXSxQykmpSm+y4VEF
         VZ/AoRhMUq1BdjNf7TU/Dh4sVKd0VePoO1N7628v9TS8z0hVsLF1ibtLY1Ls8eLv0SEw
         89Gqe81iWVzePh2z2X6lvZQVED6vLsamiR8aTzJ7DrIZMZ/p6LQtrkUIx3deCGmoo62U
         5ZJVDhGMb2OiD5H5dTcJmNz08H0jrmjILZE4HE/E1+4yoZ68bSVYYK24RZGm6ZvstExZ
         CA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893308; x=1740498108;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rftezDm0PXXAzXVMv5QO3Kp9pkZEb9I5IaKVIiUl1+w=;
        b=AVeeet/WQsMqdG89wepGB/iKugb41zX4ztvoYRErCXXDfbQlC0GHxxd5xg9QZfIqGv
         uhQRYZyuzS0tDktcFkMDwX38AxuBOxOTxXO8Zv+5HNBnFlZT2pSITbSNnugbZYl9nIIk
         SGIiSFHaaOtwjXGWwX4323wGaJMLr6NvChWws+dHIE8UjbxPYts0SaZ6E8ufrbArGxXa
         JhhBSR6mk/78T0mzqnk2yIdTfzPNMtdkZX2x5d1yySXDzPglM/H4rTkWpkcV4ZJdI+A9
         m7p4sGGBYCGqN2wAuzendAZmoKboQKpsHUUAsljk4/dpWWWllIAIPbgS8M9iSyUx+XrA
         AcFw==
X-Forwarded-Encrypted: i=1; AJvYcCWSOuP7qTC9kVl4fFke3E+L9yMRIivnTmEgjgQO4ipV/78zHsBJa8sk8EBWXsiZH6AR+nF3QV0cY/sSew==@linaro.org
X-Gm-Message-State: AOJu0Yxd77JT+uEa7ejaVq8GOjCUqzyJ1k/JD/6i5x64OZvN5aEbORQJ
	jWXCdbTaLkcY1W0MdpewYShZA19EhJJ7iqfY6oYV8rPDFrPgkYxv2NUyPfjHMHMN4g==
X-Gm-Gg: ASbGncstkLwpygsZev3lLSfVMVVnzpSMtD8+4TMooNwU9SJHYk8XzJfaDbQ+iU755+s
	bu6Wh6w2uUyti2I9kBTsc2Wc4UCVf/jzuVlQhWqUvuuAdH0EKuWRiPX2rRQepiKxV1cYOYT/HtY
	Hvgyo2GOM24nt0LLuiMesE69x9Bg6/qXljYHIhmc/yXQHpmhClcqmcGdf4d2Q6AA2zrv3IZ+I/r
	P1Q+ZGLIliJsibUUZptjYb6idbkAx0pRNdUcv4jl76SufwlNrFV4XzbHh9wT1uryDimm5YbfHeF
	zWtYGDPtWXAKUeR0/t/lhlQNc6Il/yNL4wTycs0iR9V00b5MYKLfqBEkr4s=
X-Google-Smtp-Source: AGHT+IF/8ntl9BcDGAADsSp5RSNssX1/saVLS8T4n7eb/VsqHM+B23KD2LwLr97A98aYw1YdA9oepQ==
X-Received: by 2002:a05:600c:1ca8:b0:439:8a44:1e65 with SMTP id 5b1f17b1804b1-4398a441f98mr62729005e9.7.1739893308542;
        Tue, 18 Feb 2025 07:41:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398cb4de78sm41912265e9.24.2025.02.18.07.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:41:48 -0800 (PST)
Message-ID: <5580a9e6-c1bc-44c8-9edc-d98ba4985123@linaro.org>
Date: Tue, 18 Feb 2025 16:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 3/9] meson: Disallow 64-bit on 32-bit Xen emulation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, qemu-devel@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250208205725.568631-1-richard.henderson@linaro.org>
 <20250208205725.568631-4-richard.henderson@linaro.org>
 <aeaf0f19-0f14-4a02-9c51-09521e7c75e1@linaro.org>
 <9b22d0ff-5902-4ec7-ae54-e974482ebd87@citrix.com>
 <3fb630f4-ebd2-4f14-a1fe-4e84786a1400@linaro.org>
Content-Language: en-US
In-Reply-To: <3fb630f4-ebd2-4f14-a1fe-4e84786a1400@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Iq6/3DxNNs3B

On 18/2/25 16:25, Philippe Mathieu-Daudé wrote:
> +Vikram
> 
> On 18/2/25 15:10, Andrew Cooper wrote:
>> On 18/02/2025 11:20 am, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> Adding Xen community.
>>>
>>> On 8/2/25 21:57, Richard Henderson wrote:
>>>> Require a 64-bit host binary to spawn a 64-bit guest.
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    meson.build | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 1af8aeb194..911955cfa8 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -304,9 +304,14 @@ else
>>>>    endif
>>>>    accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>>>>    -if cpu in ['x86', 'x86_64']
>>>> +if cpu == 'x86'
>>>> +  xen_targets = ['i386-softmmu']
>>>> +elif cpu == 'x86_64'
>>>>      xen_targets = ['i386-softmmu', 'x86_64-softmmu']
>>>> -elif cpu in ['arm', 'aarch64']
>>>> +elif cpu == 'arm'
>>>> +  # i386 emulator provides xenpv machine type for multiple
>>>> architectures
>>>> +  xen_targets = ['i386-softmmu']
>>>
>>> Is actually someone *testing* this config? I'm having hard time building
>>> it, so am very suspicious about how it runs, and start to wonder if I'm
>>> not just wasting my time (as could be our CI).
>>
>> It was intentional.  I believe it was Stefano (CC'd) who introduced it.
> 
> In the introduction commit, "ARM targets" is used, so apparently both
> 32/64bit were picked deliberately:
> 
> ---
> commit aaea616d54317b8a0154adf52303a51da2d8d56f
> Author: Vikram Garhwal <vikram.garhwal@amd.com>
> Date:   Wed Jun 14 17:03:38 2023 -0700
> 
>      meson.build: enable xenpv machine build for ARM
> 
>      Add CONFIG_XEN for aarch64 device to support build for ARM targets.
> 
>      Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>      Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>      Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> diff --git a/meson.build b/meson.build
> index 481865bfa97..cfa98e9e25f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -136,7 +136,7 @@ endif
>   if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>     # i386 emulator provides xenpv machine type for multiple architectures
>     accelerator_targets += {
> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
>     }
>   endif
>   if cpu in ['x86', 'x86_64']
> ---

Hmm wrong commit apparently, but the history isn't clear. See:

-- >8 --
commit 3b6b75506de44c5070639943c30a0ad5850f5d02
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Sep 17 11:59:41 2012 +0200

     configure: factor out list of supported Xen/KVM/HAX targets

     This will be useful when the functions are called, early in the 
configure
     process, to filter out targets that do not support hardware 
acceleration.

     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/configure b/configure
...
+supported_xen_target() {
+    test "$xen" = "yes" || return 1
+    glob "$1" "*-softmmu" || return 1
+    case "${1%-softmmu}:$cpu" in
+        arm:arm | aarch64:aarch64 | \
+        i386:i386 | i386:x86_64 | x86_64:i386 | x86_64:x86_64)
+            return 0
+        ;;
+    esac
+    return 1
+}
+
  # default parameters
  source_path=$(dirname "$0")
  cpu=""
@@ -6178,46 +6222,22 @@ echo "TARGET_ABI_DIR=$TARGET_ABI_DIR" >> 
$config_target_mak
  if [ "$HOST_VARIANT_DIR" != "" ]; then
      echo "HOST_VARIANT_DIR=$HOST_VARIANT_DIR" >> $config_target_mak
  fi
-case "$target_name" in
-  i386|x86_64)
-    if test "$xen" = "yes" -a "$target_softmmu" = "yes" ; then
-      echo "CONFIG_XEN=y" >> $config_target_mak
-      if test "$xen_pci_passthrough" = yes; then
+
+if supported_xen_target $target; then
+    echo "CONFIG_XEN=y" >> $config_target_mak
+    if test "$xen_pci_passthrough" = yes; then
          echo "CONFIG_XEN_PCI_PASSTHROUGH=y" >> "$config_target_mak"
-      fi
      fi
-    ;;
-  *)
---

Paolo, Alex, was this intentional?

>> Xen uses qemu-system-i386 everywhere because qemu-system-x86_64 doesn't
>> make compatible VMs.  I'm not sure why; I suspect it's bugs in the Xen
>> machine types, but I don't know QEMU well enough to be sure.
>>
>> Another thing that (at least, was) tied to qemu-system-i386 was using
>> Qemu as a XenBlk <-> QCOW adapter, at which point it wasn't even really
>> a system emulator, just a paravirtual disk implementation.
>>
>> This is, AIUI, what ARM wants with the xenpv machine.  If there's a
>> better way to do this, please do say.
> 
> No, I concur.
> 
>> Looking through Xen's CI, I can't see any of the ARM builds building
>> QEMU at all.  I think it's quite possible it's not tested any more.
> 
> We only cross-build, see our cross-arm64-xen-only job:
> https://gitlab.com/qemu-project/qemu/-/jobs/9165958873
> 
> Note, if it is not clear, the problem I have is to test Xen on
> 32-bit ARM hosts; I don't have any problem with 64-bit ones.
> 
> Regards,
> 
> Phil.
