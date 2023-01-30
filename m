Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1193492ejb;
        Mon, 30 Jan 2023 11:47:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZqYmoQDArrfy9FXaHmCiefYnbmOvEo6a9KIuXoch6GyJ4bFxk8hO+IC3y38a3RC7+RoEq
X-Received: by 2002:ad4:500d:0:b0:538:4c7b:fa9 with SMTP id s13-20020ad4500d000000b005384c7b0fa9mr19536365qvo.0.1675108061944;
        Mon, 30 Jan 2023 11:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675108061; cv=none;
        d=google.com; s=arc-20160816;
        b=c7W5rVIofjm3HljOJlfv5NhALv20uBLnzbPh57MYnFiOWwZcK2WNdIevo240CdGzcA
         mqf+PUiuqcRDvLURpFwDIZdYRG2qhm+0FEfLRjPPxcmvbG70DJQ6wCRfOVpNZyjD7R2F
         skRdYmuXjOyTtoRgCXQZWRvGLQAhPkNJSNNkGS2mpKGZ3lvxZ9qswQw+Fc7vytZLeRJX
         SJMGfO5dC7uYDvNU1IdZP2msF8hPEO6P3ZGK4u+iOP6UFJwTvqM9NNo6ozGfmiAuQ4Z6
         63AUslazNRALOvMm6YI07rpUfJgUBHPKbqg6IeNnA87qeGDvlqHbYG2+NIU4IdhtDTz2
         TKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wndVqPfVUSXYsL1HMhqEZ0esXnhbj/t7n1eyLj+lBg8=;
        b=pYT00Rp5QLYLmVMSB2BrNLL5dYg+TTPGYLSoMZS5LHP869APKWWTBQRaafMLFCKxFk
         4u8HgXCqSc3BGMFLiDF2fz2AB3TxqbNUWCyuZ0cnpBl07zpwqJYG1iasgtq2H2w/K+31
         TP8Zy1BtsmSB/lrXrAfJLUbvBqscKMbAt9DiGLzCN5+FJHDw96//ki/eqZaisRYSzkpx
         LGocd+FFTbm+dEqGZDVjf8OWg2G5ryCp9AmtxVmCeRbmmoDBwj39i/U84NZEpOQ5NfpM
         V8wxfjuLsBKq0aEdtaRap+p6q358bTU7SHz6llrEya/ahW/7OXTFdgX+vZDmD5XXmAqo
         CDSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="ebY/6M6P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020ae9f215000000b006ee9af422b6si6902474qkg.226.2023.01.30.11.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 11:47:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="ebY/6M6P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMa7R-0002i3-Rp; Mon, 30 Jan 2023 14:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1pMa7Q-0002hn-9d
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 14:47:08 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1pMa7N-0001Hn-Un
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 14:47:07 -0500
Received: by mail-lf1-x130.google.com with SMTP id f34so20651483lfv.10
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wndVqPfVUSXYsL1HMhqEZ0esXnhbj/t7n1eyLj+lBg8=;
 b=ebY/6M6Ps7jdFLOGX9rpIlyBzr4bQgYMl0TQ34t5rU8Zp3AUqUfpgP1E1ROcu71Cs5
 fHBGKLvJV8TK7GaeikwizLpMdLfrvtHdt/UW4nPNmzT1awanpq6cmsQMN1TxWzIWDBoE
 8exLja0rEU/b/7eXzOfoHWpNeeydVeUe8kvLSPuGr54iKnuh8LZ0Gy9kp27xYTGmco5X
 y6RLKvbl0kQmhe3Nn/OYboNBxN1EbOtpG1xwCrgZdwvyMDxcyVouxbwWzw8FjZnv2Evl
 G/AOCI8EzdpttqxVT7SvoFPMz9dvqXyBi3w4nv9wC1digJnNiBP5QNbfIoTt+5wfc+BX
 /YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wndVqPfVUSXYsL1HMhqEZ0esXnhbj/t7n1eyLj+lBg8=;
 b=t8j3XOSAy7sf/OqVRBmzfAPbCPqyM/ZD16uDlA5BX8BNg+D8Tg5okAKXCB/RME8YoP
 A54lOKopZbeQwx15BIG9DKIPWhEORa+GuaSk0uBcA7w2YWiwJoRQyji9tay5J0MRaQTA
 svcQxaoTRgXjywBDyAi6P2ii7KnMFv6/G06xYGBH0e4wZyxVZiRey/oLNGIQcnADGc0G
 vEIIwHev25kftAtipoJpYaGqVdZIa8fr0hHzAdkgIDBxn7FhEVSk3JZaV4p5xINhejuA
 vItFdYyCR6jILlwHKQZrig7du+JEkxyJr5g9Tsg1o2p+/weutMurCWVj2QPnjww4PAtO
 IVVg==
