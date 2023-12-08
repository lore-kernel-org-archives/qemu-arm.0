Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2237109ejb;
        Fri, 8 Dec 2023 03:00:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEGVMMcgSVNcimJmCc9DkhrWIJ6JPYpc2XKsIhyvtJfyUen1YBoFAQsQeF2K+24FX2voMN
X-Received: by 2002:a25:1886:0:b0:db7:dacf:3fc0 with SMTP id 128-20020a251886000000b00db7dacf3fc0mr2835307yby.109.1702033253895;
        Fri, 08 Dec 2023 03:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702033253; cv=none;
        d=google.com; s=arc-20160816;
        b=bkVswOWErEa7lf11UJfTR3gqtb/HXUKbMMZKVuDaDAOCh6Q5ENIWxjj+sBTJDUp/Y5
         2VR1F1BwaTLO7TlAXanQXAQ81X6wH4jWCVla87q6nMNtWYtD3rK3azD+ciQN59s75pwZ
         lwFFXUlHc4fnHIXgRQC6UOL4nVv7UbT1uwb6OzIas+aoaC4877LWX+1mhZ956CcMOzI8
         LMXkyxkwzA01EIDWacV2j2IPPFDnNToIqP/MlIdA5Uaq/+2ku+k6qRXWmyruNQV66/TO
         FvLNz66nwnddKI5bjGKDjR26gpii3tKSdU4NNKdtoWkGqnzaPdOZZP+c+KkLp387SBCk
         SUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IgAEyjXcA6+XsFXPCGoIawIS9X69PWGz3B+P/ILXyTA=;
        fh=QvELj8POwvi65S6Ir2MSrgdeG7B4KS6zUINJJIeIeC4=;
        b=HmRGpyLjVjeQR4/JiIGJb/ra/b1gD8077QsXR124CzKo++jK+l3leHAriftVvhj+N6
         Nkc/HkVNzncQ1T76Jo2la9rxzwI6C27CqIjRGoibb++dLW3YuB3mn6wq6XPWSIcfjkjS
         Vbo3VZB3GkzFO63JVrnmB5yzaTBPnzugTW8Kuxztg7iOVUncLZ2T6V/QAntK1za2lx3e
         RSbi7SAxXCUd5ZkeBxDhb+347GyORQbr5hJ/d16FvmVfFXwz1zR8p6B2X1d5C6YthvBO
         BezcPs1rhsiV/T52EhmHjJD9ipUfyUpsbC0oK8eealNAbHho2LXGmtA84Ej2G7kfyRQ6
         DuGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hGLMt6sU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pm3-20020ad446c3000000b0067eb145cf98si494351qvb.388.2023.12.08.03.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hGLMt6sU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBYaz-0002sw-Jl; Fri, 08 Dec 2023 06:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rBYaV-0002k8-6R
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:00:08 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rBYaS-0007zQ-Ey
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:00:06 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso24270851fa.1
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702033202; x=1702638002; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgAEyjXcA6+XsFXPCGoIawIS9X69PWGz3B+P/ILXyTA=;
 b=hGLMt6sU6xpJ1wSTXePmhkWy13gImadNGj2kZ0arm1ZjLPF8uzAaRBoHfSxwRoDc7q
 Z1n7aNTcq97Gk/UfsVlus4n/UTU3XAF+BjCfVUpLZPaAydFq33HTZD+zfqUuspJvNOrq
 OJOYAo1vOZMHXTSNo1ZpyeYBrjNc0iUOsyF7hUZ0DIK/trIuBch4/WSLBOrzF5JOQitT
 azp123V0urumAWQSj/KhW2/W8vya4qjQPi1X2hAbhwdowXiGSBszZ2bpOQEERFYiNHaI
 mN1zb1cB+2yKVERkRhQCQWMs9JI+884mCi0en2tEWo/cZLe6nfmwg3MT1tmv+W+uo7WI
 OEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702033202; x=1702638002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgAEyjXcA6+XsFXPCGoIawIS9X69PWGz3B+P/ILXyTA=;
 b=j4qxCOlKx6T1DPSfYNowIqB9h7w68DSG9gMqusVzJ2PhkU97kqC5zHiJwfGD4Ihwl0
 rHZggGe+Ky4CQYG7bNMs+eQ3O2PHxEjYtObVRgdiWgT67N0w3WHH6bonsokwIbOvwtSE
 RmUqTGUc0XlAqEQ7+Zeu5kBLjONWSdSXr4810Eu0IgOyf8CPQJc/yqSiLiRJ0yGv7I1O
 RSXMyzSLE16ssnyuDz+psH9sbaQ+Yyxx4WEsGhf17dCXkVk+cRfBWR191qvvcihfyMTC
 bHYPF3F73x32j74dXKaF5GAkz7s6fK3dONyVoWz5FWemGkeMeHL8DlPVlyfQP6W5hy6/
 HchA==
