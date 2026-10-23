Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CE606A31B
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kjrC5mcz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKEX0-0002xm-SP; Fri, 23 Oct 2026 08:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEWt-0002vs-S9
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:37:52 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEWo-0005Md-Li
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:37:51 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0cf2c0785so7724417b3.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792759065; cv=none;
 d=google.com; s=arc-20260327;
 b=ODfhj8MeA/3jjSPrmghBy999QzOSGgLQ3SzIIEY3Vsx6RqDMNl63W3aR/ccDCa8ueg
 7mn3zPRH42aWS7/NfHaxoSUHT+rHhflALnzzgkBix7RPIvJ/qtbptTDvlfarkuu/GH3q
 BXaXl8UapU6wpK5zQ1pcFDRzBClj6+lVZzqCvpc8yMZi5MqrktowXgEAwG84DiU78yq0
 E3N7TLk+qSJrkwNVsBaGHgTXdH1PF1KJaHcSgqDtvdoGlw6ezcIJrwLMC961H9IU/QTP
 5CMhAz+iRXdREtSz5MfFAqXatQYPQ8LcP3Zm2/SJGCV/kbZIrQfLkY+CTXOqOhFLZN0c
 oKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SUkoX/3bwjFpT0dyc8UcMdZ4lcBpeSlTtzlkyvLE7Jo=;
 fh=Zyyf0vaV+lMBGM69pSv2+cZ2MSE3p8EV8+BJ1iLvY68=;
 b=pW7JvwFKZ/LxfkX3MSJKSW7coyhGKIggWf7DKtd9nJ2lCT2SLXWYY46tTqgp5+8pVn
 76h+hEcoUPWFltH72sdauxN+LIB5ADaAQIebT5ICL/pGycchHm1wp9BlmkobDt7ZYlZy
 VqKRXajojFE3awNYwPt10zNZMa5weG+rP7l0+Vgdeb8zj0GEYeTZEKXCRcvU5NDyqx2L
 0P7tIg6ExsamoLDEJjKQEG+eAdNqr63vyMIUs7gQLaF+wbsl2S54+jLW45RXmx3WsDE3
 SPtEsZ4/+t/pBSoEAUFMO12GgkL6BTZM3fFIq13fXLi91UXMbu8kRtcqn6+rPMJNm9mR
 DiRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792759065; x=1793363865; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SUkoX/3bwjFpT0dyc8UcMdZ4lcBpeSlTtzlkyvLE7Jo=;
 b=kjrC5mcznD4cgPeLNUleNu6WmGjYem+n1jP7zl14rp4cZY/ypEilfmTsLSoE2iMPx7
 OgZM7KrjH6ywZB6XEXfVOb1RvRId2vw75QPwO47fcFtIUBnIyfY98XBmmQ/g3ZyheM/4
 X6t0HSWlgkkc7cZ501G7k9MuNlW7eV5+VjpyL3PNSsF/ZIUF6gEw2pt8KQr+NO5cIUSz
 ZhHwOWi+7oDSjPDNJehQOtspoVZICBd7I5qF/2LIReUv2S0yG4SwrrNYMqR/P63KL7P/
 kGLik57Ta+Tw3IwbNs/QKYbCKIpoCAXFSRe8aI0VKJjptYhPd9dTKUHkqbM0zEki2UxV
 CGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792759065; x=1793363865;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SUkoX/3bwjFpT0dyc8UcMdZ4lcBpeSlTtzlkyvLE7Jo=;
 b=CJthKepWeoHj/guNjVNZLIs2/Do9KRnNpWX3OnZ4Q3spCGj9d76Z1H2b4yVNA9R8BG
 FqQEN0SLky9cemK0KAy0j4BCnoMFo43T0mCiL6b5f8MHusY3gLdylO0LtoitzC7qzD1j
 EQnaAFNVPZw9EMX/qllspDMzVLfRcvrTnnI61mB6jYLlEwftaSCZCRomlrEF4iPFktJw
 E3K382C3Qj1k7Cafcnz2X1oSh/GLeeK/qXPkAC6LMWM/TNRiggqc/s6UjvGSaWYDc3+t
 q7DibUwKFidWUXh0zVkFbfzQUctjs0PKSjEUim6mELIT1Hly+7f9KZgCUA6ToytakniI
 MYhg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpRL5ncHapHLTd7icsg/mkUznS+7Mwlhk1wOos7o9qothI+cYMnXx4+j8B0thH8ZaHlbrJYfIMpA==@nongnu.org
