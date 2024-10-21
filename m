Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2556879njb;
        Mon, 21 Oct 2024 11:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUeazBpncBO3lBeKhASEUCMZmht2xhyxtVXVPSow3GczrxcEoOiHrCkJXRD42oGnuxbPUaEBisOsZ5oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEGWEjtTdLYIRz5mcP5UWIyBixGm3eOO2nXcxfENb49Sp2QNwpHKhvhkvNymhp02E4Lr9LA
X-Received: by 2002:a05:622a:1a24:b0:460:9e6b:1f9d with SMTP id d75a77b69052e-460fe6acc00mr8594691cf.21.1729534780758;
        Mon, 21 Oct 2024 11:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729534780; cv=none;
        d=google.com; s=arc-20240605;
        b=ZprMtKPmWplkRxUTaww4jh+j9tvoJyc4Idi9B7csNQmxLPh0KThCLKwmjDNrKP9uWC
         Kx2kBUx27FV9fCOtsJa5q67LMU/KPmHT4YD0kKY5sBKgt3NKwpZIwRlYaf+s0hg2b3uY
         FrlF5z4rATxl0tRgFnTDtrZOc1IfY+/rLpSnVZL6M5ECRoZMX0NtzKkadFviwE41gyF9
         CEJclB9j4FSEgK02oE6yG+8yJn1SXnw7Yob2fflHjDg5KtDoHtZHBG0z2zLJ6cnrKGzj
         veIry2JjIkI3eIZGEfjNCc32yfNKnhmre5yg1mcBdkJhEczruHjCRC7nQSXqHuYoQ0i8
         Y8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to:cc:to
         :subject:tls-required:message-id:from:content-transfer-encoding:date
         :mime-version;
        bh=cwBeKYA8as70EmYN/TWUlTSMmI7EkCVH37nqguoXX1U=;
        fh=D8Ij7JB5Z1BOC0xcyioJLHgwFAQypRxLnb5D41vJs9o=;
        b=Ugbrl/xmy/UpUpPif6GJbDdXFARiG33NN5NLkFe2HxZIDL7eA49rJ9+BcddxF9gQs3
         TKbdYbrV81n5hoDMy2d4u5nvUOMjrzyYSY0o3xk7Tu7IvQcHiCuiF/f8QEjRsA2NfnRb
         bJk6XhhJLF+T9ggAxOHHlIux+EX3lzr6p7tT/60EFH03fzAE0fy/X3BCsRlOjp689+l6
         Kw9FmTeCPbe6zvXivS06ceLI/llkUDsNDvJLIGnUU/X+1KYhvHKhdZFUELh+2ncAsE34
         6rF2DjqFYtXcqqhRnBJpfgWdys5Q+VUlsOqDuG7L2Fp6aQur6+K/TdLELlCXhGyoacc7
         V/wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3cea44esi48526811cf.361.2024.10.21.11.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 11:19:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2x06-0007QI-6f; Mon, 21 Oct 2024 14:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nenut@skiff.uberspace.de>)
 id 1t2vDa-0001gZ-6j
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 12:25:18 -0400
Received: from mailgate02.uberspace.is ([2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nenut@skiff.uberspace.de>)
 id 1t2vDY-0004ZZ-GP
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 12:25:17 -0400
Received: from skiff.uberspace.de (skiff.uberspace.de [185.26.156.131])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id E7AB6180464
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 18:25:05 +0200 (CEST)
Received: (qmail 10259 invoked by uid 990); 21 Oct 2024 16:25:05 -0000
Authentication-Results: skiff.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by skiff.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 21 Oct 2024 18:25:05 +0200
MIME-Version: 1.0
Date: Mon, 21 Oct 2024 16:25:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Julian Ganz" <nenut@skiff.uberspace.de>
Message-ID: <871fdb20adbc4fc3a9709291e489ba1cd1ffda7d@skiff.uberspace.de>
TLS-Required: No
Subject: Re: [RFC PATCH v2 4/7] target/arm: call plugin trap callbacks
To: "Peter Maydell" <peter.maydell@linaro.org>, "Julian Ganz"
 <neither@nut.email>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
In-Reply-To: <CAFEAcA8iiYG2kw=tpMiLUsN+ZB-f6aN5eb-aAOhhc7nZyjA0+A@mail.gmail.com>
References: <20231021122502.26746-1-neither@nut.email>
 <cover.1729355735.git.neither@nut.email>
 <be4c64f56a4a7f25a2769c0eccd2ed6e1d8cb9ee.1729355735.git.neither@nut.email>
 <CAFEAcA8iiYG2kw=tpMiLUsN+ZB-f6aN5eb-aAOhhc7nZyjA0+A@mail.gmail.com>
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1)
X-Rspamd-Score: -0.1
Received-SPF: pass client-ip=2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4;
 envelope-from=nenut@skiff.uberspace.de; helo=mailgate02.uberspace.is
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Oct 2024 14:19:29 -0400
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
X-TUID: YryheRD/YJfQ

Thanks for the quick reply!

October 21, 2024 at 2:58 PM, Peter Maydell wrote:
> This omits M-profile Arm CPUs (whose interrupt/exception
> handling is rather more complicated, and lives in
> m_helper.c.)

Yes, I forgot about the M-profile. I'll include those changes wiith the
next patch-series.

> >  @@ -11819,6 +11838,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
> >  if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
> >  arm_handle_psci_call(cpu);
> >  qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> >  + arm_do_plugin_vcpu_interrupt_cb(cs);
> >=20
>=20This isn't really an interrupt or exception -- it's
> more like the semihosting, where the guest does an HVC
> or SMC instruction and QEMU handles it by emulating it
> as if it were firmware. Maybe it would be better to
> name the "semihosting" plugin callbacks something more
> generic and include this kind of case in them ?

Oh, good to know. The only term for something like this (which also
includes semihosting) that comes to mind would be "host call". But that
may be confusing when talking about emulated vs simulated hypervisors?

Regards,
Julian
