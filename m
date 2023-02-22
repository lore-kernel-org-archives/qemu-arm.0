Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4083777ejb;
        Wed, 22 Feb 2023 00:50:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9FQ4wNshjq8t1+XjA8H2AgGNLZBo+H4EcV7Pmk/rEDt028xhJck13HcLmEhX/TLHc/To4Z
X-Received: by 2002:ad4:5d61:0:b0:56e:b124:1570 with SMTP id fn1-20020ad45d61000000b0056eb1241570mr14616997qvb.8.1677055813138;
        Wed, 22 Feb 2023 00:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677055813; cv=none;
        d=google.com; s=arc-20160816;
        b=Finwypn345UQcuuwv2AIx0EE8ytthE0RdOl0YfyiH4LfZBMpd7fpH3BJVHg9zEwT5w
         YD7PB2zSYrEHA9reqmM8Gr7C+shQogs+syuoB873XyTTvGE5r944VhdmaYlyeD3Vtqfi
         89388mDfWqAfhA340bV9Gq+J2YJAXUV2ktxesEN+kHu45oCfsJ7rCfSvyq1gOq00FPD4
         waW91DGDiEW9wWZXl06wvKy6dE1aDpRfohtdRTt0w4STbvOQML4ITWK6KdJNY2q5zXo9
         X8Z7IVqxJ2OF9GGMNG0IAJ6s3F1FEpFU/8P6HZ26HSgpZjm4njd2qehXRYnVU5bPhgqb
         nsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=DSCihIiS6D710FIJkwCK6tUrzIdLrd0VDVuuIVSTgV8=;
        b=WWBJ2ckrF1/Tye5lJgow6fqoYCRSHHO7EdlnYNDEAfEkau1HeIYelcKIKdaWIqs9Bv
         1nO76gjobedctHJ9AMFOQ/g0WpG6iTwu9acUs/L8u/yYp6Xt/MRlrT4JoEsRTcgQekj/
         s5RbR3gktNnr/NL4cdEX40cVlSZdkGAlQSfK9cjovs+DJrcIGhoIcH2ohqIm1YPlef2N
         znS/Cx4lIh1u/JcFQzJn6ZbGoWBeLwFoiClgxDN5PILUDn2lcuFVkXpT3xYtDROhMxwb
         gIIYDply689HvSWX48ChdV0tyXszP7Rzm5iAzrTOUu7fjJ+GYivOh/vDx+UUregwgAU7
         lZ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PephW9EK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm34-20020a05620a1d6200b0071bbe916b10si768022qkb.462.2023.02.22.00.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 00:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PephW9EK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUkp8-0002Ha-7F; Wed, 22 Feb 2023 03:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pUkp6-0002H2-81
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 03:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pUkp4-0001XR-NK
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 03:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677055798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSCihIiS6D710FIJkwCK6tUrzIdLrd0VDVuuIVSTgV8=;
 b=PephW9EKC/pRSdlt4C33iODRzvbFDmFyFqAL6ESDdDx7gSG1TGiOc81u5KoXVKxHkAfGVI
 Fr8FiL0Tu0/03J3pG5IeF2vF9BGuAK1jiAqMzWjZqR3U0dmurR1YsM7UGZWvwsrVj65C8l
 1BJAVgVRCHrzhMvKMtKuKn7UNSUkarE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-09MNwSqvP4aKeZcJ6S8VWQ-1; Wed, 22 Feb 2023 03:49:53 -0500
X-MC-Unique: 09MNwSqvP4aKeZcJ6S8VWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6134C802C18;
 Wed, 22 Feb 2023 08:49:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A3B492B00;
 Wed, 22 Feb 2023 08:49:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v1 1/6] linux-headers: Update for dirty ring
In-Reply-To: <2a13c5ba-e20a-ae96-3efd-1f7e2d224eff@redhat.com>
Organization: Red Hat GmbH
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-2-gshan@redhat.com>
 <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
 <2a13c5ba-e20a-ae96-3efd-1f7e2d224eff@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Feb 2023 09:49:51 +0100
Message-ID: <875ybuaxu8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: PTSbb1JmSMsV

On Wed, Feb 22 2023, Gavin Shan <gshan@redhat.com> wrote:

> On 2/22/23 3:30 AM, Peter Maydell wrote:
>> On Mon, 13 Feb 2023 at 00:39, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   linux-headers/asm-arm64/kvm.h | 1 +
>>>   linux-headers/linux/kvm.h     | 2 ++
>>>   2 files changed, 3 insertions(+)
>> 
>> For this to be a non-RFC patch, this needs to be a proper
>> sync of the headers against an upstream kernel tree.
>> (By-hand tweaks are fine for purposes of working on
>> and getting patchsets reviewed.)
>> 
>
> Yes, I vaguely remember there is script to synchronize linux header files,
> which is './scripts/update-linux-headers.sh'. I think I need to run the
> following command to update?
>
>    # ./scripts/update-linux-headers.sh <LINUX_PATH> <QEMU_PATH>

Yes, and please include a reference to the exact Linux version you used
in the commit :)

