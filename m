Received: by 2002:a05:7022:f409:b0:6e:5a56:ff6c with SMTP id rj9csp591936dlb;
        Thu, 26 Oct 2023 05:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqlF7qPz4vlj69MgwT33DzVs287hZLIHuvGGyrOi0LHOo5HNF4vjJ0ZTTzFjkDjYjpdmDz
X-Received: by 2002:a05:6512:318b:b0:508:1a4c:b9b8 with SMTP id i11-20020a056512318b00b005081a4cb9b8mr3600335lfe.36.1698323604958;
        Thu, 26 Oct 2023 05:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698323604; cv=none;
        d=google.com; s=arc-20160816;
        b=YSFl4GqMZ/Dr2SVVWmip25tKwIE3SYlNI2Db0BOeQORDW8Ly+6+cLiQP/13pECL8yt
         KYcy1FW5dNk/lWi4fF94T7EEK6YuijFhP7E1bviiF/h3G1/xWu30Egb6Zx6Zxhf3mEfc
         VPDdEMXjMwz34zCAWmBF14Llf4THf+l2vWzRYEF5PxPvGrpXX5mIibNVUx9Rvrwivwj3
         i7Qd30MXz3Mv8xVb68J+yDoxw8ANlVsIMhhrSRB6SBUylhwTo6J9r8nES4cA1zAABhjT
         jkEIeoQaEDk057hkKaLz94DgaBfpVZ9Gylqhq8+tNkkbWNn/vKCqqJ5IK+WhG4oDdLAL
         ioYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=e+5c+7/hWqqP2V740qpPrOLE20Hrf2rzE26Q7mOJnQ0=;
        fh=wmdDFz7sClSgoMf/DYnZ2QnofyXdTEqO9UUvIaMsBVY=;
        b=DOFUjWUAhhU2+YiRsOsfMP0S69yrO00rbyUk8LKll+KJWRk3wnPS3oknzkK4/jPdiX
         fU+tZUSzxS+k1nr/yY8KBuP/tvT1YAm3xKBh9prLN/Vzg2qRXn++xhz6oiczgIGVgaI/
         kdlYJvUZVeazuckyC+zZJWgA4Sz/H6hS1+pQF7h++6URthhdYXCoUa6ls3oQ4QJkV9sP
         Hs9nCBR135bI9btlDQ68NOZTun+Am4WQVfWxsqd+dHLF36OGVkglPG6xzfuGO261bwAa
         wdLQDgR7OyO9S+f/F69j3SaPLSPB8vgxNIMqv9VWBBYm6OdAqefzG65Pu4nic2eKS5sp
         Qo/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=exv6zufd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a5d5243000000b0032dbdbdc10bsi9059661wrc.543.2023.10.26.05.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 05:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=exv6zufd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvzY4-000661-Mq; Thu, 26 Oct 2023 08:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvzY3-00065c-Ee
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 08:33:15 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvzY1-0000b7-LN
 for qemu-arm@nongnu.org; Thu, 26 Oct 2023 08:33:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-27e4e41a4fcso678916a91.3
 for <qemu-arm@nongnu.org>; Thu, 26 Oct 2023 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698323592; x=1698928392; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e+5c+7/hWqqP2V740qpPrOLE20Hrf2rzE26Q7mOJnQ0=;
 b=exv6zufdfc65HM2nmxJxkm6JXdc+YTs5N8rsw+jxV1R+5Xw72xi6w8VSfVLbWXVCb+
 mdVfGDXVYZekTS/hzJgk30PrP4nRw9KI1N+P+/WvLOYJCi6AkxC3r0G9qM6EiFXWrJ5T
 FgW7D/P/inrgBCEb21z33oDjwJHoSpiz+Qzp+O0zlwQcaChADrrgM/flT80Xojdkv9OI
 nVRjm71ftHuU+khQEuh4o74Hbvv6TsE61Nv2T6MCwDeiS83R+IPd8DoXbPUVmbmLrKNW
 jzmTs1fBdRwCMyJMgPKYZvD8ChtkY5Fs+3Z374nZfruXW0cwZKnhXw7XFd7JRL5CAJ0t
 XJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698323592; x=1698928392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+5c+7/hWqqP2V740qpPrOLE20Hrf2rzE26Q7mOJnQ0=;
 b=fCeFaMm8XrfppGPWPwIEDjWr7Yaj/q5/UUmRonuYBBCG2YQJdkuo850k415dLIAn3i
 T62R9QJ7iaY0AY5usvNuw6AGhcUHIUjEDs8VRlWAq8+TCANVlJdz5n37eLXuzkNhHcVm
 W7c4eS4TBjgMnPVjuSbKqgg0viRVnmAB3Cub0q14SDdbPPCqySo2fZfzDsy+MS4VVRL+
 i2T9QnlSC0ed3mUE3wkmnTNcKQRtLoSu3dWleh2zjOZqvsoS38+Z+8p3lcl8KidaJW64
 YFeVnzPIO6hb9/cxrdQszT2zqeQOjEyG2BSgLhKvdrG0mSy20XRBvmtpxuQis+qTYSMM
 VfEg==
