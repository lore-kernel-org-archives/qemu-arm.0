Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1724489lfj;
        Fri, 6 May 2022 04:23:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3mGKu0HdkWIgAOYVVeM+ZoI/oa5r45pmjVpYtkVWimI5FduC6i8FAveyNMTco0hYDfM4e
X-Received: by 2002:a05:622a:c3:b0:2f3:b7b7:3564 with SMTP id p3-20020a05622a00c300b002f3b7b73564mr2226126qtw.340.1651836195644;
        Fri, 06 May 2022 04:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651836195; cv=none;
        d=google.com; s=arc-20160816;
        b=HpIO9hxat5MXBYL34BJHYHNT554FT9iG/lJDeBZC33UaQsgz5LMuxbzhX+3t+Sf8uO
         /Bds7Pq+DoM3IygqyH3eeM3Uys1Y8rSfa6YkYqONcI/w7U6WmcnBIdNkDihKlwh1cFHp
         KDRQxQ9+jUQh7acmH4Kd+tS4Yr9HN2Z07YGFJEkACiK3JPbw/ow7XbXleLVEbHKX2kpv
         JIiNrDS287rlLOOHn5kCy182K+j2jV7juMuHtFpguiE6Zk2PnZxcFIxZr1MYXhoRAlrW
         5THCuVIcs1MAePdt3Nbxjb6+cmuspcxlrlLSqlNOy4dWQPFen/kvkUKvDPLeevcQZB+U
         TS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H7gsctiBwIuEVoCpDZmSg2ZOi0YNIRQ0f2vdtuaDP88=;
        b=h851lM6ytssVxfDiVLSYF8403LB3eTsmpqexje+q7pxcT+Rlkagdz75g3caHBfGcKt
         gvjbEdeYWD9AzhcWPwmesGAF1DTI/pZQR45bmV2b8aKnbjcfS9qGnmdtZRvgWb3Bpl/e
         CkOPCNGHS0oeKwQLeeFqvUkmmHxQvUBFUBYO/CQPBfgi/lqHl1KX5qa+pKW9uzgU4AdU
         JuRiJKs1KhKY+fuOiAc2tcl9wkWyxaRhtaL4yxF5vpqvilkZvZ8cJ9gdMUmt5LiMqnxQ
         ipGybrDRs+O37EGP5oxwdZg0aDPx10hNu3F1sPGqLTxBM88UX5ETRBsz/qWKJ8Xa/pqp
         GyqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gU27V/gx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv11-20020ad4488b000000b0045aa19e08b7si1922533qvb.501.2022.05.06.04.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 04:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gU27V/gx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmw3H-0002TM-3U
	for alex.bennee@linaro.org; Fri, 06 May 2022 07:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmw2g-0002T2-HT
 for qemu-arm@nongnu.org; Fri, 06 May 2022 07:22:38 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:41476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmw2e-00044M-WA
 for qemu-arm@nongnu.org; Fri, 06 May 2022 07:22:38 -0400
Received: by mail-yb1-xb33.google.com with SMTP id s30so12285339ybi.8
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7gsctiBwIuEVoCpDZmSg2ZOi0YNIRQ0f2vdtuaDP88=;
 b=gU27V/gxHSoAWRhENKT6OY9P79f+NM9Iphf5dBAckk0Cu/vKmnmbdGu11GHnwu9UKz
 RivlADUPzNn2bb0NvpJvJlL16/or9c4UIObfpch8yJpLtK/nvaibpwL61xvTTV2eW1uk
 RZmFP6skL188jjABoE2uQUbPwlJ8N2RTbxJuh33WQ3n9GKEY+4l4ma+ESV+gA2mBaXdj
 /ayvE7Mvm/SHUMAqrvJGQJGZk2v6k5etCfAsocz85NixIibT3Dox9wg+GAE6DVyzQFX/
 g/6X32vE5J9ZxIaQGuyZvYzuE924IHLEdxUeN+Movl7cX0+HkphevVaonICRVWkh/h+f
 aZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7gsctiBwIuEVoCpDZmSg2ZOi0YNIRQ0f2vdtuaDP88=;
 b=6QFp7MIga1gEMvDfsjPMNC1hiiyAeryFmcV6u6NF2MDM3/FhzdvkXAD2jjldpgwx2J
 2+P4U2nyaPXrtBv/iDYPeYItVdGxsQisqejf7hDnGWF5riuiz6zm9122fciR0wrYkuls
 NJmXyz+YGLnGyPqDt6UCgC6YlGx7WWS3/HX3HZ7zbKDFWRFiKXLTtNrR3so0L15Y5BCo
 jh2X8UoiDc/KHmBtE/O49Imz5qjhAz7He8uO8ADOVUANyME6nwIImeuI9wunvLoB/ojS
 DrOU4H/oQOhSXAzxzvThmTplpWynBsRZYKsX5zeRKQs1vNe996JTXFRiUIiQ68hmC7cy
 c8wA==
X-Gm-Message-State: AOAM533kdnbqRS+c0H06q59sFBdBg67FXJCSVn1rsdK08CqS+fUXHHYh
 zi8I9RDnSikc2V2vpMQ1n09zGQxTblW8PVUfvttoWQ==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1945433ybq.67.1651836155929; Fri, 06 May
 2022 04:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220505185006.200555-1-richard.henderson@linaro.org>
 <20220505185006.200555-2-richard.henderson@linaro.org>
In-Reply-To: <20220505185006.200555-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 12:22:24 +0100
Message-ID: <CAFEAcA_zyq=7nDWrvK=6tcLk14AAkc2T-pwGtoAZqpjvUEBx+Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/24] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8QenbJBj/L+a

On Thu, 5 May 2022 at 20:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> More gracefully handle cpregs when EL2 and/or EL3 are missing.
> If the reg is entirely inaccessible, do not register it at all.
> If the reg is for EL2, and EL3 is present but EL2 is not,
> either discard, squash to res0, const, or keep unchanged.
>
> Per rule RJFFP, mark the 4 aarch32 hypervisor access registers
> with ARM_CP_EL3_NO_EL2_KEEP, and mark all of the EL2 address
> translation and tlb invalidation "regs" ARM_CP_EL3_NO_EL2_UNDEF.
> Mark the 2 virtualization processor id regs ARM_CP_EL3_NO_EL2_C_NZ.
>
> This will simplify cpreg registration for conditional arm features.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +    /*
> +     * Eliminate registers that are not present because the EL is missing.
> +     * Doing this here makes it easier to put all registers for a given
> +     * feature into the same ARMCPRegInfo array and define them all at once.
> +     */
> +    make_const = false;
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        /*
> +         * An EL2 register without EL2 but with EL3 is (usually) RES0.
> +         * See rule RJFFP in section D1.1.3 of DDI0487H.a.
> +         */
> +        int min_el = ctz32(r->access) / 2;
> +        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
> +            if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
> +                return;
> +            }
> +            make_const = !(r->type & ARM_CP_EL3_NO_EL2_KEEP);
> +        }
> +    } else {
> +        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
> +                                 ? PL2_RW : PL1_RW);
> +        if ((r->access & max_el) == 0) {
> +            return;
> +        }

I did wonder if we had any cases where an EL1-accessible register
is marked with CP_ALIAS and we are relying on an EL3 register
(not-guest-accessible but still kept in the hashtable CPReg)
to do the migration and reset for it.  But I had a quick look
through and I don't think we do. (We definitely do have cases
where we have an AArch32 CP_ALIAS register that relies on the
AArch64 cpreginfo being in the hash table even when the CPU
doesn't implement AArch64.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
