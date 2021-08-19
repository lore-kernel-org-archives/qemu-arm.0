Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp327271lfg;
        Thu, 19 Aug 2021 06:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhkLNnQ2o4T71/8EQN9/EiQmTU872szM2La2zgKxHywtOPBrfvRac1DsabdHk0feAbBhw7
X-Received: by 2002:a05:6102:150:: with SMTP id a16mr12353255vsr.50.1629379703560;
        Thu, 19 Aug 2021 06:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629379703; cv=none;
        d=google.com; s=arc-20160816;
        b=bxykc+7PJMWHNm+bBRa901QUa0lgq4Z5dGcNhCcc3zDRes9norLLlQkLpPlKG45iJS
         HpU5E8IsNlw9HLbDfjRPW8zeEQdSQue+dLkzRZTZNFC3RBXF8XuaaGDQZMLat9lJKvdR
         OBWxy5JkphthwNHmTuVCvY8ez9RnL8sTS6Q/9gorc8HQHmFdm0lSOrBAGNKjTrDJQVyM
         wuyEiUxkQdMLUOB/kb0ve1f6+BspSYNk2FK8drfGDJUtVUBBb+w6SDwcJqfrbkMYZ4zo
         tguE64ml07QxUDQ2ZDYvc2q7Frp3HLVP/yqPBab+oua7NeZLio2G1M++oTboiUQhECfi
         j5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=byfOvag5+5Wjtyv1JqsS31vAuP/a2Iq4KlJVIZBKMOw=;
        b=wOk0Q7JgGa94rniha4I37qiG44fYmdvNNp788fOGU3fLvC0d1hV6kqdUv/Jc6JLSNC
         kWehMWUkcd3Xsr86YRTAcqN60zBG0CjiN9zvWPvdtvce9feBAB99224EYqV5Ewopz9UM
         afFvuTSXWVrREF0HoX5ItWdq0udIaKSHctCvDRgUjuw0bC6Sjp7CSvrq5RpQXTY6W8T+
         vKUPEhLtZr3gRToEm1+bM5Mhg3DCD7zSSuZg+8+yC50hld/K0SoFaTeKa0levhI+/Mqr
         JhAoaXOZWb7KYXliYF19FYEytja8q+cGt4bmBDIQLwwhk/a7wx+HjWe1zFNGbpi/MoS4
         58ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cjWeLE4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si1891814uap.70.2021.08.19.06.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cjWeLE4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGi5m-0003RO-T4
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi5Y-0003OV-Lq
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:28:10 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGi5X-0002Eg-1d
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:28:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id i6so8923653edu.1
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=byfOvag5+5Wjtyv1JqsS31vAuP/a2Iq4KlJVIZBKMOw=;
 b=cjWeLE4VFPbNSeNj861zjd6kixSvGADx1wqCPBcmMDZ1j/X5TZ/3xs04Hwg9yKxNqV
 I8FIHwPvxWZ066rJo4ycU7oV8ESpgPebBkKS055/H130jJfiX/0305b/qXg1GpqRcatT
 APNNkVvWung/m9xhUuzrtentge9knDLA/l9nR5UVxk8W0o3/0OQrzCBEnjJ9EcUDw9dG
 vgPv0AJhO3Ui88KSSCVOUXZOsoIlBMo9joHQF1GnKpIhw7Rk/QEtr8304wcfvrhmYMsA
 DN2BZX2S+RvjUaYu5HfLZlXtoYjGAZVZTx88fjEQ4gcoiASUBDLowoJejtehJw7xpybL
 jjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=byfOvag5+5Wjtyv1JqsS31vAuP/a2Iq4KlJVIZBKMOw=;
 b=ekEZNMmqt9p9LhPi1yhsP55tW/5GXIxjF86B8LBX198IYKGtF8NsA1NBUFeaJ+u6XM
 htlnJfVPoZyfN2HqgzWnCyrnDCkxJvwBDiM2yWHZoBlt153N8kxcRb7hJocMHwY4TyqU
 yTkYzq+5s/zrLbqCkv7S72a0WlSq+wn32+3B7L+4PjggCqZSTq/MczgOkzzZGB1Po2Me
 v13lRzr/wX4R7Kqw8rsI/Rs32mk+S0fMCLQYQvFrJ1yg0vDj4MKlAEyiz1sbx2HXWIXn
 HO0X09qDU1O8/A2feHPmgcKVKdkPDGUVC2CSrWHk+0h7P1BfzJIZXuuQr3edyiEH2we/
 98hw==
X-Gm-Message-State: AOAM531DEJxGy82GqomEiKyAxRH6TikgyjUeVsi7GqtDq+XhxqI1bjgJ
 XuA2j8Ryq1RIMsWtXbK2/AM7+jyAxsZpuDte9Ck5PA==
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr16283113edb.36.1629379685438; 
 Thu, 19 Aug 2021 06:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:27:19 +0100
Message-ID: <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uA+3MCBE414Y

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 79 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 4 deletions(-)
>

> +static char *sbsa_get_version(Object *obj, Error **errp)
> +{
> +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> +
> +    switch (sms->version) {
> +    case SBSA_DEFAULT:
> +        return g_strdup("default");
> +    case SBSA_ITS:
> +        return g_strdup("sbsaits");
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void sbsa_set_version(Object *obj, const char *value, Error **errp)
> +{
> +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> +
> +    if (!strcmp(value, "sbsaits")) {
> +        sms->version = SBSA_ITS;
> +    } else if (!strcmp(value, "default")) {
> +        sms->version = SBSA_DEFAULT;
> +    } else {
> +        error_setg(errp, "Invalid version value");
> +        error_append_hint(errp, "Valid values are default, sbsaits.\n");
> +    }
> +}
>
>  static void sbsa_ref_instance_init(Object *obj)
>  {
>      SBSAMachineState *sms = SBSA_MACHINE(obj);
>
> +    sms->version = SBSA_ITS;
>      sbsa_flash_create(sms);
>  }
>
> @@ -850,6 +915,12 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>      mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
>      mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
> +
> +    object_class_property_add_str(oc, "version", sbsa_get_version,
> +                                  sbsa_set_version);
> +    object_class_property_set_description(oc, "version",
> +                                          "Set the Version type. "
> +                                          "Valid values are default & sbsaits");

This doesn't look right; where has it come from ?

If you want a command line switch to let the user say whether the
ITS should be present or not, you should use the same thing the
virt board does, which is a bool property "its".

If you want the sbsa-ref board to become a proper "versioned machine
type" such that users can say "-M sbsa-ref-6.1" and get the SBSA
board exactly as QEMU 6.1 supplied it, that looks completely different
(and is a heavy back-compatibility burden, so needs discussion about
whether now is the right time to do it), and probably is better not
tangled up with this patchseries.

thanks
-- PMM
