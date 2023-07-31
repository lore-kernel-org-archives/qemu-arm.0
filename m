Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2170062ejb;
        Mon, 31 Jul 2023 06:20:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdaG+BTcoWKeJHDkPYvg6GmX/dQL/80nhP71NDpzCgHkGZ8NK2D5vI4UI27yOIQdbcvsLO
X-Received: by 2002:a05:6358:5922:b0:134:c37f:4b5c with SMTP id g34-20020a056358592200b00134c37f4b5cmr8006462rwf.22.1690809636853;
        Mon, 31 Jul 2023 06:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690809636; cv=none;
        d=google.com; s=arc-20160816;
        b=t8Pekr1AXwQ4MUk1tcxdBB+vRrJmYgVEMlIGPfd2ie1P/1ogF5Vz/KpjxkeBxNK/Qj
         dQ0RcuWzatMD1AxaUPoA7bcW662+36WM3FMh1bPVMsna+MIXpxDcDxFeO6cED8C+AA8X
         Q20wZGI9cZg8zd8He8Dqlzb+2wpTFTBS59EHxiHRqIfq869R/hZovEi00ZIO8o8iBCZv
         8O1znDbQD6/U45wgH8q3VLZLI1fq6pA0Rzixa8MUf3VKbzDQhExY5WBpJEkRV3RViQFF
         hv+Yog1wutLdPzXTzxVWgEtSEZo8l0no9GvdWa8eNR5xa1DUjH0bciMN3Cm2A6XxT+zE
         4qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3fTGuRHfQ2/nduWwidbkv5hI5CRHgBXRPClWv91aVhg=;
        fh=9+CIGCKWA35TCscf0rf2Scy5gYJA/xM176rhnppIfRw=;
        b=jJNlA/aeemQyFbC5ZJJk8DLI473U7wPj6tKC3+Va9ku6kTMacOHFK/1DqIEQZpbjYk
         Xk1irdDvyn9Cx9mII/UbNKa6pgXjQznVER5pu3zlw8wFJDiS2ZQmy+XAHUYn/L+qpGou
         Q0GHmA9G8Nhk3Dhvui+LOpZFYWD4qjYJNwmFoSrJMGfbhI9W1me4p07GM//5YVbKBXnu
         l70Kx75cTQtqRr6JeIbUcNmcGeIVgjAM8JwpEAXSOI5YqUQHIyFy21YLa7yZJxVDvcpx
         csMU02mbYGpg3KXYMcB8rtlHxqf5/pb5I1DOOyjaxZExf7XEohZEjTziZx+cUvPuQcOQ
         r1eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dr48OPmI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a0ca981000000b0063d0a908692si3323492qvb.420.2023.07.31.06.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 06:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dr48OPmI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQSon-0004eK-LW; Mon, 31 Jul 2023 09:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQSom-0004dq-R6
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 09:20:12 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQSol-0004CN-3J
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 09:20:12 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso7191018e87.0
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690809609; x=1691414409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3fTGuRHfQ2/nduWwidbkv5hI5CRHgBXRPClWv91aVhg=;
 b=dr48OPmIVKDtH0ryzajWlUYmRBaxTvpIhdrVQ/84Q3Z1R5IB93Of5daKuv2jJifIry
 Bk10Qmi8I5cioMTZ+yHqjzyme3FCQ+9BlcRdYegFrv8A7+AU88JgLa5e2jgRUWvOoOvh
 nsHG7eLDVlwTX6yon0uc0YS4mPpyN4WU3sFmLjx6EUfLcfmx8khDCK4Y9NSxhHo6vYwU
 iOaKqDZLnR9MtWRLOvxl//CCGzPGTqMhX5jTcfoIy2nAkfpluk1nlFabZ3AC51NWiuj2
 /Hpo7/ZkYWATCG5Z0sSB5WejCicLO0M1I/TAl8rYirr5hDSvWsuS5hW71Ci9hd6Q21Pc
 CC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690809609; x=1691414409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fTGuRHfQ2/nduWwidbkv5hI5CRHgBXRPClWv91aVhg=;
 b=SS8mrHXYaE4XR+BRfSTeBx/x/l677OpaOjPp3naWPHkqh2Mi+VXr+x8PiDKuCpgI1P
 9R4cuxg9noPTglnqrYNcwpwOduKSwj8/hA3hNSrhGcn6R18DhHNt1EHWyDyYbRT5Xoo3
 iQOlP+mxdPkucweSQFhg/mXj1y8iCJo/MTDE2Tu49J6i6ZNQO3O+rKVK33dz1ra0Xn4R
 UBgPifQahnKOhwlbpaHz1REe23QpSxUtTN4lqI1XeLq+EADoYkOqK4ID9F4I19JOgCSs
 X53Q02sVNCY3KgqbZBf6OW6lP/VOA2x6BYPR3bHWgtNIXqr/UYb8eXaHJtuVR5tD286W
 w4ZQ==
