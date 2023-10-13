Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1342623ejc;
        Fri, 13 Oct 2023 01:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEvYX1QICT0o/7x3xNmtmTwkYL+JXowR3EHXilFDAq2r9dq+yvS0GswtyBtbgVCdBNvyVc
X-Received: by 2002:a05:620a:280c:b0:775:93aa:cb91 with SMTP id f12-20020a05620a280c00b0077593aacb91mr31072595qkp.35.1697185069472;
        Fri, 13 Oct 2023 01:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185069; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8GZdCC9hzxnoRVI6VIkUOz+GMG3HjWvU6atFChslBaQFRU14PneYx2S5+42ogtjV/
         8i+BNNZc6ysVaksLpTYVZH+wx0hOtciMdBtbevNYEz0epIsbbvBEkZyrJcrQERefigpd
         T1bzGFIEX6JtO6ArFmzhJjZClnnK37JaB74wPMEvFvHEHDVVG9yIPyzmexjV0P5m7XpY
         Y8kVlnlnT71na5WEkNTBe4rvTb9l46yXijIyYXslCeHFJhrQeLgLnhHTkk1Ul1dVJAcO
         Zqw4mfDqHvH540+kM4MSrHOIXmqtaNJ431FJq28bCaMhIgO2eX5i/pAQast8rqiW3gCD
         b65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=OTz4YcvKi7RNO8RPmuWUQhmqcPnO1LCdIky5mZshLjM=;
        fh=WqFkrZKGvMj0jGEvOALcjVPt/SUTOjrHROxU/nT+zJg=;
        b=ScxPIY1de9goJkYWqIGNkdzN4+lbVmcoiO/HxZPWUhGSWOVasqQbooJFzUDdch4vuw
         axAnoTEirNCE5A37734vFDXdV5sCz1l+Edw6xxd18i8y7NzVHd9APuXjBR0A4AjM5Sum
         9bXm8r5RpWCh2RAJ6c8GeY53uWQF6MTVO+E9mybmiTc9dwEU1zY+Kkd4a25G9kxITP9z
         Lmvp5Oz8kMyveu2+PDxHOflD9r1QG8xKLRdKODu7+heCJ18KHs2vWIOdBdUmYZh7rx44
         yOYYnWmxOV52M2ncUnbavahhzjsTlaSwMBnINGr+C5RN3adgWYY8z650LSmuS+T5oeck
         ex/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CRSxfzSY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a05620a0f1400b0077592d4c5afsi879103qkl.767.2023.10.13.01.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CRSxfzSY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrDJg-0001HA-IA; Fri, 13 Oct 2023 04:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qrDJe-00019g-4y
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 04:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qrDJb-0002WG-Td
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 04:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697184874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OTz4YcvKi7RNO8RPmuWUQhmqcPnO1LCdIky5mZshLjM=;
 b=CRSxfzSYKNMxivsIlk4bSKmsgRh+IwEl+IXZM2wTQDu9jZXpkpuEMucYyegIUUvX+mnoVX
 dfcLkPLTotOZfz5LGExnuL6czYyc/4mo8mph/p2DydhNLZBxgpn/PneSUMq/GIY8NFgO5S
 QsKjD92XTKIanWh2SI9uH47lo8dyysQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-PtxaffWHMYWCx3tedKqs1Q-1; Fri, 13 Oct 2023 04:14:27 -0400
X-MC-Unique: PtxaffWHMYWCx3tedKqs1Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9151A1029F41;
 Fri, 13 Oct 2023 08:14:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C834060EA;
 Fri, 13 Oct 2023 08:14:26 +0000 (UTC)
Date: Fri, 13 Oct 2023 09:14:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org
Subject: Re: [RFC PATCH 00/78] Strict disable implicit fallthrough
Message-ID: <ZSj8YEc0ARdUqFLG@redhat.com>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iA/D/wGxtAG0

On Fri, Oct 13, 2023 at 10:47:04AM +0300, Emmanouil Pitsidianakis wrote:
> 
> Main questions this RFC poses
> =============================
> 
> - Is this change desirable and net-positive.

Yes, IMHO it is worth standardizing on use of the attribute. The allowed
use of comments was a nice thing by the compiler for coping with pre-existing
code, but using the attribute is best long term for a consistent style.

> - Should the `fallthrough;` pseudo-keyword be defined like in the Linux
>   kernel, or use glib's G_GNUC_FALLTHROUGH, or keep the already existing
>   QEMU_FALLTHROUGH macro.

As a general rule, if glib provides functionality we aim o use that
and not reinvent the wheel. IOW, we should just use G_GNUC_FALLTHROUGH.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

