Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1485399lfc;
        Thu, 12 Mar 2020 19:06:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuGFKuEPgrcVkDOi9J+ErJnCJU0by5Mj4aVCS2ZkGXk7VCGAbGdATxB4yDGU8E25KcuX5A6
X-Received: by 2002:a37:5004:: with SMTP id e4mr10932754qkb.18.1584065199570;
        Thu, 12 Mar 2020 19:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584065199; cv=none;
        d=google.com; s=arc-20160816;
        b=QSWPkrru8n0lH5X8h9Dz/cBF+dVdfk8aLIpXDyJQQz3UcKZDpKP2+5+fJAZWSLl5/F
         7SFNoGN/3zA3IBewe+2fjNspVP/vS6ilXIQ/BUpfjy0Z3YZc6j3Hf8gfgCg0DTOfgrz2
         HPs3CgOBsEilN/duSHo/vlbKikt8ZJbUqs6Tmmh7mpY3ZWQh68c8TW2Sxguj00NdGHn1
         tB3YwOneGAr5nPueNm0QxXH4fTcsmRL/83zGX3HP5EvU+qyCQvp/OD7ERP9jYJQS2uOw
         1eNRVCMttHouvIM6Yf70L1JEQNNedfvvYCwBEfsQA3I/suoT45lPtk4Wobz92SbUCk7f
         JACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=wg038znOiuCWUmalKD1ZlCQYU1Ey7K4ID1ut5VIEU1c=;
        b=q0nX5NmGKxvvHxrTuCDMJtEIKTOthbcV4eMVebmXCX0ZnSySWA+7/guTo3i4DWSAlw
         +PxtXHkZ3BXAqhFONsszb+0HTf5eZQwldxhgXPmoIOBPMgBkbpV4dg1mpnHOTAFvZyhn
         YQ7JCC6fmHaKjbElHHiN9p4RRg/VggAvRoB1n2WTEsf44bLk0DL2p5YunFdD9cw7c8lJ
         gLAEgsny34uxGjczko1N2Oo2BxkMJcZls6vIwCcP5Xorl1qw35yeZ3b+To+gH6Ao7+Ok
         vEqBU2MvSPvetT1n6ECw3kT7T0yLlOi3GpGzpSZyEYjKrfLzilDZsauz1vh5TT4vAJiJ
         eOSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id a19si4006181qtp.63.2020.03.12.19.06.39;
        Thu, 12 Mar 2020 19:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 379A84A536;
	Thu, 12 Mar 2020 22:06:39 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwWhiN-j7oGy; Thu, 12 Mar 2020 22:06:38 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2C19A4A54B;
	Thu, 12 Mar 2020 22:06:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 658F14A536
 for <kvmarm@lists.cs.columbia.edu>; Thu, 12 Mar 2020 22:06:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uUThKjbs9Ld for <kvmarm@lists.cs.columbia.edu>;
 Thu, 12 Mar 2020 22:06:36 -0400 (EDT)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 17BE54A524
 for <kvmarm@lists.cs.columbia.edu>; Thu, 12 Mar 2020 22:06:36 -0400 (EDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 379E3E7D2780482DFE51;
 Fri, 13 Mar 2020 10:06:33 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Mar 2020
 10:06:22 +0800
Subject: Re: [kvm-unit-tests PATCH v6 10/13] arm/arm64: ITS: INT functional
 tests
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20200311135117.9366-1-eric.auger@redhat.com>
 <20200311135117.9366-11-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7d79cc12-acdb-ff56-594d-3fa830f7d053@huawei.com>
Date: Fri, 13 Mar 2020 10:06:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200311135117.9366-11-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Cc: andre.przywara@arm.com, thuth@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 08peb0dLv13H

On 2020/3/11 21:51, Eric Auger wrote:
> +static void test_its_trigger(void)
> +{
> +	struct its_collection *col3, *col2;
> +	struct its_device *dev2, *dev7;
> +
> +	if (its_prerequisites(4))
> +		return;
> +
> +	dev2 = its_create_device(2 /* dev id */, 8 /* nb_ites */);
> +	dev7 = its_create_device(7 /* dev id */, 8 /* nb_ites */);
> +
> +	col3 = its_create_collection(3 /* col id */, 3/* target PE */);
> +	col2 = its_create_collection(2 /* col id */, 2/* target PE */);
> +
> +	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
> +	gicv3_lpi_set_config(8196, LPI_PROP_DEFAULT);
> +
> +	report_prefix_push("int");
> +	/*
> +	 * dev=2, eventid=20  -> lpi= 8195, col=3
> +	 * dev=7, eventid=255 -> lpi= 8196, col=2
> +	 * Trigger dev2, eventid=20 and dev7, eventid=255
> +	 * Check both LPIs hit
> +	 */
> +
> +	its_send_mapd(dev2, true);
> +	its_send_mapd(dev7, true);
> +
> +	its_send_mapc(col3, true);
> +	its_send_mapc(col2, true);
> +
> +	its_send_invall(col2);
> +	its_send_invall(col3);
> +
> +	its_send_mapti(dev2, 8195 /* lpi id */, 20 /* event id */, col3);
> +	its_send_mapti(dev7, 8196 /* lpi id */, 255 /* event id */, col2);
> +
> +	lpi_stats_expect(3, 8195);
> +	its_send_int(dev2, 20);
> +	check_lpi_stats("dev=2, eventid=20  -> lpi= 8195, col=3");
> +
> +	lpi_stats_expect(2, 8196);
> +	its_send_int(dev7, 255);
> +	check_lpi_stats("dev=7, eventid=255 -> lpi= 8196, col=2");
> +
> +	report_prefix_pop();
> +
> +	report_prefix_push("inv/invall");
> +
> +	/*
> +	 * disable 8195, check dev2/eventid=20 does not trigger the
> +	 * corresponding LPI
> +	 */
> +	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT & ~LPI_PROP_ENABLED);
> +	its_send_inv(dev2, 20);
> +
> +	lpi_stats_expect(-1, -1);
> +	its_send_int(dev2, 20);
> +	check_lpi_stats("dev2/eventid=20 does not trigger any LPI");
> +
> +	/*
> +	 * re-enable the LPI but willingly do not call invall
> +	 * so the change in config is not taken into account.
> +	 * The LPI should not hit
> +	 */
> +	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
> +	lpi_stats_expect(-1, -1);
> +	its_send_int(dev2, 20);
> +	check_lpi_stats("dev2/eventid=20 still does not trigger any LPI");
> +
> +	/* Now call the invall and check the LPI hits */
> +	its_send_invall(col3);
> +	lpi_stats_expect(3, 8195);
> +	its_send_int(dev2, 20);
> +	check_lpi_stats("dev2/eventid=20 now triggers an LPI");
> +
> +	report_prefix_pop();
> +
> +	report_prefix_push("mapd valid=false");
> +	/*
> +	 * Unmap device 2 and check the eventid 20 formerly
> +	 * attached to it does not hit anymore
> +	 */
> +
> +	its_send_mapd(dev2, false);
> +	lpi_stats_expect(-1, -1);
> +	its_send_int(dev2, 20);

Here. You issued an INT command while the dev2 has just been unmapped,
this will be detected by ITS as a command error. We may end-up failed
to see the completion of this command (under the ITS stall mode).


Thanks,
Zenghui

> +	check_lpi_stats("no LPI after device unmap");
> +	report_prefix_pop();
> +}

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
