Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1607181lfb;
        Wed, 2 Dec 2020 15:40:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH/HpLZGLIOxBZWv6fUsp8sPmUkFA7hp2LgE3y1B7Gg62853X14whQQutVrPt1pIWnsbGh
X-Received: by 2002:a25:b095:: with SMTP id f21mr795965ybj.245.1606952415096;
        Wed, 02 Dec 2020 15:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606952415; cv=none;
        d=google.com; s=arc-20160816;
        b=x2iC++ldDY7unaku5hGNKIEZPDj2RxmkVP+D/8R6It/LQWX/WPXuIv8HbfFMGc2hgO
         V2/jGRqMzc0wWKKO35sdagtpXDwb6yeqwSPV278tV3JVSrfnf26CMAatuUo7O6f9XK/5
         nXnvNYYKEBgt4IwhL/UMSzh3ALNBjTfUmhpqY5IxBU5xMjQO8kGgAXD08sOtAop+Ph4x
         0rOg8rYIK1+gsHHjfnB3Ih68SqKjG201J3hY0DuW3dr18cLNZLBFEBFd5npproblQJDm
         5PH0DZyqj8EihPAkiNeTffgi2j7XdD+sUtzERbAmA+eTQ+oaA+WeOyFx3QGS04zVqjL7
         uBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HCQoeTWvYO1I+hmnZvpQ64CnzFuDGQDDShCzJqBqbQs=;
        b=H6vNHR5c+Zd8WcJ8NUAviiqN2PIWXz1ndhN9ewoRnKorsF8ZC32UWgQvQSis67kCW8
         ZGoELHYNwVmfCmhJ7W2MJA5Yazv7oys9Pm9+QvgLjG70ehGG1Osqa0Iqf63DwN2SyxEm
         JUBOlL+EwviSn/Ys8tvLy2i+OrEOLwMrnFwzLoCslojyONf5wosSDpe7kJhO4zCkrd/2
         +v6/6XzDNLYjCML0++MenUlQYfTEeOK+okS9vvN//4cGBDrGO/NWhyCiEIh/riiFrOzo
         Td2Rest0bYbCNbvRgSP10tl4Hkz9ad7ufL/1UymcdPx4SwMIEL2J0lRuZGLrDqLVW2/C
         ALvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=DXlaxeIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h31si112886ybj.403.2020.12.02.15.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 15:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=DXlaxeIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkbjK-0000TZ-DA
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 18:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbjB-0000TG-FR
 for qemu-arm@nongnu.org; Wed, 02 Dec 2020 18:40:05 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:41349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkbj7-0006fI-G2
 for qemu-arm@nongnu.org; Wed, 02 Dec 2020 18:40:05 -0500
Received: by mail-il1-x143.google.com with SMTP id p5so224616iln.8
 for <qemu-arm@nongnu.org>; Wed, 02 Dec 2020 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HCQoeTWvYO1I+hmnZvpQ64CnzFuDGQDDShCzJqBqbQs=;
 b=DXlaxeIQ2Pgv2Fi8s/X+FwxC8EyTuV/u7zX4jZ0pGHpW0x0PNzRPTQa2VSXxfkbFlJ
 5l8sRkqhJBKv3p3u4LLRSVjFmxo3tCi1NUCiYqIWF+YThuhCSggjyzrbY9hbfq4xnxyQ
 jeNoB72DUyGyqqzGewdbcCAkWNBy7deohnzq+WRgtz6QzN+g3Njf27LDR5jvfL7aeVS0
 DIvf0BJ5cyrlU9tO/8CIrsgFo5hTgUb6D+50mOSBt+tZ5UIhmhhycLIy+0sGMCsPRtSP
 ynYVCOnp+efwCxVTt0IxqNHxOPxHwhM9AfITYp+2t2O+ykDLTMljbI2vgxv3jx84xW6X
 CbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HCQoeTWvYO1I+hmnZvpQ64CnzFuDGQDDShCzJqBqbQs=;
 b=BgC0B/f/actyYV1pGFulFv/9D9bx9kcWhZOQyeoMZdfKlCDwKUB/RmC3t4F/5xc+pu
 OvhM/y7rvt0RtFzdStAh2hoOWXj/r9uA9/M34izTEkv8BSueUX9I6HC5Ffi5dVSPy3Ti
 4Gyt10+gYHP9AQBPhFlCuLjA92fxgE1y9K4WUdivtcFK8yTRhS3Mfng5VBbvQ8+c1h22
 q8A+j4dUyzjy6k4JJ8D7fOdkec6xi0YMpmpkoWSj9gITLtVOAYy8mtPKyrMe1uWew+Kc
 PlgeiH1/yLKvRXmQhH9bJwkyFwqSx9DhMYHxQv85/VJJjVI2yipJv096zhJgtd960oDY
 UnNw==
