Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5991808lfp;
        Tue, 11 Feb 2020 22:24:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEPaHtuEBmdbHiMx//Wai/xsEhbnMKDeyssJHE1cqmBr2kkFTREDoHQsipQeqiSNtBWeOv
X-Received: by 2002:a37:9c0d:: with SMTP id f13mr1295813qke.463.1581488671529;
        Tue, 11 Feb 2020 22:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581488671; cv=none;
        d=google.com; s=arc-20160816;
        b=ygTjgNk9MSO0zg0dGQvfTnyIhPQ327E4PZg37GieI+PM31S+A0bJpU1q+JumdNZ/lD
         +/es5bs4l+UlPGHs0mTXtOxgPgFOy9wxZ0rK5esw5yt8viFlF6X2kgu9nz8gSZIKliYQ
         b2BosuMNBLEQ6JMm2eDfsrW0czKdncV32FsrgwtPfvV2PJ51ArK8QjIHlZ3vbUreIgfJ
         O9u8l8yz712DZmqSUuVPXs4FQiNxuVH24cXNQBtWU63WHnBFBa07XaFDp3CqPMp8BFwj
         HvxeDXrdVWuNM92K5CuoI/c9quGISGv7EAVESuM1zqBeRf8Eu73JK+xWfwsLQ/a1oPrq
         od8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WLJsY1zh4i95gzmLiOkmmst3nsrUsra632KEofrJVFs=;
        b=HHNaUgrsclDuKsEyUa/6z46QUSXY8JYFM/V2AYAmqwNSwdnPi78ti1VXHytPPzC143
         MVqZmzKMdc1QH3epBppj98WJ1cmnxOnCaeU3xPpfdau6f2vbye6DPQb7T782QZ/sOkJQ
         DhyLJLJDmXuE1RDE8PFTH3bCavc8ha75T/P2bZRFwci8Aj+cd6AvN1aXsVsYPLbf/o/k
         0Re1zSnGe87VJhIB+n1uMRmeQKpQWEfrYHpNQIMitDLUuXirLFhydt0VM/Ttkzo/f2CS
         NMeaNVepEXHyarqAJ2AiKoihLTl7A57DIELBAPDPjG3MzVOhAJ4FZwVrMSq2O+8p6r4G
         Cz3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LawzVokY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si3066147qvp.52.2020.02.11.22.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LawzVokY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1lRm-0007mC-UF
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1lRe-0007ht-KJ
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:24:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1lRd-0005Ed-FB
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:24:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1lRd-0005ET-Bq
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581488661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLJsY1zh4i95gzmLiOkmmst3nsrUsra632KEofrJVFs=;
 b=LawzVokYRdBB9joceLK3mqsADgbc6XF3o0YjnJCUgZPlPAKMf615OYVljfHNm98WyMtH6y
 8akpyc0MJXmzdfE6FalSAdPHpmz8r3YFJNCHou9e26oknpqsOwg7WvdVWBpV69hGmlLZGd
 CStnCPc7n0mbTVj9FExbXDlm2JrEnYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-k8c2wELVPIGTTPDK4ocPKQ-1; Wed, 12 Feb 2020 01:24:19 -0500
Received: by mail-wr1-f69.google.com with SMTP id d15so406098wru.1
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 22:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qNIQQI6fzzS4j/sDTlpsUO20OEIG94qmeSjGRr1VfPM=;
 b=AZcri30uiF2rdt9IOTBDvgrJgJk/+3iBaNSErz+jsVUcOO++1cQIKvAb9Ap/H0MkIH
 Ts1SdkX+4jHB21rN5NhjzO5fh+wmi1ny+JGQ2B0YqQVmLaOMUf71qCgM/k9RMvUv6YdF
 +uvQSEaZ2XQRfV+vqjg89Hf53g9U/kzV1PG+kIffux9pE0gvLhKp537whHvAq8exgMz+
 OJqvwqLZCkEibStpemXB9EqVeaaUgyVAGYFxq6SPxMD4POcIl+9lO1kgFjyaw2Sz6K27
 yr6Nq8qx/Dpp7fxj37RJb1avQ6zRwoA/UByw25h7vOrctmdtWyrQvcPpkDpZhe8CozgJ
 mUZQ==
