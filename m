Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp391234njb;
        Thu, 8 May 2025 05:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCdXA4nQWdDulxIb7cLLX9b3O77IgtIaYPNC7hf/g9UwTfWg5ggt/0eKZypTejewC0aPE6JKP6wowocg==@linaro.org
X-Google-Smtp-Source: AGHT+IF9TqE26T6wlaPU0AAoIMnZQ/CzYf7/VeW5e5qcs7Bbcl0B5/bqBcJ2zQMc17mpRUIkaZeD
X-Received: by 2002:a05:6214:27e5:b0:6e4:269f:60fe with SMTP id 6a1803df08f44-6f5429e04b0mr98332846d6.10.1746708322567;
        Thu, 08 May 2025 05:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746708322; cv=none;
        d=google.com; s=arc-20240605;
        b=iWgzEk50jhHNbAZQb1Bim/ih+FwXYwdWI6Iqb8lPb2E2kMqVbsf31O+LMBlTd0u+Iu
         7/t0bIwS/2leA+nCgV0xBcethnO1AzmAvLStRSzrPx+iQ+/2JXPe6pBF1dDdommocWjh
         T8+EVsjA0+iSE9KBdnlrp0RlbNQPDgflgCmTJ1r9g321pBSgWBIykHN6IPjnfj/2bxzx
         QumJgoN0KCCpZetTxDVSBcqbKB8pOx4h8dj1fi9Y/ym09docw190O/LIOvsQnfrAwEsr
         N0IayacJ6h7fyKIx2heJjVtN4WLcrTYUWAv+8BJPSocR7DUE5gkOBZPKoEPiEYVli67u
         MxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=25bC9Dome+JN+1e547VmpXcpWM6uEcoVAClNgG1V1Pk=;
        fh=lMh7KjcxARVC/ct/IyWQxFDm0APfkXRoLVyCaHtemC0=;
        b=JvZPxi9kn+6Pk8Y0DNrwB9zV9htyGy2YX+a8tAhmq7odV9+dbq2DuyJJ6wAoFOdCga
         pAgCJZJ+Oz28y9TNLCvueP7XUUNZu7HyfcyRA/2SUgmwLuJPcJsH6zmrV5gq4P8Yz5lQ
         RUSnzZYmdmSAXT9Lk4LvlfEIZu4BKq4/4N+VohtPUB9bT33t3kyzCQBj3XJIMFCpQ0nc
         rRsfswh+6vV5Que+GsjKfFYB5fMekBsudbxDlw5ZqqYIPXxF5vfA5BisstX54iYiGCY6
         gFOxqtwH6o3FrazWsPBCGRc5K2cQDlXa7csjkoe3eooJph1dj+EgBLkjX7kvlnmf/UMx
         9udA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMZr6cBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f5427ab4a7si41643746d6.290.2025.05.08.05.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 05:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMZr6cBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD0cn-0006BM-Rc; Thu, 08 May 2025 08:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uD0ck-00069P-TB
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uD0ci-0005EG-Nu
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746708310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=25bC9Dome+JN+1e547VmpXcpWM6uEcoVAClNgG1V1Pk=;
 b=KMZr6cBgIKLgfp5D2VwWBPYgSk462agm/3eS8BljDHbuEaBD8VKCWndPjL//nOtA4fSHTW
 DgyylfNFxyCUNYeLcm7otj27vf8ffcNiW7ooxSVStM7Wp34OoRg4TgEMvUfB54fR1z3APH
 0j/fUov7vx/ekOpWXIwoKn7teYdH530=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-eS8jhZVjNWuMU_u8ttsAcQ-1; Thu, 08 May 2025 08:45:09 -0400
