Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB1C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 09:40:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woeIQ-0001l1-IU; Tue, 28 Jul 2026 05:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woeIO-0001jb-NK
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:40:20 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woeIM-0007IA-VE
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:40:20 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-81eaf3709b4so41576897b3.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 02:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785231617; cv=none;
 d=google.com; s=arc-20260327;
 b=O9Tbv6JcANC59cVSUzn/eYxL38y2GSIbtejy0EFGnzxsRek4+IKh3MUJwdtOIfWKUb
 ACXh7rcUXoNml9UrIBlPACZLL3xzaZFP68LAvlsJPBN7A9SxdYhfzi8rEMF/LGCUIhHe
 n4PxC0L35p82GkkO34wTI/nbiz+aoBDMDebHSRWWOzhs+PLv9KGAahqdQPCXCFFtR9CH
 SivsYBlWNgLPPGlP1m1Y69mHzJbSbS5WNw0nTaOk504PQMaD/DXEwYPnBiKNPtNLBlYE
 0scfNNSNKBhqi3DkuyBFcoRGlCBKp2mBB4BBiLmL0MiUEfFpJfDS4m02KhZyPdC+Dwdg
 3uBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NaRacMAIbT0zf+9+8JPgWZVOEMFjv7cQZrTI6Ni4rVA=;
 fh=HLBq1GFkXsEbk2LDet7ZKO7sQiIlqOglJJcz089i/Ik=;
 b=FyMcJQ0efbtN8atYC08iZHQ3Etbit+D2/QIAaZCaIA2eJydqVBL8TVQhTjzySLCUv2
 vCqyYGDAFFF8sdjNXcOWfJrqvGMjiYOsxpeEit0++UYhYF5rdfwfrXuoSvKTf0FMA/1D
 i+uD9y/q0xGa5p05WAw/9/a43I58ngWs5qnWsNYHCWoQpoG+llcPEx1ibgzP1GZsZJ58
 jmfiyWwkOtE5ZAQai1313GVWBMIJvKVpIr8UmTDX1uSuYVzEuMjF/WF8NHJkRzvKFk1D
 RdLNsek58AhVGDhjIsObR8slfkl7Ygcc4r91KkiccgKBEhfI+6gErOFGA7PmXFTO0Mty
 1tRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785231617; x=1785836417; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NaRacMAIbT0zf+9+8JPgWZVOEMFjv7cQZrTI6Ni4rVA=;
 b=b/hWZwRxKSfzWK7xn1Cfae0bCVgAhzvwpk0Vh5itGLhxv3+vRtmhVqZY3qUGheCU+E
 yoQDq4PLzwEzi3H9xGihh76SOY3gDyUO3zChtpdeW2gVqfLLPictsN+rkga5KDlr+CHm
 iyIPWLNvZg/8bUfyzXCvseXl6rdejShtTBoq0caCU9EOqgdKIgLd7YW2lI8niXJBr7nW
 2Uku3bqGP+yq2qrEMCx0srpEt2ClwMYTTcExDg4PHRxzaePLNccOmwGbdMhbmUr7/3cr
 DrPXCN8zmQiam8tSLFhijUqeQj2UInfHLGyzzcgQgWLG2xEpBA2eFl8L1/FySkBGR6mm
 mVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785231617; x=1785836417;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NaRacMAIbT0zf+9+8JPgWZVOEMFjv7cQZrTI6Ni4rVA=;
 b=UxPjnxiwygF6JGSWHUnQpp/hXusfqePOp2n7dnaazsi/5sr7PDxIFSXNx0zaFrVZfk
 9mnUgPMS/Q3GojMKXabuMC0ISSJBayHoT+7i40UIJHJy/8a7rCEvYJROZ1h5uXEINzhw
 6Na7BPBm3AU2aoBAVN+sLY8Rm4NC6IcaNTF7xFAiMgWvn0cn7hKugOB3sWE9S9pTtrFn
 7WXlL3hlwPgRZiCjQYy66GEWbEJxAVb1BnZelp6z8H1kvIcpU7u4RxWJJmgrEMt9iDlr
 GsEOAW9D81e/+HiLGnL13umoPpzBM8kcP3EtDy7KnUBhVbkdck+sdZmPjKSQQZR6d+UB
 cdhQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro68n2qGEH3bPhkjjltDX5Ujs05lU9EIPTNdWITuycdsFemwUdj0y81Ii8GXRyH2Q8in7rgwvDYBg==@nongnu.org
X-Gm-Message-State: AOJu0YyHJ4WgvST3JiQR44MTIDPHMJRoGsmS44c4pQV0FJcH0BMpQmx3
 kftgWIcPUAUcSxjJ/aQFxhbRyKv6tpMVEeKe1ES84hN78fIFxCQLeci9tXk5hTPDo7C+dFfHr2D
 cxNxl2acfHZW3dAPZKDBuPR9mgv6b123SXMMtnOhh+Q==
