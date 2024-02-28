Received: by 2002:a17:906:a892:b0:a44:c09:7745 with SMTP id ha18csp236404ejb;
        Wed, 28 Feb 2024 05:55:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzkEZVtuJZlWEFExLolJYMjex4LUpSYihKu4MckSmlj2pSTotDfMLmSvkvKDbplG2yMoOp8CE1eGcvFw6qahFT+d7HPgnZ
X-Google-Smtp-Source: AGHT+IHbzW3hfuDV8k76ieiKOEAA9UyiljD3nWozPcsBBDBJ9x+VIebKgEpQwLU6OcylN10IQykG
X-Received: by 2002:ac8:5a07:0:b0:42e:aa98:f35 with SMTP id n7-20020ac85a07000000b0042eaa980f35mr2568475qta.66.1709128537695;
        Wed, 28 Feb 2024 05:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709128537; cv=none;
        d=google.com; s=arc-20160816;
        b=D3AoAWOIp8JJR++nN64cGhIXDDv4zzZ9LIoA70fqLvym1I4hAY127AiGzQQCrmwLhZ
         3je7x1s4n1I62iKfr6BzosF2BKFdDLE9PgWYlGdeZjKUFDxYfZlsLnMk5H+vHTkrVnRp
         M8aHH6I0NaxTQD4orKGxsxgzIMYj2pJ7EqI1SUvR3c5FSLnvNtRzKLo17UxnPFyd/Kvn
         WdLDBlrm4dHXLPkARxuhvRu+FBJK+RPyLXQN6Pq98jVUQTI/zzm1rAJpLpVqN701oKPl
         rbazh5IzpxcD3wRO0S1U3yRCiWo+2ZBx+W5hJoixgKpYS0nxcJnz2X8rL+gF7kpq9qIq
         nkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=XeiM60lOwYsGGxoEiHfT/9CsC8ZOw638m17MeMblI0g=;
        fh=rxSFDWb9DI4Ldwgz7UYRoHCYpOZmiVC0r1+VngrRlcU=;
        b=oPqoypRYlHBdULLt1JEDd9VV2/SCqzaGAeseTImMSC8ETlftuXlQtSxn7etLvQUEY5
         PCM077GPF9E+cF1lT7001aGf5HtNlNwcGj9UcL8ac9fpxQbsn0xwhJXhdRRxTTTiid9M
         GN+vRz7TbHFfNEjvugY+YJH89dxVqXK+pq8ivNgd0WaC4Eo/BYN8GA2SVUHYa9wiAI0o
         w9Izuc1YQi/wzywNi3N+ZSlXml2F/shPXJYup6Zq2awBwk9bxb8fORuMuR02b8qsEd8T
         FDlZxRPCTJYTu+F21MIw/TJiWzGD6JMIIA4mbvgx4jPOwX0tUtovFqKF1cqHBa9SGs50
         4oqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb12-20020a05622a1f8c00b0042e78ddb3aasi736777qtb.314.2024.02.28.05.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 05:55:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfKP2-0004Q4-Ao; Wed, 28 Feb 2024 08:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rfKOw-0004N8-N2; Wed, 28 Feb 2024 08:55:17 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rfKOs-0001DP-B2; Wed, 28 Feb 2024 08:55:14 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TlG3X33s5z6K8w5;
 Wed, 28 Feb 2024 21:51:20 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 905AE141427;
 Wed, 28 Feb 2024 21:55:06 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 13:55:05 +0000
Date: Wed, 28 Feb 2024 13:55:04 +0000
To: Markus Armbruster <armbru@redhat.com>
CC: <ankita@nvidia.com>, <jgg@nvidia.com>, <alex.williamson@redhat.com>,
 <clg@redhat.com>, <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
 <ani@anisinha.ca>, <berrange@redhat.com>, <eduardo@habkost.net>,
 <imammedo@redhat.com>, <mst@redhat.com>, <eblake@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <zhiw@nvidia.com>,
 <mochs@nvidia.com>, <pbonzini@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 1/2] qom: new object to associate device to numa node
Message-ID: <20240228135504.00005d12@Huawei.com>
In-Reply-To: <8734td3uty.fsf@pond.sub.org>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-2-ankita@nvidia.com>
 <8734td3uty.fsf@pond.sub.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T7GHe4OkNLqv


> >  ##
> >  # @RngProperties:
> >  #
> > @@ -911,6 +926,7 @@
> >  ##
> >  { 'enum': 'ObjectType',
> >    'data': [
> > +    'acpi-generic-initiator',
> >      'authz-list',
> >      'authz-listfile',
> >      'authz-pam',
> > @@ -981,6 +997,7 @@
> >              'id': 'str' },
> >    'discriminator': 'qom-type',
> >    'data': {
> > +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
> >        'authz-list':                 'AuthZListProperties',
> >        'authz-listfile':             'AuthZListFileProperties',
> >        'authz-pam':                  'AuthZPAMProperties',  
> 
> Jonathan, you pointed out interface design issues in your review of v2.
> Are you fully satisfied with the interface in v3?

Yes. I'm fine with the interface in this version (though it's v7, so I'm lost
on v2 vs v3!)

Jonathan

> 

