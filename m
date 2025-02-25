Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp143551njg;
        Tue, 25 Feb 2025 03:20:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXv8/O6YBYG/RcGVn9AUi1RpRgD35LdwbIbUeaLod4m0wzsKrd5iJxkqFBCl4epxRu/tu9zaOmjJukGTA==@linaro.org
X-Google-Smtp-Source: AGHT+IHzgJpq/eBoFjLH+TED2Mm8py/nwJQpKwHMPeV3RjspLmWxInk5XhJpr4BUd63qpG9jy/iq
X-Received: by 2002:a05:6214:d8a:b0:6e6:64a5:e18d with SMTP id 6a1803df08f44-6e6ae7f8290mr227828146d6.17.1740482427729;
        Tue, 25 Feb 2025 03:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740482427; cv=none;
        d=google.com; s=arc-20240605;
        b=EBE0e+zEzM6PBQ/GI/UAzrPNp91zYeztgPkvUs7dsdgaEksXOz1EmtCTGvwIH5ieoR
         eXNiFHUqWQWBdT7upnnO4cwQTdCE3om2ctyqk8JZc9BRAux4RgTUdyglhgdcbggI2Sdr
         4zGgBNIlvJ5qguDi45T7mSF9S1DrJicxwUEt+EmCzQxL9o6YJeCqrSf2H2ZXdT0T29Qh
         ynMK+TSbFfg0n/AxL4p+X2+lQAjc/ZMY58DqMCs0GxrTAQ+Q44ASHUt+49kg3vfpie8i
         dtISmqZviidaH5+cwJxgQeU47NnJaOcfOksxiaenk3PR84Da8Eib2/9QS1IHwv5I0pkJ
         MOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=zxY0dOAvvI9NSSk4hF/EMaQwGuxxBLeT3lHLJnZFT04=;
        fh=CcpaOlxjsegGf+nYxbkupvFa8sSMJvxcex6xFRIgJAs=;
        b=MZrUdCMXya97hOjmXvKHIZUTyJ0y3B6VGk5qsx8A0f3zgRK8IRr+283vyQD7rSTeo+
         IObq95LvPsChj765oJS8XHskHMhhpMtp+7l6J1saNzWl1SxoHIzBAzwFYvHo7d8GvJVQ
         ppYz2aPivZx9KkpBry2eChWS9Tbgm6i6aOUYU9SxFzImcDWkLk/vxnU0bkB3M+3V6tlB
         UHKDsS7apm8Nz4oDqbC/ac3Vt1QaOGJ1m9yy33kIml+t5zp4cOmfvOI1glpY45102LxG
         fvrEolF/KDGK8mc8nCGISsa8Xby9IAEjwI9u9HTCwoYtRUUuZa21tuVyMYJTl/iwKHgp
         veVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fhooA/K0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b14664dsi14401606d6.507.2025.02.25.03.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 03:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fhooA/K0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmsyq-0001q0-NB; Tue, 25 Feb 2025 06:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tmsyi-0001oc-NG
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 06:19:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tmsyZ-0000zS-2H
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 06:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740482384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxY0dOAvvI9NSSk4hF/EMaQwGuxxBLeT3lHLJnZFT04=;
 b=fhooA/K0Q4MV+mAKHxpB3XNaUSNFsbLH34EP4RLFIPu5fd/MetBa+y5pPU9N5SPAvD/U3e
 tVzITF+tv6GIZDydKxZxurEHtokzSpG+gky/HqRWnfKo8uTRox9QwHXA5VPkgT+yVlzBL0
 KUkHLfgo06334rJduCo0Ntw1Lc2+BfQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-YSo6OldFPlaxHAIXUpW9sw-1; Tue, 25 Feb 2025 06:19:43 -0500
X-MC-Unique: YSo6OldFPlaxHAIXUpW9sw-1
X-Mimecast-MFC-AGG-ID: YSo6OldFPlaxHAIXUpW9sw_1740482382
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f42f21f54so2116830f8f.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 03:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740482382; x=1741087182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0io6ySSM5ej83Ld1cHgExCtQZQEElVh+dWV/5hGTYI=;
 b=qNFMPxvBAvPppOd9xKCHEn0feG8B7G6GLcwivevkvI3ckCtm/k+xaxH9ANENAkVCxT
 0DGrZn8Wv0nr6lW5P8zUuNOY5zRqIg9G6RTjj+5g1TbWeuW9bM+72YQ520Y7IhCY8vIE
 YTQdOqBXhzWHflGTcETMNms99Dyu3Dl/JrQBVmNjnKsKI/q3hy+caOoIARtiyfLWrMQV
 gnzRffRyrAeYNFmFgorFlAcR5v2aFNsmXLbX54pqfrhbvpMd+m+8r2zAsKnVRIZqEiCx
 2xGkcwBeOaKZzonbWYbmfUndRUhr6OyuvvhIOtUDXsqb8kHoLWE1xGXUqCSzYjqbdVJY
 bPew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFKrEhtO6fUHelJBxzdzA859e7jS7iszY0JWJytbP9OJxdpRQmr1MvPuS5SIsS7fHkw3+8POZ2jg==@nongnu.org
