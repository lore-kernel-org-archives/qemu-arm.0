Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2579097dye;
        Mon, 30 Jun 2025 09:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoi2aaw+qDFdHG6+Vjo2Ptq7cif+QguwqGFvlbgDFbzc5QRe1P77xGbtmzByNfMkamEZFFC04yNdCOFg==@linaro.org
X-Received: by 2002:a05:690c:6089:b0:70e:719e:743 with SMTP id 00721157ae682-715171c7453mr204309797b3.26.1751300189984;
        Mon, 30 Jun 2025 09:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751300189; cv=none;
        d=google.com; s=arc-20240605;
        b=hy+K/d13VlQxH1gCLKpGHBgiJ/iqc/bmc4v2bIPJtg6c5fTHztqgfeYftWYtPFdQgm
         XxoqeJg3SyZJD5seO8Dk7jOZEujg0z6Wu/XibcYtI6us/392fTmPz1EBw3KoeB5RI4au
         v+IpLqaabdNxIZqNyrzHpvYu2MZgtUjCCHjUOcW5sekhzgXCqEk7xi5Q5bENlxbpp+eL
         kHIp1aqquqE5qw0YmezTTxcJo9KV0zXvVkgjLAtRJKXLO40bFR0t3BulhuUYpQAwh7Nq
         bcO8CIzE5Q1kOQ6JzaOdrGfoAbWMEaZMO8CoRQytEB1zQcYLSOVFIr8bopEOyx1pEgoT
         8NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8BZBxgeIj5Ljo6n9tAnEBpWp9p9IcUSOm3ISMJeS7VM=;
        fh=kaxtLDJmQmIdG0s15wT6KHRNTBJ16ALzlgo2LKtvMQM=;
        b=Or+rLMquPeBeA98gHfNdzgQD0bhm2MhE+ozALZgp7h7FOz95Qu7M6TI6hGLXuudEtL
         HI4s3F5MS9gv0Gh7/JSJQfpr2M/senBL4n/XSVX8YIYasdPyfL+L32qhPIFiWf1FAyOQ
         5oloKvFC1amnWrd4n/4a40mWgUxDvU0L8c2Kax5bEMFfDAtRWgkHEeYYdEAXui8FKAQD
         jIXvexrEtj6aeXYr5XhaYRYX0CxjKzRMpoug+5mHTT6VyvDasa4UYk+jVx2QIyS28M8L
         5BX4w2r1OQm+iFNPxQ+e0eXCUj/oyCJ0j7zwilBlfjP1DPGtMhbk50FxSqZuvHVYtjF9
         sz3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhK4eN1f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515cc20e7sor44960447b3.13.2025.06.30.09.16.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 09:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XhK4eN1f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300189; x=1751904989; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8BZBxgeIj5Ljo6n9tAnEBpWp9p9IcUSOm3ISMJeS7VM=;
        b=XhK4eN1f4vF+e1aKXNtiHQWaKCbnXieDO2N5SK+m259wHKNaPUUV+mQ+pHaHjgyacH
         wVjK8Hc9CSvDV5+hDFwDLaTpBC65nTSqRW2+48CNUaFnbxSRVADx7ZvcOsUNUJNqJG2k
         yWwVvVsQG/oFuqWUW1Fru2b0kOtMUyo4Evlq+r+ucyadXVSyGmWo88JrFeVsIl558lWi
         cSYTOVSmzV+7WlfHdBHN50c90B/81CuFJClAtiyi2PxzaIyY0jlasJGNe6OTdMzoaT2H
         R3MWjDj2ggKy8AlZvPNyBReUC7f8Z/ATd60hfMmjUQMkr+6PCxet0CKTU+wY9eBd26pV
         gz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300189; x=1751904989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BZBxgeIj5Ljo6n9tAnEBpWp9p9IcUSOm3ISMJeS7VM=;
        b=bHV8/DzFvFlBUJp8dGFgI0oeXyFcp7YZVboHrrVnsbuOFhjOCK4Wfc8Q5FC5MIJhps
         myCcBXblCbzBB+LsJfye1tuTf0HEuDdDnIc4eu7utLz/k7x+AMXZqkuLWqdXIgVSi7Hu
         FfW3q4f8DL518VgdZ3M4hqJo433IaJKqA0I2cqOidWi1yFnhmbgqNVcXbgsKaQBGlKxg
         9wk+aCDgvXmlieVVwdM0RnMLAfK4ytJdiJilZe+7ys0MEekzIq9v6u6Q3A4TQBN4NrNU
         CmViuXpuMJPDWXzvAqRnrd/lbvc0V4ySTZOESMgVREh0BP1qi/m6JFSd5r9rUEgirOOa
         aBqA==
