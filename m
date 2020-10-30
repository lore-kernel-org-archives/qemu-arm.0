Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1606380lfa;
        Fri, 30 Oct 2020 07:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfmKWKLyvo/fEH9BR79nEnoRPGFLUn+DS8ft63kfR2MD+aoIKtfPPKuZ04PKYDEgZ1b1SB
X-Received: by 2002:a05:620a:6d2:: with SMTP id 18mr2587461qky.280.1604069477980;
        Fri, 30 Oct 2020 07:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604069477; cv=none;
        d=google.com; s=arc-20160816;
        b=HG1hEnEbZ1Y2k6AvpDf/8OEIuTJ1UCEeSJMlsjl7seDaSEeiNb02P0yth5abNOQKbQ
         6v1UpGvgb5war/kHrqX2Zr7oZvH4CU1XL57pc9Zk2fvQnM7vIJREo/70aSDnhDWLWbqG
         RgYRUww1q0MKs7XURzmS9I2I1cR1naXtFk+tDhTKpHcGlwDXogKBfjSI5ny1EyVphOpZ
         XUmet8jiE4h9vBHdDn4Q2KgOeNadF0HQSTOFbRjAykR2OZIJeFySlpDTX47VpJ2hfKSk
         aCW+ImO3WZsP8vnHMp3FK1LDXKUMu3a1AA1GidqfagQzHUwGJsMbxB56VQI6ncDw6oQy
         D30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45FXYFF3j1vdIPopUUAd5Urhixk5oA2LuWDIjFKJxFA=;
        b=RQ+XH8fGIdZtIgSjrSi52gb8FVGRVpMTuU0Wv90Zt8C+5BR5lMPQzNSrKmpQLjiZ5o
         IP+P4h0HTu9wZYUUC3gvLMdb1BJT/AXpwn0di7m7HBB4seEYcgiE1Zk/uTx+G9msaVsN
         641WKihJD9f0P/veyezL+2JBA7Op27xulyEIM4gzw13mKV+5pNq8KQNqDwXnA4F74zK1
         rRR0yMX11HR5VaDAecvP57gUYUHflbbmp89zUSjp0ymMGHByXjv1rA96UPS9/FPTaPzR
         Bn0N/L165HAAGCl8aRbdbzx+7oVK3ZJvO6ZqB5osdyyYzACSWvnGSyI+mdRx0SJQZgxv
         44Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWrTv2bV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si4115259qvd.60.2020.10.30.07.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWrTv2bV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVkL-00087y-AG
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVga-0003vz-8C
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:47:24 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVgX-0003YA-Q6
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:47:23 -0400
Received: by mail-pg1-x541.google.com with SMTP id h6so5399194pgk.4
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=45FXYFF3j1vdIPopUUAd5Urhixk5oA2LuWDIjFKJxFA=;
 b=gWrTv2bVAHPgjBsPDbMwE1pCiCN+/VNVlwQOPqOLwgpTUb+0Bmd+ayOJUi/cDP/pum
 YSQ994WYvcz+2RHVZkypM4CHbQn02+vI5JJvrp7EjmSkXpVQtxgOSAKjT1hV/P9YxOJq
 igzbv5sm+zFAlc1J7G/gUFUxvTV+53u8Q1CA6ikEbvZM1SlVVLVKIXmDy5vlf/4WhGRd
 XM3JJx6SWItLhEngBPFiasd8psouMQfxz34xjzfu3h6K6gGqDPgz7mUsiK9fZYaeDvls
 cj5TzOgMrwyrQdfLXwoIWVE++b4N6VJK7MvcnxVN9F6qIO/wLx56UJxEgNtbfCwGGIe8
 Ip1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=45FXYFF3j1vdIPopUUAd5Urhixk5oA2LuWDIjFKJxFA=;
 b=Krzw1fU4aZp/TmxQ5Q/LtJoOU/Im496aNUQMPSwGGI9c430Ab6Exavnch5Rn8V2hO9
 gHDgCrMq1ruhG9DLokWGaqJQVaF5pGuQgN9hoJHFJ0KoDJPivFjMPrdxNEbDBBur4STs
 VLlE7iVjFgCq7kTXVH67kTEPnIRqUB290kv1Zft8U+8VYb8w7l0FQfq6yHNz1lkMB4Z2
 j6IAAhOEZp40RvoBIXYD8gvQClcF/z0kgun86x/n31b5F/YOy41wODRrdkL9xHcRCMoe
 /rEHlnvw+CbVmnE3kdxohkdVMbSc9SzVVYgTJ5AD65+Itgu6IHOlO26yOLG5q4upatQp
 VGog==
X-Gm-Message-State: AOAM532RvczEj385gTeMq0SYvur8GyO+eomtu4muvWOxUt2aptYFDNry
 B1byI0fie5E+onaxIlnmVvK1i+kf6/znG5uoY6WJ4oBoVd4=
X-Received: by 2002:a63:6d4e:: with SMTP id i75mr2539192pgc.305.1604069240523; 
 Fri, 30 Oct 2020 07:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201022164408.13214-1-peter.maydell@linaro.org>
In-Reply-To: <20201022164408.13214-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:47:09 +0000
Message-ID: <CAFEAcA9BZ=njKsnErZf9tgAmZXw4=rEiNLkPoPS-phbT2ptxmg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Get correct MMU index for other-security-state
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/tOgr2oxV7g

Ping for code review, please ?

thanks
-- PMM

On Thu, 22 Oct 2020 at 17:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In arm_v7m_mmu_idx_for_secstate() we get the 'priv' level to pass to
> armv7m_mmu_idx_for_secstate_and_priv() by calling arm_current_el().
> This is incorrect when the security state being queried is not the
> current one, because arm_current_el() uses the current security state
> to determine which of the banked CONTROL.nPRIV bits to look at.
> The effect was that if (for instance) Secure state was in privileged
> mode but Non-Secure was not then we would return the wrong MMU index.
>
> The only places where we are using this function in a way that could
> trigger this bug are for the stack loads during a v8M function-return
> and for the instruction fetch of a v8M SG insn.
>
> Fix the bug by expanding out the M-profile version of the
> arm_current_el() logic inline so it can use the passed in secstate
> rather than env->v7m.secure.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 036454234c7..aad01ea0127 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -2719,7 +2719,8 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
>  /* Return the MMU index for a v7M CPU in the specified security state */
>  ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
>  {
> -    bool priv = arm_current_el(env) != 0;
> +    bool priv = arm_v7m_is_handler_mode(env) ||
> +        !(env->v7m.control[secstate] & 1);
>
>      return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
>  }
> --
> 2.20.1
>