X-Gm-Message-State: AOJu0YwhgPpRqkSkAymiZokQk0cu2TjpBX2toP0/oS76XlgskmaHWyqi
 aSrR6cRfTXcFP8AR2QsO8nP5yjNTlhMYjvxCxkyeFBKcTn4x9/D8fHlYrm0rHkXzi17rtKdNi1j
 NkxViDZ1rQwK7mTxxMFey/wSvTEruO4rGNIPgPBnjX7BVLY7/6w==
X-Gm-Gg: ASbGncuZ/tFXfi4rVLPLewJbtt4wsBUJJO4c5S5CVrZKTxibvJOnnztEEtgzByWeoIv
 oh2Bwm++PcIX3xqdmvuEKEcylbJdRtVVH8o2uJ9bVLoBvrFu9UThuJ0XPYOoTijFWzVlidkZjAY
 QVUknU4M/JdfWqY5zMxbrZMHgkz5/1c2k0zCGxmd86VWZfpnfIPt+kLd4CjOkhTZH+YHYkC1m6H
 TkFZ3KPSeVgp6DoAJb9K1mmZRohV52/PlMcwBXcc0akcsHTXNsXSgwN5MreAAvIcqyLlL+ySvzO
 EqnBmzP/NkCBoe0bN8gwzFUpxaiv+KBCIXUgTonoZeIdg79oUaZfhIz+XOYyKGQ=
X-Received: by 2002:a5d:6dae:0:b0:38f:4b2c:2464 with SMTP id
 ffacd0b85a97d-38f708626c6mr13087752f8f.55.1740482382300; 
 Tue, 25 Feb 2025 03:19:42 -0800 (PST)
X-Received: by 2002:a5d:6dae:0:b0:38f:4b2c:2464 with SMTP id
 ffacd0b85a97d-38f708626c6mr13087717f8f.55.1740482381764; 
 Tue, 25 Feb 2025 03:19:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cc6asm1968277f8f.35.2025.02.25.03.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 03:19:41 -0800 (PST)
Date: Tue, 25 Feb 2025 12:19:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <gengdongjiu1@gmail.com>, <peter.maydell@linaro.org>,
 <pbonzini@redhat.com>, <shan.gavin@gmail.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
Message-ID: <20250225121939.7e0e2304@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250221110435.00004a3b@huawei.com>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-5-gshan@redhat.com>
 <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
 <7caa54df-abe1-4833-bb59-cb83f8241962@redhat.com>
 <20250221110435.00004a3b@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9dOd909ihAd2YaPktIKYNXVh4mMBCYERBFgSuoVOZL4_1740482382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Cc3z04lVHdbQ

