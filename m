Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp198178wrs;
        Tue, 12 Mar 2019 01:10:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEPNs2Kcu2tFIcqTiLiHJU0AHoX0N1Cn6NieYJwAFuiXbUMrYxHctIRlYFl0Kj/uBOR3xY
X-Received: by 2002:a25:8149:: with SMTP id j9mr31665692ybm.400.1552378206192;
        Tue, 12 Mar 2019 01:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552378206; cv=none;
        d=google.com; s=arc-20160816;
        b=pfXxSgEkANtECxzezjogOX8LPDaGe1Zuj/bQM7aTmHEuj0LvtbiKaCpQF3kb0tWV7q
         N5Sj9exx9blIaWKeampUm51u3uSK0U+iwBOM7hqaF90EqvqDG5SEfVUSj/yVDt9RodBM
         7ruNXe4CVBst8FHBw/T8opce5kcA05hBaGoDiZY3E8ykR2C27Fr7LQtFuOWm86phGp/1
         eF9iKjV1+97cije/N4YNfVazx4k3CKoBRxU9cGOobh2Ukof9C0sFvo2ZiHU3FrtsDKHb
         OPBDxNYq+XG9dbjyEbwBnWxzyc8oVlvj8lAy/kMU4T2w+RV7dQ6a+TbxgyX5RYoZo/Y1
         upqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=NIOUTkoZWVy62INvopqdFJX17YL7jbOhYGHaRoTIeOM=;
        b=YZYHWwaVoODGFAGKDHPZ7zOyFo6GlUTkpBMPgKR2IB/SqVliCfskNTXFmucwvCIZfK
         /H48o1M1gYHe5d90cS76J7FvfJ1bMmegQ1BWBaPbFXraOGfIo3rRUAB0PE4VEZhAbzf5
         jxrhZ809XNlXCdTerluYHSqvUE63C2qVcqHy3vojHr3nPhf+P2PEOWtNoKi3xCKAlUNb
         axne3JTeAfrYmPbuGatuBB7IF0/Xc+M3/3JCNamVIhvggm4u1Zz0IT5PAq2yPGKgbwzB
         Q1K23i3MB7Qpn8qMIn9wOK/o+mch7xk/ldZ2RSlFdhrPtxih68fzV6EMo7ZKsiJRMFSK
         wwAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si4433958ywx.313.2019.03.12.01.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 01:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3cU9-00073l-DT
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 04:10:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3cTc-0006j4-QD
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 04:09:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h3cHT-0006QG-2W
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:57:02 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:45188 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h3cHS-000661-K4; Tue, 12 Mar 2019 03:56:58 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8A80C558C82E02DCA05E;
	Tue, 12 Mar 2019 15:56:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.408.0; Tue, 12 Mar 2019
	15:56:44 +0800
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <5278c7e7-ae5a-0540-6cd0-c2ac35403443@huawei.com>
Date: Tue, 12 Mar 2019 15:56:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [RFC] arm/cpu: fix soft lockup panic after resuming
 from stop
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: el16py9wj+Pr

Hi all,

I'm sorry this patch failed the docker-mingw@fedora build test. I'm going to move the code to target/arm/kvm.c.

Please ignore this one.

Thanks,

Heyi


On 2019/3/12 14:09, Heyi Guo wrote:
> When we stop a VM for more than 30 seconds and then resume it, by qemu
> monitor command "stop" and "cont", Linux on VM will complain of "soft
> lockup - CPU#x stuck for xxs!" as below:
>
> [ 2783.809517] watchdog: BUG: soft lockup - CPU#3 stuck for 2395s!
> [ 2783.809559] watchdog: BUG: soft lockup - CPU#2 stuck for 2395s!
> [ 2783.809561] watchdog: BUG: soft lockup - CPU#1 stuck for 2395s!
> [ 2783.809563] Modules linked in...
>
> This is because Guest Linux uses generic timer virtual counter as
> a software watchdog, and CNTVCT_EL0 does not stop when VM is stopped
> by qemu.
>
> This patch is to fix this issue by saving the value of CNTVCT_EL0 when
> stopping and restoring it when resuming.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> ---
>   target/arm/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 96f0ff0..7bbba3d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -896,6 +896,60 @@ static void arm_cpu_finalizefn(Object *obj)
>   #endif
>   }
>   
> +static int get_vcpu_timer_tick(CPUState *cs, uint64_t *tick_at_pause)
> +{
> +    int err;
> +    struct kvm_one_reg reg;
> +
> +    reg.id = KVM_REG_ARM_TIMER_CNT;
> +    reg.addr = (uintptr_t) tick_at_pause;
> +
> +    err = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    return err;
> +}
> +
> +static int set_vcpu_timer_tick(CPUState *cs, uint64_t tick_at_pause)
> +{
> +    int err;
> +    struct kvm_one_reg reg;
> +
> +    reg.id = KVM_REG_ARM_TIMER_CNT;
> +    reg.addr = (uintptr_t) &tick_at_pause;
> +
> +    err = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    return err;
> +}
> +
> +static void arch_timer_change_state_handler(void *opaque, int running,
> +                                            RunState state)
> +{
> +    static uint64_t hw_ticks_at_paused;
> +    static RunState pre_state = RUN_STATE__MAX;
> +    int err;
> +    CPUState *cs = (CPUState *)opaque;
> +
> +    switch (state) {
> +    case RUN_STATE_PAUSED:
> +        err = get_vcpu_timer_tick(cs, &hw_ticks_at_paused);
> +        if (err) {
> +            error_report("Get vcpu timer tick failed: %d", err);
> +        }
> +        break;
> +    case RUN_STATE_RUNNING:
> +        if (pre_state == RUN_STATE_PAUSED) {
> +            err = set_vcpu_timer_tick(cs, hw_ticks_at_paused);
> +            if (err) {
> +                error_report("Resume vcpu timer tick failed: %d", err);
> +            }
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    pre_state = state;
> +}
> +
>   static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>   {
>       CPUState *cs = CPU(dev);
> @@ -906,6 +960,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>       Error *local_err = NULL;
>       bool no_aa32 = false;
>   
> +    /*
> +     * Only add change state handler for arch timer once, for KVM will help to
> +     * synchronize virtual timer of all VCPUs.
> +     */
> +    static bool arch_timer_change_state_handler_added;
> +
>       /* If we needed to query the host kernel for the CPU features
>        * then it's possible that might have failed in the initfn, but
>        * this is the first point where we can report it.
> @@ -1181,6 +1241,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>       init_cpreg_list(cpu);
>   
> +    if (!arch_timer_change_state_handler_added && kvm_enabled()) {
> +        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
> +        arch_timer_change_state_handler_added = true;
> +    }
> +
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>           cs->num_ases = 2;


