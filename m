Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp296017ejf;
        Sat, 28 Jan 2023 06:35:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+hGO6IhO2tBlosqRfZ1cmj4Zbe0RsZ1ndSfQR77u/uizo0imEAgBKBTSUemr+nrAu91YQa
X-Received: by 2002:a05:6214:2d01:b0:537:7d20:d73 with SMTP id mz1-20020a0562142d0100b005377d200d73mr2626388qvb.4.1674916527432;
        Sat, 28 Jan 2023 06:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674916527; cv=none;
        d=google.com; s=arc-20160816;
        b=iiZNmqSQ0BSMTx1wpkJECsi4r1UrLfRgbAA3LHccNUFtXz5Hn//25My2S6ybfkVLw0
         QfMb7q51Wckx9g6saw/fUlCcIuClm1rb/U3hW7WCDdOl24HTlHqTcXlaXvWyj042vjhy
         cBIGy5lJDSk+TdZ378A7Pm5c6DBJArunQsS42KldxUnwKr+JonHqTqUy5WaOOaeB+gqH
         NIo8kglgwaI/9uqrpasQDN+pRjxtMZH3Q/VymXTIrUMCvwEpXK67n7M2AaDTVq/ETz9C
         Ln/fsUY+zxZjfERA2YFyZREhhCPgwHa0feXLlmgZEkUSSs9hj9OFJtqpcP5BoKIb9ySW
         1pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y41jnePD/0n08qsGPNOrpCvCVcpHuz+/LFkK0hxmsmk=;
        b=QcDlAPIBAgArEIDjdNpnueHwoWSSuu51SmpzNgpHo4nmUXC6Um8KQ3k2ADHTrxVcx+
         SipbHVoiAcVNkghmSptzW7hSITpNSMbmYkkrahZ3LhjLCHwwSntmGzHpcuvmueY7cqU3
         jhgwqzzeJUBlcWOClKS3fkia2yq4w9wTpY35LUWKcGdHR1IeXg0AyvMW/n37c/rr80wi
         mKuqvzgI6Edz/L/5p0OKrAcm/1XSnm+5y9FwLzQvoLasQOcnwfY9arrX9M7l22JiO1ij
         8aG+g5WNE4Hcnc7Zeys3CNS1Cg/3aeIGLRBXWmyJTqQDDJ52WHiCHVasWPMfBcExb6ux
         g09g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpOnhNCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23-20020ae9e517000000b0071cb5762182si294659qkf.261.2023.01.28.06.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 06:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpOnhNCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLmI8-0000Xd-1x; Sat, 28 Jan 2023 09:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLmI6-0000XK-T2
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 09:34:50 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLmI4-0004xf-Tm
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 09:34:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id r8so738262pls.2
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y41jnePD/0n08qsGPNOrpCvCVcpHuz+/LFkK0hxmsmk=;
 b=vpOnhNCx5mM8sCtCVPSd9gYVlgLactWlki4G998+aTNgcZmys+rXXjsdwuqmbNZvoF
 gQXnjIH3vTtQckcbP4F6WgVV+SIit5ANAnXmK0AnV2zVcNGQjCXdZTSUOVRJzaLxxMa/
 c//sXPZo1myqcKEH6e4rl43PpcXWEdwB1a5LnBhJrH6WOxTAL1nAywC9ZQFRDzjkJ8gm
 gY/xbiEapIVE3iCiNxTYAKISPDmQyZn++9f7CRZ+DU6giME8Rm0H/26DVoRwQXZi+ccn
 Bgn1SXF72DbBdRqjJtjcg6aMTezfEf7Fn6GN+LS3rVzSPI7udq0Py9aWSOVi3yXWx8eD
 nlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y41jnePD/0n08qsGPNOrpCvCVcpHuz+/LFkK0hxmsmk=;
 b=itWWPXkYhoPlKEVnwZijZjmdo5hDrqYvuJYGuecjETCYwVk5HZl8oFmFIb5knMKZVq
 qFvaiQBPCM+V94CaMgOhbZJpi+6+s1l3HdFhfUZ2rtgNZJWqHsQmrJ2YFknRh84fyEf2
 CF8dojJDvFRkjQKAOAaIIZIRqbeIkfMtNNhrwRGgytK6LoZuhZYRAgoNDIjoijxsgC+v
 rkubqaolZ0kZBMepIRxRT7+El1nEmYily6wHr/tcsF9Ms+AorJbQfJOj9xcBlrqb1xsg
 2b8TB9s6xexNC8Bze6jxOSLr89ycuNY6tiFysz4mZb4WfVAF9V+/wcZ8f36716xhm1hY
 3DCA==
