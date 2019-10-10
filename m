Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1623898wrm;
        Wed, 9 Oct 2019 17:50:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOwaIwzf2eeth6VtOJrJcd4ciGP5TuB/f5Wb6Rr8F3fP4+ms2zKZY41CF3uDqHG51Sm9Yi
X-Received: by 2002:a17:906:28ce:: with SMTP id p14mr5604558ejd.164.1570668623510;
        Wed, 09 Oct 2019 17:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570668623; cv=none;
        d=google.com; s=arc-20160816;
        b=XvVT60zoyUA4EXibqWjSHB/FVUNmt4KgE7C4IRIqOndwCBNMcqM51+ACb/UTfZUo3I
         TRjgVY+OUzo3+WGEyDfkNVkNEZh2z0N+/AsrbYeBzWhtnvL7gfqc8ymAdqgUicMusf8t
         KNGjJXO4IfZzrWjagLgTqXsbcNfLZnvVQyT/tfumjfVKBpp/clpgOLYeFjVcF+/EALpr
         AqAWvwPYEgzVICQ5MLbbnfWL+MeA5XtVJAK6rANEESkcsIFpSrgqrONpC+ZHEZi8n0ZK
         Mnes9dkKEAuxsxhDwnQVF1gtL4sZNgyDQ65f2aPa/UmjEL9FHXSo20EHuKSicPyXuDWp
         aLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=TyY81SRlFFLzBC8zGurA01QzhPfmOfze6LH6hXxOGHI=;
        b=RzBdDcGW2nXXlEm3Cqi0ekOyKnoI+yI7v/n6Xw+IfZhcXMHA0MFEbcDf16bDX3+gL+
         Uf/sr/Ay2pYiAgqYtK8JDXCkT1xTW8vhtSclsLXGSJDZfyA29TEMEgV4ZZuMOzxKgwGX
         hMkypPejm+cMKPxFvJ5OV6Ot1sN9MLHDdV60xYxvcw6ji3eHxEwsLZOs495VV1K6zM3C
         cafblBCzICOfMSuU7stGyf6gAdRS4YFPnf7fLBlj6K285tqxS7Jl9aFur86rPf4r95D0
         1ThGCgbsjlrSbpcuMIentmbxV9grpNT2qHdV3wuP6NMBaMtBS5VFAitBAHBQPWsjuzQL
         gWaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfuaHf1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26si1521362ejl.292.2019.10.09.17.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 17:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfuaHf1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMes-0004Fb-IY
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 20:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47265)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMed-0004F3-7C
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMec-0005Hm-6U
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:50:07 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:36366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMec-0005HT-0n
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:50:06 -0400
Received: by mail-yw1-xc41.google.com with SMTP id x64so1536870ywg.3
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 17:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TyY81SRlFFLzBC8zGurA01QzhPfmOfze6LH6hXxOGHI=;
 b=MfuaHf1YPszzjHTmkJZkVn5DhaN3+67xPHWEiIHvMrY55Hi+Xq1g/0Kdrbf3N3ZH/j
 0HtTgjqB5EzZMfVeefycG0VKg0eP3k+JXa9xyTGoLUNuQ5Bd84/uXXR0IOA1qAmFn7GR
 12pDGtQ2muwhVmqA/6Loozfuv3acKBHYYgPRmfqgHKLr8GQtZVpaZEW3YY3TQzluBQ1T
 brI7ggslO3AeLY6bftFFpPdqLPtvtAhuBt2T+zUXBzU1v522JK78pVDxPrMthpU33mxM
 IdEk7TElWa2stX+w5KCeaizhqURV/uLITWlB6npmEBMX7WJg7cMx4gCRT7xF3l2fpBY6
 jxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TyY81SRlFFLzBC8zGurA01QzhPfmOfze6LH6hXxOGHI=;
 b=jdnNGZiaii+GhGUFEAPHuHsInV3IcqXZqCgHkBKihXUZr+aAe7HqMcES8ocP/L469S
 4MCH6E0jF/t5L1u1b5qs3elPogOsC8VBVX1BYxfTWyvaaK+M5zieeuI3Io8SdOUQv5NJ
 C4BZnuRQOMOIqkxIWx+7juDMaTUVHl2y3vGDWL+yICmOsnBYERBefIoB3CJ4wqDcKjIT
 z1ZUItPXFmhAS8/qOhe/1wQ25KcDoV8X/4GNqPnKhrWW2fDug0ZlIsF7IU8SBhHU74Ir
 JHYP9oPO7EYBWvXvSs9RZhwVRFAgdlcwkOZspLjDWmuhrFiIZSDf/7rGkiE8VeXr4BBR
 +6uw==
X-Gm-Message-State: APjAAAXHYzvWQhf7xgKli5kggFmx8vl6EyGk77lOqkZoE3quwVGSK0FL
 QGRAqSO2jIUnMWDmE8JzO9wKtA==
X-Received: by 2002:a81:1058:: with SMTP id 85mr4794026ywq.110.1570668605317; 
 Wed, 09 Oct 2019 17:50:05 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id 12sm1070482ywu.59.2019.10.09.17.50.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:50:04 -0700 (PDT)
Subject: Re: [RFC PATCH 3/5] target/arm/kvm: Implement cpu feature kvm-adjvtime
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-4-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <892976b9-0e43-940d-1d36-046749d652c9@linaro.org>
Date: Wed, 9 Oct 2019 20:50:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007170622.1814-4-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NspzPvzsY9Wo

On 10/7/19 1:06 PM, Andrew Jones wrote:
> +static void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
> +{
> +    CPUState *cs = opaque;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (running) {
> +        if (cpu->kvm_adjvtime) {
> +            kvm_arm_set_virtual_time(cs);
> +        }
> +    }
> +}

Worth putting this in kvm.c too, so you don't have to duplicate it?  You can
always split it apart later if you ever do need a different hook for 32 vs 64.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
