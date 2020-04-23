Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1582629lfm;
        Thu, 23 Apr 2020 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypLnYWvTuVPuxp8N48O+s1rcL11S5eA1HoeQbqhVdK7a8/oOQjyTWPM4Max7U2xTcFPH2Nq8
X-Received: by 2002:a37:b03:: with SMTP id 3mr2060024qkl.67.1587626612227;
        Thu, 23 Apr 2020 00:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587626612; cv=none;
        d=google.com; s=arc-20160816;
        b=iDE65m0ztMNvKUr+2lKHtSaVpCyr1+m+YMKEYqkHdpJ3x3FDh2bc6VuHAQViHpH8uL
         e1XABtMVBf8ZxPjdkvO+PT5CHFm5xG/SC+dvGCfJ3PeSB/mFBxnSXx+1AXhDQl3+n+hP
         BSxNKEqo/48PKxi9gE6BAnQYJKpiK6ahowmgUmYm2ea0Fif7O9m2bkH0JmeFduU0Nckx
         ny0wrXoNF8220PeVkRdSdoO/79Uv0cIe5slM7mw+Kqb10FgpHo+W0+r8ayL+DevWOTZq
         MVVrUWijSBYFKLV0PRU1/tzcTWGZmbNqEyU9TanlA3sSNBISQcBISUh3bqr92010O+Rj
         iMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dKCuMmBmzndHaHTW8o0diLeOHeBb2mtLY3I87hgef/g=;
        b=hdJbzZBhjm3OnoAElzg3gZK9blVrOgCgyOjPH4Yjx2eatsrWvBTZrr7ad530HURYDV
         5fRK7RrxkCW0aek0j6sWo/S02n+l6kSyoi2QvwkrTsx/dIJSgBRGFvwqk66wkY4fb343
         jOpsgF4TAT7gccKkqCk6no6bdzNwXf4e4iE8tgkFzu1mNGqEpQfxDfzpYK8HoQU9YmNs
         DmbGtRvdXsEsxaeb5au2z8GFP7KDR4S+6heM1BLpdKpZFxEy3oAaT+MDUMsOPWQ5nAVI
         AtH0ROJs8fFNptL20tFxHizcvPGITPCYWB2y39NCN3NOTkYGLwIsEVo939qQKo2meGxM
         vJ/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="as/IemA4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x37si859988qtb.15.2020.04.23.00.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 00:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="as/IemA4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRWCp-00082l-E7
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 03:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWCj-00082f-8v
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWCh-0004ra-W7
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:23:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57083
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWCh-0004rB-Hh
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 03:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587626601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKCuMmBmzndHaHTW8o0diLeOHeBb2mtLY3I87hgef/g=;
 b=as/IemA4PCLbCozwtLc+JreD09iZ13dv/q+9aSteAXW+kfanxBm4mntXstV1vYqLdmdhdx
 VLL+GLf+tY1D8i2w95n/uv2f55mnOXkaNmdlWzlyd+5OdNsKMRVVVNpuWcwKAE+twKcxj6
 JrxmRLClEumQaAE3hbQgy+zfTfBLP5U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-AyxyYqHyPIeR-2uVeIe1Bw-1; Thu, 23 Apr 2020 03:23:20 -0400
X-MC-Unique: AyxyYqHyPIeR-2uVeIe1Bw-1
Received: by mail-wm1-f72.google.com with SMTP id f81so1928591wmf.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 00:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IX24VkSMnMN0fAjeVbMI3N9QgAuh8E9Jat5sq+clf+w=;
 b=YHbr9qjZrWnXmJT8a6XUgQDsQwO7goAPCMjXnro+kD2Sd02NseavJ6TkiV6+xMO90d
 pptBhqzlIWePvj9+DAa0LdHWGM/UseN2ZrKG/tXinVClrEzTQHeRPpQT1qSlVRuaGtCH
 LW4rsLGFc1bdlCkvPwoPizknsYDgGw1b1cf+3VQ0eace8kWlg7NLNv5ZK4T2yKgKevlw
 9QFgIAYBVnAflm2llFKG2GV065pNCoPapg+Ag4OhDe06Vy7Wsl2XpuJrWmMzx7Qs2zWv
 sY5Sc0XOienPPAqyjVoBQifvZN2G815/buEKXLaIj6OYlZKSgjkKMX81Q3PqbYXQXnJ+
 qwtA==
