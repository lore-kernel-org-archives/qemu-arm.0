Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2586795ejq;
        Tue, 9 May 2023 02:25:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44bnZvFC+fFPHr/LsVCzj3h8rr9WikzoV5IzpSnUx5lZqhLmm/ifD29EwRYeWnF3GyqqjP
X-Received: by 2002:a05:6214:2aa5:b0:5ad:2a05:ddd1 with SMTP id js5-20020a0562142aa500b005ad2a05ddd1mr16468215qvb.34.1683624338429;
        Tue, 09 May 2023 02:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683624338; cv=none;
        d=google.com; s=arc-20160816;
        b=Igi9rVTX6iAMy+vNbcBjh+Xyto2gfACuIJObac/1ZZ9lqAvj+/M2LMZFLJzTORoKpF
         sw2uHM6EV2JkoIl9tK4EM94qALh1NahYMWj6E05XADcLcFKp/YY3k92reUldDDrMVzuc
         aVzuPNonzq24MI3t8HCN1gbQcBi6NuzzosH/Nsy7YNYFnqcJlnqEncbRued3JaQrlyn3
         iUErFJ/VhwwfreewOaB9RsIZzlR6N3ZorcFdYfMaJmmzJqpDvZiveNv+FdkNk3BbczRC
         PSbwjQMT0pdSbDSYRPaSZtURoIeGCEwm7DS+rHUaH81slA4l7GaOuLyFaWe6MZ6rUaNe
         7B3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zftOKcOsUhu3qbc4DdwFnG4UymaAt0p8Je9qu6wvSXg=;
        b=u7sryblNoLfPHfEj0T0FW3tWi/eNVI5wvNi1hE+3Es8JDqFPJx7Pz1LG23l5+PYOxP
         ifuCUOh/wSOYs4S1Z2FqHMUz22iFXLw0KhKi6yaZpVSsn/v4bFYfyfzvinAt2vCJJKK+
         YyUgA2kVrKGynsCdqwXF4O5VZDJssial+ewEl9/1P265vBycIRDMw8rVssVD4auag6uJ
         jNVmcMOBbkLc4JXQKnJo94DtOP1DB4id8TTfeDhrqwRUKsJMvmP+ahVDx8LN4zX6ZRyz
         WixEFNbuxrjiYN74rlTc4KESDgzUInCXEolH2qM6pgAiLPrmmptGaitdayYbVWOPoT0a
         VwOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i137UA2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy11-20020a0562140f6b00b0061b75442085si773778qvb.40.2023.05.09.02.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 02:25:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i137UA2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwJb1-0003rZ-N4; Tue, 09 May 2023 05:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJb0-0003rD-6F
 for qemu-arm@nongnu.org; Tue, 09 May 2023 05:25:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJai-0000Lf-KZ
 for qemu-arm@nongnu.org; Tue, 09 May 2023 05:25:21 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so10888623a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683624302; x=1686216302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zftOKcOsUhu3qbc4DdwFnG4UymaAt0p8Je9qu6wvSXg=;
 b=i137UA2FKjxPMFyt+/fvUFZbUDdEruiNlNCIY9D0TqC4+T94E9FLZTL9DaUkAh7OYb
 Ee4fRsxUFw1MzUiqppDz74fK6gnul9bajB4IU0n7/8dlE7nmSipvI9AAs/ACzpyIvkGH
 SagL8eao0zpaJ3rlhxcra83WC5TTjkDLxhIReCkzBgnPI1qszlHJHHR1Pk27NEOuaLb0
 XvKWeWtrOidz63Iz1ya3l4Wpa1rOSDfr8kAD1/B7Dh82p0HrPrFAchIs1QVy++vu7j/2
 sCDVBjsWs3/Ue27XWVTfjTK7FNCQGsMktLywiZko/n3SAZ+Q7ZucJxeONF3cdmNlE2Ma
 g0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683624302; x=1686216302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zftOKcOsUhu3qbc4DdwFnG4UymaAt0p8Je9qu6wvSXg=;
 b=IFRb7NjTM+v7yg8cWMKZNIQoPJPoFrXNSAlK+73i7I5Vj59URR62HY2TXUansaliS7
 KBaTOuM9rbrIxsa9igEMPg/AZLymW9zFkjxWlneMrC5Q+Dh7QeKx15iqECOP1k15rnRD
 GXbxR0kj/UPtDIK9TygS2gMshx/xQEP+1Rc9mnvph0if3wbvln7zf2/vPXggEMLPVGZa
 C8ldiHmlAurNuydC6KoQPvQgRjDNsqDD3LLp1teVtHLPZzCaxL8+ELzUoP2pt4zPI8Rn
 VaMwHIKSp82Snf2SwG0Dg1jGWDZvak1XiSpN6jc+MpJ9IVZhDUv3nZSPozJM6MuwN2nX
 YmZw==
