Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1599943lfb;
        Wed, 2 Dec 2020 15:29:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTDmr1LcU0dND89LoyE/K1UmNpOOCkgeZLpPCRrkXHNBgyWKx6emZeEZvFOhyip442ZjXv
X-Received: by 2002:a25:dc0f:: with SMTP id y15mr767867ybe.494.1606951755764;
        Wed, 02 Dec 2020 15:29:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606951755; cv=none;
        d=google.com; s=arc-20160816;
        b=1JrKEzvPZ4/YgIDV7tDb8I6zwoSqtpqfkyVrJD/bIzfdGaixiJzSkInfRHIdKM83JG
         IvcYQ7tt/zlzAMN71JnXGD3Ajx6wjL73w7/0qETYQT+kfJLkHQ7gQ2Qdr03j+EPXg2Dg
         o3Ie1d/6SIaS8jQsbLtTN3KrRcm/Fikv/CARNEaGvZYX1lbC3OHXcLH8/mf1ga3LyFpg
         tOlNBZj4op3niWqhkWyGxZT5+i0igMxmLbMU8GRVgtuC2BB+7ruLr/phgj3SiXCd0g9A
         Q2NjMkapGiPsucCfPOMLpZ5aEu3yvjaAVqxjlvPeEqPxonBhoxmU/J5fKYS7dIt1iHt/
         zDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sHz4OKSDkB4X2/Q7yJFO7hSfYBzAsnEHkvj3wqLCRrM=;
        b=hMcZbZAjzKujlEYu+o6JBPz4w/k3iOvzTPlkjbJvJw8hEPlYnL6L+3bsJfoJ1hZzNK
         wIP3uHCn5oGKNni+yLYwfC/vceyl170sNrFM0oUBfBxcDPHRUrTlXs9VWEacvDJfpIlq
         v3X9seyvqtViOrzg1A8PbzQ0EfKg1SW+Nyyw0cOmUxKOD0C4s0prJduNqzYPuIHdFJMR
         RCli1u24515qaTTtG6XeA9O5RpFiJHWNhx9o+6UIygI6YWFgMYG4WByAUA9lUmMhBhTS
         +mrcxMCFM7w/KGi2jbPIdygnyF4khrXIXAANRTnY1XjMYG9B+FoJNUWCHmTn8AmSjuUo
         kQ/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=FdNhmzcg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si89172ybk.307.2020.12.02.15.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 15:29:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=FdNhmzcg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkbYh-0002vQ-3X
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 18:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbY2-0002UG-MS
 for qemu-arm@nongnu.org; Wed, 02 Dec 2020 18:28:34 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:36476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbY0-0005U7-PU
 for qemu-arm@nongnu.org; Wed, 02 Dec 2020 18:28:34 -0500
Received: by mail-io1-xd41.google.com with SMTP id z136so158640iof.3
 for <qemu-arm@nongnu.org>; Wed, 02 Dec 2020 15:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sHz4OKSDkB4X2/Q7yJFO7hSfYBzAsnEHkvj3wqLCRrM=;
 b=FdNhmzcgFOBh/mreXcMLvgrZD3CUJDn9UlTtzqXMuDVYJ1Kv65/uh0GKTgPageNYO5
 tx71Sm/C1hgArKAXdMRN3CI4v8yVnjM7fQbOy88wk2fDd+mjFCiOl/mtfs5PjXF9Ot0r
 +VEITRswjlmltjCpLQvyPYp0wwAt9N0b5tHc30OInNwjuccaAMinS+zVpQxYy4ZYUsXT
 ElkcXqBjcqct4nneGddWeoAhp/a3tCexiieyf2SUdk2tHeCv0Vft9XJHc812kcd1T1yp
 LcTziXO/M3a6gPYHKiydw2FqJp2JRmJZJp9oREyrkUnJS287rGIdt5k8gq759yyuF58d
 X9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sHz4OKSDkB4X2/Q7yJFO7hSfYBzAsnEHkvj3wqLCRrM=;
 b=sILrkD0+1iElWNHzwumWj8K6lYatR4YeH/j2ZcruGDFBFdqyyW9aB/rzVrFGvcuCEz
 e8eeucA32dbJR8RjIHd1EH0slJHqvFxyo+26ClZzzDnuUvC6Y+h1581EcSR4IueHEMlu
 Tg7trD2+ZTBN/YAkQDtpt8OqLxiJmWrtCwe3bOls1S/p2ODlmkm93trEY9/e5tWb8Whz
 KIFWOqk6EMzkPm5nFJeRKJO8ypnVrifcFvKzJ04ukzB1WsXPPNeHqJGmVinTl8OXsfKL
 z0Tw0dffYsMMwLgn0K0XZBftzD3QaeNgTjf7AtgXBl4TNqxSomRvLJoNSaEgTp67Rglq
 2DXg==
