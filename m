Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC63BCD13DA
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIT7a-00060e-Lq; Thu, 30 Apr 2026 11:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wIT7W-0005w3-Fd
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wIT7T-0004Tw-Jh
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777562162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbAZFrSelZh36u7cVMr0rb5mUMClEWvyRUSEplgrPRg=;
 b=KJ0MwecbwFuLFGfTsSmeCY4Xu0XreshlS4vN8BPxzMyYBFeYAkJbqCi6sGnV4n/8Nqior3
 7DpfZVmMJW4ZCcRKUPcegD51pT/t5fZtc4LO4HkkAnKk7cCL+CSdGSS6xCm0piZNWXFJg8
 +0TU9p3TZqEmeyZ944c88+mP8hTL0R4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-z_RhjSWgOtOLwpjFSIT8LQ-1; Thu, 30 Apr 2026 11:16:00 -0400
X-MC-Unique: z_RhjSWgOtOLwpjFSIT8LQ-1
X-Mimecast-MFC-AGG-ID: z_RhjSWgOtOLwpjFSIT8LQ_1777562160
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50fb007bc36so22106671cf.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777562160; x=1778166960;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wbAZFrSelZh36u7cVMr0rb5mUMClEWvyRUSEplgrPRg=;
 b=B/N0GUUpSWcfx9M5nPtT/qfpl6rJc8N09z1bTragwpw4xzcRt4pyjKDXLUxEXbdUL3
 2kbaaqSAuICypcJ1LpuA2et2HDp/2Nc5pzUFre02Z8A1c/u0bOAXkdq+6V2F5LFiRnFp
 ccsv4zur/mAnTVPsH0mvyLmI6KOxh5hydldtVS/ezYfwZilTsrsstcD+mwoc5iVYex2c
 4TTQGWw3xthZ5q4vF8ndtB4GZsSceLGpWViUnUPgv21u4x9CAuDbRM5hgXhcVdX3NMsI
 S2M4IuHhdXr0ubs51M7hJyBeqjt4vo3rjMLyonYSCbtBFu56oudaDMndHanF+j5BfZU5
 RFuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/pMSCLw/Rz6viSBJPCktHJDsI5SV0LBrxn9w4HgC88xrbrlsj+dwL52zDF/sw1sS9Mj3ECYfOvOQ==@nongnu.org
X-Gm-Message-State: AOJu0YyUbLkUXy+q0mYQZkG5ZsexJ6aRjQSqvPAMPkrwII9g3+GyTDSR
 xAvyrcuUz2FzjOH6oty8z65J9GpWbiEVD8APMV/b7woRg/W2lFJzK1JpJU00JLSQ+uW5KW98yfu
 qEbd1WSQsUMf+isG9864jf8WAaUtQ1UnAQGQDu+nOiV0sB7WXYf2TFg==
X-Gm-Gg: AeBDieu+YiVgW7BO+CsDIfFMIX7kx/pcUxxdJiFPgP+pW3OMKJyWvIOvmpNotMHaf4l
 OjwgWzQnhze+Q6lKhbwW4WdQpJT113UCskdl6ym3IG+MXTRSh3506rPnFt+cPkW2b+mGhuMLZb6
 nWou+EnVrICZail5LHAJrkS5Sqq9vvAU+nJeEnqf2LSj3VUBZf5tT000m6N4xtntqtYxd/Mwiwy
 x7Z2z34R03M8lppQGSICP/U/kiAWrnQTYjlV3DfCpeRmTSFqQzLfyklmkEvGYR3rJpV9S57R9p0
 dN4syS6OHwc7TSwR/K205u99LBbg78gV+CzPc1g++S8hCgUR+vsJLQ5qxU5cpBGOiSoxSvnFNiw
 8LVSGxoraZUJZJDwJM7YhTeH8jJFvIp4Z0opGomoUT97kMf4LkYVjA40X8A==
X-Received: by 2002:a05:622a:1110:b0:50f:ad91:8902 with SMTP id
 d75a77b69052e-5102ad9b0abmr45963101cf.37.1777562159944; 
 Thu, 30 Apr 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1110:b0:50f:ad91:8902 with SMTP id
 d75a77b69052e-5102ad9b0abmr45962641cf.37.1777562159336; 
 Thu, 30 Apr 2026 08:15:59 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5103b3a1c4fsm565201cf.11.2026.04.30.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 08:15:58 -0700 (PDT)
Date: Thu, 30 Apr 2026 11:15:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 2/4] hw/npcm7xx_fiu: Specify .impl for
 npcm7xx_fiu_flash_ops
Message-ID: <afNyLaTjM2uz_wX8@x1.local>
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
 <20260428093339.2087081-3-peter.maydell@linaro.org>
 <22ce7f65-39ee-45cb-a021-ac275d036f38@linaro.org>
 <CAFEAcA8SpD+X0kLg-6kQ+TR2VSJqhtMpzQrfsOqEZE_EzfkW3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SpD+X0kLg-6kQ+TR2VSJqhtMpzQrfsOqEZE_EzfkW3Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gAA0JLA5R9y4HvWTnqVepWrt7LSqdztfQ86ypVEywkE_1777562160
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Apr 29, 2026 at 01:26:36PM +0100, Peter Maydell wrote:
> On Wed, 29 Apr 2026 at 08:38, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> >
> > On 28/4/26 11:33, Peter Maydell wrote:
> > > Currently npcm7xx_fiu_flash_ops provides no .impl substruct; this
> > > means that it gets the default of "implements 1, 2 and 4 byte aligned
> > > accesses".  This is more constrained than the device permits in its
> > > .valid substruct, and also narrower than the functions are written to
> > > handle.
> > >
> > > Add a .impl substruct matching the .valid substruct; this means that
> > > all guest accesses are handled directly by the read and write
> > > functions, and are never synthesized by the memory subsystem
> > > performing multiple accesses to the device (which would not behave
> > > correctly, as these read and write fucntions have side effects).
> >
> > Typo "functions".
> >
> > >
> > > Based-on-a-patch-by: CJ Chen <cjchen@igel.co.jp>
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >   hw/ssi/npcm7xx_fiu.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
> > > index 02707de350..2d5bed005a 100644
> > > --- a/hw/ssi/npcm7xx_fiu.c
> > > +++ b/hw/ssi/npcm7xx_fiu.c
> > > @@ -250,6 +250,11 @@ static const MemoryRegionOps npcm7xx_fiu_flash_ops = {
> > >       .read = npcm7xx_fiu_flash_read,
> > >       .write = npcm7xx_fiu_flash_write,
> > >       .endianness = DEVICE_LITTLE_ENDIAN,
> > > +    .impl = {
> > > +        .min_access_size = 1,
> > > +        .max_access_size = 8,
> >
> > IMO this device should be adapted to have byte granularity ops handlers,
> > thus .max_access_size = 1.
> 
> Looking at the implementation that doesn't look like it
> would be possible. The implementation does operations
> to start an SSI transfer, then transfers the number
> of bytes written. That makes "guest does an 8 byte
> write" different from "guest does 8 separate byte writes",
> and so the read/write fns need to really handle all
> the possible access sizes.

I tend to agree.

AFAIU, a split could cause non-atomic issues (even I'm not sure if there's
any need of it in reality..). Since the use of deposit64/extract64 should
mean they're ready for 8B accesses, then it sounds wise to support 8B.

-- 
Peter Xu


