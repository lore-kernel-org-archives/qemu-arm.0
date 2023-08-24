Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp753497ejc;
        Thu, 24 Aug 2023 07:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+GnfncoBV7tIj2tdZp8SNIbX7HL1Zi8mXtwK/oiq9zSfJ0drYbbT86DBDeVHhTc/2vLNo
X-Received: by 2002:a05:6102:282b:b0:447:5ed3:cb21 with SMTP id ba11-20020a056102282b00b004475ed3cb21mr12987115vsb.28.1692888599178;
        Thu, 24 Aug 2023 07:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692888599; cv=none;
        d=google.com; s=arc-20160816;
        b=ZK+/yf45HALOQfywP5MBCpDM2xk0CvtMt3KIr3d1rZVNjGaCbKKORjSwr7GcxRjp7b
         ClrDvSbg1Hm2Fl8e23fRme3emslpBYERulGEpcov8kI3HPXGfuPOc0hmRpWItK+SnkFD
         pYiKKe7daLuUqF2f1BQsYooMdBLX2dH7BdxilHnB6sfkRk0ICrSoYu9WGz9109vMt9YD
         nMZECu34OBynDzh/xit2s6ra6WKnUYW5hroys3TDHOx3Yj2gWqH9T83XEDwoZUDiMft9
         hQ9OX3N9b87x+F7XY3aFF4eg2aqhUD8hNE2KuBullC4hDvBuETCpDYYTEtcjUtjdbRru
         OVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=67yDQtT1vqvJknJyj4xvkLBx/OrUEw9CUNo7nHn5wXA=;
        fh=ZPKFCeWs7cuG2Kf/P1fX69yK9ViqsMo8HYiat32g8c0=;
        b=IoVQvnoQCxex9AOXoS89TKLBe5uvbHa2oyWkLGmFD/DOZ7U7wTPDAbCnnsU/Vqb2wG
         3RDrQhx+4VpCGVomMzLgjDgPM5zInh282Zyu8lOcgltRK8Wik48hnTynXPOO7l2XSkqF
         3nLWbzxVUYS8O7Kd/eILNTgc1RwhN3IXY1XvHxfqVm4K3lIQXMvOgBxGQoadKyAmkvEq
         lJJ7E6T0EEj/VaBojN1MBTdkeEzEGgU6ZrikTpS/1vsaonWNs3QI2lzgVdamuOO/trRX
         uzaF0FSbQVb2NwsDGzgN+5Fgj1QpWUYJzbsFsU2p7tUh6wpAaY2uoSpIwPSnYMQD9uWd
         C7IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3Uk2+2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020a0cf092000000b0063d315cf72csi8561694qvk.187.2023.08.24.07.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3Uk2+2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBeO-000491-SA; Thu, 24 Aug 2023 10:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1qZBeM-00047r-VD
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1qZBeJ-00044V-GV
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692888566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=67yDQtT1vqvJknJyj4xvkLBx/OrUEw9CUNo7nHn5wXA=;
 b=X3Uk2+2tbisG9sIMNC99vqFj1QNkLPiH0+yzaUPDCDud5owL4P4cVKOsHnCjs3ZVYi5nrr
 /RLBX39KRP08lQMwqZuInGnGTBngivinzubYnIS8jhO/BJnyhUJPphpbEvMm+ighOXV79O
 oAd/6bZSQun/cBJF/pDIFsYJki7tIvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-N8UOvDLUMLGDAq6WrT53KQ-1; Thu, 24 Aug 2023 10:49:23 -0400
X-MC-Unique: N8UOvDLUMLGDAq6WrT53KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6C858D40AA;
 Thu, 24 Aug 2023 14:49:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3353640D283A;
 Thu, 24 Aug 2023 14:49:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3FD518003AB; Thu, 24 Aug 2023 16:49:20 +0200 (CEST)
Date: Thu, 24 Aug 2023 16:49:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 05/12] hw/virtio: Add support for apple virtio-blk
Message-ID: <p37kgk5ictxyl453vqm6whbdsavr3ji4mww7r3vf33pd3kpjzc@5xnzyyn53whs>
References: <20230614224038.86148-1-graf>
 <20230614225626.97734-1-graf@amazon.com>
 <ZIxMIyi1KY7Ku9Xm@redhat.com>
 <3c29312a-9d5a-4f05-8123-1591de6e7207@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c29312a-9d5a-4f05-8123-1591de6e7207@amazon.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FN9/d7VgryWm

On Thu, Aug 24, 2023 at 04:30:48PM +0200, Alexander Graf wrote:

> The best thing I could come up with was the QEMU internal qom property
> x-apple-type. Happy to split them: Make the change of virtio-blk behavior
> depend on the property and make all of the PCI device/vendor swapping depend
> on a new class which then sets the x-apple-type.

Basically this, but there is no need to actually expose it as property,
the xhci emulation does something simliar for nec-specific commands
which work for '-device nec-usb-xhci' only.

Use 'git grep nec_quirks' to find the places in qemu code.

HTH,
  Gerd

