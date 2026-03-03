Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D46EC1428
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:55:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNOf-0005ev-9R; Tue, 03 Mar 2026 05:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNOb-0005db-1b
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:54:34 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNOY-0006rA-Ir
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:54:32 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64aedd812baso4816110d50.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772535269; cv=none;
 d=google.com; s=arc-20240605;
 b=QqXkE1+OcNk9n+zWnmzC1XGG7CQB0M4BShG07iRv3vMKX3FPjMqRSr3wiS6elYt1wC
 q0xPu9gdjMuJDWCBTXHHIVwgL0XgwMdWdmU/AeLxUfTchFgXcET9M2bXzALj/hKQwi6V
 Q5ntXG3MVXql/y+rdMw9KdSxDSGyXZ8DxxPun0Ds5Ak3FRXTIhQ6uIIfrNl7cMz6LBlT
 Wmgg4bGbExPk7Wln2HrYlpHuuG1vT60yq6ZqEjJR1UQDg3wFjTmOt1LjQALUKhe7p4vh
 ttae3C0QSJJSP+DI5wRWBAhSvcBvDhQo/Bj5/f9q5HIm9AKQyVmVXQn8tqy5TMpjuuOF
 gtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=I7/oEUbiOqQUR4EtlmAbLUTq9ldIKUaBwwgFXUxw3f8=;
 fh=mhxolGnpohZid40WVfMCaz0wFwg+nCwl6yhu/3DCmqU=;
 b=XVRUTc0ZcDf0QH+zuv7ansgajxhzNB2u5Ld55nMgxrtIcxobQCNP3iAhI9z2eHFAFI
 8UP2R5U8rxmOkNDqvJ6naj0BFZTcR5QL3Yrh1Dk1O/YXHVHW8atmT7hlrU+G4uYXzb6/
 SKmyQHELTGZVP0Noq4o2nznSaHptOv0iC5P2YHydc6pjSAVdKEONwJWhhgS8CVX25zv7
 K5dHDiyiI2coOYdCYUGBxfWub75LTnVsC1e4bSGaQl7GWCnmW3t3Hz5PdADsWFExxx+a
 dAB33ifPePop7sVT6JQr/JfrwRVA5gu/4FFbSThfsUquEtPhErKOtoTTzMDoZs6W4Dqe
 ou5g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772535269; x=1773140069; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I7/oEUbiOqQUR4EtlmAbLUTq9ldIKUaBwwgFXUxw3f8=;
 b=v34GSJYyexibkjnIxoBTNnz+YzIfPu6PK2XH68gjngLiiLc1THV3ObbPve07x4zA5o
 TeIYntKL4lNVBm86cs17aHrx6MRijloroxOg275SHK9EhwyGIodxsRoScWKuONWGmcP2
 wrMwFjReQ/XE4QHVWvWjvBhNPKBTLydrTtiwy54q3CsXoYHOlAPowajKRerfog67bQ/s
 PPh5bhsio9lGCLnmKmr71qSzrW2yenlPo/Iou7/pi+FxInVHeRaXjoEF7IvX7G4GxNAD
 sUk23wJnEDmCLkLC3QplYuq+G2s9BhbqgLqyKyy6Gfft6fjdgKq16L4jNhN9KAF6xakp
 FHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772535269; x=1773140069;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I7/oEUbiOqQUR4EtlmAbLUTq9ldIKUaBwwgFXUxw3f8=;
 b=uw5jATOuklXzpOjtd4uN+nq1xEo6I1k1BaqktKqH/M2RqUf2D3puRDzbXpAsPULt6U
 kxST2gboGuJPP+CNMheTjfwoKrZVe3UZXOOftWCfwdQaBE/+B4fTcylKDPqt2HZRu0RV
 N7byhvhSUN6eybhQVMYEEhvV1/0ZcOoqbS8yLtcR57hwsjnueJ9AQDt+MZ0EqizTOdlZ
 e4NYt1X9P3NEewIVdsx+XQBsKHQRj45sXBdPpAHFAAqnBzF2Aa2QSE4C+1akFdfDpA5Y
 p5vMLq+wDZ8ja6XUUP1GVvxZcY9Zc+La+4cTGopRh/633lPF3sw3826L5t+TVhG54hrn
 betw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuwMnk8d5qOy1OaE3MtZk+isessvNp2qW4vAVNh8/n+tYkpf4empCoqUTFx7WmSNnmPhKrMSgveQ==@nongnu.org
X-Gm-Message-State: AOJu0YwprPDqkh+V258/OfKaAewWu8jT+JqxgULXSraaxvmQhsqrBVKb
 7IXKUXYgH212u5tDqLEU78OB3bRA6sHHZwfyUqqavPgD/ZEX9oYTzFP2q/vkCmgY3zC5IFXtErW
 KfFNEMO1moJqsvYofzkSudjE6pc80frZ2adLaFJhRSd/gDQ1mwFTG
X-Gm-Gg: ATEYQzzvXAubAsxXXQCfqhZnSwlPUUVnuck0F3oqM/EvVBpIcOqkTKl70bT8K96HG95
 dsEYg5C5KtPOqw6JwRpd+6Rb65W5qW5X/hKkqnx+0babUp5aIaUSv5YDPAGsMkkk8jTpwVXRUhC
 jrz/pYb5HBrJfDdbKIJFJUVh0meFUlgfiM/nu2AzUjmjyUMSArpJzDFx2pC07vUvywH1MDP1Pnt
 nQZpP5KeLVgSWuYt2laxhA90+07a2g84mPMybKYeS9phHHYYiLeqzLSYd4Cy4latDW49FoeHpB2
 BdvKZ/KUeIGghX+1jOWUQCljRx1Ef1ZTjMYP9XbLV9pec+92rL4vSZXE4ThUixtDsZg=
X-Received: by 2002:a53:cb82:0:b0:64a:d64a:b025 with SMTP id
 956f58d0204a3-64cc20832c7mr9474194d50.7.1772535269176; Tue, 03 Mar 2026
 02:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20260226100232.500781-1-eric.auger@redhat.com>
 <20260226100232.500781-4-eric.auger@redhat.com>
In-Reply-To: <20260226100232.500781-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:54:18 +0000
X-Gm-Features: AaiRm51Uk4LPPhktdHHnbdTNPiggtaynqQtbBi5uTc0ioSOzen9dE5fhBShiFqM
Message-ID: <CAFEAcA9Z9LWKxisumU6C3WAtWiUhV0s+tnpFNAwuaBO7GSpCvQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm/kvm: Export kvm_print_register_name()
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 26 Feb 2026 at 10:02, Eric Auger <eric.auger@redhat.com> wrote:
>
> We want to use kvm_print_register_name() in machine.c so
> let's export the helper and implement a stub when kvm
> is not enabled.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm_arm.h  | 2 ++
>  target/arm/kvm-stub.c | 6 ++++++
>  target/arm/kvm.c      | 2 +-
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index cc0b374254e..b6980e4957a 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -266,4 +266,6 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level);
>
>  void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
>
> +gchar *kvm_print_register_name(uint64_t regidx);
> +

If this is going to be wider usage than just inside one
file, then I think we should be a bit pickier about it:

 * brief doc comment in the header file
 * use the standard type "char *", not the glib funny typedef

>  #endif
> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index ea67deea520..b13bb055e0e 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -129,3 +129,9 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
>  {
>      g_assert_not_reached();
>  }
> +
> +gchar *kvm_print_register_name(uint64_t regidx)
> +{
> +    g_assert_not_reached();
> +    return NULL;

Don't put code after a g_assert_not_reached().

> +}

thanks
-- PMM

