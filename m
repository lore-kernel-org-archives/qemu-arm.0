Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1092863njc;
        Thu, 20 Mar 2025 09:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9q2a45lmdslzby4uwPnr2tme1juNhWIOrGhtJ8xWbGrZNehx4foQ7prdOybeFAVvw6BMjfVfkAa/bYg==@linaro.org
X-Google-Smtp-Source: AGHT+IGdW727/iaLm9zbPLQA7XyYeGdp2v2UCNzsw1Bz/XHmw4SomDZ4sZK56voMvP35vLVOWfHw
X-Received: by 2002:a05:622a:198f:b0:476:9e28:ce49 with SMTP id d75a77b69052e-477083fa83fmr127603401cf.43.1742489801109;
        Thu, 20 Mar 2025 09:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742489801; cv=none;
        d=google.com; s=arc-20240605;
        b=igEj5rSRDX+Xff/hQLliog1RKkcY+0xufPukFABbpfHFu3ZWkzEGEt5d8HJpzzON87
         pnc3Rbd0cSJRt+2/TVK1cGa2E/O+tDmhTSRDwRWm+ZNq8FrS4Rsu/XWJeUreskXOCnT/
         gxS7Pk3OR/GTkO5xNZc5kllKUzcsodtBfFmD094hkJn1f5xsPT9lLanBo7DTVpNe6xib
         n5fAiPZr1aeipZsJVHL41FJQA0mvakDPNl62KhGNJeTuOfgxDE9nYSvbpyYJ6ZFPyfUo
         lYHrvEVvE5R/83zXqXHs5KKQj6xQ2z/4f4qFqz250Th5wqlhXBwBERpveIwMhjq/zDWG
         HziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :mime-version:date:dkim-signature:message-id;
        bh=RQoIgeL4fO3BeHKQ5CMQfShjwnJSlNAjtNV/17HZLVM=;
        fh=gVUeIve6vpVB8wQo2LTV7udIiz34kFojxeEWmQLFOzY=;
        b=Q50CvajST0+vqq7Zs8atpy8Xo7D5pHTZhXWbYLfSLAwSApPT0IXW2QbTpI/xt7nTcz
         t+WIEVRcGUMUeIJ+6jD56jlEZlw+MSASRlb73T8mz1nCieHvbHC3+ctI+pTtUi3sWgCE
         DLeisqmbnbOhECYdaSpERrwo3b6MiszDWNWV3UgIJCYiLE1V2GgY+TYW8aG+BI6au6TY
         sD4zX3z0/wLF6qXCFcJ/3mn7SbF//fSSdQKA02gDt00Fr662/S0pmZNydNysJPuo5hu9
         biaKuii7W1nhMIveTUnAnJxCkI8wUPw3AhG8Y5FYlzzajJVebs8tdMOB+um4wz00GmKs
         x+zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=gJh6FMIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d15db46si1930891cf.60.2025.03.20.09.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 09:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=gJh6FMIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvJBp-0005kx-E4; Thu, 20 Mar 2025 12:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1tvJBk-0005kK-DP
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 12:56:12 -0400
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1tvJBi-0006uw-Gi
 for qemu-arm@nongnu.org; Thu, 20 Mar 2025 12:56:12 -0400
Message-ID: <d9c8d200-4453-48d7-b14a-8e15a7cf6602@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1742489757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQoIgeL4fO3BeHKQ5CMQfShjwnJSlNAjtNV/17HZLVM=;
 b=gJh6FMIPUtWWnXN4rUo1jOtRY9sqKc7myq5/83oy8op2vuT+kMPB2PsGvib7oviNF/64oN
 iNrc+lUnXbXJ8P8+NDHLS4b0qWbdfndGPObDj94juE0cgYj5vO5BMA5OJl3EuXH/1bvy17
 HlnvnMIDMnpLZliQyqA+6Ki+ht5Viq4=
