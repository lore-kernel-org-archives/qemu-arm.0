Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp614918lfb;
        Wed, 20 May 2020 07:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwpUk9mJydbL2ll5rNNHHTBwY4z+EYFbvg+321YC4GHN3pKrYViuemJnMhJQGjj/Sz6u5g
X-Received: by 2002:a0c:9b99:: with SMTP id o25mr5099289qve.176.1589983685044;
        Wed, 20 May 2020 07:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589983685; cv=none;
        d=google.com; s=arc-20160816;
        b=SSMupiYD4ZM8lX554NkoqRasEKVXfkm2XsjNy/3n9L1vp+iCDNqEF9Ud32im6ivMUI
         Rdlaj1OwjPCtZzVnZovsW32l6sDAbkYeUtRF8lAz0V6hhyMnpIT0qS6Ry69KJeXtY5y4
         m3rhwiLUUMXNjvqe2z69swvWa5xN/u2n/ycCTSQOfr4WInslRzixaoTe8VirYNG+XzwC
         pqB2ptnX66W2ncTe0FPATLAvyHXSqaXni57y/avBnnd1Ktq5oTdsm7l92rldDLIqh3NC
         2xamczxXnWM6nObLF1QNUx4PsWJfgX4nqOvBFWLm1hj5AI3kM82FP5hQQr0ISRcLZ4xb
         G44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=YR2FoUY7vdTYcYyk7WUgvCbigEn6xSFvQxyQJ1F8nKM=;
        b=dwko/dLTlteuXWXcPnQOQNZJZVXbJ24RZ+eJNixGugChKsZAoyTPMqbk5jC4vjilaH
         fxXIFIqm2ilJeSDvx5UsoYnHPVuDQ7CR3VksR67eLJUgNMnONf3F9IXebAe4R4vVaNCv
         8jgAZSUga2suPUYQDqUK+2fdsc9r7ubHDPIJ97CN7xON7NqM/gzStc7umM1zFcHw1IhH
         zp2vxHrI3Eo9Xi90vovz26wFG/tS+B16NIPr6IWROs0JtXHwr2KRmMf0JLfhZxOnhvQT
         kJAF+K+savmE0NprgBWEXIjYoQYR1YQR5UT8CBQbpj8gRcRDDb49hK/U+3ZK4I8DKCsM
         1t3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=giVhBbG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si1585470qvx.22.2020.05.20.07.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 07:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=giVhBbG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbPO8-0003pC-H0
	for alex.bennee@linaro.org; Wed, 20 May 2020 10:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbPNP-0002mX-Nn
 for qemu-arm@nongnu.org; Wed, 20 May 2020 10:07:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60330
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbPNO-0002JC-N4
 for qemu-arm@nongnu.org; Wed, 20 May 2020 10:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589983637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YR2FoUY7vdTYcYyk7WUgvCbigEn6xSFvQxyQJ1F8nKM=;
 b=giVhBbG3J8MZEsfuSSMKgfgULNhSxS4mdIujHdJAkVZZV9iBbnw3KpDgClqZi1Y8TrH09a
 3UU8nyNIXmS1iI4Bd2C3d7OdyanwAYvHOOx798hDxj0M/5RRKUl77UK+pZSJHicPClHEsM
 cZpuJopp8DAKsP6ukCkAXwkZYcX88lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-XecUaje-NEa1nIv0VSSaIg-1; Wed, 20 May 2020 10:07:16 -0400
X-MC-Unique: XecUaje-NEa1nIv0VSSaIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C113835B40;
 Wed, 20 May 2020 14:07:15 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A13105D9CA;
 Wed, 20 May 2020 14:07:03 +0000 (UTC)
Date: Wed, 20 May 2020 16:07:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 13/22] x86: coldplug cpus
Message-ID: <20200520160701.2157aad0@redhat.com>
In-Reply-To: <20200520132003.9492-14-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-14-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:48:02
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiFCPWSHVKyd

On Wed, 20 May 2020 15:19:54 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> microvm needs this, for correct madt creation
> (make sure enable bit is set).
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/x86.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 7a3bc7ab6639..ac7a0a958781 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -118,6 +118,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
>  
>  void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      Object *cpu = NULL;
>      Error *local_err = NULL;
>  
> @@ -126,6 +127,16 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>      object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
>      object_property_set_bool(cpu, true, "realized", &local_err);
>  
> +    if (!mc->has_hotpluggable_cpus) {
> +        /* coldplug cpu */
> +        MachineState *ms = MACHINE(x86ms);
> +        int i = 0;
> +        while (ms->possible_cpus->cpus[i].arch_id != apic_id) {
> +            i++;
> +        }
> +        ms->possible_cpus->cpus[i].cpu = cpu;
> +    }

I'm thinking about removing x86_cpu_new alogether (in favor of device_add),
so I'd preffer avoid adding direct access to possible_cpus here.

that's the job of pc_cpu_plug (and possibly pc_cpu_pre_plug) in combination with
static const TypeInfo pc_machine_info = {
    .name = TYPE_PC_MACHINE,
...
    .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
         { }
    },
};

I'd reuse common code if possible in microvm or make microvm specific simplified version of it
if it makes job easier.

>      object_unref(cpu);
>      error_propagate(errp, local_err);
>  }

