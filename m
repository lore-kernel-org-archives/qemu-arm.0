Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C75CD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:32:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnxM-00039i-Ji; Fri, 15 May 2026 04:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnxG-00038p-W2
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:31:36 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnxE-0001SA-6j
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:31:34 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65318dafbcbso11594211d50.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778833890; cv=none;
 d=google.com; s=arc-20240605;
 b=JEvncZ3lU4SFWQSMDkTW8qHKt6KGEU66lv9v7YTHq1JE3cXHIaG+4C5KOXQFRCdKN7
 Pba5EMRdX/nPwPRm9qEf/O3HoZRgkBF02HtTs2bbfsbkgoN1VW6Qx8c+df2SyLjp9333
 Hv9FcOuQf249pN3W0DfONP+vQIgaZwjsLOsx1w8VzG4rQPYcALz21aIsZg0zzqVTt/mF
 nw0b3OPbijObYUmS1COWrbGz1wHe6yV7qrqopX4TLaFYFet3tCPid4jDanjFllkCWfy+
 lyA0R6hXda/0+5v2XbJuKOSBb+gdPKdPXAvSwBCcx9J+F+GIXMCDyA5Hun6MliPIDi2d
 GKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=alzfgz1aXCJLqugLm78Sp8WFGjGW5XBGx/1DQ0VOqWk=;
 fh=yWm7BH4TVUM/E0AtKAWLVUJZcI6kwEZLYqAgAW3/ueg=;
 b=gWVqu/0rsRYXGCuAyrZs8t/bcYGVeSxIJL0H/MpLpj6J/k04Zk5avXgdiYoxpkEH2N
 2EJeGaIMp4OY8IFD8YZ3m1UEB0oBxnF9MWzic/3a2HWMYUs9lSGInad3+/BwtLyaPa7X
 7wk9g/2d02FHM3mDMI9+5Odf2LgxtwlEHxdd3mm0wtG8dJ1MamzdwoZHG0esy0NIBXv0
 LO+kXZCIN+RVGSlN969qm83HjyQlfPXG4MvJokh3BGGBiPVyLvPEkJHLv4QK+ug/NG5F
 i66SgJn9T8EY9TXg30CALDVEaHHsvjA1oVz+WCC5wgR27dMXiFbt42VmHULi+UdboeUk
 2NBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778833890; x=1779438690; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=alzfgz1aXCJLqugLm78Sp8WFGjGW5XBGx/1DQ0VOqWk=;
 b=Oz/X7NK2olEnLkxOEP8Q+thSCOAQtu2W3hryNc5ZqYCVa/vLJIK3KmoIDjRAtxLKKI
 JMeviMPPvKYdPjCv38jZSYKV1VJs2jPUbDllwq3rGOCpwv2L0dId4/iejrNVUaa6BV1T
 321dnA9ML+l1Mr9uguD74hOUJLutbPtsOJvGSfN/b8niX/+WTiHSOT5TqPSWiTcg9RU3
 vCRZyT8kw91CNO9EBPybaNUMmudz1ZEv3RXip09WkHbI0mArULk5PmhDSskaPytzaFXy
 /0HGfVkDFV4vLnLgq7ROnb+jgZdqcHrwFLT4ug+ndzeppw6PwxZkqHjMwsb7TH9JFRm4
 oSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778833890; x=1779438690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alzfgz1aXCJLqugLm78Sp8WFGjGW5XBGx/1DQ0VOqWk=;
 b=UY/gRrTb8NwvuhB5eyk1bEJfyB/x284LVAuKy8klkM6LOEhmF+a1GLEQzAR22IafyZ
 Ilt+pG7jkzZHpRSxvNfdom3AfIE/9k0MI9Vqc3PLo5kYYBpHpdiBjjaGukNjlKgem+FO
 79XmO8g/3YKg2iMYOPbJ00MLD6GjSVHwWvgHjlAsYsq3gL2bSOmElQYH1XKrrTp7tMZG
 vXgpUBMlskcoP3taw75H23H7NsMX+bXiqdf2SzsgpXosowM1Wqgb7MZlthFXx/nVmzBW
 bcvMCPtQbRkNAScgXP2K2xCSCni70gHK4tdEr4d/y65YnK2gXlN+pVfOr61eidB2SN+u
 RbWg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+/5//zSD2PuZdXrzucfD+JQITWq0+F/U5efV5nO3vmUNno0LkBFV0ofVNla09lIGRgLUt43ophpw==@nongnu.org
