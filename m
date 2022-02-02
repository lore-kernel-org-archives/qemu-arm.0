Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1403142lfk;
        Wed, 2 Feb 2022 13:18:27 -0800 (PST)
X-Received: by 2002:a17:902:70ca:: with SMTP id l10mr28893551plt.174.1643836707411;
        Wed, 02 Feb 2022 13:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643836707; cv=none;
        d=google.com; s=arc-20160816;
        b=C+c4+moxtJXW0x/6TSVkZG71X4IQ3ErLXfAwt4hXyTxRpC3O/HwH0G9AE7UxH4oddC
         HL/fYY4ULr/kIR7kMUI5cDO++1H9dcESK3af+NhOJ5Sn0lACEk0UEKLGs5p81TSgMzb/
         T0hpj0o+GlP6cfwy+PmaOPuQR2iINmbYbMSAGAPBiqHfrEXGhztRWht2vJHje3p38c48
         VaBkyRjtQvbzs1vbAXFgigwZmNjPRH6zVAcRPh/MCrWWtFov+q6gpBMXQiP7QTELKM3z
         GD5ZqlNxOLBWwbiOvcCuY2feF+WynjYWLdIJgJv5a9K63bjY+HVSVxIFJNQgIrwgJCsb
         KcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KPjoAuIHgpRFNPC1FBrX0D2EYcqa2vADIu71GbGLf5s=;
        b=L9iY6vXrh1OKSe4Cc3MoWmUNgi+wO6qX68BF+ozQW4ipBpWDncuRje81psEUHA2QFO
         pXkKgCnTTDbiGPVE6wNJ2pJ3qO+leQZyP2Hb9tf22yIinNl3IHy68c6Ilmx+rxraU6Ke
         i2C0ToYe3iT/QcamlV17XEwKiF/YFcVj/IEJvoGCgXzfYIu+VSNrNmWXmtkiQ46BnSep
         p1Z7f46QGDQ5r2bRDxtXMIbMpk50AJpIr+KlIt1gHCELO/UhwaF2duzbwmW1/TkPNacr
         sZT1tsuYJbk6E2LacC+oUedFmaKYmHTK+MrdjJmGCpavjgFLdSMV/hKYfLnGYz0/T225
         GG1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qMhdU1cR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a8sor3186913pjw.11.2022.02.02.13.18.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 13:18:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qMhdU1cR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KPjoAuIHgpRFNPC1FBrX0D2EYcqa2vADIu71GbGLf5s=;
        b=qMhdU1cRCKrxAtBv1vgtGVPqvAzB2RnKPudvbeXFc7aUM/dfj7jRTaRdiSBcZiDDIb
         5Rk+bj9VSjKvcEVHipus1KDbls8pz6zd5MxMdkrjN9fzC/xsttkdGPoZfhrrI4PM3CWm
         ouo1HMbEIZ6XE8Su5VarLmqZT/8TldPPi4d5pwbt99J0iLSnxngkSd/zSsIzCh/No967
         IQm6Y9rR2u291E/30nCLtlyrYNTaILnrVoM5fjUDWFnxxNJr1s+0LEPNBOL2m4crkvrL
         TWuUYNgw3ocXnd/CKe43rKqDEeCDgGfBPWsd10o4zgw7PN/m/j94SZiAnx+GgGOML9Zi
         Cfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KPjoAuIHgpRFNPC1FBrX0D2EYcqa2vADIu71GbGLf5s=;
        b=OGCHLJz9uVb/k8Sicih2XL0Tyo2wlPZtpn9zjMYPWvYEciumiU5RwO9TL1plkDqNI4
         cBM69UIOzKVCO8aYHyNnYf88oNiyGM1VBNlb64LrZSswtIbJ6hgtBhYvatBAVyypDo4I
         LvOf5Yylc0axRU8STMVq7xOC7POMH6MYLaphYS2EZ3dc68j65iY7DTfBtovKk45RP6gS
         cVTRWHSx5LNL2g11vixMCXTmBRKaWfW/3Ls3PmSwqp1fpIE2liDHCpuJo/BqX/AQe0NF
         e5eNsNwV3nX7tgAsxMWVGhmF3ezC/GPBSOZFf0HOhDVUtK/PL1h4+Wdkzb5uAW94P5LO
         Oxdw==
X-Gm-Message-State: AOAM530iIiDw2miOcMcWoJiO2LCYVz5lSBADaqBzUxnztEzML6NEqSzc
	dn2mCPTL4hRRBAZLX5emtwg0X5VJZMCWf+ZbiJQ=
X-Google-Smtp-Source: ABdhPJzwhYgbLxOAMglA5jafiACAqlRz9IQbyakACrgrQgOnUxUVX4pyT0GS52X89tQo/IS+zVlkyA==
X-Received: by 2002:a17:90b:3b42:: with SMTP id ot2mr10155426pjb.204.1643836706904;
        Wed, 02 Feb 2022 13:18:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd? ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
        by smtp.gmail.com with ESMTPSA id ne23sm4000424pjb.57.2022.02.02.13.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:18:25 -0800 (PST)
Message-ID: <be64d2d6-b80f-704c-933d-e998c8096fd4@linaro.org>
Date: Thu, 3 Feb 2022 08:18:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 4/4] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lepNFqIga1vw

On 2/3/22 06:12, Alex Bennée wrote:
> This builds vectorised versions of sha512 to exercise the vector code:
> 
>    - aarch64 (sve and sve2)

Again, I think you want to test advsimd as well.

>    - i385 (SSE)

s/5/6/.
Here, might as well enable as much as we can: -msse4.
Oh, I see, the pshufb comment later.  Ug.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
