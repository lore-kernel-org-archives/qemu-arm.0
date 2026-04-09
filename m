Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD92AEA3C55
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 12:42:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAohA-00011V-2l; Thu, 09 Apr 2026 08:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAoh1-00010O-Mq
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 08:41:09 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAogy-0001kt-Sj
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 08:41:06 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-65006c99d38so943945d50.3
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 05:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775738461; cv=none;
 d=google.com; s=arc-20240605;
 b=f31jOKHDCsa9Cje9GmGFhZuRF6QBcpcC7fP+R0UiFKJzwGOIssZ3cSPunVDwSL7clT
 nB5TtyH3FbgaFKcLSJYLxk6pMR0hIk+gB2hZavqMdR8LUsh+PfR3MhQmc1D75V2bT/Nu
 0hL1Dsdj3/Q/3REN32UZei1VaBZsME1wfwxwMJrtyFs5zHsRy+qMPGSzetkFlh2tttSL
 HaMfFAWkHA4E2nbt3pUJQApkvXo7+8e+C3O18EZpuWkEr52ouU1TIUNgcCTNwd7bUNBF
 pjXV1+NRDFJLiJD/Y58Mhn15FLRqqwviD6OOsOR5VPZcIfgzG642W89HrVbVmczVX6Uh
 7L5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eUptSgV8Ish7bZ12PrthyWlod2roFlHWVdsxpwFUN9w=;
 fh=oGNKXGmUwRlA9y7zPXEWUVMXRCk49z4Qsz3LwiTiKR0=;
 b=DoI8zjRPGak2eyZ8BB8A2fSXc91Ai4vWdIv6nTxUj8CN08HS5079AZgKM8ewU8IzUE
 7cXE9rYxxPlvs1CvoUy8KGrEfru82bb6pzc48lDX1SApZppUcGQCqexG7qu1LoxhavJh
 3x/emxm8OHgXtslUoWNs/y2QExRh9dOAtzjSJwA2Hf45AZrOp7/FA8Ju7Xh5CAbFComD
 jsZgOT3Q8Y1dBvnRMf49vdH1UdMWR9MjNv03vNL6N6xqboMV3s3yjy+3uuZuLmpNot2q
 ynS59TACrjGAsXwYFF7nFwG8I/xZ05BxgJy4byHHmtLNQgTEkUTQbGH1DBzUvGU1wJm8
 LDRA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775738461; x=1776343261; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eUptSgV8Ish7bZ12PrthyWlod2roFlHWVdsxpwFUN9w=;
 b=iN7rHHu4mthp6JktZh9JXo22IP0vsgGOkM76+IruMbhje++/ZClEzRVO52afM6av72
 fZQB9azc9zgDy+njs4/qnGy6xCSigsZAMYstNZia7sRQEaF3jJlnLbruC6KIfwRgspqq
 Mvz9pMJDlfOV9MCIaDHQam5sxWQfP2fnzKKxd48YhuAKMHA/FmQdeM6B6BeB2n9F9IOO
 MIzVAZBt7o2ubq+mmA0KW8Mxl2Zl7KZDdHymfhuECU8KaFXt6uEAIWVIQyQfrG0tfuCK
 RK0LMILUHkVvojCu5sd9ui1jMAcq3K+gxLX6PZ7xTFlDRtxSLTaJ8nJtFQiK7VwhWJIR
 qBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775738461; x=1776343261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUptSgV8Ish7bZ12PrthyWlod2roFlHWVdsxpwFUN9w=;
 b=j70q/R9oj60j+X7UbOJBXDDLIlPx4kLl55i/6DoRnsdJXdaf8EE1ShyO0s5aB4WfGe
 lzXOTjzpo/ocLctBpCbtj9Ih9OVAoNU3i+HWRPHbGGckt5eEGn2L0cq0sgt5aUZ99ygS
 2Mih4ww+GOqKP8u7AbgGe9nyHDdlH1AtOyGvI1rV9hBo9bFQbk8OIQT053gCll05S3Qk
 cIcCb0QNCP76Azz+lcS19EAhrlNawxPncOqbuDlFDdEETbbmVPIIS0etWx9w5/vVBrg9
 v71+Goo+jH+gxlds/OnV9jkCqpH7AsyrlFzw062P9Gt7aMDuHSzlRx0Z9Xoo+FVarb5A
 wScQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU3tgNiXpdcfbB+r5Ge3CRtWNBc6FeaSHVvhsCsQHjO6sfDjYTbTf9WHP2s1iPHG3dfqGUc0HZ/w==@nongnu.org
