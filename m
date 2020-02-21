Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2187773lfg;
        Fri, 21 Feb 2020 12:10:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyphgIL0Drs83BzetlysvU91mylpuNUva2bxk7Uhwwe737lNWW6bAiCYi6F1gSmPutFnnt6
X-Received: by 2002:ac8:405a:: with SMTP id j26mr33514012qtl.88.1582315825751;
        Fri, 21 Feb 2020 12:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582315825; cv=none;
        d=google.com; s=arc-20160816;
        b=RLhuBbpwXCOU6adH4s3w5un+b9d+7k3/Mb1eAi3uNMhAKWyokFMwtc/JAn2Y/UNqb0
         gjC8DfGMhdPXHKmNmgJIkt5u4qjO8jrLCNd+BuXZfW2pk0c8MYs7cYWwQ6bTBr9ssZbV
         mRWvWtMUw+cgOJ/Gk+Or+Gln6bi2nEZLk4e+bMP4V8aWaf18+XdXp757oXrOMSkTgPJi
         iR+GCUkbACm++VlHsM2LyWt+6Q8944ewFGV9pcmn/wP6tYM2onOKmY9WEsyddSMSKO5/
         J5InP31lhHt4MnwzOKmtn5zPCCaP2Y/JGbeUheFaQWM8N+3EndY133socQUAOo9kC9cy
         +mqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=50xmr0NTYwSScksm8gVD6PFXJnTyYt5MVFSBX9ZvBbY=;
        b=yzyXEB4PdmVYzLZaqzugAJSRLYIdxyB4MZBm6SDoLX/sWJVKr/woC8U9nJpQP7YDnw
         Dv8e5m7u1uZql1yAmkNS8ipzys1+J0WVIrD0mymogdKOlb8UIGpRFx6LWZzFAqMaKhb6
         YqzrYCr/PSQNTRmFXDfMz/+jHVLr9AtpnHHnKQu3754Zq/2GTaiEzq1OrG6lDz6eeQ4g
         2QwV4u6J6ihkknU/vFhP706R5SEuNyzN5nek/xVXvg9KDAuXiygtO1YQoqC3Kbh++n6x
         1x0vLZjshC0B5v+ZBxeUmcLL7hvNvDeEc/+xWGsPEYNO/JDhoTZaGmVCjJSYiMF2fifQ
         shdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FkBrARwv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c24si2000354qkl.36.2020.02.21.12.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 12:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FkBrARwv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5Ecz-0003IT-5W
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 15:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j5Ecq-0003GN-M3
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 15:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j5Ecp-0007t2-6c
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 15:10:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39417
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j5Ecp-0007s7-1r
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 15:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582315813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50xmr0NTYwSScksm8gVD6PFXJnTyYt5MVFSBX9ZvBbY=;
 b=FkBrARwvCfF32rDOI9WUXRg2g1yMWa6KCGje65HKnpE4rc07WTPHgMwhljP4fGc5XEqx4y
 Cx5VmDk1J8NIm+RXCLANcjSyxJGpE2xPmMgTGWIjhkG09sniLBUIOLBMMnoLoM+X9Qu8aS
 0jOPRpxY2IW8SKP+DLEW7ZS0/E2kIoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-9f5JfNYmMjSWhaHa6SLUFQ-1; Fri, 21 Feb 2020 15:10:05 -0500
X-MC-Unique: 9f5JfNYmMjSWhaHa6SLUFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AAE2800D48;
 Fri, 21 Feb 2020 20:10:04 +0000 (UTC)
Received: from [10.3.116.90] (ovpn-116-90.phx2.redhat.com [10.3.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8226B9182B;
 Fri, 21 Feb 2020 20:10:03 +0000 (UTC)
Subject: Re: [PATCH] migration/throttle: Add throttle-trig-thres migration
 parameter
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org
References: <20200221025727.63808-1-zhukeqian1@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2db47b97-729f-4ccb-dab2-585771acc2fe@redhat.com>
Date: Fri, 21 Feb 2020 08:14:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221025727.63808-1-zhukeqian1@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZuBnZUhzGXe

On 2/20/20 8:57 PM, Keqian Zhu wrote:
> Currently, if the bytes_dirty_period is more than the 50% of
> bytes_xfer_period, we start or increase throttling.
> 
> If we make this percentage higher, then we can tolerate higher
> dirty rate during migration, which means less impact on guest.
> The side effect of higher percentage is longer migration time.
> 
> We can configure this parameter to switch between migration time
> firt or guest performance first. The default value is 50.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/qapi/migration.json
> @@ -524,6 +524,10 @@
>   #                      compression, so set the decompress-threads to the number about 1/4
>   #                      of compress-threads is adequate.
>   #
> +# @throttle-trig-thres: The ratio of bytes_dirty_period and bytes_xfer_period to
> +#                       trigger throttling. It is expressed as percentage. The
> +#                       default value is 50. (Since 5.0)
> +#

Abbreviating feels odd; can you please spell this out as 
throttle-trigger-threshold?

Can the threshold exceed 100%?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

