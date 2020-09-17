Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp353680lfq;
        Thu, 17 Sep 2020 00:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/ufIgsAexFz6AYF858x98pNwqzDL++/vXfqrpjU74PPylVwlxuBM9BKBqKWSQ+Q+0ksLP
X-Received: by 2002:a25:900b:: with SMTP id s11mr10228730ybl.426.1600328882587;
        Thu, 17 Sep 2020 00:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600328882; cv=none;
        d=google.com; s=arc-20160816;
        b=AgdlGHNuv89dbCMa4pIkc5uRrw60pitybukgEVIvFtnCH3kUmXczpALWGADFiTZ8nN
         je+/BlfUtFzTwuwZTfwsXmTIQs5qzjE8ZdqvlF/Mxmoa6V6W50Q1Uz972wjIEQZSXZJV
         xM/pEwCv/SEaIeqJBCddq9tIMdmsYCznwPpXFT5jIrQ0OW+ve9iPgHj4km6ZaqP03/NE
         QNTdqo8cO6vGKF7mKAyyW1dLKIy1wgPGXzuvlHD6ywNOZto6pJAyfRVU00gCtZVNmRmL
         Wj+QOf04b2CqTDnPqWI2uij9t6XUR5xogRcCD0SqnNKgZ3awWKGm+OJth1q3nYZr93x+
         y9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=/1lurTq5n5TI0TwpvZGZbnQLRV2vILXZ/Cw0++RY9UM=;
        b=wvjpASMevgEGSir395q0Af0bGmLrX2enc6LeE9b1W9fHZQvdehFTd4DpzxQKUIhi3+
         Y9dh2UI79T0CIpgvdeOX0cz+qyS480B96A3JEl9mYgu6tHH9rOxNJ95mIATiewKeNYR8
         aspeuteI+gtkgw/LcKRB1bYS727qnO7QR0HMiTV8d4gHKcrf9pmhZPNz9AehqcIsoLjS
         m/+K6HLz5A06EtEn2M2zap9l8oqpPbrPIeV9D5AEuIY02AS8oeu+wGfLder2aZXnf+K/
         VGz0jF6Z3KrhD0HN4doWVs2pqQ/u3CxIQBIFLjnszeVaus5voTL+SW4A6rZs8Hzn+4qf
         3lxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VXzL1pER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j145si11731430ybj.324.2020.09.17.00.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 00:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VXzL1pER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIoe9-0007Pm-SI
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 03:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kIodn-0007Ol-Tm
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 03:47:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26279
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kIodk-0004kW-Gh
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 03:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600328855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1lurTq5n5TI0TwpvZGZbnQLRV2vILXZ/Cw0++RY9UM=;
 b=VXzL1pERhFFoayQYzJ2F8OivYo40cH4tvYGVqlc7PwBcr6uzSvnz8gv4nyd292sfrvXfx+
 9GAzuFxKnpWjkWAYVKLNNIO0LIgmvnIPsEWw2VqLs2FJQVwtlE+B69ke81Yv3QM5GPBUa7
 LYKElH2gC0qQbKz9Jjd7EsrSOvptQTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-723UZI3VOhWnD206aaQuRA-1; Thu, 17 Sep 2020 03:47:33 -0400
X-MC-Unique: 723UZI3VOhWnD206aaQuRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9371084C96;
 Thu, 17 Sep 2020 07:47:28 +0000 (UTC)
Received: from gondolin (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C694C5DEBF;
 Thu, 17 Sep 2020 07:46:59 +0000 (UTC)
Date: Thu, 17 Sep 2020 09:46:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
Message-ID: <20200917094657.392c341d.cohuck@redhat.com>
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:47:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, "Michael
 S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, "Daniel P.
 Berrange" <berrange@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?= =?UTF-8?B?w6k=?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, Corey Minyard <cminyard@mvista.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nZ3XvrHtncwz

On Wed, 16 Sep 2020 14:25:17 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

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

Acked-by: Cornelia Huck <cohuck@redhat.com>

