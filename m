Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E423606A31F
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n8lEY5SR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKDhq-0005HE-1L; Fri, 23 Oct 2026 07:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKDhn-0005FN-DI
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 07:45:03 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKDhl-0006qz-N4
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 07:45:03 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b06c0794cfso7444897b3.0
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 04:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792755900; cv=none;
 d=google.com; s=arc-20260327;
 b=D96c1zrHzbPlT2sz5DUu/1fWPt51SQnrXXTv1zKjvp7mBSYsrknNSWaXhpaizhE8dz
 tUzEhRQ5NkKLfqwJ+7ee4ULZR30deBM5ReHV3dJ4yrbAMhNr1VlZndauv7PP07M8zVpE
 FUzaGj6dKoiVQiF+q7mzI4BzfBovnZYeE/H83+0YjXi8n96IEROiEx2M3Vz6Wmlx49PK
 ApPLK7sEuV+ttw5FOI1qqo2S1PQIic/Yv0pkxLwBV3o+UCJpQQabJjvYHLHKULkW8oC8
 rphiv65vqkKuM2sdzoznqjtJN3UAlUYTbBpbSWi3hmGpggoNRKDuTfgcipZFmxQTdH0j
 0UfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LJ3/gGSXFuZez0qoiMtJBNrT34Y0qC3xMuJpLq2A+6A=;
 fh=m1iDZ1XuppEtc2cwKKUq6RO+UH3WFzrUAw8UARcWcKY=;
 b=RQtVnIkhivK42o6AfWusbgWSXB7Jt52M9t/9G8il49DmSw5qQSW6WVpLL0xncW8KxS
 WNDf9lwT+yjjw17na/SspNrc6c9zZuZoxTUwSu/UY5U9AZIOXJggRFVozbPTyqUtf+X1
 DN/+0oRHFt2Llb/SlO3VTZgZ0zhZSqeE2VVTlirVdeenaqVI5kuLCUJ5GUdBVVbcjPT7
 80VgboOosmHWeDb/4h0J/BzQYq2QKIyKKueNU2QxlUtGIGyBGIdEHD7FRXRaoyaKMzDy
 T7pki2ptgKQsAI5LnLrVVl4V/3L+TR7tFa3ZxwQPRbZbRv50IU/yKjeWTiTkwsN5NapS
 ETZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792755900; x=1793360700; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LJ3/gGSXFuZez0qoiMtJBNrT34Y0qC3xMuJpLq2A+6A=;
 b=n8lEY5SRDepQHCpTEVODa9eThVaZwnc4j/kCYFBlKIsHx5Kx3U8C2BHf2ZIC8S8eeN
 3u8id2Y51/b7VPf5hW0qMjyl0JSDdQSCGLZEM7tx5bE4nxIlIjYNVLs+VvXfx/kQEc61
 lsQMjpS7UICdVHq+qrPenLFyVD1JjH8I5v1oHncGtZmv/WN6+4ZS0ZyJyQVq+ih73nAv
 bgAztgATlm7eIIIuyuyqufk6UeQittR1HQiQrn+8FZwa87gWQ1PLE64cHHhYcKwiMHQi
 N2ktDOduwMcXTM3/c+XBd+MrK63RvrnEXk+7/kTFPIgYaYKJfZzzwwjdYRmhC+whg75l
 98bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792755900; x=1793360700;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LJ3/gGSXFuZez0qoiMtJBNrT34Y0qC3xMuJpLq2A+6A=;
 b=VmNntgCyOnIrLxVPgyI4C4X9xDuzHWucrDVlLggv3wu3rCkd2MTqzHD0gU0dPRsG2q
 iIErhnWFSwwDbdgPBOk3UhUt6mEE4L1wNUPSuLi+nxc6sikFCDMDgb+cMettHlquF8MU
 ohfExrwZLDsKVNs/EA1s6ZeoW8uU0UujLrGFOkikgCPSvTYwkpjLMZxVbvHpOc1O615r
 TFXrktvuTJ4Mb5U1fkJEaabn8kEfVv84bioDSExgZ/msBny8XAoyQeVW2+a2dqyt/BjO
 QI1bVWMWwYhoQuf9GAx5RQC33YNkPDVzyrhRbEgQ4iyyVJ3KGEQnJ4KfFzig6F46Tz4a
 cr7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAf+nGN35zgJ+cwV6+5vnjFsuCf2h30xq+4/kZrQOcNQFixaDOuStFx+QT7Vyqbrx+Fx0aSpoySg==@nongnu.org
X-Gm-Message-State: AFq9FYJN3oK9wbRDvJ6kw+BzFHXAucOIAq3YHHXUOGRKA6exSnF0o0Po
 T2na/BPoAYqboHWMn0m/Jz/9ZHT6a0OXd950vJiV02+pkGFm0JuKaIqoXDRnfSqS7Q6wyMX5fto
 cQf+cEtsjc1AvJqFp5eNUVYJ3gmsMA3LcV62Ge8IGPA==
X-Gm-Gg: AYBFou0GYhTLhdJOKuORHsaflH6fac6ZsefLLCFx6kusNEbHkWgqAaEhJ8Km7+sFzfJ
 REhVTn/krWyycLCPnyy4cFb7b+3AwQkamu7p33TCYK/lKi42XP4Hrb35nIkcuVg+2JMHpRai5U6
 mqSGGqllFDyEJkBhJqdSccknCBbq4R4HODrIEMEV3CKv+nTmD9limBUN1fup4ec0InEFr0Yhk2k
 daxUBuBsGf0uToXzhjhe8wDaBe0RvgomI1wqh0YF22wOkcxO/+mU4xi+Pfza/qHHkcF0vfRpLIS
 eNSwVt6r9PAu0zoJT09QWp9iag+yrNAlGaTqNLcqogr9Ez2Mmdic3tTL/ocEXi7fVAOn/HU/LbM
 /6vwxFztAW2WYB/w5RA50Dxwi0iKkSccD/W8X5CoUJdLyo1hS6WgXWYovfquxk7qu9dSBWzHYPh
 BgMJJQqaZ2OLZBeE1v+kq0
X-Received: by 2002:a05:690c:7108:b0:847:d0cd:11eb with SMTP id
 00721157ae682-8b157ba2d78mr17589257b3.9.1792755900069; Fri, 23 Oct 2026
 04:45:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261010133725.642498-1-eric.auger@redhat.com>
In-Reply-To: <20261010133725.642498-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 12:44:48 +0100
X-Gm-Features: AclHuK-SOddt72tpNNxsXJ62VuaXNgbTq3dc6W6MUQby4pa5991PP5qOVGNvpWA
Message-ID: <CAFEAcA9XE0TLxp+DNzFSbkxbj7f0M78N+tf1a01cJ5rNkM7NBA@mail.gmail.com>
Subject: Re: [PATCH v10 00/26] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
 jdenemar@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 10 Oct 2026 at 14:37, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series enhances the current host KVM model with capability to
> set writable ID reg fields.
>
> Since v6.7 kernel, KVM/arm allows the userspace to overwrite the values
> of a subset of ID regs. The list of writable fields continues to grow.
> The feature ID range is defined as the AArch64 System register space
> with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
>
> The end goal is to get more flexibility when migrating guests
> between different host hardware. This series is a prerequisite for
> aarch64 named vcpu models.

To help me with review prioritization -- are you hoping this will
land for 11.2, or are you expecting it to be 12.0 material? (Given
the softfreeze date is rapidly approaching, it feels to me like
12.0 is where it's going to be.)

thanks
-- PMM

