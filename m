Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51EEC44515
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Jul 2026 17:28:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkPsR-0003jt-NZ; Thu, 16 Jul 2026 13:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wkPsN-0003jV-Ho
 for qemu-arm@nongnu.org; Thu, 16 Jul 2026 13:27:59 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yisooan.dev@gmail.com>)
 id 1wkPsL-00016i-6I
 for qemu-arm@nongnu.org; Thu, 16 Jul 2026 13:27:58 -0400
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-4a4c6081f9fso163988b6e.3
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2026 10:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784222876; x=1784827676;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=df4xxXKfud+vHTeMMkueAvHLfaVdA07+CRchcpoXFaA=;
 b=XpaX2+we6xhlzxfoyTJDMs/bD02/gma074XCd0AtaTTx9siL7W3jQyfwrO8ijsQXt2
 4Sc+erYdNQ1Y9t8a/ajAEyIZEkux29dZeVSQ+Wpvok0e2Wz4/3Wiu4rFVKFuOJgYcVGt
 7lBGU+/DG21CDm9guxVmLEZe7WruICEQFwF+SyODimZKFDZdF81qMh8UCCajxmYPV7YR
 Pt9F7LSN+OZ06Bb3JJvEB1Oc5L3c8hJIpgm6kqjQUegYJi1Pv2hNxHWpJoQZUB0Xsffn
 y6PvQde6jgOoYBwyM4CxlDg0+TNe6Z5UClQaZg8BZdFtl0vWkCDt0aBaT5pqrdBIVWwG
 6LuA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrfHVZNZ2/UEOlx2JuxblMd8/wviwDiOG3gPqEUaeLrygYjMEpIH06y9Zo30Jted6WUbO1w3txvjQ==@nongnu.org
X-Gm-Message-State: AOJu0YxBScQSnx/Zsz+7uwVNMgheRtrqPd4aJt4rY4WYonAfNDKYu/9n
 nwzWwFD5xEl7SUnYqnZzgPVy9BZ0I/Zc/NGEMQ7V3O7+bV64SKcjqYNr+mVAbLrH
X-Gm-Gg: AfdE7cmMgSsYrUqGi3BGSx+oAvKqg7A2qAHdvy9S1+0mYwNeLgQfvfkvlxkE8exBEG7
 3Ov9brwael8AODddth8+PFg9bh+k5nU50ZduTGZzj6+rSzBsexI3hcnGqvmQF865wK49JDACga2
 SNDucJe6N4HXhuPVFr52PBM5fThlnQ3zx1fCnCzu4nTSzQ8Bnhx4L1R04xbUhzgrte8Vp+Mjvp0
 JbHp6cNPCC39k1zIVHijYgYLHr4uVTNr7J+T5Mm9nIjaFNXsMLsU+bZswbXBVr2vy4efNNtBgLi
 k0pL/EzsexAE8wJDctX9WKeX7rGjueY5NRmYdohiPj4roGmKPlm36XKuyBQNdu7+HExc2BjGySe
 qbpJl1+N/5NzxnxG/jroEHUHvBEOPYQ/mN0BZP6eDmKGI3BPUxOT9Pvr7j84t7EW9wsihsJliIp
 v+2wa0ZTWiLYqW2IUaMRcK5i7trSivoaWIeh/CFQ==
X-Received: by 2002:a05:6808:1a0b:b0:490:af61:8830 with SMTP id
 5614622812f47-4a495e16444mr5119464b6e.3.1784222875748; 
 Thu, 16 Jul 2026 10:27:55 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
 [209.85.167.179]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4a41f5b69bfsm13283875b6e.17.2026.07.16.10.27.54
 for <qemu-arm@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 10:27:55 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-4877a7b451dso4072749b6e.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2026 10:27:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2VG0M0Wgwf6rMNZ8h3tC/uB6OqNDM53yVXhGHfCKmej449ZZUSN4+j3aJSat7g/rpi884aXFCtA==@nongnu.org
X-Received: by 2002:a05:6808:5393:b0:485:48da:133d with SMTP id
 5614622812f47-4a495e65f8dmr5457005b6e.10.1784222874593; Thu, 16 Jul 2026
 10:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
 <CAFEAcA9LCRKmU+r77zGp+4Rgd-uaZLPnoPPQDSfG8X5eeiynJA@mail.gmail.com>
 <91ad4c80-adc6-4f37-8346-20230638e5f0@oss.qualcomm.com>
 <CAFEAcA-hnm17d4PR0wmaKwQmM-K50nHeRYv0a-pCk3J1qUbPsg@mail.gmail.com>
