Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905D7ECD994
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 17:41:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo3Lo-0007LT-Kt; Thu, 05 Feb 2026 12:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vo3Ln-0007Kj-8Y
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 12:41:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vo3Ll-0003yB-JF
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 12:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770313263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGypKcpukOs7Bc/BtAYDdkywm8x5uQj6dqQs8EyKp4Y=;
 b=e65Q7hzOwIZnqxraN5HHwiU2B+1g1KIyuH5R43WXr6jxr9U+OgFzLp4ZoBrWTF7JlurCOK
 Ep9wqkhdzJnegnKU8/99dwsyGSb7PIHGZ0Ib8BQxQcRoCxnWOt9LYUajlb1NZ7DAVEj8z5
 tQW1KOeEufRcCED/BkBwluzkObNvzUk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-tPT_DWRPMES_g3Z237XWvg-1; Thu, 05 Feb 2026 12:41:00 -0500
X-MC-Unique: tPT_DWRPMES_g3Z237XWvg-1
X-Mimecast-MFC-AGG-ID: tPT_DWRPMES_g3Z237XWvg_1770313259
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4325aa61c6bso995256f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 09:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770313259; x=1770918059;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vGypKcpukOs7Bc/BtAYDdkywm8x5uQj6dqQs8EyKp4Y=;
 b=d90Iy4HnC+kFFJkid0mkGlI5CQpQ6rjOLdYI7BV+nwoQOUYL8Id+RpfjG6jk2KBV7u
 HW5TZIGt08nYQuC7VCoHL1I2mDlIa89hDjhfNJPA0aiyEt2JLtuueuxheLObrimBm5EJ
 4P3mNOkspUKc6G6DpgcsjG5QWUZDGTInL8Mz10xcd3ePmUU99enVHvjnj+bLAPrg0dx9
 Ov+wymeGvVvhabV+AfkzUD8zVXhNeDkEu5qoIvYoGpEYJxLRxVNBwoX3Z2L6Z0btO0f6
 LqTKfSFb6YVpa2yKYQBC0Bs5cVMBTQVC4FYH8RWrO74NfOicCqfbyLWf5zKZUn4td/Cq
 EJzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeFTPeGevuOuK/PBjsmebNl9mjp5xhqURQ8NZJ3o3IFLQtARHVyqHairAp+JM2ARj+7Pyw5N8vrg==@nongnu.org
X-Gm-Message-State: AOJu0YzKorpEpIdpXHEmYNkQD0Fh7Aw5p2BEORmfK6FfkxFFoGYT/Osd
 dnDCW13fSP0sU9pUoIaoc88tKCUEyfQclHcw6EUzPMLVUm9/Dq6QFRR59BPSkrGKIDXVA+WOguy
 piLaSpIbQ37XfxVzWzFwsECR6nEsJPSgfXAhcrHNr3PV5wv5+nGHMzg==
X-Gm-Gg: AZuq6aL9VuoxSgoBy9PwimPaX+cidP7YwHZ5c9ZaHccJI8wjG7vM1xUW0zF4qX+w6uj
 f2MNkFQxby1nROsHdwcw1JUtv369RGYEsixWc+euq7emJYyI/ctp2TZyyyPWeudXb69xMAEP9/A
 ETMipshpawUce0Xo6kNQhPiuNiOJ9xuAWW5SO+sOb1+NuHbEatTTBujEAsOrenli7RaGUKTItzy
 cVvBkdplGFrSIv0t55qr19Arb0CobTXuqXOvUtZRkYuDSiUhKeMuDylojJhdnU4Lf5VyTZF7r85
 425gFg9+HNBLaZoistuvF59GIrhxAWm/8RjLGn65/Es6wnFf126hcXpVSJOuf7ZCPeknPOYt2tN
 FLa6n7MShq2gppZdwNGe/RWWQ0BFuwi78Iw==
X-Received: by 2002:a05:6000:4301:b0:435:b7b9:afe5 with SMTP id
 ffacd0b85a97d-4362934a08emr63227f8f.1.1770313259017; 
 Thu, 05 Feb 2026 09:40:59 -0800 (PST)
