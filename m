Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3965673ejb;
        Tue, 21 Mar 2023 04:56:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ZgUUtPUvc3kRT+wikO0RmmsC1jA5lTtK2yK4ZKXPvmZBSff4PN1YXOJj7u1W63oEuaDFS
X-Received: by 2002:a05:6214:1c4f:b0:5c9:a0ce:df0c with SMTP id if15-20020a0562141c4f00b005c9a0cedf0cmr3776674qvb.22.1679399807835;
        Tue, 21 Mar 2023 04:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679399807; cv=none;
        d=google.com; s=arc-20160816;
        b=SXItAj9oWzKuz7BGCfA9pojxgCyyDq8auOISmFvpCPI78R4gQMLuEbLT0YG2P1yGyY
         qn/XuOZkQCdAD9j+r26LPHH4MQCZIhaYh+6vh7AaLASP85930bacs6thVClntFh7NZzp
         nF0qHMCZn7tkK03CIiYp9cAYYLj3pKpt+Y/SLywpZfBnjitJjoN/bp5kEilrowBoH2eY
         aky+euyemKuezFfWkmvtUtc42ZZiwiEav0AtMVqkOY5HiR940BbFqnmhYdSpv+kSSMcZ
         wDY0B78sVxX52z5OSE0Zqw3nJgcLOBii5/LMNpBZiJSlWPCRfuwe2pzj+t1wagmgkDiG
         k2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VlJS+u43HNbluzwvLNlW8VPzjUtn6/93XEfoWrNaWR0=;
        b=ADRlmuzydrAYW/aRf3lmHJTLRg0XWMO5CcNe7V49DCvQVnaqExY9nZOHf0mhrYeiv4
         5PEuD2T3Xc3+3Lx3s42igDRPUKNMOJD/cneKFm+JlB5vC+mo1skaQZJ38fwluuBpXjfK
         iKDqKU66Y73HIGPSJxYEBhgrihfeFziXmVIvyusbuN27Ue82Oui22JQ0BohF+2TdJTZy
         BFAwW9s6OLu9+/gv2GrHWptyPpYBMnGNr85Qh/GDXoMJneJGTpQNNSl48susQlDM69oX
         HqqJLtozwTudWJIMB5ht/iiciVSv7gLdC4TxqXGprggA7rh4K5hTNsBGoNSSA78t4677
         hcDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6s5642L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2-20020a05622a174200b003b69723b361si7460587qtk.773.2023.03.21.04.56.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 04:56:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6s5642L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peabZ-0007Xw-Dl; Tue, 21 Mar 2023 07:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peabY-0007X2-Bn
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 07:56:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peabW-0000hG-Ig
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 07:56:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id o11so15737555ple.1
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679399797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VlJS+u43HNbluzwvLNlW8VPzjUtn6/93XEfoWrNaWR0=;
 b=M6s5642LuwELp1cEjmIVaksfC9Ke3FvoRg91tejM7Bm+rB5NHTblhAy8BzjyPJ9ymF
 HYmwii7NWHb0CQ9VqC7zyfkk+Pxzd3ksF4erpwVcoSp03jA8TvSyiWNfY1xgAXE3d/ic
 qGawUXTKRfS/FNcNH+qLSfr6qz0BlFJKdfg6NoJ1qQWOS1b+qcLKz/53fHPSXOVQ2DCf
 0+/0c8K8Knq8D/utoQ9Wvq3eEKStnumLN6FLVTNLopmgbK72hd1AllE1HJTUmozcC/i0
 EuJlF6cPLnhbkK913HMPWaU3nYn85eGv044Tf4WyrzLJmVAwMWsKsKHR//Hr9E/l3omP
 UhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679399797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VlJS+u43HNbluzwvLNlW8VPzjUtn6/93XEfoWrNaWR0=;
 b=ldQxwOblrsIKyYZ6e/vAY+xB2yor7xeTRGZxbIHi+xNENMgSkDTWaHjVoeV5nFfg7W
 B+sTQAEB7AMBMhI3caFeK1K5ZUFuMTW28m/YcsyZ0eXpNmGB2o44ofo0QT8u17eeZeOm
 c3SoIJdLKgiPI/Yw1KufZJZJ4vcMfqvKFuLjdYS/imYEIXcU8rD6MbVeQ2uz1S9WT5Zk
 U9aI7zbpbuDIlIXVLH29n3/1vXORl7xk2BnZTBrw+LiJ/XUdiZsvnuhctzITkzDvG+Cl
 r6QCj3Dl4U8lP/s8WXLsKXl+Uw3mc5jpUV1zFr+KhrawMmvVRCGqiTC501/inTyx+ZYl
 cbpQ==
X-Gm-Message-State: AO0yUKUDtp8vK7M5xQFyfrr2qgLw55SFfIGyrnv/AaMaxmQ09C5UYj+o
 /dmBAhYD3tHD8od6QMRyp1eo3Iqj3ly1ssxDtdo/2Q==
X-Received: by 2002:a17:903:452:b0:199:1a40:dccc with SMTP id
 iw18-20020a170903045200b001991a40dcccmr621618plb.9.1679399796770; Tue, 21 Mar
 2023 04:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230316105808.1414003-1-peter.maydell@linaro.org>
 <87h6ul0x4m.fsf@redhat.com>
 <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
In-Reply-To: <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 11:56:25 +0000
Message-ID: <CAFEAcA_qQ_iRQWgdLoYeQh3tjMRbqqJ+C49==aed7n7S_xZFYA@mail.gmail.com>
Subject: Re: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6VEUjkY3Uf8N

On Thu, 16 Mar 2023 at 11:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 16 Mar 2023 at 11:11, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > On Thu, Mar 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > > The markup for the Arm CPU feature documentation is incorrect,
> > > and results in the HTML not rendering correctly -- the first
> > > line of each description is rendered in boldface as if it
> > > were part of the option name.
> > >
> > > Reformat to match the styling used in cpu-models-x86.rst.inc.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
> > >  1 file changed, 30 insertions(+), 38 deletions(-)
> >
> > (...)
> >
> > > @@ -217,16 +210,15 @@ TCG VCPU Features
> > >  TCG VCPU features are CPU features that are specific to TCG.
> > >  Below is the list of TCG VCPU features and their descriptions.
> > >
> > > -  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
> > > -                           *impdef* (Implementation Defined) algorithm
> > > -                           is enabled or the *architected* QARMA algorithm
> > > -                           is enabled.  By default the impdef algorithm
> > > -                           is disabled, and QARMA is enabled.
> > > +``pauth-impdef``
> > > +  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
> > > +  Defined) algorithm is enabled or the *architected* QARMA algorithm
> > > +  is enabled.  By default the impdef algorithm is disabled, and QARMA
> > > +  is enabled.
> > >
> > > -                           The architected QARMA algorithm has good
> > > -                           cryptographic properties, but can be quite slow
> > > -                           to emulate.  The impdef algorithm used by QEMU
> > > -                           is non-cryptographic but significantly faster.
> > > +  The architected QARMA algorithm has good ryptographic properties,
> >
> > You dropped a 'c' here ----------------------^
>
> Well spotted...

There weren't any review comments other than the typo, so I'm going
to fix that and apply to target-arm.next.

thanks
-- PMM