In-Reply-To: <CAFEAcA-hnm17d4PR0wmaKwQmM-K50nHeRYv0a-pCk3J1qUbPsg@mail.gmail.com>
From: Leesoo Ahn <lsahn@ooseel.net>
Date: Fri, 17 Jul 2026 02:27:42 +0900
X-Gmail-Original-Message-ID: <CANTT7qh6X7ESRwgfM5PRkfCx9BSVUXHy8GL+n8SmX3LtusWiGw@mail.gmail.com>
X-Gm-Features: AUfX_mwX-oH7xTIBahJbzBsn_H3IPboItZP6cQIpBWcV3Pl7WpvRiXf5alPdeZo
Message-ID: <CANTT7qh6X7ESRwgfM5PRkfCx9BSVUXHy8GL+n8SmX3LtusWiGw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: panic the guest if an unhandled exception
 occurs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=yisooan.dev@gmail.com; helo=mail-oi1-f182.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

2026=EB=85=84 7=EC=9B=94 13=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 6:34, P=
eter Maydell <peter.maydell@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Fri, 10 Jul 2026 at 23:56, Philippe Mathieu-Daud=C3=A9
> <philmd@oss.qualcomm.com> wrote:
> >
> > On 10/7/26 17:37, Peter Maydell wrote:
> > > On Tue, 23 Jun 2026 at 13:56, Leesoo Ahn <lsahn@ooseel.net> wrote:
> > >>
> > >> It's worth cleaning up all resources that the guest taking and to qu=
it
> > >> if an exception in el1 could not be resolved.
> > >>
> > >> Otherwise, the guest will get in the infinite black-hole by
> > >> unmodified pc.
> > >>
> > >> Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
> > >> ---
> > >>   target/arm/hvf/hvf.c | 1 +
> > >>   1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > >> index 8b902c6882..4358cf90e8 100644
> > >> --- a/target/arm/hvf/hvf.c
> > >> +++ b/target/arm/hvf/hvf.c
> > >> @@ -2533,6 +2533,7 @@ static int hvf_handle_exception(CPUState *cpu,=
 hv_vcpu_exit_exception_t *excp)
> > >>           cpu_synchronize_state(cpu);
> > >>           trace_hvf_exit(syndrome, ec, env->pc);
> > >>           error_report("0x%llx: unhandled exception ec=3D0x%x", env-=
>pc, ec);
> > >> +        qemu_system_guest_panicked(cpu_get_crash_info(cpu));
> > >>       }
> > >
> > > We should do something here, but my question is whether
> > > qemu_system_guest_panicked() is the right thing. We mostly
> > > use that for "the guest OS wants to tell QEMU that it has
> > > panicked, so QEMU can reflect that to the user and perhaps
> > > reboot or exit", though we do in a few places use it for
> > > things that are more like "we don't handle this case". I'm
> > > not sure exactly what the right thing to do here is, though.
> >
> > We usually abort() for programming errors (here unimplemented
> > case) and don't let the guest mis-behave.
>
> We've definitely used that strategy in the past (either directly,
> or indirectly via hw_abort() or cpu_abort()), but I think these
> days we'd prefer not to let the guest trigger QEMU to abort().
> Some of those cases we've been able to convert to LOG_GUEST_ERROR
> and continue in some manner, but some cases are just not
> continuable from.
>
> I think we could probably use a better mechanism for "something
> went badly wrong and we can't continue executing the guest", where
> e.g. we can suspend the VM and let the operator look at its state:
>  https://lore.kernel.org/qemu-devel/alSqlDRT9L8OqAso@redhat.com/T/#m9ab2f=
4a819e33cd5ac0f6d22ab30f98a0d599866

I keep my eyes on the thread and agree with your idea.

>
> For this specific patch: what is the case where we get into this
> codepath (and in particular what is the EC_FOO exception subtype)?
> Maybe the fix is to handle that case. Compare an earlier thread:
> https://lore.kernel.org/qemu-devel/8D0BCB24-BB1B-40EF-A361-0F79D65600AE@u=
npredictable.fr/
>
> If we're getting here by falling through from EC_INSNABORT,
> I think that can happen if the guest tries to execute from
> an MMIO region.

EC_DATABORT already deals with traps by accessing MMIO regions.
Yet I have no idea what kind of instruction abort could be raised in MMIO.

BR,
Leesoo

