Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3113982njb;
        Tue, 18 Mar 2025 11:06:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfc/nbBcqtfOBT5+0VEoS798YBXdth5vfJ0wmnYsJRA7Rg2yx7kjT5ZDnmUDd31zRd8V6697Zr8T0XXg==@linaro.org
X-Received: by 2002:a05:690c:b8e:b0:6fb:1e5a:fcd8 with SMTP id 00721157ae682-6ff4600e73dmr207170707b3.28.1742321194019;
        Tue, 18 Mar 2025 11:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742321193; cv=none;
        d=google.com; s=arc-20240605;
        b=Id3ArDgctaiRPHMxVFi3QXjFses1kciGEqYcdb0Fv7gdOrH2oqjclZr6lUVw0EhYpQ
         W2dA7tlQKFcXDP/Hgi+FgHEjvneh5pdoPAsFIXAS5IpUtUVbqLK8PMIBEGAXHqET9llX
         ZKF2q5GKvh8ubGe728ktyIKpC+seN9WZJIDTp1Xd68jsUbjf9kfl4jxGT7IPElXpsJhJ
         Q+uoQt1EUAoyiuo2wS4+QqjabenNrMmtqVq6y2n9lbpHlgWYVfEjraB9OcafFrgu094L
         URSKDZOgNWGu6lb51SmXQZrrD7DjvbC9AYWMAdfiGdfl4CWm540lAlKhORlzYbc8YWp6
         jwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pIKBRtlhzPsM9FYHmDEFkH3srgSNrGh/z0c4h/04G2w=;
        fh=ooQ0RMS36L2QrrYWQ3KKJshFVmA63UC3qwPLzdGra/Y=;
        b=E/vuIcCrhKnz53rhOWA49RGs1oSGimPC9tiN8UnxwiI2WoDskDUEdwzlyzcLinG3Nf
         e3kk3a7d7aNVR1GQNbwmeCdM25n6OUkDToML11FmQxMmbnppY4XzO5n/+pIGz177IfwK
         q7lJmTdznbNORbOkULuRck4thB80nY9I/SBoHMxMjoFJ8ZzYexQmULe06fhqe8OzsKQX
         vB0zZJnwjCGPwFlcscV9nz4MvSge70IXGGw5VmghTgbbcKHZ/ACymtg+kUJA1l0GLiVv
         UVzu32/i5cfSgoN1UmnxhX1ED9mLQsJR3ihlkrYP/bOz9JeF4UFgNObvhm5ojC1jqMXk
         idKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fAoojjRY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6ff332bccf1sor71514347b3.6.2025.03.18.11.06.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 11:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fAoojjRY;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742321193; x=1742925993; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIKBRtlhzPsM9FYHmDEFkH3srgSNrGh/z0c4h/04G2w=;
        b=fAoojjRYTbpYx5yWRTbxoS13CTvGXSo6uTdWP45YsVsCm8nX8lMVlWEB/q4LXaKx+B
         ajhqNizzR1FQ1bvRFKajbuPQNRFO6txji3f1XCgwci7qW/qKqM0AusAXj86sIgo1Z+WT
         ejsC4ZUZjhnoNIuDLPhhenlclhR05ZMCGD4IjBDjfUY/WZ1yvojW2sW8LTSQxF1XAVOr
         viBHJ6q7zyxX/VaShA/mMJLvr+0nS8d7BEWTVvpBqszb9v5X/7lWzVhRaLkMO44ViIHZ
         K8nh2LVyE2dYZTS+PmD5aSecnbzDNM7ApOB8kVKsKtfS7rbnLsylwGYJjHMThs5/0jwB
         Opcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742321193; x=1742925993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIKBRtlhzPsM9FYHmDEFkH3srgSNrGh/z0c4h/04G2w=;
        b=u17v9OG2huBcbjpd5NK0cCCqNDkA5G3ZOuO5lo2V8GwU1k1Df4Is95MLRdgFd/So3m
         W0ZgpgjOH3a9jVID+faNwjTsH2lkvDjJH/VKbcBd+AgSO8wfmeIpy2ZxKYkSlijXa0px
         jgy4tHvDjMMg0HH3qDGEdm7UWFA21KbIQ3c32mWn7eAX4fY7mjxCkSDKqXURT5iLSnZ6
         L6aMUClAWXmYxDCWv7c3qaNRT4gH/8hkxMQ4Wvvdgra3ycOsCuk6/B/VfM5JNyosghUN
         SMwstu8nbHWh0sD6+WdkdPBUdDM4eUJyDvZamkhaoPzqeENcbP82TN0LNTEwLG5mMxUv
         PUAg==
X-Forwarded-Encrypted: i=1; AJvYcCW1boJn94meQejYks1t6bfr/xNlsB5g2yl6dsO9od2qd38L1hx6wiFYh3/UPOtwrKPCgqODIgppOzDONw==@linaro.org
X-Gm-Message-State: AOJu0YyE8P2cwa09ltw+B0QTksdh7cd/5hVkQiH/VWt+77xXKId99Mlw
	BMZBLvkyBn6t94JlzPhMcM6fVguDATOieZQj6kwNmr3/CotCKr6u1JVjNFCrdTBsZg90eqOykcs
	VH2lUiBro9+wHSqZhnTCq/A2WCKcmKKiiKYDgaHiK
