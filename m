Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4368CCF2DA
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 09:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIjbr-0000c1-He; Mon, 19 Oct 2026 05:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjbp-0000Zj-Ay
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 05:24:45 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjbm-0002om-Ky
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 05:24:45 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-677bc4704cbso1546377d50.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 02:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792401880; cv=none;
 d=google.com; s=arc-20260327;
 b=RUhepxCsfVArXYXVcGMmI5gu8yB8TLsllUZkHvc1rILhN3mJALAxTEswU3NeJpuDbR
 6VZ+SAQeZ33AtAm/aIKEIZ1bYKTMh7qXbLoEJ+IV/icMIdbkrRZLcre+DbMwh427umrK
 AuNiQfMRHZyEfnE5jA9/7l+hUzX51O3wuuLzEw0uVJ22W8vUei3sW5Fa8prc0vXrFlM6
 unmN44XiGuGreCZbptCl3NcwbSRbH07s9GF38HrNy51eK8bqLBv7pDr9jclhyjZC+e6h
 IfJk0TAQ3Oc8oXSyu83WT1F5ODec7sKzQQnGdzC1P+44GFHdMav6QLTSkfU4w1rUpS0t
 ir6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MNENA/MC9L+77hx3g/q/IU25eQjNwPssmSWwXIKL5Tc=;
 fh=VhhhGvLx7QAExOLblMIUptHCvkpGg4JB/miT/hTatmE=;
 b=NO8/PRSiFhqiau+OESniapnASX+rHydA1f+UFPCsEc21R+6NmnDX51/qLt6xHYRteV
 uxLY37dh8fn2shuOfy3eaEgkCNkFF6upDNhJ2Aef5Aaee38+SN8X1hbwRxHKXtfbrBNV
 qSE2A9dlquQJxGzYNIToxwMiTz+SulgXw7Fq5qDwVd1JvII6XlwscxIXvhGynyykGVve
 FOdiHmXP19g4Z5ZeYgtHp74i4QNhuf35OH/5XVe3lxm4ogvoLJiTfZYfLbd0AUkQ9NOT
 JZgTab5QTBxFsSxYkmKvuFSBhC3EtVjXHnBgjoiK5jsvQm4A7UV+ux3MyLbX2NY6Sax7
 Pxww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792401880; x=1793006680; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MNENA/MC9L+77hx3g/q/IU25eQjNwPssmSWwXIKL5Tc=;
 b=Y7HZ6afo52d6BNX3aU5mbQC3KW2DMdzuc6gehxXTgRIiYaDs6wFoNVdX3e1McBZw63
 eTSYH2W89qx2RXdqbRSNm9xJdIdd/4n5Zumig97lHR7eWyoGBijjbwOxEBMt5JfOwxYi
 DgrMJHCLlY3ZkggeptOyKhZq+Z//9vilqJA54njteAhjTMaoth/tdEKF/YBbVyDwCSZW
 prMCdSujWs/yqXrpPO9QO0F7spBCHnzCqqrUMR/oeQrivnB4+eOdLIB4pCvAMw3kcCPd
 6SzHvKAF776+aPjUzX0LJ3Q3dMO0fbFMgcrYi+mO7ifFNivCjaKGaCJ2hfCzXLmeuAPM
 wH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792401880; x=1793006680;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MNENA/MC9L+77hx3g/q/IU25eQjNwPssmSWwXIKL5Tc=;
 b=wtYCdSxeotD9LodlPN2xC0Xm2+xnSTyxXDoTPu7qtX/ovcTph9lBLWsCI0YypU1XRZ
 xd6kjow45aKMuZUl++bhRii05Byzfr+skdCVDIUcoBNssrsQK2GGqz7wvDlRlxIAdgQi
 Lh50mNuDQD4cTBt89Pf/ER9cyHbMqo75zktyc5tY7rJ09kiVD4XthcfQ185LyyrZ1hgG
 a+w+jlfAyZPlamoUs8fgiI2m6LcshwpllMJMpr8RP8NOvQ6cmUZPeeKWHPl7RtAM/liN
 g5lOX+nfA6fE4DwZ6Y4/3DfDIqb9eEQmO2SOTb9/NjX19OWtcRZh/ngjuCvgSjsvVFXN
 87iA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHyUV/Ey7xwX1on1A/3xDjkBI/9HDHaPKQ6oHyB7rmpYUvsUCBX1Q2oxkKpmZSmTMGDyU1QAFGNg==@nongnu.org
