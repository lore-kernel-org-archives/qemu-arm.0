Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E69DEA3F27
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 15:44:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqCNa-00055W-8T; Wed, 11 Feb 2026 10:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqCNY-00054J-7d
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:43:48 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqCNV-0001dl-Qi
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:43:47 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-794719afcd4so70870727b3.1
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 07:43:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770824624; cv=none;
 d=google.com; s=arc-20240605;
 b=UXOmrRm8BABNq3ro7KC55s8KFmGtJ+/FZf6rwdNHlu0Y7lq+iTeM80+jfEiE5lNwEn
 4U9e/whg59w2bVUkJiNivg+GnFJWLSAZcREg+xqZzaBO8FE43t6aM/vEhvIoOjtgyprb
 jyGl58fg8qRYUkfSnNrPSf6Ht2tXFGomi3v1DVaV3QtGFhsT/BaZxCMqu/Apwujyoi3g
 umy05TZEDZH5OZJMBD42/VE1/qDEBCzFVQYQF5RwkdxVaQ1XYQEigpVJZXe4AQAvwC4l
 da8trXcprgN+AcRxJzTqGOlt8uG75oHXAse0PPISE6GREtNBUw6ZWZlEDc0pu8nO+0uo
 1JsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Cwx4TMtV0+2MBlJylAWyBlGUsmVcRjrhOwzbBX1NFZs=;
 fh=NBTjudXs4nnlj1o1e19HZfIDMibhN+ydchmwkEaUcxA=;
 b=UrWiHIWahl+mOJ+RJPkVsus3GO+jtqsKrqRUEXUl7Jq/ZF58uoVICsIkEhubr33jVT
 7IEQIdwiJ5sBHPuJMWsrgse+sCC1sJEyOQOf6vvjJlT+HHf/2vpgMO1rWO+rUAHes4HJ
 /Gmw/dk0rjyC0tTNAhaFRaqNTHMvypLTc07pRvyqFCnUtBt/baml4JBbdxAo4z8VEbKz
 gq8M3DMYCfmS1/RBwRECOdQ7DO8q3Jq+I9oaBrlPW+gHaNtnlk4eudTQ9Fi2qGUD7oel
 7mzEm7sBl/tJnSEoHbLJzoLofNcZLPI8plJ3DQn6Z1Vq1UejrIvW+V/2spIMc0ajYwt/
 81Yg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770824624; x=1771429424; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cwx4TMtV0+2MBlJylAWyBlGUsmVcRjrhOwzbBX1NFZs=;
 b=J+go+BYiUlEfq5lvKDJRYMwEuOqYkQA471J+L+Vaa8w+vwstKbRS/+q+TMQdiy27wE
 hYFNTAKX/FJfqDHQH3Z/2uIkrBA4J4VAo+BGKoxxIy1HAiqeSBZI5um30G3uKf+abF4o
 r9DLDc2HYFW/6yg0CQgPv+gCScUUE6cPg6yKQnPPoo6sfcX2SVkLilNWG8Hkytu60llQ
 AnD8UIB6s1YyZaC1j3lIEwDl7SP+7Ek2QbexteHacEoT0J80MKLFnOUyRNcoOZEgqN2X
 73MKG54KqTsiMjU6eoEewDFXt5KfbYjh31brG5FxIUfUkCpRkfiSOLBdxY3K4Y7RPBrZ
 e/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770824624; x=1771429424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cwx4TMtV0+2MBlJylAWyBlGUsmVcRjrhOwzbBX1NFZs=;
 b=hVTDyd2xTKs2XyBsB8bwDOJYiV2NMpu6Wj/lYOtNErMR7cy10v777SrxxrFbHOpdNh
 wLVLdypToPlrpJI6CNwDYIPbSBMI3NuVr1VXzztgPwv3/r7zYwtR6HaY0Uu+87UDzHnS
 3g63RECBSwzGQW5aSht61sCYvVuCXfIh/ouPZZTn5hgoz1b5R/pT/dCui+ht20MPyYfq
 516krt5k6KW/mc9iAEK+wZgW68dFShEZNJyKBRT68XNMEr8EWrB77Vv9m2Hpfi9doD9i
 JfykRZzz55idL5BhBjJdqCmVr43tH+YPgl727dPN0nq1p/lOfUvx/dAka5DZEJPq34Yf
 F1Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeivL2AcA7O+zqiQWfU/v3sJ/JI0vf9jqMOeWW857YbzlFR7YpMQ+4mJpjfvd89iKnFJdCnD3XAA==@nongnu.org