X-MC-Unique: eS8jhZVjNWuMU_u8ttsAcQ-1
X-Mimecast-MFC-AGG-ID: eS8jhZVjNWuMU_u8ttsAcQ_1746708309
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0b63ca572so570325f8f.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 05:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746708308; x=1747313108;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=25bC9Dome+JN+1e547VmpXcpWM6uEcoVAClNgG1V1Pk=;
 b=Dk3puMdk9Tl8KQFGC+GWJhACzxV/HCz4B1uW23s2COV52vrPm+97KQlSBX9YLdiTAI
 +eeRFVtS8FpvopV8Al0/gQ9rTp0D9ElcwTBUlKIk13PJHIxYHM7fwWm4PBRsoAvWQ1jb
 0ufYkO86qqh5Cu2OP4fRs0CEVDu0aK0arQWJdM/ph3KV//Fn6r2PDiJTSVtrPZwrbnSj
 O6gc8n8wYkiWj1OwCtBf6adbedzGBm4UX4vN0yem6VrukaHDRSfiuAeg0bZRtPyQwOM7
 IajuWqqRXc9mA/6NXJRUI3szI+H9n2mfqBZitfxXe2BOKFm+yUoGCniC/7XfrKbJElAr
 2oaQ==
X-Gm-Message-State: AOJu0YylDYxa9epJoi1Oder6/BpjBt/RQOFQLzLPBXvXhx+LmUdVKOYh
 iv6bAPDcDTfRu4tSSWKd1MWe1kB6Sz5HZdJB8kfr0aZ7G9knARZJU8CJfD87GUxtzKzXgZGY+J+
 37saxLKzGijR9ExbxY2tWdQlQRc6iGlsTzJa25/p7lRnylzzJEw==
X-Gm-Gg: ASbGnct0s8Z+e4JU1wkh/EU3QDl67y2PoaiJaNDDPiFYu8uBSoMNKslbhWd/yZoG+Hv
 x7TNkv6U4pmX422+Z6LWChM4rxrkZy4ZoWa6Ji/KQhhotT1/EBqRD4uY8CnCUa5uFPfLhKjeWFZ
 /H7qI4CXlHTkfh4fk36wnly9oSzpCDYWdZANsLJdCpm7sM9RU9KEEwcg5iLZ2BS2M8Q4OfTmtxI
 qtW40sWBHEMxNc4d/q05Y1qwWFL2izgCTV11vY4fpCxmws7XRu2B9qDelBRJ1rCdARXvnkdtEYG
 AZSFd8aiAnqE2Kk=
X-Received: by 2002:a05:6000:2410:b0:3a0:b9e1:2a1f with SMTP id
 ffacd0b85a97d-3a0ba102708mr2642719f8f.51.1746708308500; 
 Thu, 08 May 2025 05:45:08 -0700 (PDT)
X-Received: by 2002:a05:6000:2410:b0:3a0:b9e1:2a1f with SMTP id
 ffacd0b85a97d-3a0ba102708mr2642697f8f.51.1746708308055; 
 Thu, 08 May 2025 05:45:08 -0700 (PDT)
Received: from [192.168.10.27] ([151.95.54.106])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a0af111559sm8157018f8f.47.2025.05.08.05.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 05:45:07 -0700 (PDT)
Message-ID: <870a48a2-abd5-4645-8749-ce3a33068948@redhat.com>
Date: Thu, 8 May 2025 14:45:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/arm: Compile musicpal and the xlnx machines with
 the right CFLAGS
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-4-thuth@redhat.com>
 <CAFEAcA82UF1Cp48VPs6Bgd5Yoe=BgDrXGSJWi=72pS+j_UJGFg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA82UF1Cp48VPs6Bgd5Yoe=BgDrXGSJWi=72pS+j_UJGFg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hKjmYhFJfb3nKjTlwtL6RTS5somyNHHiRRcPGCkleio_1746708309
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: uRvXTbgXoLh3

On 5/8/25 14:11, Peter Maydell wrote:
>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>> index 5098795f61d..51d0c055abf 100644
>> --- a/hw/arm/meson.build
>> +++ b/hw/arm/meson.build
>> @@ -8,7 +8,7 @@ arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
>>   arm_common_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
>>   arm_common_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
>>   arm_common_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
>> -arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, files('musicpal.c')])
>> +arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [files('musicpal.c'), pixman, opengl])
> 
> Is there not some better way to do this with Meson?
> I think that either:
>   * the build system should ensure it gets the headers right
>     when it's building things
>   * there should be some check such that "use header X without
>     declaring dependency on it" is a build failure everywhere,
>     not just on the oddball hosts where X isn't in the default
>     include path

