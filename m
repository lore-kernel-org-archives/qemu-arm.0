Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1808155lfp;
        Fri, 14 Feb 2020 03:47:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrGAWmtqo7SLidIUqNvPi3DnvTnfNvRsL9qUAwQxsJBBLF775dDAvF33pZCr35DdpxhhTp
X-Received: by 2002:ac8:7773:: with SMTP id h19mr2167185qtu.144.1581680829799;
        Fri, 14 Feb 2020 03:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581680829; cv=none;
        d=google.com; s=arc-20160816;
        b=esdQM10z9TqCWVH4ruoocLpgggKYqWPumfAQT2aO4/mLIM0oF/woVqIYBF/bMHONzv
         sMXjVfDjQBm0pusduvSSkMxl7tnbrci/m7/iluuhRiCVYtwQVptSGosi090/G4Ngh7Xc
         NNx5JPUTbmlZWSF8kIphkTeAxC29JWkvFvyJW9PSv+KuqiM2BFZnz7xT1GQgKX6cp0zs
         Q6QgfVeMQHPUw9xluXGGCKP76OGWI7XK1wLH61fvwceYYgOT9rEzPKEJOZbcpBxuhF45
         B+MVuPTgCW3fyXkIzpMM+t753+s+f4yqUbQm66JiMpAm+KUsa5BEp3fHOzWXT6cDhaep
         uw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=SxMX0UpvUTdAOsL+LgluIHhV1v8PCiN4B847b3lrIMU=;
        b=tMMh2xwtkw7KfCCBc7oBLjyGuCPy37MqnlNHEjk5oN9AScs9fMK/JB1ZUydT4uVH+s
         igkKmfwz5jq13Zu9WTK9/FpgJxRmGOvQFRCHK9dEwUKN3Koz76epJj0gJYxJM7MFKQHd
         sjuLjfQZ05lmeJrwyEmkZ5KJf5SAOiOo3kgkFWd3PrOXR5pX3UQQeMKvk7FIDYMwWcAR
         MLGNiVIxHgaeWYZ0M+1uarDT6xAbSUYw0HkSF0EA+MJWjIC1B7NN1qNLamxymiatGCgi
         Rkh1PILO10taOCQV5pj0HbYVYhsbespGLm8xw2WQO+FsKfcXh+LLEFEi7CDCDhkA8efc
         2OQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E4bwHXUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si2584649qtd.257.2020.02.14.03.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 03:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E4bwHXUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2ZR7-0001TE-5o
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 06:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j2ZQt-0001Sz-A5
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 06:46:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j2ZQs-0000vz-B9
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 06:46:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40570
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j2ZQs-0000uC-7T
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 06:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581680813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxMX0UpvUTdAOsL+LgluIHhV1v8PCiN4B847b3lrIMU=;
 b=E4bwHXUzIALrmvrHZe6T32VcdLoV0j5L9HIKroxnK3IxmChv5IBJv97kuxSUODPjW5Vi15
 sXp6qkPkoWclA7gVW9oPpH3glJrSQtdgMacmkilUCGX1ZXw0ReLY9F6V4cUR5DlkPIJ/Da
 fjrhyb8S/zx2Wo1UBSjW5uQGdTzjNlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-fjWVyNt2OC-M0X9KDyw6lA-1; Fri, 14 Feb 2020 06:46:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D5C8018A5;
 Fri, 14 Feb 2020 11:46:43 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0DB260BFB;
 Fri, 14 Feb 2020 11:46:42 +0000 (UTC)
Subject: Re: [PATCH] migration/throttle: Make throttle slower at tail stage
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org
References: <20200214032700.25011-1-zhukeqian1@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d46149e5-8d8f-d3b8-91ec-145c102cffb7@redhat.com>
Date: Fri, 14 Feb 2020 05:46:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214032700.25011-1-zhukeqian1@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fjWVyNt2OC-M0X9KDyw6lA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: VDBCtJJoDqsT

On 2/13/20 9:27 PM, Keqian Zhu wrote:
> At the tail stage of throttle, VM is very sensitive to
> CPU percentage. We just throttle 30% of remaining CPU
> when throttle is more than 80 percentage.
> 
> This doesn't conflict with cpu_throttle_increment.
> 
> This may make migration time longer, and is disabled
> by default.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>

> +++ b/qapi/migration.json
> @@ -532,6 +532,12 @@
>   #                          auto-converge detects that migration is not making
>   #                          progress. The default value is 10. (Since 2.7)
>   #
> +# @cpu-throttle-tailslow: Make throttle slower at tail stage
> +#                         At the tail stage of throttle, VM is very sensitive to
> +#                         CPU percentage. We just throttle 30% of remaining CPU
> +#                         when throttle is more than 80 percentage. The default
> +#                         value is false. (Since 4.1)

The next release is 5.0, not 4.1.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