Date: Fri, 21 Mar 2025 00:55:40 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] hvf: arm: Emulate ICC_RPR_EL1 accesses properly
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de
References: <20250315132030.95209-1-zenghui.yu@linux.dev>
 <CAFEAcA9YUmXA=bA4FERwqSEP86RFUhUKUcLvVVSV64p_QJKnbA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <CAFEAcA9YUmXA=bA4FERwqSEP86RFUhUKUcLvVVSV64p_QJKnbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::bb;
 envelope-from=zenghui.yu@linux.dev; helo=out-187.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jZy599ETVGsY

On 2025/3/19 00:56, Peter Maydell wrote:
> On Sat, 15 Mar 2025 at 13:21, Zenghui Yu <zenghui.yu@linux.dev> wrote:
> >
> > Commit a2260983c655 ("hvf: arm: Add support for GICv3") added GICv3 support
> > by implementing emulation for a few system registers. ICC_RPR_EL1 was
> > defined but not plugged in the sysreg handlers (for no good reason).
> >
> > Fix it.
> >
> > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> > ---
> >  target/arm/hvf/hvf.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 87e35c1b71..650b7f4256 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -1359,6 +1359,7 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
> >      case SYSREG_ICC_IGRPEN0_EL1:
> >      case SYSREG_ICC_IGRPEN1_EL1:
> >      case SYSREG_ICC_PMR_EL1:
> > +    case SYSREG_ICC_RPR_EL1:
> >      case SYSREG_ICC_SGI0R_EL1:
> >      case SYSREG_ICC_SGI1R_EL1:
> >      case SYSREG_ICC_SRE_EL1:
> > @@ -1673,6 +1674,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
> >      case SYSREG_ICC_IGRPEN0_EL1:
> >      case SYSREG_ICC_IGRPEN1_EL1:
> >      case SYSREG_ICC_PMR_EL1:
> > +    case SYSREG_ICC_RPR_EL1:
> >      case SYSREG_ICC_SGI0R_EL1:
> >      case SYSREG_ICC_SGI1R_EL1:
> >      case SYSREG_ICC_SRE_EL1:
> 
> ICC_RPR_EL1 is a read-only register.

Yup! Writes to it should result in an UNDEFINED exception. I completely
missed that point..

> But hvf_sysreg_read_cp()
> and hvf_sysreg_write_cp() do not check the .access field of the
> ARMCPRegInfo to ensure that they forbid writes to registers that
> are marked with a .access field that says they're read-only
> (and ditto reads to write-only registers). So either we should
> not list ICC_RPR_EL1 in this list in hvf_sysreg_write(), or
> else we should add the .access checks to hvf_sysreg_read_cp()
> and hvf_sysreg_write_cp().
> 
> I would favour the second of those two options, because it's
> more robust and means we only need to care about the access
> permissions of a register in one place. Plus we already get
> this wrong for some registers: for instance ICC_SGI1R_EL1
> is write-only but we will permit the guest to read it.
> 
> So I suggest a 2-patch series:
>  * patch 1: add the checks on .access to hvf_sysreg_read_cp()
>    and hvf_sysreg_write_cp(): they need to call
>    cp_access_ok() to check this

Thanks for your detailed suggestion Peter! I come up with something like

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 650b7f4256..a7ca7975e0 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1264,6 +1264,9 @@ static bool hvf_sysreg_read_cp(CPUState *cpu,
uint32_t reg, uint64_t *val)

     ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
     if (ri) {
+        if (!cp_access_ok(arm_current_el(env), ri, true)) {
+            return false;
+        }
         if (ri->accessfn) {
             if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
                 return false;
@@ -1545,6 +1548,9 @@ static bool hvf_sysreg_write_cp(CPUState *cpu,
uint32_t reg, uint64_t val)
     ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));

     if (ri) {
+        if (!cp_access_ok(arm_current_el(env), ri, false)) {
+            return false;
+        }
         if (ri->accessfn) {
             if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
                 return false;

I'll do some tests before sending it out.

Thanks,
Zenghui
