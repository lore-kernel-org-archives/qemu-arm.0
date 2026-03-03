Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C268DEDA683
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 15:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxRO3-0005kR-TW; Tue, 03 Mar 2026 10:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRNt-0005Tb-Tz
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:10:07 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRNr-0003uD-6n
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:10:04 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64c9a6d6b70so4817100d50.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 07:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772550602; cv=none;
 d=google.com; s=arc-20240605;
 b=jN50VAoYulttPui9WB5jbGx5jCnXGts8TOWoGNgSL+lX1U14RAUttQ9gO4Cniht2S0
 oWpzxxc/U/i1pnBUr4i51XQ7WjwiMhhxMKYpPUZPr9cGMpeMQC5Uf55rbHWH+NpOB6qs
 NojeTRCyRKtHLp8jTmTh37CP4coDFkI+icQz2rRS1Z1CNQKDEaFZKX2mAk5z0qTZjhBX
 lI92gO58UEkk1MIiTo0geR7jBaJVLPiV6kSfIWxYh43ywOk3KrWTHu8O7S/B/nP4buYi
 bzJqrHthZBij33mBGY7aYlQfeWVDpKsOV67sMAfquKuBHNnSc49uj9ymDl7IEmXkn4C3
 2hCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fxXTogvuWYH9Fq6iS8mpnihsHSCczqovzurl8AXK6fs=;
 fh=n/nfAclAyaCCV6jPtHm6DgxzCMcfnzPkf0H4S/CGgyc=;
 b=fjwytNcn++JmddOMNXp62kij5Yo3Wl36nDfHrC3tqbrY850FXyyIXcOitELSIE0NUs
 +dtR8r5WMiEX9Bi/q47qXPR4zrjQX1IBfSf/9Ze0Kz/x791jabHOH8ogMJbE+w402qqa
 Q2mSzF2m2SVdYyYJNNNhVxPWmxrVW02vVWa7PJofqMIwB4Y6l0RxefxgH6GbbV8a9mRI
 LWkOY7RpRQvxGyKKACFN/hk6Iz8v5lyDYG4ngw+L4sBpJKAwBNqUIX4Ijb2v3tGuFm7u
 5534P71LpbOqMjZDn67F2rLGMxM4Nmb/0mgSC9PUv47f4eVqYxVZuIKu58etlNiWXsmn
 19Ow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772550602; x=1773155402; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fxXTogvuWYH9Fq6iS8mpnihsHSCczqovzurl8AXK6fs=;
 b=n6XbAEF4Rz5Wg3Ewx2cmGZVnkFjBYbPba8u4rRAgT57JJE9gJDLi2JKFkwJSxJFZNK
 6f4OZtYYKvH6gh0P1NmKUe6z/FvS9f+A2sdBJ+1cRJA9REmGfumtu6N2/ZWyszZkeojG
 DtEWn0U8jTIBfHWVqHyTQa1WD6c2UEjXY/YxG037ZJMSakVSFsPYAffxShEQoB0O5Zj6
 lleuFq/0WXBFesZSYKsATCtwH1Fd9SIn1OMmocWzQa0/6PGPtNkdTtATCKudy1PAvojW
 UKokZKSvNCFBdw4tewjGcMBgsPVQrTrBbis5zPh14W2ApM40n8+qprBkTgHUC9pHDbsJ
 PT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772550602; x=1773155402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxXTogvuWYH9Fq6iS8mpnihsHSCczqovzurl8AXK6fs=;
 b=do9N0Mu952Mgv5c4eorPKOtJbQ809CCGcPRxBED4CyVvPpnsCt9g3N1l1t7UnAhvv+
 v30v+7pdjLSTbsz2dc+ldCZO/PY8tipCW1i4mS1IYIqIzdBrIKs5iluFa2neKz0fcglE
 I+1bG1aT0Yzroj5M7ugkLA8WgkimutOGuCRs6yQh4/2NqLbu2y34XIE7e9Z4+EZsjhnb
 CSwdU8Go6dlXTKjgPUTZzfRysoLDdtKpK6YGoqaTbaUgYTNVdHVZ6r+qI2NGEVSqbTl9
 9y7WycUnvL0y3jVVQ/HbOJTgSG2J8kZA6GCtRU49ydqnf2IRC38k/3+kzU6IMA14eC6v
 Zw4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbiMWV1EgUVsDMyXD1krG/DURdSNMKyxHeq0vmvOxhTN+RFiRkdVgmtuiOdW5MnTTG9rCV0bmEZg==@nongnu.org
X-Gm-Message-State: AOJu0YwN8ETQYrJaqMSUxvo9K/CRahnAaHwf2WzogUtRe3BZd8So+5yM
 BY9UTC8Zpp2peWghq3NDM/tJB4WM0LGxxNAnWssX0VjZOlQCkGqNvWY8jgslw/b6+hGs7buUJ3P
 VUJbnyl81Ibo58ENqQJAUI2GCdDR0PYZCj47kjNX/Xg==
X-Gm-Gg: ATEYQzxBsDQdu7QTP6bosorv2H/cWJR0jz21GM79QKfD+/oDMZARM3VhRVbLP8tQizi
 O4If/OJvs5H4WOHzphaDlIRRIx1VEBtC9qQJFd+xDLsgKRFI4yepLT30yLZ3EYZ+NAwwpi4s9Um
 M+DLKJidQBHGx21QKO44sRDJm8hTyRuzyYETLKhV/VO3HhGGE5q7qFrvX8Ud7ZqOX1RYiLnvnbt
 icsJ2tKk2p4au8CVByKeZpWRtbypIQl4p9/UZ9QUrSKjzbEG3W8GE/Xjpp1URDlZXHONGMUQ896
 EIRjTlQOD5WVx0jj0u/aNsxzrH9OkDXJwTimoqswM1olv8AWcsKdgfBNuOQpiWwz7Jc=
X-Received: by 2002:a05:690e:5:b0:64c:a4ab:e4da with SMTP id
 956f58d0204a3-64cc2083ab1mr11292565d50.6.1772550601838; Tue, 03 Mar 2026
 07:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20260303143928.1747116-1-eric.auger@redhat.com>
 <20260303143928.1747116-4-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 15:09:49 +0000
X-Gm-Features: AaiRm5031lcUy-1-nehwB4fqLMjxhdMftmN22SK1Wq5RCFCcyZFC87G8TjFHrcs
Message-ID: <CAFEAcA9uPdKJ_TSFUvN10Det8Copcg+gPoqi6yNZ+Cj=mk3xbg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/arm/kvm: Export kvm_print_register_name()
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Tue, 3 Mar 2026 at 14:39, Eric Auger <eric.auger@redhat.com> wrote:
>
> We want to use kvm_print_register_name() in machine.c so
> let's export the helper and implement a stub when kvm
> is not enabled.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - add doc comment
> - no code after g_assert_not_reached()
> - use char * instead of gchar
> ---
>  target/arm/kvm_arm.h  | 8 ++++++++
>  target/arm/kvm-stub.c | 5 +++++
>  target/arm/kvm.c      | 2 +-
>  3 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index cc0b374254e..ca2492c7412 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -266,4 +266,12 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level);
>
>  void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
>
> +/*
> + * kvm_print_register_name:
> + * @regidx: register KVM index
> + *
> + * Returns a human-readable string representing this register
> + */
> +char *kvm_print_register_name(uint64_t regidx);

We should also say "The caller must free the string with g_free()."

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