X-Gm-Gg: ASbGncuNOYy0r7Pb58tB/0umMWW/3DwcCUzrUvI9pl0uJJJwTxUMHMiy/LqBLyPd+YE
	ZsT6+k6KAqhuN9MvGe3p7OCQ3Rf+hr68Mkb7CJR4cLa/1huiXzEcFv5LAD2rN3xM4c2vov5PkyD
	mtXG6CqxfW/2xmoNYT2TKYjJzaWNA=
X-Google-Smtp-Source: AGHT+IFgxkES2TvRDqY5GNivdNl51kTxz2g9VDNygV9JwUiXyElJy4gopiu2DAfAvXAWyzKjQGh6IUkQZopqxj4Z26Q=
X-Received: by 2002:a05:6902:2405:b0:e5d:d9e4:532e with SMTP id
 3f1490d57ef6-e63f652e146mr20848324276.24.1742321193595; Tue, 18 Mar 2025
 11:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org> <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
 <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com> <a3b61916-2466-4ec8-a4e1-567581be7a2b@linaro.org>
In-Reply-To: <a3b61916-2466-4ec8-a4e1-567581be7a2b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 18:06:22 +0000
X-Gm-Features: AQ5f1JpnElkFWteuW9nidJdWxKahaGJiIURK8S1_MEu9ArX9YDqVQFuSsoQL1Lk
Message-ID: <CAFEAcA9jsFqD-BR+zTzWV1V92fJqpghaOrGq1rDcdidm=R94Pw@mail.gmail.com>
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32 emulation
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-arm@nongnu.org, alex.bennee@linaro.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Mg0GozuHa6+r

On Tue, 18 Mar 2025 at 17:52, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 3/18/25 10:50, Peter Maydell wrote:
> > On Tue, 18 Mar 2025 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> On 18/3/25 05:51, Pierrick Bouvier wrote:
> >>> Directly condition associated calls in target/arm/helper.c for now.
> >>>
> >>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >>> ---
> >>>    target/arm/cpu.h    | 8 --------
> >>>    target/arm/helper.c | 6 ++++++
> >>>    2 files changed, 6 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> >>> index 51b6428cfec..9205cbdec43 100644
> >>> --- a/target/arm/cpu.h
> >>> +++ b/target/arm/cpu.h
> >>> @@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunct=
ion f, CPUState *cs,
> >>>     */
> >>>    void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)=
;
> >>>
> >>> -#ifdef TARGET_AARCH64
> >>>    int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, =
int reg);
> >>>    int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, in=
t reg);
> >>>    void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> >>> @@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *=
dst, uint64_t *src, int nr)
> >>>    #endif
> >>>    }
> >>>
> >>> -#else
> >>> -static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned =
vq) { }
> >>> -static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> >>> -                                         int n, bool a)
> >>> -{ }
> >>> -#endif
> >>> -
> >>>    void aarch64_sync_32_to_64(CPUARMState *env);
> >>>    void aarch64_sync_64_to_32(CPUARMState *env);
> >>>
> >>> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >>> index b46b2bffcf3..774e1ee0245 100644
> >>> --- a/target/arm/helper.c
> >>> +++ b/target/arm/helper.c
> >>> @@ -6562,7 +6562,9 @@ static void zcr_write(CPUARMState *env, const A=
RMCPRegInfo *ri,
> >>>         */
> >>>        new_len =3D sve_vqm1_for_el(env, cur_el);
> >>>        if (new_len < old_len) {
> >>> +#ifdef TARGET_AARCH64
> >>
> >> What about using runtime check instead?
> >>
> >>    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && new_len < old_le=
n) {
> >>
> >
> > That would be a dead check: it is not possible to get here
> > unless ARM_FEATURE_AARCH64 is set.
> >
>
> We can then assert it, to make sure there is no regression around that.

We have a lot of write/read/access fns for AArch64-only sysregs, and
we don't need to assert in all of them that they're called only when
the CPU has AArch64 enabled.

> We now have another conversation and something to decide in another
> file, and that's why I chose to do the minimal change ("ifdef the
> issue") instead of trying to do any change.

I think we can fairly easily avoid ifdeffing the callsite of
aarch64_sve_narrow_vq(). Currently we have:
 * a real version of the function, whose definition is inside
   an ifdef TARGET_AARCH64 in target/arm/helper.c
 * a stub version, inline in the cpu.h header

If we don't want to have the stub version with ifdefs, then we can
move the real implementation of the function to not be inside the
ifdef (matching the fact that the prototype is no longer inside
an ifdef). The function doesn't call any other functions that are
TARGET_AARCH64 only, so it shouldn't be a "now we have to move
50 other things" problem, I hope.

thanks
-- PMM
