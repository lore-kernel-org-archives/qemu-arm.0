Received: by 2002:a0c:9b97:0:0:0:0:0 with SMTP id o23csp575137qve;
        Tue, 6 Apr 2021 05:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIOOgVw9zfmBdMF8x2TmUCoFk0mIXPKcLjX1NS3lTelGXvHTishlo5Ip0b5SJ5IBEvJYD1
X-Received: by 2002:a02:8801:: with SMTP id r1mr29147963jai.51.1617711877999;
        Tue, 06 Apr 2021 05:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617711877; cv=none;
        d=google.com; s=arc-20160816;
        b=KQnVeJkgyG9guijWHhREwy/2pFdBHaQfWpg3tDTGWaTwMBfoLQ9hBC/BZn6GecUdX2
         zGBSG7cP/Hwh6k3QEO3IsUtWcaXMoudT6zrUGumk3ihoDJO8C1FELu5FrznVPKRXrIBV
         bOOL5AT2QNFZZfnT3R4IFDTAGaPzULI0j0u2uOlIk6R8MIr7sHadbNAvZz7WjaVrCxxJ
         +OSAJfPQ8APfFJEkz01WLL0PGqdYnyEhnNl6bpcFczWe7/QuWWtvbNrna6ZYeJmSKK/1
         cEF3+j5SDMCt8ZgRfHrIsgSTuJ/0tCSwg3/fQG/q3KCFWPuQqfkcKuDCXkTSfCLpa81I
         gZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+UBKrxXh0Nojghvd8aiZzxVJTbhnNDkgbxPPyzy+/bk=;
        b=v5cnnSdPtvIOwUBjQ+mgI7mPfuekpbZtL4rTqtbrVfE8vc3tgOvV8MeG8VINZrWt6x
         e65gtVOjf2bxoKVXTZcaGjgGzLrOwOO+gInhfL0lgqW0V65pWEaojg1BENaJbqQjfrUE
         QWh7PmR/i0fvw2F3DEc6n3IRZRZzUchg7ocbi1FkcHfgxVdQwZ8NcJ7Z3JjLX+kXdhis
         xAIGB6QEd6iMTPzLcBRQjHRlESVtWzvHsWzI20xVyUtRFFicZ7ghCQMW00jMsnJr45Gx
         7iK7iNp8SSq/1v/14qEXsmyYkfz8jVAs3dsAXEqd91tPj9na52mZMd76pq5NJZRxzpMu
         6z7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Suxd00jO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si17428080jak.86.2021.04.06.05.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 05:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Suxd00jO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTkl3-0002rS-CV
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 08:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTkjj-0001Pc-Em
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 08:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTkjh-0003jW-Pt
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 08:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617711792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UBKrxXh0Nojghvd8aiZzxVJTbhnNDkgbxPPyzy+/bk=;
 b=Suxd00jO0PV0UyLcmdCo942qb0H853FuheW1jSesb5aakWglvXwGIlc7eSoiTUlKWut0WV
 XD4vDuMprtKR/pfv2p3fwK/A0aKRWLwG9+CtYD6kigvtgUwxsrye8wKcqjZ8sROU6tynXN
 mF5Hh5WfYtTru0yzd2tYk0jrQ6aERvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-v2lkSJZ-NHacShHfqIgLIw-1; Tue, 06 Apr 2021 08:23:08 -0400
X-MC-Unique: v2lkSJZ-NHacShHfqIgLIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58FE48B5DFD;
 Tue,  6 Apr 2021 12:22:52 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7EC25C890;
 Tue,  6 Apr 2021 12:22:50 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210402084731.93-1-yuzenghui@huawei.com>
 <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
 <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <24c077d2-0e0e-02bc-0f92-4086be7e8982@redhat.com>
Date: Tue, 6 Apr 2021 14:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vgG0qt8xRtqb

Hi Peter,

On 4/6/21 12:44 PM, Peter Maydell wrote:
> On Tue, 6 Apr 2021 at 11:10, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Zenghui,
>>
>> On 4/2/21 10:47 AM, Zenghui Yu wrote:
>>> The GSIV values in SMMUv3 IORT node are not correct as they don't match
>>> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
>>> our emulated vSMMU.
>>>
>>> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>> Acked-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric, when you send an acked-by tag do you mean to say that you've
> reviewed the patch, or merely that you think it's basically the
> right thing but you haven't actually looked at the details?

I mean I have reviewed the patch carefully and I think it is good to go.
I thought that as a maintainer for the arm smmu component I was supposed
to send an A-b instead of an R-b.
> 
> (I ask because if the former I can just put this in target-arm.next,
> but if the latter then I need to dig out the SMMU spec and review
> the patch myself :-))

Yes that's rather the former but obviously if you have some cycles /
interest in the topic I am more than happy to get your opinion too!

Thanks

Eric
> 
> thanks
> -- PMM
> 