X-Gm-Message-State: AC+VfDz72zOrKVu7q/xbrb0H96jWevD4CjDEiImdPHylMKxJBu8hmeHd
 GKb+XhNhY51XakNNf5de36+kQduMiE2bhf3BIC9FiA==
X-Received: by 2002:aa7:d54c:0:b0:4fd:2b04:6e8b with SMTP id
 u12-20020aa7d54c000000b004fd2b046e8bmr11060846edr.29.1683624302292; Tue, 09
 May 2023 02:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-31-richard.henderson@linaro.org>
 <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
 <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
In-Reply-To: <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 10:24:51 +0100
Message-ID: <CAFEAcA8h-+U8MW1b1QfyoX=vjZdMLi4EcjgsARNb4AKpn35sgw@mail.gmail.com>
Subject: Re: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9sckjTr2jTTG

On Mon, 8 May 2023 at 16:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/5/23 13:19, Peter Maydell wrote:
> > On Wed, 3 May 2023 at 08:17, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
> >>   1 file changed, 7 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> >> index e997db2645..64464ab363 100644
> >> --- a/tcg/sparc64/tcg-target.c.inc
> >> +++ b/tcg/sparc64/tcg-target.c.inc
> >> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
> >>   #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
> >>   #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
> >>
> >> -/* Define some temporary registers.  T2 is used for constant generation.  */
> >> +/* Define some temporary registers.  T3 is used for constant generation.  */
> >>   #define TCG_REG_T1  TCG_REG_G1
> >> -#define TCG_REG_T2  TCG_REG_O7
> >> +#define TCG_REG_T2  TCG_REG_G2
> >> +#define TCG_REG_T3  TCG_REG_O7
> >>
> >>   #ifndef CONFIG_SOFTMMU
> >>   # define TCG_GUEST_BASE_REG TCG_REG_I5
> >> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
> >>       TCG_REG_I4,
> >>       TCG_REG_I5,
> >>
> >> -    TCG_REG_G2,
> >>       TCG_REG_G3,
> >>       TCG_REG_G4,
> >>       TCG_REG_G5,
> >> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
> >>   static void tcg_out_movi(TCGContext *s, TCGType type,
> >>                            TCGReg ret, tcg_target_long arg)
> >>   {
> >> -    tcg_debug_assert(ret != TCG_REG_T2);
> >> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
> >> +    tcg_debug_assert(ret != TCG_REG_T3);
> >> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
> >>   }
> >
> > Why do we need to change this usage of TCG_REG_T2 but not
> > any of the others ?
>
> To match the comment above.

To expand, what I mean is "when I'm reviewing this patch, what
do I need to know in order to know whether any particular
instance of TCG_REG_T2 should be changed to _T3 or not?".
All the sites where we *don't* change T2 to T3 are now
using a different register, so there is presumably some
logic for how we tell whether that's safe or not. The
"no behaviour change" option would be to change all of them.

thanks
-- PMM
