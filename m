Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22D3CA0EFC
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 12:31:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upQrn-0004v2-SO; Fri, 22 Aug 2025 08:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1upQrk-0004tm-U5
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 08:27:33 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1upQre-0002Q9-Ft
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 08:27:32 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e94d678e116so2030617276.2
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755865643; x=1756470443; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BYsKwztJMauWR7WjTG5BAj51rSQL/be+C1+B8xc7DMM=;
 b=QLMI2DmKAv/ylQ8KM88MXP4Ag6QgGwzEawzKcw1aRtFESj6ys99lFoxdm4ZgFxynB9
 uLTsEPmwNmWMPwbTpx69qLvXwdEi0I251JOoCNHAv5oEg5iJVWFSZwzltcGyRn6FBLxS
 AuNHIXoXqCEWSBY1n0jB13iWhpAl59DNWCZvlL14Hno7FNKcpJBq+y1sN4i7eQgSGDPU
 5s46TScO1Ff+mCMzLxc0FZtRreSputKtnctpwjcNRHUBae9sQ8TZRlRaLEu/vMz8dts+
 927QmmEW4N6+pi43szmvRxDJySnyh7NLH/amHpXNVj4SJLhkme2+yzetyaXg+RcL2bRT
 x3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755865643; x=1756470443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BYsKwztJMauWR7WjTG5BAj51rSQL/be+C1+B8xc7DMM=;
 b=KByBdIGYVww1AKGpZBR9EEkGA3XCyNYEmycmjoltuSN9Y9JM4QwjeZ7Dwjw5XzvVpg
 RjzEnR1GjY1jKpxrlhOhIQkR/TF9qctiUBIUrsZFJ4rXeHxaVKU3hjuf54FnZ3up+mr3
 FvISpRH8UilZpYztTlbRKLhHTaCzIOtLlHpztw3jUWsZywBsKxOL77JtxfXEnoecMlxR
 55Zs+BN4AIjcGZctG5QIyboCCU8pSX2+6H4SgMYjhfwK4swojzO8/rq8HRQ1n+QDtqq5
 kDntCss2cg2CPO8H41/v5aH5b9oRFDiPRMnVecdPIceJb//AYqLCt680mcYYn9cActua
 pbTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDkObfEwJ+OiJRtQVzEqU9RAAs4UB1jflqeAxXVE4z5BdMZPjDgFu/S6BCqFcem2Cf5mN8NU1OVg==@nongnu.org
X-Gm-Message-State: AOJu0YzTLFui60DSQlAXcm4J42gFxaTwD1C6myU2THsrYk2ee/Q9K3Xi
 A/ErM1pZ4cbZA4/g89rFdvEwEbfNTUYwnTjJzdk549kp/MwYxjecSdGjpvpSKGZhsKstMaupxfy
 oTSOCHsds2XMPixYZ7Cy/Li+pX1vvoRuU5DOl3ropFg==
X-Gm-Gg: ASbGncvKCDv/WoQrX+c9M/TCr13+OskRUEf9MkuT6lprKpZ2u+ISSb/NiMpP7aYyl6x
 ++9rPu1wleQbE28EKR+uny3bVJyk419foJ2guphH4SVVXRl9kK198npjQ2piU57unlOKCcmkuwT
 OPQfugUvttiChh3fyMtsT38BxcLyoUsTyaYnlcCDGHZZDljMcIGAR2bn2QhrS9YUjVzoKqnGFj5
 W9ZJ2eO
X-Google-Smtp-Source: AGHT+IF7er9eyrfv7QjTi7lidx7NPd55hetUoy0ulPmLsgaXGsCsKrTqX+j3ta5+XMTIdENeLr0GxDRNZsYVjCgBnvk=
X-Received: by 2002:a05:6902:310b:b0:e8f:f6d2:b706 with SMTP id
 3f1490d57ef6-e951c2de174mr3142690276.1.1755865643277; Fri, 22 Aug 2025
 05:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
 <20250811193654.4012878-4-vacha.bhavsar@oss.qualcomm.com>
 <CAFEAcA9wQ8qh3Ah+QNNXY6u8ut6ZMVqaxFTvDDhvEGYrazFPsA@mail.gmail.com>
 <CAEWVDmuAkDuss-vB35dOPP-zSOZTEK4WJGfvqLQdHNG-63h51Q@mail.gmail.com>
In-Reply-To: <CAEWVDmuAkDuss-vB35dOPP-zSOZTEK4WJGfvqLQdHNG-63h51Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Aug 2025 13:27:11 +0100
X-Gm-Features: Ac12FXxw2wMywUFCmmHFNV_0tSTgwquaHxpt_o2gB30wsft00vQuWby2sxpI03Q
Message-ID: <CAFEAcA_BV1ThJ_2L5pDd8WQhSPKd2WKbW1eb1Owrr4YswOg9Bg@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/arm: Added support for SME register
 exposure to
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Thu, 21 Aug 2025 at 22:37, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> Hi,
>
> Regarding having the SME check inside the "if we have SVE" check, we were looking the the
> Arm ARM, specifically the following excerpt from section A1.4:
>
> The architecture provides the following:
>
> - A general-purpose register file.
> - A SIMD&FP register file.
> - If FEAT_SVE or FEAT_SME is implemented, an SVE scalable vector register file and an
> SVE scalable predicate register file.
> - if FEAT_SME is implemented, the scalable ZA storage.
>
> Based on this, we were considering the following update to the change in gdbstub64.c and
> we wanted to get your input.
>
> if (isar_feature_aa64_sve(&cpu->isar) || isar_feature_aa64_sme(&cpu->isar)) {
>             GDBFeature *feature = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs);
>             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
>                                      aarch64_gdb_set_sve_reg, feature, 0);
> } else {
>             gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
>                                      aarch64_gdb_set_fpu_reg,
>                                      gdb_find_static_feature("aarch64-fpu.xml"),
>                                      0);
> }
>
> if (isar_feature_aa64_sme(&cpu->isar)) {
>               GDBFeature *sme_feature = arm_gen_dynamic_smereg_feature(cs,
>                     cs->gdb_num_regs);
>               gdb_register_coprocessor(cs, aarch64_gdb_get_sme_reg,
>                     aarch64_gdb_set_sme_reg, sme_feature, 0);
> }

Yes, I think that will be right.

thanks
-- PMM

