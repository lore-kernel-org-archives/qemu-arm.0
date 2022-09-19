Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1186173ejy;
        Mon, 19 Sep 2022 07:31:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zUtq17cMeLrhCPs6uqnSwjULGs/E1gykF2hAK2BsR1N+a1BxDZpodjKqLpZbFSS/4XaEG
X-Received: by 2002:a17:906:846b:b0:77a:6e22:7311 with SMTP id hx11-20020a170906846b00b0077a6e227311mr13255998ejc.524.1663597899825;
        Mon, 19 Sep 2022 07:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663597899; cv=none;
        d=google.com; s=arc-20160816;
        b=MhrLIRg8yW6kXtu9hUpZnynKaKKe7fVzJY+PgfnSQY+kY6/oufNzHobkclDVBFOLLk
         Ybxy+JBxmSs1zRxOuxrxFOznY9psuoK6lhyWZINekZnxdmfuy0Zz9s2qcv5KWHeY+K4Q
         nOaYmw7TN3ASDAZiXSeeJHvYJfMZNgNBnGrcEvIv0k3MmFlE8elJ9wWYiMelLIrayxID
         r0MtBew/1xDsz/GLYvpgT5bVNqy+QXaCWj5kv26AbAjHKR06xujQnZwxDrJQ68fQXnNw
         Xaabhal+x+GygYhiPqxf9icelngp3DHEOlcIInkLJCGX6qq3tsqKKnvC3HAX0NtPMl/5
         jREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject;
        bh=gHr3GR9WTyhGVw98HNvR4Nzc9Q2Bm8RGBaSqaPH6Hew=;
        b=W+KEdWHSsDEBtYOpSDImRQfwKioMjyAxJRrd+8/0/G15e2F6jQu/PpA7zcLtrW8g6T
         IPn3GuWtKqsiOdBFzUwy4VzdSQ5L6FIybdA76RFbjj1t1uSxhCLnOsspxcuh4t0Zioxk
         ljD+WKz2qcX/Npq0nXsvop5cE/phgT+4w3e0C6HozImNl767R79sxJyfCP2mTXMhM4js
         Q7gEMYSSzai8lKSEdfVwUCJehfV0+rpBuATTYyA6WBtECruuzVB4zZh3hRzQES0v6CAg
         S1wBAWck8kN7iVCO/z4IvnRuRiJyyCBlcgHZbxF3sR08VJFPfgT3OyImzZYefGmfKFrM
         Qj4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id c5-20020a50f605000000b004511c8d5a0dsi10491241edn.251.2022.09.19.07.31.39;
        Mon, 19 Sep 2022 07:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiISObi (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 19 Sep 2022 10:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiISObe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 19 Sep 2022 10:31:34 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F4C2A413
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 07:31:32 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MWRrf6nWmzHnwW;
        Mon, 19 Sep 2022 22:29:22 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 22:31:30 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 22:31:29 +0800
Subject: Re: [kvm-unit-tests PATCH v4 08/12] arm: pmu: Test SW_INCR event
 count
To:     Eric Auger <eric.auger@redhat.com>
CC:     <eric.auger.pro@gmail.com>, <maz@kernel.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <andrew.murray@arm.com>, <andre.przywara@arm.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
 <20200403071326.29932-9-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <64be8eda-a396-26a1-1a05-d43a3ed53c1d@huawei.com>
Date:   Mon, 19 Sep 2022 22:31:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200403071326.29932-9-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xo2LmMO17MFp

Hi Eric,

On 2020/4/3 15:13, Eric Auger wrote:

> +static void test_sw_incr(void)
> +{
> +	uint32_t events[] = {SW_INCR, SW_INCR};
> +	int i;
> +
> +	if (!satisfy_prerequisites(events, ARRAY_SIZE(events)))
> +		return;
> +
> +	pmu_reset();
> +
> +	write_regn_el0(pmevtyper, 0, SW_INCR | PMEVTYPER_EXCLUDE_EL0);
> +	write_regn_el0(pmevtyper, 1, SW_INCR | PMEVTYPER_EXCLUDE_EL0);
> +	/* enable counters #0 and #1 */
> +	write_sysreg_s(0x3, PMCNTENSET_EL0);
> +
> +	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
> +
> +	for (i = 0; i < 100; i++)
> +		write_sysreg(0x1, pmswinc_el0);
> +
> +	report_info("SW_INCR counter #0 has value %ld", read_regn_el0(pmevcntr, 0));
> +	report(read_regn_el0(pmevcntr, 0) == PRE_OVERFLOW,
> +		"PWSYNC does not increment if PMCR.E is unset");
> +
> +	pmu_reset();
> +
> +	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW);
> +	write_sysreg_s(0x3, PMCNTENSET_EL0);
> +	set_pmcr(pmu.pmcr_ro | PMU_PMCR_E);
> +
> +	for (i = 0; i < 100; i++)
> +		write_sysreg(0x3, pmswinc_el0);
> +
> +	report(read_regn_el0(pmevcntr, 0)  == 84, "counter #1 after + 100 SW_INCR");

"counter #0 after + 100 SW_INCR"

> +	report(read_regn_el0(pmevcntr, 1)  == 100,
> +		"counter #0 after + 100 SW_INCR");

"counter #1 after + 100 SW_INCR"

> +	report_info("counter values after 100 SW_INCR #0=%ld #1=%ld",
> +		    read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1));
> +	report(read_sysreg(pmovsclr_el0) == 0x1,
> +		"overflow reg after 100 SW_INCR");
> +}
> +
>  #endif
>  
>  /*

Zenghui
