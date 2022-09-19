Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1209157ejy;
        Mon, 19 Sep 2022 08:11:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wvgdqmkkau3tqwY+y9gTpW+gIWfFFl5yhNtvK7JJ1uDtACcPuXFkBatPPaTn4sUPLU3nI
X-Received: by 2002:ad4:4eaf:0:b0:4ad:15f9:a0a3 with SMTP id ed15-20020ad44eaf000000b004ad15f9a0a3mr12349434qvb.104.1663600261464;
        Mon, 19 Sep 2022 08:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663600261; cv=none;
        d=google.com; s=arc-20160816;
        b=hzhe6EUnqiuva+XGgjq92GuoEAfJSRCFV4GpQEM/SZ7lmL7GEb5FsygQF4Qe+Ndq+v
         FrhQR9Y73f8i0/hBYgmsGHenVLsNVAXN+0dkhuV3MciheSPbwVA6HXKz0WlZe7rNXyKX
         VLHwsAoVNqKNTFlC1AyP+K+3M0pQWq9Ar9ipRMZLxI4zDCaTQZZWPFwYTM8AKU6Mbph9
         1L/KGFkw40IP6hpqafel4Cuwnc3cFoizbmtgxmD3wBlFqDs5qdTHKc8Qw3GjXtavsKR/
         PK2HqfD8frvmyPMo84bEeNh+sImqyCNW/pn0oZvhXsmqSnH8YUanI6rLlzIoVFBEmhqL
         djAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:dkim-signature:date;
        bh=3d/MMr67DKMWHXDu/QRKjg5m5wC8c/nVjruucxqAQ+U=;
        b=TbWqArVYWmDGcwO8pMOCwKnNxLlTInq+vLBourDtmjOh+tMgbQAWdKF4jYfgSIOzcc
         N4PAEbXCSUOlzBK34h7RT0fwEApSw1Ss9uCwVL2slTNBlblricukG34VUHtPYNDDaW4o
         Oh28BIfn8k6LsvghkToKaCYBJnydbTJagncCn8eq6ZaH5VuwOw1B1YiVJ6NWlO1xNlg6
         QHaY6tOamdCZfjxl3UQkRADKlf0tPwEVaCN3lRDT17k4wTmA+UrHFeH6AX6QeoY+1M9w
         aPf1FIzChxI65tpMgWx7fsZ4V+ifN8kXoypmG5lwlgh4j0qp62tWTVl6XeZ1kp9C2+0r
         7nFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linux.dev header.s=key1 header.b=r7CqAmKa;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id i19-20020a05620a249300b006bc6de22d75si11780284qkn.344.2022.09.19.08.11.00;
        Mon, 19 Sep 2022 08:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linux.dev header.s=key1 header.b=r7CqAmKa;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 787644B638;
	Mon, 19 Sep 2022 11:11:00 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.79
X-Spam-Level: 
X-Spam-Status: No, score=-1.79 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001, T_DKIM_INVALID=0.01,
	URIBL_BLOCKED=0.001] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linux.dev
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFU9sqdM9PxM; Mon, 19 Sep 2022 11:10:59 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 571BA4B64C;
	Mon, 19 Sep 2022 11:10:59 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1DEDD4B63B
 for <kvmarm@lists.cs.columbia.edu>; Mon, 19 Sep 2022 11:10:58 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F+HLk8WBTM+I for <kvmarm@lists.cs.columbia.edu>;
 Mon, 19 Sep 2022 11:10:57 -0400 (EDT)
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id E14324B638
 for <kvmarm@lists.cs.columbia.edu>; Mon, 19 Sep 2022 11:10:56 -0400 (EDT)
Date: Mon, 19 Sep 2022 17:10:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1663600255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6VNrPMZk2oYZl8Kyyhs50ZrHrkKLgAs8UjT+ZS8d8s=;
 b=r7CqAmKaQxqObb0KeFKWfHvmgIYg5vGzswzAO9ld5OX2wK0XnaWd0TO2QY6FcJCa7ATWGc
 Z7PnB9VoTK/d5TkqySwgo16MeW0YEsan+KqaoeON2+kyvxMkn5unoB2emLPdNNKEk+dEdu
 81M01VhHFpfpFOsAUnYAT9qREdAz9x4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [kvm-unit-tests PATCH v4 07/12] arm: pmu: Basic event counter
 Tests
Message-ID: <20220919151049.jtujswjyv5k34log@kamzik>
References: <20200403071326.29932-1-eric.auger@redhat.com>
 <20200403071326.29932-8-eric.auger@redhat.com>
 <8fa32eeb-f629-6c27-3b5f-a9a81656a679@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fa32eeb-f629-6c27-3b5f-a9a81656a679@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, andre.przywara@arm.com, andrew.murray@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: bEO8F9GhzBIt

On Mon, Sep 19, 2022 at 10:30:01PM +0800, Zenghui Yu wrote:
> Hi Eric,
> 
> A few comments when looking through the PMU test code (2 years after
> the series was merged).

Yes, these patches were merged long ago. Now you need to send patches,
not comments.

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
