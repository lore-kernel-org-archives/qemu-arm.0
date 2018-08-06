Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3268668wru;
        Mon, 6 Aug 2018 09:51:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpczgBSee/LFServwzqwd3zOMCuB3cgM+nyx7ZveTEpyPq8xL9cU+QndB8zeBmSZ4cEgJ7lS
X-Received: by 2002:a37:a1d1:: with SMTP id k200-v6mr13786851qke.445.1533574269725;
        Mon, 06 Aug 2018 09:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533574269; cv=none;
        d=google.com; s=arc-20160816;
        b=Qm8De/OPbwE2Pe91Ax/0cHdZ4T4NAjPi+xW1RMTf2WWywGcE6AhoBWihTzy6ta/fxk
         vHhjCrmZMe1u1tnkZIasW7jkwbcjPRF9wwbhiuCZ0R6Jo/hGC+ZpB2HIgrmhyziNyQoi
         GClW00O0Wesl7nKvWM32alhzMuYZyrcOJDXZ9iX7Te7R4p0t04zsizWKZ3DM2+sHf5ww
         FEpDm63qSsMkDibLwq4Cgcq3DVjjoO8nwk3EAYlv+e5XfbNkIjsjzU+nUYBbOZ22LFvO
         X/QO4p0Jcp/F7d6qhHG89ssId5F5jvjjHvIjJzfhNOSxB3kjyxZ39oxELdjVewFxT9dA
         1gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eH88gQbvECPhK1zheHlK9FtNkI7bq3TCEfZWJ0YCPb8=;
        b=dJjfg0lWsbRVV9sb4/e2Hc4FUnCsMhL6kY2rG7/SSI1gktIz4aTRP8BTStX+Ksk9ax
         T/5EMUZg6fNrd6zrn9DKmiJEDjR4QDUEgDWm0zUqS4RXsXGNr6KbUtRQXwgwfnMK0lVU
         RhbVHKIM66XzJI1ku6pw75tduteBUiwiKGvPumEYoeapO6ZeNIJBBllk9vp3EU0wWx8Q
         E0io9E4jrs/jp67P6KfISYgL/lIO3KtAgIAzsk6+6gWem7fl9RTi0XNyHIaQiG06m5Ct
         983mhnWKwqGYCnD0AWof92P2YUW1jb/t3M1wq9/m3QHBW33Gt3CQ/GP9BFU8P9mS/xxP
         d/WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UNlQDKmE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27-v6si3216738qvh.18.2018.08.06.09.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 09:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UNlQDKmE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmiir-0005qo-9j
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 12:51:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fmiii-0005qb-Dc
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 12:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fmiih-00073E-Ec
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 12:51:00 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fmiih-00072s-90
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 12:50:59 -0400
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so23321988oie.13
	for <qemu-arm@nongnu.org>; Mon, 06 Aug 2018 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eH88gQbvECPhK1zheHlK9FtNkI7bq3TCEfZWJ0YCPb8=;
	b=UNlQDKmEd2Tyld+g+zPAhWXWhQaY26SmD94ruLDnKDj8i0qTBW0dmHNIyf2p58EMLq
	g5AlMOCy+OfTZL7tfTbCQ5p0UMKLHKgkSGEXKvNC/2U+dCNyPhtU4XtboeRiUnp7zJAz
	pz/Pfp9Acdeav74ZdL9OBNjdu/gFsksGFpwRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eH88gQbvECPhK1zheHlK9FtNkI7bq3TCEfZWJ0YCPb8=;
	b=cwT2P9gjLhfpz4W56XCwmu3OQ2N01flY4aqCc8/iyDQ2yx5FcOT1s6q+uzVDnKACjr
	quZ/mGgohoPrN8LniyU+hvlP70f6lx6i7ruomIuzlD5/dY1FHLOKO05/u+6gVyJUgr18
	M45KZgt1PD3evUekVxlDxrfhOBKMrYRPDjK8lDvGzjX7Qb+5ehyERWStcqKxX9hnkQnE
	QvwYksPpvw+hld8O0EH9E014YmGQ4HncCJoqcoMnDHIPSk6P4nxE0rByV17FL432AGmM
	Q51jFJa03RYUvJ1yGVh26Lo7PYFfSZMCzFmXOloa6XNHabnZDRMIQ8kxdAzI27hgeny6
	tCHQ==
X-Gm-Message-State: AOUpUlFAP0jdIta4IvjYUpP0d9oCQGDdv0mtVcy7zxMjCloUfep9ZeHD
	ejyQGFXFlU8D68e4qxbSoR5uhRfivQnPXwWBKZfJ+w==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr15843557oih.12.1533574258426; 
	Mon, 06 Aug 2018 09:50:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 09:50:38 -0700 (PDT)
In-Reply-To: <f9f955a3-001e-aa12-97ef-97a085b8dc6d@linaro.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<f9f955a3-001e-aa12-97ef-97a085b8dc6d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Aug 2018 17:50:38 +0100
Message-ID: <CAFEAcA9O3v5RQYfwui0c6ZGvkGZ7GbNHqbyqNbONsDRTrBFxUQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 v2 0/5] Arm migration
 fixes for 3.0
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
Cc: Juan Quintela <quintela@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qu+QK4vvYpBG

On 6 August 2018 at 15:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/06/2018 05:34 AM, Peter Maydell wrote:
>> Peter Maydell (5):
>>   hw/intc/arm_gicv3_common: Give no-migration-shift-bug subsection a
>>     needed function
>>   hw/intc/arm_gicv3_common: Combine duplicate .subsections in
>>     vmstate_gicv3_cpu
>>   target/arm: Add dummy needed functions to M profile vmstate
>>     subsections
>>   hw/intc/arm_gicv3_common: Move post_load hooks to top-level VMSD
>>   hw/intc/arm_gicv3_common: Move gicd shift bug handling to
>>     gicv3_post_load
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; series applied to master for rc4.

-- PMM
