Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp47965lfy;
        Mon, 10 Aug 2020 20:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGnBxi55AkkskLzZ7x1nwUaG2ceNpOI6h7LYN0+MDlORCcc728rKOLb0kEFLEtQdt9KbCp
X-Received: by 2002:a25:f30a:: with SMTP id c10mr18018651ybs.522.1597115768599;
        Mon, 10 Aug 2020 20:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597115768; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/1I0fxXwzX95+o5bS/+fMzWbDb58XqrMviOcL9wFRmTfBHkxj7dDx29dvee9WcWOk
         l7To07vp+rsbv8r/ze5ReoZ+/GOf9NTeslqOtoo2L631j7BkOxOWnAH3nsb0kvFK0VOr
         TPe6VGXEuKL0lcZYBNT8LOllsWzZbx2C+WwjuRuDVM4gpX7dQT/ZRelwAWN9jPUuJAah
         nB8h51586O9xjLVeXvnNgBA+1akKGotmNMwcIRZ0up0dU81sj1hAG7VBuOFPPIuVZzsM
         k/qtOPXMDBjaniTJ4jxvkrG+C6X1st3iCx5gKkTxdxRryZuPzttBcdC3IfkFc5PyVexT
         6aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NTK9y2WF6s6GOtcvPJH1+1SKcribkFootE2GPoMEh6s=;
        b=SHvuXF6X5Gddt9a4rzt9SImVvAcNqXSDrb36fceptF7ItGrUz0xMbXsaLx8wG5EQeA
         WsO3PHECIN5QBf2aVvhaIyud5EpScP/PlWZzseqP7N57l2YYJ3xD8YVI2uC9mfvH3Acd
         GZ5fAUEqis4mgvEgLqVyqvQn3OVqDeBpEvG/4jpuWnQc4OVtRiGw541+mkJSYDT0sGjn
         +UjZsmCzjFoaMozxf6+BzEKCMWOSgfSv4ECN5esGd0mxhE12jtxxG+gBnfZj8SaoQHKs
         H9T/J5Z0O7B1tWX86uwAw7DbA39fs+RrESv8w86GhM5WBFML1nduBiYzOBKRZs3AqUIj
         6o/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ABSia0dP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d68si17946785ybh.94.2020.08.10.20.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 20:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ABSia0dP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5Klj-0005xv-VU
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 23:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5Klb-0005xg-PT
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 23:15:59 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5KlY-0004oj-C9
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 23:15:59 -0400
Received: by mail-io1-xd43.google.com with SMTP id k23so11166804iom.10
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTK9y2WF6s6GOtcvPJH1+1SKcribkFootE2GPoMEh6s=;
 b=ABSia0dP5u6HOV6wB8e+yW1zK8Jna1L3MPh/LOxSpWADkOJAHSPSOSepvDSPk2Rt/w
 VfYRQpsuQLSZp0sM7tMUd+g1BjV3JrLy8EJfHu0jm4maHtXHmcMrCzVkGEBNVwqFgKLz
 BdPbdU3WbYtOuEDA2XMnkxJC7MYi58gs4ZtTIIU7nC2kVP3oj//VQ1WXR+3jane79gBO
 6a/Ke6A5+yR/YtqDuA6Htb30gDd/bLQ3ewCUZwNQA9MHqQqJbSq2DrNp0uGCJrygZjuv
 SNxUbBC/zReDidOBzLJR5xLU8p/MRaGYUPUt0k1hXr1No5BzZxfF1jkfau7O21tTDcO7
 BvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTK9y2WF6s6GOtcvPJH1+1SKcribkFootE2GPoMEh6s=;
 b=nWeaMOdM1xNX15Lj9mNLUb0LTDnrrEcUkG5uaoWqoAqupX7CJ1vohF62QPYBNV2Gxm
 Ueod/D4caxuEqglgqOkLzfOLNcXM5+wlaX4rIjs/dxhxl8BQiQ5FShVQ9xm8V7nC1yL9
 jMFf+o1jypfP3OweRmQfQncE70kiGPfoM8bSDPabW8vyWNP+LAFhjj1CuNNeECzwhHR9
 N+BWEjlYvlUwfLJfpX+IjT+5RixoeNjZl770sMd5gvsstQ0lrutvbv5R0N6ui75oaP72
 AjADsQOOMcQ149vwVyvQAdT4HspCUXRk4cRlSdvioqbzWFEX/OMN/DPeICL4GCrXTij0
 mQWw==
X-Gm-Message-State: AOAM531cvyCIynKMYEMK6Pu5yq4OCywGanfQTxFdpRTgWImVCUPx6UN3
 +p/heTqx4EXvhSRP8CXRj7q/d3MtOSbiS1JaqIEj
X-Received: by 2002:a02:838e:: with SMTP id z14mr24562907jag.84.1597115754078; 
 Mon, 10 Aug 2020 20:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
 <20200810111640.ykejphmuyirncjwv@kamzik.brq.redhat.com>