X-Gm-Message-State: AOJu0YySO2tYLXQsdX7x5mZjU7a/PRGoQkyIba09XKIpM70sVaF8zk9F
 VC2A/aNDjI7eGk/g7OKeWpuw7uo+TrdM0c40KF4cyk/aFBNsO1AeKd5oLG11mZX6ylLY/PMfD7a
 YrjPTQgvePOAzf+kIECR+aIqg1zH9aO9PUGfeudCgWA==
X-Gm-Gg: AeBDiesZRBsGeeydpD7aeh3St+EfusHlGFl3+8zuVJ8pQuhpi7dVmUTGee/VPwmHaco
 l4nVTCULkaZCEMVtAaniFZe3+HjAQmb8A1W8r5w6wRdZQpnDDsVKzya+lrIeEV5gKToJYyXOMci
 Kli2uvSN4c1nyH3zQya1f2ryjt5Pi8N9u5e3lQxUr12HIAAKW9xXV+t/GLBdCQCHFb8bh2PMmFn
 /qCqaPhNqfb205vPCUeyr9cp/L7jVp0BFwTTxAC9Vvlsnske6PSmVgWENG4WnGGIV37UnouXlF4
 12ALL3RrKRMJM1y9mZ8DnWpEnep0a95mIVdbMaJ001oHjMAbWHGUwV6YgxkbVmhFc68=
X-Received: by 2002:a05:690e:1549:20b0:650:5316:1739 with SMTP id
 956f58d0204a3-6518775226bmr2364724d50.35.1775738461245; Thu, 09 Apr 2026
 05:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260311160609.358-1-alireza.sanaee@huawei.com>
 <23634eb9-95a9-494e-92c8-60615213f349@linaro.org>
In-Reply-To: <23634eb9-95a9-494e-92c8-60615213f349@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 13:40:49 +0100
X-Gm-Features: AQROBzDw2fcZJzWhmFHm8ddxbwuounVHkfkZaLpQRnkEXjCkCrsjmk2vma_-iP4
Message-ID: <CAFEAcA_T7_xuMmw4h11dcsKBzVSFT=wEWMXipE4+PObtMJqbAQ@mail.gmail.com>
Subject: Re: [PATCH v19 0/8] Specifying cache topology on ARM
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 anisinha@redhat.com, 
 armbru@redhat.com, berrange@redhat.com, dapeng1.mi@linux.intel.com, 
 eric.auger@redhat.com, farman@linux.ibm.com, imammedo@redhat.com, 
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, linuxarm@huawei.com, 
 maobibo@loongson.cn, mtosatti@redhat.com, philmd@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, shannon.zhaosl@gmail.com, 
 zhao1.liu@intel.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 31 Mar 2026 at 03:47, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Hi,
>
> On 3/11/26 13:06, Alireza Sanaee wrote:
> > Specifying the cache layout in virtual machines is useful for applications and
> > operating systems to fetch accurate information about the cache structure and
> > make appropriate adjustments. Enforcing correct sharing information can lead to
> > better optimizations. Patches that allow for an interface to express caches was
> > landed in the prior cycles. This patchset uses the interface as a foundation.
> > Thus, the device tree and ACPI/PPTT table, and device tree are populated based
> > on user-provided information and CPU topology.

> Alireza, thanks for addressing my last comments in v18.
>
> Peter, I have no further comments on this series. All looks good to me,
> so feel free to take a look and pick it up when the tree reopens.

Thanks (and thanks also to the other reviewers). I've picked this
series up into what will become my target-arm queue for once we
re-open git for 11.1 development.

-- PMM

