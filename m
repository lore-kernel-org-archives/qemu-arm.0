Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3126828njc;
        Tue, 5 Nov 2024 13:34:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVScjbHsIm9gbAcmD88Iy7xfLIC+99tok3nSdoswCxZmjVLenbNpqu64520UXMxM4hvylv4nE9JotGQyg==@linaro.org
X-Google-Smtp-Source: AGHT+IFxyT6rgtAPjxw9ui7SGrMDyoZ+Qvi3OOUdYpL5Y3BqP2RFk7dUpD2gipkOc6Ggexw/Yvh9
X-Received: by 2002:a05:622a:d2:b0:461:169e:d2dc with SMTP id d75a77b69052e-462b876d6f9mr243258621cf.49.1730842493567;
        Tue, 05 Nov 2024 13:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730842493; cv=none;
        d=google.com; s=arc-20240605;
        b=N0DDuWkgc1J+I5OsRiufl1MebD9m9q7rbJXRWBkoJV1mj8uieD/9/kegIiNxNGv6cR
         dHySFb+ue2V/n647IQk8vRc7VCoJK8/ZrrbRIixPWg0d7u0x3TOnZmV0u4ZmBGwDSwQN
         b6/NK6KRPplrvpVOgtTfv3kEm4oXMCltXRSawDWYd4/27wiVaWCuVBMaIrlzQo4n8IF5
         33HaSAtbAasjh5VODDbjgF2LrswdGYuXJyrZ21f6mv8syv8a3xjX72HemZ/uUiIHHE1/
         oTfyk8ccGDLTVHUeH7kH9AY+zZswhTRwhabhLs0o7nd2vAi96xSjmzSQlS27Fw12Orj7
         pReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a2UF9CfmA/HFCzdb1nGi0p6naEWaeC1BDE0s44fAk40=;
        fh=EGr/2TVmtEWtyFnu0Wb9K6G8DTwJAaiYqHEZfjww+hg=;
        b=Iydlvhz5oaSMhypccP4hqZ08v4jk52GzFPEizWoVrSvuA58RD6PKOiAMbzOvFMUDvd
         CGQA0pqcUvs9rEl5nEilkzArYLblq9aVDIJdIko4/f8oasvG/BM1hnoGY7sl1hQ9kDA8
         0DtmHCchBfTcC4lrqTv0u4s8+sCchMc0JZtvYiqmpaq5DcPGHpwruYTa7YPb9oTpaI0/
         fhwD8lt14FsempbGvggGgfssztCthGBVeiacUNosldXOMzE2kYTPLmOut1NggbemMXtj
         YH+eaBT0qH3jcM5Fq/05LgwFfkNc0QPTr1psqiCr0VM6C/PEDgwcwpoVmYGvPapmuQN6
         3HOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJUuBruP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1b275dsi140748131cf.341.2024.11.05.13.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 13:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJUuBruP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8RBy-0003kq-2w; Tue, 05 Nov 2024 16:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8RBw-0003kT-RA
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 16:34:25 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8RBv-0001Lv-3p
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 16:34:24 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c941623a5aso407527a12.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 13:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730842461; x=1731447261; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a2UF9CfmA/HFCzdb1nGi0p6naEWaeC1BDE0s44fAk40=;
 b=EJUuBruPVNJZbtd/hbcA6pusaGFs0pvZseOVAORbOHI1xzf8CTsaeKbemNL2GMw4Xi
 zmbab9/usP2xJ50M3cHderHTffnyDCs/lnkpwAs2Wp1JagjKvsQybT5W/gHApYPJfc/n
 UjvBgmJGvIt9n8MQ852fiMx6fx9XSPzTyR8ogGyXLNauqrpyK6o6C9fWvkefcP4aJVOp
 9cEB7FCFJ1J76tpAEKo5XuFUm4eTQEDW0zq8iSqU58wF55uOK3+dyA0CQOXlUuJt3uGa
 ta8/ELqtHkkm6onpxyZnC5xX68ffJkOr2vwvfC3dF9NnRLXbhWrd3an+MMH9vq9AI10n
 3agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730842461; x=1731447261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a2UF9CfmA/HFCzdb1nGi0p6naEWaeC1BDE0s44fAk40=;
 b=tgDKVsHmYjmH4R56NvdlMy82uF64O5djeMWvARFZ7R5ite7o49uZCp1D9Oy3yTAXpU
 2HK/C6TBSUR6chJu39rb7spY3d6KuJRZ8PwLe9j8O5+CzplWjrzwkFmDcCNyEOPIigAP
 2GDo5eYA1cWCUTeStxDVW26inhKbbibbbm8Sc+9uuWj5V+gcNbQHZveTF9PFYxBWmmse
 hcArlxYbMQMRzuF8StjSpkNYAIbkvEPb29dFirWn5CKUnBIOcDNUqeM7l2Lw9fteSeCG
 yPjW6FEsnRJ8VKfy6h0IqhIkXVHRh0hLSA3eTrEXJYGykarwjNnaZMYaUgM+79tdT8Qc
 mZhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlaT0RnvNci7SjeSu9ehPGExubjQjggqthYtifGtGsQt3EnlTgxzSHdXLbEnK+xs2ehVLnIWjmjw==@nongnu.org
