Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FECA606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FDuWT/Yn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT2QJ-00073P-7n; Mon, 16 Nov 2026 14:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xT2QH-00070z-1L
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 14:31:25 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xT2QE-0004JQ-2T
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 14:31:23 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-67c24619b19so2726331d50.2
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 11:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794857480; cv=none;
 d=google.com; s=arc-20260327;
 b=Fieb8l1h5A9mKFJ7pQ3u1pnbJPTwNhyQnuk3sAX2S0fKE60qV9AwInEbZa8itS++A2
 gpdjIV4Cy+STNiwPcLj+wHZ++5LYRV9ZwUTh+SJ4cFB90PIWyckfEHzA5csrZaSXtXus
 BpK725k6Zl7zERKwdURPBURcvXAhl0nZ9mOVrkEEGdCJnyhVNcZNJgmvZDh/IbJ2H+IB
 FEmcefPiNzTW8R1zuxpAadO9mKlLi7ROUtii+PauTFfZMctDwqEQJIKW1Tuk+uMRRCeL
 91cL/Js1vKj8XdZnm1QhlaBwkZIigzeLnbBFybsYO8SOAw/DKE2ZVi2cVDDVe4GMBKxe
 BN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hvQ2sCg1HfdyVsyadHrWzZgE0Ls85Df2r0H9rHDaW50=;
 fh=/vwv/v4BsxwLZmBgYfSYYsLKKo7yDmIi5Epzx+v+K5A=;
 b=KrQedZNVWtcO4C0XqPo9sbtqtJcTAQn2LAdZR0MxmDy//Tnr8/6dP+fbe+JBuxUHyi
 4xJjVdF6Eam7lqIEgwB88UXlT7vMXAj29qV/gKEjgdCI4ogTHkuKnyIrR1aVPleZGbe3
 aasGOXzyOJhcsEcS58ZBGVh94qiSWeJquyYqlOlr/0xUgfqLn/uapzhhYbfrWM/JME9R
 v2iRVZb5lauopoF62omyZYkJdI/CRjjt9dEbEa/px7MXVah772d96K4PNpui30W9thMM
 NmQnpASzO7tehj5YL9b2Iaz7rxagicCuPp2WOExaRITrGLA36lE3ceMeNBVpz4wdI4Th
 XVzw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794857480; x=1795462280; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hvQ2sCg1HfdyVsyadHrWzZgE0Ls85Df2r0H9rHDaW50=;
 b=FDuWT/Ynrr2xN7kLkwA0AK+DCixTe9kXdPidqLVnpQn5deUzZdZyqE3zJho6SSG5pL
 /iA5VYTXoMo+MyeKPygCqO4GBHTabzidAF0duzW9i7KXB/dAX5ycIZc01l2aVIgiXm4r
 VFeFSzxJTyGl4JYC56CZlU+BubkL1pecEo/V88HhGubwhxfs8SpN83W25m9nOC70ugoO
 XHctzaALxTMQvWpVMzQ5JRNRp1tPrajHLWhRzA0QRMCxgn3qBPmwym9ej3MT4vRTJO8N
 3vHTI7uTqeSjjQaB7LNA2dDw2xc3/9NxpiBqohwcwcvCo9sqCvW6Nl8YD66JV2b/oPvV
 TkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794857480; x=1795462280;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hvQ2sCg1HfdyVsyadHrWzZgE0Ls85Df2r0H9rHDaW50=;
 b=ylSYItdgAwTy5doCVLIVgbK+TYEGW6at3Zpb1IQJPKdywGFu/4V6tdPL3ol9miSY49
 iVIPcg2bgHS11fKRM/vUQL+DRhjYKrg0xi5O1mt0Au6hX5ATnQbBOX8MhtqsXtSquuq7
 Dozo8PoEGipGKSvrhV3w7lIKhMa80iXwULW1AhtVFOSJv9mm06xEHgIr2fIV2Oc9YHYp
 sX31YA/hsFRQWGCYz+rFWIoUk4b8SqiUfKqHesq544icBNh6TQ6tzhgPO6v2L6E7zWrH
 rLT/6Cg+H0Tr7CbBku/4GI3axq8/2th+pZ94zzOIbk0XYCIrd+VL5BjT6mF92Zi9f/Y4
 +CsQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHsamI2+5hHT/ru5KVuQNUWKTGzoXvIJTkrRxObIGat1muQgicEek7TzYjgmvHOdR4QdhbvpF+VTA==@nongnu.org
