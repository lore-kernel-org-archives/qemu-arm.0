Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2292274lfg;
        Sat, 27 Feb 2021 10:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbXCoc7FGTfwdM2tLHSiXxmVk+39tbpdj1SRZYO7sbdappBHoNtkNIcdGEham5o46YsxDq
X-Received: by 2002:a92:5411:: with SMTP id i17mr7094106ilb.22.1614452384742;
        Sat, 27 Feb 2021 10:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614452384; cv=none;
        d=google.com; s=arc-20160816;
        b=fmpRN2fUOJaz7hQfXLsQBeF81IijrNY6JVlFVRtQ9HwAyAdyCuBdG2LzsmSitfnfkY
         Mujv4a8hpAg4MD1DBDIjUjY6r38gEzjuRmH9JLz62bpDPcsD8iAeFOCADi+1//PgRkEx
         KAiIZVOqeYOHf/vFFpVicBxHBRYmVXCzYAsVEhn9nJzG7UP0X8mVfNig0VnhEyGwXr2d
         G3xgfdGDGK1+GEprmR+47Q+Z6Zj6xfHa1Z5yo4lPR8KZ6atxXraxGGMHhR2Wtr1GKceS
         APP/BVIdByJpjrTg7Q8Qk/+l+QuXPjHidiI6pmjlJqLnMDG06E8uRbTw2jbdTVQ5jnvF
         TWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
        b=EZUJYfbqlJiVC08vJzb3znBRvlyWdK7sPCYA+H876Sh7O/YsGGwPTzazQZxUJTv2FV
         okQ3hf71w7H/TthKOZv5Z/T33MKBgK6zouuqJyOP5vM5i3kNebiHpL1jEPbKsy2MkHFc
         0iLEpOTysmUfB3xh1UNKE0OKE70fsPkv7wkMTDmP8ZDjsbLr5SN5SVBIXHY+0rup8QL7
         6egb1lpvBw0x6svpwUonrUik7Upko2vuNh+b9tifp3092r5q0t6LxLH0jj7+Cevr+VzH
         NkqRYBzsJ5R19BsFjaFDPlr1LmG71gVRD1oxRvFkO7dWcyvcNQNiinebLq+KhZcwcOfN
         u1mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+OO9dYy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i41si10894759jav.1.2021.02.27.10.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Feb 2021 10:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+OO9dYy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lG4oa-0006Zo-3d
	for alex.bennee@linaro.org; Sat, 27 Feb 2021 13:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG4oN-0006Wh-UE
 for qemu-arm@nongnu.org; Sat, 27 Feb 2021 13:59:32 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lG4oK-0003Kn-Jt
 for qemu-arm@nongnu.org; Sat, 27 Feb 2021 13:59:31 -0500
Received: by mail-pg1-x531.google.com with SMTP id p21so8357105pgl.12
 for <qemu-arm@nongnu.org>; Sat, 27 Feb 2021 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
 b=g+OO9dYyoUUDorYRWQcecLLNqn1EH9CMFDUSg9rWCmsSjN7whn1x/YYFnPUVuUcccw
 aFoSqQTPcxqfF/wS4QxmXSFY+I9wUISRu9v2viM2z/b0z9tQ0mrKCo889rOAj755Chxm
 kO5mIxf4xKKPiUPW5mEQTQHKHwSRPrpDQLU9Wrf9by1TJcKaOhtdMcjMve8mUKUcTApQ
 40ClLostH5b6XwAYkzB2BGaZA9vzQ0bp6r17sxn7PgzfYVg72XWn4M6DjYfwIOtiY4EB
 Uav1r6mozVCwK2+2TC3S42BHj407YPn4H0agNNKMDI1mhhQ/uu72W+APDayF04cl1BER
 hinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fumoWEvufGUqXz2ydHpb2ku6RD/nJbXOXTgn0QKGw0Q=;
 b=bv4mAotXXye7YTXEIB+w53dwlU+Be91PHOOyrOe7AipiPL1n9pk+BGisgK69k8Mk2F
 BYxoKWpoMv+43qUlE5IOcNjCbJGOJREorXlkAS9RL/EEFbAq9zmw9EU2TeY73wCJzLQ5
 aDkmYq3esYKX2Y9ZKbCTUnyDK42mhFgd+jKi4YEW+RSJNZZ9OFNEz2FXWjW9k3p8+SXF
 Ewz39aQLzmW/k3PNKsGURlkQmm8fAUzIvqPt0JyU7lpjc4C44wcTqiuYYNgElSHquXZv
 SZL9nxPz+rpzWdfYeIPsGyK/2B0d0zMiBQIThOLrMCHd0OQeXTjoDWpqvbHb2icl/3MY
 67kg==
X-Gm-Message-State: AOAM530aOeFipo76OPV08ulnPZYZIWFDt6mSZ8ezvpe/TlDJRYZ5/6aQ
 vVMAKt1IGgWDORBWTl7rtlwg+Q==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr7711298pgl.143.1614452366715; 
 Sat, 27 Feb 2021 10:59:26 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ep17sm12598344pjb.19.2021.02.27.10.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 10:59:26 -0800 (PST)
Subject: Re: [RFC PATCH] cpu: system_ops: move to cpu-system-ops.h, keep a
 pointer in CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210226164001.4102868-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <516603e7-d3ba-6958-41ec-ebcc52530d37@linaro.org>
Date: Sat, 27 Feb 2021 10:59:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226164001.4102868-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0/1dr+Igrhe

On 2/26/21 8:40 AM, Philippe Mathieu-Daudé wrote:
> +++ b/include/hw/core/cpu-system-ops.h
> @@ -0,0 +1,89 @@
> +/*
> + * CPU operations specific to system emulation
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef CPU_SYSTEM_OPS_H
> +#define CPU_SYSTEM_OPS_H

I think you should create this header from the start, so that you don't have to
move the structure later.

> +/* see cpu-system-ops.h */
> +struct CPUSystemOperations;

In the beginning, you'd actually #include the new header here, and in this
final patch you'd remove the include and insert the declaration.

>      /* when system emulation is not available, this pointer is NULL */
> -    struct CPUSystemOperations system_ops;
> +    struct CPUSystemOperations *system_ops;

Insert the comment here, since the structure can't be null.  ;-)
Also, const.

>      /* when TCG is not available, this pointer is NULL */
>      struct TCGCPUOps *tcg_ops;

The only reason this one isn't const is hw/mips/jazz.  And I'm very tempted to
hack around that one.

> +static struct CPUSystemOperations arm_sysemu_ops = {
> +    .vmsd = &vmstate_arm_cpu,
> +    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
> +    .asidx_from_attrs = arm_asidx_from_attrs,
> +    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
> +    .write_elf64_note = arm_cpu_write_elf64_note,
> +    .write_elf32_note = arm_cpu_write_elf32_note,
> +};

const.


r~
