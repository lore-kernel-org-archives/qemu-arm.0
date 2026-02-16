Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3194FE7BDB4
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 13:31:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vryh5-0001KX-Ao; Mon, 16 Feb 2026 08:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrygs-0001Cp-Cy
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 08:31:07 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrygp-0008VV-Kk
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 08:31:05 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7946a1f2430so25240067b3.1
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 05:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771248662; cv=none;
 d=google.com; s=arc-20240605;
 b=R6A7lDBSHBNRKSsLhZoWKYr+UEgYVVZJn4uwbep+04hgb/Gw48lW65yNcoE0MPW0rY
 FKd7YBs0xfFm2rVmNzpirSYj8BwVEDym8m5jcqdmU4EHxbMjy86kkfOeVh0K72vOyafC
 FqYzut6tD9rGanOftYDSSPVoDKcXPVaJLFz1g3Wd34H0De0asiOGY+IjA9IVpkt9wQ9y
 R0uoFq3kY7mO4m1qS1zevgSflhaXLRutDozPR+BY9SGSY8EAom8PNfAyDyT9eYrl+pu8
 jqUg3e+xvrZN6EOCrnvkYz05g7BiR/FdOhhvQznNVNCDjWd7WblfOxvJBxbxGC+O0ezU
 2XLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o3wOtoDZJ0p0jz0Xtoq03ZP4KLyE4lMLqKI4YU+J1SA=;
 fh=e6SDbZdl7IMI5RQn+AiGIRhlYrOAlgg0ietv2jpeX2o=;
 b=J4mlvizQ/awE5ikR9IsAkJfv58Zy7uI7HrJGY4s3Z3/151P3kkpUc+g6+s/VO/8VIl
 Oh49tTk9xbkg2mVJLH4E2DVu4Tafv/S5e0y32un+T2znl2mSt+UfFvW2jGd500I984e5
 tdhBVithF+ALMCu981TkOBy2u1+BUxQqZ4kEgKpzcSlW3Me3cTmfWHh9x6W2U9LuI+vA
 BLakbTXdmKnsaNap/5L9y2v9h/FnpfuhUIA2Z+TBJgnx3Aen8fx0G5i8wdiA7zuRTC/v
 vk6yIoXwWHVxBYoTCPdq9uYZlVUfkLgx1WU9fs4LzSYBTbVusL3FpOq+qA/xD7sjjvP6
 drmw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771248662; x=1771853462; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o3wOtoDZJ0p0jz0Xtoq03ZP4KLyE4lMLqKI4YU+J1SA=;
 b=HUOqqobpt9a8p4C1VaPwaeZY9T6T+cyyMbQfPLypQ2ui/IWe9UpUblcZAAacPEkiFW
 ebHIL/TkuxK7IxoE+/HPwvQEDP674GOP3urxFuRPb2Sr0u+2B7k5hyWRRQ+KstQwlMho
 c6FWWhEOJdIxL3uMlCzn4eYTx9uQlxJbs5MsiAk5MjBpw5OAS/12XHz8DH2hk+GJumDM
 APcRJ6DOjwNOqzNffNujuyAqqDz3XsY9YKBqa9JXXJjNZ6bWXaoGeUrSSlRJcPPSidu7
 vghQXrPHXj0FykpA7PEpniJW0F6erDUPwiofqx65xiGuWc1/ViTAuLCxxHmVRCesc20v
 zMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771248662; x=1771853462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3wOtoDZJ0p0jz0Xtoq03ZP4KLyE4lMLqKI4YU+J1SA=;
 b=doyXcS6YI0FjBYAssdOOYnPvXoLXA36OA6lg+xLVvA6P8AEeIyXg87Ipk5cOrlijTi
 tzOHMX/VUIz+kHGxspYTyeNse7hlWf2dzlRmjszOpplsqNDFlDEmneJga8bovWC1F0mF
 HPXsuH6d2kub4mBrMDexI+i9q2dl9/t36+gDTkapGuHLaseX9Np0gRViXjBpHLAWlNrN
 gwHqeNUyDuYEv/XN8Mdn72Vbp3TtoZqDpDJTeGEmT5IxLGEwW6q8o6mPRT/2QE+2/Dao
 OvOL7j5aHYLHPLkFI32dpA7+akSwV8nOJxO6v/ZNzJp/j6g4p+slNrJM7WaJBxg/keif
 pfNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6asCZvVELDmdJSFaGDlpQ795IfVBXajxQmpZkT9RpPBYO3c5+nX+3gMDEkiVX7RegvwBHNyek+g==@nongnu.org
X-Gm-Message-State: AOJu0Yyf04qjFMDaZz23SI+KM+zHZSXxSHPvKW4qUDBMHpPHLTdYV4ww
 rKBPpn8XLmOdVQaq/q3pyRuo1xbMYc5GJRf2DvtGEubN9JXfdgmfL4VFRt6/GZTx+KG7YJ1aN7Q
 r8ByoIvEyxBLBtt+tZjNY+KSYEZaOHcCGH1i0jCqwUQ==