X-Gm-Message-State: APuU4Z9V+DV5VjL3fDYM7wSduqlIhsGxFq0C89TU3IdyIDX8DYt49g6Y
 pNf6kfHpduDkjHrU8xH/gwMfQSvQlRjFwuB/wfOEkXTuip3OkzT8eFKMWFJeLcPyTfV6+pYNavG
 dYzO7WKdjlwCD6OJUmGRmP8FlpuAtVlTG/tiveQgRBw==
X-Gm-Gg: AZFdTZetTF3UpPif77UGQzhp+f69wEPaMH5745j7r9jiJS2z4ppcVBPfgEcqs7jFRlX
 AsyBq1TBbpCuGYJ3mjJr3JDnOXyBvClpzHBkeJ8B1yWDpjNTEAvQO9/zdt4+7mhfG/CLee9wmxq
 WWRnYQvNt3QCl1zWnSpgiM7K41TeKg21TLPA7p+itChF8lCTQR4+ocM/yiWfpQg7a640BNoN68I
 E26RwEz65E3OI1kyb2kW3X3YL+Bzsllnn1yWLamob5trUoaPkbW9rZpQ+VxjPJPJ7r9+v22+gk+
 Ui82SWSBHjIcDiRpIhtUuWOPJS0NbZJ7QSg+OCJxgYplT6ld0WOfnQIO+Y38EADWZSOEDx8fcfn
 x7AMUkd9Y0kHG4RAkoCRACwRR1AVzL0VhDBFOZPzDjRs0dSAjVIi+YY7IDQjs7HTO6wG3BZPuV0
 AZkldUR1hhgctKyXdzdfUA
X-Received: by 2002:a05:690e:1688:b0:67d:babd:b80c with SMTP id
 956f58d0204a3-67dbabdc5aamr1889966d50.67.1794857479878; Mon, 16 Nov 2026
 11:31:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2026 19:31:08 +0000
X-Gm-Features: AclHuK86TOGoB8kRSwdXx4amVM7Dh5DygxvE65EO4LJUouj_so5MRTVNEi8304Q
Message-ID: <CAFEAcA8Nmt_Nsvfm77en_oaE4orcQ3BdCBQWNAXmi0iqLgV7fw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix RCsc store->load ordering of release stores
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, chao.liu@processmission.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 21 Aug 2026 at 07:40, LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> Several guest architectures give their store-release instructions RCsc
> semantics, which requires the store to be ordered not only after the
> memory operations that precede it, but also before any subsequent
> load-acquire with RCsc semantics.  The TCG translators, however, only
> emit the leading barrier before the store, so under MTTCG nothing
> prevents the host CPU from executing the load-acquire that follows a
> store-release before the store has left its store buffer.  On an x86
> host (TSO), store-load is the only reordering the hardware may
> perform, and it is exactly the ordering that is missing, so the
> architecturally forbidden [0,0] outcome of the Store Buffering litmus
> test is easy to observe:
>
>     CPU 0                      CPU 1
>     store-release X = 1        store-release Y = 1
>     load-acquire  r0 = Y       load-acquire  r1 = X
>
> The affected instructions are the RISC-V Zalasr store-release
> instructions and the Arm STLR, STLPUR and A32/T32 STL store-release
> instructions.  Neither architecture defines an RCpc store, so every
> store-release is RCsc (RVWMO preserved program order Rule 7; Arm
> Architecture Reference Manual DDI 0487, section B2.3.8 "Acquire and
> release semantics").
>
> Patch 1 fixes the RISC-V side and patch 2 the Arm side by emitting a
> full barrier after the store as well.  Patch 3 fixes an inverted
> barrier polarity found in the A32 LDA load-acquire translator while
> auditing the load-acquire side.

> LIU Zhiwei (3):
>   target/riscv: Fix RCsc ordering of Zalasr store-release
>   target/arm: Fix RCsc ordering of store-release instructions
>   target/arm: Fix barrier polarity of A32 LDA load-acquire

This series seems to have been accidentally missed, possibly
because it included both arm and riscv patches in the same
patchset. RTH tells me that the Arm patches are correct, and
Daniel has reviewed the riscv one.

riscv maintainers: are you OK with me queuing the whole set
including the riscv patch in target-arm.next, or would you
prefer to take the riscv patch yourself through your queue?

thanks
-- PMM

