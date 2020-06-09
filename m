Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp382877lfc;
        Tue, 9 Jun 2020 04:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGePUDAIS56IEcQYlYWqvdrpXo/txMC3exI3syNZXEVHpN4ezSxnCXtutwrNGGpA/i2y0Y
X-Received: by 2002:a25:9a04:: with SMTP id x4mr5807513ybn.137.1591701189623;
        Tue, 09 Jun 2020 04:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591701189; cv=none;
        d=google.com; s=arc-20160816;
        b=lomWcbGfF9W6WQTHwcMxpOfhDnHU48/AMiFX/V7qAXDd/BlTP0QiKZVsj9H5LQSIb2
         oQh6dAdQAvcfuBBJJPhgbYk3h4au8dE2FDuJDIKBK0SwolgPo7PYOLdJ3rAV61hqchrR
         H1oyH+8iFAObbWsQmB6X7ApKV0da/aIIFBSrDzBkhSve/3dqaOrVFKaxXX4VqgkMwXho
         KE85D4rV11bmC9KjTEAXh/iwI0us6eiL8riwvlECkMM91eqWFA8ql6+fxaptU/I7B53/
         yguyu6gUhc8HPzUzz59/8OZa6YPaKtudbbFhHWbKvcE381EYAKUQEBLpGF0LmIv+Rl4+
         PCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
        b=XexPK8ArfrjD8+5OmBVNpTjHuTEdIZzPsxt26GRa9aKHrawXHMIp/fJxKf0um3KZI1
         +qNhNWlK0+yQCLeHtZR4D1+yrKjeSyEScOAy59mdb8CvGHPxN3fz8wQDLO5TrsrGls8P
         0rNwmfld5czW2IDvdlIeszdtFW79B6FNKKXshJi1D853tKSNmbMnngrZ8F1znveMvyos
         JXxjUBVh1Lf5MGhmZuE/MXlTEtBBR1PMNSJHbMH1F9DOJeruI+x9MIxUueFbcVmM5wvD
         kd3z2FPMQsc47aSupWVpCwLrBO6enzxc9Uls68FwQ/EESfmePOEA2FCD6kd5dY8pZTqQ
         11Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ReScn9fG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si2769617ybg.40.2020.06.09.04.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ReScn9fG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jicBo-0008AU-Vd
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBd-00089a-Co
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:12:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBc-0002D0-Ei
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
 b=ReScn9fGCSQAcQUTm9ZtAUSoGOOtFCAN6GZicEDktPej8tSZhiS/RIeu0MDLyKMZjkzMP9
 DsovJZkH4wRSmRmVpAYmTgq9/r+GY+/RoBRg2w+Vgps3nI/qzFKGH3q1jw/SUGXwnvOP66
 CL8tUV1NjD12g9OuwCqPZFy172zCIlM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-yrzyAxRSPdyrAmnHVI6Jzw-1; Tue, 09 Jun 2020 07:12:52 -0400
X-MC-Unique: yrzyAxRSPdyrAmnHVI6Jzw-1
Received: by mail-wm1-f71.google.com with SMTP id u15so527828wmm.5
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
 b=ETcJ4gvk9m1YX2YMQzN8PuvZhL2uyHRb40XeNVV8pw+JLOGm1T9jdCnhz3nFZTI7sr
 lf1xP0jkfgklpkBe7z/wMc0B16eSWdDptt1R3ZMapNvF4VTIivOUlcRTgyhF+Vu822Ym
 ekVJUAx55Od2RvY96Q21MISllc+pEuDSQhf1y/521R8cIPB6A9Gy38ws9Yntoc7I0WFm
 GLSJ38pvu9TMKxh2Qqyy5mPgY51ZaOMpMB16O9nScu1yVBWsoMXul5CTx9JFGQFBMLaC
 CZL0LOYGnzATZMwQAkWZ7lvWOI4XFNfez9yB7uDaEBd+0lLGO7hviBEfyTZI4nVaiteR
 2wpA==
X-Gm-Message-State: AOAM532WR3/55b6rdjEsctRe9aJGmeGdjRmbtUZzbuIEqu3dFI6VYmFt
 vaHP5BPWbIoZDZGwZ7Zz3zM7DzwPC+UeWKhr4B5rq2yG34IZtzG5zNEbAx4s+IhlJSv1urWX/L9
 s756AmjNS8CKi
X-Received: by 2002:a5d:6944:: with SMTP id r4mr3767005wrw.169.1591701170930; 
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
X-Received: by 2002:a5d:6944:: with SMTP id r4mr3766967wrw.169.1591701170664; 
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm2588369wmg.32.2020.06.09.04.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
Subject: Re: [RFC PATCH 27/35] hw/ppc/ppc: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-28-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <135e04f9-a2f4-b4d4-6689-83ae1f36d81c@redhat.com>
Date: Tue, 9 Jun 2020 13:12:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-28-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vs+kD8YzeQMy

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/ppc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 4a11fb1640..39fcf746c5 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -37,6 +37,7 @@
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  //#define PPC_DEBUG_IRQ
>  //#define PPC_DEBUG_TB
> @@ -1114,6 +1115,8 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>      PowerPCCPU *cpu = env_archcpu(env);
>      ppc_tb_t *tb_env;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      tb_env = g_malloc0(sizeof(ppc_tb_t));
>      env->tb_env = tb_env;
>      tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
> 

This one is okay.

Paolo

