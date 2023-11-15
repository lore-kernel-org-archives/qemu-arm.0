Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2697154ejc;
        Wed, 15 Nov 2023 03:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2mvzTiyRnXVm507TKPed2kAI82DNbmn6ZGeiYA/4iI3BkojMbawEWkzjZRhwKFxf1q1KI
X-Received: by 2002:ae9:ea0b:0:b0:77b:9a8c:b0bc with SMTP id f11-20020ae9ea0b000000b0077b9a8cb0bcmr3887321qkg.44.1700047133167;
        Wed, 15 Nov 2023 03:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700047133; cv=none;
        d=google.com; s=arc-20160816;
        b=qz5fTyKaVzCUB1gyWyXGDBeQtwO2bPVdTlz6s2tZWubbw/whmJkXoVHfmVkSQv1g0s
         1VFiV68x1LY/Vr80poN8zyuHJIF+/2IhOjV0w/KYofW8hgdqLTqo8yefaGAfdfGbDpvy
         pzThqxS6iWnRemILZTPq/mUht1rnW/C/CHvYlNeNBBHYP+Dvh/ib1TzVeZ9lK0N5kp0R
         HOK8K+cjxUV8jbxqPv9xbwDnEIu/D2lipdPSPhO4qDfd+ygPWE5N4KY1gb84BfBSgCKP
         cFymzSmLgd1SfFfR4mhgtzMk/+doV5IUNPd5ACTt04UKzcRG3HKtsvivugWmKFgj6TUi
         Rsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=HstJdhOLdTq3m8ygiqjFGmYkld+2Zjnr+Teldp6Xtgs=;
        fh=GDF2ithOv3W63HvYvcs3M4OHHet9JbOf9wneSGSeyE4=;
        b=BmtWUQKFlz9gFCXTrIsXepkdxUtagXKPrvPdUrbE0+Y7DvujxGVxqySUKwFkihnd1b
         gNcErEpe6TT2zL5bnaFWtHX7d66w86TsUa1J0Q7rzWVWaLp9MIOWflzy0EsVEt5+uvIz
         DVBC+GCTBa3ek4d0BwQX9tiORACVwUU/BL+HtaX6KAwbfdPDoTfYO04vLeIDixYxgFVI
         XBzbPuoF6kdrmzEbUI/qZenxgcWOLJ+FpfZeoWu5TAZVVbw83SIfmkf1qpLG6SqDxJoY
         S8qqwRgjbtVpEZ8dz1WceMclXE+QFrPpkcWofzecVoPDuv6DuvxAbuyFD3je7L/VwQIy
         jWzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv11-20020a05620a1b8b00b00767f86fc1f5si8284147qkb.474.2023.11.15.03.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 03:18:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Dup-0006c8-2t; Wed, 15 Nov 2023 06:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r3Duk-0006aA-UA; Wed, 15 Nov 2023 06:18:34 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r3Dui-00066P-TU; Wed, 15 Nov 2023 06:18:34 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CAE4775607B;
 Wed, 15 Nov 2023 12:18:55 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BDDA4756078; Wed, 15 Nov 2023 12:18:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BA6F8756066;
 Wed, 15 Nov 2023 12:18:55 +0100 (CET)
Date: Wed, 15 Nov 2023 12:18:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gavin Shan <gshan@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, imp@bsdimp.com, kevans@freebsd.org, 
 richard.henderson@linaro.org, pbonzini@redhat.com, 
 peter.maydell@linaro.org, imammedo@redhat.com, philmd@linaro.org, 
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, 
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com, 
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu, 
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com, 
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net, 
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, 
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org, 
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de, 
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: Re: [PATCH v5 02/31] target/hppa: Remove
 object_class_is_abstract()
In-Reply-To: <20231114235628.534334-3-gshan@redhat.com>
Message-ID: <35cae9bd-2240-2399-2212-e12f1683bf90@eik.bme.hu>
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-3-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NGmxIEslHy94

On Wed, 15 Nov 2023, Gavin Shan wrote:
> No need to check if @oc is abstract because it has been covered
> by cpu_class_by_name().
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> target/hppa/cpu.c | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 04de1689d7..fc4d2abad7 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -163,7 +163,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
>     ObjectClass *oc = object_class_by_name(typename);
>
>     if (oc &&
> -        !object_class_is_abstract(oc) &&
>         object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {

Might as well remove the line break as the remaining expression fits in 80 
chars.

Regards,
BALATON Zoltan

>         return oc;
>     }
>
