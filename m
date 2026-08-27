Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A1BC61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 17:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzeF6-0002VM-8b; Thu, 27 Aug 2026 13:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wzeF4-0002V4-Va
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 13:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wzeF3-0004Rh-9F
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 13:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787853020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awWB6uB0BedZ29MREFEh7+eImC5cdPwPdJfM9BMb5dE=;
 b=AcJYgOoIlWw1CcrYytz/bxLbAUTPmkCjPL9lxaX6Vwxi3CV8iH2cAw7KZNAd6V5k1JAQMM
 gYUErylMAU1iWust8xgydRV/0qg1mZc7W362d++WRFq6bP+L77kO2Fr9sDe5oxbjL9qSZQ
 1PRROim0RI86Xz9adWqTZ2xTZVnWTK8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-t11haS5LPF2p1iQP3GSbew-1; Thu, 27 Aug 2026 13:49:11 -0400
X-MC-Unique: t11haS5LPF2p1iQP3GSbew-1
X-Mimecast-MFC-AGG-ID: t11haS5LPF2p1iQP3GSbew_1787852950
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-47162f83c75so637331f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787852949; x=1788457749;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=awWB6uB0BedZ29MREFEh7+eImC5cdPwPdJfM9BMb5dE=;
 b=OcX8A9HyCDB1gU0+7pbOrkhP558KSR4T+hIuf3H+bbwaqSjaOGjXlkaOeZAadvbUl5
 w6AiDNjTEO14Aqz3l4ZTn73xBwozZvPdArfyEqOpA0QCDw/eugMmz9nN3syeb09rUaWj
 mE5veaosBCD/AmCAMBlGmSYFzJtzbzbGslUcEHvcFyDT1F/h4Z0rLKmKko3I051IvIOB
 QLIVpk++4P6NcZaculcXIN1gBSMjXctV8pTzdkSvm0Yu8kBMu0K24TBPenpZiJik8sr3
 /UgfCZPx0T/yCeoGP16BWdYh7XfBXnVgv22wTXOjyIGIbwlVs/fh/02Nfp1QrOSCJqPn
 2W6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdEuBMy6EAbedYAWjupiPEG7XQ683HkeUYJC7h5YpYN+02SJZPsmoJOPFbcBauY5GmkEC+hJWpCg==@nongnu.org
X-Gm-Message-State: AFuF++mZSbDoHlssOrrQ/FpZEv1SqKppZm+2ADusHPZe/iwHr/Olmi2p
 CJMK2dFV7KaL2A4pHIgSMIRz5Dnhnyr0sPyJY4jQYs1pJsJgfW+mIn4v1Q6VhNNFoBShkO3rSRl
 vA0u/UWmB/svSiZIkf8akuwlmZ1ztjpyWYwICfNiELLrLU6/DqCfCRp+WFuRh21q+v6yrLU57Q+
 TemjO3DMO7+s60gTpGCP7uH8f76TbM
X-Gm-Gg: AR+sD13szm74Ro6dmC3qYUfnZ9IlYZxX+UtRm8y1MyQ0M4pjeCc3usZ5k2oSBy60Dxq
 h5pkeWZjsT98ZI817ACiaiaiUx/DpK7tfd1CdDyN1qeOQTVkr2a7TznhEYeXOgJj9YxVv7rnm+h
 E7fURILjBwlqIFGM7hau4oAi/tkutK2VEW7e+/JCD2r8wjG4v7NdUxhh3RRsO6GgAOafT57y+Qr
 xawYorpEYZe+Ns7ymlKwUb4PIwdfsJywXcGvkzz5zRVQQOyfcgKbT5yr/yM
X-Received: by 2002:a05:6000:719:b0:474:bbbb:bf17 with SMTP id
 ffacd0b85a97d-482f71ecf61mr1510708f8f.0.1787852949244; 
 Thu, 27 Aug 2026 10:49:09 -0700 (PDT)
X-Received: by 2002:a05:6000:719:b0:474:bbbb:bf17 with SMTP id
 ffacd0b85a97d-482f71ecf61mr1510638f8f.0.1787852948770; Thu, 27 Aug 2026
 10:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <ao7c-FiawF9sMCGj@redhat.com>
 <b2b1d77e-c3e3-4aad-87d2-f5d4834abd1a@oss.qualcomm.com>
 <apAG8JQTnQxRkfip@redhat.com>
 <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
In-Reply-To: <9e36f8a0-5363-4ce2-accf-62ccf3602344@oss.qualcomm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Aug 2026 19:48:55 +0200
X-Gm-Features: AcwNN1X1-eaT6TIQtq1c9AZkdJJPAFSqmjPm7XfVmNJJCniwRLGMzUtpOIIGOgA
Message-ID: <CABgObfYw8U6q1xdUXcP5XBNTpB-n9MR=DkzFXpb6nkn7g00etQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] single-binary: link ARM and RISC-V into qemu-system
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, 
 Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Fabiano Rosas <farosas@suse.de>, Aurelien Jarno <aurelien@aurel32.net>,
 Ani Sinha <anisinha@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Darren Kenny <darren.kenny@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6yiZHm1kmLRAaqNsNJ2E-WAAkfWqi45anDjE2n9eq-0_1787852950
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Aug 27, 2026 at 6:32=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 8/27/2026 2:44 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Aug 26, 2026 at 11:35:11AM -0700, Pierrick Bouvier wrote:
> >> Seems like the Genius.Artist. in the bottle just need to escape, and y=
ou
> >> can send us a nice series doing all this. Meanwhile, I'll try to find =
a
> >> carpet, a monkey, a princess and a suit to be the next Aladdin.
> >
> > This kind of comment is not productive and disrepectful to the time
> > reviewers in invest in looking at the proposed patches. Please stop
> > this.
> >
>
> The only person wasting everyone's time here is YOU.
> There is not a single person who came on any thread to say "I agree with
> you Daniel", while several posted or commented they were ok with the
> approach here.
>
> Project is QEMU, not Daniel's EMU.

Whoa whoa.

Sometimes people don't reply not because they disagree, but because
they trust the people involved to resolve the problem.

Let me remind you of the discussion we had about -fms-bitfields and
how it was resolved amicably and profitably.

I will read the thread and try to understand what's going on but from
the first impression, "wanting to keep the single-system
qemu-system-riscv64 instead of a symlink" is a valid objection. In
fact, with the proviso that I haven't read the code, I don't see why
you'd want *anything else*.

And especially, "How surprising (:eye-roll:) it is that adding more
code and more classes would result in a higher memory usage, or bigger
binary size for qemu-system" is not a good way to conduct a
discussion.

This project was extremely complex and some disagreements are normal,
but overall I would say it has received support from the community for
years. It is close to the finish line, let's not forget all the
collaboration so far.

Paolo