X-Gm-Message-State: AOJu0YyDB8SYtw9BDc7TzPm0S1O/CKeNtYpnMZP7rpRS+BUKfS/5LJLS
 56t/3H1kvzug0px1/EmeuIUzQA==
X-Received: by 2002:a17:90b:2ec7:b0:27d:2ad2:4d9c with SMTP id
 ss7-20020a17090b2ec700b0027d2ad24d9cmr14170155pjb.35.1698323592214; 
 Thu, 26 Oct 2023 05:33:12 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78]) by smtp.gmail.com with ESMTPSA id
 n20-20020a17090ade9400b0027d1366d113sm1523395pjv.43.2023.10.26.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:33:11 -0700 (PDT)
Date: Thu, 26 Oct 2023 18:03:02 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v4 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Message-ID: <ZTpcfq+96YVE5WCl@sunil-laptop>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-10-sunilvl@ventanamicro.com>
 <20231026-5530c164173cd1859e9df666@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-5530c164173cd1859e9df666@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qrR0BpuKvzo+

On Thu, Oct 26, 2023 at 10:31:51AM +0200, Andrew Jones wrote:
> On Thu, Oct 26, 2023 at 01:37:09AM +0530, Sunil V L wrote:
> > MMU type information is available via MMU node in RHCT. Add this node in
> > RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  hw/riscv/virt-acpi-build.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > index ebe7062b9b..dc7c0213f5 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -159,6 +159,8 @@ static void build_rhct(GArray *table_data,
> >      size_t len, aligned_len;
> >      uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
> >      RISCVCPU *cpu = &s->soc[0].harts[0];
> > +    uint32_t mmu_offset = 0;
> > +    uint8_t satp_mode_max;
> >      char *isa;
> >  
> >      AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> > @@ -178,6 +180,10 @@ static void build_rhct(GArray *table_data,
> >          num_rhct_nodes++;
> >      }
> >  
> > +    if (cpu->cfg.satp_mode.supported != 0) {
> > +        num_rhct_nodes++;
> > +    }
> > +
> >      /* Number of RHCT nodes*/
> >      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> >  
> > @@ -233,6 +239,26 @@ static void build_rhct(GArray *table_data,
> >          }
> >      }
> >  
> > +    /* MMU node structure */
> > +    if (cpu->cfg.satp_mode.supported != 0) {
> > +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > +        mmu_offset = table_data->len - table.table_offset;
> > +        build_append_int_noprefix(table_data, 2, 2);    /* Type */
> > +        build_append_int_noprefix(table_data, 8, 2);    /* Length */
> > +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> > +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> > +        /* MMU Type */
> > +        if (satp_mode_max == VM_1_10_SV57) {
> > +            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
> > +        } else if (satp_mode_max == VM_1_10_SV48) {
> > +            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
> > +        } else if (satp_mode_max == VM_1_10_SV39) {
> > +            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
> > +        } else {
> > +            assert(1);
> > +        }
> > +    }
> > +
> >      /* Hart Info Node */
> >      for (int i = 0; i < arch_ids->len; i++) {
> >          len = 16;
> > @@ -245,17 +271,26 @@ static void build_rhct(GArray *table_data,
> >              num_offsets++;
> >          }
> >  
> > +        if (mmu_offset) {
> > +            len += 4;
> > +            num_offsets++;
> > +        }
> > +
> >          build_append_int_noprefix(table_data, len, 2);
> >          build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
> >          /* Number of offsets */
> >          build_append_int_noprefix(table_data, num_offsets, 2);
> >          build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
> > -
> >          /* Offsets */
> >          build_append_int_noprefix(table_data, isa_offset, 4);
> > +        if (mmu_offset) {
> > +            build_append_int_noprefix(table_data, mmu_offset, 4);
> > +        }
> > +
> 
> In the previous version of this patch the MMU node was getting generated
> above the CMO node, so its offset was less than those of the CMO node,
> and why I recommended moving it up here. But, in this version, the MMU
> node is now getting generated after the CMO node, so moving this up
> means the offsets are still not in ascending order.
> 
Yeah, after changing here I realized MMU node type is logically better
to be created after cmo. So, I changed the creation order but forgot
reorder here. Will update in the next revision.

Thanks,
Sunil
