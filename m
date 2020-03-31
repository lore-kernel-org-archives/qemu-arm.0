Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4080105lfi;
        Tue, 31 Mar 2020 08:09:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtWfs2ajfoar7xVGmLcbu+KLUomKD42uiTePrF5zBNJWWIQu/IiQqxirHFlecLFXA+51JwP
X-Received: by 2002:a05:620a:1252:: with SMTP id a18mr5482240qkl.204.1585667362449;
        Tue, 31 Mar 2020 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585667362; cv=none;
        d=google.com; s=arc-20160816;
        b=QSHMviMIZbugItYwuG3oFECyLDZuYy0g2f2eDMwijX2PZnCcEdyeD5fi2o4R6IXVRX
         j9r1At+kd02jrWVhVRvEwnyjc1kBa7ZY4otzBvt3J7b/W0in+RuqmOE/61xqX0qG2mVO
         UTJQgejXlOZDZeypvorIdMhWgjgClrFPUVT+0Ss/BFItGMuV89JD6QFLQ9JeqGy06c+u
         mSVGTSgaO/3RDSjfBwMrqwfvUOYKDSgdoCZanfq6N2qrKlT3tQ9xRffsOJ7tiV1RIu3Q
         SsTtTLzuE4tubP8hJT1PxdawqrHJnT6yxc+2VAUCtCELFdfgrNaLdKT3UuxevXJXYaSE
         qQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=acgp/8hO5UArPmrgeVJ48WS3S8E4cqI7wgzYYPeFL68=;
        b=0P0MmJ2StFzkHmD8bJN8zBFy9IgZUVHIbJLfRzoGUVEf+riLWPHwjdEjQc0gpHQke+
         9UP2V91fZ5SFfe2hUNLgnj/aqBrBSOVFMAZ2BWT0BZpeAf4jlZeiJVH9yEd/3lLeXrlm
         AbtgXX0WZh7NbuqMtbYF62ftEItgOj0MVf98h5tail4+UerhkahbnWdd2P5a3F1dsKRn
         OyJy0LH5PY+TyDwy6JOajcdPqVzPMueKxXF9b+f4OIC3hZR0DjFJRpFv0ubU3I2hGkpR
         tXRO+kjG98WldS6mApDhc1D9GgtfUwoFyIATVX8XW6kxvERGputyNuFo76mUPq+PF0Fm
         w9Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T8ArUCnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si9972944qkl.323.2020.03.31.08.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 08:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T8ArUCnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJIW1-0001W8-Pj
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 11:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jJIQG-0001ZQ-S6
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 11:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jJIQF-0001E8-Gc
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 11:03:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52194
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jJIQF-0001Dp-AM
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 11:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585667003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acgp/8hO5UArPmrgeVJ48WS3S8E4cqI7wgzYYPeFL68=;
 b=T8ArUCnUt+Y5zvP59KN1SLy0hVQ0Uyl5gRpFKdgmoud5HpivVb96dMV+9Dg/GctxN3As36
 TY1z/zRX/PNH/ksGphxPxzgUDQzYItj5saD5vW9xTC0VtH9okJtR42doonNCp+7z+BxuEQ
 Glv7XfWv0dQRJVGhAxJPR31Ei9P9dHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-tIWDjKiRPAqTwiNExeh3gA-1; Tue, 31 Mar 2020 11:03:21 -0400
X-MC-Unique: tIWDjKiRPAqTwiNExeh3gA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 399F8189F785;
 Tue, 31 Mar 2020 15:03:20 +0000 (UTC)
Received: from [10.3.113.246] (ovpn-113-246.phx2.redhat.com [10.3.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 366741001B2B;
 Tue, 31 Mar 2020 15:03:19 +0000 (UTC)
Subject: Re: [PATCH v2] migration/throttle: Add cpu-throttle-tailslow
 migration parameter
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org
References: <20200316042935.28306-1-zhukeqian1@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <144483ff-e10d-e1b5-0c60-609b4da9c217@redhat.com>
Date: Tue, 31 Mar 2020 10:03:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200316042935.28306-1-zhukeqian1@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: a5qH4ymnOB30

On 3/15/20 11:29 PM, Keqian Zhu wrote:
> At the tail stage of throttling, the Guest is very sensitive to
> CPU percentage while the @cpu-throttle-increment is excessive
> usually at tail stage.
> 
> If this parameter is true, we will compute the ideal CPU percentage
> used by the Guest, which may exactly makes dirty rate to be dirty
> rate threshold. Then we will choose a smaller throttle increment
> between the one specified by @cpu-throttle-increment and the one
> generated by ideal CPU percentage.
> 
> Therefore, it is compatible to traditional throttling, meanwhile
> the throttle increment won't be excessive at tail stage. This may
> make migration time longer, and is disabled by default.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/qapi/migration.json
> @@ -552,6 +552,21 @@
>   #                          auto-converge detects that migration is not making
>   #                          progress. The default value is 10. (Since 2.7)
>   #
> +# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
> +#                         At the tail stage of throttling, the Guest is very
> +#                         sensitive to CPU percentage while the @cpu-throttle
> +#                         -increment is excessive usually at tail stage.
> +#                         If this parameter is true, we will compute the ideal
> +#                         CPU percentage used by the Guest, which may exactly
> +#                         makes dirty rate to be dirty rate threshold. Then we

Grammar is off here, but I don't know if you meant "which may exactly 
make the dirty rate match the dirty rate threshold" or something else.

> +#                         will choose a smaller throttle increment between the
> +#                         one specified by @cpu-throttle-increment and the one
> +#                         generated by ideal CPU percentage.
> +#                         Therefore, it is compatible to traditional throttling,
> +#                         meanwhile the throttle increment won't be excessive
> +#                         at tail stage.
> +#                         The default value is false. (Since 5.0)

Is this a bug-fix that must make it into 5.0?  It seems more like a 
feature addition, at which point listing it for 5.1 is probably a better 
idea.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

