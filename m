Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7649BCA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGboI-0005f3-Mo; Tue, 13 Oct 2026 08:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGboH-0005ev-K2
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:40:49 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGboG-0007KR-7U
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:40:49 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-885cf67963eso21784707b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 05:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895246; cv=none;
 d=google.com; s=arc-20260327;
 b=jwiHZ6Dyls01kW7OGsEstzzXJW2LMdshYL7IcNnw3OvgC3/QuuHmajhMoNoXfvx/Ep
 i9ITocGwsubEzy0ZXYY9a7AHXojh2uCroL0Avds4M46tQU+UT9Hz9hOuV3EmtTvOmKAz
 iWLdiMD+IOaLWmC1XZLMn3fJGc4eMmHP971YGrYUtd2pRkuwKn1b8naQuFhZIsIOB1Zu
 o5pfd3n1xS7HN5tTcgUCwxsDPfrhMc9fmsfZW3E0uqojrvzA9FjMn9WomkUTbIT5DurZ
 lml1TkRikozOflUHafV6WQRwf/30IhLoIFwx1m3760QBgxvIg2HCf8rX2QB86KQkhKiy
 33vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=M4i+TfWhfJgBHbFZZ+S9QcXExOYYOteNyT9ScjAIlHE=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=FdZwoHT70V/hzMr2Ev3Je2pMPJR8qJi8kFeQSKUr+Qs8qc++OdArasmFe3gg3I4PQG
 RK2+JA0c+UndqUSeqLv/Tikc4OyHIOKQnrA8XHGGddnVEEubDzRiT70A9ZTKCOWysTFe
 1h6SS5milbL29Vh72nxNQQcGAglETB0yALlhYTH7gCa/62N3ZoRq0XLp07tWluaoxDGW
 7HPL392SUAD2IsCssOsktGetdjsktaYztR5j19LGalsJOGWQMVHwnLwGBwy9UVmKPQH/
 qh8wZjRDz6UWTxtDVwbNrTwmeYnZbi9NYhOAWDVk9EZoncCpWhoLuGtIRoslhwu/rISp
 59bA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791895246; x=1792500046; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=M4i+TfWhfJgBHbFZZ+S9QcXExOYYOteNyT9ScjAIlHE=;
 b=niuFnzVcp1fKukLHef8O+gWD07WagbDJdtkBLRgixePFTjcDAqd+vr0zNElbTMxFni
 0rpqPkad0+tDYD8a/HkUhgAyCPi70HE5RgyXqK1hpwqm4RuGpE0QgeCGkvJGJIBoI8cA
 1sDAZ3fqnDJOqzwatHhqGBpqhq+lL8z+F5Of4DBnemjuXPOTacOaiTKCLPkAKqaL8n/i
 KyWBebgik7cpgW/9OwqgENSw3HCOH+ABYRislFd7UdRbeYbyxjTPw+DCnwlWMRAcj9e4
 cF8CdpjCNxMgzshmkPuRVd9NzQCfW0zi6kLPgAJ/F6/uUqh5BLhJBBpzM8M0Tpcbor2i
 +kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791895246; x=1792500046;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=M4i+TfWhfJgBHbFZZ+S9QcXExOYYOteNyT9ScjAIlHE=;
 b=2RqMGZxxe6rmuFl7fO0mKpQfx0uQsswMpjxJwZr50lHLc7Y6OYNnmJlmgt+HKJJrJ1
 2ySbVNsWoywhMUc5NuMDtA5sZS2SABR46MSDB2C+cKYKdI5prVOJ+4DOQdUsuY6lG+Xr
 LQo6rdK09y9aNomJX/V42BP1H3Ro5gByGwbD9LC7QPXyvaTFAyof73SEhNN8GHi5Tws4
 vxebUEyAcQk7R280lOYSKYPW2z1sYNJg6jDMv5TAZ4EPTlrRokO66AcEtwYsaH45Nv7G
 SFvXIZvsg/C9nTJF0kJz0lyXMv5+JcQbxsPYpq4r0bMIAxBHt2MpCWRpEzgJOTDQS1dH
 AfYQ==
X-Gm-Message-State: AFq9FYL4uxgxGCgGsYHvWEPZQZPOmBfJsCqDYkuKbTtvOZh87Ke39UCS
 3KLpr5vwGNbJwxlDSYzyvKIq4no11FszmasUWa6fTV7wAmBPU+Y0Ywh7cy1cyppBBCnPFVQ5gGL
 +9aPCVX98MozUb4F03k0GWqEZ2A7/8yR3lsCPA5xm5w==
X-Gm-Gg: AYBFou2IQLBxCdrfTfcIq/KwlfOrhPSiSCJtJJjtq0wPQx/mmDj+oaKZ5CX6Mgw2MS4
 F//uf5Nidx0GT1EXQp223ilqR6Z/Kn8BkOfu9yyFSQKRLlpxVfMjzh0CLcTLqJiuFFG9B1vYBlk
 rpPiKPwqWja69se6goWOaUfMeSYL2Q7eikACsrg7f00Z+/KXe09DMpjAv0p20cbDG1BztVK0dqT
 ujg6jCmcgyQdQVIdlWGKe+qXQAsIkabcFIwkvQMqWD/AdvZ2dmWf1TGZan+8/XJKBiGV42r+0SZ
 8JW5DMYFAWiOBj5nqJvOEf0C5SgWpRHD6utTzJlX7MRg/QPE3yJvaXhgp11HwQ1NYLqLc1mas/T
 6627Xlx5Gaf+737R1CkL/cTUS/e2X28U7AsDtuRrl/yaAXrhemQ==
X-Received: by 2002:a05:690c:e145:b0:8a8:7fda:15db with SMTP id
 00721157ae682-8b07edb0b40mr35669117b3.22.1791895246523; Tue, 13 Oct 2026
 05:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-8-peter.maydell@linaro.org>
 <eba0b754-7505-49ea-939f-39a3ac1fca4f@oss.qualcomm.com>
In-Reply-To: <eba0b754-7505-49ea-939f-39a3ac1fca4f@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 13:40:34 +0100
X-Gm-Features: AclHuK9xAbo72QNILCcEE8GOEDeFqckIAkC69yMGsospGLAP8OJdU4p-EmBOT-A
Message-ID: <CAFEAcA-+1fDSRkqoyHvz7UK59fataAybfyxdPOa35QPKF6KNLw@mail.gmail.com>
Subject: Re: [PATCH 07/86] target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to
 set IRQ/FIQ status
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 12:57, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> Revisiting this comment:
>
>    * For the moment, we do not consider preemptive interrupts,
>    * because these only occur when there is a HPPI of sufficient
>    * priority for another interrupt domain, and we only support EL1
>    * and the NonSecure interrupt domain currently.
>
> Is there a way to assert preemptive interrupts are not accessed
> by the guest?

They just don't exist when there's only a single interrupt domain,
so there's nothing to check. (Preemptive interrupts are either
those for the EL3 domain, or else those for a domain configured
via the EL3-only register ICC_CR0_EL3.) The check in virt.c that
says "don't allow GICv5 when EL3 is enabled" is what keeps a
guest out of this not-yet-implemented part of the spec.

thanks
-- PMM

