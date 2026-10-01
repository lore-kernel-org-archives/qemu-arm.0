Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404FCCA5FCE
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 21:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCOPy-0004ro-0D; Thu, 01 Oct 2026 17:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30tG-agsKCM0v74C764xF1Bz77z4x.v759x5D-tA5676z6D.7Az@flex--coltonlewis.bounces.google.com>)
 id 1xCOPv-0004qk-UK
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 17:34:16 -0400
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30tG-agsKCM0v74C764xF1Bz77z4x.v759x5D-tA5676z6D.7Az@flex--coltonlewis.bounces.google.com>)
 id 1xCOPu-0007ZS-6j
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 17:34:15 -0400
Received: by mail-oi1-x245.google.com with SMTP id
 5614622812f47-4c734afb8deso11389732b6e.1
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 14:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1790890451; x=1791495251; darn=nongnu.org;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bZc4ogm5/WT7GTGjXs62z4TP6S2W3GOrNVtANWpbLNc=;
 b=lI2Acj7wC/cv+CKzyqu1uHbXtj0tncW+6bQMWXYkP/N7QjXLD1tVD8rkfjfhKAt+7G
 1J9EfS3ifBD93/mhVi48W0yyD15Sc2RwvTBRtXWCY920OxLhiG2hKsMgoV5vhI+T6MjR
 b0ZWNK1X5srGI1Gj8r7LTVY2w7dB+0HLfle/6MF/SIAX0lqPxT0LovFvAAukqARIJDhw
 4m2RvxmqMMvEoLksAeYZ36G4wjqAwDMiiy3l/amcTzhyG9DvfYTHCpRk71EIa9/kMq6y
 PPzhr9FWjQiCc4+TdZqUJmURVYDt332q8W1/YgMt8qmwhPLAWr/k7Db51oFxhU+NdIoy
 /TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790890451; x=1791495251;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bZc4ogm5/WT7GTGjXs62z4TP6S2W3GOrNVtANWpbLNc=;
 b=08zAgKqSMy2MoLK2kdiDYG6I30qeXixc5F/hTwjGPBX+8y6hV92rQDk0THSJUbxseX
 YExW12zoKNoXt4KeIlku8JB1HDk7ia/FK2lMvW+2THfgR/Kv7nAE7w8VIO+QmLdnL1fL
 GyilS4lb9rMnmVjEzmjyF+rAUNBeHU80e19h8Jga+5AIOxIL8stZ6ASJkIUN6av1MHWS
 5Q95jI5+Y22Rq9HwEi5/skG89CEYVlaBsockYYetrxrPoMDo9BhChD9uNUldHQ6jszey
 h9sj3PnOBg8uJrFLugdpbFehs4fh5S1ZD/gSbmIZm4VV8E1haSQj1byVK30RXsatDkUc
 H9cw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXINwH3HsGJn+ljHEO4oKzFdKw3pz9VydsMM8aS96nyjAz9LxMTBUaPTYzgmys9aaoxaR/K5NusQ==@nongnu.org
X-Gm-Message-State: AFuF++kN5+RLLZVE8QjvJweohg6WDTxfujY8OaJbuTUxKlalRc+jnvth
 0nTqQkdCZiz/kHHDhQO7FqeAefcRaXOVy6hK8BCjY6U32soeE1CXAJefA4c+C/nJj+oHHJR1g40
 /DDke5v7+QEzlFZ347llD4G85BQ==
X-Received: from iou20.prod.google.com ([2002:a05:6602:64d4:b0:9c7:5697:9ad7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1583:b0:4c5:12a4:ec8a with SMTP id
 5614622812f47-4f52aa86098mr422937b6e.36.1790890450368; 
 Thu, 01 Oct 2026 14:34:10 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:34:09 +0000
In-Reply-To: <CAFEAcA9DYo3GW_59eZjsk1qL0--3amYd7ufPqt80O2qv=Qm_pw@mail.gmail.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924173051.2117637-1-coltonlewis@google.com>
 <CAFEAcA9Rwrffx8bYiOxrtQGdg31QAz1oBm8okzpfqHZ6yK0Y7A@mail.gmail.com>
 <20260929212102.3659389-1-coltonlewis@google.com>
 <CAFEAcA9DYo3GW_59eZjsk1qL0--3amYd7ufPqt80O2qv=Qm_pw@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213409.2090008-1-coltonlewis@google.com>
Subject: Re: [PATCH] target/arm: Enable KVM PMU partitioning and counter limit
From: Colton Lewis <coltonlewis@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mingwei Zhang <mizhang@google.com>,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::245;
 envelope-from=30tG-agsKCM0v74C764xF1Bz77z4x.v759x5D-tA5676z6D.7Az@flex--coltonlewis.bounces.google.com;
 helo=mail-oi1-x245.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi Peter,

On Wed, Sep 30, 2026 at 12:35:02PM +0100, Peter Maydell wrote:
> On Tue, 29 Sept 2026 at 22:21, Colton Lewis <coltonlewis@google.com> wrote:
> > For the counter limit property, would you prefer that it also live in
> > kvm_arm_add_vcpu_properties() as "kvm-pmu-num-counters" (KVM-only), or
> > keep "pmu-num-counters" general so TCG can also use it to override
> > PMCR_EL0.N in reset_pmcr_el0?
>
> If it can reasonably easily be implemented (or potentially implemented)
> for TCG, then I guess the general name makes most sense.

Sounds good. I will keep "pmu-num-counters" general (and wire it up to
override PMCR_EL0.N for TCG as well) and move the partitioning toggle
into kvm_arm_add_vcpu_properties() as "kvm-pmu-partition" in RFC v2.

Thanks,
Colton

