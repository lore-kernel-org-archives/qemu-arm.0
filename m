Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3559556njb;
        Tue, 10 Dec 2024 11:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWspt86kZU/7HaVoZ2eVIamIrX7PvRi4UGKcxq1hczBxyhyAucTy1hiuk900L2S/78rko0BODJcptUqPg==@linaro.org
X-Received: by 2002:a05:600c:458b:b0:434:fdaf:af2d with SMTP id 5b1f17b1804b1-434fffd7bc0mr57207815e9.30.1733857544972;
        Tue, 10 Dec 2024 11:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733857544; cv=none;
        d=google.com; s=arc-20240605;
        b=lzVOJiABFeMHqg8MX9zARMHmVZO6PnaYUfVsgEzIzEw+0mFEbthmC+kyt13+HSUdt6
         IhSpQSolOmpsWqXagVtdOBhk+uGsHnICfBtEFrZIZ+MozczEMxr1v5t4Y+sYSshI7F/b
         yYytMfWK8McnvXZ5nwkNuUw0BwZl5u32/o10Vw+eI1PwFtcmZoaRD87O1w6djJ3Bq5/T
         HN5zBJ1bmYS1CS32ZUaAkMODMigYUV8PRgCA1T8oPKT7VhQyuWQQw0PWQuNw3uEdgEiB
         Qk8L8RsQQCN7/zXvDI+JtWesjbuYHM3Nm+y9oBitlFHCaHXHhGYZdYj75k+RDs5YCJvX
         qMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=FUhO7L73rAFYqnN487zaubYbkA7yCmNMZJD4kkzOVBk=;
        fh=R/adrWO5yCZjG49Khm6V16oDW5qZ6CxBEkzvmWb+Qkg=;
        b=TI7sf77PBDXuYG1+Zn39eY6hlJj12mA79hmu+rkipPPfVLZ7y2WRpWkA4XqD0qAb/a
         Bl/lhJuVEfx7B25Ye4Ex4/JdrYUJ6sKpSNHnjpZAZywPjNw63gOPUN9BaOhw0SzIUMx7
         61UstMszkqa/TzL9yP1mVIug/xgqmdzNe8PxYOK8JZgtqObJySuWzxjDhU4kBSPxav6N
         rhgdbxXo91ScS2dgWNrFbM3JFyw8zH62TLW5k/M2lrWSS0QlReIzDF9xQ0SskbBwHzUb
         EqWKMMpylRWMjtIwDVV7rPR1wUeDHv0dCXPBobZWiQtCt66oYyBONOl0OsPP0gsQqm9J
         NiPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNuQTfUh;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434e38a5ad8sor27598595e9.2.2024.12.10.11.05.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Dec 2024 11:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNuQTfUh;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733857544; x=1734462344; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FUhO7L73rAFYqnN487zaubYbkA7yCmNMZJD4kkzOVBk=;
        b=vNuQTfUhnoFEXi23zbIl4mgIS0E+kIMX1dYqC0MRFmQXVb0OMHtQSQWvNVEa/BCekV
         12V/QGnQVLG+Nf7q2TwYAtfYku9KxG3fvuf62Lyxlm80Bb1vSCwFPYKUws6bhgeFXIxh
         rbwaI+FFOi4ImfbAKR6OSW+lxrIJZMuuo92pxjAmH3GkMZ3OgEWB+QnjPCD7iFHmXUER
         HIu/ddPF1xLwMDdS3mFUAItZiy/byQWkKiJgxzt3c8snBA3B0JU+UahAZ1R6yusWCo7V
         +z5wBrJYkPa8de9nwwL4pB8XTlKjDaUe/5SMER2kx1+l8WhI0cvU7D/4k2W/veVEXaUL
         RZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733857544; x=1734462344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUhO7L73rAFYqnN487zaubYbkA7yCmNMZJD4kkzOVBk=;
        b=mTj/EiZUDigO1cm4A+BoOnurP2n4Zn4IhRICMSfY+LMNUVa0IViYF8qqLohm5qrrdo
         gpbpw8aoTFVvvTb7AEqmXfSu7fsjQAi4JiFWf4cTotRUHwyRb7j0NpE0oVyUDYSBepx2
         4e6Qy+ai1WWNqQ+cVyUF0clmjonoN53prZ2k3f418ZjjrZuEO0RsjG6lSSs9ods0QqHX
         C0OGNHLojkZTzosmRwQqYivz99XpDbLQuwshzWYDoRTJqOyEaaCkXTYBFH74kze4I3IT
         QXp7vEilzI2y6W69A6Bpj9chWJgwFs4q9O79qrQLLcUOTcr0V7VQGtEn6MuCdCJzOjPM
         b0KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+IajVlr8kppM8cBipXqUR7DlVCEx3olIWs0B7BA0DyQ70SqqtjQovfX76Eimoq0SUNxpL4gMrdJHahg==@linaro.org