X-Forwarded-Encrypted: i=1; AJvYcCVPSx1KkRO/qmCsmIGVYeNCfJroInhXtOB6wP4vDnmOw658Xufdus8rahIo3bg5cn8hogRCHlTqnuORww==@linaro.org
X-Gm-Message-State: AOJu0YyPh6sjM5W4E+Psflm4NMYgAxCeaxl5YZmoDyVUo1+qViSycDLD
	NjC5o3R9lcRb4HPLr5u2cxIlnroSvO67AUxOa1Iyb7pYzxyqRAvNId+B7t6xw3oWs3Bs6xZz5G2
	zx/G/CuiTcFHI/ls4GgX3b1XLLoEeA7AepsJ0EGIshi33
X-Gm-Gg: ASbGncuJnboU2R2whGCkSH/EM1tbPy4oy1ilf2sXcfnr4QE4Qc3wVaZEfOQRWiG8p/f
	YPHHR3t/zQsHINAgeaYDYsQRJP0yBhJN2n3yEcQVuB3T2Zhwgo4t8yW0yNJycBBbs712/X8BENL
	weqAagbjAe6asse/Mz6B0NXfG0fZWIqcLkVMTcUpqx0Wwh
X-Google-Smtp-Source: AGHT+IHvTJtFy/nU7dOCoKHEaC52egzb/2X3lb3j1a5kbQx+70kL7EhZ0Abj6VtKqqtQDr+w9dVqmOi9yfh1n12XHpw=
X-Received: by 2002:a05:690c:6482:b0:70c:a854:8384 with SMTP id
 00721157ae682-71517169329mr221842707b3.11.1751300189521; Mon, 30 Jun 2025
 09:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
In-Reply-To: <20250628195722.977078-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 17:16:17 +0100
X-Gm-Features: Ac12FXzISi-A2WlMiUBX1pzbJT0z8Snzh3hDylllMcn4Z4ESFev1Cp8oWPlbTf4
Message-ID: <CAFEAcA8_ObePy2_A2st+=R2aKPrc=XeqMv6L+Jg5JxJTsA4qaQ@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v6 0/9] hw/arm: GIC 'its=off' ACPI table fixes
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, philmd@linaro.org, 
	mst@redhat.com, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	udo@hypervisor.org, ajones@ventanamicro.com, imammedo@redhat.com, 
	anisinha@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: u9bmK1S21rus

On Sat, 28 Jun 2025 at 20:57, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Since v2:
> - Fixed no_tcg_its inverted logic (rth)
>
> Since v3:
> - Fixed remappings in the IORT table when ITS is no present
> - Rebased on master and resoled conflics, like no more "no_its"
>   flag in VirtMachineClass
> - Dropped patch 1/9 because we actually want the instance flags,
>   not only the class flags, and the instance flags are the ones
>   to be used often when deciding about the presence/absence of a
>   machine feature, instead of the negated class flags ("no_*")
> - Adapted the other patches that depended on 1/9
> - Dropped patch 4/9 in favor of using the instance flag for
>   checking if ITS is on or off
> - Simplified VM options for the new "its=off" test
>
> Since v4:
> - Fixed/restored commit authorship and author tags (philmd)
> - Factored out create_its_idmaps to clarify how ID ranges that
>   go direct to ITS Group node are created (eauger)
> - Addressed all remaining minor review comments (eauger)
>
> Since v5:
> - Use of "directed to" in comments and commit messages (eauger)
> - Renaming of variables num_id_mappings, smmu_idmaps, and its_idmaps
>   to make code clearer (eauger)
>
> v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
> v2: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html (Patches 6/14 -> 14/14 in the series)
> v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
> v4: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg02583.html
> v5: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg03793.html
>
> Fix ACPI tables for '-M its=off' CLI option and resolve the issue:
>
> https://gitlab.com/qemu-project/qemu/-/issues/2886


Applied to target-arm.next, thanks. (I fixed a few checkpatch
nits about hardcoded tabs and an overlong line.)

-- PMM