X-Gm-Message-State: AOAM530RGo6qUIW8oXzmB/ABxqp44gihVGhxDlhEKMBp1z6xaI4/yIKr
 8hO/ajY15V6Gl0tm9WboBywOG7wWF32Vz+vUy2Xeeg==
X-Received: by 2002:a05:6638:b30:: with SMTP id
 c16mr665504jab.61.1606951711513; 
 Wed, 02 Dec 2020 15:28:31 -0800 (PST)
MIME-Version: 1.0
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
 <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
In-Reply-To: <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Dec 2020 15:28:20 -0800
Message-ID: <CAMn1gO4KNq_EBrwmHjhFzp==VdEq+ExrKQHmYfz5RKvDj1Q4GA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=pcc@google.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O8GrO6nGC4PK

On Wed, Dec 2, 2020 at 2:57 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 02.12.20 23:46, Frank Yang wrote:
>
>
>
> On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>> On 02.12.20 23:19, Frank Yang wrote:
>>
>>
>> From downstream: https://android-review.googlesource.com/c/platform/exte=
rnal/qemu/+/1515002
>>
>> Based on v3 of Alexander Graf's patches
>>
>> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>>
>> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
>> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
>> require effort to do that accurately---with individual values, even if
>> they are a tiny bit off it can result in a lockup due to inconsistent
>> time differences between vCPUs. So just use a global approximate value
>> for now.
>>
>> Not tested in upstream yet, but Android emulator snapshots work without
>> time warp now.
>>
>> Signed-off-by: Lingfeng Yang <lfy@google.com>
>>
>>
>> If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, w=
e should be able to just recover the offset after migration by looking at Q=
EMU_CLOCK_VIRTUAL to set CNTVOFF, right?
>>
>> That would end up much easier than this patch I hope.
>>
>>
>
> The virtual clock interfaces/implementations in QEMU seem complex to me r=
elative to the fix needed here and they don't seem to compute ticks with ma=
ch_absolute_time() (which in this case we want since we want to compute in =
timer ticks instead of having to mess with ns / cycle conversions). I do ag=
ree this patch does seem more complicated on the surface though versus "jus=
t" setting cntvoff directly to some value. Maybe we should simplify the QEM=
U_CLOCK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using mac=
h_absolute_time() first?
>
>
> So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an offset to =
gettimeofday(). This offset is already part of the live migration stream[1]=
. So if you just configure CNTVOFF_EL2 based on QEMU_CLOCK_VIRTUAL adjusted=
 by the clock frequency on vcpu init, you should have everything you need. =
You can do that on every CPU init even, as the virtual clock will just be 0=
 on start.
>
> The only thing we need to change then is to move the WFI from a direct ca=
ll to mach_absolute_time() to also check the virtual clock instead. I would=
 hope that gettimeofday() calls mach_absolute_time() in the background too =
to speed it up.

I'm not sure that something based on gettimeofday() (or
clock_gettime(CLOCK_MONOTONIC) which it looks like cpu_get_clock() can
also call) will work. It will include time spent asleep so it won't
correspond to mach_absolute_time() aka guest CNTVCT_EL0.

Peter
