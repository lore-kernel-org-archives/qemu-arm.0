Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp437760ejd;
        Tue, 16 Apr 2024 08:11:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqZPqJHHPrBYjE6MVnNLB/Y8qTY7X0xVfU5ToJ4F5vJYV2Xhgxsq/AjuUNb+vYcGuzDdaW+r0w961rMQVCXQ0JvKNUqi/0
X-Google-Smtp-Source: AGHT+IGU6xjQV/UHpFkKah8yase5/0/7p3a1XbH9wX8BJXFT0wIw0Yt0pgVPv2fAUdky6IW6Upyf
X-Received: by 2002:ad4:5282:0:b0:699:3494:a187 with SMTP id v2-20020ad45282000000b006993494a187mr15047120qvr.43.1713280306943;
        Tue, 16 Apr 2024 08:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713280306; cv=none;
        d=google.com; s=arc-20160816;
        b=n+h0c/n7JuMUxSY1EkgC32p1LYQxAMAxYNlBBCK3uaieg8xtKADZsoGUPjFRl10a5z
         QFEdMq04HAD1+bvxhEJh1rrn1ynXFcCgwrhjJwOPci8Gyn0JzfAFCBASRhvEWKja6or7
         rLMtxSOlmbOl2yhZDRsEuUMkPhMt6K/jnwWOz4KQ/ZdwofV641M01oyk4Rq6EVIwnRC3
         /sVjdqTl5j6R+A+teBzEX94/GEq7gPnQORP+TAEzj3A82uP3uQP2ktweQB6jYpmUStcv
         GcD/8SAGRqJoPxtb649YwZm+sONz4v2OqkK/SbtQt/pWsroT5qwZ10av/wGLnEVBOX5s
         yCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=3rMUsug7cLTecRisfu6xVuCeg14np2rpJsgrnwVH2vY=;
        fh=KjSYjhGl8givcv6vWyPkD+c3THMMoXDtefKQslEFMA0=;
        b=uhmxK+f2inP2JAOdaEB1vhgJrdlWT+flGKNbeNwhTuo9mjpW7O8EXonLqPpoQ1J3hh
         XZll2GptmPuj2zpFQpbZykz3/PfyATBH4sXnGuXIiGU0YXXa5j/vKEiM/UlBFhPUPFeb
         IuLFTlVb3qEJMSultWFVL6RdpgWJUSnvsC14UAVcopmJz5ImsPZw24uNxZUsB44ooUej
         p+VCimcC3FM6ClFumcjHRVp5BuARN20AFTOw+r74r1u2HSHp9err1bQZm1NGMsvj9QDK
         CrkJqwxCFJXDswRjQ0xp+nw6Q3GldSqyOIwEbtHgnw9SQFyXEtm+5G5jcPJahbuQ5VWb
         SWzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id db16-20020a056214171000b0069b1f0e46casi7010310qvb.55.2024.04.16.08.11.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 08:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwkT9-0003Hm-2N; Tue, 16 Apr 2024 11:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rwkSu-0003Fz-80; Tue, 16 Apr 2024 11:11:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rwkSq-0006q5-Pl; Tue, 16 Apr 2024 11:11:19 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VJnRr1wWPz67Ldy;
 Tue, 16 Apr 2024 23:06:16 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 85BF2140B3C;
 Tue, 16 Apr 2024 23:11:12 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 16 Apr
 2024 16:11:12 +0100
Date: Tue, 16 Apr 2024 16:11:11 +0100
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Philippe
 =?ISO-8859-1?Q?Ma?= =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Idan
 Horowitz <idan.horowitz@gmail.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH v3 5/6] target/arm: Do memory type alignment check when
 translation disabled
Message-ID: <20240416161111.0000607c@huawei.com>
In-Reply-To: <20240301204110.656742-6-richard.henderson@linaro.org>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
 <20240301204110.656742-6-richard.henderson@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5K6lJUxlOPkU

On Fri,  1 Mar 2024 10:41:09 -1000
Richard Henderson <richard.henderson@linaro.org> wrote:

> If translation is disabled, the default memory type is Device, which
> requires alignment checking.  This is more optimally done early via
> the MemOp given to the TCG memory operation.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Hi Richard.

I noticed some tests I was running stopped booting with master.
(it's a fun and complex stack of QEMU + kvm on QEMU for vCPU Hotplug kernel=
 work,
but this is the host booting)

EDK2 build from upstream as of somepoint last week.

Bisects to this patch.

 qemu-system-aarch64 -M virt,gic-version=3D3,virtualization=3Dtrue -m 4g,ma=
xmem=3D8G,slots=3D8 -cpu cortex-a76 -smp cpus=3D4,threads=3D2,clusters=3D2,=
sockets=3D1 \
 -kernel Image \
 -drive if=3Dnone,file=3Dfull.qcow2,format=3Dqcow2,id=3Dhd \
 -device ioh3420,id=3Droot_port1 -device virtio-blk-pci,drive=3Dhd \
 -netdev user,id=3Dmynet,hostfwd=3Dtcp::5555-:22 -device virtio-net-pci,net=
dev=3Dmynet,id=3Dbob \
 -nographic -no-reboot -append 'earlycon root=3D/dev/vda2 fsck.mode=3Dskip =
tp_printk' \
 -monitor telnet:127.0.0.1:1235,server,nowait -bios QEMU_EFI.fd \
 -object memory-backend-ram,size=3D4G,id=3Dmem0 \
 -numa node,nodeid=3D0,cpus=3D0-3,memdev=3Dmem0

Symptoms: Nothing on console from edk2 which is built in debug mode so is n=
ormally very noisy.
          No sign of anything much happening at all :(

Jonathan



> ---
>  target/arm/tcg/hflags.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
> index 8e5d35d922..5da1b0fc1d 100644
> --- a/target/arm/tcg/hflags.c
> +++ b/target/arm/tcg/hflags.c
> @@ -26,6 +26,35 @@ static inline bool fgt_svc(CPUARMState *env, int el)
>          FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL=
1);
>  }
> =20
> +/* Return true if memory alignment should be enforced. */
> +static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_=
t sctlr)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return false;
> +#else
> +    /* Check the alignment enable bit. */
> +    if (sctlr & SCTLR_A) {
> +        return true;
> +    }
> +
> +    /*
> +     * If translation is disabled, then the default memory type is
> +     * Device(-nGnRnE) instead of Normal, which requires that alignment
> +     * be enforced.  Since this affects all ram, it is most efficient
> +     * to handle this during translation.
> +     */
> +    if (sctlr & SCTLR_M) {
> +        /* Translation enabled: memory type in PTE via MAIR_ELx. */
> +        return false;
> +    }
> +    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
> +        /* Stage 2 translation enabled: memory type in PTE. */
> +        return false;
> +    }
> +    return true;
> +#endif
> +}
> +
>  static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
>                                             ARMMMUIdx mmu_idx,
>                                             CPUARMTBFlags flags)
> @@ -121,8 +150,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *=
env, int fp_el,
>  {
>      CPUARMTBFlags flags =3D {};
>      int el =3D arm_current_el(env);
> +    uint64_t sctlr =3D arm_sctlr(env, el);
> =20
> -    if (arm_sctlr(env, el) & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>          DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>      }
> =20
> @@ -223,7 +253,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *=
env, int el, int fp_el,
> =20
>      sctlr =3D regime_sctlr(env, stage1);
> =20
> -    if (sctlr & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>          DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>      }
> =20