X-Gm-Message-State: AFq9FYLrN9OZg+J/ddvLcj4/XC6uskE8/riCxweadSXIIOtJdN5sJimT
 eCVFW53E9m6HUJAD+Sc5zxbRfTK/tAna6QgMJsl/+2JFXDnBHKPX3fcVeGihuAtqLsD2Wy6aI7B
 34+AebHgkXtfSdkt4EB7mzC/dtS0GARppgzt981HZDQ==
X-Gm-Gg: AYBFou0gy5R2m4q+DsUhqVdwPs35CDg/j7Hs6rkZlyY4PvFvgsY9BxDXNRSAcUFTcTV
 v/qLVyqJSI6z0USVJ8RQvjNcL6x11v4C5QANx2L+8oCgL63pNwYJlC46HSrAluIC8rOLig+cOsb
 K58qFHBSxF9WbEApZ0/vKPDxo2skGIiQ8xTr1PSQjNAcIuHblLl1r/YW5I2FAdvcqC4X38BP+O6
 3pbYMKw53MM/4aux0ff1lkt9QC/xh90T/RF15jU93Qgo7eLDstBRbhygHTbaErlZ6Qw/bdtjjD2
 1NGVEObo+4bCpc9hz+OaP72Hsf+j8Quzgr7Kg6/McIVBb3xBzrvJsYPisILy97jr0rvddJoGvDh
 O+6YwoSxfpa0urxvvmNrrSyxDGaw3Vf2yaQruvc6uKY89bZ/V7JZ56F8GW6wPlk9vZ2/mnNdQRk
 KzYzRFGaTpEhYtROzYf/Iwbg==
X-Received: by 2002:a05:690c:550c:10b0:8b1:3606:65f6 with SMTP id
 00721157ae682-8b157d96b4cmr11350167b3.64.1792759064577; Fri, 23 Oct 2026
 05:37:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792728982.git.deepagupta@nvidia.com>
 <529fc7538b61d0d2ea9a984087ff1d616dd65624.1792728982.git.deepagupta@nvidia.com>
In-Reply-To: <529fc7538b61d0d2ea9a984087ff1d616dd65624.1792728982.git.deepagupta@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 13:37:32 +0100
X-Gm-Features: AclHuK9ojQv69OAZTrmG7kBHeUcigZauSSNPGVhBPnbTfN_tKVHRQ_dcXo19pmw
Message-ID: <CAFEAcA8tV-Qc_GHxyCwaU-c0h5n5hcTCU07k0bvGiT8ePFu4FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/arm/kvm: handle KVM_EXIT_ARM_SEA and report
 BUS_MCEERR_AO
To: Deepak Gupta <deepagupta@nvidia.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev, pbonzini@redhat.com, mchehab+huawei@kernel.org, 
 jiaqiyan@google.com, oliver.upton@linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 06:22, Deepak Gupta <deepagupta@nvidia.com> wrote:
>
> Linux 6.19 added KVM_CAP_ARM_SEA_TO_USER: a guest synchronous external
> abort (SEA) that the host cannot attribute to a firmware-first (APEI)
> error record is returned to userspace as KVM_EXIT_ARM_SEA instead of
> being injected as a virtual SError. Linux guests treat that SError as
> fatal, so on a host whose HEST has no SEA-notified GHES source every
> guest-consumed memory error currently panics the guest.

So we already have a mechanism for the kernel to tell us about
memory errors -- the BUS_MCEERR_AR SIGBUS code path. Why do
we need to have a second mechanism that needs more code in QEMU
to wire up to have the same effect? Can't the kernel tell us
about memory errors in just one way?

-- PMM

