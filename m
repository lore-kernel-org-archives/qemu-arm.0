Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A120BE87848
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 16:27:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnJFf-0000nG-14; Tue, 03 Feb 2026 11:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vnJFa-0000bS-DS
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 11:27:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vnJFN-0003Aa-Tk
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 11:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770136038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02EQFrh+B2y546oa54/YtDjTf0VTVuxTGdnclVcFeeU=;
 b=dthMKwqk+y/BM3pgjA/W04KTyYdx9hDqkwKisa+aayxJu/8uuHDFUI73+eLa8lC+4aEP7+
 Xzx/Y2jF20NZlWMhwfMRXAyblBJU7u4mqTlR3VsuvuIbfaFMGwCDF3RPN4f8qGmuwcZdim
 4I0IePt5L+uAW6eYajJtdP3jBMLKm1c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-POxudZ6HMrO7ySLavPra3A-1; Tue, 03 Feb 2026 11:27:12 -0500
X-MC-Unique: POxudZ6HMrO7ySLavPra3A-1
X-Mimecast-MFC-AGG-ID: POxudZ6HMrO7ySLavPra3A_1770136031
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42fdbba545fso841212f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 08:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770136031; x=1770740831;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02EQFrh+B2y546oa54/YtDjTf0VTVuxTGdnclVcFeeU=;
 b=uy1nVR54sdUmnC33FeuMNZ7a5fV/ymD6+/5L7CtXTtmdU1XwGA9pDQiaCqSrt8LHr7
 jncv6i1PmVJ9/AnUXLjeiwqscJGWvI7vT5QIIvo3fp/9rBRMv81IJJFvEYXYLZzO3zoL
 lXg3p4OKxmd0pi+So4tz87DgyyrEymXC2v1byP6XQ7j2l0+3NJh5th2hmVkW3lSL/WiK
 E/xSw9u139bfh33kuy4ON49ZI440uPyUVTAjsYkn4w8OLZy7X9VnGIH8ooKeRerqVnDI
 PKk23vwmqr9AYepmD6oGnImfUSSGgOL5wYVNmjtiWu4PEaVunVCNNlIwCpc2W4/g7nCn
 ITCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmrLuFfr3WjdGeChzAoQvQNpLLHKWEp2zXrRhtyPbWCldkK9/zBW228qQs/q+rE0V0q3RcNNAvwA==@nongnu.org
X-Gm-Message-State: AOJu0Yw8pK1RCWnW7wjGc9Xbj1TtiXBiOVB2UrrZHo38YwLqIlynVtqx
 rNQrKdQ6Vd0gUKsiT/cYUfmBf0EXD0Xx0ht2m41ask/706LTtOXrNAi3XyFN5a42a3RZocXELWu
 8tEvxJ1qrbLsCvFwW8UYLAkx15DqtCKHVWJ1FZwog6LDdHc8HLIZXIA==
X-Gm-Gg: AZuq6aL9egRsnNnYp5m2MM0WP62B0kdNiGKbPBe0QnZDIiRA2Vd4RbWa0Vn0EO1U6Fr
 7a4biZUbMRvzVSVcekj9U8sqnRBMZXcLhQiJFiiwFAIFkDEIExkIeVM+Twt/yfrglUmoHaaL6qN
 Ra2VHNvbmoKjU3RQcBCju7I+QmBFz0xaPiLUpofYHVboMMKEb4OHIgNBbVenthAuWBuqVFjV1q0
 mPDPCt6YeFxR2B9QvA2aXU233JH49l5tYe5pZQ0p9TtiHr+Seo/guPf+BkNKayyYnqnju0fycIy
 hZ5JH0hqCh194wAWyNoYjS7TTIozriGGUzTJZWOgZy5dV5jfwqFPkrzxlE5iSGn5frnUQbnfuiu
 iUn92zgtU/zDGYN9kPKqeZ2fbcpcDrVMIFQ==
X-Received: by 2002:a05:6000:40e0:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-43617c1d4b7mr2786f8f.2.1770136030807; 
 Tue, 03 Feb 2026 08:27:10 -0800 (PST)
X-Received: by 2002:a05:6000:40e0:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-43617c1d4b7mr2731f8f.2.1770136030271; 
 Tue, 03 Feb 2026 08:27:10 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1353f8bsm49497120f8f.39.2026.02.03.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 08:27:09 -0800 (PST)
Date: Tue, 3 Feb 2026 11:27:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Li Chen <me@linux.beauty>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v6] acpi/virt: suppress UART device & SPCR when guest has
 no serial hardware
