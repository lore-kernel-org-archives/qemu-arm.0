Received: by 2002:a05:6214:13e3:0:0:0:0 with SMTP id ch3csp1671711qvb;
        Thu, 17 Sep 2020 10:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6QKiWL4QU9eoB/IB1cVtTFDQn65DWIl3VfJfQz7PP67yUblcRLHB/E1QVroc5K4rtSGFt
X-Received: by 2002:a25:d70e:: with SMTP id o14mr33916647ybg.425.1600363551611;
        Thu, 17 Sep 2020 10:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600363551; cv=none;
        d=google.com; s=arc-20160816;
        b=nRaO5XC2LA+wkbV1XIPIwDbo4NXBHuGwcJyeBQLN9Ugnb5VnG/+8ZCa8MSVLt4ouIK
         YnkTdyQepN8kpkGumSNb6W6XDaijMPuvwEhsMUUsOJeNOimxYf5pmtDUlmjl+uq22ej7
         FQYwlkj0ZNNx5UwPkR25vsW0/dMmli+1Vr9INJg3q+qApld1t/8qQlvSMubjjta5cgl+
         lOV46R03YmeCOPyl374SJ5a/Sz0+UR3ZORoaf6P5f00DS6RCuH1lwUpFkOpt0twlEJ8o
         wNOAKWPlZNMUqOoFBhSzPIVZt8n3yTgoj+CK9erIGa98YRP7EnJXU2QOVE5GhMqCc2QX
         TtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=NiMqJyOAgc9k1O8hdbp9WPJC1wRY2KpiBiqi5B/E4yE=;
        b=JrPtORRYIqIa8Dx9P2Y0UQl9hkPCZ8gl7ZHXx6I2NhJaFcFvG3/jALgfYf6v5w8LOG
         vO8Z8ynOrxU8Aiizp3M/Zp0HbO4ggMYbyBPG1Tq2s7P9eRsPi9hid6zhj6KeBtu49QUB
         8ha8712+LsZ4+S34qMrFa8Pd4bo0fdIkfugaY7/jFhoRgMh31nuc4SH2axkl8bYE6U2s
         nbomWVYhpW7VcPA+ynR5o/mMkUx9YAQZ4xtAT2dpzcB0EDS9aX6Ddzfksde9huQtpQPE
         FPVyRZ3gyx7Cv4dJX3JlXXAfBWjnVi+IN165dgcDmwyES/G7GNhHJpGafSr8KjYuT3yl
         Hdlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J7sVFqEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si214738yba.132.2020.09.17.10.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 10:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J7sVFqEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIxfA-0000sv-Nl
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 13:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIxeo-0000s1-HT
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 13:25:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54520
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIxem-0008Ph-SU
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 13:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600363513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiMqJyOAgc9k1O8hdbp9WPJC1wRY2KpiBiqi5B/E4yE=;
 b=J7sVFqEmhpvY/9DN59MLDPJai1cTopsfiAj6JonusINMP5XKDvz77FbokGY8cbbZjSyrZn
 ixmY9GU1/WsHm2uMQ4mYtsuB3vY0SNbXiL3FTfBfv8mx2XNjYPYD5uW1xW9wIlLm9ysEjv
 XDpAaXfPFt7Y7rUKlkZfoChrfQ5UH60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-rjuuK4ekPPCmAEloKglTLw-1; Thu, 17 Sep 2020 13:25:08 -0400
X-MC-Unique: rjuuK4ekPPCmAEloKglTLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 056281084C84;
 Thu, 17 Sep 2020 17:25:07 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 224DB73664;
 Thu, 17 Sep 2020 17:25:02 +0000 (UTC)
Date: Thu, 17 Sep 2020 13:25:01 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 2/2] qom: Use DECLARE_INTERFACE_CHECKER macro
Message-ID: <20200917172501.GR7594@habkost.net>
References: <20200917024947.707586-1-ehabkost@redhat.com>
 <20200917024947.707586-3-ehabkost@redhat.com>
 <e77ca535-4f70-98ce-c49f-f5f2fa4c6150@kaod.org>
MIME-Version: 1.0
In-Reply-To: <e77ca535-4f70-98ce-c49f-f5f2fa4c6150@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 09:24:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGp+S9I61T/I

On Thu, Sep 17, 2020 at 09:38:02AM +0200, Cédric Le Goater wrote:
> On 9/17/20 4:49 AM, Eduardo Habkost wrote:
> > Mechanical search/replace to use the new
> > DECLARE_INTERFACE_CHECKER macro instead of manually defining
> > macros using INTERFACE_CHECK.
> > 
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > This is an alternative to the patches submitted at
> > https://lore.kernel.org/qemu-devel/20200916193101.511600-3-ehabkost@redhat.com/
> > https://lore.kernel.org/qemu-devel/20200916193101.511600-4-ehabkost@redhat.com/
> > ---
> > Changes v1 -> v2:
> > * Build fix: move declarations after typedef
> 
> Would it be possible to move the typedef in the DECLARE_INTERFACE_CHECKER 
> macro ? 

The typedef will be moved later to a OBJECT_DECLARE_INTERFACE
macro, to follow the same pattern as
DECLARE_INTERFACE_CHECKER/OBJECT_DECLARE_TYPE.

-- 
Eduardo

