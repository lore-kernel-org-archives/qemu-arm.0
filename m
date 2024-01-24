Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp155341ejq;
        Wed, 24 Jan 2024 00:16:53 -0800 (PST)
X-Received: by 2002:a05:6512:1111:b0:50e:8696:1718 with SMTP id l17-20020a056512111100b0050e86961718mr4148702lfg.37.1706084213264;
        Wed, 24 Jan 2024 00:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706084213; cv=none;
        d=google.com; s=arc-20160816;
        b=nqQoLWPeiC1aGBQW26hP+ljjr65kvGaAa42bHp4IOL+JGt6Y7ogBOL7nboqmkMGr5M
         7KVRXRK0SCMs00zFPDRS9ct5EbHGwodFbhjKh/ixIolC3gyIsBkC5kPYbposcKdjE35K
         S1vX3B6c+g09GWZoq2hi3ngRYiAVpPL3x79oCtz0a2hNw3IwaoPsN8FyCpsJJi0THx5q
         KqR8rShGJAHVkFghy0X3QTR9IW9276PtGVX9Y3zYbxT4oestn/wfUKb1osqE/Gs4rjte
         68fZ+A5n+5twbVhu+IPNpQ15fUGNGsdlWgQKrqf2W+28cb82GMBjQdTUVRxWmp9Cks1+
         LnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9sXg36sUep+N61vSnj8FOK4eOgfj23LfuaYjihRPx9s=;
        fh=LZyHTHN6NX8/7mmal1FYxKQYiLBu4R15O2wo33y2D7M=;
        b=bG8dKjSenTUEDvP1Lixc/zOHPQf6Vow38xrGHHwsk0SSgL/ZmkuShS0va/VRcNjRzA
         nhZFTJiEf1FFQuY4OfR4Y9QK6DFfpbIj1ZfbaKkM77Cf+ZxVOud5GW6ix2bJJ9/d8X3y
         +M19moiBK0EAMFI1AhNVoPWf5nam5bhM4GF78YPkUyw1ZP1Zeqb86YDlxy6JQUawGQFN
         AOkbszy+PSnhhrlMeXAVCz19s/WL5klpAiBhAky4XX8ZKDgnUJV1FBwVeTk4hAxILAqt
         qh3/9+og5MEjbrS+qB8b5HY6/6Baw+IkTAmuUlFV2f/uRuRHZXj0kiCCfg2OrklmGil5
         BDVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="mpffrPF/";
       spf=pass (google.com: domain of ajones@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajones@ventanamicro.com
Return-Path: <ajones@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i5-20020a1709061cc500b00a2d7fae0beasor3683803ejh.15.2024.01.24.00.16.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 24 Jan 2024 00:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of ajones@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="mpffrPF/";
       spf=pass (google.com: domain of ajones@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajones@ventanamicro.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706084213; x=1706689013; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9sXg36sUep+N61vSnj8FOK4eOgfj23LfuaYjihRPx9s=;
        b=mpffrPF/gD1UUPXv1sbyg/zbAylx6oaMsAeFOAv3640K7BE++ym04JkpSRYNMfrQy4
         jiaxmCXqu8nVNPUlUdCib90Zk3AZrhblkNyj4hz+qGxxsHzQ0a1W0C4wxlREls6U7hi4
         QD5h8G9NQUK1xUn3si+FUVEoigUYvradhRLZHdJIWVbBb5y3Q91vm1QkW2DSk6t6csc0
         JgkbjotHYBWnZrZVcH306m8+9uZ6WKggbzlqpfer7TvnAMd+5qp0TXl9/0zOY6bF4DyS
         Ra0RQLSHxjArPIM4l32lfDq0Io+fUd8jKtc3fSrrP8+MPWV6p/O+wVgXyCgYGZiTv7R1
         tUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084213; x=1706689013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sXg36sUep+N61vSnj8FOK4eOgfj23LfuaYjihRPx9s=;
        b=FMmdjDEQVObqYsl3M6jPMBhOVLPuZBxbp+buNPUpSEWp+DfGmUSzsgHufK5ay3/Lbk
         k9dCBI+/D1xQyCC0w1IYIned3s7+2QYC/+yWCnHucPNOr8QMu7JIWQCa0bzscBgI9FeU
         c+A8l1JKbNAr/ceUpp4Fuejb0zNpM36QfKSTZ41uG/iS+3bqowb6zM8hjcLdWlY5bTjk
         6UfL3mun40XF7UTdv4ID+3ZBt9f/r2n7Soi8Ubuu70U6p7LbobANaz6ytbdE2yaAI2eb
         sxbVZykELuJ54xIYFPS+Cs1zFsi8hWSNRytwzc30vHBe45QZliVak8jvJBdqu2BiXbhw
         BH2g==
X-Gm-Message-State: AOJu0YwRi2YXzJWNztz9qB2+droRCjGkr/BnyK35WtxjooKkkzIY1o2g
	5mR8mjewXL1IUVElB9VoNezPTtlebWeRJnjhVlzn4AqH8XTLL2UTj9Gl2UHzC9M=
X-Google-Smtp-Source: AGHT+IGDg1ZQqdXZKs3GCQc5JFbRDXhgLr6ZlGiNbTZRR/B1PaEq7yGPv5awPONM0W1s3+iCwea/Kw==
X-Received: by 2002:a17:906:9c91:b0:a31:2905:5dca with SMTP id fj17-20020a1709069c9100b00a3129055dcamr247199ejc.53.1706084212585;
        Wed, 24 Jan 2024 00:16:52 -0800 (PST)
Return-Path: <ajones@ventanamicro.com>
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id mn6-20020a1709077b0600b00a2ccddf9a7dsm13874643ejc.124.2024.01.24.00.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 00:16:52 -0800 (PST)
Date: Wed, 24 Jan 2024 09:16:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Michael Rolnik <mrolnik@gmail.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier <laurent@vivier.eu>, 
	Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>, 
	qemu-s390x@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	John Snow <jsnow@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alistair Francis <alistair.francis@wdc.com>, 
	David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Bin Meng <bin.meng@windriver.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Thomas Huth <thuth@redhat.com>, 
	David Hildenbrand <david@redhat.com>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>, Paul Durrant <paul@xen.org>
Subject: Re: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of
 misa_mxl_max
Message-ID: <20240124-3d9bec68bff7ab0057b902b6@orel>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-2-alex.bennee@linaro.org>
 <20240123-b8d1c55688885bfc9125c42b@orel>
 <15d2f958-a51e-4b87-9a70-28edf3b55491@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15d2f958-a51e-4b87-9a70-28edf3b55491@daynix.com>
X-TUID: cCYTUoMadPVc

On Wed, Jan 24, 2024 at 12:08:33PM +0900, Akihiko Odaki wrote:
> On 2024/01/23 17:20, Andrew Jones wrote:
> > On Mon, Jan 22, 2024 at 02:55:50PM +0000, Alex Bennée wrote:
> > > From: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > 
> > > The effective MXL value matters when booting.
> > 
> > I'd prefer this commit message get some elaboration. riscv_is_32bit()
> > is used in a variety of contexts, some where it should be reporting
> > the max misa.mxl. However, when used for booting an S-mode kernel it
> > should indeed report the effective mxl. I think we're fine with the
> > change, though, because at init and on reset the effective mxl is set
> > to the max mxl, so, in those contexts, where riscv_is_32bit() should
> > be reporting the max, it does.
> > 
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
> > > Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
> > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > ---
> > >   hw/riscv/boot.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > index 0ffca05189f..bc67c0bd189 100644
> > > --- a/hw/riscv/boot.c
> > > +++ b/hw/riscv/boot.c
> > > @@ -36,7 +36,7 @@
> > >   bool riscv_is_32bit(RISCVHartArrayState *harts)
> > >   {
> > > -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
> > > +    return harts->harts[0].env.misa_mxl == MXL_RV32;
> > >   }
> > 
> > Assuming everyone agrees with what I've written above, then maybe we
> > should write something similar in a comment above this function.
> > 
> > Thanks,
> > drew
> 
> The corresponding commit in my series has a more elaborated message:
> https://patchew.org/QEMU/20240115-riscv-v9-0-ff171e1aedc8@daynix.com/20240115-riscv-v9-1-ff171e1aedc8@daynix.com/

I've pulled the message from that link and quoted it below

> A later commit requires one extra step to retrieve misa_mxl_max. As
> misa_mxl is semantically more correct and does not need such a extra
> step, refer to misa_mxl instead. Below is the explanation why misa_mxl
> is more semantically correct to refer to than misa_mxl_max in this case.
> 
> Currently misa_mxl always equals to misa_mxl_max so it does not matter

That's true, but I think that's due to a bug in write_misa(), which
shouldn't be masking val with the extension mask until mxl has been
extracted.

> which of misa_mxl or misa_mxl_max to refer to. However, it is possible
> to have different values for misa_mxl and misa_mxl_max if QEMU gains a
> new feature to load a RV32 kernel on a RV64 system, for example. For
> such a behavior, the real system will need the firmware to switch MXL to
> RV32, and if QEMU implements the same behavior, mxl will represent the
> MXL that corresponds to the kernel being loaded. Therefore, it is more
> appropriate to refer to mxl instead of misa_mxl_max when
> misa_mxl != misa_mxl_max.

Right, but that doesn't say anything more than the original one line,
"The effective MXL value matters when booting."

What I'm looking for is a code comment explaining how riscv_is_32bit()
is always safe to use. Something like

 /*
  * Checking the effective mxl is always correct, because the effective
  * mxl will be equal to the max mxl at initialization and also on reset,
  * which are the times when it should check the maximum mxl. Later, if
  * firmware writes misa with a smaller mxl, then that mxl should be
  * used in checks.
  */

Thanks,
drew
