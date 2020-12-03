Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp74646lfb;
        Wed, 2 Dec 2020 21:21:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQNTCbHkp0wQwD6A2sB/3F6wqH/vv49E8bjOYbncgnp8Jhh0wdyAikLth8TWXRiVRC/VAm
X-Received: by 2002:a25:51c7:: with SMTP id f190mr2166190ybb.299.1606972912653;
        Wed, 02 Dec 2020 21:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606972912; cv=none;
        d=google.com; s=arc-20160816;
        b=tfS2mAnDkgAQ2W29CUXQRYviFu6n3astCtrPFN26Iw/T57Qc72f4AgB/73MZGKsxv8
         uOZc1OhUZ6chtYutm6E/nSeYQMlAeCqr5WRlEegXReDqGN40USJSbEQLAKFGMqIZgb9c
         CCdG4UyttaPZZEPNIetJC2SHfCTCGNsGUEehFS04DYTssqA68CyzrjoZTJwgOBEQ/GfV
         GvniN5ZUkeuVHTlok8q/opH1om8avaOQEdMhI8Ge9AVg8u3TlVVlM3ZEiXiMSuaqwgeU
         V26saiYvpfZQxAN8YG/u7uHpPgn0T688+tTLX741Dej7BrW5NUPLtMzslLMc24sbtybu
         KpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=j85v3f3WuOOAnqOIeSmBzKhMUbdsH58BHMOYUFBTGic=;
        b=KM0Xc/5CiI+PP6WGv8lnskxW4sCJ//28uxjSkWq4ADG5iOkUuyrEzD6RDZ0OqqDW8I
         Guwfa37adb2HR9MaV//OXG5l8qyqtq4JjkMK1r6Q8qBs3yPD79IVVMaQDkg6gGT8HgNw
         yMB+uPhFvrwI7xDH/yu3otcyTb4OuPPS55CDoRXRGMrDxmKuyiISI1tyG6lLGQuqLs6N
         kJX/78e5MOKTQAJkVvFd+5tvNpZA8+mhlUDdEonYzNKhElvikizOZs6cxY4/PmqzQKAJ
         c0qLzf/mR1iTmzOW5T4Lu3rl79kgtf9T4jWv3u4r3lfMa9nYcOn0wjknJGcgamXwTuTu
         HDbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=klHVuNPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a130si802611ybg.311.2020.12.02.21.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 21:21:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=klHVuNPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkh3w-0003rQ-0m
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 00:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkh3o-0003qC-8Q; Thu, 03 Dec 2020 00:21:44 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:40240 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkh3m-0004WZ-4M; Thu, 03 Dec 2020 00:21:43 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 513BF41399;
 Thu,  3 Dec 2020 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606972898;
 x=1608787299; bh=wIO0hsxD/P4OaCBVPUL7KLcbATbSClMtKE7F9HL0UXw=; b=
 klHVuNPJfofPfhUmgAKrLsfS+gmWBwtL3vMtz9x+VFX8sZH0BoOc3T4hxcFU2prx
 +mI0pb1SDXtSucjU/M71tfPCzy48KWqvl6d5aUW0cfvNltt5khC3+XNz5mzMSoKs
 N/gGAMzugZaxyntxtM+uBYzQuVKPfddYrruY69u+QnU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hByQXijqV84N; Thu,  3 Dec 2020 08:21:38 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B46DA413BD;
 Thu,  3 Dec 2020 08:21:37 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 08:21:37 +0300
Date: Thu, 3 Dec 2020 08:21:56 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 06/10] hvf: Add Apple Silicon support
Message-ID: <20201203052156.GB82480@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-7-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-7-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /VqVV0waqRX5

On Wed, Dec 02, 2020 at 08:04:04PM +0100, Alexander Graf wrote:
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
> 
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
> 

That's very cool, Alex!

>
> [...]
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index a423f629d5..e613c22ad0 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -60,6 +60,10 @@
>  
>  #include <Hypervisor/Hypervisor.h>
>  

On an older laptop with 10.15 I've noticed this causes a build failure.
Here's layout of Hypervisor.framework on 10.15:

 Hypervisor.framework find .
 .
 ./Versions
 ./Versions/A
 ./Versions/A/Hypervisor.tbd
 ./Versions/A/Headers
 ./Versions/A/Headers/hv_arch_vmx.h
 ./Versions/A/Headers/hv_error.h
 ./Versions/A/Headers/hv_types.h
 ./Versions/A/Headers/hv.h
 ./Versions/A/Headers/hv_arch_x86.h
 ./Versions/A/Headers/hv_vmx.h
 ./Versions/Current
 ./module.map
 ./Hypervisor.tbd
 ./Headers

The issue also exists in another patch in the series:
  "hvf: Move common code out"

> +#ifdef __aarch64__
> +#define HV_VM_DEFAULT NULL
> +#endif
> +

I don't see if it's used anywhere.

>  /* Memory slots */
>  
>  struct mac_slot {
> [...]
>

Side question. I have very little knowledge of ARM but it seems much
leaner compared to x86 trap/emulation layer. Is it a consequence of
load/store architecture and it's expected to be that small on ARM?

I have only noticed MMIO, system registers (access to them apparently
leads to a trap), kick and PSCI traps (which sounds somewhat similar to
Intel MPSpec/APIC) and no system instruction traps (except WFI in the
next patch).

Thanks,
Roman