X-Gm-Message-State: AOAM5303st0gmc5XNIdLzDUcCFMZE02slnpcNUivwu9e0lkNAlzrqmzz
 3xNFLpC356iVy1ZpvIjbmTiLXp70a3EPnjUBJ5n+hA==
X-Received: by 2002:a05:6e02:f86:: with SMTP id v6mr526145ilo.56.1606952399819; 
 Wed, 02 Dec 2020 15:39:59 -0800 (PST)
MIME-Version: 1.0
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
 <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
 <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
In-Reply-To: <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Dec 2020 15:39:48 -0800
Message-ID: <CAMn1gO64pXt9F8BcsAugOLhrzr6jfjsayjYdwSAv+gOLo4McKA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Frank Yang <lfy@google.com>
Cc: Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=pcc@google.com; helo=mail-il1-x143.google.com
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
X-TUID: x2b8nYF/HOtl

On Wed, Dec 2, 2020 at 3:26 PM Frank Yang <lfy@google.com> wrote:
>
>
>
> On Wed, Dec 2, 2020 at 2:57 PM Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>> On 02.12.20 23:46, Frank Yang wrote:
>>
>>
>>
>> On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>>
>>> On 02.12.20 23:19, Frank Yang wrote:
>>>
>>>
>>> From downstream: https://android-review.googlesource.com/c/platform/ext=
ernal/qemu/+/1515002
>>>
>>> Based on v3 of Alexander Graf's patches
>>>
>>> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>>>
>>> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
>>> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
>>> require effort to do that accurately---with individual values, even if
>>> they are a tiny bit off it can result in a lockup due to inconsistent
>>> time differences between vCPUs. So just use a global approximate value
>>> for now.
>>>
>>> Not tested in upstream yet, but Android emulator snapshots work without
>>> time warp now.
>>>
>>> Signed-off-by: Lingfeng Yang <lfy@google.com>
>>>
>>>
>>> If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, =
we should be able to just recover the offset after migration by looking at =
QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?
>>>
>>> That would end up much easier than this patch I hope.
>>>
>>>
>>
>> The virtual clock interfaces/implementations in QEMU seem complex to me =
relative to the fix needed here and they don't seem to compute ticks with m=
ach_absolute_time() (which in this case we want since we want to compute in=
 timer ticks instead of having to mess with ns / cycle conversions). I do a=
gree this patch does seem more complicated on the surface though versus "ju=
st" setting cntvoff directly to some value. Maybe we should simplify the QE=
MU_CLOCK_VIRTUAL implementation first to maintain CNTVOFF_EL2/CNTV using ma=
ch_absolute_time() first?
>>
>>
>> So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an offset to=
 gettimeofday(). This offset is already part of the live migration stream[1=
]. So if you just configure CNTVOFF_EL2 based on QEMU_CLOCK_VIRTUAL adjuste=
d by the clock frequency on vcpu init, you should have everything you need.=
 You can do that on every CPU init even, as the virtual clock will just be =
0 on start.
>>
>> The only thing we need to change then is to move the WFI from a direct c=
all to mach_absolute_time() to also check the virtual clock instead. I woul=
d hope that gettimeofday() calls mach_absolute_time() in the background too=
 to speed it up.
>>
> Sounds plausible, but I noticed that we also have cpu_ticks_offset as par=
t of the migration stream, and I prefer mach_absolute_time() (ticks) instea=
d of seconds in WFI as well as it makes the calculation more accurate (tick=
s against ticks instead of conversion between ns and ticks).
>
> Should we look at integrating this with cpu_ticks_offset instead?

Seems plausible to me. As far as I can tell the intent is that
cpu_get_host_ticks() does not increment while asleep (e.g. on x86 it
uses RDTSC which as far as I know does not increment while asleep), so
we could provide an implementation on Mac that calls
mach_absolute_time().

Peter