On Fri, 21 Feb 2025 11:04:35 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Fri, 21 Feb 2025 15:27:36 +1000
> Gavin Shan <gshan@redhat.com> wrote:
>=20
> > On 2/20/25 3:55 AM, Igor Mammedov wrote: =20
> > > On Fri, 14 Feb 2025 14:16:35 +1000
> > > Gavin Shan <gshan@redhat.com> wrote:
> > >    =20
> > >> The error -1 is returned if the previously reported CPER error
> > >> hasn't been claimed. The virtual machine is terminated due to
> > >> abort(). It's conflicting to the ideal behaviour that the affected
> > >> vCPU retries pushing the CPER error in this case since the vCPU
> > >> can't proceed its execution.
> > >>
> > >> Move the chunk of code to push CPER error to a separate helper
> > >> report_memory_errors() and retry the request when the return
> > >> value from acpi_ghes_memory_errors() is greater than zero.
> > >>
> > >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> > >> ---
> > >>   target/arm/kvm.c | 31 +++++++++++++++++++++++++------
> > >>   1 file changed, 25 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > >> index 5c0bf99aec..9f063f6053 100644
> > >> --- a/target/arm/kvm.c
> > >> +++ b/target/arm/kvm.c
> > >> @@ -2362,6 +2362,30 @@ int kvm_arch_get_registers(CPUState *cs, Erro=
r **errp)
> > >>       return ret;
> > >>   }
> > >>  =20
> > >> +static void report_memory_error(CPUState *c, hwaddr paddr)
> > >> +{
> > >> +    int ret;
> > >> +
> > >> +    while (true) {
> > >> +        /* Retry if the previously report error hasn't been claimed=
 */
> > >> +        ret =3D acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr=
, true);
> > >> +        if (ret <=3D 0) {
> > >> +            break;
> > >> +        }
> > >> +
> > >> +        bql_unlock();
> > >> +        g_usleep(1000);   =20
> >=20
> > Igor, thanks for the detailed comments. Sorry for a bit delay of the re=
ply, I
> > was checking the code to understand it better :) =20
>=20
> This is moderately tricky stuff so I'm not 100% sure of some of the thing=
s
> I said below, but will be traveling for next few weeks so want to get som=
e
> comments out before that!
>=20
> >  =20
> > > even with bql released it's not safe to loop in here.
> > > consider,
> > >    a guest with 2 vcpus
> > >      * vcpu 1 gets SIGBUS due to error
> > >      * vcpu 2 trips over the same error and gets into this loop
> > >      * on guest side vcpu 1 continues to run to handle SEA but
> > >        might need to acquire a lock that vcpu 2 holds
> > >    =20
> >=20
> > Agreed.
> >  =20
> > > GHESv2 error source we support, can report several errors,
> > > currently QEMU supports only 1 'error status block' which
> > > can hold several error records (CPER) (though storage size is limited=
)
> > >=20
> > > 1:
> > > We can potentially add support for more GHESv2 error sources
> > > with their own Read ACK registers (let's say =3Dmax_cpus)
> > > (that is under assumption that no other error will be
> > > triggered while guest VCPUs handle their own SEA (upto clearing Read =
ACK)) =20
>=20
> This one seems straight forward but I'd kind of like to know if real syst=
ems
> do this (I'll try and find out about ours).  I don't think there is
> any association available between a cpu and and SEA source, so linux at
> least will just go looking for any that are active on each SEA.
> Locking looks fine but it won't help with performance
>=20
> > >=20
> > > 2:
> > > Another way could be for QEMU to allocate more error status _blocks_
> > > for the only one error source it has now and try to find
> > > empty status block to inject new error(s). =20
>=20
> Let me try to get my head around this one...
>=20
> Each GHESv2 entry points, indirectly, to a single error status block at a=
 time
> (only one address to read that from)  Curious quirk is the length for tha=
t
> error status block is fixed as that's just a value in GHESv2 not an indir=
ection
> via a register - however I think you can just make it 'big'.
> So what I think you are proposing here is that on read_ack write (which w=
e would
> need to monitor for, the value of the error status address register is up=
dated
> to point to next one of a queue of error blocks.

All my suggestions here aren't recommendation, but rather thinking out loud
to see if we can find a crorrect way to deal with the issue.

The part I don't fancy doing on QEMU part is read_ack write intercept.

>=20
> That can work.  I'm not sure it actually gets us anything over just queui=
ng in
> qemu and writing the same error status block.  Those status blocks can co=
ntain

benefit would be that we won't have to maintain state on QEMU side
and then migrate it.

> multiple Generic Error Data entries, but unless we have a load of them ga=
thered
> up at time of first notifying the guest, I'm not sure that helps us.
>=20
> One thing that I'm nervous about is that I can't actually find spec langu=
age
> that says that the OS 'must' reread the error status address register on
> each event. That isn't mentioned in the GHESv2 flow description which jus=
t says:

that bothers me as well.

> "
> These are the steps the OS must take once detecting an error from a parti=
cular GHESv2 error source:
> =E2=80=A2 OSPM detects error (via interrupt/exception or polling the bloc=
k status)
> =E2=80=A2 OSPM copies the error status block
> =E2=80=A2 OSPM clears the block status field of the error status block
> =E2=80=A2 OSPM acknowledges the error via Read Ack register. For example:
> =E2=80=93 OSPM reads the Read Ack register =E2=80=93> X
> =E2=80=93 OSPM writes =E2=80=93> (( X & ReadAckPreserve) | ReadAckWrite)
> "
>=20
> The linux code is confusing me, but I think it wonderfully changes
> the fixmap on every access as it needs to do an ioremap type operation
> in NMI conditions.
>=20
> > >   * it can be saturated with high rate of errors (so what do we do in=
 case it happens?) =20
>=20
> Make it big :)  But sure big just makes the condition unlikely rather tha=
n solving it.
>=20
> > >   * subject to race between clearing/setting Read ACK
> > >      (maybe it can dealt with that on side by keeping internal read_a=
ck counter) =20
>=20
> I don't think there are any races as long as we update the register only =
on clear which
> should I think happen before the next SEA can happen? My understanding, w=
hich may
> be wrong, is the OS must just take a copy of the error status block and s=
et the
> read_ack all in the exception handler.
>=20
> > >=20
> > > 3:
> > > And alternatively, queue incoming errors until read ack is cleared
> > > and then inject pending errors in one go.
> > > (problem with that is that at the moment QEMU doesn't monitor
> > > read ack register memory so it won't notice guest clearing that) =20
>=20
> We'd need to monitor it definitely.  Injecting all we have queued up
> in one go here seems like a reasonable optimization over doing them
> one at a time.
>=20
> > >=20
> > >=20
> > > Given spec has provision for multiple error status blocks/error data =
entries
> > > it seems that #2 is an expected way to deal with the problem.
> > >    =20
> >=20
> > I would say #1 is the ideal model because the read_ack_register is the =
bottleneck
> > and it should be scaled up to max_cpus. In that way, the bottleneck can=
 be avoided
> > from the bottom. Another benefit with #1 is the error can be delivered =
immediately
> > to the vCPU where the error was raised. This matches with the syntax of=
 SEA to me. =20
>=20
> I don't think it helps for the bottleneck in linux at least.  A whole bun=
ch of locks
> are taken on each SEA because of the novel use of the fixmap.  There is o=
nly one
> VA ever used to access the error status blocks we just change what PA it =
points to
> under a spin lock. Maybe that can be improved on if we can persuade peopl=
e that error
> handling performance is a thing to care about!
>=20
> >=20
> > #2 still has the risk to saturate the multiple error status blocks if t=
here are
> > high rate of errors as you said. Besides, the vCPU where read_ack_regis=
ter is acknoledged
> > can be different from the vCPU where the error is raised, violating the=
 syntax of
> > SEA.
> >=20
> > #3's drawback is to violate the syntax of SEA, similar to #2.
> >=20
> > However, #2/#3 wouldn't be that complicated to #1. I didn't expect big =
surgery to
> > GHES module, but it seems there isn't perfect solution without a big su=
rgery.
> > I would vote for #1 to resolve the issue from the ground. What do you t=
hink, Igor?
> > I'm also hoping Jonathan and Mauro can provide their preference. =20
>=20
> Ideally I'd like whatever we choose to look like what a bare metal machin=
e
> does - mostly because we are less likely to hit untested OS paths.

Ack for that but,
that would need someone from hw/firmware side since error status block
handling is done by firmware.=20

right now we are just making things up based on spec interpretation.

> > > PS:
> > > I'd prefer Mauro's series being merged 1st (once it's resplit),
> > > for it refactors a bunch of original code and hopefully makes
> > > code easier to follow/extend.
> > >    =20
> >=20
> > Sure. I won't start the coding until the solution is confirmed. All the=
 followup
> > work will base on Mauro's series.
> >  =20
> > >> +        bql_lock();
> > >> +    }
> > >> +
> > >> +    if (ret =3D=3D 0) {
> > >> +        kvm_inject_arm_sea(c);
> > >> +    } else {
> > >> +        error_report("Error %d to report memory error", ret);
> > >> +        abort();
> > >> +    }
> > >> +}
> > >> +
> > >>   void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> > >>   {
> > >>       ram_addr_t ram_addr;
> > >> @@ -2387,12 +2411,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int=
 code, void *addr)
> > >>                */
> > >>               if (code =3D=3D BUS_MCEERR_AR) {
> > >>                   kvm_cpu_synchronize_state(c);
> > >> -                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, =
paddr, false)) {
> > >> -                    kvm_inject_arm_sea(c);
> > >> -                } else {
> > >> -                    error_report("failed to record the error");
> > >> -                    abort();
> > >> -                }
> > >> +                report_memory_error(c, paddr);
> > >>               }
> > >>               return;
> > >>           }   =20
> > >    =20
> >=20
> > Thanks,
> > Gavin
> >=20
> >  =20
>=20

