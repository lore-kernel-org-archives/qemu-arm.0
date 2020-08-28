Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1438075lfc;
        Fri, 28 Aug 2020 06:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpM5Kb6HlYQG4nq/VfArXlpftVCnUSuuEULxolDVm45XgPLx/2mJV0/IPWTMWDTFFdTwwV
X-Received: by 2002:a25:da0e:: with SMTP id n14mr2067611ybf.307.1598619831128;
        Fri, 28 Aug 2020 06:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598619831; cv=none;
        d=google.com; s=arc-20160816;
        b=dqY+fW5/8OZWgpgi+wTQvBXBPvAlXjQlnVlvDxRC03F6wy5dYsEPwscIoHEwpx3myC
         1VniNqCoCr+psArqbE1kyF4XEq8AXwBnQggV3gCxwBMJd3GZM+x1SMMU765+9dI7voEg
         gSBDENGuzWW3txKVTTNqBLfYcGA0nDDfT/w4EweKTYqZ+10L1HtH9soBZUUtqqr2FZUE
         FZ5NvTFZg450KwYbQ0wJfPqfHx7vRc1+t1qDCqJGpBNda4wQqjlk/puFz9cXGzkNdL7c
         hU6d9wti3PUac9AA5O8rrukjRnFMn1OADrlebSc0vLOaXVDQlfPrTUGnDrJCLJrI7UnO
         j9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=USWkyQHcJKd4cOWWD1fK+eXPIc31EoLnhUVkQz4zIoY=;
        b=CptcstMuUqkXsq+o7WlfeaVl2CypYYUdujgX3rLx/ngpQeHzunDvYlBsunx1rmNjpm
         CA6s16TE2CMfhABzBfvNRSnfvF3zP6ZmEOPk15OQjsyUWlh/EepxA8AIjrWDWDb0aymi
         +uWoBCdv6/5Z1FBl6zgqOtFv+XmcDeTIIsI4MNCvqWtJoKLu3UMRfpUM1MWvuUZFw6g9
         S0o45hjyQpYWCBiqPU6PFnk3uyJHSiscxDUqspfG5YuRBb+L6oF09CU/IPt5KUwodsG4
         2QOJpLh71dDwyXrwHah1s4up1aHhXvtHgQ1KYSjfCl0eePAFym0/B9eqftvRV8nuI/AK
         YlQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=FzOmqbT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si913110yba.83.2020.08.28.06.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 06:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=FzOmqbT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBe2o-0005F1-Cs
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 09:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kBe23-0005By-2O; Fri, 28 Aug 2020 09:03:03 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kBe20-0000PN-Mt; Fri, 28 Aug 2020 09:03:02 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3C50B21C77;
 Fri, 28 Aug 2020 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1598619775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USWkyQHcJKd4cOWWD1fK+eXPIc31EoLnhUVkQz4zIoY=;
 b=FzOmqbT5b1lnljvY2znZIJC0pRllvcr38tSgbzhFmR0LVvuu1A29mbnZ6VRAwrsV61diKb
 a9S5w4WBjo0UgeqBaZIIHcgsF4RQR4SF91qx2z7RcLRH/z9IHt6So/HXmEaZq3RiPXosVT
 7Hi7G9iJypztHwMRLQS8F2O0rZERBYY=
Subject: Re: [PATCH v1 1/2] target/microblaze: Use CPU properties to
 conditionalize bus exceptions
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200828113931.3252489-1-edgar.iglesias@gmail.com>
 <20200828113931.3252489-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <6274ca9d-9c7a-948a-533e-1ecba6bda349@greensocs.com>
Date: Fri, 28 Aug 2020 15:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828113931.3252489-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 09:02:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kK8DpBL/gHue

On 8/28/20 1:39 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Use CPU properties, instead of PVR fields, to conditionalize
> bus exceptions.
> 
> Fixes: 2867a96ffb ("target/microblaze: Add props enabling exceptions on failed bus accesses")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   target/microblaze/op_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
> index f3b17a95b3..13ac476199 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -490,12 +490,12 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
>   
>       env->sregs[SR_EAR] = addr;
>       if (access_type == MMU_INST_FETCH) {
> -        if ((env->pvr.regs[2] & PVR2_IOPB_BUS_EXC_MASK)) {
> +        if (cpu->cfg.iopb_bus_exception) {
>               env->sregs[SR_ESR] = ESR_EC_INSN_BUS;
>               helper_raise_exception(env, EXCP_HW_EXCP);
>           }
>       } else {
> -        if ((env->pvr.regs[2] & PVR2_DOPB_BUS_EXC_MASK)) {
> +        if (cpu->cfg.dopb_bus_exception) {
>               env->sregs[SR_ESR] = ESR_EC_DATA_BUS;
>               helper_raise_exception(env, EXCP_HW_EXCP);
>           }
> 
