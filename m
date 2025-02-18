Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp501521njb;
        Mon, 17 Feb 2025 22:35:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyQOgdRc3CUleeyy6m2WFjYwxQ8w26w5rdi/1fGgwdtKCqUSv7pqEZ85pvBHURK/RxZztWcQuYG5c/lQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5QJ9sS135qxMRiascObweE2wVekcoDivewZ/39l2vVFdqcpZCMzOFWu+qQhrOjcRobZdB
X-Received: by 2002:a05:622a:19a5:b0:472:e9:59ff with SMTP id d75a77b69052e-47200e95b74mr20805421cf.19.1739860503604;
        Mon, 17 Feb 2025 22:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739860503; cv=none;
        d=google.com; s=arc-20240605;
        b=fcvdhkgsWBakX1ydiwIs74V1YUDGytQA4M/wE0udb5eRCQXSTOEUlkdmS3PwJNW8yH
         HGk4zVWChBlE11pvlHmiuHyrt6synfxOQuG/0kvhC0aKdbnFXdkS7ZJlWrxZQkC66xEx
         5Sp/vagJQiHX3vr/pMo7fggNhSeduHj/EP84EuSCCevVxIOdsosVdCFuRl6aWzKK6/Ud
         t4Dl0CDG3tMn9MYYNqaf4/AMaA7md6oS+3jC8ijembxRl3soHUTNUFl5dMMjUR69lnxn
         BJjd9GIudYldt/K8yC3faXB2g0VucPtbn6SGnD/6zPbBabB3J6xaJB7sS6QVVYj3J2zq
         UwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=x5AhtQ12gH8aBCtU16EhV/9L7NlWQ+Hp7XX+wS4vcjM=;
        fh=ALcTFGjFkV8H6gOUXoHiX10vimrc30sragkaw75lSXs=;
        b=DOiQScEUUZFAs8irQJG+lOzEsEHZa0SOHuzzIrEvxWTqRkBtp9afOqkEaexNqLRn42
         7Hp1zTMrWK4hDsKQ2lNOPjVjrwQ00DLLXNRUNLy24Lt9f8knyV5f2+9a2urMmhLcjL5+
         LnoEz5jjlKNgQksAb1eOinECVxx7ax14ujVjPOXy5jE0hGv8kCvGKB1XHSEpzheyAVMN
         7uoaTek4V3mOV5Md6Yv3DdHiqK5CnK6edkRTShh4/YY3bjWfvhR664gYPO3vIaaXB9S8
         Sx1WTg5e5XZN6JFC2R8ZbeaSJ+TJlVTfADMSbLZe+VNhzhkiwASHE88H5cW51El/03Nc
         iOMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TgfwdL0I;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-471f4b90b91si26166621cf.424.2025.02.17.22.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 22:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TgfwdL0I;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739860503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x5AhtQ12gH8aBCtU16EhV/9L7NlWQ+Hp7XX+wS4vcjM=;
	b=TgfwdL0I3YGx/MP82unNkTjbhTmlSMloUqEnS62jlcbO+ypuGU+3k2IYTyaK7jNR7PcBo7
	e0PZm2cLWlTmg4vDQzDLqyoraXjP1zilwpSMylt5lY19ZvP0r/Gf3aWUZ1rPLoKw43WLcw
	9ssE1jpzwweUjFE6VE/xw0JDaY+ZBzc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-Y-meDT3dOECvj8qo2SciMQ-1; Tue, 18 Feb 2025 01:34:58 -0500
X-MC-Unique: Y-meDT3dOECvj8qo2SciMQ-1
X-Mimecast-MFC-AGG-ID: Y-meDT3dOECvj8qo2SciMQ_1739860497
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43945f32e2dso40502425e9.2
        for <alex.bennee@linaro.org>; Mon, 17 Feb 2025 22:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739860497; x=1740465297;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5AhtQ12gH8aBCtU16EhV/9L7NlWQ+Hp7XX+wS4vcjM=;
        b=gFC7vVuv6wGstZ1Dk0/k44/bVlqkzvtciC5L6Zcv2vKU5wxGxoqv+jFG2l0B+8xtEs
         gCl51YIZiPji2m5udn5Pn6VxGDQ/ho9anxzMo0aBw8QQDhNajZ9ZuaQf7maEVlOLaFzz
         bEc4C/nGLEPRgl4Hp6tazLPk1Le8jmhh9r07qZzQ2WvQ7hexsjoFQdDvwNteDaEhlCnd
         QV1M56LopkTE9w/jiMTxgnyHyXTifS3q2VJSEU2ib2mzdOfBIN62AF+3vh9+jNxuetNc
         PrqTcviDXzqsVYca+aLXK+0zuyfpnZH21KC2C4gUDkJPyigmd6bTiqyinWTI9ERXXqeB
         +zmg==