X-Gm-Message-State: AOJu0YyXdvOTZGVla9OC+1qi48dEr3x9nz5Ehjsccsf2PvlB/RAI+piE
 2Hx8QfVyfIUt0JTPg8vcZMXgHu8LyBZHhG537gr5Eih71m/rWohr+MifCZh5hWEEMdFNhaAgA49
 e2L3PtuxIq5aAyaLTYymnfZKLTA4Io+9+0G7xRJNJww==
X-Gm-Gg: Acq92OFhMJF1MIheXrammotPWXupIWPQ1+aEquLx54JcLl5RNWIf32/ISLtvXeY6p2C
 WhcNJEtwOL9bdxz0Ca+FuIfCDP6N1kQuqpM2duAL+Fwhtpd24ocpbbP7b1hiHgZYhN98qfqA9RH
 ngdzGizMP6RGY6V8ZouTjk9N//ueodeTderrFplhBaWZJx2IP78q6is0MyiL7s1by0IPTgUGZI/
 sQ3O/Nwq1vSbXVLqbwUSSfbLmZgsj2SawfOE/G6oc6B/mWTfUpCFfkBXD+ykig2ifuSGNO37jDJ
 fKLeHapXP4WOj5ZJjA4c+jzYKDZ1IwIfCXKWGhnwmcTAvKO7DLxL0cKs5V4aTl7yuog=
X-Received: by 2002:a05:690e:155c:10b0:651:c234:8204 with SMTP id
 956f58d0204a3-65e226bf7dbmr2437248d50.24.1778833890611; Fri, 15 May 2026
 01:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260503073541.790215-1-eric.auger@redhat.com>
In-Reply-To: <20260503073541.790215-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:31:19 +0100
X-Gm-Features: AVHnY4JAVD4AJ5nfdtuw8hlYr0xUlyVi_OqdmNMtbkuR_uPHuC85swtfT1ALIAc
Message-ID: <CAFEAcA-TE-8cj6fGOYJaChRVB5GE7E8ys87cxPP4Yw1kgjh9Dg@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, richard.henderson@linaro.org, cohuck@redhat.com, 
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Sun, 3 May 2026 at 08:35, Eric Auger <eric.auger@redhat.com> wrote:
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
> between different host hardware.
>
> QEMU retrieves the writable ID fields from KVM UAPI [1] and
> match them against a generated description of ID regs and their
> named fields that stem from AARCHMRS Registers.json file.
> Current description is based on latest 2026-03 edition.
> The content of the generated files was compared against kernel
> linux/arch/arm64/tools/sysreg file [3] . It is not straightforward
> to have unit tests for python scripts as there are many cases for
> field extraction.
>
> For each writable named field a uint64 property is created
> following the "SYSREG_<REG>_<FIELD>" naming convention. REG and
> FIELD names are those described in ARM ARM Reference manual.

So if the user asks to set ID registers to an architecturally
invalid combination (e.g. one that reports FEAT_X but not
FEAT_Y even though FEAT_X is supposed to imply FEAT_Y, or
one where one ID register says we have FEAT_X but a different
ID register says we don't have FEAT_X), what happens ?
Do we catch and reject that? Does the kernel reject that?
Or do we just report to the guest what the user asked for,
and if they asked for something broken they can keep both
pieces ?

thanks
-- PMM

