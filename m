Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp323784njf;
        Fri, 30 Aug 2024 09:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWvnFYssxWSEU/t6pQqaj8UYaVDxP/6hKxukM+tCDwnEQvgNTdLTF6KcymRlbopH65I2oyJK02CFmlcA==@linaro.org
X-Google-Smtp-Source: AGHT+IFiK6nSbs6fbzsjB+0aizrQ/vQFBUTS9dKf357x4ze5GmUCv5jnJYN8j4SOEC89qqVn7P2P
X-Received: by 2002:a05:6214:f69:b0:6b5:2062:dd5c with SMTP id 6a1803df08f44-6c33f33be5fmr129571846d6.8.1725035307636;
        Fri, 30 Aug 2024 09:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725035307; cv=none;
        d=google.com; s=arc-20160816;
        b=EpEocybmlisVRxfaqAa4yB6uPX2C8BFNYFnQEMDK1K79Yt5bb9c6TBylD1CdzdZbOy
         +BMFqL4XNBPbNN4NsyHiKMxAbIfKNGr6TmX62UabNQJQdIMguwYNQXu2Zh4W1AuDvBCj
         AhQAEWvyJ3dRBQMDJcsnRDPIYZVvJgK+RYWEpgwmMYSBpaVfNMYa6Bm19BtRDaxZGehv
         9pt2FOiSjzS8CLEC0rjcIVV9PtMFPEM74w4OE02Ntv2k32Wjx8F2Xc4c65GFfh1p7E4Y
         q/6h6QJc8ZnCtQRAjzpER07pf2r8ZetRQdTRyqyIlTT0N00yjhH+kBKEf+1tRVidHrXz
         2rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4blPcePziWLyzuPvJxOTQGTR3QYe2HPCb0g45Ev3gcA=;
        fh=NbE5dEnItIYdSr7i5kwRKtVqNxTQTLYir2ouSVxS8zw=;
        b=CjgCWRTk2dScEUS3wiHRoYQxrPV4aEtCaFJv1tTLF1vaQjBwQS/fs+O/zvJVY8+YFt
         2YScY5ISRBXWUqO6bcenyEoTLrStquFdyGn4nVljuEoUA4MPGq3WrlV8qhX5/hNzqdGd
         iC41llyO3W87Izjk80F3Yu0Zw5c/VP3E/eVlUj0d/ixduzsvrhQ2TxFHpQ3Qr7oI66i5
         7cfR+ULTu5Ozk3lF2CtS2zSY5RfMyFFHOu+kR3vs1Cu4E8fV2yu0gY9qDBSjGLVAuKMb
         QS+x8eVJYyqk+9+sePB2p7CBbhnxNPP6tyj/bJbOOg9bnIUj5vBVw+XujBde9aro24iF
         W/OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpbPf1eu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682c9ed83si41733061cf.202.2024.08.30.09.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 09:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpbPf1eu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sk4TR-00081O-Ou; Fri, 30 Aug 2024 12:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk4TP-0007xm-KQ
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 12:27:43 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk4TN-0005CY-Gg
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 12:27:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5befe420fc2so2260076a12.3
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725035259; x=1725640059; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4blPcePziWLyzuPvJxOTQGTR3QYe2HPCb0g45Ev3gcA=;
 b=lpbPf1euRcgcVv+FB9CDvJk847JbLEUGQPd1Fj+PdLyIMoEFx9Cl1PH6iaxq4gtkwh
 M0hqCzrrWoShtVOZTSoWKxD+k+ee3ncGxSXIUDpJLyBE8iIOmURTBOQMcDS4DR03CWac
 MtK274ULzelTePu/kRUbhWNz0TwEgFFv81sAC5yLtSmzzmfVe3FJ3vpvil4pWfxPHOr9
 3Y5pi4S2FwJMBx0iSukFJliJHfh2sWSHI/QSNEZLQs0COWWOnkxvRBiY9wZzhR7lOg/f
 Q4vJQAXco1A2QaSq1I/M8TIn5beVTu+SiYFqlGeQhX3GCr864HwLXSnK1SDi9+JYVfEZ
 N2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725035259; x=1725640059;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4blPcePziWLyzuPvJxOTQGTR3QYe2HPCb0g45Ev3gcA=;
 b=fBwQvZPD4OsCGyOCgMppNeEQx7y5Gz86f978cr3cRjPrpUtQDNGqREiVNjAWNOKGbn
 G9ix3I9Bh6TZDjwqBJHJiQEeyyGXV7oN/A7ztk+x44a/hDBZXakDtAUC2r2pqfhyT5IZ
 kIfWDYJJJu82knSDdy6ZfAcMfAo3NG0eUgDhge11Ectlj+oWYcTfqrKF8/pKe5534Liq
 Tg8M+re4b0aYaY/elzKIn0SrzNh+fD+96vmB9esz7tbzQSOgej/8lJ+7s20+bkxIhVxU
 GY5Yn7P1twSYKjPe9a0vmqOieIXzZ48Yue9uGW4o1YwS9CN8yMDNgdHrlqIYrCG/dPbP
 JvBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxmRYiNSbn9/UycSWmtpHvKllBhuvkS9ameX5pvoHzn/LFw5lOsttIi0MRetWMx1IpAZ7E2RWIZw==@nongnu.org