X-Gm-Gg: AR+sD1115pDMkBizPR5wLGWOjY60sr7Aow4I9/0IhvQgSMGEd4FRXUqfFgBIXNzwwid
 JlTxFDs307QBFnhVVnjkWL6o1L5imF+0MsrHW4v0rSfKDn18XRxVrLnLEuUNXZavi3KiaKO58Qt
 5agj40S82mT+3PSp1+4uQaUqu80YIPCIac+wT/MlFCpmZKhMOA07UFTNYHGJF3QaQgEOZ+w0gGM
 tBo7axcsncqgJqV0zDO3tWciEkxFTGcovUE4Bcyrhqv50XglTfCg+s7r9jyMO7M/Q3YPFUlRw0B
 euSlonRrwrgV1ArIWExupDqgor0qlv9Y8oNsvYWCLmyQIhmZORr//btJ
X-Received: by 2002:a05:690c:250a:b0:81e:d656:9909 with SMTP id
 00721157ae682-81f991faa6amr8140497b3.1.1785231617336; Tue, 28 Jul 2026
 02:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-pmu-v7-1-939518c349be@rsg.ci.i.u-tokyo.ac.jp>
 <CAFEAcA-=u3ZgiAXRNWM1VCMv7FYG2YP=oirf40yGo--p0BSfbg@mail.gmail.com>
 <39e270ed-1667-4bbf-8732-913e8b1f87e8@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <39e270ed-1667-4bbf-8732-913e8b1f87e8@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 10:40:06 +0100
X-Gm-Features: AUfX_mySqC9ltK0KFuDMKEMZTn6u-bGp6fw-nzmfG1sVgTzOupa-Mk8nMlvhu-s
Message-ID: <CAFEAcA-_mSr0e8yePxoxW2wS7xAHtTzd8S5MfLWwr_BPkAD+Rg@mail.gmail.com>
Subject: Re: [PATCH v7] target/arm: Always add pmu property for host and max
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 28 Jul 2026 at 10:33, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> On 2026/07/28 1:10, Peter Maydell wrote:
> > On Mon, 29 Jun 2026 at 09:10, Akihiko Odaki
> > <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
> >>
> >> kvm-steal-time and sve properties are added for KVM even if the
> >> corresponding features are not available. Always add pmu property for
> >> "host" and "max".
> >>
> >> Note that we still don't add the property for other CPUs that lack PMU.
> >> This is because we do not know what a PMU version should be enabled
> >> when the user sets the property to true while it is defined as an error
> >> for the "host" or "max" CPU when the hardware accelerator is enabled and
> >> the host doesn't have a PMU.
> >>
> >> This fixes qtest-aarch64/arm-cpu-features on the hosts that supports
> >> KVM but doesn't support PMU emulation.
> >
> > No, we should not special case "host" and "max" like this.
> > The "pmu" property exists only if the CPU has a PMU and it can
> > be turned off. If The arm-cpu-features test assumes that the
> > host CPU always has a PMU and so always has the property, then
> > that's a bug in the test, not in the code handling the property.
>
> The test correctly avoids assuming that the host always has a PMU. It
> expects that the run-time-derived "host" CPU has a stable "pmu"
> property, with its value reporting whether PMU is available.

That is not a valid expectation currently, because that's not
how the property behaves (and is not how many of the Arm CPU
properties behave). If we (as has been proposed) refactor Arm CPU
properties so that they're class properties rather than object
properties then we will have a property that is present always.
I don't inherently object to doing that.

> That is already how Arm handles SVE. Commit d25293068b03 ("target/arm:
> Move kvm test out of cpu_arm_set_sve") added a false SVE property when
> KVM lacks SVE. PAuth and kvm-steal-time use the same general model.
> Other architectures do the similar; for example LoongArch KVM does
> exactly this for "pmu". So we are avoiding special-casing the Arm pmu
> property here.
>
> The comment in aarch64_add_sve_properties() gives the rationale
> explicitly: "to allow -cpu max,sve=off to always be valid." sve=on still
> fails in that case. Keeping the property stable prevents -cpu
> host,pmu=off from becoming invalid on hosts where the PMU cannot be
> enabled. This also matters outside the test: libvirt emits pmu=off when
> the PMU is explicitly disabled. This design is intended to follow the
> alternative you described previously [1].
>
> "host" and "max" are special-cased for a different reason. For fixed Arm
> CPU models, the property is omitted because its semantics is not defined
> when they don't have PMUs. "host" and "max" are different: "host" and
> "max" enable whatever PMU available, and fail otherwise.

We should not special case "host" and "max". If we want an "always present"
property then its semantics should be:
 - always exists for all CPUs
 - if the CPU can't support a PMU then you can't set it to "on"

-- PMM

