Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2576809lfi;
        Mon, 30 Mar 2020 03:43:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsLmZaloXtu4AeWAiD2fySqjTC/N2eB2uRSJeHUgy3bgonZ1DjRjk9eIcc5+8Xdc/pXuaCu
X-Received: by 2002:aca:4b56:: with SMTP id y83mr7361815oia.142.1585565038807;
        Mon, 30 Mar 2020 03:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585565038; cv=none;
        d=google.com; s=arc-20160816;
        b=v7+qXaYFc4BFn2dIDc5raiMO2ZTfvcIbDT0XI1Xe8g+AGRoQ7f1gs+E7EJmW87d0vh
         Dl1LSmJgVhlXU1y2QxlhZyEkz/UazV2SrFoqPgTIMnYWggZsciwLzGLBr2R9fxdC3iVc
         k1wdL3dUo2lw+ly9jI1ZuoL1Je6wGXc6wDAE1Eh8HLfFDlH3/eh8OGCCLPK9XfMVMaGa
         SKj7qxgsF6CEomAt/LoUK6xawgbl9hCTSyAkoMGMurPB7efBcSRikzFp2NhxyDYayEPN
         gKz7rkUc1j2FcWxsQ2eAfGmF+xu2agVbjlTA0fX2T0hE7xi3CXVIqRvEj7IS265AYafB
         iLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=37v3baSpdRXMKm6mO0nz4OwkV66HDwjGjtqCYSoxtCI=;
        b=FbUWqqMGqiKnTwyGDRkCV2OuHLuo4cJxH6gzkyhrNxICafzh2+aEVTUQ1P4tozH78t
         7MCelbhCQTc0r4ZTAZVuguH0OBKSCeQDKKWxsz3NeSwBeAua1RQZC4QAvBW/NzdEjWl6
         A3qQ+By0O0FAweaKjOmBIJ3YQW2ShhcGnwwr+O3wp5OguhxGiJ2aCDEnkoabK62prZDc
         lFJYijf31PuCQ4WDJjQARnJt9hrBb5zrhldqom9EWQdNFTh+K+cNpYSIYmpzYQ6FwEf0
         1FW0M0m09d+M6ddI8aeOZsZodqlslLtLZJDOearaspjp0DI0UrA/+M8Yf0fQQSkYg97T
         0Z2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b197si5607227oii.198.2020.03.30.03.43.58;
        Mon, 30 Mar 2020 03:43:58 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgC3Knx (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 30 Mar 2020 06:43:53 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34220 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728912AbgC3Knw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 30 Mar 2020 06:43:52 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id C80DCD5780820CED5358;
        Mon, 30 Mar 2020 18:43:46 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 18:43:38 +0800
Subject: Re: [kvm-unit-tests PATCH v7 10/13] arm/arm64: ITS: INT functional
 tests
To:     Eric Auger <eric.auger@redhat.com>
CC:     <eric.auger.pro@gmail.com>, <maz@kernel.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-11-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <f7f1d7c4-2321-9123-2394-528af737bfa7@huawei.com>
Date:   Mon, 30 Mar 2020 18:43:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200320092428.20880-11-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZOgmajpl4VUT

Hi Eric,

On 2020/3/20 17:24, Eric Auger wrote:
> Triggers LPIs through the INT command.
> 
> the test checks the LPI hits the right CPU and triggers
> the right LPI intid, ie. the translation is correct.
> 
> Updates to the config table also are tested, along with inv
> and invall commands.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

[...]

So I've tested this series and found that the "INT" test will sometimes
fail.

"not ok 12 - gicv3: its-migration: dev2/eventid=20 triggers LPI 8195 en 
PE #3 after migration
not ok 13 - gicv3: its-migration: dev7/eventid=255 triggers LPI 8196 on 
PE #2 after migration"

 From logs:
"INFO: gicv3: its-migration: Migration complete
INT dev_id=2 event_id=20
INFO: gicv3: its-migration: No LPI received whereas (cpuid=3, 
intid=8195) was expected
FAIL: gicv3: its-migration: dev2/eventid=20 triggers LPI 8195 en PE #3 
after migration
INT dev_id=7 event_id=255
INFO: gicv3: its-migration: No LPI received whereas (cpuid=2, 
intid=8196) was expected
FAIL: gicv3: its-migration: dev7/eventid=255 triggers LPI 8196 on PE #2 
after migration"

> +static void check_lpi_stats(const char *msg)
> +{
> +	bool pass = false;
> +
> +	mdelay(100);

After changing this to 'mdelay(1000)', the above error doesn't show up
anymore. But it sounds strange that 100ms is not enough to deliver a
single LPI. I haven't dig it further but will get back here later.

> +	smp_rmb(); /* pairs with wmb in lpi_handler */
> +	if (lpi_stats.observed.cpu_id != lpi_stats.expected.cpu_id ||
> +	    lpi_stats.observed.lpi_id != lpi_stats.expected.lpi_id) {
> +		if (lpi_stats.observed.cpu_id == -1 &&
> +		    lpi_stats.observed.lpi_id == -1) {
> +			report_info("No LPI received whereas (cpuid=%d, intid=%d) "
> +				    "was expected", lpi_stats.expected.cpu_id,
> +				    lpi_stats.expected.lpi_id);
> +		} else {
> +			report_info("Unexpected LPI (cpuid=%d, intid=%d)",
> +				    lpi_stats.observed.cpu_id,
> +				    lpi_stats.observed.lpi_id);
> +		}
> +	} else {
> +		pass = true;
> +	}
> +	report(pass, "%s", msg);
> +}

This patch itself looks good to me,
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>


Thanks