X-Gm-Message-State: AFq9FYIOaXIWThPN2J7ReWqMWUfCpyQVRSpVfMQxwsWF7Gj8vixLwnDy
 gf92mW80nxYwhdDpDIJhc8oCw5V98vNWluhg89m0iz5CxnuMHkz8F7NdUtWbMCljIt6nGHpFY3r
 1Y1RiuRilwHPr26wifT9xRPcfXlOP0uA/C9hSZwx47w==
X-Gm-Gg: AYBFou0DnqxzIK9nZPo7BmNfjsT4PLDJlVq0769fxp6R6Sm35lG0A9lIjurhgqbEAHP
 f0+kkgWWmAa5QWRlWxZr6P9q7x3V6eVUr5TfcJIsdhu+3+fzzRNHzUJvWsLn0vGN4carpFwjvQg
 Tur4GZhjgFhRONac3VmR644IGRVISdfibMBZ6Yc3ArxOPWD4ZJQexhbbtfuYm8QM8/lrGWI9GuE
 d4V2yBFJEuA3Jvzku4dlEYybVmLZvRcEJvu/dxKyiR6PCFJx+CAI1C+wCP7pZ0lHPL2ar4pUhVN
 X4JlfAYpmdGV77/GhHIw8GDhTH3uZyzKAF/Ukvv49vm9nhO5DE+LGIztH7zm4HrUeClGtud7REo
 /ysnRd5mzyXTk3bOMbydqOElOBIFAXFQ+d1SXGMM=
X-Received: by 2002:a05:690e:e89:b0:679:9c43:8599 with SMTP id
 956f58d0204a3-679ca573adfmr1752717d50.8.1792401879841; Mon, 19 Oct 2026
 02:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_22E95650AA60C6E59860452C0D61A21F1105@qq.com>
 <CAFEAcA8MyrqWC7=A5Bw0G5G-2J64iTLmfY33dNDLm0jvmRb+Eg@mail.gmail.com>
 <27040691-e4b6-44f3-b588-cbbbee13cde2@huawei.com>
In-Reply-To: <27040691-e4b6-44f3-b588-cbbbee13cde2@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 10:24:28 +0100
X-Gm-Features: AclHuK8T7IlPIQFv-s8rGXV6qKTa6j_RBW8npIig5AVCHtrtgTbHRe0lx-FU40k
Message-ID: <CAFEAcA_4xb3CBL9TTAdKMOG_ijWpt9wsveCp0R602VoFaWUH1Q@mail.gmail.com>
Subject: Re: [PATCH 00/37] Add Arm MPAM emulation
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Jinjie Ruan <2118537295@qq.com>, anisinha@redhat.com, armbru@redhat.com, 
 eblake@redhat.com, imammedo@redhat.com, michael.roth@amd.com,
 mst@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Mon, 19 Oct 2026 at 02:57, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> =E5=9C=A8 2026/10/16 18:20, Peter Maydell =E5=86=99=E9=81=93:
> > I guess my question here is "how much is this actually doing,
> > and how much is it 'we provide enough software-facing interface
> > to keep the guest happy'" ? My (rather shallow) understanding of
> > MPAM is that it's essentially adding tags to memory transactions
> > and then accounting how much bandwidth each tag is using. That
> > seems obviously infeasible for emulation, but on the other hand
>
> Hi Peter,
>
> Yes, I agree with you.
>
> Implementing MPAM bandwidth control and partitioning at the
> performance-effect level in QEMU is neither feasible nor necessary, and
> it is not in line with QEMU=E2=80=99s original purpose as a fast function=
al
> emulator.
>
> We only need to implement the functionality-related parts (i.e., the
> register interfaces and control flow) to ensure that the software stack
> can correctly recognize and configure MPAM, without simulating the real
> performance impact produced by those configurations.
>
> > this looks like it's rather larger than a minimal "we provide
> > the register interface but it does nothing", so what are we doing?
>
> By implementing MPAM-related register interfaces and control flow, as
> well as the MSC hardware topology in QEMU, we can understand the resctrl
> framework and interfaces in Linux, along with the related hardware
> topology discovery process. This facilitates kernel debugging and
> pre-silicon testing, and also allows us to debug and test test cases,
> avoiding the complexity and slowness of testing on FPGA.

Yes, but what is your implementation actually *doing* ? If
software reads some MPAM resource monitor, does it read zeroes,
or something else, or do we implement no monitors at all?
2400 lines is a lot of code for "nothing actually happens".

-- PMM