In-Reply-To: <20200810111640.ykejphmuyirncjwv@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 11 Aug 2020 11:15:42 +0800
Message-ID: <CAJc+Z1F_vFdJuy2kZnj0gZSOd_8-=rSfWFHjQSPU5XEKQ2KZkg@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm/cpu: spe: Enable spe to work with host cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000307ca805ac917d6c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0rqDBnGocFI/

--000000000000307ca805ac917d6c
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Aug 2020 at 19:16, Andrew Jones <drjones@redhat.com> wrote:
>
> On Fri, Aug 07, 2020 at 08:10:37AM +0000, Haibo Xu wrote:
> > Turn on the spe cpu property by default when working with host
> > cpu type in KVM mode, i.e. we can now do '-cpu host' to add the
> > vSPE, and '-cpu host,spe=off' to remove it.
>
> -cpu max with KVM should also enable it by default
>

Ok, will fix it!

> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  target/arm/cpu.c   | 4 ++++
> >  target/arm/kvm64.c | 9 +++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 67ab0089fd..42fa99953c 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1719,6 +1719,10 @@ static void arm_cpu_realizefn(DeviceState *dev,
Error **errp)
> >          cpu->pmceid1 = 0;
> >      }
> >
> > +    if (!cpu->has_spe || !kvm_enabled()) {
> > +        unset_feature(env, ARM_FEATURE_SPE);
> > +    }
>
> I don't think this should be necessary.
>

Yes, I have tried to remove this check, and the vSPE can still work
correctly.
But I don't know whether there are some corner cases that trigger an error.
The similar logic is added in commit 929e754d5a to enable vPMU support.

