Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp322659lfq;
        Wed, 16 Sep 2020 23:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm9J6oOL6wiUFl3ycXWQOpj98aJqVQscknsiMnuPpN6o+SXUAmup/CZMmKMTByhSUXx19d
X-Received: by 2002:a25:b74d:: with SMTP id e13mr40592985ybm.296.1600325658582;
        Wed, 16 Sep 2020 23:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600325658; cv=none;
        d=google.com; s=arc-20160816;
        b=zW+sPgX+z2QbGS9AOjAy8ZA4aYKVIZF2v35Y5+m6bMip79anMW4TyDJY++C/Ch9WCR
         xpBnpdu46AM+fQdL9gUjR6LefXJhGvRZpx4fp+OkoRWI33OKBZyQ/FSwa2FeFdSWYDwn
         hy1LDyzCJCRl5qPJAWkIo05lpFfJ3p+ZRMTBrIawnB7kVHBjTFBX41wbjlqOSxLOWlVW
         LohZIGru17f1E9ReT/z0wHe6SAlE25qn5yAfQppSCSKfu/z4pVJWdb4UT0AVNmUgXdWH
         0AecBzj6vsHOkFD2393/FCoytY/ZZdE36zgXmYnjpk4b8vbRz3vBkmMBW2rfqO5FEdtK
         96qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L0lgBxauyLiUdIl+EnyBv19nWkSNL7xD8jlPKqxDSDs=;
        b=0+uMjLBrUMRbcBja3NTpktHn3cD7raRDY141wWu2h6yv83Tu/RZ0BnVGdysYnI0PrH
         b31VMfewxDyJQldVP/IuqCkEwLQTC5nvslMZoGKMF6Al5bqiHJM1j10Prz2HOcKIGv3h
         OOidZEMZJLxA6/GxrHYZNBMFsI3E7SfXZcQ8CzXCvBsju9urLhGmHORhnZHHo0qLmkYQ
         UufPv6cvSow10PvCk6s1F75UkKkPrRtpx/slJixd/gth/QpgqMAgd+oQhv013qPRrvmg
         nxbIzkOIzNPLv7WZCx6jBxDCayVQUTJwNe+xRrv8KGslwLgT3vhDDHxzcLHJXJs3Q+Sv
         V1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z4Yj0Mr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si1795525ybm.274.2020.09.16.23.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 23:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z4Yj0Mr0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIno9-0001gk-TT
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 02:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kInnk-0001g4-VY
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 02:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kInni-0006dn-Cb
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 02:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600325628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0lgBxauyLiUdIl+EnyBv19nWkSNL7xD8jlPKqxDSDs=;
 b=Z4Yj0Mr07Lsj//s23pseCWKG/2qTfShrhndIK4XvDm8LIhSmJnvkDgUOeo2XwJ/uBXxmnA
 EHZ/9p1JpdFCNAButbjA1Uh8u4dJ/U6hMQhjf9GQi43y4D/eUGyGRCpxQj7pMXzmedfetv
 gCA+uHzWtTsuHg4qH/bBSUSUHCo4EHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-O6Jg9PqVOcm526XUh0tDPA-1; Thu, 17 Sep 2020 02:53:46 -0400
X-MC-Unique: O6Jg9PqVOcm526XUh0tDPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B91481F01E;
 Thu, 17 Sep 2020 06:53:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-38.ams2.redhat.com [10.36.113.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BA9178805;
 Thu, 17 Sep 2020 06:53:14 +0000 (UTC)
Subject: Re: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2a434507-c655-8b2c-30e6-8024b21ab017@redhat.com>
Date: Thu, 17 Sep 2020 08:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.062, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, Corey Minyard <cminyard@mvista.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HNcHpcrRDbBT

On 16/09/2020 20.25, Eduardo Habkost wrote:
> One of the goals of having less boilerplate on QOM declarations
> is to avoid human error.  Requiring an extra argument that is
> never used is an opportunity for mistakes.
> 
> Remove the unused argument from OBJECT_DECLARE_TYPE and
> OBJECT_DECLARE_SIMPLE_TYPE.
> 
> Coccinelle patch used to convert all users of the macros:
> 
>   @@
>   declarer name OBJECT_DECLARE_TYPE;
>   identifier InstanceType, ClassType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_TYPE(InstanceType, ClassType,
>   -                    lowercase,
>                        UPPERCASE);
> 
>   @@
>   declarer name OBJECT_DECLARE_SIMPLE_TYPE;
>   identifier InstanceType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_SIMPLE_TYPE(InstanceType,
>   -                    lowercase,
>                        UPPERCASE);
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---

Acked-by: Thomas Huth <thuth@redhat.com>