X-Gm-Message-State: AOJu0YzjTmkrRNTTlaQdNIGWJF0i282Vfb2w/MopYX4SEAgy+ZsSMClN
 W960PMfwu7mhRUAJSbLjOo5fAJnkO4XdNM9hs0EIl7nnFRNLYKE98j+EGz1TqwFbN8KpXuaqixC
 XJVh90dPZsh8ZWqfHbaVUaRbe27+yEp1fmZQ4r56tTA==
X-Gm-Gg: AZuq6aJWhm3e55Y60pH7kHT33HjDazIvaJSg0s80INqb+aCABoLNxVbBV9tvgwAzmfF
 GvyjU2MzpHfbFp+Ztl+ClrOmlf0XlDTb3c7cZEYuWt1gPV5P06lUydIvndGKyaWZhCrMTTZ10vE
 hQCNHPdjzvq9NycjzCzCb9iVxa9JQ+lnONHCQ4tU9X7LK/L/QAqtPSj1KtOcNllsyGxqDJ6bEdF
 +5Dksp3j14fDbXA/QNYRlgPwKcTMz5056yAgD9fTSmhaL+q/L3hCNgb4HcImft/B6UOu0T6WMEo
 qmZ3bBiVdMTdyPkJqgZBAwDnGCnsRTuLSCrgKOy9Jlt+gdDXMuGdcxV81JU5VmavArE=
X-Received: by 2002:a05:690c:6006:b0:796:2ee6:3f87 with SMTP id
 00721157ae682-7965f08a3a8mr55352367b3.67.1770824624573; Wed, 11 Feb 2026
 07:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20251202160853.22560-1-sebott@redhat.com>
 <20251202160853.22560-3-sebott@redhat.com>
 <CAFEAcA8oi1Xs2kv66dFV9NZore+Q2vHUsgMikveVdN1c+3SBJQ@mail.gmail.com>
 <9b04a20f-b708-208d-1e4e-466ec30b7bb9@redhat.com>
In-Reply-To: <9b04a20f-b708-208d-1e4e-466ec30b7bb9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Feb 2026 15:43:32 +0000
X-Gm-Features: AZwV_QhbMQtjgAAFsQMaNKMcmBgssEikN0rK-YFZ8G0l_cRA-hB9h8zVvJqu3SM
Message-ID: <CAFEAcA-A+zW=QFdCY7z==+Z=xXfhJvPeyHhbG_MpEmpkQfrmaw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/arm/kvm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 11 Feb 2026 at 15:37, Sebastian Ott <sebott@redhat.com> wrote:
>
> Hi Peter,
>
> On Fri, 6 Feb 2026, Peter Maydell wrote:
> > On Tue, 2 Dec 2025 at 16:09, Sebastian Ott <sebott@redhat.com> wrote:

> >> +static char *kvm_get_psci_version(Object *obj, Error **errp)
> >> +{
> >> +    ARMCPU *cpu = ARM_CPU(obj);
> >> +    const struct psci_version *ver;
> >> +
> >> +    for (ver = psci_versions; ver->number != -1; ver++) {
> [...]
> >> +        if (ver->number == cpu->psci_version)
> >> +            return g_strdup(ver->str);
> >> +    }
> >> +
> >> +    return g_strdup_printf("Unknown PSCI-version: %x", cpu->psci_version);
> >
> > Is this ever possible?
>
> Hm, not sure actually - what if there's a new kernel/qemu implementing
> psci version 1.4 and then you migrate to a qemu that doesn't know about
> 1.4?

Oh, I see -- we're reporting back cpu->psci_version here, which
indeed could be the value set by KVM. I misread and assumed
this was just reading back the field that the setter sets,
which is kvm_prop_psci_version (and which I think will only
be set via the setter and so isn't ever a value the setter
doesn't know about).

That does flag up a bug in this patch, though: if I set
a QOM property via the setter function and then read its
value via the getter function I ought to get back what
I just wrote.

thanks
-- PMM