X-Gm-Message-State: AOJu0Yysb01htEvA6E0cTYC7l0jTZQjlEz8+ornDM/b3rz3sbogR55sv
	0gjDUsSzAK3SaclRasoPiNo0GbN5Kh8uHv/Huh6jUlXmqZP6WkfF1z+WsBQe5dmUMQ==
X-Gm-Gg: ASbGnctM3rV5Hey941LU1ZiNFb/ZFuFZpUu8k/yo95bcgsu2AVIi0gNyXBe8KUobV+L
	Suu6LYq52MRklARELscBrkXOazzDMRkGfvv2+7toS7UB1FVElL+dI+t2gpNoX769mCoZn2900Tc
	5LXkqAFVFCGYr53FSaLZWFFBWj9dwkegHdy3il+mviR1VDQX4yyJT7rgEBrRHXFPIBEs0ff7CHp
	Aiv7cGm6l78qJDBxEF4PA+EXXaF+uZpItpFI8XtsT+yYkuxBJps
X-Google-Smtp-Source: AGHT+IGHP9NKXqyshDEEuDJaV+qjtNexC4Gg2BTqEvF5wXGD4PIunDPgrF0AHbA/f7v2BGg4H8Fakw==
X-Received: by 2002:a05:600c:1d01:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-434fff69fb9mr51023125e9.9.1733857544405;
        Tue, 10 Dec 2024 11:05:44 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da1133cesm204251025e9.34.2024.12.10.11.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:05:43 -0800 (PST)
Date: Tue, 10 Dec 2024 19:06:08 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 03/26] target/arm/kvm: Return immediately on error in
 kvm_arch_init()
Message-ID: <20241210190608.GC1212502@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-5-jean-philippe@linaro.org>
 <d130d7d2-acff-4dfe-97f7-346174fa079f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d130d7d2-acff-4dfe-97f7-346174fa079f@linaro.org>
X-TUID: QSvRipUqrZjv

On Thu, Dec 05, 2024 at 10:47:13PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Jean-Philippe,
> 
> On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> > Returning an error to kvm_init() is fatal anyway, no need to continue
> > the initialization.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   target/arm/kvm.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 8bdf4abeb6..95bcecf804 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -563,7 +563,7 @@ int kvm_arch_get_default_type(MachineState *ms)
> >   int kvm_arch_init(MachineState *ms, KVMState *s)
> >   {
> > -    int ret = 0;
> > +    int ret;
> 
> With your change we can reduce this variable scope ...
> 
> >       /* For ARM interrupt delivery is always asynchronous,
> >        * whether we are using an in-kernel VGIC or not.
> >        */
> > @@ -585,7 +585,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >           !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
> >           error_report("Using more than 256 vcpus requires a host kernel "
> >                        "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
> > -        ret = -EINVAL;
> > +        return -EINVAL;
> >       }
> >       if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
> > @@ -607,13 +607,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >               warn_report("Eager Page Split support not available");
> >           } else if (!(s->kvm_eager_split_size & sizes)) {
> >               error_report("Eager Page Split requested chunk size not valid");
> > -            ret = -EINVAL;
> > +            return -EINVAL;
> >           } else {
> >               ret = kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
> >                                       s->kvm_eager_split_size);
> 
> ... by declaring it here.

Ah right, but next patch immediately reuses ret:

@@ -627,7 +627,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);

-    return 0;
+    ret = kvm_arm_rme_init(ms);
+    if (ret) {
+        error_report("Failed to enable RME: %s", strerror(-ret));
+    }
+
+    return ret;
 }


> 
> Otherwise:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!

> 
> >               if (ret < 0) {
> >                   error_report("Enabling of Eager Page Split failed: %s",
> >                                strerror(-ret));
> > +                return ret;
> >               }
> >           }
> >       }
> > @@ -626,7 +627,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >       hw_breakpoints = g_array_sized_new(true, true,
> >                                          sizeof(HWBreakpoint), max_hw_bps);
> > -    return ret;
> > +    return 0;
> >   }
> >   unsigned long kvm_arch_vcpu_id(CPUState *cpu)
> 