X-Gm-Message-State: APjAAAU6Nz93/kz7iDAmcq5qmcO8q4yg3Jc+hzjTxFhAYiCflwl5xcaN
 KAlqXgCkUvAv39ARxL9XRRawX4l2JZ7h1rn/bt2viKdv8d0KGcnyMlL0RDe08Nqq9r0OpwNniyE
 +TzMNnRRrhZYl
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr12864718wro.209.1581488658042; 
 Tue, 11 Feb 2020 22:24:18 -0800 (PST)
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr12864687wro.209.1581488657707; 
 Tue, 11 Feb 2020 22:24:17 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s65sm7071329wmf.48.2020.02.11.22.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:24:17 -0800 (PST)
Subject: Re: [PATCH 02/13] target/arm: Add isar_feature_any_fp16 and document
 naming/usage conventions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a29a217b-f602-8925-4265-9a78030b6d73@redhat.com>
Date: Wed, 12 Feb 2020 07:24:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-3-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: k8c2wELVPIGTTPDK4ocPKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0+mPWKARbLl

On 2/11/20 6:37 PM, Peter Maydell wrote:
> Our current usage of the isar_feature feature tests almost always
> uses an _aa32_ test when the code path is known to be AArch32
> specific and an _aa64_ test when the code path is known to be
> AArch64 specific. There is just one exception: in the vfp_set_fpscr
> helper we check aa64_fp16 to determine whether the FZ16 bit in
> the FP(S)CR exists, but this code is also used for AArch32.
> There are other places in future where we're likely to want
> a general "does this feature exist for either AArch32 or
> AArch64" check (typically where architecturally the feature exists
> for both CPU states if it exists at all, but the CPU might be
> AArch32-only or AArch64-only, and so only have one set of ID
> registers).
>=20
> Introduce a new category of isar_feature_* functions:
> isar_feature_any_foo() should be tested when what we want to
> know is "does this feature exist for either AArch32 or AArch64",
> and always returns the logical OR of isar_feature_aa32_foo()
> and isar_feature_aa64_foo().

Good idea.

>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h        | 19 ++++++++++++++++++-
>   target/arm/vfp_helper.c |  2 +-
>   2 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ad2f0e172a7..ac4b7950166 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3400,7 +3400,16 @@ extern const uint64_t pred_esz_masks[4];
>    * Naming convention for isar_feature functions:
>    * Functions which test 32-bit ID registers should have _aa32_ in
>    * their name. Functions which test 64-bit ID registers should have
> - * _aa64_ in their name.
> + * _aa64_ in their name. These must only be used in code where we
> + * know for certain that the CPU has AArch32 or AArch64 respectively
> + * or where the correct answer for a CPU which doesn't implement that
> + * CPU state is "false" (eg when generating A32 or A64 code, if adding
> + * system registers that are specific to that CPU state, for "should
> + * we let this system register bit be set" tests where the 32-bit
> + * flavour of the register doesn't have the bit, and so on).
> + * Functions which simply ask "does this feature exist at all" have
> + * _any_ in their name, and always return the logical OR of the _aa64_
> + * and the _aa32_ function.
>    */
>  =20
>   /*
> @@ -3702,6 +3711,14 @@ static inline bool isar_feature_aa64_bti(const ARM=
ISARegisters *id)
>       return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) !=3D 0;
>   }
>  =20
> +/*
> + * Feature tests for "does this exist in either 32-bit or 64-bit?"
> + */
> +static inline bool isar_feature_any_fp16(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_fp16(id) || isar_feature_aa32_fp16_arith(id=
);
> +}
> +
>   /*
>    * Forward to the above feature tests given an ARMCPU pointer.
>    */
> diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
> index 0ae7d4f34a9..930d6e747f6 100644
> --- a/target/arm/vfp_helper.c
> +++ b/target/arm/vfp_helper.c
> @@ -185,7 +185,7 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
>   void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
>   {
>       /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
> -    if (!cpu_isar_feature(aa64_fp16, env_archcpu(env))) {
> +    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {

So we had a potential bug on aa32?

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>           val &=3D ~FPCR_FZ16;
>       }
>  =20
>=20

