Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2650298lfi;
        Mon, 30 Mar 2020 05:06:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuoDlTJ1g9IshAMo9XB5O7zDv3Y2yJ0DyR4q9LJ7Fs1cT5EiTp8hfKDGscPFuueKKGu5z9Z
X-Received: by 2002:a4a:d1a5:: with SMTP id z5mr9308873oor.63.1585570012417;
        Mon, 30 Mar 2020 05:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585570012; cv=none;
        d=google.com; s=arc-20160816;
        b=k8S5knnmV+gpfKw1UHVH/zn+F7H1Ep9FYB5XXlx5xUuPsU+s4EPOGcBydxgXV2/0Ws
         FhBGO6B14wXBl7VoU2rmYqQUAjHrxK4DI2Muwb0k9KEBQyhLBmOp6dTxVgKvxkZx2pP8
         SUOb63enV3U93CifMqo1tH/KGM9IKHYgCF34obqSuDFlm9g8mhL37xNb3NSr5rWsNcQK
         TwLOYLsPdMvSee00MQDLfKctF28IISTlsmqLuyO1LipYrh6HOJEzPHpGYVumx3CvnHx3
         mzlHTbxLndLasKYk0hGuFxqcPisMBVpmIESbQjvnysgk0tl9cGNOA+rF1VvHWyDRQQ13
         ZNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=dNfSYxKpcOslZZ8kThwXwq66zK/BYodKRGU17f2p70s=;
        b=ltQDuxsuPc8ep/NGNAsvxfTPUUrIJj1nNF+YWKMIMRt5P6Cm9ziaBjW1hDDrk4RHAD
         4xJ/+ADryjA7Ck0F7ZPOp6EG/+6qhkn6dTGuzWbIlnc0ptTmxcfIWUMIXo/JvfdJYd+8
         A6BSr4kEdfoaUdhlLMC3xFiqYn8dLQVVQHBmeqKVwSHaQpswQcEaYINUMLhHZaYB4t+w
         FCOUjC0FHDZWxAOPSyWq11xtRZfX/6+s8AiXHgXqq86Vtc4gVbAuD3dBeNJcDhSUIak3
         v18ouGfNzGoZKHpw4sBKxBuBH2czbnqUb04NjcVhKPGIO04SGvjRsSXRxwh5wqReqX7F
         8CCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id k193si5557996oih.78.2020.03.30.05.06.51;
        Mon, 30 Mar 2020 05:06:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbgC3MGs (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 30 Mar 2020 08:06:48 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12148 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729669AbgC3MGs (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 30 Mar 2020 08:06:48 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 9F0A01416568A269222E;
        Mon, 30 Mar 2020 20:06:44 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 20:06:36 +0800
Subject: Re: [kvm-unit-tests PATCH v7 13/13] arm/arm64: ITS: pending table
 migration test
To:     Eric Auger <eric.auger@redhat.com>
CC:     <eric.auger.pro@gmail.com>, <maz@kernel.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-14-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <296c574b-810c-9c90-a613-df732a9ac193@huawei.com>
Date:   Mon, 30 Mar 2020 20:06:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200320092428.20880-14-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: JwTP70fyri1Q

Hi Eric,

On 2020/3/20 17:24, Eric Auger wrote:
> Add two new migration tests. One testing the migration of
> a topology where collection were unmapped. The second test
> checks the migration of the pending table.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

[...]

> @@ -659,6 +678,15 @@ static int its_prerequisites(int nb_cpus)
>   	return 0;
>   }
>   
> +static void set_lpi(struct its_device *dev, u32 eventid, u32 physid,
> +		    struct its_collection *col)
> +{
> +	assert(dev && col);
> +
> +	its_send_mapti(dev, physid, eventid, col);
> +	gicv3_lpi_set_config(physid, LPI_PROP_DEFAULT);
> +}

I'd say we can just drop this helper and open-code it anywhere
necessarily. The name 'set_lpi' doesn't tell me too much about
what has been implemented inside the helper.

> +
>   /*
>    * Setup the configuration for those mappings:
>    * dev_id=2 event=20 -> vcpu 3, intid=8195
> @@ -790,6 +818,108 @@ static void test_its_migration(void)
>   	its_send_int(dev7, 255);
>   	check_lpi_stats("dev7/eventid=255 triggers LPI 8196 on PE #2 after migration");
>   }
> +
> +static void test_migrate_unmapped_collection(void)
> +{
> +	struct its_collection *col;
> +	struct its_device *dev2, *dev7;
> +	int pe0 = 0;
> +	u8 config;
> +
> +	if (its_setup1())
> +		return;
> +
> +	col = its_create_collection(pe0, pe0);
> +	dev2 = its_get_device(2);
> +	dev7 = its_get_device(7);
> +
> +	/* MAPTI with the collection unmapped */
> +	set_lpi(dev2, 0, 8192, col);

... and it's only invoked here.

> +
> +	puts("Now migrate the VM, then press a key to continue...\n");
> +	(void)getchar();
> +	report_info("Migration complete");
> +
> +	/* on the destination, map the collection */
> +	its_send_mapc(col, true);
> +	its_send_invall(col);
> +
> +	lpi_stats_expect(2, 8196);
> +	its_send_int(dev7, 255);
> +	check_lpi_stats("dev7/eventid= 255 triggered LPI 8196 on PE #2");
> +
> +	config = gicv3_lpi_get_config(8192);
> +	report(config == LPI_PROP_DEFAULT,
> +	       "Config of LPI 8192 was properly migrated");
> +
> +	lpi_stats_expect(pe0, 8192);
> +	its_send_int(dev2, 0);
> +	check_lpi_stats("dev2/eventid = 0 triggered LPI 8192 on PE0");
> +}
> +
> +static void test_its_pending_migration(void)
> +{
> +	struct its_device *dev;
> +	struct its_collection *collection[2];
> +	int *expected = malloc(nr_cpus * sizeof(int));
> +	int pe0 = nr_cpus - 1, pe1 = nr_cpus - 2;
> +	u64 pendbaser;
> +	void *ptr;
> +	int i;
> +
> +	if (its_prerequisites(4))
> +		return;
> +
> +	dev = its_create_device(2 /* dev id */, 8 /* nb_ites */);
> +	its_send_mapd(dev, true);
> +
> +	collection[0] = its_create_collection(pe0, pe0);
> +	collection[1] = its_create_collection(pe1, pe1);
> +	its_send_mapc(collection[0], true);
> +	its_send_mapc(collection[1], true);
> +
> +	/* disable lpi at redist level */
> +	gicv3_lpi_rdist_disable(pe0);
> +	gicv3_lpi_rdist_disable(pe1);
> +
> +	/* lpis are interleaved inbetween the 2 PEs */
> +	for (i = 0; i < 256; i++) {
> +		struct its_collection *col = i % 2 ? collection[0] :
> +						     collection[1];
> +		int vcpu = col->target_address >> 16;
> +
> +		its_send_mapti(dev, LPI(i), i, col);
> +		gicv3_lpi_set_config(LPI(i), LPI_PROP_DEFAULT);
> +		gicv3_lpi_set_clr_pending(vcpu, LPI(i), true);
> +	}
> +	its_send_invall(collection[0]);
> +	its_send_invall(collection[1]);
> +
> +	/* Clear the PTZ bit on each pendbaser */
> +
> +	expected[pe0] = 128;
> +	expected[pe1] = 128;

Do we need to initialize expected[] for other PEs? Or it has always
been zeroed by the kvm-unit-tests implementation of malloc()?

> +
> +	ptr = gicv3_data.redist_base[pe0] + GICR_PENDBASER;
> +	pendbaser = readq(ptr);
> +	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
> +
> +	ptr = gicv3_data.redist_base[pe1] + GICR_PENDBASER;
> +	pendbaser = readq(ptr);
> +	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
> +
> +	gicv3_lpi_rdist_enable(pe0);
> +	gicv3_lpi_rdist_enable(pe1);

I don't know how the migration gets implemented in kvm-unit-tests.
But is there any guarantee that the LPIs will only be triggered on the
destination side? As once the EnableLPIs bit becomes 1, VGIC will start
reading the pending bit in guest memory and potentially injecting LPIs
into the target vcpu (in the source side).

> +
> +	puts("Now migrate the VM, then press a key to continue...\n");
> +	(void)getchar();
> +	report_info("Migration complete");
> +
> +	/* let's wait for the 256 LPIs to be handled */
> +	mdelay(1000);
> +
> +	check_lpi_hits(expected, "128 LPIs on both PE0 and PE1 after migration");
> +}


Thanks,
Zenghui
