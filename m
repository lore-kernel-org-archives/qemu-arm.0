Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE68D3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 05:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSqDD-00026C-00; Tue, 09 Dec 2025 00:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <bounce.3x13pqet37hzk87=y5xqbsxud9dg=bkxvxiih52pv6o@em483429.turing.llc>)
 id 1vSpei-0003sP-Kt
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 23:48:56 -0500
Received: from a4i956.smtp2go.com ([158.120.83.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <bounce.3x13pqet37hzk87=y5xqbsxud9dg=bkxvxiih52pv6o@em483429.turing.llc>)
 id 1vSpea-0002CZ-Qe
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 23:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=turing.llc;
 i=@turing.llc; q=dns/txt; s=s483429; t=1765255710; h=from : subject :
 to : message-id : date;
 bh=r8rGopfBw6bwJy23KqsbmOwKGLXJuHKMEv8Nxq99UH0=;
 b=ZDJ4uEc7FtWS1wY/C3JnvsDuhR3Uaa8u/kxfurFuScSEpy0cjRNvsD5UX/CGA8dLM8iI1
 bvfDgvpuO0vAfpHxo3H+md2buI4STUWxP5UF4xaLO5CL9YWLDof2xGA1FHGINucQ1KLXOEK
 gKyZmvCHrARyTC/ohkbbgL2hWGq8MzDADaZFA7f/ARoo2FdI9FScNcO5Hw407rXjB6yq6us
 v6hZvVm9nRtTkhRJ2s0fcStPFv3EG+WNAY8idgET2L+4dMmssRTdYJPPTAI63seyUEYeKPy
 lsxcNJB+cJ1qij0PPRgL+FSxI12nqI3y+1hBt0CBSC9FResC8zKjpj+DWi7w==
Received: from [10.159.238.187] (helo=mail-ed1-f49.google.com)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 (Exim 4.98.1-S2G) (envelope-from <osy@turing.llc>)
 id 1vSpeI-4o5NDgrkUQI-h2qw for qemu-arm@nongnu.org;
 Tue, 09 Dec 2025 04:48:30 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-647a3bca834so6700079a12.2
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 20:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbJ0pPhUfqHXj5iJ9obpLO9itG2taFJWwI9Zbcn7ht2n6khb+SFnz5rra9aYCGPL1A8qkB/5JXNw==@nongnu.org
X-Gm-Message-State: AOJu0YzS8mQqXHy5c99Pb72o5QJKzQVH6VRjJQKGMa7VNrzKr1qw+11n
 REOQH9dpy8Mz6WS6Uw9felxf9or65GJStPxOkakwPABQMyr2M6CLkH9vro643dxSrGrRKnwp/bW
 UJ8Hd/Z1P4o9xhME1+rqUq+12NJclJtI=
X-Google-Smtp-Source: AGHT+IExPtGph5JgSBOK7fTmMQ6mGMJ690P/V1G3eZMJCzlAD8HkiiZY2Y3r5asH5eeIQYjYEt6da3T/mBDiywvpcdI=
X-Received: by 2002:a05:6402:5343:10b0:649:296a:62b7 with SMTP id
 4fb4d7f45d1cf-649296a6310mr5300171a12.29.1765255709462; Mon, 08 Dec 2025
 20:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
 <20251205151115.2035930-3-alex.bennee@linaro.org>
 <ff000682-b14d-4152-88b3-cb2761b60bc1@linux.dev>
 <87zf7shped.fsf@draig.linaro.org>
 <0c2f64fa-a635-4593-8631-12a40af4a79b@linux.dev>
In-Reply-To: <0c2f64fa-a635-4593-8631-12a40af4a79b@linux.dev>
From: osy <osy@turing.llc>
Date: Mon, 8 Dec 2025 20:48:17 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCRmFGeMBYH-hzRb40DMJR78rVFDcBnOtLR-zJjouUXoA@mail.gmail.com>
X-Gm-Features: AQt7F2ruaS7DqZo7bkDs1u0G6uoCrW8rqyJ0LYut7us9fHTm33Jft4iN9QGSz1I
Message-ID: <CA+E+eSCRmFGeMBYH-hzRb40DMJR78rVFDcBnOtLR-zJjouUXoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: ensure PSCI register updates are flushed
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Feedback-ID: 483429m:483429abrvJvs:483429sXWb4exm9p
X-smtpcorp-track: oJdZVBs1W_49.JI-vnoLEOD25.nzoLLw_envd
Received-SPF: pass client-ip=158.120.83.188;
 envelope-from=bounce.3x13pqet37hzk87=y5xqbsxud9dg=bkxvxiih52pv6o@em483429.turing.llc;
 helo=a4i956.smtp2go.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Dec 2025 00:24:33 -0500
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

Tested-by: Joelle van Dyne <j@getutm.app>

(With HV_EXIT_REASON_CANCELED change, otherwise it hangs on shutdown)

On Mon, Dec 8, 2025 at 4:56=E2=80=AFPM Zenghui Yu <zenghui.yu@linux.dev> wr=
ote:
>
> On 2025/12/9 01:08, Alex Benn=C3=A9e wrote:
> > Zenghui Yu <zenghui.yu@linux.dev> writes:
> >
> > > Hi Alex,
> > >
> > > On 2025/12/5 23:11, Alex Benn=C3=A9e wrote:
> > > > When we handle a host call we report state back to the caller via
> > > > registers. Set vcpu_dirty to indicate QEMU is currently the referen=
ce
> > > > and hoist the flush_cpu_state() and make the call unconditional.
> > > >
> > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3228
> > > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >
> > > This fixes the guest boot issue.
> > >
> > > However I notice that some (all?) HMP commands (e.g., "info registers=
")
> > > don't return and result in guest hang. Haven't dig further though.
> >
> > Does this fix it:
> >
> > --8<---------------cut here---------------start------------->8---
> > target/arm: make HV_EXIT_REASON_CANCELED leave main loop
> >
> > Without this we can spin tightly in the main HVF dispatch loop and
> > never release the lock long enough.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > 1 file changed, 1 insertion(+)
> > =EE=98=9E target/arm/hvf/hvf.c | 1 +
> >
> > modified   =EE=98=9E target/arm/hvf/hvf.c
> > @@ -2020,6 +2020,7 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vc=
pu_exit_t *exit)
> >          break;
> >      case HV_EXIT_REASON_CANCELED:
> >          /* we got kicked, no exit to process */
> > +        ret =3D -1;
> >          break;
> >      default:
> >          g_assert_not_reached();
> > --8<---------------cut here---------------end--------------->8---
>
> Yes it works. Please feel free to add
>
> Tested-by: Zenghui Yu <zenghui.yu@linux.dev>
>
> on it and patch #2. Thanks for the fixes!
>
> Zenghui
>

