Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp384989ejc;
        Tue, 5 Mar 2024 08:10:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAc659lAS7jAzy6CdkAFETuJTsE2tu8pQ40cLyAjzovPMeWBvoILV0jl7OKvLN+Us9ZoqA0tb6bFygptRuE0sPWCDFjQTC
X-Google-Smtp-Source: AGHT+IEZ+b++dBIFxy2fusOWoIq1/cVpac7LlIcFx6NJDUPZu4WqzOasmOp9xQapiRaUVdkRsOat
X-Received: by 2002:adf:e992:0:b0:33e:19ad:9364 with SMTP id h18-20020adfe992000000b0033e19ad9364mr9853752wrm.53.1709655044852;
        Tue, 05 Mar 2024 08:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709655044; cv=none;
        d=google.com; s=arc-20160816;
        b=Yzu1eQbFjpigYDtZH01GkqAAyhOOPaVUadmhhdaA2EYNXI56nevLK6fbfbxrEkpGlr
         NO+eBmpdYPb1gCsJM31jSr5DTdjR1EzUrfws0+BwYL/s9xBNxcM0a1alsE09u3H8ew4J
         42bj98gJCZC29kndN0ulLXz6LYAEFH7rsSQkThPPD1LEWTrpCCOnun/lCXHMDE6h/+R5
         M0rBxHTd9r+4T5csVAMPeXUte6ufm7AtDKsY30y4K2rNoVaYKVAaBHGJCX3iqDYjBVqh
         xUC1jY7BWrbD/s7r6E4TxbRzGx2BicNONbhLIEbxnwU5o98UckU/yRNOMCIg2wOpN3aS
         emKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ITPbuyvZojASfMoINkZ6zQKEHusy65TEHK8RoXJYJwY=;
        fh=RZQUP1f1OxuF4yrYELR04WliwUPvgngTTYmE0dpjxX4=;
        b=V8CzPPq3L/z3Zpj5FlsM8T8omxoGRzze/6E3AtLVKBlvgNoNdzvf1Y9UvxdQFhO/d3
         IdNFl+FQc24WAhyNOQThD+kUMW8T5Wpp13T1+/fevH29MWcZoyCtjUvDNfgsa8TmgeMB
         dMTto7T7nEQMBa7HnEuwT5guri/jvceEZNFyh4Z5p+s6F10UyRYAm7s7HoBEmJgvtgLC
         4aCBBaKmBeQPCoXDx9KegTR4YiqRqiBLUgDFoOGyMWqt5Tp9MtA+1dhqSE0SmapdCQBU
         AQGNzqg3mGmiPXMCkv6Sb1q2nlme/SGYQlkM9zXJqKDAPldPF1U5Jrz0JPsJFB9WXbbx
         bybw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiVzL8v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020adffd45000000b0033e47e523a0si1173602wrs.686.2024.03.05.08.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BiVzL8v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhXNG-00080G-06; Tue, 05 Mar 2024 11:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhXNA-0007wX-N6
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 11:10:32 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhXN7-0003Sk-So
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 11:10:31 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so8622385a12.0
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 08:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709655022; x=1710259822; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITPbuyvZojASfMoINkZ6zQKEHusy65TEHK8RoXJYJwY=;
 b=BiVzL8v4ARQoTCzXfSYfvoZOUV2zTOf19K7u2TLSSkw8ODUhGTT/SxIw2RDvLUWyot
 7+P7amYi9GSUCMHx817iIHcTCYiuIpuI/rdfalZlXwtH+M9oXrrKLHL9Z3gLsT8jvXwb
 kc956RpKkUgk/F+Rk7922Tt8dG2kyHWyI1bgOttFEPbgX0RwFlP43diOTtvKZCwCRmeV
 XgjPrfEZ50yjdNn8VI2Cncmr0sU/fKqfnpgCLuxtncHvxmIHe8V1I9cFF/boLqbjBa9Y
 4h+mTVhI8nusdLVDBvyuijasjja760UvUe/FoI0dbuwWBHCuckRPI4qec/fcTPBpCa2p
 vXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709655022; x=1710259822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITPbuyvZojASfMoINkZ6zQKEHusy65TEHK8RoXJYJwY=;
 b=BdHesaSawkhNn6xoPw2GCnyLRzZ0vkWYSS8AY1Dxit+mEUdauKjkESreZ7GNIuXRlT
 uCa8rMsf0HSkNGSvhuO8CpZu9mO6+h9xqbLPmet+V4LDqsIrUM6FwxgJx7YE/TsvPUqp
 aGDQZr4s9iC6e4CBkPlXn9+2ch5RNC/PAyOt5kI1/MFST+Oud9NjM2+TM4w/o2jgPWJA
 TSzHJFu4Xo3dq5bxV2OmruLqiUdJ4yPXm0MWiBq0SVVlx29eYUugsQSV51DWHCc4A0mg
 It0//1LDguJ4yIc0WRGglz/VqYSID29DrGysAv18qyk0FAvqdIs0p36Z9B2NbTdMZ7Nv
 rqNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCjcSout6ulMhez4SSqSAZla4E0YIMiWPS/B1eyhyVNdl72NetKNhXJsyBgxNNhkddnPYZUbX6esNeKxxV9uGFFtRg
X-Gm-Message-State: AOJu0YxUJfUWrotSRz6bzdd7wL5ziqjNkc5SVCmhGNEl6OfiLAJCkwRs
 5oSf9sL38AZ5I08t5sCxu4cLM2X3F3lyzXSiIKcdxNibjHK9lmIoAQW7XX5IXLbCnA02ZS/O5Mr
 kbxnm9JiFdu5ylTj6kZ3TM5rnqq+nPIxhiJWhng==
X-Received: by 2002:a05:6402:40cc:b0:567:1458:caa with SMTP id
 z12-20020a05640240cc00b0056714580caamr6589444edb.40.1709655022475; Tue, 05
 Mar 2024 08:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20240224105417.195674-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240224105417.195674-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Mar 2024 16:10:10 +0000
Message-ID: <CAFEAcA9cW0W8pcD6-HBrF2V9t1ewvAR+bB5+khSrWT5-gcxUcQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add device STM32L4x5 GPIO
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: NLQ47eE5WJHn

On Sat, 24 Feb 2024 at 10:54, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> This patch adds a new device STM32L4x5 GPIO device and is part
> of a series implementing the STM32L4x5 with a few peripherals.

Hi -- I think this patchset is basically good to go, but it
didn't quite apply cleanly on top of the RCC v6 patchset.
If you could rebase it on current head-of-git (where the RCC
device has just landed) and send it out within the next few
days then we should be able to get it into the 9.0 release.
(Softfreeze is 12 Mar, and patches need to be in pullrequests
by then, so the patch needs to get on the list a little before
softfreeze.) Otherwise we'll be able to put it in for 9.1.

thanks
-- PMM
