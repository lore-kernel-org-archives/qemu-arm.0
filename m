Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4726603lfp;
        Tue, 28 Sep 2021 03:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP0lYu3Oomcdstwm4BK2rJkw7sn1QgiWMQ0G0fRNUz6WgDOGAqqmzj/P84HvKMk702Owr6
X-Received: by 2002:ac8:51ce:: with SMTP id d14mr4613804qtn.16.1632824642952;
        Tue, 28 Sep 2021 03:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824642; cv=none;
        d=google.com; s=arc-20160816;
        b=jqR6qh2/OYO3QpZKnX8B47KrTk9MptJ0/nPPCncOM+5IMLGTTjaOzAg2F7bJyjbWzl
         RZ44oGOFzjp77tx3YkEc0C0x++uR3wTx5NkKOiO8mf2qsOqG4XoguOrIkEE3s5OS/5XD
         FyO7+KUih9if8SXMUmIqyI9p9VvrRO3yaYmQHnbBX7bLERmj2T4Hjc87LL7LGymLZvXR
         7G0gWdSVEgyQgjhTpXCsLP0TbWuXSsrGK9vddHXlJtFDMqtrFpmoLW8OjbnBjpHMUTFS
         x29XbdJPZowdDg1B6JWFHyK0EPkgAXh3rIxcec+82jidbVMXOXd4FA+SpX1K/bql7aVK
         1aQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=CvS8Ces5QDGZ/WzAqKmXdPTF8/ob+VepvixdpeSuTT8=;
        b=RaxR85JD/YvbPClBMfjqhusojqUKokb/JnmUMCFp2ZKLZjkih/cgLmkYT+5M1v3i2/
         IimwEgT4471G35INXE5Q6k2mThsvnQNnVdNszkoDwlWdbPP/am7whhhk9nH2euPTFoBX
         /AfcZUq91NeFWBCcREt52RQhFU93uqT83dj1oP9/J9h4gifOhAkPfkcarkBN3tiVF2OF
         Zenw7BCWjDO3GYDjGvB9PIunbvRhDi+u9s2dbfZXzOvVOlnkjsPCFjEJcav+zXZ/aouD
         C5W04OMkYxtOxgQ01ssswI/zSgxe8lzsxD95j3xaD+CnYt0jpUaiq8bSnfGVSgyikPxy
         +I4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RE6sJFTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si13067265qkh.328.2021.09.28.03.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RE6sJFTG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAHK-0003Zo-AX
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAFD-0008WI-Ie
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAFA-0002m8-FE
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824507;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvS8Ces5QDGZ/WzAqKmXdPTF8/ob+VepvixdpeSuTT8=;
 b=RE6sJFTGNFAnEqDxcTi3doixM4L1IeP2/CsOnyomcH0V2OF1jUDLzrWRXSosMhFYmdzGTU
 STiuzqln3FI7L0nIOZFcrI49hry8wF48gOxSmjZN9WUP1jAZbsmRamAmGRxUU5TYvuDHqL
 fC9mWG+Jgg1hJaOnCuEymh/TKs1kF/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-JysKQgZMP-irvc-9mHLpFg-1; Tue, 28 Sep 2021 06:21:45 -0400
X-MC-Unique: JysKQgZMP-irvc-9mHLpFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CFFD802921;
 Tue, 28 Sep 2021 10:21:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7D85D9D5;
 Tue, 28 Sep 2021 10:21:38 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:21:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 09/14] machine: Use ms instead of global
 current_machine in sanity-check
Message-ID: <YVLsrwOE2kQcyegV@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-10-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-10-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v19tUOk4HfJ8

On Tue, Sep 28, 2021 at 11:57:50AM +0800, Yanan Wang wrote:
> In the sanity-check of smp_cpus and max_cpus against mc in function
> machine_set_smp(), we are now using ms->smp.max_cpus for the check
> but using current_machine->smp.max_cpus in the error message.
> Tweak this by uniformly using the local ms.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

