Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52ED29DC9
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 05:50:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfXIP-0006ar-NB; Tue, 13 Jan 2026 00:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfXIN-0006Zn-P1
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 00:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfXIM-0002z8-3R
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 00:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768283421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qs7zhcW/UVOSbsLU/f5/0UkeBgNfQxpoFiaHDgUVOH8=;
 b=SyaUPUeorFD67KE+MwOR3xq2NFjdxUv5W8WmLkKdq4bBJyJDgq5TZZ8OOsqw2hQRNg9GzA
 F16uJwgLnOrQJvRD6EcuR4wcM9A91/SReG3jBeIEIImCesMvwEJiZoeUPeMY7Oxf7hZdmk
 kCU1gPfGwbfgk0LHr4ruBUIQ9ymNQxc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-LG-3XRnEPamIBDY0PAdiMA-1; Tue, 13 Jan 2026 00:50:20 -0500
X-MC-Unique: LG-3XRnEPamIBDY0PAdiMA-1
X-Mimecast-MFC-AGG-ID: LG-3XRnEPamIBDY0PAdiMA_1768283419
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430fdc1fff8so4176793f8f.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 21:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768283419; x=1768888219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qs7zhcW/UVOSbsLU/f5/0UkeBgNfQxpoFiaHDgUVOH8=;
 b=Q+sqckiwJ+TULPQfc44Gcs9y0xJ5ATxf5YnivXTpVQTjx3VWHHWVl2NJg+9UFJBGiT
 2tSN5IpG3pspeONs3jwZaJP8OSIIcz7ox+RdLPDtpOaDwIKp9TwP2UgQxrIj5CbFhXpk
 fqOnVUKbQyLuGaWWvRYmqPZJwOU+TzANHL4Q6ZXPwdOf0Z6OqH6Xiz2v/vN4Nnk8u8RG
 CDhDmIvA3mCfeLeA5mH9Hm+xLiLAdlMSHTF4ctKKQKiJo59QSGQsXoFrss9YSRTV+Y0q
 Rxht96ZAUKmM/D6PfvRQK7ti3o6e1DYft+aEJKns2+uhvjnnV2AdjMxtpFJ252Fotjtb
 2UjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUA4goX4450iz0z/VP6mYBPcfxhmzI0yYmTm3KquZElEfUn92JGoOBWvqqyPaOVyW5f6Y3D+I3LQ==@nongnu.org
X-Gm-Message-State: AOJu0YwQg5d/6pVQ3d0ykF7P53A5zgBAiYYjmgpL3qVkMi+3rhgziV9H
 Fo/KIlRuPpuaaAJv/WRx4xR8xFWkTXpyiYVyfhH1BcLx3IVfLY8XP04LiL32MkGy0KLQHAne0+w
 zgsMIOMpWmjo/ZMd9prMRqlYRFGDuiKRQjfb+1j5zT0tSJEa3TVpM782UAW0PCEHWtsN0OXEZLh
 WPFmFokXrqxvdScB4csCpR2iiuBBDm
X-Gm-Gg: AY/fxX4ZLduuP59OaHmC43hCHK1qLNQ4hPmxkMEsg9RDPSOfxrxTMxCbdTbcdND6nEw
 H68FWB7/ECARnIPOYPRsT2iRlGYJYWcLQ8TAmFBC49ES3jDpfsiy6sp6p5Ux5n0eqRZT58e4QbG
 LGtHk/ef/Z5kX0ewL4ZLNGBfn7wVcYcPf4jCjQRa2OXParwf/3Gy4t03uOq8XMX+OxDQ7lEQjRN
 dMZvSyGHP9qlBviHsr75JseWmlttAZmR3YZPMqufeFqnockm6whkmEFTOEUMMniGGO++g==
X-Received: by 2002:a05:6000:2085:b0:431:104:6dc2 with SMTP id
 ffacd0b85a97d-432c362811cmr19726022f8f.8.1768283418751; 
 Mon, 12 Jan 2026 21:50:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPWxQNrcWE5zzwIRFg7QrWYT8fRVrUis+5YlZmgqwjJj33i5p+0PiklUStuQq49OSFRkSZ2PiqLPPt12RPsq0=
X-Received: by 2002:a05:6000:2085:b0:431:104:6dc2 with SMTP id
 ffacd0b85a97d-432c362811cmr19725977f8f.8.1768283418358; Mon, 12 Jan 2026
 21:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20260112132259.76855-1-anisinha@redhat.com>
 <20260112132259.76855-5-anisinha@redhat.com>
 <CABgObfbDTAvm6E0imC=HSm2=BAC4rzUDmuHcoUbVjJ-YeXFw-w@mail.gmail.com>
 <CAK3XEhOWn_zecQjvFvzsRu_dmHBAjJ4gaSfKKp6BHviQmz2D2g@mail.gmail.com>
In-Reply-To: <CAK3XEhOWn_zecQjvFvzsRu_dmHBAjJ4gaSfKKp6BHviQmz2D2g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Jan 2026 06:50:07 +0100
X-Gm-Features: AZwV_Qis5VsfOLzY6XbOPFF70nqRNXDlvk1xQ65pKarvD6noNf4B3av6VmmnO0Q
Message-ID: <CABgObfaMhQqSDLCudcn5sJ48p3Z0bOTzeX97=0PZNEgnEHNPbQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/32] accel/kvm: add changes required to support KVM
 VM file descriptor change
To: Ani Sinha <anisinha@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, 
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 David Hildenbrand <david@kernel.org>, kvm <kvm@vger.kernel.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dRJDRd3EDtzAAGfbSQAypgaIkl3t4OpQIG7jAIyLmKQ_1768283419
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000003901b06483e9159"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--00000000000003901b06483e9159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 13 gen 2026, 06:22 Ani Sinha <anisinha@redhat.com> ha scritto:

> On Mon, Jan 12, 2026 at 10:32=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.c=
om>
> wrote:
> >
> > On Mon, Jan 12, 2026 at 2:23=E2=80=AFPM Ani Sinha <anisinha@redhat.com>=
:
> >  > +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s)
> >
> > Weird name since there are no "operations". Maybe
> kvm_arch_on_vmfd_change?
>
> I meant the operations the arch wants to do on vmfd change.
>

All callbacks are "operations that the implementor wants to do", aren't
they? But "ops" is usually a suffix in types that group multiple callbacks,
not individual functions.

Paolo


>

--00000000000003901b06483e9159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 13 gen 2026, 06:22 Ani Si=
nha &lt;<a href=3D"mailto:anisinha@redhat.com">anisinha@redhat.com</a>&gt; =
ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On M=
on, Jan 12, 2026 at 10:32=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailto:pb=
onzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jan 12, 2026 at 2:23=E2=80=AFPM Ani Sinha &lt;<a href=3D"mailt=
o:anisinha@redhat.com" target=3D"_blank" rel=3D"noreferrer">anisinha@redhat=
.com</a>&gt;:<br>
&gt;=C2=A0 &gt; +int kvm_arch_vmfd_change_ops(MachineState *ms, KVMState *s=
)<br>
&gt;<br>
&gt; Weird name since there are no &quot;operations&quot;. Maybe kvm_arch_o=
n_vmfd_change?<br>
<br>
I meant the operations the arch wants to do on vmfd change.<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">All callbacks ar=
e &quot;operations that the implementor wants to do&quot;, aren&#39;t they?=
 But &quot;ops&quot; is usually a suffix in types that group multiple callb=
acks, not individual functions.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
</blockquote></div></div></div>

--00000000000003901b06483e9159--


