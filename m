Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2373168lfp;
        Fri, 8 Oct 2021 04:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmW3AQ/5c+4Gq1cldO/0DDH146mNYaGPNXXY4S84617hLNE6uTYHkwSLX+f1glAPmc3nC9
X-Received: by 2002:a92:d090:: with SMTP id h16mr569573ilh.56.1633690868244;
        Fri, 08 Oct 2021 04:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633690868; cv=none;
        d=google.com; s=arc-20160816;
        b=DE/QmCwBf/SRJ2/eKa+BUlljzUeA/jvCVMVC26WzvCGSvXlR5DxK/ylSQMszMLAclo
         8UbtLwAYm3cJlemVo5IUISNuaJDefbVKoymQB8B1gvQe1MUaM/pv6NKTGJDijn/dw5g2
         Eki4y7EjXkCbPGeXgBJ9imUOXNXpD2ZN3NZeCOayR6CJpl8J7/5o8pbl1j21EhyrfHxF
         7wEqjQOd2uHfSzvKvYVhURztJP39lJG3N01wd+L6vnt8nlIbjmey6BCm5ujX18DGQr/u
         uKuVFw5mwFIJ7HZb9Hkq01jSxkui8sRql07yX6l1KEM1p11xOO/DMyhogb9GY55TZkOo
         uyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mEsZKC++1PpuTLnz4RbDzhIVALTMM7ZZzn8swN4cwLI=;
        b=JhrAyZ2WhCEjlh7AoGVHKBr1GROpRvXK7rm0112wLq5AvCcGJ6SwyRJNocA3LSeHYy
         RUYdH61tfNwHWhdPBI12dSNAFFSb4rhZBdSrrvgShfugh+ZJTAqVVEoL4Fz2RnSg0RX2
         7B8LTTSS7IpYdHnCL4ost6fZcnjeTFVIAbecGbCqSncJZ4uSo5iIucmIdiHsjq1aSIYW
         WbKSoU992l5BKbRVJ+LTfK9F1Eu/0sLXtAqV5FidkekxeSUXy3LdoLqehmbByqYZUH/P
         y6eGKIMAyZfPzI2tlcuPMy5VL6Q3wCzphEKErZPb3q2P9zYAOitRRS0cjLrw7gifJ7vu
         Yt2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si2503456ilb.100.2021.10.08.04.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 04:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYnch-0004nt-K9
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 07:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYnbg-0004nc-Ce; Fri, 08 Oct 2021 07:00:05 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYnba-0005My-Ts; Fri, 08 Oct 2021 07:00:04 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HQlT439KTz902w;
 Fri,  8 Oct 2021 18:55:04 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 18:59:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 8 Oct 2021 18:59:50 +0800
Subject: Re: [PATCH] hw/arm/sbsa-ref: Fixed cpu type error message typo.
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
References: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <2e2cb98b-eeb8-729a-299c-bd945204032a@huawei.com>
Date: Fri, 8 Oct 2021 18:59:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iaTZ1cxpfoIZ


On 2021/10/8 14:36, Shuuichirou Ishii wrote:
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>   hw/arm/sbsa-ref.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 509c5f09b4..358714bd3e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
>       int n, sbsa_max_cpus;
>   
>       if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> +        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
>           exit(1);
>       }
>   
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

