Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1304827lff;
        Tue, 10 Aug 2021 06:07:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOds1Hs2SmxlRwtspxS6sZx84CojNgP7tKiWMDQuyy3FMw6U72+UbpVO0lkcLJRkM+VlmB
X-Received: by 2002:a17:907:9602:: with SMTP id gb2mr27855527ejc.354.1628600829670;
        Tue, 10 Aug 2021 06:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628600829; cv=none;
        d=google.com; s=arc-20160816;
        b=G9qHKq4pJyT/UpYgnvDkeaiw3oNshkICJH50mBg/pFfnCWMKQoEdOG1jzMhWAZJJEw
         OxQT2qtKKUcEDF6hVt8Gr8gIHpMwLepFYchbxGOouy1XQs68qeLGyMnkzKJtBAExLzgI
         5Jn4bqKiQrk2P4M/57BYIcrrUOaJHc2qaRqRB2wL2ZXF3o3gCdoSCc8wdn3QuyoJ6Odb
         8bWwteQaLYnUoalhQzxeG9GtPNFhNI+L3zZIxXSdXIBhehyzUxon+YwTdvjDMaK0wi2b
         pGJe/tjtn24SPpAp6rf1FQNpPcqSAlZinMpinLVZmDN88tQk+qgri+VOPsPi9Ui7uj+K
         20Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=D2v8w1PU4a87XmsGvh3awPCADXRMG9ow8c7kJz2jiyw=;
        b=iTbgbsTXWXRvtCZ68f4TU1KZh/6Ke+JVEjasHpt7mwGdRxnFaycHlOgAVy8YB9zc3e
         XLG3BXM21V+Cf6j8LsaFOYRco6OdSok4faKXgElvCK+U8x+QLKYgkPef88B/8o5OiePS
         V80sYgs8b9J/NY9IwnyZJTs1tAm+K9VNUAaNAYLvNu2q6eTml2kQ125DRdsXRe+V+UPe
         VbtHSPMBG7h6GX3XpOShy2YmTpykugxog3fDFFnFzW6wIbifFAFvGzg6VamBI2rceT7p
         NH6vPKJ3TOE7pU1Wqqyb7yTS0aYUaHV5ZiOdspalyWVKooJOdT6Q51kd3G//vARQvWAj
         WY+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W73f2HSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si957083eds.548.2021.08.10.06.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 06:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W73f2HSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDRTI-0000Aa-PA
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 09:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDRT8-00007A-0I
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 09:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDRT4-0001V0-RC
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 09:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628600814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D2v8w1PU4a87XmsGvh3awPCADXRMG9ow8c7kJz2jiyw=;
 b=W73f2HSSlO/+YlTo98tp5vRBMlZdnqflVKrnA05tJMHHScTkXoT/FyoC9cj+IhC75MCYCM
 sWhIvvnq+YeFZWhjPNIf7RdMTkXReEVubYkFvNxoKQRiR1dKJrlQzbNtz0wodWFzYQFR+M
 DLHimFvGOc0+Yj/EjV+m2FBvAibVmOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-4FL5BMSrP-yuymjKoiMKmQ-1; Tue, 10 Aug 2021 09:06:53 -0400
X-MC-Unique: 4FL5BMSrP-yuymjKoiMKmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E20901026222;
 Tue, 10 Aug 2021 13:06:47 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6D543AFD;
 Tue, 10 Aug 2021 13:06:44 +0000 (UTC)
Date: Tue, 10 Aug 2021 09:06:44 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add
 missing includes
Message-ID: <20210810130644.k3cyqdj52bcloyfn@habkost.net>
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-6-ehabkost@redhat.com>
 <877dgt1paz.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <877dgt1paz.fsf@secure.mitica>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Vijai Kumar K <vijai@behindbytes.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <minyard@acm.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Hg4Ej/FBm5I

On Tue, Aug 10, 2021 at 02:01:40PM +0200, Juan Quintela wrote:
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> > Some typedefs and macros are defined after the type check macros.
> > This makes it difficult to automatically replace their
> > definitions with OBJECT_DECLARE_TYPE.
> >
> > Patch generated using:
> >
> >  $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
> >     $(git grep -l '' -- '*.[ch]')
> >
> > which will:
> > - split "typdef struct { ... } TypedefName" declarations
> > - move the typedefs and #defines above the type check macros
> > - add missing #include "qom/object.h" lines if necessary
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks!

> 
> Just curious, how did my name ended on the CC'd list?  I don't see any
> file that I touched or that is migration related.

include/hw/vmstate-if.h is in the migration section in
MAINTAINERS.

-- 
Eduardo