X-Gm-Message-State: AGi0PubHCd+8SVv+kgx5NPeaMYdjLzTEnaYKfvv/RfBpysmrOyLvyBRx
 z7sI7CwKNDl6/xZgSFa3VFvTsE03kgEj4A8lO/0VLutwABk/0paTTji/CRC2GSJvgzOlGIlJblE
 JuY++80CzxqFD
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr2444626wmn.81.1587626598391; 
 Thu, 23 Apr 2020 00:23:18 -0700 (PDT)
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr2444596wmn.81.1587626598125; 
 Thu, 23 Apr 2020 00:23:18 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id w10sm2487034wrg.52.2020.04.23.00.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 00:23:16 -0700 (PDT)
Subject: Re: [PATCH 2/6] target/arm: Make set_feature() available for other
 files
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20200421131926.12116-1-philmd@redhat.com>
 <20200421131926.12116-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04770c4b-285f-031d-7c2a-5b2f477ac40e@redhat.com>
Date: Thu, 23 Apr 2020 09:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200421131926.12116-3-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PFgclWCuvAe4

On 4/21/20 3:19 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Thomas Huth <thuth@redhat.com>
>=20
> Move the common set_feature() and unset_feature() functions
> from cpu.c and cpu64.c to cpu.h.
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Message-ID: <20190921150420.30743-2-thuth@redhat.com>
> [PMD: Split Thomas's patch in two: set_feature, cpu_register (later)]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   target/arm/cpu.h   | 10 ++++++++++
>   target/arm/cpu.c   | 10 ----------
>   target/arm/cpu64.c | 11 +----------
>   3 files changed, 11 insertions(+), 20 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8b9f2961ba..5e32fe7518 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -696,6 +696,16 @@ typedef struct CPUARMState {
>       void *gicv3state;
>   } CPUARMState;
>  =20
> +static inline void set_feature(CPUARMState *env, int feature)
> +{
> +    env->features |=3D 1ULL << feature;
> +}
> +
> +static inline void unset_feature(CPUARMState *env, int feature)
> +{
> +    env->features &=3D ~(1ULL << feature);
> +}

Nack sigh... This still doesn't work:

target/arm/kvm64.c: At top level:
target/arm/kvm64.c:450:20: error: conflicting types for =E2=80=98set_featur=
e=E2=80=99
  static inline void set_feature(uint64_t *features, int feature)
                     ^~~~~~~~~~~
In file included from include/sysemu/kvm.h:252:0,
                  from target/arm/kvm64.c:27:
target/arm/cpu.h:699:20: note: previous definition of =E2=80=98set_feature=
=E2=80=99 was here
  static inline void set_feature(CPUARMState *env, int feature)
                     ^~~~~~~~~~~
target/arm/kvm64.c:455:20: error: conflicting types for =E2=80=98unset_feat=
ure=E2=80=99
  static inline void unset_feature(uint64_t *features, int feature)
                     ^~~~~~~~~~~~~
In file included from include/sysemu/kvm.h:252:0,
                  from target/arm/kvm64.c:27:
target/arm/cpu.h:704:20: note: previous definition of =E2=80=98unset_featur=
e=E2=80=99=20
was here
  static inline void unset_feature(CPUARMState *env, int feature)
                     ^~~~~~~~~~~~~
rules.mak:69: recipe for target 'target/arm/kvm64.o' failed
make: *** [target/arm/kvm64.o] Error 1

> +
>   /**
>    * ARMELChangeHookFn:
>    * type of a function which can be registered via arm_register_el_chang=
e_hook()
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a79f233b17..37f18d1648 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -724,16 +724,6 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *c=
s)
>  =20
>   #endif
>  =20
> -static inline void set_feature(CPUARMState *env, int feature)
> -{
> -    env->features |=3D 1ULL << feature;
> -}
> -
> -static inline void unset_feature(CPUARMState *env, int feature)
> -{
> -    env->features &=3D ~(1ULL << feature);
> -}
> -
>   static int
>   print_insn_thumb1(bfd_vma pc, disassemble_info *info)
>   {
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 62d36f9e8d..622082eae2 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -21,6 +21,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +#include "internals.h"

This include is not necessary.

>   #include "qemu/module.h"
>   #if !defined(CONFIG_USER_ONLY)
>   #include "hw/loader.h"
> @@ -29,16 +30,6 @@
>   #include "kvm_arm.h"
>   #include "qapi/visitor.h"
>  =20
> -static inline void set_feature(CPUARMState *env, int feature)
> -{
> -    env->features |=3D 1ULL << feature;
> -}
> -
> -static inline void unset_feature(CPUARMState *env, int feature)
> -{
> -    env->features &=3D ~(1ULL << feature);
> -}
> -
>   #ifndef CONFIG_USER_ONLY
>   static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInf=
o *ri)
>   {
>=20

