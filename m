Received: by 2002:a05:7022:97:b0:73:b07a:d1c0 with SMTP id 23csp162823dlx;
        Tue, 16 Jan 2024 05:21:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwfd5TARdTU6UqjkyDSPwgINwRkEp0oz7YqUh1K77fRhb2vlAbPcmANKYGWKmGF6dvidNs
X-Received: by 2002:a05:6214:e4e:b0:680:a4a:db94 with SMTP id o14-20020a0562140e4e00b006800a4adb94mr9395828qvc.77.1705411282701;
        Tue, 16 Jan 2024 05:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705411282; cv=none;
        d=google.com; s=arc-20160816;
        b=QH+6yjGJDvE1pvlw2986mplzXD+FEz/MZ59JALxFWE4ER+ffEzgVfGZ9+Aocc9bMWL
         VIHgfJICIjHErUJJard4oU1JKV0giQSiMjO0jRgro9Sj9VuXKNquJ7aZdLc7wJE+w+x4
         8W4tAUxdVv9hwHs1LD7I6p0qA9cAITx3P10uXkW07gaBLHAxVvZvERIW0j2ZI/7GihBz
         ptdtMyhTNcl9qa8tbNh7mkaUdhs3j6H6FPmRdQ+WJv5r1j29/hoTjSLMBTnUJuk9upur
         XCh0gGATL3Cb9x4Uji+ACU3XIcfxB4Mcr1q0XfciXRZsOHLH4WSaZ6gF693vfinzvrhA
         AndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tkwoDVlLqRXVUSTuDgmc6wD0FLwW/mNGEfVVUweFZtI=;
        fh=G4ej1JnN8P6fgAZk0wPFnEOwbCZSOB2m6YxI6BipXl8=;
        b=t+TXSla81K55JWDCFG7xOuKySXam2dNlzT8BgK7ueiJvdIKSCIdOtiW+FNNhZfQtDA
         U4jpDnbXECMYYpqwzmLdEL8F4MxX9rhPGT/OrBos/afesCE0TfgFnka+4mS4O0FBZgVh
         /yQBv1w2txyiQEaRy+I6wW5Y5b61X8rlNcYA5mnCOHiYnAOXIUpxepAgypJGk83SXpYd
         +0KZlZ04P9gZmCiQnv+8AxmYOzGi5nHiCBXJLK08vtj5zSVyc77F5Wy9ZIMoU2EWPXrZ
         nHlkDk8f1TxbIik9+0dRkF9KInL28MfHFG6SFtIuRMFSAoergq2Hw5C8NdwPkXLhlbPq
         RK7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FedO34IE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a0cf506000000b006816cfaa6ebsi1126276qvm.371.2024.01.16.05.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 05:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FedO34IE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPjNG-0000oo-IR; Tue, 16 Jan 2024 08:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPjN5-0000o7-85
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 08:20:51 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPjN1-0002V6-47
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 08:20:50 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-559533e2503so2264948a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jan 2024 05:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705411245; x=1706016045; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tkwoDVlLqRXVUSTuDgmc6wD0FLwW/mNGEfVVUweFZtI=;
 b=FedO34IENOC7TzPRlodF8oy79+E2eCVi35IK4JQdSOoQDBpgVcJcEzmvp4lIY19vz0
 oFoIMx8+tl0XIZVxJ7S4FgeFl71gJpXXykp01fdwyczXApuxoXfmtrSw5k1NznKp8uMU
 75EUdaA1JQrJGwZ+F+ODr7oWb7r/4XQz6zVsOYfIbCUn5J/ww/6dUqIxF+mY+930LYyE
 ehgvsofUf7TZQhmS1pGaF49SYqY3Uswspm7S36+ueG2ibS4yuUKHAxUbLv91HWUNX96d
 hUp7EC59LigQHz9ssdE5X+0KualjgmT1OdcGiB5hLOxtwYbIKbchsWnMTtbJ8G05qrHV
 ExoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705411245; x=1706016045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkwoDVlLqRXVUSTuDgmc6wD0FLwW/mNGEfVVUweFZtI=;
 b=hAcsDz/w/hvlFxnc2PGZz+Z9iY4jheAe/NjRnKLEnl7278gr2zOQ/dWR1W7rmUTbRa
 JMemmG26aypc/7H9mSS3Rc1BAi8Shy1k8nUDsqhGG9k1mpz1jlMXpN5YUQBXzaEmN+pi
 E+ywfp1GERDxaeEptnB5uIooaE8z3DXl03Oy29RTLxY0pIigf2Xdoad0HFMkRc8Ll92G
 ryPii4IJ2xxCUY6VWkxACwPadxcYqX96wTKZZyXiS/riLTyUTvM/2ii3pbvrVZwdZz/s
 4eaqe2g7GDkmNIPUG3JvOdrAkL6Wm9/Sc5X2md1dpN+k0sFTw7KeZsCb/YUDXS8lI6Tt
 7lNw==