Message-ID: <20260203112450-mutt-send-email-mst@kernel.org>
References: <20251211102025.873506-1-me@linux.beauty>
 <20251211080811-mutt-send-email-mst@kernel.org>
 <19b104a617e.133b3feb891309.6986511857690603518@linux.beauty>
 <20251218161253.7f13038f@imammedo>
MIME-Version: 1.0
In-Reply-To: <20251218161253.7f13038f@imammedo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ToJBuzpKZIp_byWQa6KKaMWXSHJonGKgAay-jsdCgtg_1770136031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Thu, Dec 18, 2025 at 04:12:53PM +0100, Igor Mammedov wrote:
> On Fri, 12 Dec 2025 10:01:08 +0800
> Li Chen <me@linux.beauty> wrote:
> 
> > Hi Michael,
> > 
> >  ---- On Thu, 11 Dec 2025 21:10:18 +0800  Michael S. Tsirkin <mst@redhat.com> wrote --- 
> >  > On Thu, Dec 11, 2025 at 06:20:25PM +0800, Li Chen wrote:  
> >  > > From: Li Chen <chenl311@chinatelecom.cn>
> >  > > 
> >  > > virt machines always instantiate a PL011/16550 UART at slot 0 and describe
> >  > > it in ACPI (DSDT and optional SPCR table). When the command line disables
> >  > > the serial backend (e.g. "-serial none"), the guest still sees the UART as
> >  > > a preferred console even though it is not usable.
> >  > > 
> >  > > Teach the virt ACPI code to omit the UART device and SPCR when there is no
> >  > > serial backend attached. This matches the hardware that the guest can
> >  > > actually use and avoids confusing firmware or OS code that relies on SPCR.
> >  > > 
> >  > > The bios-tables-test qtests rely on an ACPI UART node and SPCR entry for
> >  > > UEFI-based virt machines. To keep those tests working we create a UART
> >  > > with a "null" chardev backend instead. This preserves the ACPI tables
> >  > > while discarding the firmware's serial output so it does not corrupt the
> >  > > TAP stdout stream.
> >  > > 
> >  > > Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >  > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> >  > > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>  
> >  > 
> >  > This bothers me:
> >  > won't this mean number of serial devices changes silently?  So for
> >  > example, if you install a guest, see that 1st serial device is broken,
> >  > configure it with 2nd one as a work around, now with your change there
> >  > is no second one so guest will be broken?
> >  > 
> >  > 
> >  > I seems safer to have compat machinery around and avoid
> >  > changing this for old machine types.  
> >  
> > Thanks for pointing this out, you’re right that changing the number of serial 
> > devices that the guest sees is risky for existing machine types.
> > 
> > For v7 I’m planning to take a more conservative approach and only gate SPCR
> > on the presence of a backend for the primary UART, while  keeping the ACPI
> > UART devices in DSDT unchanged. 
> > Concretely:
> > - virt ACPI DSDT will continue to unconditionally describe the UART(s) as before,
> >    so the guest-visible UART topology doesn’t change for existing virt-* machines.
> > - We only call spcr_setup() when there is a backend attached to UART0 (e.g. serial_hd(0) != NULL),
> >   so SPCR doesn’t point at a completely unusable console when the user passes -serial none.
> > 
> > In particular, for a command line like -serial none -serial pty, this means SPCR would not be present
> > (rather than silently switching it to UART1/pty). My reasoning is that, for existing virt machines,
> > SPCR is meant to describe “the board’s primary console (UART0)”, not “the first UART that happens
> > to have a host backend”, and changing that interpretation feels like it would need compat machinery
> > and a new machine type.
> > 
> > The qtests already force -serial null for the UEFI-based virt tests, so they will still exercise the SPCR path.
> > 
> > Would this behaviour be acceptable for you, or would you prefer that I go further and also add a compat
> > flag/new machine type where SPCR can follow “the first UART with a backend” while old virt-* machines
> > keep the current UART/SPCR semantics?
> 
> 
> all described above looks complicated.
> In ACPI tables we usually try to avoid compat settings, and do them only if we have to.
> 
> So question is how guest enumerates serial ports when
>    '-nodefaults' is used _and_ there is a second serial port configured (is it even possible?)
> check it with and without you patch please, to see what difference the patch makes.
> 
> > 
> > Regards,
> > Li​
> > 

Looks like this got stuck.  I think what Igor and me are saying is, do
not rush to do compat, just test what happens and document. If guests
survive fine, then it's fine.