X-Gm-Message-State: AOJu0YxywmfTVEkqtuqJc8K8DqVPFa12NId9ushJiHPgsxLhd3n1bYcZ
 ZVnIQ1xS1ZvUpxkWKShOrTkSKRcK4JubWzIh1dh7hg==
X-Received: by 2002:a05:651c:117:b0:2c9:ffd9:3c0a with SMTP id
 a23-20020a05651c011700b002c9ffd93c0amr2277939ljb.37.1702033201910; Fri, 08
 Dec 2023 03:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-3-philmd@linaro.org>
 <9508bf5e-a554-468f-ba94-4d6f1a5be7bf@linaro.org>
 <323be810-5f4e-4218-812a-7c0ebc858599@linaro.org>
In-Reply-To: <323be810-5f4e-4218-812a-7c0ebc858599@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Dec 2023 10:59:51 +0000
Message-ID: <CAFEAcA-HVf8vWLzmdStEo2NrSKQdZV612rBjiaj-gLW4vXyvpA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/arm: Ensure icount is enabled when
 emulating INST_RETIRED
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
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
X-TUID: laHo/L/rDfG0

On Fri, 8 Dec 2023 at 10:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 7/12/23 23:12, Richard Henderson wrote:
> > On 12/7/23 07:45, Philippe Mathieu-Daud=C3=A9 wrote:
> >> pmu_init() register its event checking the pm_event::supported()
> >> handler. For INST_RETIRED, the event is only registered and the
> >> bit enabled in the PMU Common Event Identification register when
> >> icount is enabled as ICOUNT_PRECISE.
> >>
> >> Assert the pm_event::get_count() and pm_event::ns_per_count()
> >> handler will only be called under this icount mode.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >>   target/arm/helper.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index adb0960bba..333fd5f4bf 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >> @@ -940,11 +940,13 @@ static bool instructions_supported(CPUARMState
> >> *env)
> >>   static uint64_t instructions_get_count(CPUARMState *env)
> >>   {
> >> +    assert(icount_enabled() =3D=3D ICOUNT_PRECISE);
> >>       return (uint64_t)icount_get_raw();
> >>   }
> >>   static int64_t instructions_ns_per(uint64_t icount)
> >>   {
> >> +    assert(icount_enabled() =3D=3D ICOUNT_PRECISE);
> >>       return icount_to_ns((int64_t)icount);
> >>   }
> >>   #endif
> >
> > I don't think an assert is required -- that's exactly what the
> > .supported field is for. If you think this needs additional
> > clarification, a comment is sufficient.
>
> Without this I'm getting this link failure with TCG disabled:
>
> ld: Undefined symbols:
>    _icount_to_ns, referenced from:
>        _instructions_ns_per in target_arm_helper.c.o
> clang: error: linker command failed with exit code 1 (use -v to see
> invocation)

I think we should fix this earlier by not trying to enable
these TCG-only PMU event types in a non-TCG config.

-- PMM
