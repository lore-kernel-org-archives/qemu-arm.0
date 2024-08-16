Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1158941njf;
        Fri, 16 Aug 2024 03:47:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7K8dJmK2e4ODAFnuXH/hOREf2ajKo9mot0u4SdouK02ZSQUiSAz/afTlNwjyG28x3sUTSiHPEwMooSg==@linaro.org
X-Google-Smtp-Source: AGHT+IFc+X2SmFwkZYmsVUb8tRHoyo+7FhsUwJduoWAn4CrsYS7vU9/9s2ax+TK55EWf2zwZha4W
X-Received: by 2002:a05:6359:459d:b0:1aa:d3b7:765c with SMTP id e5c5f4694b2df-1b3931be971mr297630355d.14.1723805279573;
        Fri, 16 Aug 2024 03:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723805279; cv=none;
        d=google.com; s=arc-20160816;
        b=JZQoqJ8ftTwGL0nKntAiG79F+nSKCekkT3nQC7OHqkA/b2ZKdisIB4ywZfiDkYwLuV
         LxeOlPx+OLu1T6SIU8Sx37ontK8znBwbhBQFNAUqdHkag51eMA2b55sJDsVvWFaeE/vz
         4nrbPMSq25tguR/UeCL88Y3S0EEBG7DsSWjHd7iKYn/eBEuSd+Kc24N5EJsVp7CEHjoC
         gl1Ts5JXfQCGwiw0lJcJMa0/l6i4XXRm2lf7mrFmXOpQwz1X4VKLsGVikPGbLIJwT7Sv
         0hjjju9z+KImV42ch4SOWZjwZszWVHjwJvUwPTOkYrx9gJbQ9baSS9Iy+IesqbDC3kx+
         kVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ruh/6FdaqlEUw7kKiWhA+IdMOIXJ4j/BnscKRu3IQVE=;
        fh=c0xBuGmIyHCRnFGkW5wYszgazgxx/L5OQQGcuNkI5r0=;
        b=Twgb8VnqTiPsvq8eQbqPPkCZKYmBYOY/mr1cUOUqqrg6xMNVGvWS3O9u9A/7RXIdME
         ELE+LcB2bzr7tT6z3ezZ1GxAYF5WJQuyh9yN6LLmlpbGIcg+riOch5jQQnUivoC/JxoV
         Rf1vrU/CFCKi+ATU06Qf8haC90JpPzs1Vp8s+KbebBQC0rvSBAAG4ZMRUn90jActP/mt
         /lItzQeNBXsI8CX+Jac0JeJ0rB0P9OEVSUSfeiFAIWTHw31kUQEla1MDGjBavqg25NT9
         tIR8/0mwGFP93e77FnmcFXyi3QGZPIZEg8BwTxksY6WbyYH0iUC1As+CGPijBwbaosWO
         QIFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFo3xZBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff111496si378452085a.599.2024.08.16.03.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 03:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFo3xZBy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seuUm-0002LE-SE; Fri, 16 Aug 2024 06:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1seuUh-00026x-AZ
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 06:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1seuUe-0007kS-Mb
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 06:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723805259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ruh/6FdaqlEUw7kKiWhA+IdMOIXJ4j/BnscKRu3IQVE=;
 b=RFo3xZByK/U04n1ndbm4piX94F59Qv6RMsXVksePawoMDnjjuNelJqPd8ch8G1mkYrAfNb
 1z2qhWcVyZcS/0+46EJmyON65UqvPeojA+He74fMTq/zeuVMETwb4YsHaVw3Yn5YdBd02t
 p5YavkDmjFl+AZhYkjIk6PGaphlQUMw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-q84_8tCqMuqc8KTJyOtXAQ-1; Fri,
 16 Aug 2024 06:47:34 -0400
X-MC-Unique: q84_8tCqMuqc8KTJyOtXAQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7AB71195421B; Fri, 16 Aug 2024 10:47:28 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.143])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CAB0D3001FE8; Fri, 16 Aug 2024 10:47:19 +0000 (UTC)
Date: Fri, 16 Aug 2024 11:47:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH for-9.2] hw: add compat machines for 9.2
Message-ID: <Zr8uNB8gaJTroMBU@redhat.com>
References: <20240816103723.2325982-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816103723.2325982-1-cohuck@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.131,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p1Vj8kJDxvdj

On Fri, Aug 16, 2024 at 12:37:23PM +0200, Cornelia Huck wrote:
> Add 9.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 15 ++++++++++++---
>  hw/i386/pc_q35.c           | 13 +++++++++++--
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 77 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index d9e69243b4a7..746bfe05d386 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -479,13 +479,24 @@ static void pc_i440fx_machine_options(MachineClass *m)
>                                       "Use a different south bridge than PIIX3");
>  }
>  
> -static void pc_i440fx_machine_9_1_options(MachineClass *m)
> +static void pc_i440fx_machine_9_2_options(MachineClass *m)
>  {
>      pc_i440fx_machine_options(m);
>      m->alias = "pc";
>      m->is_default = true;
>  }
>  
> +DEFINE_I440FX_MACHINE(9, 2);
> +
> +static void pc_i440fx_machine_9_1_options(MachineClass *m)
> +{
> +    pc_i440fx_machine_9_2_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_len);
> +    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(9, 1);
>  
>  static void pc_i440fx_machine_9_0_options(MachineClass *m)
> @@ -493,8 +504,6 @@ static void pc_i440fx_machine_9_0_options(MachineClass *m)
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>  
>      pc_i440fx_machine_9_1_options(m);
> -    m->alias = NULL;
> -    m->is_default = false;
>      m->smbios_memory_device_size = 16 * GiB;

Feels like we should be adding an "_AS_LATEST" macro
variant for piix/q35 too, so it matches the pattern
in other targets for handling alias & is_default.

Not a thing your patch needs todo though.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

