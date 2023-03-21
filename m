Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4070045ejb;
        Tue, 21 Mar 2023 06:35:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Up583rbVK2yIrjBWaZABL5algybNXMnXuhTOwYZj9KSbIVOTOkuYfkQVlLqy6SIV+Pa3t
X-Received: by 2002:a05:6214:19c6:b0:5b8:1f61:a20 with SMTP id j6-20020a05621419c600b005b81f610a20mr4266332qvc.35.1679405737144;
        Tue, 21 Mar 2023 06:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679405737; cv=none;
        d=google.com; s=arc-20160816;
        b=zJNCSFdKxpd1Y/125lrNgRR6AZ89DzYKdgk46YcP2X87ugaqmwMu3bUmVL71R2HI0i
         rxjBUN7Mcs1o80+WwNQBw2he6N/larmiKR6nGz/rZdFqiNiTunRXtlhMfMIIJW1SH9tO
         SCxhN/VuLRXm6xpOYiiXdgbN7BJ+gFfxgHSngjempYgHPmpV6XcPqEl/VT8VLBmrAx5t
         wTlnQO1GMwaMKX+4fqTpppxvYR7udR16Nj7Lkvdj/ZBqKLl/t+m93fyuNLZdoSgxCMw3
         2VCIhuTXhxAGlHGdexodTnsMlwxpcfUGcak3MtFWAzonsAb6L0/lAcD3CJwBDeTOKMxD
         AW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rGrzFl5Bhcl+a4kQ8MCP6bco7fvFT4woifSqH8nXkvY=;
        b=TAbpldIPBxW2QscF44CVZpB1kC5LIyj23Bc5gHpvGDDVQEBXYtVLLdhBilcPBIwTow
         5ar8kWJk8ri1I6FhK+lm/JnXOyJ5F08GmDWBzjGLy9RtIE0r6Tr2XDhLMYgA/a3BQgTs
         Hv35k3VY5KsomBNsr6u9DGS3sieIG7ydQiaLA9xQBArcMxlmZGEzCjM7wozbLyHdCuUQ
         UXKyG8ZEy8R6P4we/L7SPvUXiYpqSeVYVVChkIhnKvnvtpBiAQGMbBMamEL7o/piBn7f
         a7ENMs5LzXx2f9cKP5OzD+YwBt6CDp6MvfzTGz4dcJl961xczWmzl1ZMEJSfgTwfT6TA
         Dq1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m31IgdDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ek4-20020ad45984000000b005a1900ab5e4si7925870qvb.223.2023.03.21.06.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 06:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m31IgdDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pec98-000870-EN; Tue, 21 Mar 2023 09:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pec8s-0007wy-Sl
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:35:12 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pec8q-0006aE-To
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:35:10 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so16305627pjp.1
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679405707;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rGrzFl5Bhcl+a4kQ8MCP6bco7fvFT4woifSqH8nXkvY=;
 b=m31IgdDCbgsz2GBhh+HP+A65A2xxv87w2KJTWCA9OxP3PGZG3FVYGjKBhQWpeGmP92
 Vrf68FomCrxE+HPejB2gpQsgRPFIQ1qO87Nqfqu4pYTjJw46B/xWOdGwnjBxwemI3BfW
 gY0yPdTxHue28iuHrOZnL2Ig5uzHdqEdgqtef4I+lsb+dOURJFrvkSu49jvQmuIl61af
 949ZlJQwZQ0LzdRDZBd6XPG8iqnHiKtBI/52WWOg50x3KPc2saciVY4waEVHQpR4st+Q
 FidbvBJbLY3XRG5vLIn6TZ+dl/q3APbN5/203Y4tAZtolD0orhsbSk4HJ2Ohqk3XgLw3
 Iabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405707;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGrzFl5Bhcl+a4kQ8MCP6bco7fvFT4woifSqH8nXkvY=;
 b=6IK82DNE88he17JqBRLA5dF085Zn1HjTWyVD/tD2kSbgzZxq2CX5W8aCn2BUoPLkQe
 9RkOfWpLe7sitD/SEQbckwDG/WGTo2yHaM6oJXu80Xhjux/WRfz85RqHEQg95AxWMGYD
 BRHfd1/gs6ypGnRuZUUytwUZUuGmtZNQn95hDjIxSzB/qwQq3xRB+X6U95mtIGtjvyRJ
 FsHIiLmwOqQ/EmEzSmBvXY1YWTc7UIlvszjVpGomTVNrEBMmhY9Iu1+Z5PRplDyfK4H1
 gFRe4m5ncr3QCbqBKFYP946a/CzDpW4n/WU+kmC6OeTZm3zRt1uSMNbkVwwAHFl9ZSLj
 jsaw==
X-Gm-Message-State: AO0yUKUp8pmyOSQWE0XGixRFNScTlsyjIFer44yg1Ea4Qdf5fGwFY+QS
 4mUWudkNA9ngcVELwbA/qgKTZ+ElpRlXRZ+4x48vSw==
X-Received: by 2002:a17:902:efc6:b0:1a0:4be5:ccea with SMTP id
 ja6-20020a170902efc600b001a04be5cceamr908559plb.9.1679405707245; Tue, 21 Mar
 2023 06:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
In-Reply-To: <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 13:34:55 +0000
Message-ID: <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
To: eric.auger@redhat.com
Cc: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1C+H+g/pLRqs

On Tue, 21 Mar 2023 at 13:23, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Mostafa,
>
> On 3/21/23 14:06, Mostafa Saleh wrote:
> > Hi Eric,
> >
> >>> +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
> >>> +     * size.
> >>> +     */
> >>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> >>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> >> is this working in accelerated mode?
> > I didn't try with accel, I will give it a try, but from what I see, that
> > ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> > accel/kvm-all.c, so it seems this would work for accelerated mode.
>
> yeah I ma not familiar enough with that code but it is worth to be checked.

I'm a bit unsure about fishing around in the CPU ID registers for this.
That's not what you would do in real hardware, you'd just say "the
system is supposed to configure the CPU and the SMMU correctly".

Also, there is no guarantee that CPU 0 is related to this SMMU in
particular.

> >
> >>> +
> >>>      /**
> >>>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
> >>>       *       multi-level stream table
> >>> @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> >>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> >>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
> >> I am not sure you can change that easily. In case of migration this is
> >> going to change the behavior of the device, no?
> > I see IDR registers are not migrated. I guess we can add them in a
> > subsection and if they were not passed (old instances) we set OAS to
> > 44.
> > Maybe this should be another change outside of this series.
> Indeed tehy are not migrated so it can lead to inconsistent behavior in
> both source and dest. This deserves more analysis to me. In case you
> would decide to migrate IDR regs this would need to be done in that
> series I think. Migration must not be broken by this series.

Jumping in here without having read much of the context, but why
would we need to migrate the ID registers? They are constant, read-only,
so they will be the same value on both source and destination.

thanks
-- PMM
