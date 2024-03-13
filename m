Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2466318ejc;
        Wed, 13 Mar 2024 06:39:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU44G1g1S6lKcNbxJt0qo4bC5/6NFoVq2Kx3Ry5UI7vfczLBJLxCyaSvuj+Itzb8DORUPXvLdHTPCDFCUqwBjbP4jI6glZ4
X-Google-Smtp-Source: AGHT+IGrtE5uSWt5H/fD4PyVMRIXp5cDagm3t1/h6fNYb3DsaaQY6M6QPdwJZMTjCiE/s8ipRg1Z
X-Received: by 2002:a9d:6d08:0:b0:6e4:df67:e2c9 with SMTP id o8-20020a9d6d08000000b006e4df67e2c9mr6711520otp.17.1710337188716;
        Wed, 13 Mar 2024 06:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710337188; cv=none;
        d=google.com; s=arc-20160816;
        b=klpleOFKpiFyBHiIky0XZV3WXV+xPWFkgB3uYeGCwdSsaqKX48rql2B1PYOCgYvxKF
         W7azD9ZPX1pUvuxFOymhR077ROgLDTCplSWn2CQAv+c4R0OQzK1Bg9zJ6ueyz588xZ6e
         8VcPvzN4sFyS47svbyOCM8HYxcFzDS+mN78cnjCgG4ep6IgCLCAYHmbz1QbxFPCChi37
         FZ6qGZC+cSXtJISe90c1jh/BYizBuTI24Awxd30+21ICXYsr+woGdszAje4r7Ecxbtda
         dmryd+kPVbk81jlGpJj6kXSe3/gTlNpCczuKa0DoF+zhBmsILy3DZeSBS5iZPO0A/0sC
         BWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=opoUGSlDJP2Z++ZuVyrOcqqRBByg9hLmua8U/wls1aA=;
        fh=luVc0aXUs7UK9Vy5YVvMaCLrWYhT1Vt2mFbrgg+SR1g=;
        b=R8uPYUpa7CDlmbIAeQ/3JjsVumaCpSDSk91Uc9BncVcQCSALPmPDprpVNBeK2k5Z8M
         F44ln2K7ewvbIJr3FEhiZQjwi6hE5D9vhTkTWr+UJ3v8sQU5oo2uY0W8NiREWQGYhIdR
         7+d+s0swv4+UsSTV9F44gpNH9gydvVOEPxj7nDcnVkHCNTLUxp3sbkJUB/qDKFUiO3xQ
         lQ9r1Ucmbtx4pByKdkW/etqx3ajvTD4RRemG48LaZSu9hUuQC0KQ/LrPlQmAnjmq/0yT
         OOL466+f6rmalK7DyZPKgGrMjuoRGCoc2DsBM+LNmJ8h6DP6Xq6bqMfnZgArvsAS/Wg8
         30RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=er3oDW5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23-20020a05620a14b700b007884fdf7f3esi9488515qkj.253.2024.03.13.06.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 06:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=er3oDW5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkOpV-0003nX-8t; Wed, 13 Mar 2024 09:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkOpT-0003mQ-9c
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 09:39:35 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkOpR-0006zJ-Lt
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 09:39:35 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so13543761fa.3
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710337171; x=1710941971; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=opoUGSlDJP2Z++ZuVyrOcqqRBByg9hLmua8U/wls1aA=;
 b=er3oDW5Cdo3NhLNZYJHm7Xa4cd6YE5PRkeRpwpUlclku9mxlNnli8fSzvowD2y65G5
 0lJ8PyGu/O/RCwZafq6r6C/X29u7u3602DS1GjPnczusFqEmwtTsGtQkT7HUaU//seMV
 AbMdjYbmI3csLow3QQ9LSaqfwmQIlvis/a6+rcyYikNiggD7u3eqF0IhBMmObc3cTeXV
 0hOZq48O+vLv4kJMmc4X33MySd4QQgPEFNfSjLp9isP+ncxt9iioCKLACiNZxKUQ3C56
 sCG+up4/BVxYZrXGWJHTixIVtC0yWweiHbvScQ+yU9W2B+Kf/K25FHVDifivpCdn/Jek
 /QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710337171; x=1710941971;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opoUGSlDJP2Z++ZuVyrOcqqRBByg9hLmua8U/wls1aA=;
 b=s6ViEi0oSX5TGzQyyyw+4sRgRSnPV43i7kmWgm3DXyCQrPSwyXPksUjh6vVFEBpPCD
 qIZEx24nVKGO4/JiwVqI/AhfMeBRTW/AF2KsynWT9KbGOM1j2BYUWP2Cuostpa1OT6EI
 Llc1QxvdY1JtCKrTF780Diah6xAFHDBiL/75L7gego5qD+Vfi15p0ZulW+CqBjv5bqwt
 IfOmfrP68UROCZNIeNLroIlIySFCUwrk/nFaAKUVqH3Vo97g90TETsudvuaMCAkCFe3N
 xgiw5IcqAnG3CuaFi7ZawkuwSdFsfGtqOcPyd39x+2PeNOcVI5pgk01s7abfmCuXWzLr
 8jPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVldb5MkqM7q0KeRO1QaJ/JbQh7W3Sip19p2lyFwS6iPM+SJHksZkwuxd3yUrY8Sc/hsdbR7aQJQJrbLXjDSeJ3rlbq
X-Gm-Message-State: AOJu0YyXU4oMycjwlmp3BzU/B6zcq0sj8ysJHeTOVLj16PN1V2qY3y4r
 XEiJR9V/qHvnifEywICFuN7A5iwx91BkynmySAfxMuizoHqtByfyz16lGs8BQYE=
X-Received: by 2002:a05:651c:204:b0:2d2:a201:3e81 with SMTP id
 y4-20020a05651c020400b002d2a2013e81mr2221693ljn.52.1710337171445; 
 Wed, 13 Mar 2024 06:39:31 -0700 (PDT)
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl.
 [83.11.22.169]) by smtp.gmail.com with ESMTPSA id
 i1-20020a0564020f0100b005687bb9816csm1293755eda.69.2024.03.13.06.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:39:31 -0700 (PDT)
Message-ID: <fe2abd47-be73-496d-94a4-0b6d95f31bd1@linaro.org>
Date: Wed, 13 Mar 2024 14:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/avocado: use OpenBSD 7.4 for sbsa-ref
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
 <20240313-sbsa-ref-firmware-update-v1-3-e166703c5424@linaro.org>
 <8c197bfe-0cab-47dd-beec-c9752d434a47@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <8c197bfe-0cab-47dd-beec-c9752d434a47@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BXrtKcmw3a+n

W dniu 13.03.2024 o 12:44, Philippe Mathieu-Daudé pisze:
>> -        :avocado: tags=cpu:cortex-a57
>> +        :avocado: tags=cpu:cortex-a57,os:openbsd
> 
> IIRC for some reason we must use one tag per line... Even if
> named 'tags', this is handled as a single tag, so we couldn't
> filter on "os:openbsd". We need:
> 
>    :avocado: tags=cpu:cortex-a57
>    :avocado: tags=os:openbsd

OK. It worked when I tested this way:

$ make check-avocado AVOCADO_TAGS='machine:sbsa-ref,os:openbsd'
[..]
  (1/3) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_cortex_a57: PASS (16.18 s)
  (2/3) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_neoverse_n1: PASS (16.06 s)

$ make check-avocado AVOCADO_TAGS='os:openbsd'
[..]
  (1/3) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_cortex_a57: PASS (16.18 s)
  (2/3) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_neoverse_n1: PASS (16.06 s)