X-Forwarded-Encrypted: i=1; AJvYcCVZx8m+oRvhWO2Gj4rFm+DdV6divpLocR/lVYgwKRVNj4MN9tNDSKw/6FgUZbVNEETTo07PratWlChzYw==@linaro.org
X-Gm-Message-State: AOJu0YzWqSBKLbzUy4y7fyOeH0KHmQnyH809cVTlR4mmtAbYZvkcXqLV
	k9KODxcwY1+WLB/6H6Hjh/5Sstg9PeXYZG46LVFvYBwa8WNAkRefn53UnQqRtH1c61Xvp8yoDVO
	oJmPlIY+JwcmCNbCPfPqdI9U5CJaubFrrNdbKmURGCycxEO8MEO+vTQ==
X-Gm-Gg: ASbGncuQCK1VzeK0NL+pxbOH0QX/YkD18rQWZm7j2ivv5xNB18hn6ZuAvpFuGCEtGbt
	6H8pTAjVSpBhRlQuYJisfvyZyh36uofNML55q19D+tkH328pjmJTV5Nq+Um6ihyS9+ZDKzLGRLX
	/k1GbKHsSx2DOIkFSjRrxrwQQyPKu75CFBN0SSy5s46XxZclYqZNNazf7/3CbNjltVNsiTpOgKU
	74pZacbm6WSGfQyUHLq3KNj1d98d1yCHHRd7qNs8Izl8aUB9lRF5IJxCMNpfczP8k+WGDKkVUWN
	87WUXVYs54rta0ckq2ozwpEt5bRwX2PftqVU
X-Received: by 2002:a05:600c:1910:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-43996aae68amr3182675e9.12.1739860497285;
        Mon, 17 Feb 2025 22:34:57 -0800 (PST)
X-Received: by 2002:a05:600c:1910:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-43996aae68amr3182435e9.12.1739860496843;
        Mon, 17 Feb 2025 22:34:56 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-157.web.vodafone.de. [109.42.51.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b824dsm171358935e9.34.2025.02.17.22.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 22:34:55 -0800 (PST)
Message-ID: <6d1cad85-4824-4912-b209-60a8070c59af@redhat.com>
Date: Tue, 18 Feb 2025 07:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 23/32] tests/functional: extend test_aarch64_virt with
 vulkan test
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:Virt" <qemu-arm@nongnu.org>
References: <20250110131754.2769814-1-alex.bennee@linaro.org>
 <20250110131754.2769814-24-alex.bennee@linaro.org>
 <CAFEAcA8Kf4eF-nxEsxhPZnV3pwU+9kXLq1zXDi61ODQEQXaAYw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA8Kf4eF-nxEsxhPZnV3pwU+9kXLq1zXDi61ODQEQXaAYw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KOpVRT9sgo6UUBjvs919TfcNBZ5mfgIEEmI8KbWZbNk_1739860497
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2uDTO7Okgj9c

