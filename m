Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FCECCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 10:36:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDh3T-0004Kr-Ni; Tue, 28 Oct 2025 06:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDh3S-0004K8-29
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:35:54 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDh3M-0004GC-Vj
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:35:52 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-63b710f276fso5758163d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761647739; x=1762252539; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gizrY68Z+Kofhqi9coAgNzzuoyGmBbdOql3rCG1koVw=;
 b=Ja40MGzATDOltsz91wRWc33Hxb5Qt4uvpnd9oRjQb1iRwmaYfGRkagan/ASaN4gCKf
 6CuHAQjh+GUkYL0dixCw6M5HevY8IWnCbpm8ZQbvnRtZO5czz/miRyTuzp/WTbx6KsgG
 zvFHuWrG73tmMASF5jveQa4a+aqsvvlEw7V1WHUVnmPs7PdAlDOCfZeZE9pemZjMeBm3
 6CHuRp7XeD+XAPO9Yn5CAcRXUaHnBN8MyUWrBWxTpgl9fPMlP4BQ0EpS3xGZTVWV0HxN
 b8PVHdbtaVElgqub2ZJGFSemd6Z+PqMIZejYNTOFBvXHv1l8eo115Ht6MkH9tm3wqdLz
 0UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761647739; x=1762252539;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gizrY68Z+Kofhqi9coAgNzzuoyGmBbdOql3rCG1koVw=;
 b=XWlWYNT4s6AdEjNdFNrMHYPm8BOwNzbuUv5cpTo1c+1x/catmQ1CJ2XGc4+Gink8/Z
 9qw6l+l7Po9R6cnlkp2LeF6ekg7+bKYNMdeRnsoqydLgjYJ89DnDbMFPgmqKxpIBhLL/
 gp71WdtcGZJiy0mUqHKubk+VTewzXWkKNTIU4zV7ZnaDCd80YO5bHB5GCiD6Iro1p31B
 VorzoicX4QCq2DYNqbrFHNODvicuwTKRCUpgqfDXZYy/4MyAzXwlhSz0dSxHNh8nXVYk
 Ay2sO3DXs9dKtZT+pT34fenrUdre64BKEopEDw5WJn1Qd54JTpjDdYpgPJKYP4Z4PbuU
 gn+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUSzbWR6xdIMjSAuuT2bfEd3AuSNJM+EryAlSDPUmWPtViVZ2bNQfPiglf8r+RM+64ePV8r/g2Vg==@nongnu.org
X-Gm-Message-State: AOJu0Yx1Q6HFftFsliDrWIQp//szhS113gqbB4s5XGpOXVfMrGY087JM
 lsi6DgNON72QX0XmSPoGtLdW09O+DcDLx5H9NZjSkSiVicfALxdK/k/jgC4VVJl62fjMarMPS8E
 PB16byLSkNSuSQzwJ1taMQ1TFDnSVFL4ITDrcA6SpVQ==
X-Gm-Gg: ASbGncvjn8S2obFiPs5CHBIoZtMrDa0Z3+5KoyAD0mLnB40jhZilzWDoOesswNfQPwd
 0c8aALr9hD/iTkuopNYV/w642RyDo+vvKFFmo/1ZLPYpPrk6JeVgy8gzwY5DIltnCdC8P2Xiqzp
 lweTFvV16+gc9BxOdWBORTWHCY3ni6ld5Yol+LFg+z5Pq52Sd4Zfqg92lFXyxbjNHlHqNU4LoUY
 KZfmc01Vu+JCfuZ70PjAHAgJ32x81cumMYfgcH2PmGhvafuiQvePt0BjDbpMA==
X-Google-Smtp-Source: AGHT+IFsB+sYbX3RdwChzFpBKhHMxXoRsRSCy8sAPH5z5LLhp9X+iPpfnwjZl6Tgv2oqqa+3lEFzR6wUiswjKxHG/YM=
X-Received: by 2002:a05:690e:1590:10b0:63f:7384:f403 with SMTP id
 956f58d0204a3-63f7384f76dmr217473d50.32.1761647739197; Tue, 28 Oct 2025
 03:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-4-eric.auger@redhat.com>
In-Reply-To: <20251016140039.250111-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 10:35:27 +0000
X-Gm-Features: AWmQ_bnJXo3HvldXhYfEAwn9mGNwu61OD4I9_dyZAIRLm_fhLI_W7oOSzNBtY54
Message-ID: <CAFEAcA8=01a34UyL6NFiiYxFP-hd5Bdi7Y0ZQqKFnO8bUX+XqQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/7] target/arm/kvm: Introduce the concept of
 enforced/fake registers
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
 gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 16 Oct 2025 at 15:01, Eric Auger <eric.auger@redhat.com> wrote:
>
> Newer kernels may revoke exposure of KVM regs to userspace. This can
> happen when one notices that some registers were unconditionnally
> exposed whether they shall be conditionnally exposed for example.
>
> An example of such situation is: TCR2_EL1, PIRE0_EL1,  PIR_EL1.
> Associated kernel commits were:
> 0fcb4eea5345  KVM: arm64: Hide TCR2_EL1 from userspace when disabled for guests
> a68cddbe47ef  KVM: arm64: Hide S1PIE registers from userspace when disabled for guests
>
> Those commits were actual fixes but the cons is that is breaks forward
> migration on some HW. Indeed when migrating from an old kernel that
> does not feature those commits to a more recent one, destination
> qemu detects there are more KVM regs in the input migration stream than
> exposed by the destination host and the migration fails with:
> "failed to load cpu:cpreg_vmstate_array_len"
>
> This patchs adds the capability to defined an array of enforced
> register indexes that teaches QEMU that some registers must exist.
> If they are not exposed by KVM qemu fakes their presence in the
> preload phase by adjusting the size of the cpreg_vmstate arrays.
> On postload we make sure to ignore them when analyzing potential
> mismatch between registers. The actual cpreg array is never altered
> meaning those registers are never accessed nor saved.

It's not really clear to me what we mean by "faking" these
registers. It's definitely not the case that we want QEMU
to think these registers must exist -- they really don't,
and for migration from a new kernel to a new kernel we
shouldn't include these registers. We just would like to be
able to ignore them in the input migration stream so we can
handle the inbound migration from an older kernel.

thanks
-- PMM

