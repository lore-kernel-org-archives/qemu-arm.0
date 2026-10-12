Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5017DCA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 12:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGFD7-0007GB-5t; Mon, 12 Oct 2026 08:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGFD3-0007FQ-HI
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 08:32:53 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGFD1-0000CW-4h
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 08:32:53 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-66fca0709caso1359496d50.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 05:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791808369; cv=none;
 d=google.com; s=arc-20260327;
 b=gCxcmqlAGNn1SPnGWJB7gU7xoGjGnIoF5HF2jIqQfTb/1r4lcVQQaVqsgNnB3qE4qM
 N2tbLa5n+27Fu0VJfJ1QNwYb2b/1ooors3otX8NB8r3M9ArunzwN61x889VQdP6ludKB
 /sQ17RCRVC8m1AO9vQWz7lFPM8jwR1NSLrO0ROY5iwgN7qxJZMP5KL2j5taJZxz/BBgO
 3kpMsqMNlCdrXa1hzjvOTXF6b2+rvJ7SApLO1RDruo4P0pi2VwaTDgYUNrh/pgCcev7I
 oUR8qFZIAkGRk0rqTchReu/TbPs3pBr/beza5d9SfdxLtlT2zOOXdmbnBJy2Px8qx9Rc
 pUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=46d0qPPxK7zwjPUS5yP8stjzanBYFETDa9PZ8JIKsoc=;
 fh=ur+1WgxREHVx7q9QXrfAkVO5C3bmOdY7e6KlrRW9p9o=;
 b=OP5DIC+S2vZvB7sneRih2JVBXUQIOMxiKXc9XRmE1q4xSokIurDkOrVKmoBEiEn8ge
 9o5D6q2i7WbZvSeQtQ6w9PeZnh/z/UfHa9qKxwMas0UANVhEBQPEn6SP87hgNaQHP64x
 iFTbBOHOMCDh4ZDIA1Y0EDNVJfI2GgZb1q7o2fTEMppCThU4GPz3ne9UixPmvxRGttZA
 0m5Yb03xCiscjTJliv5rsE+ft+HulBq5sHHcgG40CBlJDu323+6usBIFQfXShs0S91Gw
 PTHsb6WAD7R2bLGwMBxa93eTolsbI0e+9M76/ghgBeH4ye3k6Mh1+ajnFBrhMaFi4rRX
 GRaQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791808369; x=1792413169; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=46d0qPPxK7zwjPUS5yP8stjzanBYFETDa9PZ8JIKsoc=;
 b=IKh3fTAaJcS1F6AT3xGpQMcvCsvYLfbKLbE2IGirOdmQjDgaOwoD+zBGTk09ap3EfN
 JZWhfc6sCFEGq9S3AFvahM4RpkmBV0fhOFbwfT0mIR9EtkUZBX/BAZNfV7KUoapnk8cZ
 mo384sILcipAgc5ygbcWznPkR9jyor8wFP/5X/jMmlco/wMAMIx26jswUJYGNCJ7nNxw
 OkZL5zLTB/R1utUT3aqEkxKeigweATUHmaHCAz1M/s5bJ8VWuBG4Vt/rLFj6eF6RmhC2
 nSt1ugJlUCRCVSHeGDQZhUeTCCIgvzigFXEHsWJC1BugUCgC6jGPUvraFriYgmEBEK+1
 9chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791808369; x=1792413169;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=46d0qPPxK7zwjPUS5yP8stjzanBYFETDa9PZ8JIKsoc=;
 b=dMAD2OKPqK1IB11G9+sxveXLF+3NxRstETvVEVM+tIz5ON2XdTaxf8NTeF5vcoA3dc
 TQTkrm4LynMKuUxpyl2k1NAKHACYmj9QxmHHeX+0K6nR8c0G7Tc+Glcxxe4KR21nkIBX
 9UY3xEwuD+4P+Af6qNVqtJHDERZFUEvFjWZe3iHiSqZsFuB5wlN5mraBvKxXMEqXVLvF
 IdCEruhLqYLq97wnRObxP/yuBlo809QFhLAudQROoxUiEP6T36iUnaCE+2GCecgigE8H
 k/pgOX4igTzQSVBSFs/6XdSieQNPeguyOx33QBLzkOyUFD4WwxFlE/OTYl4jDpk2kSLq
 wkiw==
X-Forwarded-Encrypted: i=1;
 AKwUvBymn51nYPuxidB4jTKbyDGqYZrE11yLky0FNU6OtiYv/K6kI8Zzb+2nvoWjK9IzYrUfHW3KCQtt+g==@nongnu.org
X-Gm-Message-State: AFq9FYKXSFl6Hu720LTQ8IxP/IDZZ7vQV+FJ7Zva4CPLa0fQYbxS/w8x
 Mrg/+aO/hf1hURo1p5zNcLfTLWByq9treLy52SEVAXsQPDbC684527tpowJR3CJj4Dweu6nTVnv
 1De/y1MVKQpnmFAz2f19BO6yiyHCOildRqpeCE3iiYA==