X-Gm-Message-State: AOJu0Yy7N2rKRfG6468Z55D6ydhhKkypwwz0c1eHiCf2snhW1bZ7RN8g
 R2iHozAIwGQXMwlvpkCSTXVmuO80mzDytRxTC8HVI7wb480bjGlSgghFyyzRUpqFBJP44bh9fMH
 GfQQ43dNhLvmf6mRf1oe+9kmDxR0B/KZPFPLUsw==
X-Received: by 2002:a05:6402:2696:b0:5c2:18fd:8a22 with SMTP id
 4fb4d7f45d1cf-5c21ed31392mr5566950a12.7.1725035258972; Fri, 30 Aug 2024
 09:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
 <b88fe895e6f71711387ca153f4f1b3fbb0aa2176.1724556967.git.mchehab+huawei@kernel.org>
 <CAFEAcA-OaQ1ypa7LXz5nOs+6+fjmYNHzNL0VVgapoXEHU=rHnQ@mail.gmail.com>
 <20240826035324.6b1edcc7@sal.lan>
In-Reply-To: <20240826035324.6b1edcc7@sal.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Aug 2024 17:27:27 +0100
Message-ID: <CAFEAcA-wD6U+onh3y4Y-LDTFuYoeWbGShkRPx7emi1ZPfKJP0w@mail.gmail.com>
Subject: Re: [PATCH v9 11/12] target/arm: add an experimental mpidr arm cpu
 property object
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: BbC/lOZ5CYor

On Mon, 26 Aug 2024 at 04:12, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Sun, 25 Aug 2024 12:34:14 +0100
> Peter Maydell <peter.maydell@linaro.org> escreveu:
>
> > On Sun, 25 Aug 2024 at 04:46, Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Accurately injecting an ARM Processor error ACPI/APEI GHES
> > > error record requires the value of the ARM Multiprocessor
> > > Affinity Register (mpidr).
> > >
> > > While ARM implements it, this is currently not visible.
> > >
> > > Add a field at CPU storing it, and place it at arm_cpu_properties
> > > as experimental, thus allowing it to be queried via QMP using
> > > qom-get function.
> >
> > >  static Property arm_cpu_properties[] = {
> > >      DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
> > > +    DEFINE_PROP_UINT64("x-mpidr", ARMCPU, mpidr, 0),
> > >      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> > >                          mp_affinity, ARM64_AFFINITY_INVALID),
> > >      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
> >
> > Why do we need this?
>
> The ACPI HEST tables, in particular when using GHESv2 provide
> several kinds of errors. Among them, we have ARM Processor Error,
> as defined at UEFI 2.10 spec (and earlier versions), the Common
> Platform Error Record (CPER) is defined as:
>
>    https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html?highlight=ghes#arm-processor-error-section
>
> There are two fields that are part of the CPER record. One of them is
> mandatory (MIDR); the other one is optional, but needed to decode another
> field.
>
> So, basically those errors need them.

OK, but why do scripts outside of QEMU need the information,
as opposed to telling QEMU "hey, generate an error" and
QEMU knowing the format to use? Do we have any other
QMP APIs where something external provides raw ACPI
data like this?

-- PMM
