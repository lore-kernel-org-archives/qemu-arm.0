Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42071E7BDBC
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 13:32:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vryi2-0001iF-Pq; Mon, 16 Feb 2026 08:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vryi0-0001hl-Va
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 08:32:17 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vryhx-0000kP-BN
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 08:32:16 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-649df3c22d4so2610700d50.3
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 05:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771248732; cv=none;
 d=google.com; s=arc-20240605;
 b=BqSvQxyKZ0RQWP9bjr2hKWuy5wLTr05eM7Ro0H/G8WVy86fpWbRt2r6LWt9dVCjy1R
 kESmFR/K5M3INEWNrtNlWtW0bSTVOiNFaWltzFI+/DIhcsrONNnbsywuAp6ehvCLEvOU
 cc0IWjRUByfb1wACcV65SyUKXZtUQMeoLIg2DfobMeIc0TrDPmI2PPBOaQZ9UlFA4NBM
 VE4yy08aXb2CVEz6ZENhabUN2dffD/+PATFTPLBhbqH4cvYJYbGMwCFWu12ZHlEKvinx
 GjHTQMe7WPBXtmiuWevdhdWDmhVuYWYgmDQggNJItEfV7cDT0OI+3Qwn5/Tle3NUKHMN
 nirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LmGbuBMM9mMPZgC9VCrTZN3o5Iw2RZSVYw2EZg7byTw=;
 fh=mWKuvcATMnr63cUHChihCpSzCZGv/8+62kbehLyRkRk=;
 b=HdaGGJpoQn8sYmMdK+dpBxCQJHq1Ve16ZQCUHZn8n0EKtmvjvMEyE/9dPqh43a9eyR
 UGiUkdCqdEX3qlVm2I+T2sfYweFjQhmRnoSTW90ZBkE5AGc6e+gg+ixsSAXsMQRkyLdK
 39Qs1qjKVmkwMEGpK4lJ1X17GWC0H3nHhmKWjrKBuDDewZd9OOPQgVTZIrE8RZJvVgsI
 roFZGT+gPseNsXHkCOrvpDkDbvP3/ss88ieG35m/ZXVv0e20yKDpi8skm5K1305by2uG
 M/e7AzRReu3VImxrl128Z80MPltClrKFPxDFFHKoz8K91rRiPh1bPMUhuCty1S8EyYfT
 dgNA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771248732; x=1771853532; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LmGbuBMM9mMPZgC9VCrTZN3o5Iw2RZSVYw2EZg7byTw=;
 b=Rb8e/mX9ug4DnfURwsTG3FQijpLRGvDDbHif+dBN7CyhciZHHwimKP2QmguyVj/pQY
 DKfUmd8hfEN30cAzgRIXllnBEGnbIZLgc5MWpLortOww8Gf8UAXkrN2D2SYCSa50x9sZ
 9XlAhJN09QuIUWLRgV8klxRIR9J55lO1CVT+lLf0UcMdgU3eAorvFxHz6NopuPD1vQls
 Iq+oEscScvA+f2lsGB5GA26X4Nxxt5a+H5cdQ1HO2D+ttjbpMFJRgLHGqiKjHePFYi2X
 7RYEvHd7bY3A7XLsy7U+Hveto+QAfEvETLkFNxzcnpUO0Qo+8GJRakFRjZA/sVOiYhRj
 kQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771248732; x=1771853532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmGbuBMM9mMPZgC9VCrTZN3o5Iw2RZSVYw2EZg7byTw=;
 b=Lu8TwqqQC5/X1e6evNWBPR+1MDWXqHFw6xSyuBqadJ4299hT4aB3oTerEkWoLmCLKX
 jFkeCQJUs0FRhK4PQxX9O6KTq4pKkPfiMM2x7a9MZiR8+IVLCdGH7GKQ+KQOeB/F/8x5
 pp4BYlplag+icPISAv269+yMbE+NMc2sISkVVtmnPdnOlDEKOqGDN6VFjyoydQJVhewg
 LhkLnZMdmjFi2fv+4rMIT2KlPFf9IwanjQoG/FEJN9o5OI1VOysup4FVOEOjpS1b0J7f
 KwoHqieGBptc5OkNsOU2bQsXqR6yUBuYGGTpuWhh4PF5kec2f2iUdWuAxRANcvVyz9Lh
 +qog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI6cdgbzL5dn9X4+y0T3Ndh7cio6dyGDLDt/C0TiLCayKIkWn5qU7CUz88TtJpGxi1hvjYKUAvog==@nongnu.org
X-Gm-Message-State: AOJu0YzKpxIbiaxpE2q88YifsTEY6mXzEQR7Qk1IQNTmqPe5AODiHX/Q
 dOJYddB+oYlXzwbRzr46om8RMvQxzeRdF47tPJ/HBIEwcrWSr+udJtaofxmXzY8316P9myhwfxJ
 BgxPrgMd5stmfTVIKhL42NgeCyda83gQGSBnmvz8usA==
X-Gm-Gg: AZuq6aJeyuTl8oZrLoiYsHjkOMatbefhCFcyLgEHtxfAY+TSm/UHeVAZsj03/cUL5bB
 P+T3DCo0/LLdJxWBpzNvDZQkojJPLTxqLR3REsKib35wjaJP4/4LhvajC1bwwab3RuEUJRjDx/N
 E5txT8PZClzl7lmn/Sl+f9uAoNAPtD7/4oXVFQl7LZntOsBOfVBw4CRLxw2QSterqo7HM1iUFAj
 uIPgU2xyYnccKO91YCUR/57+dwHTtw3Nq6zgUXwUnjLcq1TGG9Tbdg7gSjwo6qrwApBV4J6ojtm
 At7Mp8MsVGWJDBhAAa037SzA38lbbCNasVQNJNheHl3m7ijUSMYx7yFqy9of8BcIzQU=
X-Received: by 2002:a05:690e:118e:b0:649:6a9b:9902 with SMTP id
 956f58d0204a3-64c21b5b3c2mr5216445d50.65.1771248731837; Mon, 16 Feb 2026
 05:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20260211153032.19327-1-sebott@redhat.com>
In-Reply-To: <20260211153032.19327-1-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 13:31:59 +0000
X-Gm-Features: AZwV_Qik7Hb9tvNVxNdB7PyGF3aH47GzKSPZsyoH50sfvOzAKc1pDMKbuGM6PI0
Message-ID: <CAFEAcA--EaA9sGFXRdit0uV-H18u2zpuCAXa-ZczEN66TTWoFg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] arm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 11 Feb 2026 at 15:30, Sebastian Ott <sebott@redhat.com> wrote:
>
> This series adds a vcpu knob to request a specific PSCI version
> from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.
>
> The use case for this is to support migration between host kernels
> that differ in their default (a.k.a. most recent) PSCI version.
>
> Note: in order to support PSCI v0.1 we need to drop vcpu
> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
> Alternatively we could limit support to versions >=0.2 .

Patch 1 already upstream; for patch 2 the review discussion
has been on the thread for the v4 version of patch.

thanks
-- PMM