X-Gm-Message-State: AOJu0Yy5/u+k/jPraTG4RA7h4IJRlsLxFWSMvkAtyWYI7oJ6jm1685dI
 rO2eCF2uWxZ4gX/R/D8NbvsH7DJuu5Mki5edcdMftyEa9OhsTw==
X-Received: by 2002:a50:fa94:0:b0:54c:60f0:7511 with SMTP id
 w20-20020a50fa94000000b0054c60f07511mr3263070edr.35.1705411244810; Tue, 16
 Jan 2024 05:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-28-peter.maydell@linaro.org>
 <20240116130940.00002523@Huawei.com>
In-Reply-To: <20240116130940.00002523@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2024 13:20:33 +0000
Message-ID: <CAFEAcA-94-TeFw4AmTsuQaJROADaet8aWDEBXbt9H_gc1Fs6pg@mail.gmail.com>
Subject: Re: [PATCH 27/35] target/arm: Report VNCR_EL2 based faults correctly
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MLNia8EvF2ZW

On Tue, 16 Jan 2024 at 13:09, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 18 Dec 2023 11:32:57 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > If FEAT_NV2 redirects a system register access to a memory offset
> > from VNCR_EL2, that access might fault.  In this case we need to
> > report the correct syndrome information:
> >  * Data Abort, from same-EL
> >  * no ISS information
> >  * the VNCR bit (bit 13) is set
> >
> > and the exception must be taken to EL2.
> >
> > Save an appropriate syndrome template when generating code; we can
> > then use that to:
> >  * select the right target EL
> >  * reconstitute a correct final syndrome for the data abort
> >  * report the right syndrome if we take a FEAT_RME granule protection
> >    fault on the VNCR-based write
> >
> > Note that because VNCR is bit 13, we must start keeping bit 13 in
> > template syndromes, by adjusting ARM_INSN_START_WORD2_SHIFT.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi Peter,
>
> I'm getting an unhelpful crash on calling init in a guest
> running on top of an a76 emulated host with virtualization turned on.
>
> Run /sbin/init as init process
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
> CPU: 1 PID: 1 Comm: init Not tainted 6.7.0+ #1119
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  dump_backtrace+0xa0/0x128
>  show_stack+0x20/0x38
>  dump_stack_lvl+0x48/0x60
>  dump_stack+0x18/0x28
>  panic+0x380/0x3c0
>  do_exit+0x89c/0x9a0
>  do_group_exit+0x3c/0xa0
>  get_signal+0x968/0x970
>  do_notify_resume+0x21c/0x1460
>  el0_ia+0xa0/0xb0
>  el0t_64_sync_handler+0xd0/0x130
>  el0t_64_sync+0x190/0x198
> SMP: stopping secondary CPUs
> Kernel Offset: 0x2a8c93a00000 from 0xffff800080000000
> PHYS_OFFSET: 0xffff82f980000000
> CPU features: 0x0,00000001,7002014a,2101720b
> Memory Limit: none
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007 ]---
>
> Upstream kernel as of yesterday.  Nothing particular 'exciting' in the
> configurations. Not attempting to use Nested virt.
> -M virt,gic-version=3,virtualization=true
> -cpu cortex-a76 (happens with max as well but switched to a76 for testing
> to reduce possible sources of problems).
>
> Doesn't happen if single cpu in the guest, or if using gic v2 in both.
>
> Bisection points at this patch - so far no idea why but I've only
> just started digging into this.

Bisecting to this patch is a bit weird because at this point
in the series emulation of FEAT_NV2 should be disabled and
the code being added should never be used. You could put
an assert(0) into the code in translate-a64.c before the
call to syn_data_abort_vncr() and in arm_deliver_fault()
assert(!is_vncr) to confirm that we're not somehow getting
into this code for some non-FEAT_NV2 situation, I guess.

thanks
-- PMM
