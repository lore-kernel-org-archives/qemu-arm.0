Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp777035njc;
        Fri, 6 Jun 2025 01:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWG8114yY4QWBv92pfwJM/7m4EcrkMuPnW9v3RtMLE31BNLcKI/EYv3kuTVeoAvXlxkm5KdAEsK+xYemA==@linaro.org
X-Google-Smtp-Source: AGHT+IH+WJWEVpG7WBqeK7i5xfzF9OQ68+jiO9+vyq72V/KxTqEaLFpuIZlVBJXR2qB1CKbPeoZm
X-Received: by 2002:a05:622a:5a92:b0:48d:df0e:ef38 with SMTP id d75a77b69052e-4a5b9d7c6f5mr49728641cf.33.1749199064845;
        Fri, 06 Jun 2025 01:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749199064; cv=none;
        d=google.com; s=arc-20240605;
        b=PKgkD/FBaM9uHJt/CceY/t8wXFanSpdp6nuMxDOOqJNQKPY7Rtb2mTxUgUnueXS2Xj
         jHfuVkoReheaHebu6B/BwG7QzPiX80cHttBXzgRq2AZ3d2E2HVHv04oOi9mJFNtm8XyR
         CI43DjtjNTN+PK7kmdiAYd0xkiX07Z4CN0PZBsK/iIGRm6/SlMwoWvdruuN4EnqAIETi
         PnduouFKltmSpCmo1EzP7qPccLjkYax1C3qb1spHF2awm1hxCX2XCcx4IENGdkIChxjj
         YrWakwzyPRV3uVUd2PxEMY5aFX4t4Sxg7TzIjMmqw98fH2DbrM9p+9k2wRSFciBcuET9
         Sk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hcLZBM33OYI/IZyWoESQLN1A0CPtEZn6tU/hzTRIX0s=;
        fh=qandtX0bqqd0caDX+Pl2xGQK2BHJVmNaCB0qWPi5siM=;
        b=XSq8vbMntHsXAKniX+yckBuq5q69mz0P8CBmor5zD6mCWosPpNb/29qRoJ+1W+WBje
         DuKjUuih1J0Urvl6lw2SfHKjsWLjUsRAvq5PfOKc5kZem3vb7f5+yQdDzoPRfkjcRkrJ
         S3p5yB8OovO9HdYBC+1EXvGxEM+gD7lz+9paGbxfuLJmsnI8KeaJSqqSR2dXS2J0vcUk
         I4NFS3a4RKpaxLo1Dbh+tCVMwlInR9vIuiXg+tfAcXlkP65S5OBuLbMSStGbjdx4PTZe
         OvZadPtXBiQJrsPZ5AvobnGySXdCS3s6LD7Y2/y4T9k7uB+G15wC4wdk3fKQusJ4ctFQ
         8SFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tlwYP/W5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61117c67asi12484621cf.151.2025.06.06.01.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 01:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tlwYP/W5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNSZn-0000ih-9F; Fri, 06 Jun 2025 04:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNSZl-0000i4-Gy
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:37:21 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNSZj-0001WS-HK
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:37:21 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-710f39f5cb9so9766707b3.3
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749199037; x=1749803837; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hcLZBM33OYI/IZyWoESQLN1A0CPtEZn6tU/hzTRIX0s=;
 b=tlwYP/W5SLFrI9CbOFVXBXbsTfyCm5uTm8nEYM9pcO4GEaZCumShHn4H/kLak/q1KX
 TYKZvlLtN16wVIZCmw2i6B3feBcH4YX7p/+kvitOpX7laqrJ5D2qUoWJqQRDmCaoOOS2
 t1JDGpaLMuS6EgjrbMb3h8cTEiHBZEqtCofZryhmkhsYGiRJw/V700SsBZ+E83hxyf5W
 9lJ0KLzH4Xjn9BqPosmVUL1pe4jfOGjmuIqX25IOIs03BEP2P7fLZzQbRLGmdTqGVKIZ
 //Ewyfzkrad2Aw76U5GxiKwpkspVKq5ATVUDT6QHo3llEF7SJzhOtHmvn5J7gIRxMj6/
 w3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749199037; x=1749803837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcLZBM33OYI/IZyWoESQLN1A0CPtEZn6tU/hzTRIX0s=;
 b=s1+j0Y+g80Wxyd3MWr4CT+xp8pGRlOBohgTmBIPWzqN1T8G0tvlgYKwEQcLAubzZHL
 IHISXBmz5O81/dGlkeAnqpUejMJszYu6+WnGLRNFrp8Zy7VYeCyrzMRSBFYg+Jx6uN0B
 zwCl/RVrRjSB9kR4TuwM9YHSjZ1ittDKp8pfD/8+lIGayF0AjbrDDcjQOEzayECMsCBs
 P19+Km3S1Q/ru4RiozqGv0FlVQtooVbkvTASEjx1loT7gIfcb22mW4NhY2uxlpeL03SM
 4JoSJAja8fXoQs/uuADjSW3gpZi1IKCakXjTGIqDOFh5ssBE39pQMxHMyA5+dPlfJo27
 lG8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2+zUoexp/byDXwYG3Y5AjuGNXwFAuO0ZAU+4P2vDuy9iFQDg+/IviEE8h105XVZMIsadxF4sk3Q==@nongnu.org