X-Gm-Message-State: ABy/qLaK2SoPBWtJtsXfPXuVourpQM8XnSPO+OZRQgv1FfBK9p4h48/2
 UUmTqvH+55xZM0MnTucTUEQhI0R6Sr8zdG7XylsWEQ==
X-Received: by 2002:a05:6512:36c8:b0:4fe:2d93:2b51 with SMTP id
 e8-20020a05651236c800b004fe2d932b51mr3084517lfs.27.1690809609163; Mon, 31 Jul
 2023 06:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230731125946.2038742-1-gshan@redhat.com>
 <008f4ae2-c5bb-3570-3ec9-4ace4b5c4788@redhat.com>
In-Reply-To: <008f4ae2-c5bb-3570-3ec9-4ace4b5c4788@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2023 14:19:58 +0100
Message-ID: <CAFEAcA-HTMxVwdVQT1Mx4eQ0OjwFGX5xbrch6OSOe-WMScgq-w@mail.gmail.com>
Subject: Re: [PATCH v2] kvm: Fix crash due to access uninitialized kvm_state
To: David Hildenbrand <david@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, philmd@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: WinHTUfZ74fM

On Mon, 31 Jul 2023 at 14:00, David Hildenbrand <david@redhat.com> wrote:
>
> On 31.07.23 14:59, Gavin Shan wrote:
> > Runs into core dump on arm64 and the backtrace extracted from the
> > core dump is shown as below. It's caused by accessing uninitialized
> > @kvm_state in kvm_flush_coalesced_mmio_buffer() due to commit 176d073029
> > ("hw/arm/virt: Use machine_memory_devices_init()"), where the machine's
> > memory region is added earlier than before.
> >
> >      main
> >      qemu_init
> >      configure_accelerators
> >      qemu_opts_foreach
> >      do_configure_accelerator
> >      accel_init_machine
> >      kvm_init
> >      virt_kvm_type
> >      virt_set_memmap
> >      machine_memory_devices_init
> >      memory_region_add_subregion
> >      memory_region_add_subregion_common
> >      memory_region_update_container_subregions
> >      memory_region_transaction_begin
> >      qemu_flush_coalesced_mmio_buffer
> >      kvm_flush_coalesced_mmio_buffer
> >
> > Fix it by bailing early in kvm_flush_coalesced_mmio_buffer() on the
> > uninitialized @kvm_state. With this applied, no crash is observed on
> > arm64.
> >
> > Fixes: 176d073029 ("hw/arm/virt: Use machine_memory_devices_init()")
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > ---
> > v2: Bail early in kvm_flush_coalesced_mmio_buffer() on the uninitialized
> >      @kvm_state and improved changelog        (David/Peter)
> > ---
> >   accel/kvm/kvm-all.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 373d876c05..7b3da8dc3a 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -2812,7 +2812,7 @@ void kvm_flush_coalesced_mmio_buffer(void)
> >   {
> >       KVMState *s = kvm_state;
> >
> > -    if (s->coalesced_flush_in_progress) {
> > +    if (!s || s->coalesced_flush_in_progress) {
> >           return;
> >       }
> >
>
> Thanks Gavin!
>
> Reviewed-by: David Hildenbrand <david@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