X-Gm-Message-State: AOJu0YyQX7Swko32itJ/Lu+UEkecUVJoopTbZbpAq+9zeCSR73Tp90oE
 k+cp/HQoPmazR36rPjHZrZcKNb+9SgxwnFnxSSf+U2RkQEs3/15M0rvNRDdVLQwIN4KFrN5mKC1
 RxLlm42GNhGVTU/yvdFqiFQO0MYR1kreYe8FlOw==
X-Received: by 2002:a05:6402:430c:b0:5c9:46a7:527 with SMTP id
 4fb4d7f45d1cf-5cef554cc86mr308508a12.17.1730842461305; Tue, 05 Nov 2024
 13:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20241024063507.1585765-1-clg@redhat.com>
 <20241024063507.1585765-11-clg@redhat.com>
 <CAFEAcA8A=kWLtTZ+nua-MpzqkaEjW5srOYZruZnE2tB6vmoMig@mail.gmail.com>
 <91c2ac92-66b2-45c8-b4fe-e8f8587b0e9c@linux.ibm.com>
 <CAFEAcA84hhWu2ouirfDPbCpq_=QLQxAf3k47h0Pij8iEnOVj+A@mail.gmail.com>
 <2491bc60-9a0b-486a-8f6d-2c4c94332756@linux.ibm.com>
 <CAFEAcA85g2nX3MU5RzmBvAHT8Kis1JHhiEaBvnFFbEQkG+0OxQ@mail.gmail.com>
 <e6c33df3-49e9-4b8a-b7cb-d38c2ebee3be@linux.ibm.com>
 <CAFEAcA9La7y1Z2-nMnJDyC_p+z-3c0EnDzEE=w5LTYtRnXPT1g@mail.gmail.com>
 <1a1d29b3-c14c-42a9-93ad-c773e3b265df@linux.ibm.com>
In-Reply-To: <1a1d29b3-c14c-42a9-93ad-c773e3b265df@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Nov 2024 21:34:10 +0000
Message-ID: <CAFEAcA_awJURkAhyhz88iEyfe7BU-ApeHB8XZ5EeThoKFh3p5w@mail.gmail.com>
Subject: Re: [PULL 10/17] tests/functional: Convert most Aspeed machine tests
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, lena.voytek@canonical.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: tvTzP9P5Eqrp

On Tue, 5 Nov 2024 at 20:12, Stefan Berger <stefanb@linux.ibm.com> wrote:
> On 11/5/24 2:54 PM, Peter Maydell wrote:
> > On Tue, 5 Nov 2024 at 18:36, Stefan Berger <stefanb@linux.ibm.com> wrote:
> > Anyway, the thing here is that we run swtpm like this:
> >
> >   swtpm socket -d  --tpm2 --tpmstate dir=/path/to/somewhere --ctrl
> > type=unixio,path=/path/to/socket
> >
> > where we use command line arguments to tell it where to
> > put the tpmstate and the socket.
> >
> > Either:
> >   (1) there are places where it's not valid for us to tell swtpm to
> > put the tpmstate or to put the control socket
> >   (2) it's valid to put those anywhere we like
> >
> > If (1), then swtpm should give a clear error message that we've
> > given it an invalid argument (and its manpage should say what
> > the restrictions are)
>
> There are no restrictions on the swtpm level when it comes to paths.

> > If (2), then apparmor should not be rejecting this usage
>
> AppArmor file restrictions are all path based. We have support for home
> directory and /tmp, but were missing /var/tmp. So, please.
>
>  > > One of swtpm or apparmor must be wrong here and I think it should
> > be fixed. In particular, having the failure mode be "something
>
> As stated, we were going to fix the AppArmor path in the swtpm Ubuntu
> package.

But AIUI the solution you've proposed is to add the user
temp directory -- abstractions/user-tmp looks like it
adds permissions for $HOME/tmp, /var/tmp and /tmp/. None
of those will fix the failure we ran into, because we're not
using any of those tmp directories. We use a directory
that's a subdirectory of wherever the user put the build
directory, which can be anywhere the user has permissions for.

That's why I'm confused -- as far as I can see the only
way to make swtpm work the way its documentation says it
should work is to for apparmor to permit anything
(or at least to permit anything that matches the file paths
the user handed swtmp, if it can do that).

Or if you want to say "this has to be in one of these
handful of authorised /tmp/ directories", then it should
say that in the manpage and check that at init time, not fail
near-silently much later. At the moment the docs and the
distro-integration of swtmp disagree, and the effect for
somebody trying to use it is very confusing.

thanks
-- PMM
