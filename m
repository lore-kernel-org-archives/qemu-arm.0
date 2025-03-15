Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp1062288njb;
        Fri, 14 Mar 2025 23:38:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcvWUf0w65lR/SKBS7YL638yrwmCTbeYeHGL6CnL6AbbWWIBTrj/JSFanIkTIsvPpOTA9t3pKR9TMPEg==@linaro.org
X-Google-Smtp-Source: AGHT+IGp67MzhhJTfHGHcjzspd7sNz/E9EW4kw43XB1hlobsYQNMPKw7UF7q0LA6G4D6moH1L7zw
X-Received: by 2002:a05:622a:528a:b0:476:6d30:8af6 with SMTP id d75a77b69052e-476c81c3197mr66390051cf.42.1742020725602;
        Fri, 14 Mar 2025 23:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742020725; cv=none;
        d=google.com; s=arc-20240605;
        b=SlTWNqdVHboezeB/Fe1havSjBryALw9Z6s310fH2SizdnDORaanp6Qd7GkGnWXuluc
         m4cqXo3rvzQaWLyMRWp1HC/TNPo1Fr71gkddzX9rW2zPguPRok/nTkyCpV4vZev7u7zV
         FXehEwNVBv/rnLuLXJ701J8Yf78QDoq2hTpM/dld1Yhqs3T3QnkJ8Vvbuk5x3ptZfaJQ
         17g/yEFVP36/+J2aLuQyXsQbXNwPCdjVIw3JBKUnVWNadCsRZevDPIXwqMpYqrCpJzFt
         GFE7pmUREBhHTFeUu682rE2tYEDoQ58KzYqD7DlLcoTM+My5QZwRMe351roluruOJIyQ
         pCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nFCnGdSj37YIZBoEcXAYILIMykm35qQUDgJz2GzhwVc=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=dEEHKjhwZzD7KTbxE8kkPqPVCgfhHKsEjZL8jcjMAni5ubITHPor2xfkITTxHCIN4H
         3amL1wcthLqulsr1csGro89JSysQMytv1Em6GTOX74g/mQhF2qginYdVAZIFIsFC4Soa
         RP4jXG56u2cs3khq6hb5v9VPc353y/py/SXvvV81Jfrxm0D0gpfrOHSYMtvNZ0TKuROA
         OsgrcOkSAkX8Rw/QgbYy6goWfSZlB0hiqsmzM4MSQllbzD95TFImEjFdbX0xmaPApGjJ
         CRg3MQNQKEezye97ZM3FEZelklOtGntj07OTsvCXgOoPazaLZ72xYoyuO2mz052VmRsM
         cfLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ppk9RY0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7e1a0csi54551061cf.283.2025.03.14.23.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 23:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ppk9RY0p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ttLAI-0004vh-5g; Sat, 15 Mar 2025 02:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <psswdrcvrygml@gmail.com>)
 id 1ttFld-0000w8-7P
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 20:52:45 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <psswdrcvrygml@gmail.com>)
 id 1ttFlb-0001O7-MK
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 20:52:44 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5499bd3084aso2671589e87.0
 for <qemu-arm@nongnu.org>; Fri, 14 Mar 2025 17:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741999961; x=1742604761; darn=nongnu.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFCnGdSj37YIZBoEcXAYILIMykm35qQUDgJz2GzhwVc=;
 b=Ppk9RY0pADapJ9pFETtD82kjjN4cJcpLMqR5VOv6LCqL4C2VYrSQyeGgsdwv+cHbVa
 rS8sSMGIqrIWuIcm2uI4Cf7KAlanpFcklt/rjatwngdTqusX19/6Pb/axQ4PQzMQS3ZW
 pMFNupwcJwepImFUvjemx00kyXql21Cs1S0bD5FsmOPBOzfvAc7ALNn3Stc2tozSyD4F
 KDI9ZKqRhvw6cET41kfSx1KwOkihr5oSUlqkD7XWULIgEPfhRxP6DzmMO4iXVgO+fyWV
 lZELeXz6nAozYr+ZrW9RgI/Ob20Q/rZip7ZUa4py3Av9vRpsvZu1hbfR9hfXE03GDIhz
 hENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741999961; x=1742604761;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFCnGdSj37YIZBoEcXAYILIMykm35qQUDgJz2GzhwVc=;
 b=a93aHCzU+YhzyysRZmnxj9RwbS97slC7WQ1b006XBnynnUS1rdttFF1neu1830TQqM
 5xDZ3PrTqpWh/a+WZv+jREkwBzD8sj/xwlibFUUbaLuCuUrSJ4kiIy8Ofsgyr3qG4Joe
 f1f+fpM5mK9P3SpUg+wAwtNzb7VPMyXtzztgD8UGdV6nfeAUjH9RyN0WVdJuvDr/Hq7L
 SPLMA4ovR3eGTkUuc2Sf1hSHW5TB/AzhG33+p3EjPbokYwEOChBKsFtE/gSBMtkZnrIw
 A4ZI5L7G3t2BHExddsHtxRfZ+cGaVx6WpzlPP0Htr6rY0kNFiy2Wc8xTT7FPig0ih3dB
 KiPg==
