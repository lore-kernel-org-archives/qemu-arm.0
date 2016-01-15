Received: by 10.25.159.19 with SMTP id i19csp537856lfe;
        Fri, 15 Jan 2016 07:37:47 -0800 (PST)
X-Received: by 10.98.69.209 with SMTP id n78mr15436832pfi.81.1452872265415;
        Fri, 15 Jan 2016 07:37:45 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com. [2607:f8b0:400e:c00::241])
        by mx.google.com with ESMTPS id y22si17162303pfi.57.2016.01.15.07.37.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 07:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) client-ip=2607:f8b0:400e:c00::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x241.google.com with SMTP id n128so8649644pfn.3;
        Fri, 15 Jan 2016 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=ynGl3SzSPJv5qHEZSLdj8DrZ6R0ItoRRZeg3xgM5t4k=;
        b=dGUMI5jgXZ3msqb3Ecp4Pgvi/UqLgb+8jbuQlaUjIhZT14hKepub5dxZuw/mXVnwV3
         Q198Iizi5bMDRTX8xaNIp+rlNUgCiQ9B70Ysf5Rh0uGx8rjXQplvJHeCnDxIGIVrkxR/
         P7gHMTbQ7cGjLVdvPF5oJyje43xNg/TcMHPXmcDngZ8lKXPAgBKZYzevz5iu0CwDUyPx
         ZNhQS9e86+DdNeMqzOsj8LelMp30h9yByy9C0N3uxYg48J3DEozCbwVdxQvW29Ije0jG
         uSobJ6DNVYt916DIiUgMlIhMkXrDEM26fA+tgWBrXmA3ZvSJFvYxcayP2ALQ9+lrGCmL
         YHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=ynGl3SzSPJv5qHEZSLdj8DrZ6R0ItoRRZeg3xgM5t4k=;
        b=AmLLsRoZMFp17LILd8vl+jmfGlRqfVxrII7kXsF3AosQLrsK7GWswGNMNws13hC22b
         POiwXn3VSPXpOSpmRyK1S0gNqhNxljRVQJiKKievGxLpo7ELeM3HhvK1sJJA62DRS/EI
         NiPiMVH44Jb1FnUUSLjDayS9f8sApqkW568sp8u2oCaL3+i5/JwK0F1VoMfkAJOhUwhS
         AHoJqDCyD0cvqbGDmgFFTF/a1nxgc5sCbnpfpXFNsGzikKc4eIO6PQBt2ZkBclu8Sn6O
         NEg8mWMmQrGU8HaNmK+KdERq5Oq3xf6jLwjO0I9Kh9gvVps06m2dFk/dgx2RXXaBIXoX
         6+Pg==
X-Gm-Message-State: ALoCoQmKlrea0gsuaIhEjGYdN1VZoie4iYUMqW+Y97sYGvJZ1lmuqvJcenXepeN4vHDluEHmPq4z2hM1PnRxuqBq41sxUVcq2g==
X-Received: by 10.98.44.66 with SMTP id s63mr15887856pfs.2.1452872265099;
        Fri, 15 Jan 2016 07:37:45 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id m75sm16327605pfj.38.2016.01.15.07.37.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 07:37:44 -0800 (PST)
Date: Fri, 15 Jan 2016 16:37:37 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/8] target-arm: Properly support EL2 and EL3 in
 arm_el_is_aa64()
Message-ID: <20160115153737.GL29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
 <20160115143836.GI29396@toto>
 <CAFEAcA_GkZNcXTHLN_rb1Tdi=sUSgxK07abZsOu59Ogbx-uqGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_GkZNcXTHLN_rb1Tdi=sUSgxK07abZsOu59Ogbx-uqGQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: VeNRIcaSvewX

On Fri, Jan 15, 2016 at 02:50:24PM +0000, Peter Maydell wrote:
> On 15 January 2016 at 14:38, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Thu, Jan 14, 2016 at 06:34:04PM +0000, Peter Maydell wrote:
> >> Support EL2 and EL3 in arm_el_is_aa64() by implementing the
> >> logic for checking the SCR_EL3 and HCR_EL2 register-width bits
> >> as appropriate to determine the register width of lower exception
> >> levels.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > Hi Peter,
> >
> > On the ZynqMP we've got the Cortex-A53 EL3 RW configurable at reset
> > time. At some later point we'll likely have to implement that
> > runtime option...
> 
> That might be tricky, we fairly well bake in "AARCH64 feature means
> 64-bit highest EL" at the moment. The KVM code takes the approach
> of "if it's not going to reset in AArch64 then unset the feature bit".
> 
> Anyway, we'll cross that bridge when we get to it.
> 
> Do you have much locally extra that you needed for enabling
> EL3 in the Cortex-A53? I have an ARM Trusted Firmware + OP-TEE
> setup now that I'm going to use to work through the missing bits,
> but if you've already gone through that effort there's no need
> my duplicating work...

I don't have anything immediate for EL3 beyond enabling it and some
boot thing for a15/aarch32 to allow me to run my tests. I haven't
really looked at the boot in detail for aa32 so I haven't bothered
submitting it. This is it:

commit b30c7102624241a67ebb2d3df70e88a4148f68a4
Author: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Date:   Sun Sep 13 09:52:01 2015 +0200

    target-arm: Start EL3 capable ARMv7 cores in MON mode
    
    Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index f6f5539..485965f 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -164,6 +164,9 @@ static void arm_cpu_reset(CPUState *s)
 #else
     /* SVC mode with interrupts disabled.  */
     env->uncached_cpsr = ARM_CPU_MODE_SVC;
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        env->uncached_cpsr = ARM_CPU_MODE_MON;
+    }
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
     /* On ARMv7-M the CPSR_I is the value of the PRIMASK register, and is
      * clear at reset. Initial SP and PC are loaded from ROM.
