Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6858CCA462
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 10:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHf3X-00047g-RY; Fri, 16 Oct 2026 06:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHf3W-00047X-Q1
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 06:20:54 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHf3V-0002rr-7s
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 06:20:54 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8ab3d3c5761so52516797b3.1
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 03:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792146051; cv=none;
 d=google.com; s=arc-20260327;
 b=ZX/XpoaR30pe+KZCU2uKq3NqmVfYFaNIsYVvibjdlgXD/twFpvJDWwPOtTeya1S45Z
 jJf9vx2MnZA1zqbBwPGZKgTtiPG4fd1iV+EeWESHNiQL64tJBvAn7jiOV/EhzVlmVReQ
 XmbXOr43Irymliheo7R6hpzeDJAhMAOPgQB+W7glquO5DIrSS+cH9ej2ZTL8DekUqcmc
 FfMHSEKzr+U0k2rr3Y106gPFXIkkRyzeCn2YuMUXOKRLTTA6YBrguV1fTiK/NxrgAADW
 zt1YOSCUVTeu5IWHhSL2/c7jFy9BYD5Jjl5yPADgS0Y8/hk4TXN14ZFtaDaKX8CGuNUU
 2EZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+lR+yCq7Sj2LV7d8680iILAoFQX7r0VH1tOrFRtbZ7g=;
 fh=gEYKyBQ6KEo+GGzpTdTY3h0BQbVAV50s0pLnzGdCPqs=;
 b=nNgJ7TfGS4ZRIB9sofoAKGxnqJUHCW1zftqBlmMFzLeOcWJj2dyUmMAnsGlu5q3GEq
 35oaxNm+zCitDltsi9VXDaK6r72PBZyq68QSPs5UFSavtS+MA23NbtQx7OCD6W6DDLTB
 /MPCUvrQyKulDv91VPosTp2Ud4OYHt5vDHrQCnuXGmKZ0fygYL2QODU2VJ9I0POwOsY1
 4t1AJSM1yufhWlHFmHHz7rZoj4O3ip2/9q6k4LlPvGpxCGF3j4PgptXxNT1bKvj95hdf
 STWRhm3v/OJLFgsk8DWDtRnFGNoZ5e4HPSgF97E4Z/pF0q2oLGKAJuQ2B1a0FnBZMIU5
 IEYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792146051; x=1792750851; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+lR+yCq7Sj2LV7d8680iILAoFQX7r0VH1tOrFRtbZ7g=;
 b=rnl2EoNq34uDqmATu80EhNE0EkgAfyvuZPc0cK9q6s52yYOZ4hy6TfsNhq4xos54SJ
 r/1+G091HWsihX8ztnglawe1XRWyagkGHbglBtZWWjUFQrYKnvSPoHdO/01U1J8FMAjQ
 S2LS157V84f/fwNAVygKBSjt+SP7kzXoAgee71wUTvIRsfVSBvO7+JYBNgR9dYogc9Ti
 Go+cU1sAXclloK9kYsnaKr2j6tomikstNA3hU99AZKGPtqjO5oYtznTXQuAfrCR9yOhA
 YgW0dTXbApBLBNvua6qMFIkxMqGF/vGdj4ibYU6NkNl4a5C+IguGmM73kbbktQn/WnVF
 ZpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792146051; x=1792750851;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=+lR+yCq7Sj2LV7d8680iILAoFQX7r0VH1tOrFRtbZ7g=;
 b=MINNAQVRtnS0T75m53C4lScFlCMbvHCF7uJS74YCKHPlELuOcpzE4+7emxdhqzZBSM
 l7B8tZYM/dBuC+LeX7msOQy9AgnZjkKmkAnZtvCVCMb8rI+Pfp+c+2pEE/oDZDVr9wRj
 IX8ieAExuUUKAvv9jlwYn39vshMDf3K8EG6eKH113gyuyaOm1K150CAx9dykPoYN2bBX
 gtjBNxGFoFu5K8ctqEl5ED3e1jj/i2/mhHdUFIfdxLB8krSUcw00GzMEcwGrPYuW5X0l
 Qw93L56hBKbYyjcvJJUlOF9E3r43Xy9+usRMqO3KC4hTcuwlRFwn9QNuwQj8LQZxX0sK
 NrsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwA0A/v/8Ce0Ar0+lgwhkmW3BE3EYHPtoNL9PjIR78TZmkgyPqu31pd67rl3jGLXeiAS5Uoq3EXxg==@nongnu.org
