Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4750537lfp;
        Tue, 28 Sep 2021 03:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxciYp32pNXuZONEu2skkqdjE9z3uwCE73/CslgHKLAW7P4E/+VT729uqkY+rG2BarwREDa
X-Received: by 2002:a9d:4104:: with SMTP id o4mr4489120ote.251.1632826776648;
        Tue, 28 Sep 2021 03:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826776; cv=none;
        d=google.com; s=arc-20160816;
        b=yfY6gwCrbDpL/jEcUJ/clTop6wVovTWn5ux/8Wqt6F4V1xNcG4JrPZQIs1josxxzHO
         OzW9v0t0uzKAe0bZGstXz5Kvv77f10ZkqzPJd6GDQOVEQwiINeQ6RGbEt2LFUDk6pf8D
         ZBh1xDzEH3AP8rfmWQeFCGSpoiDBZV3K9VH22G4OUKz/fYWQkKJ3w26zAvNyoPeJDbRn
         lRQtbkHivKbvEmYWvaokZdk+ScnTm8Uob0nhraVfRF33p2O+NuPiO24RWXFe0ejhYMIJ
         5PSLJ9a6Pp1s4RFcQwLO2kFoDe7kWWnxF4Ov5IK4D6LadCWikSuA4SZ51jQYeyBWZzhL
         5e/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=H0A3uMwY4dMnszcD5lYTVdEog54v6ibEq/X669ojMtg=;
        b=qdLvWSNRXu/RsYzeSc6HWGBZVGVuqAo92Ex8/lOIuE4eFPsxJ89vw771R3unmszmSr
         1pA1KAed1VfMsOUdukXwKRtt9pljZQ6c6IxTXAyidhJ19rWsR5YRuX6+6gzBS7KTZ0Pg
         hV5cAjQITulwsjl4ECBy/xW4v9q5HIej5eq/ivXuRzwoL/q56Odm/EFRay/ZLXMr8H/u
         b1HeiXaAVnoVGYTXOfLS+vUgV9sPvGNIcTqEiyzPYkidJ/mNhGGliSCLKRXGMii4xlMG
         URyQpA+U7Tok9CBGZYn4sr0kLe7upZX22oMCf/A2c7RglnhQilDH8mN3O/vnHk/tA9Fu
         /eUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=boF1bodO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb39si753788oib.235.2021.09.28.03.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=boF1bodO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVApj-0003aO-S6
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAot-0001WO-SP
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVAoq-0008K9-Ea
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0A3uMwY4dMnszcD5lYTVdEog54v6ibEq/X669ojMtg=;
 b=boF1bodOe2XQZvSNzqKJGBP/yUgXLH0fby27DUJW5wpJn6ddmxVioeJ9SCATjHDLv0iOgC
 DzGvXZJ1mMK1pP/mCCqEwoLfzUW/qEk93yDT5mldD6hNte3PCluyFLNcY6cLVm4oBr7xLG
 LXATOXcmnV6Lyp206mgWJJdCdo6uskM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-IZHjYDNEP92r2gpkZkHNXw-1; Tue, 28 Sep 2021 06:58:38 -0400
X-MC-Unique: IZHjYDNEP92r2gpkZkHNXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 723FF362FA;
 Tue, 28 Sep 2021 10:58:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E9413AC8;
 Tue, 28 Sep 2021 10:58:28 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:58:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
Message-ID: <YVL1UuCQ6+KiPwfR@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
 <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oSehpV+i4mdW

On Tue, Sep 28, 2021 at 12:57:21PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/28/21 05:57, Yanan Wang wrote:
> > Currently the only difference between smp_parse and pc_smp_parse
> > is the support of dies parameter and the related error reporting.
> > With some arch compat variables like "bool dies_supported", we can
> > make smp_parse generic enough for all arches and the PC specific
> > one can be removed.
> > 
> > Making smp_parse() generic enough can reduce code duplication and
> > ease the code maintenance, and also allows extending the topology
> > with more arch specific members (e.g., clusters) in the future.
> > 
> > Suggested-by: Andrew Jones <drjones@redhat.com>
> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
> >  hw/i386/pc.c        | 84 +----------------------------------------
> >  include/hw/boards.h |  9 +++++
> >  3 files changed, 81 insertions(+), 103 deletions(-)
> 
> > +/*
> > + * smp_parse - Generic function used to parse the given SMP configuration
> > + *
> > + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
> > + * automatically computed based on the provided ones.
> > + *
> > + * In the calculation of omitted sockets/cores/threads: we prefer sockets
> > + * over cores over threads before 6.2, while preferring cores over sockets
> > + * over threads since 6.2.
> > + *
> > + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
> > + * maxcpus will be computed from the given parameters and cpus will be set
> > + * equal to maxcpus. When only one of maxcpus and cpus is given then the
> > + * omitted one will be set to its given counterpart's value. Both maxcpus and
> > + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
> > + *
> > + * For compatibility, apart from the parameters that will be computed, newly
> > + * introduced topology members which are likely to be target specific should
> > + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
> > + */
> >  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> 
> Can we have it return a boolean instead?

That's unrelated to this change, so ought to be a separate commit if
done.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