X-Gm-Message-State: AFqh2kq7ZFATYGdnUWh3hExCO44B6ONpK4gyiuhAegvv8wdatGB5LPXw
 n+rCV/iktxzMCe2S+shFLHlaBLYOKxu0EI1meozqvQ==
X-Received: by 2002:a05:6512:1113:b0:4d0:9cea:63f1 with SMTP id
 l19-20020a056512111300b004d09cea63f1mr3857918lfg.221.1675108022799; Mon, 30
 Jan 2023 11:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 30 Jan 2023 19:47:00 +0000
Message-ID: <CA+EHjTwG8Sj=V4NhF4GqdTN=t=pxCWANaMixjQ58fAp-fDsZUQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] target/arm: Implement FEAT_FGT fine-grained traps
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=tabba@google.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f2gwt2dq8ZqO

Hi,

On Mon, Jan 30, 2023 at 6:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This series implements the FEAT_FGT fine-grained traps architectural
> feature. The bulk of this is new system registers HFGRTR_EL2, HFGWTR_EL2,
> HFGITR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, which have bits that enable
> trapping of system register and system instruction accesses on a
> fine-grained basis (typically one or a few sysregs at a time).
>
> Changes v1->v2:
>  * patch 6 updated to use RTH's suggestion of doing the check
>    inline rather than in a helper function
>  * all other patches are already reviewed
>
> In theory we could implement this with our existing ARMCPRegInfo::accessfn
> machinery, but we would end up with many many very nearly identical
> access functions. Instead this series adds a new ARMCPRegInfo::fgt
> field, which specifies which bit in which FGT register should be
> checked; this is then tested by code in the access_check_cp_reg
> helper function.
>
> A few bits in HFGITR_EL2 allow trapping of instructions which aren't
> handled by the ARMCPRegInfo mechanism: ERET and SVC. These we just
> implement "by hand". FEAT_FGT also adds new MDCR_EL3.TDCC and
> MDCR_EL2.TDCC bits for trapping the Debug Comms Channel registers;
> these we implement with a standard accessfn.
>
> The first seven patches are various cleanups and bugfixes that
> I noticed while I was doing the FEAT_FGT work. In particular, we
> weren't getting the priority of HSTR_EL2 traps right -- these should
> take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
> The rest of the series is FEAT_FGT itself.

Thanks for this. I'd tested v1, which allowed me to run KVM/SME tests
with qemu (which require FGTs). Reran the tests with V2:
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> thanks
> -- PMM
>
> Peter Maydell (23):
>   target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
>   target/arm: Correct syndrome for ATS12NSO* at Secure EL1
>   target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
>   target/arm: Move do_coproc_insn() syndrome calculation earlier
>   target/arm: All UNDEF-at-EL0 traps take priority over HSTR_EL2 traps
>   target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1
>   target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
>   target/arm: Define the FEAT_FGT registers
>   target/arm: Implement FGT trapping infrastructure
>   target/arm: Mark up sysregs for HFGRTR bits 0..11
>   target/arm: Mark up sysregs for HFGRTR bits 12..23
>   target/arm: Mark up sysregs for HFGRTR bits 24..35
>   target/arm: Mark up sysregs for HFGRTR bits 36..63
>   target/arm: Mark up sysregs for HDFGRTR bits 0..11
>   target/arm: Mark up sysregs for HDFGRTR bits 12..63
>   target/arm: Mark up sysregs for HFGITR bits 0..11
>   target/arm: Mark up sysregs for HFGITR bits 12..17
>   target/arm: Mark up sysregs for HFGITR bits 18..47
>   target/arm: Mark up sysregs for HFGITR bits 48..63
>   target/arm: Implement the HFGITR_EL2.ERET trap
>   target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 traps
>   target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC traps
>   target/arm: Enable FEAT_FGT on '-cpu max'
>
>  docs/system/arm/emulation.rst |   1 +
>  target/arm/cpregs.h           | 484 +++++++++++++++++++++++++++++++++-
>  target/arm/cpu.h              |  18 ++
>  target/arm/internals.h        |  20 ++
>  target/arm/syndrome.h         |  10 +
>  target/arm/translate.h        |   6 +
>  hw/intc/arm_gicv3_cpuif.c     |   2 +
>  target/arm/cpu64.c            |   1 +
>  target/arm/debug_helper.c     |  46 +++-
>  target/arm/helper.c           | 245 ++++++++++++++++-
>  target/arm/op_helper.c        |  58 +++-
>  target/arm/translate-a64.c    |  22 +-
>  target/arm/translate.c        | 125 +++++----
>  13 files changed, 974 insertions(+), 64 deletions(-)
>
> --
> 2.34.1
>
>