X-Gm-Message-State: AFq9FYIMbhpmiyZxe8a/idwhDuSqPkJKZmJVXh+ZVF73JUSrLYiNRkgG
 sJyIsnHFZUie6ORkEIpYxyZCwLRFRfFLGkaR+WcYEO3wahYeajbrwjcsMgkxFpv+s5wicFmRZsB
 r8p+E/Nt18JyxgVbisKN/UPaoaavXIAMl5lOZf2u0fA==
X-Gm-Gg: AYBFou0j9yIt3EP6fY3LJThr9BXkGXj+gwMfjegaC55CzFiNurFn1Fb73U66DmLdNe8
 Bp+frrwozzd/b8ODt65VuOc39Ppn26gJAF4/y4YNOeZ/cNFz80SuYKlP62VPK/95GeHilrssRoY
 Nz2/qQh0ckchjk7MZUjCagKPhczKc58GancmujLUsQ2TW5wxbkhKnWc/DaQxX/S0fbKbNn3Hb8u
 Vame9sYew+iKFPY4wON3f8WGWWkZPF3kQQvbGyBC99mGT6S/XtJp3R+mx9OAVHKbz88JPKrAWEo
 ZwATy8Fdpl59dGbexR250S75GEE1Qblxw3IgaA0OwdyZU70sf4S76nmFXyhhRwJOIodJSgNg6x/
 DXnvJc5xPZtUGUSDRpxHH3Kma7ueL/+uTTdan4ho=
X-Received: by 2002:a05:690c:6e87:b0:8b0:76e5:ecf0 with SMTP id
 00721157ae682-8b07eca01c7mr85352197b3.4.1792146051284; Fri, 16 Oct 2026
 03:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_22E95650AA60C6E59860452C0D61A21F1105@qq.com>
In-Reply-To: <tencent_22E95650AA60C6E59860452C0D61A21F1105@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 11:20:39 +0100
X-Gm-Features: AclHuK8ndLRSRJrGsRvAby9xi6rLxv6SVuahyYs5pcQX4zLAV6e0Eey50G4DPd4
Message-ID: <CAFEAcA8MyrqWC7=A5Bw0G5G-2J64iTLmfY33dNDLm0jvmRb+Eg@mail.gmail.com>
Subject: Re: [PATCH 00/37] Add Arm MPAM emulation
To: Jinjie Ruan <2118537295@qq.com>
Cc: anisinha@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 imammedo@redhat.com, michael.roth@amd.com, mst@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 ruanjinjie@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Fri, 16 Oct 2026 at 10:47, Jinjie Ruan <2118537295@qq.com> wrote:
>
> From: Jinjie Ruan <ruanjinjie@huawei.com>
>
> MPAM (Memory System Resource Partitioning and Monitoring) is Arm's
> architecture for partitioning and monitoring system memory resources
> - Cache portions
> - Capacity limits
> - Memory bandwidth and priority
>
> And MPAM is the Arm counterpart of x86 RDT, which Linux exposes to user
> space via resctrl.
>
> QEMU so far has no MPAM support at all: the CPU-side system registers
> are missing (a guest kernel that probes FEAT_MPAM takes an UNDEFINED
> exception), and there are no Memory System Components (MSCs), so a virt
> guest cannot exercise resctrl on Arm.
>
> This series adds MPAM 1.1 emulation for the virt machine,
> and the structure is as below:

> With this, a Linux guest booted with -M virt,mpam=on (plus NUMA nodes)
> mounts resctrl with the full schemata set (L2/L3 CAT, capacity, MBA,
> priority), and MBM bandwidth and L2/L3 occupancy counters track the
> configured controls.

I guess my question here is "how much is this actually doing,
and how much is it 'we provide enough software-facing interface
to keep the guest happy'" ? My (rather shallow) understanding of
MPAM is that it's essentially adding tags to memory transactions
and then accounting how much bandwidth each tag is using. That
seems obviously infeasible for emulation, but on the other hand
this looks like it's rather larger than a minimal "we provide
the register interface but it does nothing", so what are we doing?

thanks
-- PMM

