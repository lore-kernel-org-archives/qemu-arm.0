Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp390328lfk;
        Mon, 8 Nov 2021 06:51:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7AO4NGnaylgIhdb3TXiszqZiZ5Z67GLLH/eusyKF8dKuVFGJIs39lBGlhgIWIxHo7WwpG
X-Received: by 2002:a67:fa93:: with SMTP id f19mr531076vsq.43.1636383073204;
        Mon, 08 Nov 2021 06:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636383073; cv=none;
        d=google.com; s=arc-20160816;
        b=y1J6A+5TzdU5J92l6emcWSFjc/u6S9KuHzepOhELVolw3ltQzthSma6XR8AHN6ep9A
         2j8ZJ5eEdFicYiWYxkp1jCy5qZWFP2iWwCa7+nmkVMmrFYXM2t9EAoqCKDG5N3Uii+02
         YOXYMkQ5x8Mi2NW/sO75ZEQeQMXxEQFWX4+otqEC8inQThfYl+1M4b8OuHptsoqzVoQV
         i5dy0F/VTaOt0I8g5++ti01QMoYcTsC1bA0yltsZdizJH8iBIcjQYaPHxVZXAukmf8N7
         qS1I33rmbUzcIGlSEZX1O5S+g1g5zdJ9z5bnrjyWAdXBhEAm13X1w+UMUzph28/LW1OU
         0yAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VRzp0FWK8MYVZPdHdcEq6rLwLfL7m6N+xRuLlCo5WmA=;
        b=TQHxWU6I0fN9fMV/Qls8+Ys5tKj3WtNejNQQvJ6PJKcc5gxPLB8ypx1LT7Py5oMVEf
         9F4767AT31xwQqyIvYQGLwP3cGPJbjUgickrE9+32Gdpp+IZT9kMd1C1IFkCtS/16ZlY
         iWqJ36fz5Er1b+cEsWdi0cVwKGkn36mWlKXRh/cYktmyFNlaCnrldmyMdUeiAm6sogpb
         9146Zz8N6hLN+hBpkonOeOPUBsRQCI6X2nmeiNlB77b7Fk3qraVaX+haFQ2Q+XoAfaMN
         DG/Zw+b938tPyIa95UYRzKZB/hz29kzcuquf1s9aIfQaKYcUPEmxxtnIJop59qd5NS5l
         31qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ex3QiOh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si14641210uar.51.2021.11.08.06.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Nov 2021 06:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ex3QiOh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mk5zM-0004Z3-IS
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 09:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5yd-0004Yg-NT
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 09:50:28 -0500
Received: from [2a00:1450:4864:20::430] (port=39455
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5yb-0005c0-NV
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 09:50:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id d27so27353027wrb.6
 for <qemu-arm@nongnu.org>; Mon, 08 Nov 2021 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VRzp0FWK8MYVZPdHdcEq6rLwLfL7m6N+xRuLlCo5WmA=;
 b=ex3QiOh/4Hu71GdjoT9pJdao9Mje6JBDgCmjbmVVqrcBHzl37/fl2pkesOFN5yUtHM
 lLOMs5ZczoQ2zeClt35NqfGJRVaQhKTmRfYzZsXWbLqy2yq634Uq+N1G36p58u5+napr
 4oxPAcANfQQqkHUcnwgNS/IOIbpdGX5yBDaJH/eJWHumK3SV2ahUGaDuYEpKJ4IK7iAh
 FVAg80svdKptqw1pXGB6OQMRmpQ7pmQ0YCRhWvXEDFutE2i5dx1FKG/G/d2fr1DwNQeK
 6TfQC0bygdrFyJSgbgML12s8upnjvMY+y5jbL+s3PxzaKcfYbFDKmaFp9pviDHWLdf4S
 Tp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VRzp0FWK8MYVZPdHdcEq6rLwLfL7m6N+xRuLlCo5WmA=;
 b=cEgSuT6QH2lxJrjsyGymnSp5MeF6/zvkRzoakEVQQVMDAld2GTwJkEdjNGfewfQW2s
 1r+rpeSUqRqNjugnGj5KnXMO6vNYUMrOA5pwlkg57p7ADHX3yDqqL4+/dd9ozqte11T1
 JtVPQr44T7akghLH4zRCditivuLcuR52bC7j3RERXXwQPjH1tIA0xNwAYCOugdEYbmnD
 zsOMT9BcMmxx2jb1wJwDJOdxE1ckT7pExPhB1FR71hLjLmGvpzYiMCrMAHHJWc/iahrq
 1Oz6abpiXUXVYvL2MKz5SkSsRxLjbstO2vNEYBRxwSS1vhfD+YmCE2yEZeBR8aYJeGmA
 /koQ==
X-Gm-Message-State: AOAM530l1s95y0cQpPgkBsFQrNgV9yPsIpOTl+cVzfYyHlMZmXmXJheP
 oeQr4mpS99Rc+rSE4BJJLAe5pTVeaWG8RuXOHOOsTw==
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr347046wri.376.1636383024139; 
 Mon, 08 Nov 2021 06:50:24 -0800 (PST)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
In-Reply-To: <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Nov 2021 14:50:12 +0000
Message-ID: <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1b7wD1EaRQEo

On Sat, 6 Nov 2021 at 18:11, Jean-Christophe DUBOIS <jcd@tribudubois.net> w=
rote:
>
> One small question/remark:
>
> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) =
document (chapter 5) PSCI calls can only be issued by "normal world" (EL1 o=
r EL2). Therefore, should we be adding a test for the current secure state =
in the arm_is_psci_call() function? This would prevent calling the built-in=
 Qemu PSCI function if SMC is issued  from secure state.

This shouldn't matter, because if the machine model is configured
to execute guest code in EL3 at all then it should not be enabling
QEMU's internal PSCI support. The internal PSCI stuff is only
there as a kind of "emulated firmware" for when we're running
guest code that starts at EL2 (notably, when directly booting
a Linux kernel).

The problem seems to be that fsl_imx6ul_realize() and
fsl_imx7_realize() unconditionally enable PSCI-via-SMC.
The imx7 code also puts all the secondaries into
PSCI-powered-off mode -- this should be checked to
work out what the right thing is if we're not doing
emulated PSCI and instead starting the guest at EL3.

-- PMM
