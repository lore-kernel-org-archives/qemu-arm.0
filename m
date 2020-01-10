Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp469296lff;
        Fri, 10 Jan 2020 01:59:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzys2h8PibpRATpOgue2obW0FeexwuEMBTZqo+gLTPff4DYMoS0pc6RqQVOPsEabYBlYIcM
X-Received: by 2002:a05:6830:1615:: with SMTP id g21mr1937301otr.49.1578650370523;
        Fri, 10 Jan 2020 01:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578650370; cv=none;
        d=google.com; s=arc-20160816;
        b=maD1EStt9EoVD5utejfJ5AwmyaCoHep/xhKlWuFj5lo2FczslXIZnDq0P8CZ1POBjH
         +RTsWJ9o3baVS9Tnrn2r4KMoXralvulNN4I1h4M2TmQ5GSWqHSSLei33uwnQOnGgxEOi
         XXs6wJN+lwfJ0o2RbMCiySpw4GOHqDys1P+3iBzp5k3x1VFs7QvYABQMbKp4+BhzvHcT
         FD9O6b1tUcr2+qM1yVvTvdBaWGxCv3AWFdfovVjVXXOEXcIOpAgvHrbvLS/KD+TROHMI
         1+hOF1mCq27vs55ogeIprCS4Qo2Or8sfjg7tff9kjnMQBY2UOoC/kIiiq3nKa/+0t4AY
         z4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7JlzPibRcf0IgPM6L/pRPXmRhZqX6hDwJe/LfcYdab8=;
        b=ON2Fqo0DMyDuqkhHIb8pE//0Y31AwMh0VlMCyNkp3GdV4fDcXcflJUdlPkXN/zGZNJ
         wFMNTxd8QwxvdKYi+DMgNM8Rz3Pe3VD9OGCx1kOYKrb92tJbK9hE87OVEMi/2y26Yo1Q
         pQ8m7DIDIgodR29q2KnqGRiMdSPo6bUb9zw62jp7IjgNytN8ja673mIc3DbApGv185FS
         0PdiPnGBVU6wCHLhncsofZOXlRwjT9S3DAOeI8C9AaSaLNjpSuEnx9rURfRQ9qwEsWLA
         HedRORXEehRMKsVRfaxrPPSaN14dfO1gskkLkDVc6A078PmnIQ7uCAvrIuiuR4ZEh6Eu
         h+cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=K7Y72Csl;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 65si798427oif.14.2020.01.10.01.59.30;
        Fri, 10 Jan 2020 01:59:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=K7Y72Csl;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbgAJJ73 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 04:59:29 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34282 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbgAJJ73 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Jan 2020 04:59:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id z22so1525902ljg.1
        for <kvm@vger.kernel.org>; Fri, 10 Jan 2020 01:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7JlzPibRcf0IgPM6L/pRPXmRhZqX6hDwJe/LfcYdab8=;
        b=K7Y72Csly7MWqJMzL3CkWbTrMW2/2vhNHffTGbrtgJOr8gPUiGjGjQdP0tTmzV3E0W
         A927SweuQJqAzR2mrjN7uAfYmNhfWOTwNpnxNCla+S+3hAUTSd1bghy3J3Eq+Oj5Tc/t
         dFHrgnGrdy96RqRknK4r6Q+9U1A11UenbliYexZsT/0+Mfpb+4xyhxTpjMzkoSNuxSsI
         iZItbxMB3wNzTmJZBVg5WdFOJrTD67BRpKMjl5DQWe+KYfrC0XnUt0itnkYHzFox2ZJ8
         Rxn8L0arRJ8E4EkbpshAsBDkmctDgCjcyd/XMuk6qEKmIDMx3+2eZ8/473mN98+V/Fla
         8SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7JlzPibRcf0IgPM6L/pRPXmRhZqX6hDwJe/LfcYdab8=;
        b=S1Z188KNJat5K3p4nder3cHjV1CVeHAk2fQOPxQxR4xEwk1s36JpNOQFnKvKoSOgyK
         v9mide6oFa0QHkkUhSnyfUDPQMBJ/Ex/zIF5uZ4XzV1sIFFIzZWGORZ0vkiPCtEOlZCO
         YljaohSysBCBpPs0fGlppHKU3wpH88gUVcYMWflh9BwPdnbHG7nNSaO59F0at7uoK6d4
         RjOEdRLw5HHHSiX8rkxXSmMe5oIWbbo9FY15QIVgEKQay9HH2skP3SQfRvS1sdPLQ1up
         7jLSd2mV8HiZyqFaLH9I0NmQRIcaJd63QspY7DGEPXOSIyn55tlduFSC55UEOWnxq5e1
         vIjA==
X-Gm-Message-State: APjAAAX1qdjw0DLN+Il+6U9sq/oKNYtVT1zwxg7/7Uujp2gOKBDMzi4H
        3Hif/vQihurjz1fO68SwDsZumXoJAuj2Jc+u0/0=
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr2127868lja.16.1578650367261;
 Fri, 10 Jan 2020 01:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-2-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-2-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Fri, 10 Jan 2020 17:59:00 +0800
Message-ID: <CAKmqyKPe-K5omNe2wJC-vb35YQ2iiH4yJUTDgydDna+7ONnvuw@mail.gmail.com>
Subject: Re: [PATCH 01/15] target/arm/kvm: Use CPUState::kvm_state in kvm_arm_pmu_supported()
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc:     "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "open list:Overall" <kvm@vger.kernel.org>,
        Juan Quintela <quintela@redhat.com>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Alistair Francis <alistair.francis@wdc.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 4HdpMhGLamZg

On Thu, Jan 9, 2020 at 11:22 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> KVMState is already accessible via CPUState::kvm_state, use it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/kvm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b87b59a02a..8d82889150 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -181,9 +181,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>
>  bool kvm_arm_pmu_supported(CPUState *cpu)
>  {
> -    KVMState *s =3D KVM_STATE(current_machine->accelerator);
> -
> -    return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
> +    return kvm_check_extension(cpu->kvm_state, KVM_CAP_ARM_PMU_V3);
>  }
>
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> --
> 2.21.1
>
>
