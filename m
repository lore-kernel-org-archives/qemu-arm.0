Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2687C606A319
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D6lzvjNZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJq2m-0001Pt-7x; Thu, 22 Oct 2026 06:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJq2l-0001Nv-BK
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:29:07 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJq2k-0006vN-01
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:29:07 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8ad98c3fb15so14390247b3.2
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 03:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792664945; cv=none;
 d=google.com; s=arc-20260327;
 b=lO7KEZBmjxDDEMxa7W8ijTRruV9nyJUgRklrFpmlkj16BAJXwaCuZU2r4wKrRzjaOZ
 uduNkBDHFEFRAKs+jHF3+1BC/EYA+scaW89iqY5qyfQbjfCC2LikLXcZ/btysQiJ3f14
 nP+5gBfs8eBnBLXqVeE1qoGgI/dTK5m2R+6E/X7zfGIc/4XTaX0KL1cLiutvR7xKIc3d
 lLTWcfiCA4KcRmlOKF7dXYhmJCluC6RVYH7svVDRdNH5IVXYAvNeb+ApNdYMsHSvT5VK
 61qWlkmgLVL9xgU61PnGwudLrNdc2lY/q9Z8T6piQsJzf+shovfoyI7YBEvZY4xdWtRk
 sQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cn7Jiy+rfx7L3qxqqL0r7yhmrZU1rqORsCCwAHiY62s=;
 fh=yybO+BmavupmEY4oFu2SGb0ZkxSl5nvBxKNcegP9keQ=;
 b=kmJ/6L2f5jSYidT22KQyHjwvfFjP3ksFaJ2e944ebh34JeNcdZxLCRZo+ujkTIxtah
 6eJn2k5fZ/eWstKGlnWYDwDv06fc3S0ZBEvwZ05HbPsestgYFh4jjnRsZJBMQJbJbZ8A
 Bsxk71BjngkOOZSpeCjtB9xGv3lWO1kCt2F7v5zv8ZN+Q1/9tYtatzenhV4vLU+PDeZx
 3qNqHhRwdWjSyNsX5SbEH8MS862puc9oa8XORY8e73l5WoMnckOBtKNB0jE/IiVMNtfS
 AeigWVNNcaAW3Sk2OgW221sWvmpNCLcSSoK5ZQdDfkF1u0RXhpbT3bcTFpMVm/8XCUSm
 jmkw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792664945; x=1793269745; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cn7Jiy+rfx7L3qxqqL0r7yhmrZU1rqORsCCwAHiY62s=;
 b=D6lzvjNZd5AQEPbgQ+IUoXxhB2QfbOxlvEEAjQRYPUpTtdYv2tGzBcgXnUYzgJqTCF
 ZfL4XHGHg0gv8Oqc8m5ggK+rn1WIcnUV4Lz0qsXeHCBfjejJn6ewPR9Fa+oCuJYtNS6k
 FZFQCTt5zIzPhZqCUF7EGFCaqXR/NaNG9acVreSRwv0eV8bluBaHfw8mg3YZBDjHl1/6
 xSya1nTog9Cj/CvyMQw1KX9Nc0/2N86v6lNKMoV59z5YJSdH4ssZav0LP8anXIyRbwyI
 L4X1k8fK8M0b+u9dH+ddP2GzVU9qo+AXzjf/M3L985TIlRzAOr8eqlw/4wke70hkSsbJ
 0XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792664945; x=1793269745;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cn7Jiy+rfx7L3qxqqL0r7yhmrZU1rqORsCCwAHiY62s=;
 b=rwCoBetE85OzrwXnXnRUAOVNCy5J3paho8T+aaxvywEHv1dcaH+zFhCgHr+KHaJY70
 wCMYHlwC0vUREN0frAUOFM9eLSGLrpL25nPr/fL8CIFQ4XYTdpbk4tdmUR2paPcu64Z7
 5PRaVv0CsmqRZm3eqpR1wN62HGXtlmuG9XkcpGhuzw9YlR4F2qwx+IEaWRGBmBsuDl+P
 lCW3Kc0uagUWep6HSSrm7qtFLYtRf6lnQWC4L6+qP+yMIeJH0f6Ep49kCCEJ1dvzuS+r
 6hask3gSBX6IhM3AYIKC0L4OaIWt5FkHtGNnnA9pgxcqf+nDLBc83AgIaEW/DbS9pDAJ
 pyhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzAMheV04eGrUjJ9MrBpUmYrDQfX6Tt71mch32U1JxNLZtH3KwqN34LvondTnI59EIaK0ctqCAIYg==@nongnu.org
X-Gm-Message-State: AFq9FYKtZKs+bmkPUe3XbVRLKUOaxWvZsfQCIi/kPEWDgp0qanWnX1bT
 jacMryZmFKz8DnEVQJxLB8ojWabkO6MvEg6GSFiv/vCXd3BNyh10qWp7dP5eWbZ/0DyOXvVBT+h
 1+WJIXNTQX/wZyhM3Pcmv9Urd3AIey5k++DSO6kZsvQ==
X-Gm-Gg: AYBFou37dmMILnNLqu33cRwmiqUgWbJA1ZSd1HiQhHhRay7uda6CB4j6o2Pci7hieBn
 Xq+fZeaenBHQC6hgU2PsJJkh5C8XzFlYF/HpPx3i1Qmrx10NgCRLvR31TdQpWk5p1DdxcNo5oqY
 ATX5j0dw5VRmf4QAFSL8JR1ufZW0TNDT89mpqNPgNB6jPpCLYc/jc/wvUdjJlAyrvsvhXc/Fccy
 9o8Yce6BiTbRqyt97c/EsSnJPcWeG9SimCwur/xJT+42Zgdelz6eafxQspqSSjww1pWfPpyFtb7
 v+fZmCajaaQrnyY34lEsIGi3irFsigUPpkLRTarROptbBJmX1imm6jt5Ha1rqpNUKLVxlHImtiy
 bzmmVckw6IRhdwMjs64xE4BaCrVpmEEJbiWiU7z0bLHmLnRXQvnc6JdlfxHxPZjjqUX+TZP5CiS
 LsJ3RjhjFF1GYc/NbN5zJ7
X-Received: by 2002:a05:690c:698b:b0:7db:ccda:a409 with SMTP id
 00721157ae682-8b133c990ebmr26039097b3.9.1792664944827; Thu, 22 Oct 2026
 03:29:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261010133725.642498-1-eric.auger@redhat.com>
 <20261010133725.642498-4-eric.auger@redhat.com>
In-Reply-To: <20261010133725.642498-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Oct 2026 11:28:52 +0100
X-Gm-Features: AclHuK88Pi0Irsvl-VdYfD4usULDFkmX6lTQYJ4Rpq4T7jFaUE3PDSXIv2XVoCo
Message-ID: <CAFEAcA8HS9a3eyrs7iOE3xZ9MyHHr9w5UmReAz==yy-cgyY-Fg@mail.gmail.com>
Subject: Re: [PATCH v10 03/26] target/arm: Enforce MPIDR into isar.idregs[]
 storage
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
 jdenemar@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Sat, 10 Oct 2026 at 14:37, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment MPIDR_EL1 has no real storage. Instead cpu
> mp_affinity field stores the Aff0-Aff2 bits only and the
> ID register is reconstructed when needed. There is also
> an mp-affinity property used for TCG only.
>
> Keep the mp-affinity property and its associated storage
> while making sure the MPIDR_EL1 full register is stored
> in cpu->isar.idregs[] as other ID registers.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