X-Gm-Message-State: AO0yUKWbzXjRIk8iTtpL2PtpfA8UAs0emCQdoI8K0KyA5mUHF0P361cT
 IexiNOYWWE8jkPcFtpxeyF0TTI1yQVgZZQvFxeU1KQ==
X-Received: by 2002:a17:902:6b86:b0:196:3b96:6a1a with SMTP id
 p6-20020a1709026b8600b001963b966a1amr1560959plk.28.1674916486028; Sat, 28 Jan
 2023 06:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-7-peter.maydell@linaro.org>
 <351b2481-4e80-57db-f06c-3dbf95db06fe@linaro.org>
In-Reply-To: <351b2481-4e80-57db-f06c-3dbf95db06fe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Jan 2023 14:34:34 +0000
Message-ID: <CAFEAcA9hRd2ZEvJhS5brfsnw5WqvFqVvDhA-aZpb4uzFyF-xDw@mail.gmail.com>
Subject: Re: [PATCH 06/23] target/arm: Make HSTR_EL2 traps take priority over
 UNDEF-at-EL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XPhbo0pmGq6q

On Sat, 28 Jan 2023 at 01:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/27/23 07:54, Peter Maydell wrote:
> > +void HELPER(hstr_trap_check)(CPUARMState *env, uint32_t mask, uint32_t syndrome)
> > +{
> > +    if (env->cp15.hstr_el2 & mask) {
> > +        raise_exception(env, EXCP_UDEF, syndrome, 2);
> > +    }
>
> This is so simple...
>
>
> > @@ -4760,6 +4761,28 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
> >           break;
> >       }
> >
> > +    if (s->hstr_active && cpnum == 15 && s->current_el == 1) {
> > +        /*
> > +         * At EL1, check for a HSTR_EL2 trap, which must take precedence
> > +         * over the UNDEF for "no such register" or the UNDEF for "access
> > +         * permissions forbid this EL1 access". HSTR_EL2 traps from EL0
> > +         * only happen if the cpreg doesn't UNDEF at EL0, so we do those in
> > +         * access_check_cp_reg(), after the checks for whether the access
> > +         * configurably trapped to EL1.
> > +         */
> > +        uint32_t maskbit = is64 ? crm : crn;
> > +
> > +        if (maskbit != 4 && maskbit != 14) {
> > +            /* T4 and T14 are RES0 so never cause traps */
> > +            gen_set_condexec(s);
> > +            gen_update_pc(s, 0);
> > +            emitted_update_pc = true;
> > +            gen_helper_hstr_trap_check(cpu_env,
> > +                                       tcg_constant_i32(1 << maskbit),
> > +                                       tcg_constant_i32(syndrome));
> > +        }
>
> How about
>
>      if (maskbit...) {
>          TCGv_i32 t = load_cpu_offset(offsetoflow32(CPUARMState, hstr_el2));
>          DisasLabel *over = gen_disas_label(s);
>
>          tcg_gen_andi_i32(t, t, 1u << maskbit);
>          tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
>          tcg_temp_free_i32(t);
>
>          gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
>          set_disas_label(s, over);
>      }
>
> which also eliminates the need for emitted_update_pc.

I really dislike use of brcond in generated TCG, because of the
massive beartrap it sets up where all your temporaries get nuked
but there's no compile-time checking that you didn't try to keep
using one after the brcond. So I generally prefer an approach that
avoids brcond over one that uses it, if it's available.

thanks
-- PMM