The former was already happening for specific_ss

   # allow using headers from the dependencies but do not include the sources
   lib_deps = []
   foreach dep : arch_deps
     lib_deps += dep.partial_dependency(compile_args: true, includes: true)
   endforeach

   lib = static_library('qemu-' + target,
                  sources: arch_srcs + genh,
                  dependencies: lib_deps,

and the commit message shows that it was for a similar case:

     commit 727bb5b477e66b6cd8a558bf2cdf9a666b914f27
     Author: Paolo Bonzini <pbonzini@redhat.com>
     Date:   Tue May 7 12:22:31 2024 +0200

     meson: pick libfdt from common_ss when building target-specific files
     
     Avoid having to list dependencies such as libfdt twice, both on common_ss
     and specific_ss.  Instead, just take all the dependencies in common_ss
     and allow the target-specific libqemu-*.fa library to use them.
     
     Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

(Note that the partial_dependency() stuff is not strictly needed.  It's
only there to document *why* the dependency are added).

Plus, there is an older workaround (that should be unnecessary
these days) in ui/meson.build:

specific_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: pixman)   # for the include path
specific_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: opengl)   # for the include path

The root cause is that specific_ss (and now hw_common_arch[]) is built
as a separate target so the common code's include paths have to be added
either by hand as in Thomas's patch, or with a for loop as in the above
commit.

So, the problem is that a loop similar to the one above was not added when
building hw_common_arch_libs.  Something like this should work:

diff --git a/meson.build b/meson.build
index bfddcc07dfd..812d6f90adb 100644
--- a/meson.build
+++ b/meson.build
@@ -3237,6 +3237,7 @@ config_devices_mak_list = []
  config_devices_h = {}
  config_target_h = {}
  config_target_mak = {}
+config_base_arch_mak = {}
  
  disassemblers = {
    'alpha' : ['CONFIG_ALPHA_DIS'],
@@ -3428,6 +3429,11 @@ foreach target : target_dirs
      config_all_devices += config_devices
    endif
    config_target_mak += {target: config_target}
+
+  # build a merged config for all targets with the same TARGET_BASE_ARCH
+  target_base_arch = config_target['TARGET_BASE_ARCH']
+  config_base_arch = config_base_arch_mak.get(target_base_arch, {}) + config_target
+  config_base_arch_mak += {target_base_arch: config_base_arch}
  endforeach
  target_dirs = actual_target_dirs
  
@@ -4107,28 +4113,27 @@ common_all = static_library('common',
  
  # construct common libraries per base architecture
  hw_common_arch_libs = {}
-foreach target : target_dirs
-  config_target = config_target_mak[target]
-  target_base_arch = config_target['TARGET_BASE_ARCH']
-
-  # check if already generated
-  if target_base_arch in hw_common_arch_libs
-    continue
-  endif
-
+foreach target_base_arch, config_base_arch : config_base_arch_mak
    if target_base_arch in hw_common_arch
+    base_arch_hw = hw_common_arch[target_base_arch].apply(config_base_arch, strict: false)
+    base_arch_common = common_ss.apply(config_base_arch, strict: false)
+
+    lib_deps = base_arch_hw.dependencies()
+    foreach dep : base_arch_common.dependencies()
+      lib_deps += dep.partial_dependency(compile_args: true, includes: true)
+    endforeach
+
      target_inc = [include_directories('target' / target_base_arch)]
-    src = hw_common_arch[target_base_arch]
      lib = static_library(
        'hw_' + target_base_arch,
        build_by_default: false,
-      sources: src.all_sources() + genh,
+      sources: base_arch_hw.sources() + genh,
        include_directories: common_user_inc + target_inc,
        implicit_include_directories: false,
        # prevent common code to access cpu compile time
        # definition, but still allow access to cpu.h
        c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
-      dependencies: src.all_dependencies())
+      dependencies: lib_deps)
      hw_common_arch_libs += {target_base_arch: lib}
    endif
  endforeach

(It passes at least "make libhw_arm.a" here).

Paolo

