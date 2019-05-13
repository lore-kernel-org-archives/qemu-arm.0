Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3142377wrg;
        Mon, 13 May 2019 11:33:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzo1kKqnHTnrHehvDqeLBY+MooU4JTznjjD+wbP/FgWYVCAtGmxhv3F5DHEN0vAJbtVMmIA
X-Received: by 2002:a0c:c3d0:: with SMTP id p16mr24134976qvi.229.1557772415170;
        Mon, 13 May 2019 11:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557772415; cv=none;
        d=google.com; s=arc-20160816;
        b=zGRuKzl8VPs8WTbT9EYIg9W4MU89vvYGRXEdiPF7emecUNZFd34O1M0O0wnP4pOYxE
         00zDG2Ty5fSrrXOuF0j3bwLMzRttOflqkuVpyCmwXDVxI/vW4anrMSmewNCp3VsJ5v4D
         sXb/0m6GBPhSqg4yH5Ft3cQN2l4c7L421ThipKrowDYDX0l3G26/u2tDnkFDiAshMiQW
         Su4AYg4Jbj/ucZJv6Uqb66C81+2alpmhUb2kR7Z33+qXaqwMInAcCsleehtSrXNuyrhR
         qc741O+gevaS6HTcNlb/i/nEInQsttf/Am/eJozjApBnnq9EnXPyAaiyoH9OrRphFmJF
         IUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=d0MJsI/oQb6T1gDnDRwf3ovSJvU7HwYFVMIviXX8ekw=;
        b=QMxB9PO4vz7wySXvDwBTS4Ptcna0ZMvoBh1b4BscVOjc8zp1gwVZ2kWDUCXkZh2qMw
         VXB7ypQ/LrEsKx6jTiyeBTJrZKZlohRQRaU7aoUr56ATBOHd/JO7i5h2iutR2Rsw4mnt
         O/GTzSJQoL4MS9fcQ0QU4CeCLe2QPDR3j+Qce+RqnAgtGOUu/Buc4y8GAsT5+GGJyY8Z
         J2DrL6Hs6aps81JdfwbD5XnM32/QkpukT1W3uLvMOrKPBu+4Um2/jGbYrwgJ9MXCUNPg
         PwIlxIa2DSGE4T+luNXvF+KvY+5RpDNzkJW85vDvFLwcsA/V90T9Wx1wC/1L7sk+04KS
         MyZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z2si1397030qve.196.2019.05.13.11.33.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 11:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 398CFC0568FE;
	Mon, 13 May 2019 18:33:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BA2A9060;
	Mon, 13 May 2019 18:33:31 +0000 (UTC)
Date: Mon, 13 May 2019 20:33:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, abologna@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 13/13] target/arm/kvm: host cpu: Add support
 for sve-vls-map
Message-ID: <20190513183328.vhhi5ikyg3r5hpiw@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-14-drjones@redhat.com>
 <87tvdye57e.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tvdye57e.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 13 May 2019 18:33:34 +0000 (UTC)
X-TUID: 7yb0jVnT3pzB

On Mon, May 13, 2019 at 05:37:09PM +0200, Markus Armbruster wrote:
> Andrew Jones <drjones@redhat.com> writes:
> 
> > Allow the host cpu type to enable SVE in guests with the sve-vls-map
> > cpu property.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.c   |  1 +
> >  target/arm/cpu.h   |  2 ++
> >  target/arm/cpu64.c | 12 +++++++++---
> >  3 files changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index ea0e24bba8b6..a5c01ff42c78 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2222,6 +2222,7 @@ static void arm_host_initfn(Object *obj)
> >      ARMCPU *cpu = ARM_CPU(obj);
> >  
> >      kvm_arm_set_cpu_features_from_host(cpu);
> > +    aarch64_add_sve_vls_map_property(obj);
> >      arm_cpu_post_init(obj);
> >  }
> >  
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index f0d0ce759ba8..13731ccb39f3 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -976,11 +976,13 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> >  void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> >  void aarch64_sve_change_el(CPUARMState *env, int old_el,
> >                             int new_el, bool el0_a64);
> > +void aarch64_add_sve_vls_map_property(Object *obj);
> >  #else
> >  static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
> >  static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> >                                           int n, bool a)
> >  { }
> > +void aarch64_add_sve_vls_map_property(Object *obj) { }
> 
> qemu/target/arm/cpu.h:985:6: error: no previous prototype for ‘aarch64_add_sve_vls_map_property’ [-Werror=missing-prototypes]
>  void aarch64_add_sve_vls_map_property(Object *obj) { }
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Did you forget static inline?

I sure did. Thanks for finding this!

drew

> 
> >  #endif
> >  
> >  target_ulong do_arm_semihosting(CPUARMState *env);
> [...]