X-Gm-Gg: AYBFou1ae1rTY5iI39Hda1/gNDJ+5UV1ip3f7qHyEK3WcaxzAIqDshZNFGNTmGrwWd1
 vnrYOnVfhk6xIHQcG0OpmHsN6nHU+5rXiCx+B+tH2yYXzG64XNXoZBrcAsxdIj5T99N/hUa+us0
 6gTsbtimgZBmI4IQmymLGWmXOkByGVxewUbYDG1pp6eacnNNQmCMhks8HeSEhGD+1rMArXiIuCn
 VZlZ5rVOsRnMkPCGwYkQBx4Sl0Qva9XXMnKZXjYU6uCxKL9G+vEdJeUTsbAlnCiwaakCiML4pTX
 3i+D/yESZpEFCJAyoimj38uT5CfkI7DYCmfeui530TovwCSJibjlGz7MGniTrb+vf7CDh0GAzrU
 diel+bEGIXS3Kl2yuCvxL51veYmALpG2InPxr8Ls=
X-Received: by 2002:a05:690c:6e85:b0:8b0:a352:f96d with SMTP id
 00721157ae682-8b0a352fd2bmr11739437b3.11.1791808368621; Mon, 12 Oct 2026
 05:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261004090500.3082641-1-bin.meng@processmission.com>
 <20261004090500.3082641-2-bin.meng@processmission.com>
In-Reply-To: <20261004090500.3082641-2-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2026 13:32:34 +0100
X-Gm-Features: AclHuK_MFJQiIRUZ3pR1LXKyfoDcxnnCZt20Dv1-e5MwI9M5YrjOpKmiVHOg3fc
Message-ID: <CAFEAcA8AMsN15gpeQTOR39w4uhVAWsfa44drHgXP8NN+pYSkYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] hw/cpu: a15mpcore: Model the reserved page as
 RAZ/WI
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Sun, 4 Oct 2026 at 10:05, Bin Meng <bin.meng@processmission.com> wrote:
>
> U-Boot's shared i.MX6 identification code reads PERIPHBASE + 0x4 on
> MCIMX6UL-EVK. The first private peripheral page is currently unmapped,
> so that access causes a data abort before the console is ready.
>
> The GIC-400 register map reserves offsets 0x0000 through 0x0fff and
> specifies read-as-zero, write-ignored accesses to reserved locations.
> Model that page in the private peripheral device.
>
> Reference: GIC-400 TRM (ARM DDI 0471B), sections 3.1 and 3.2
> https://documentation-service.arm.com/static/5e8f15e27100066a414f7424
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>

In the interests of un-stalling this, let's trust the in-practice
observed by u-boot behaviour over the TRMs. I have some code
review comments below on the specifics.

> +#define TYPE_A15MPCORE_RESERVED "a15mpcore-reserved"
> +DECLARE_INSTANCE_CHECKER(A15MPReservedState, A15MPCORE_RESERVED,
> +                         TYPE_A15MPCORE_RESERVED)
> +
> +static uint64_t a15mp_reserved_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void a15mp_reserved_write(void *opaque, hwaddr offset, uint64_t value,
> +                                 unsigned size)
> +{
> +}

We should make these read and write functions do a
qemu_log_mask(LOG_GUEST_ERROR, ...) since guests accessing
the region is a bug.

> +
> +static const MemoryRegionOps a15mp_reserved_ops = {
> +    .read = a15mp_reserved_read,
> +    .write = a15mp_reserved_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void a15mp_reserved_initfn(Object *obj)
> +{
> +    A15MPReservedState *s = A15MPCORE_RESERVED(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &a15mp_reserved_ops, s,
> +                          "a15mp-reserved", 0x1000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +}
> +
> +static void a15mp_reserved_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Reserved private peripheral page";
> +    /* This device is an internal child of a15mpcore_priv */
> +    dc->user_creatable = false;
> +}

Defining a whole new class is overkill; just init the memory region
in the a15mp_priv_initfn() (it doesn't need to be a sysbus MR).

>  static void a15mp_priv_set_irq(void *opaque, int irq, int level)
>  {
>      A15MPPrivState *s = (A15MPPrivState *)opaque;
> @@ -43,6 +81,8 @@ static void a15mp_priv_initfn(Object *obj)
>      memory_region_init(&s->container, obj, "a15mp-priv-container", 0x8000);
>      sysbus_init_mmio(sbd, &s->container);
>
> +    object_initialize_child(obj, "reserved", &s->reserved,
> +                            TYPE_A15MPCORE_RESERVED);
>      object_initialize_child(obj, "gic", &s->gic, gic_class_name());
>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
>  }
> @@ -131,6 +171,12 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>       *  0x5600-0x57ff -- GIC virtual interface control for CPU 3
>       *  0x6000-0x7fff -- GIC virtual CPU interface
>       */

We should extend this comment to mention why we model the reserved area
the way we do, e.g.

  The Cortex-A15 and A7 TRMs suggest that the reserved region at offset 0
  either will (A15) or "can" (A7) trigger a bus error; the TRM for the
  related GIC-400 documents RAZ/WI behaviour. In practice, u-boot for the
  A7-based i.MX6 boards tries to access this space, and does not fall over
  on the real hardware. So we model them as RAZ/WI.

thanks
-- PMM

