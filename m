Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4729780lfp;
        Tue, 28 Sep 2021 03:28:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyebKFA1A/WoD/XghC+QoQX4jfs7pcyafmLWbEvSEtb12GmISL4xMTn4nULamUE7HgnhxsM
X-Received: by 2002:a37:b586:: with SMTP id e128mr4573936qkf.43.1632824899642;
        Tue, 28 Sep 2021 03:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632824899; cv=none;
        d=google.com; s=arc-20160816;
        b=DaJl6vrExOEZI9/dXMv8wUw0S8lOPqRlppeGn8k/E7Sn6X8PAaacuGBiFHYiDLsQaB
         S2bpi18wSckz6vaMd8jomo9zmxkFuJ9nOm0AalV9JnfcDXilg+RMvg+tU+AuVO5PH6SS
         4uSz59wTQdWKF2MOCm5H4xTCpwxM1XZ1ccwAVWruGRyNT+ueOllUUHhpGcm5C5AS1WSH
         a6x9Xc6tcpVcb9bXqm2qyAbECa9LomZPQy6dmIg2yz+5WeDwdRItCqc3OgfTWCMxkqCE
         D0ekSSDAPBs9b5YqNQL0yFu5W9P3eDQyYct6OBc8tBOciY9dr3BcOJcx9GznUFMdyEBW
         rNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YjZbmWI/l21ich4SsAoZGcgw200Idsce8jmegmlRTMs=;
        b=kC8KA4pNBahsihTkaLKqg8DrbzU1Cc10OYn7RKi9ShWiAml8MrtINIcdhcmbs5c8Yg
         sNqVyIvHM40pa3yNajDGNpKtNh/aRT8AgASp7Hf1g+BhAVYDcPYo3b/AQUX0EKdb+YI8
         28eeWgAIe8stPEHWLDQogN0O369obVBInnitfDzeTdhqDF5ki8gIpNzfJanlMqVgjYUE
         /cqODlCC0D4WxSygi5X8cON3zP01CPERBrjiQAOoxDLq53AkyQKAo+Qx5WBq7ccV6rLa
         6cE2LA/SAIHhcYh7hZtLzYAq1bgZ6mnOPG0caez6ufO2CV9tFLS/u+LaqcUF0xTSLgT/
         36wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ae2wH3Og;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke13si14941433qvb.238.2021.09.28.03.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ae2wH3Og;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVALS-0000j7-Ue
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAJc-0006dd-6H
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAJZ-0006zx-UZ
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632824781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjZbmWI/l21ich4SsAoZGcgw200Idsce8jmegmlRTMs=;
 b=Ae2wH3OgHwcPyTxs9WfSEmavUK9xGCE/zxGQaq9lpL9zk05yyP+rKhJ2swzNfkyrtZvh0A
 LJQdksTt2Gg0ZAMa8hPp1ipGNcGd6ca2PL8GJd5nORcSLPBYP7c/rpQWkqLImNxhj2HGAJ
 zCw9IOvMjpVT1l0G+a0aP+nGCeu8dPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-wwPQMgNGOmSRUyfo8YzUoA-1; Tue, 28 Sep 2021 06:26:19 -0400
X-MC-Unique: wwPQMgNGOmSRUyfo8YzUoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C0CA835DE1;
 Tue, 28 Sep 2021 10:26:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45563AC0;
 Tue, 28 Sep 2021 10:25:55 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:25:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 12/14] machine: Remove smp_parse callback from
 MachineClass
Message-ID: <YVLtsRB7aGcYvDl6@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-13-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-13-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-TUID: F9CTE7vZmk3v

On Tue, Sep 28, 2021 at 11:57:53AM +0800, Yanan Wang wrote:
> Now we have a generic smp parser for all arches, and there will
> not be any other arch specific ones, so let's remove the callback
> from MachineClass and call the parser directly.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 3 +--
>  include/hw/boards.h | 5 -----
>  2 files changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

