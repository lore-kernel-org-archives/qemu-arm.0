Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3066706lfc;
        Mon, 1 Jun 2020 05:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxpvO4qrwFmOvietTPADB4uJJOtzem1koMOAg4+Q/dNZQ8edStc26bOhLo21gfbOZ2V4SF
X-Received: by 2002:a25:774a:: with SMTP id s71mr35754145ybc.518.1591015287930;
        Mon, 01 Jun 2020 05:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591015287; cv=none;
        d=google.com; s=arc-20160816;
        b=0pQWnUB+w1Nl8X8w0BQpSG1JI/4QuKtA0Sz/SHxQzEaPOQgQD5/cCZuWqJpP6JgwNJ
         6dgQkFFwQzMNU3u/25gi5Qb5Wt9d27IagDweHPSWfgJuH/rlmg1yKL78xea16l/dq9LA
         6sixdw4wj0BPP/NeT7+BM8fjMIXd1136usoq41xqlZhCgHsN2jcULqv5LIF4HzYEDCus
         uDQ4Cf9+RlrKMzCHi2pFm0vJm3SLm7mHHkz/aljDt/uHOV+Zn9/01hpQALnTZk8twKO2
         QvttCevr+fs30JgxTnD8DBV+7REw0s9kmv5+1TXNyNt6tYV28E54/tVB/FMyNxkUJZLJ
         38Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cQwu++5r97GefBBbzXmn7DEQRMqtA0rO8DZSn+gEpo=;
        b=OlqeqI/yMgfPSutoM0W3ilKTysIOpXbhdCcgmHO5Il0Wp00TsvysfXFfcdA20uKgGX
         QJM3nmsynY9Ie+wmZayKoiH9o+fQS88TVKpauJjzARR9LSzyOXvFjxJ1TJrJlYx6yIWL
         IaWScb/kEKZuShVs7rILqZe0KjPfPnLEtgtxC+chOoo68RX8TQqbdozrAqFQEdZuvosX
         iRxI+Y7gDZOyja4uIeGQrt7Spf81+hE3fP3+62o25AqmdXzdCp4l5rrCqF3VQaghRzYA
         62UDHqJJUC7PdgAgfsDh8UXUsTR67b7E68cFBpjs1wP+7OF8+T4jncH/AfCPyfy5B8IH
         lOnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G6KW+VUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d185si10399998ybh.330.2020.06.01.05.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 05:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G6KW+VUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfjkt-00047t-A3
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 08:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfjkg-00045u-EE
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 08:41:14 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jfjkf-0004qU-Ew
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 08:41:14 -0400
Received: by mail-oi1-x244.google.com with SMTP id j189so1269952oih.10
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7cQwu++5r97GefBBbzXmn7DEQRMqtA0rO8DZSn+gEpo=;
 b=G6KW+VUiLGIR6D2R8dhWyJ8YxJrD4RLr/E/DFzz22yFJ5wAB+bZmKCR/i2uIcyLIOi
 dMACfGV8ca8aJ4y3lxkva+LUdk1TwEENIYABdiJaacgPN7Knx7jgZAK5+lVKzdbtkq6q
 rrTFUbRkvY/4GhGrEsYgnP2QJfHuUE+HajOrMFws4Hg9tagFQ7uirJlC54iYCwzvt5iH
 sViC/IMgu+upMKlgJz8YuDmHM83z3k51zmdThm6nwL5WLFjJgFCeF2EguOZBcFPwzdI3
 fR0h7D9hUPVMWa1qxJiWERp1tEmcOFJzkDoKaqCnXn83Oi/39RiPi0Iz2i1pSgavA8XQ
 MxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7cQwu++5r97GefBBbzXmn7DEQRMqtA0rO8DZSn+gEpo=;
 b=EQVnBD1Pg8tX2cLc6kEL9IISvqURN2q7EDlt3liNrU+J2uwbiqzx64vAj/pP87RNrM
 sSPXoJzSsNJ50LLArTEWXQJx4UWEeygo/gRrd2ggIA9xy3VmiwAtsMbwdE02d0VGkRW3
 6HQ+7mRDLf5QP1jFKlPG3R95wxefheDwdXaz5s9BfFYO/L0tJWrzxUjsv2Cw0o2X1BXZ
 T8cK25vyRR7k+HpGfat1S39QyqMki0CmcBQnnhuLqJdgitLSaoj8PGYRqgB/wfrOTMZo
 ZNkpjW6+8j/quBdS5hR1s96VHIFAC5Z55XaAWPx0Em0SMA6YcMC5apOW41VjyTOQNze5
 0vAA==
X-Gm-Message-State: AOAM531//P2mkeRJ8InVAhrSRBZjIM30LUZZQmHSlDtUBdyUhIK3NtLD
 aG5Opy2yUAlR6ikZgfnbmE46Na9qVP582lJRk/xQ/A==
X-Received: by 2002:aca:5152:: with SMTP id f79mr3697194oib.146.1591015272318; 
 Mon, 01 Jun 2020 05:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200530092204.1746-1-fangying1@huawei.com>
In-Reply-To: <20200530092204.1746-1-fangying1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jun 2020 13:41:01 +0100
Message-ID: <CAFEAcA91gsTpkeH6SVPoGKDFOgCJVxV=wvBOT57eagcYeMiarQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm/cpu: adjust virtual time for cortex series cpu
To: Ying Fang <fangying1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wu.wubin@huawei.com,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IF5LSaHxaHXR

On Sat, 30 May 2020 at 10:22, Ying Fang <fangying1@huawei.com> wrote:
>
> Virtual time adjustment was implemented for virt-5.0 machine type,
> but the cpu property was enabled only for host-passthrough and
> max cpu model. Let's add it for arm cortex series cpu which has
> the gernic timer feature enabled.
>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 32bec156f2..a564141b22 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1973,6 +1973,9 @@ static void cortex_a7_initfn(Object *obj)
>      cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
>      cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
>      define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
> +    if (kvm_enabled()) {
> +        kvm_arm_add_vcpu_properties(obj);
> +    }
>  }

If we have the same bit of code in all these initfns,
that suggests we should probably actually be doing this
in some more generic place conditional on some cpu feature
or other test. The commit message suggests we should add
this property for every CPU which is using KVM and has
the generic timers, in which case we could perhaps
have the call to kvm_arm_add_vcpu_properties moved to
arm_cpu_post_init(), and then have the kvm_arm_add_vcpu_properties
function check the ARM_FEATURE_GENERIC_TIMER flag to see
whether to add the property or not.

thanks
-- PMM