X-Received: by 2002:a05:6000:4301:b0:435:b7b9:afe5 with SMTP id
 ffacd0b85a97d-4362934a08emr63178f8f.1.1770313258422; 
 Thu, 05 Feb 2026 09:40:58 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25683sm14885376f8f.6.2026.02.05.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 09:40:57 -0800 (PST)
Date: Thu, 5 Feb 2026 12:40:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Li Chen <me@linux.beauty>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
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
Message-ID: <20260205124004-mutt-send-email-mst@kernel.org>
References: <20251211102025.873506-1-me@linux.beauty>
 <CAFEAcA8FcW22-TnyBKHmFUUsR=xk2u-74uPz6KisJTeG=YWxmQ@mail.gmail.com>
 <20260205051236-mutt-send-email-mst@kernel.org>
 <CAFEAcA-2QKtniTsLFA2ayjQ28dmQ=35r_zhkL6UBpiEOr=xGVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-2QKtniTsLFA2ayjQ28dmQ=35r_zhkL6UBpiEOr=xGVg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MkxrKzfvz4czDX5lRwePY7UdZWh4KofaOvO1azzlt6M_1770313259
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
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

On Thu, Feb 05, 2026 at 05:15:17PM +0000, Peter Maydell wrote:
> On Thu, 5 Feb 2026 at 10:13, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Feb 05, 2026 at 10:08:32AM +0000, Peter Maydell wrote:
> > > On Thu, 11 Dec 2025 at 10:21, Li Chen <me@linux.beauty> wrote:
> > > >
> > > > From: Li Chen <chenl311@chinatelecom.cn>
> > > >
> > > > virt machines always instantiate a PL011/16550 UART at slot 0 and describe
> > > > it in ACPI (DSDT and optional SPCR table). When the command line disables
> > > > the serial backend (e.g. "-serial none"), the guest still sees the UART as
> > > > a preferred console even though it is not usable.
> > > >
> > > > Teach the virt ACPI code to omit the UART device and SPCR when there is no
> > > > serial backend attached. This matches the hardware that the guest can
> > > > actually use and avoids confusing firmware or OS code that relies on SPCR.
> > > >
> > > > The bios-tables-test qtests rely on an ACPI UART node and SPCR entry for
> > > > UEFI-based virt machines. To keep those tests working we create a UART
> > > > with a "null" chardev backend instead. This preserves the ACPI tables
> > > > while discarding the firmware's serial output so it does not corrupt the
> > > > TAP stdout stream.
> > > >
> > > > Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> > > > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> > >
> > > Sorry, I must have missed this patch previously. I'm not sure that
> > > this is a good idea, because it means:
> > >  * the dtb version of virt and the ACPI handling diverge
> > >  * we tangle up "what chardev do you want to connect serial output to"
> > >    and "what UARTs does the guest see"
> > >
> > > If the user explicitly sends the first serial port output
> > > to nowhere with "-serial none -serial stdio" they presumably
> > > had a reason for that and won't be happy to find that we've
> > > adjusted the ACPI tables to redirect that output to the
> > > second serial port they were planning to use for something else.
> 
> > presumably, things would be different with -nodefaults?
> 
> -nodefaults doesn't generally do much on Arm boards, because
> we don't have a lot of "pluggable thing that's plugged in by
> default" that we would turn off -- that's more of an x86 thing.
> 
> On the virt board the UART situation is a bit complicated,
> for command-line backwards compatibility reasons:
> 
>  * the first UART always exists
>  * if you're emulating the security extensions, the second
>    UART always exists (and is the secure-world UART)
>  * otherwise, the second UART exists only if the user
>    configured a second serial backend (i.e. provided
>    "-serial foo -serial bar" or similar)
> 
> If I were designing it again from scratch without the
> back-compat baggage, it would probably have three always-exists
> UARTs, one for secure-world and two for normal-world.
> 
> thanks
> -- PMM

that is why we have machine versioning?
I would say -nodefaults really should not have a serial port
unless defined, no?

-- 
MST