X-Gm-Message-State: AOJu0YxoviMc2KvvJMxyp0hXp4CkrwoTMEtIvtYh2LBJz4K8W/K15uIZ
 GqGn+uJ/2fQ+q3JdU/3BMzoWcSOQrnQ6afJD8TVWrnovmPg2s1hINWO8f1Ph8MZG06IpPCy/XZ1
 2hOBk44/OcEWCeAq6BcLV9WxwvW1QboiPl0OXeC4YJw==
X-Gm-Gg: ASbGncuDyd0Xrx9DLsKJ8Vs9Tb+cyVZkoEuexZM8GndWgmV4VuHBoRU3P85deRMo/L1
 Xp4iSuwRysjqVfkLLoPZZciGbFZfrjQ26B7+go1ncUBGAL8htt7hx801bPSRMdg+FhUiZnsdHqJ
 /XqL70jybTdsguuPFh12GkJDz/FsPLJDEJ5Q==
X-Received: by 2002:a05:690c:350f:b0:710:ebdb:83d3 with SMTP id
 00721157ae682-710f76bfe07mr31934077b3.8.1749199037715; Fri, 06 Jun 2025
 01:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250605193540.59874-1-philmd@linaro.org>
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jun 2025 09:37:06 +0100
X-Gm-Features: AX0GCFtOladZKhm4GMyvqei2H_jf7hBl4py8G7DakgjNiSU_Z8hS2K-xhhmc3TY
Message-ID: <CAFEAcA9WF75iiL8WmcTYQ2ph7NLuMTXtarPp6HouEZ_nHhg1EA@mail.gmail.com>
Subject: Re: [PATCH 0/4] system: Forbid alloca()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ydm2TdeIUqV+

On Thu, 5 Jun 2025 at 20:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Eradicate alloca() uses on system code, then enable
> -Walloca to prevent new ones to creep back in.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/gpio/pca9552: Avoid using g_newa()
>   backends/tpmL Avoid using g_alloca()
>   tests/unit/test-char: Avoid using g_alloca()
>   buildsys: Prohibit alloca() use on system code
>
>  meson.build                 | 4 ++++
>  backends/tpm/tpm_emulator.c | 4 ++--
>  hw/gpio/pca9552.c           | 2 +-
>  tests/unit/test-char.c      | 3 +--
>  4 files changed, 8 insertions(+), 5 deletions(-)

There is also a use of alloca() in target/ppc/kvm.c
in kvmppc_load_htab_chunk(), so I suspect that patch 4
here will break compilation on PPC hosts with KVM enabled.

thanks
-- PMM
