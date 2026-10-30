Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B9606A326
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UNuI+/H7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMmcL-0003bv-M1; Fri, 30 Oct 2026 09:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMmcK-0003bc-I2
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 09:26:00 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMmcJ-0006hd-23
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 09:26:00 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8b10ac6ab7bso6024747b3.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 06:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793366758; cv=none;
 d=google.com; s=arc-20260327;
 b=cFEgPXMhV9cPGfiWCCObYpsdSS2tonlXWMFy7axham0FBZ+d+H22BxxlwqpE1mmMLb
 k+U+jcjQIVUE1Tic3UV3VjyKseTaUL5QNBthEGnhWysk11rw85upFgB8qp5ifSLzoknd
 B3r6JRaLt392ET/r6yl2r1GikJjjOycehP7FqzJVsdseMLK9neaW0dJ4u9KEIPHNuSGG
 qOWId6pU4OTjPkZtjs0um5/HTGm4En5JfVsSVGuZ07DIDb/sGh6GTql22eC1OaMXbh8L
 MVdJpr4eCxbyHTWu3tdEbe0BBR+IfLA+aBhQX+XMIZEGX3Qb7S9hEuHpX5874cLenBqv
 2JWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eDxMGrYndojBgZZTFuQ1dDtBn6PBp8RE1QbmxJJDRCw=;
 fh=XwWYAqcZVLA9CnDRRyrHpOwTA6Xo0HsnBh9lMWP+1cA=;
 b=mLpLv/4TGDXB8gBNMUxK7e+oclerSwlz2wp3gM9zj/crLqdCSVEl21ZHhWUMLaD997
 +A7i9/lyoD8xYkjubtTfFnwrVzUAkYfS0fLeUoTp0kV6YumsMSCyTqFt3VeD+xaV29IC
 xhokPpmjH+HodDLg/4uxN7ZS5lcHGzoBy7Qk1E2C4w3ke1Bd12KdyapAI03Xg0eKbtlz
 QU7dBwFzI12GF5K675Slo0xKnwXi65yg1oEhRgM86pOWZ5Kd25en30H8HvrY87yqmNQ4
 z4bfyN4rkwE7qMT5GXC0poVsMa2W/X44SnRtQEQR2Ja9Mivxm8EbPkWxoV1d2LC5wDrR
 pMaA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793366758; x=1793971558; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eDxMGrYndojBgZZTFuQ1dDtBn6PBp8RE1QbmxJJDRCw=;
 b=UNuI+/H75WkK3V+5JbhmI7v6GPnXwSW7cLDe76mibDnbfIqZoNPNWGR9QTl3VdzMkp
 96cKfh7PzhiHUmt6RXz80LFRmH5K/MPctz9S7gFIWJie6kfzXGQnMCK+7GjQIezt5T8h
 PJezdB2gkMKUMtHmD+5/DNXJcNSU5lkRPmYRpAqtoEw5N7wP9sydvA9zzAIEJ/vUR2kO
 Z4amRJWZAfBQWcDzA7Ul3GQcSuFyCqh5FjpcKU4dLiEbsiOqWP8q0+QD/27vphieygIm
 4CPBjJTHjVLLFY5VE9lUZ8JE56m3WOm2USuM/XSGHdVf90JyRWiYs4iW1+dISOyb73Yq
 HPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793366758; x=1793971558;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eDxMGrYndojBgZZTFuQ1dDtBn6PBp8RE1QbmxJJDRCw=;
 b=x1yTOvs2YGXqITOntGJ0OkXC1lA9ZNfiwjqhQwwTENFruy2rVTOEsLic5UQye5dlKR
 8Rq+u9K+6AIyY+NCHIRDOPyhMa70YzSBKs41Gyr8QYn6vti1lxnn+EQpw6k4o5kBtmCU
 RBOtNvxeNoRWt1Or/McMA25Tvst47+o8h5hXFAh532ZImQ6gYZsTX2fyIAQXnxhrOvVN
 O/C8HOAh2zeyshZMN57ueNuBZeYVVU2c07OHftyM0HnS7g+M4sNvGpufJi/Zrun7PAXw
 e9DXSuqcjdg17uEh8FP9TkZXtPGKdxF+WfMfBB0GZIWQDNnOIIX38bZOZm9d2eHimsXh
 2GAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy2JRG+75WpDTPAul9tLvFn7ejaDs2Vg4I59TbQpNOJNAPWkWrRlFNHF6V7wsvUpBMAycXJoHusOA==@nongnu.org
X-Gm-Message-State: AFq9FYIZAxTSQpIY4kIfRt7rAG695+947NraEH0WGQW9/UDBRLFNvhDr
 0/6zEFA7zgjvbBntlFFOLxZ97az+YadqmlwTbg6v7o5/AgJLqkpp44o9dGq/t6/28RTX3tOreFL
 09lqnyejlkiO89fZ+EQnIVO62sJP0boC6KbSNuScaXg==
X-Gm-Gg: AYBFou3qOjAYVDv2aIIRuyw0sWl2kXQvT9V3vjllg9/PtFi8NVydMSgngPTIMibq6ph
 RZwXZVcgcI1RA32O80WGqGZwHSRBxXtH+uGRYTfFkUbGhXRp4+wrRaSErgJkiFNyl1WarjeQZFn
 Hc5jnpyNXTzfBxSaQphsRTncbn5hXExj7GwM58Yx7Z84sIehDZuGwLLQ0t2AN/7MC/ezjcbgGkh
 n6BRoa7Ub8PFY7CtKxdeh7f5YXjeBzMGrr1/Yku0YcHu0WHIhveRK6+8apkSrnvYEH22h2YDYhY
 AC9aYJNDp+vMuKN8ZHg+DdBVADF2J6dYQ+7qUrAnjH6u4UJIVcgZC+m9rTGGNiQX/z8b3YEIsZ/
 jbVCmeqNZOKHIJ+lGNnbuf+FFpXC4cRPgrCORXP6wJYkEPdDnNIBN1Iv5jwoDgKnA6NonIRgTxp
 0awrAqAsPWKmgrNSdGXGXc
X-Received: by 2002:a05:690c:dd4:b0:8b0:a352:f979 with SMTP id
 00721157ae682-8b2b672ce98mr12479167b3.29.1793366757554; Fri, 30 Oct 2026
 06:25:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030131406.461599-1-eric.auger@redhat.com>
 <20261030131406.461599-11-eric.auger@redhat.com>
In-Reply-To: <20261030131406.461599-11-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 13:25:46 +0000
X-Gm-Features: AclHuK-jdzEfOQiCDg1duKYGH31bmbdjvged0btjCWkDLRbmId0M_BvVFFcxyEI
Message-ID: <CAFEAcA9koKTMaxgAhv6qnwRr2RBdtkoJSX5dOZaiq4r0K-ueUw@mail.gmail.com>
Subject: Re: [PATCH v4 for-11.2 10/10] target/arm/kvm: Improve error handling
 on scratch vcpu probe
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, alireza.sanaee@huawei.com, armbru@redhat.com, 
 mbawa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 13:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Pass an error handle to both kvm_arm_create_scratch_host_vcpu()
> and kvm_arm_get_host_cpu_features(). This allows to improve the
> error reporting on kvm_arm_set_cpu_features_from_host().
>
> If any, the error is stored in the new cpu->host_cpu_probe_err
> field and further propagated on realize().
>
> In arm_gic_cap_kvm_probe() call path we just pass a NULL error handle
> to kvm_arm_create_scratch_host_vcpu because we don't care about the
> failure nature and just want to revert to emulated versions if it
> fails.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