> > +
> >      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> >          /* Disable the hypervisor feature bits in the processor feature
> >           * registers if we don't have EL2. These are id_pfr1[15:12] and
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index be045ccc5f..4ea58afc1d 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -679,6 +679,7 @@ bool
kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >      features |= 1ULL << ARM_FEATURE_AARCH64;
> >      features |= 1ULL << ARM_FEATURE_PMU;
> >      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
> > +    features |= 1ULL << ARM_FEATURE_SPE;
>
> No, SPE is not a feature we assume is present in v8.0 CPUs.
>

Yes, SPE is an optional feature for v8.2. How about changing to the
following logic:

spe_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SPE_V1)
> 0;
if (spe_supported) {
    features |= 1ULL << ARM_FEATURE_SPE;
}

> >
> >      ahcf->features = features;
> >
> > @@ -826,6 +827,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >      } else {
> >          env->features &= ~(1ULL << ARM_FEATURE_PMU);
> >      }
> > +    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SPE_V1)) {
> > +        cpu->has_spe = false;
> > +    }
> > +    if (cpu->has_spe) {
> > +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
> > +    } else {
> > +        env->features &= ~(1ULL << ARM_FEATURE_SPE);
> > +    }
>
> The PMU code above this isn't a good pattern to copy. The SVE code below
> is better. SVE uses an ID bit and doesn't do the redundant KVM cap check.
> It'd be nice to cleanup the PMU code (with a separate patch) and then add
> SPE in a better way.
>

I noticed that Peter had sent out a mail
<https://www.mail-archive.com/qemu-devel@nongnu.org/msg727640.html> to talk
about the feature-identification strategy.
So shall we adapt it to the vPMU and vSPE feature?

> >      if (cpu_isar_feature(aa64_sve, cpu)) {
> >          assert(kvm_arm_sve_supported());
> >          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> > --
> > 2.17.1
> >
>
> Thanks,
> drew
>

--000000000000307ca805ac917d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, 10 Aug 2020 at 19:16, Andrew Jones &lt;<a href=3D"=
mailto:drjones@redhat.com">drjones@redhat.com</a>&gt; wrote:<br>&gt;<br>&gt=
; On Fri, Aug 07, 2020 at 08:10:37AM +0000, Haibo Xu wrote:<br>&gt; &gt; Tu=
rn on the spe cpu property by default when working with host<br>&gt; &gt; c=
pu type in KVM mode, i.e. we can now do &#39;-cpu host&#39; to add the<br>&=
gt; &gt; vSPE, and &#39;-cpu host,spe=3Doff&#39; to remove it.<br>&gt;<br>&=
gt; -cpu max with KVM should also enable it by default<br>&gt;<br><br>Ok, w=
ill fix it!<br><br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Haibo Xu &lt;<a hr=
ef=3D"mailto:haibo.xu@linaro.org">haibo.xu@linaro.org</a>&gt;<br>&gt; &gt; =
---<br>&gt; &gt; =C2=A0target/arm/cpu.c =C2=A0 | 4 ++++<br>&gt; &gt; =C2=A0=
target/arm/kvm64.c | 9 +++++++++<br>&gt; &gt; =C2=A02 files changed, 13 ins=
ertions(+)<br>&gt; &gt;<br>&gt; &gt; diff --git a/target/arm/cpu.c b/target=
/arm/cpu.c<br>&gt; &gt; index 67ab0089fd..42fa99953c 100644<br>&gt; &gt; --=
- a/target/arm/cpu.c<br>&gt; &gt; +++ b/target/arm/cpu.c<br>&gt; &gt; @@ -1=
719,6 +1719,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **e=
rrp)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;pmceid1 =3D 0;<=
br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0} =C2=A0<br>&gt; &gt;<br>&gt; &gt; + =C2=
=A0 =C2=A0if (!cpu-&gt;has_spe || !kvm_enabled()) {<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0unset_feature(env, ARM_FEATURE_SPE);<br>&gt; &gt; + =C2=
=A0 =C2=A0}<br>&gt;<br>&gt; I don&#39;t think this should be necessary.<br>=
&gt;<br><br>Yes, I have tried to remove this check, and the vSPE can still =
work correctly.<br>But I don&#39;t know whether there are some corner cases=
 that trigger an error.<br>The similar logic is added in commit 929e754d5a =
to enable vPMU support.<br><br>&gt; &gt; +<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0if (!arm_feature(env, ARM_FEATURE_EL2)) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Disable the hypervisor feature bits in the processor fe=
ature<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * registers if we don=
&#39;t have EL2. These are id_pfr1[15:12] and<br>&gt; &gt; diff --git a/tar=
get/arm/kvm64.c b/target/arm/kvm64.c<br>&gt; &gt; index be045ccc5f..4ea58af=
c1d 100644<br>&gt; &gt; --- a/target/arm/kvm64.c<br>&gt; &gt; +++ b/target/=
arm/kvm64.c<br>&gt; &gt; @@ -679,6 +679,7 @@ bool kvm_arm_get_host_cpu_feat=
ures(ARMHostCPUFeatures *ahcf)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0features |=
=3D 1ULL &lt;&lt; ARM_FEATURE_AARCH64;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0fea=
tures |=3D 1ULL &lt;&lt; ARM_FEATURE_PMU;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0=
features |=3D 1ULL &lt;&lt; ARM_FEATURE_GENERIC_TIMER;<br>&gt; &gt; + =C2=
=A0 =C2=A0features |=3D 1ULL &lt;&lt; ARM_FEATURE_SPE;<br>&gt;<br>&gt; No, =
SPE is not a feature we assume is present in v8.0 CPUs.<br>&gt;<br><br>Yes,=
 SPE is an optional feature for v8.2. How about changing to the following l=
ogic:<br><br>spe_supported =3D ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_C=
AP_ARM_SPE_V1) &gt; 0;<br>if (spe_supported) {<br>=C2=A0 =C2=A0 features |=
=3D 1ULL &lt;&lt; ARM_FEATURE_SPE;<br>}<br><br>&gt; &gt;<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0ahcf-&gt;features =3D features;<br>&gt; &gt;<br>&gt; &gt; =
@@ -826,6 +827,14 @@ int kvm_arch_init_vcpu(CPUState *cs)<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0} else {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0en=
v-&gt;features &amp;=3D ~(1ULL &lt;&lt; ARM_FEATURE_PMU);<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0}<br>&gt; &gt; + =C2=A0 =C2=A0if (!kvm_check_extension(cs-=
&gt;kvm_state, KVM_CAP_ARM_SPE_V1)) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cpu-&gt;has_spe =3D false;<br>&gt; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt;=
 + =C2=A0 =C2=A0if (cpu-&gt;has_spe) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cpu-&gt;kvm_init_features[0] |=3D 1 &lt;&lt; KVM_ARM_VCPU_SPE_V1;<br>=
&gt; &gt; + =C2=A0 =C2=A0} else {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;features &amp;=3D ~(1ULL &lt;&lt; ARM_FEATURE_SPE);<br>&gt; &gt;=
 + =C2=A0 =C2=A0}<br>&gt;<br>&gt; The PMU code above this isn&#39;t a good =
pattern to copy. The SVE code below<br>&gt; is better. SVE uses an ID bit a=
nd doesn&#39;t do the redundant KVM cap check.<br>&gt; It&#39;d be nice to =
cleanup the PMU code (with a separate patch) and then add<br>&gt; SPE in a =
better way.<br>&gt;<br><br>I noticed that Peter had sent out a <a href=3D"h=
ttps://www.mail-archive.com/qemu-devel@nongnu.org/msg727640.html">mail</a> =
to talk about the feature-identification strategy.<div>So shall we adapt it=
 to the vPMU and vSPE feature?<br><br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0if (cpu=
_isar_feature(aa64_sve, cpu)) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0assert(kvm_arm_sve_supported());<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cpu-&gt;kvm_init_features[0] |=3D 1 &lt;&lt; KVM_ARM_VCPU_SVE;=
<br>&gt; &gt; --<br>&gt; &gt; 2.17.1<br>&gt; &gt;<br>&gt;<br>&gt; Thanks,<b=
r>&gt; drew<br>&gt;</div></div>

--000000000000307ca805ac917d6c--
