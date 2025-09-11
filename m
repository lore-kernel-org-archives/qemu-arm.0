Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E1FCAC58E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 15:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwj40-0003D3-J7; Thu, 11 Sep 2025 11:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwj3x-0003Bi-Ex
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 11:18:17 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwj3v-0008NW-I8
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 11:18:17 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71d60157747so6311507b3.0
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757603894; x=1758208694; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=knG17Yq8OEl51CMsovL2EtZQpAt43iivBldwrOwPUGA=;
 b=No10FFGv0dZy1RssbQT1krSN4vvFQyA8REu63FzbrCoQzkQXE2MVUxLvQhoBkhdMAu
 Zx2t/udtGvnhmabxt65T+bXiBYYkrMDR/iyMUZss6MJT3WtQyHmdaxxFsrSK/6pgrXIj
 kcThH7HFvmxWoXV3uH+uSwu0OlNsESzBlISQziBljEjGTUJUwtNUM6AJjjKabiDpFgSO
 fX1NKI5RAMyYF/anMEWdBXITQP4xlZrtF/Re1x4rwOkzUoXRG5Y+IAUz97ifgDIwnDaF
 Rjm4T6zpD5SMzVNLIYzkTB6cBSPrNLr7jhguxGt9Q9WCZEsFJsvp1N2pn1emauQ/+WcM
 Azxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757603894; x=1758208694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=knG17Yq8OEl51CMsovL2EtZQpAt43iivBldwrOwPUGA=;
 b=c8NoyClTyfJQM02fokvxu6LPWNTMkDlgNklTzTMMdptt0K8Hsgq9Apjs69CM3BvZys
 EdjVj6xK8wFHLbFKjzTjM2Y2wXxBcc66hzdrURegcNhP6JHXdVSgbVQR93FWDDaYKko5
 Vt1Xta+IORUwt4XO1UgcWsIbCP5mxDbX/qJFVfU1VuTHevf1GTd3v4HwxheeUltY7k3Z
 HMlh4Etn/9d/wLkSEQ+tJ+NiOavf20XFDmtwgfvL/itOvfnVhcB/f6yO1ZzLzZ3gYcfX
 CACkvfVGJP1QKN84AZ9dZWQVS5OkLwJTYKHND3Nh5U6SYAsulYrxhzHAQ1af7EQ6FM2e
 ml6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/9j4JTfeghFAJdZPtWGhYgbDcT7ABUAhFxFc3bcmNfZ0BNnY+ibQTBV0X9t+nfG38/Cp/W6CGg==@nongnu.org
X-Gm-Message-State: AOJu0Yz245SXUIAyNdeylsBD5JVFFrAVQLn6EofDC9XWLEJjAODviACU
 YNRR9ZBgv9tStUQS/XPk/xbcdWPCsQiVUNoc6aRDCOjn6uHo8+f/EFvHU1VVoPIzBmVRnTQIlPu
 2zSxb79D97mgiC/YCQBe/ChKzEf7xfN4eMYK4LIwz6w==
X-Gm-Gg: ASbGncsiGCsESSRYnbLlU6Ts3sEOPhvAyBPivkdIbXCFV1fBraoK0FcQ0jE2TyB6NQq
 0VA6OA8b/rDzNfBBlc0EZIQupp+L3HrXRStDqEOxovzWswOe6PATIgKhHCh43AEh/YhpMkp4b4X
 NafIah5g1Wfgq2j+Wyf5Aaygs8RMJU0Yl36X4/YXairPjz3Oy6kD7ZL7dVB9ObKc01XvR5SF883
 l7ZX8QFPY4YpfJQW2s=
X-Google-Smtp-Source: AGHT+IF3H557iKfUovfqwt2gL5bCvaJImvBqsOCUlSfE7rbWLqZkyw3UKcIFfROpG6jQIj6ebdJJMvpqUVlLx0flUXw=
X-Received: by 2002:a05:690c:b9c:b0:722:8611:7979 with SMTP id
 00721157ae682-727f534c628mr212302917b3.26.1757603893463; Thu, 11 Sep 2025
 08:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250911144923.24259-1-sebott@redhat.com>
In-Reply-To: <20250911144923.24259-1-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 16:18:02 +0100
X-Gm-Features: Ac12FXz6fXkfCmLnxnecWlBKlTxswjmrip5hHL8mvpSj6aSPT4PhMhm5w4RtkfM
Message-ID: <CAFEAcA8EDJT1+ayyWNsfdOvNoGzczzWV-JSyiP1c1jbxmcBshQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Thu, 11 Sept 2025 at 15:49, Sebastian Ott <sebott@redhat.com> wrote:
>
> This series adds a vcpu knob to request a specific PSCI version
> from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.
>
> Note: in order to support PSCI v0.1 we need to drop vcpu
> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
> Alternatively we could limit support to versions >=0.2 .
>
> Sebastian Ott (2):
>   target/arm/kvm: add constants for new PSCI versions
>   target/arm/kvm: add kvm-psci-version vcpu property

Could we have some rationale, please? What's the use case
where you might need to specify a particular PSCI version?

thanks
-- PMM

