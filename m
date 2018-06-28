Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7522693wrq;
        Thu, 28 Jun 2018 07:55:31 -0700 (PDT)
X-Received: by 2002:aca:3a42:: with SMTP id h63-v6mr5393715oia.185.1530197731101;
        Thu, 28 Jun 2018 07:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530197731; cv=none;
        d=google.com; s=arc-20160816;
        b=YrRRpG9IAp9U7xLZaz7r+8QCnrEAHQYUFaidjZ+fKImYvZdzet1KzEti6Ee58tgMM8
         Nd4ZmNNFLkPCujUvkteWrT9R9af+/cctLj35qLJq71QuvYcrYbYvGX8a+EiKa9b+bJZ9
         K09mgu1ZFhy2LFsY+LOXiVmdkhMxijXz9mJUmGvjA/SkLrrXvRB2HozCalbAD3TBycj5
         2YcqQvh/Hax/WyU/WQzwE7JnvGbKAdUdpAersF0KYeWOOAfr06bkZ186JA6nvjNIM2VO
         Vvy6QRMmIhbLMQKCt0/Ocu25n1mw59o8X7XErRYGBV7xHRgLPvJtDkxU3XzzIGgPu66U
         kP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fPg+NT3Xv1WkwD35RAADvhw4t/MOiCGXzLpe6nJm9Io=;
        b=P4F23H4Lgdbc2Ni65dT+kPKCY/JgRT91P++SRknUrVoioXuSZEaNS4+eSSscjj/YCm
         GOGiWqUXZn12Dl55RGT5nqeJwk0dhZlx+5XYCz+K3+I35EqGCOna9/seBtHY8R7d9668
         KqdThhV3RV1mfH2zSiza0sVPJrN2290hjRwYnTwb2/Ti3FD534s0zp+rWETanX/ObFzj
         P1nHcnSZ/OEgyCcnIYxEjkBRBpCsDFu6bTSEdlSRx9XGttSb0sBmUCSek7INBmNk3XHh
         p6pRmj8dM7yPVoMh3pNX9DC2Lh1yB+HuV5ZDdY6zpxRSnwK9elWl5iq6g41udQmfSWov
         RBmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtG4ImlP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e18-v6sor2261659oiy.92.2018.06.28.07.55.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jun 2018 07:55:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtG4ImlP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fPg+NT3Xv1WkwD35RAADvhw4t/MOiCGXzLpe6nJm9Io=;
        b=ZtG4ImlPFptopZRoYvEJHzNYSZF3d1LLILbymHKYuSHKPW6F3rtaaowYVIqaM2v+82
         S5L+1HD+3Z14lUgM1AQA4qII3ZEcPiiwozQ8t8q8Tm76wDteehsV8wAfXdU5Br+8U4rH
         iT8THr0uFf7PUvx5QV4Mq8KzpX9jdILD0Krxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fPg+NT3Xv1WkwD35RAADvhw4t/MOiCGXzLpe6nJm9Io=;
        b=AXit5ZLSp9ny1FWe2BgJRMLnrM1IPPszZwp566DB8nNTKDtPgz0yE4iyM1+RcRm+BE
         5Eg57S6ow4FLSb8cHqatOoJ5RvPZSG8YQXpGCNXHL2lV7MnYDxeZaJgnFBR1RuLQggJY
         JP+G6KYkHoaeeMv1BrWXhrOoP4Ps1xfBA4lcXohLZiMOvUcUvuyMuoSCRaBSN1J34uyx
         zrQY9gKmTx5ekaCTbeKhlYVm0SVfxExrg8FmcfErFk+isOQNin3orDksPP8IKTLrFSNW
         ys992T5pp5ZWcDVBjsrzQVk7J+UHnAJjJQs8/ho4+KbQWFxJ+WFxoMqmP0H31QeIu953
         AkCw==
X-Gm-Message-State: APt69E25DSCs6Wg2LxVPuNmSLFIYRnGwnkkouSeyoLHOb3Rf7UE10u3B
	EpEnccBK087Krr+hCKSfH1Q5oEkPsQKg/vbcpk+7TGzT2Os=
X-Google-Smtp-Source: AAOMgpdbyC0vhUDm8CQhe3+amxd6Gn1vVOV2CX2zLhxSb/D9KaShhu3sYfSDaHpuIAmceUaxb42HSb2+g7CnTVTg2rg=
X-Received: by 2002:aca:7247:: with SMTP id p68-v6mr5533799oic.252.1530197730575;
 Thu, 28 Jun 2018 07:55:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 07:55:10 -0700 (PDT)
In-Reply-To: <CAFEAcA_EXZAHQEyj63Pko8XJqiEnsAHjLXAP6G1R29tqSf+W0A@mail.gmail.com>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
 <87y3ezuozw.fsf@linaro.org> <CAFEAcA_EXZAHQEyj63Pko8XJqiEnsAHjLXAP6G1R29tqSf+W0A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 15:55:10 +0100
Message-ID: <CAFEAcA-mRijxqR1k7g6TpeqDfgHD0WqvUAsQvgs7-W-GseVG2A@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v6 00/35] target/arm SVE patches
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nmrR0C68n3qW

On 28 June 2018 at 15:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 June 2018 at 12:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote=
:
>>   loading test image
>>   sve-all-short-v8.3+sve@vq3/insn_sdiv_z_p_zz___INC.risu.bin...
>>   starting apprentice image at 0x4000801000
>>   starting image
>>   fish: =E2=80=9C../qemu.git/aarch64-linux-user/=E2=80=A6=E2=80=9D termi=
nated by signal SIGFPE
>>   (Floating point exception)
>
> Do you have the insn that it's barfing on? In particular,
> I'm guessing from the test name that this is for something
> covered by one of the SDIV_zpzz lines in sve.decode, which
> is already in master rather than in this test series.
> If that's true, then it shouldn't block applying this set...

Further discussion on IRC suggests that this is failing on
MININT idiv -1, which is an annoying special case that x86
happens to generate SIGFPE for. Compare our HELPER(sdiv) code:

int32_t HELPER(sdiv)(int32_t num, int32_t den)
{
    if (den =3D=3D 0)
      return 0;
    if (num =3D=3D INT_MIN && den =3D=3D -1)
      return INT_MIN;
    return num / den;
}

with what we do for SVE:

#define DO_DIV(N, M)  (M ? N / M : 0)

This is OK for unsigned division, but signed division needs to
special case INT_MIN / -1.

In any case, this is in an existing insn, so I'm going to apply
this series to target-arm.next (fixing up the patch 5 comment
typo).

thanks
-- PMM
