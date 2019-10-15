Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5594396wrm;
        Tue, 15 Oct 2019 04:00:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCxVKDpQw4elj+VzBKHVYOrurUasdkJyZ7i1nMrziVI/fxrLNyusFaI4gKU9uJ++U+4tNR
X-Received: by 2002:aa7:d4d9:: with SMTP id t25mr33013071edr.76.1571137202115;
        Tue, 15 Oct 2019 04:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571137202; cv=none;
        d=google.com; s=arc-20160816;
        b=piRE4C89OD50A9H3aoCkVgQAEjMM9EmJH/zwc3tcPNUtM02ySCHGN1dsPd8i74e4f/
         H1Ew4df3NZ8vcfekIRSsVpHQfX3/s7e0BGUwYqcGnnhqd9aWN4FoNNjQZgY+4cyssOc3
         P/9EMaYBBZkt4zFbzdR8O+od/Anx2BQJOEXbYQRYHB8easLVAHfVmNEKQequqw65m7VE
         lN1RmtgS+poHBbbW/7Qflc7Ib0SbXcNeGabpNL7/WL6R4aGC+HSD3aNCeUPSPnCPOmZa
         h/0riujGgT7sSPIEoJHqiVUVaJA1CLercoJy06eKTPm9+kfcvnhp1b5IZef6IyF1aqAE
         VVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=hYKgRKSKCwkepisISQS0LSUr/EfWMgxd6VxtSJoJ7/8=;
        b=Mst18EGhp1nQXUoO03nAG1b4BLj8CdlbXsCKhM6KdInuu2qTsETEu0ENJNcIQCCUOg
         XsDeAA/Bjqk8Q8PQL+/sDajL/4xVPScVdrAsfGoF6choLhSrAFSRVw4Dl3TRD/1Izjnp
         Ah4+ALrfZTCxjNyZmSk1CyalGOtau+0de08Qgo1+TMag3Xy8L7eKtatcdDDGbgrwvG3F
         3OqPOJjkFHyj+UWvdBEkbds7n6KC+tXcbcQmITLoRkr+LlH1x03KcDKvop3eaNSaG2wP
         FprEzM3t1p10TEbHjkesNt0UrD4XjVpXT2KPMD1Rl9AdqqSV7UwEwLJDlPTrHqcFJlLp
         PjLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si12969928ejs.439.2019.10.15.04.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 04:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKKYb-0005qo-4I
	for alex.bennee@linaro.org; Tue, 15 Oct 2019 07:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKKVM-0001wI-5V
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 06:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKKVL-0008Kd-6V
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 06:56:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60530)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKKVK-0008Hl-VA; Tue, 15 Oct 2019 06:56:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1795307BCC5;
 Tue, 15 Oct 2019 10:56:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5FE6194B6;
 Tue, 15 Oct 2019 10:56:30 +0000 (UTC)
Date: Tue, 15 Oct 2019 12:56:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20191015105628.7ln6ph5s3vpsyfuw@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
 <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 15 Oct 2019 10:56:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 armbru@redhat.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O86bMk8LOr/g

On Tue, Oct 15, 2019 at 10:59:16AM +0100, Beata Michalska wrote:
> On Tue, 1 Oct 2019 at 14:04, Andrew Jones <drjones@redhat.com> wrote:
> > +
> > +    obj = object_new(object_class_get_name(oc));
> > +
> > +    if (qdict_in) {
> > +        Visitor *visitor;
> > +        Error *err = NULL;
> > +
> > +        visitor = qobject_input_visitor_new(model->props);
> > +        visit_start_struct(visitor, NULL, NULL, 0, &err);
> > +        if (err) {
> > +            object_unref(obj);
> 
> Shouldn't we free the 'visitor' here as well ?

Yes. Good catch. So we also need to fix
target/s390x/cpu_models.c:cpu_model_from_info(), which has the same
construction (the construction from which I derived this)

> 
> > +            error_propagate(errp, err);
> > +            return NULL;
> > +        }
> > +

What about the rest of the patch? With that fixed for v6 can I
add your r-b?

Thanks,
drew