On 17/02/2025 17.30, Peter Maydell wrote:
> On Fri, 10 Jan 2025 at 13:23, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Now that we have virtio-gpu Vulkan support, let's add a test for it.
>> Currently this is using images build by buildroot:
>>
>>    https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20250108121054.1126164-24-alex.bennee@linaro.org>
> 
> Hi; this test currently fails for me with a clang sanitizer
> build (ubuntu 24.04 host). It seems to run weston in the guest,
> which fails with:
> 
> 2025-02-17 16:11:10,218: [16:11:10.672] Command line: weston -B
> headless --renderer gl --shell kiosk -- vkmark -b:duration=1.0
> 2025-02-17 16:11:10,224: [16:11:10.675] OS: Linux, 6.11.10, #2 SMP Thu
> Dec  5 16:27:12 GMT 2024, aarch64
> 2025-02-17 16:11:10,225: [16:11:10.680] Flight recorder: enabled
> 2025-02-17 16:11:10,226: [16:11:10.681] warning: XDG_RUNTIME_DIR
> "/tmp" is not configured
> 2025-02-17 16:11:10,226: correctly.  Unix access mode must be 0700
> (current mode is 0777),
> 2025-02-17 16:11:10,226: and must be owned by the user UID 0 (current
> owner is UID 0).
> 2025-02-17 16:11:10,227: Refer to your distribution on how to get it, or
> 2025-02-17 16:11:10,227:
> http://www.freedesktop.org/wiki/Specifications/basedir-spec
> 2025-02-17 16:11:10,228: on how to implement it.
> 2025-02-17 16:11:10,240: [16:11:10.695] Starting with no config file.
> 2025-02-17 16:11:10,253: [16:11:10.707] Output repaint window is 7 ms maximum.
> 2025-02-17 16:11:10,262: [16:11:10.716] Loading module
> '/usr/lib/libweston-14/headless-backend.so'
> 2025-02-17 16:11:10,313: [16:11:10.768] Loading module
> '/usr/lib/libweston-14/gl-renderer.so'
> 2025-02-17 16:11:21,858: libEGL warning: egl: failed to create dri2 screen
> 2025-02-17 16:11:21,959: libEGL warning: egl: failed to create dri2 screen
> 2025-02-17 16:11:22,023: libEGL warning: egl: failed to create dri2 screen
> 2025-02-17 16:11:22,032: [16:11:22.486] failed to initialize display
> 2025-02-17 16:11:22,033: [16:11:22.488] EGL error state:
> EGL_NOT_INITIALIZED (0x3001)
> 2025-02-17 16:11:22,036: [16:11:22.490] fatal: failed to create
> compositor backend
> 
> Then eventually the test framework times it ou and sends it
> a SIGTERM, and QEMU SEGVs inside libEGL trying to run an
> exit handler:
> 
> qemu-system-aarch64: terminating on signal 15 from pid 242824
> (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/pyvenv/bin/python3)
> UndefinedBehaviorSanitizer:DEADLYSIGNAL
> ==243045==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address
> 0x73fbfefe6a31 (pc 0x73fbba9788e9 bp 0x73fbbbe0af80 sp 0x7ffd676fbfe0
> T243045)
> ==243045==The signal is caused by a READ memory access.
>      #0 0x73fbba9788e9
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15788e9)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #1 0x73fbbaafc178
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16fc178)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #2 0x73fbba62564f
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x122564f)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #3 0x73fbbab067d7
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x17067d7)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #4 0x73fbba63b786
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x123b786)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #5 0x73fbba96290a
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x156290a)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #6 0x73fbba941c5c
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x1541c5c)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>      #7 0x73fbc2041f20
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x41f20) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #8 0x73fbc2041f68
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x41f68) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #9 0x73fbc2034ca9
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x34ca9) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #10 0x73fbc203ae90
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x3ae90) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #11 0x73fbc203aeda
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0x3aeda) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #12 0x73fbc20a45f5
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0xa45f5) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #13 0x73fbc20a2bfc
> (/lib/x86_64-linux-gnu/libEGL_nvidia.so.0+0xa2bfc) (BuildId:
> 6cd9e3e571aa104d4fa5512a5c7196617fea6b51)
>      #14 0x73fbd3047a75 in __run_exit_handlers stdlib/exit.c:108:8
>      #15 0x73fbd3047bbd in exit stdlib/exit.c:138:3
>      #16 0x5a5bab5e3fdb in qemu_default_main
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/main.c:52:5
>      #17 0x5a5bab5e3f9e in main
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/main.c:76:9
>      #18 0x73fbd302a1c9 in __libc_start_call_main
> csu/../sysdeps/nptl/libc_start_call_main.h:58:16
>      #19 0x73fbd302a28a in __libc_start_main csu/../csu/libc-start.c:360:3
>      #20 0x5a5ba9c5b554 in _start
> (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-aarch64+0x15dc554)
> (BuildId: 8efda3601b42aa2644dde35d1d63f7b22b649a33)
> 
> UndefinedBehaviorSanitizer can not provide additional info.
> SUMMARY: UndefinedBehaviorSanitizer: SEGV
> (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15788e9)
> (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
> ==243045==ABORTING

FWIW, I just saw this test also failing in a normal clang build (without 
sanitizers enabled). In the console log:

2025-02-18 07:08:47,497: [06:08:47.588] Loading module 
'/usr/lib/weston/kiosk-shell.so'
2025-02-18 07:08:47,914: =======================================================
2025-02-18 07:08:47,915: vkmark 2017.08
2025-02-18 07:08:47,915: =======================================================
2025-02-18 07:08:47,915: Vendor ID:      0x8086
2025-02-18 07:08:47,915: Device ID:      0x9A60
2025-02-18 07:08:47,916: Device Name:    Virtio-GPU Venus (Intel(R) UHD 
Graphics (TGL GT1))
2025-02-18 07:08:47,916: Driver Version: 100675584
2025-02-18 07:08:47,916: Device UUID:    c5930b2b12677aad53343f8a072209af
2025-02-18 07:08:47,916: =======================================================
2025-02-18 07:08:52,277: [vertex] device-local=true:MESA-VIRTIO: debug: 
stuck in fence wait with iter at 1024
2025-02-18 07:09:03,142: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 2048
2025-02-18 07:09:24,640: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 3072
2025-02-18 07:09:46,192: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 4096
2025-02-18 07:10:28,665: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 5120
2025-02-18 07:11:11,067: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 6144
2025-02-18 07:11:53,619: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 7168
2025-02-18 07:12:36,397: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 8192
2025-02-18 07:14:01,431: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 9216
2025-02-18 07:15:26,387: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 10240
2025-02-18 07:16:51,349: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 11264
2025-02-18 07:18:16,409: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 12288
2025-02-18 07:19:41,439: MESA-VIRTIO: debug: stuck in fence wait with iter 
at 13312

Should we maybe mark it as flaky for the time being?

  Thomas