X-Gm-Gg: AZuq6aJPVWpfwc8PNDkO6eC2rClrYHYPPfzN+67jJADL5IJS5cSkflUhusqIved2RUK
 L9Y9XWW8d5yS4e7iaD8SJMpiz5GRoNlrgAr0Ary74WMw17IX5/e3AcUec05HGeyBBPz3MsR4767
 VAXr8iU3RwRcJ9s3S0XQo5EwojBB0XfalaSCWxoqEPk1N1XXErq5bFrLEO8Giclo630Rr03aIGx
 FSC6alEhIomvwEcjxMLGJTvDusTrXZqU55rUyFEdIDQUonPYwrEXcV69dC9fPAhoKHiMDWruiMd
 w4bAzGAUeIE7G5+Ad5gr8jcYJa6aIJxHLtD4qOwCysm6SF3Esio8f34TPoJyjISpBGzLC+gDjUt
 HJw==
X-Received: by 2002:a53:b20c:0:b0:64a:d720:f259 with SMTP id
 956f58d0204a3-64c21b80db0mr4529065d50.85.1771248662214; Mon, 16 Feb 2026
 05:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20251202160853.22560-1-sebott@redhat.com>
 <20251202160853.22560-3-sebott@redhat.com>
 <CAFEAcA8oi1Xs2kv66dFV9NZore+Q2vHUsgMikveVdN1c+3SBJQ@mail.gmail.com>
 <9b04a20f-b708-208d-1e4e-466ec30b7bb9@redhat.com>
 <CAFEAcA-A+zW=QFdCY7z==+Z=xXfhJvPeyHhbG_MpEmpkQfrmaw@mail.gmail.com>
 <4e9470d5-ef3e-cf5c-4117-fb589d56323c@redhat.com>
In-Reply-To: <4e9470d5-ef3e-cf5c-4117-fb589d56323c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 13:30:51 +0000
X-Gm-Features: AZwV_QhGoaC3Vnb64FdYsO_8xJx-bd5rBrEQJ8-6M3I7JiVPCm-6tAEOuq08bHQ
Message-ID: <CAFEAcA8V9bjQUzUYAW7qj5fEn_f9xaPJAYpTRgvdaFq0cY3pRA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/arm/kvm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 11 Feb 2026 at 16:04, Sebastian Ott <sebott@redhat.com> wrote:
>
> On Wed, 11 Feb 2026, Peter Maydell wrote:
> > On Wed, 11 Feb 2026 at 15:37, Sebastian Ott <sebott@redhat.com> wrote:
> >>
> >> Hi Peter,
> >>
> >> On Fri, 6 Feb 2026, Peter Maydell wrote:
> >>> On Tue, 2 Dec 2025 at 16:09, Sebastian Ott <sebott@redhat.com> wrote:
> >
> >>>> +static char *kvm_get_psci_version(Object *obj, Error **errp)
> >>>> +{
> >>>> +    ARMCPU *cpu = ARM_CPU(obj);
> >>>> +    const struct psci_version *ver;
> >>>> +
> >>>> +    for (ver = psci_versions; ver->number != -1; ver++) {
> >> [...]
> >>>> +        if (ver->number == cpu->psci_version)
> >>>> +            return g_strdup(ver->str);
> >>>> +    }
> >>>> +
> >>>> +    return g_strdup_printf("Unknown PSCI-version: %x", cpu->psci_version);
> >>>
> >>> Is this ever possible?
> >>
> >> Hm, not sure actually - what if there's a new kernel/qemu implementing
> >> psci version 1.4 and then you migrate to a qemu that doesn't know about
> >> 1.4?
> >
> > Oh, I see -- we're reporting back cpu->psci_version here, which
> > indeed could be the value set by KVM. I misread and assumed
> > this was just reading back the field that the setter sets,
> > which is kvm_prop_psci_version (and which I think will only
> > be set via the setter and so isn't ever a value the setter
> > doesn't know about).
> >
> > That does flag up a bug in this patch, though: if I set
> > a QOM property via the setter function and then read its
> > value via the getter function I ought to get back what
> > I just wrote.
> >
>
> Meaning this should be something like below?
>
> static char *kvm_get_psci_version(Object *obj, Error **errp)
> {
>      ARMCPU *cpu = ARM_CPU(obj);
>
>      return g_strdup_printf("%d.%d",
>         (int) PSCI_VERSION_MAJOR(cpu->kvm_prop_psci_version),
>         (int) PSCI_VERSION_MINOR(cpu->kvm_prop_psci_version));

I guess we need to define what we want. Things we need:

 - user/QMP/etc setting a value and reading it back should
   get back what they set
 - QEMU needs to keep working on a new kernel that defines a
   new PSCI version in the future
 - user reading the default value and then writing it back
   should succeed

Things we might like:
 - ideally the setter would fail if the user picks a version
   KVM can't support, but I don't think we can conveniently
   determine this, so "fail vcpu init" may be as good as we
   can get without unnecessarily large amounts of effort

I think this probably adds up to:
 - setter should accept any a.b value (for a,b fitting in [0,65535])
 - getter can handle any value and turn it into a.b
 - make sure that setting it to an invalid value gives a helpful
   error on vcpu start

Doing it this way, do we need a separate cpu->kvm_prop_psci_version,
or could we directly read and write cpu_>psci_version ?

thanks
-- PMM