X-Gm-Message-State: AOJu0Yzi7rOIKHS1SbUiaLRMH5NeLHGPfEwTbzH8HnnPuRlAWv5ppEOj
 Ig266A+FzSzHeee79rIZjq6Ek8qB21c7a3at8zHIqIQJURtyWuFqb/Dvx87ZfIzuQ/orSuwnBBI
 HQ2+yQthw81MfAN7rik+sS1WqEALv/w==
X-Gm-Gg: ASbGncupsLSQSguyER1E11pNOiWvePD3ME53qrbaLSWK58WEIta183eSkwNraNHNbgR
 fCBXdQ2chSvs+8qon1Fff5VcbTKdnIdU96/3oNHjgEnOfveqxdw7En1xsWqOqp7MwH8yhVb/3eJ
 qz6Q2nPKrKb2rbPiMmoiyKbozCF9tY
X-Received: by 2002:a05:6512:2829:b0:549:b0f3:43a3 with SMTP id
 2adb3069b0e04-549c39255fcmr1776845e87.33.1741999961035; Fri, 14 Mar 2025
 17:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJP3cEFQSyTsK2tOwZGLtfNHPmvK=P-z17nfCa0P-S02BQc0cw@mail.gmail.com>
In-Reply-To: <CAJP3cEFQSyTsK2tOwZGLtfNHPmvK=P-z17nfCa0P-S02BQc0cw@mail.gmail.com>
From: Peanut Password <psswdrcvrygml@gmail.com>
Date: Fri, 14 Mar 2025 17:52:30 -0700
X-Gm-Features: AQ5f1JrIji0eS4nGvyaf4n0k5p6jO_HRkEvKLNCQeqLveMaDrAvoueMFtUVsluM
Message-ID: <CAJP3cEF7oOc-LnFbWSujO20vCL_6mSdBJvAxs1hO6v8PDc+-wQ@mail.gmail.com>
Subject: Re: Native arm64 Linux kernel build on QEMU
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=psswdrcvrygml@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Mar 2025 02:38:32 -0400
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
X-TUID: hnOspV89/U8i

Apologies, I see now this is a subforum of qemu-devel. I will post
this to qemu-discuss instead.

On Fri, Mar 14, 2025 at 5:48=E2=80=AFPM Peanut Password <psswdrcvrygml@gmai=
l.com> wrote:
>
> Hello, apologies if this isn't the right venue; this is a beginner's
> question (just for play/learning).
>
> On native x86 machines, I can build the Linux kernel, take the
> `bzImage` output file, and plug it straight into QEMU with
> `qemu-system-x86_64 -kernel path/to/bzImage`. The readout will be a
> kernel panic complaining about no initrd.
>
> I would like to get to the same stage on a native arm64 machine. I
> believe I want to use `-M virt`, and I'm not sure of any further
> settings that need to be passed in. As far as I can tell, the Linux
> kernel detects the arm64 environment and builds successfully. My naive
> guess is that the output file `Image.gz` is analogous to x86's
> `bzImage`. However, running `qemu-system-aarch64 -M virt -kernel
> path/to/Image.gz` just opens the QEMU monitor (the same result as
> running `qemu-system-aarch64 -M virt` alone) with no further output
> (e.g., no kernel panic). Unpacking the gz file to `Image` doesn't work
> either.
>
> What am I missing?
