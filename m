Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp524261lfy;
        Fri, 21 Aug 2020 11:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO5melG3VwwSse9M5Cl/6uuE4VjmMF7auSVqB4mznYSDmIFK4juAfB54fYPZvV7JCKuuqQ
X-Received: by 2002:a25:6e54:: with SMTP id j81mr5154812ybc.194.1598034115172;
        Fri, 21 Aug 2020 11:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598034115; cv=none;
        d=google.com; s=arc-20160816;
        b=TCXTe70C+3//VdY9Aku+U4CjcrzOOAah89LFcZDp6y7RfhSOkmQpa5M7ogJVV/eiAJ
         Pt9WeUD4YaryuelGh32cdiK+DsD28Sg8GuKdm0PZ8PWlYicRiehse0VcugHzgxH6R3T7
         ov7I+iScmY0YNNrALUfk535yhjjqJ18iFg9u436IctN6gLLSvHCP/CpFu1jNpGAjZMj6
         6H/0xIv9hJlQKxA44kuhM/H3PzIQ3b6petodL1XY/snOxvmBxjOrwPBPuJoUqhtSK9d9
         BpjypX12xFJ7FyKSOzDbbsB8yB1ranxj9RNoJ7EXH8kQ1UhdXqdarPuT3JuW5JAPkd82
         +rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=9iVBIrZhGuf8FWz07+EXr1m8HzsRSNy3xHKgbUJLIBU=;
        b=y3Qg3mXiHg7gV9QhDrYqOaVgzdwXDmizz5ZMFnT8wVodVpI81HSXZsPOlPpUF1RT//
         FatEbw7yXheuTjUVnLrtHrFeYS/sAXdahpHvCdQcMWU9ma8K8MTbWYpXSjZM93dq0Z8B
         /IsGZFkFgS8zQbW8x++Qvgd1uNMwG4kd5jp/eVF2yLolj2RfOIxr6AxdecTfw5j7FZ67
         yjsy/zNFmp+EvzofGQUAZDcxtuiKKTzydStrhG13r5qZx2J11Cte1pSJvpKdYbroWpe7
         KUB8Ll2QJEzaQA/ls0CCn7Yr7Uyi8SBJHtWCRJkO1UWsdAflamlEBXfpU9wZK0CcSKWX
         BcUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E8lssSi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a200si2539511ybg.184.2020.08.21.11.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 11:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E8lssSi0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Bfm-0003OM-Gr
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 14:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9Bfd-0003Ll-Fu
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 14:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9Bfb-0008SG-RA
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 14:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598034103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9iVBIrZhGuf8FWz07+EXr1m8HzsRSNy3xHKgbUJLIBU=;
 b=E8lssSi0f+EFuJMK8/8aRVlR5UQRIvEfTKXc52WRhaOcUbddaXoncW/L4W3ysmZd3DlF8y
 8CnqLV6VfeXRSi5pHz3rTfSbAha89C0zMjhefF0Es2s/XS3ei8IEHubA0/PyUogXBtPhp7
 MOiBeqYrHquJauZOhrHhZIhIThmCLdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-4ahjCOWpN42VoolToMIG-w-1; Fri, 21 Aug 2020 14:21:39 -0400
X-MC-Unique: 4ahjCOWpN42VoolToMIG-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D71C281CAFD;
 Fri, 21 Aug 2020 18:21:36 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB2C65C1D0;
 Fri, 21 Aug 2020 18:21:27 +0000 (UTC)
Date: Fri, 21 Aug 2020 14:21:27 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Suspicious QOM types without instance/class size
Message-ID: <20200821182127.GM642093@habkost.net>
References: <20200820215529.GH642093@habkost.net>
 <b60d899c-228f-5b75-ba16-beecb90b8b08@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b60d899c-228f-5b75-ba16-beecb90b8b08@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 02:43:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xkHOAlRPRNH6

On Fri, Aug 21, 2020 at 11:40:12AM +0200, David Hildenbrand wrote:
> On 20.08.20 23:55, Eduardo Habkost wrote:
> > While trying to convert TypeInfo declarations to the new
> > OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
> > where instance_size or class_size is not set, despite having type
> > checker macros that use a specific type.
> > 
> > The ones with "WARNING" are abstract types (maybe not serious if
> > subclasses set the appropriate sizes).  The ones with "ERROR"
> > don't seem to be abstract types.
[...]
> > ERROR: hw/s390x/virtio-ccw.c:1237:1: class_size should be set to sizeof(VirtioCcwBusClass)?
> 
> The parent of TYPE_VIRTIO_CCW_BUS is TYPE_VIRTIO_BUS.
> 
> typedef struct VirtioBusClass VirtioCcwBusClass;
> 
> So I guess the sizes match? Anyhow, setting doesn't hurt.

Thanks for checking.  Yeah, the sizes match today.

It's a good idea to set it, just in case a real VirtioCcwBusClass
struct gets created one day.

-- 
Eduardo

