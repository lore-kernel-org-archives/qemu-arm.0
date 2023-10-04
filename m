Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2629923ejb;
        Wed, 4 Oct 2023 05:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM54nwKwHviIjAjoaZ8cQdDGm6yzmQo6TjhkPC0TWp0WPw6nGVFgVDdBG++PhmhjEobsst
X-Received: by 2002:ac8:5746:0:b0:418:148e:8306 with SMTP id 6-20020ac85746000000b00418148e8306mr2441558qtx.20.1696424017733;
        Wed, 04 Oct 2023 05:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696424017; cv=none;
        d=google.com; s=arc-20160816;
        b=gllenHFkQfitsI1D2tMuqOvmXTTwkOoFftn3UJJ4xeDlQct3VMdpBY7161z31xVLRI
         8KEOd5emvdS0JQR5Te9ecbdYhfCsnn1xVo3xTS5Q5oHet1ALYUCpzRv9xh4lXc6o2Ep9
         Me6idWubYMF0XLez+K9NnEGJvuCwKfZloOS2XHFycK0CpZV795uki9MduKpsqjGZIUC2
         uaEBDWuyFbeOnM3c0M5Sv/lr3FQPG3C6wyxqK0LIQyhM5GYrZoFD+YP+2bMBC4/TRegf
         jL4+3lzYctcytS0MNesiptC2ig+wt9kT9CB2WQE1Q/LA30uvPYgL6aNVtZaGwTOlhwrm
         KwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2Es/IIpNQpWFsdWkKffxPEHtdOGd5sJ1pCFd4m7foHM=;
        fh=PYaAawjOaUee79TDNAx8hILhh7rv0Ngn2dJc3zHsasE=;
        b=XA4/0DaeKodOTZDOVOzgbFuu4zJdXlkIHA8vBMWxDddXcS8NZOCXBCriZuEzgjrk5r
         O/Yw6rZbAFE1cWSa5YNxDKIz4ZGrJqhJK4qsUiuTwK23umO+z1OgBvozPXwQOh//HJ9R
         U/yl3DDiB5lN9QB+yKXF0CtlUDrvgDECCBMrpA1O3NEUcvIR9LEeldBvrmL6NBW90gba
         c3aSR9YEBDKXIqi5DG+ICKHmLnUKdnPblneMSmxFfk22y+h28zHtdAABvxoc0v5hs9Tz
         B7bXa/gr4x6WJz8qBgQU6LOj/8o8cT7711sgsa/Cq24CM7GQ6YKnalVxY3zNS+tmIiu8
         m81g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UgI9cxDu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020ac87e8f000000b00417979ae590si1448071qtj.539.2023.10.04.05.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 05:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UgI9cxDu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo1MN-0006sy-FW; Wed, 04 Oct 2023 08:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo1Lb-0005rH-8f
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 08:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo1LY-0007Zw-52
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 08:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696423883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Es/IIpNQpWFsdWkKffxPEHtdOGd5sJ1pCFd4m7foHM=;
 b=UgI9cxDuYTF+fNiyFNBo0HCrqXDYWcbORznayjCMl+6E0PA5Zyd1oDYm6NNKokoj9piUi4
 S3abWDJHd/qpPpt29ccCV/g68dWYSSaChX5vMtOFn+LgCxR+jHPBhfPWyafe80+S2Gy+Qd
 AGccUNK36RrQhMtPYImuexfTnBLpzdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-2WdWGS5kPTSKh1koGrSisA-1; Wed, 04 Oct 2023 08:51:05 -0400
X-MC-Unique: 2WdWGS5kPTSKh1koGrSisA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E3B08039C8;
 Wed,  4 Oct 2023 12:51:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0DBF1006B48;
 Wed,  4 Oct 2023 12:51:03 +0000 (UTC)
Date: Wed, 4 Oct 2023 13:51:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Message-ID: <ZR1ftQm2wwsdJU0+@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7HFp+n32A1hd

On Wed, Oct 04, 2023 at 02:37:14PM +0200, Thomas Huth wrote:
> On 04/10/2023 14.33, Daniel P. Berrangé wrote:
> > On Wed, Oct 04, 2023 at 11:06:15AM +0200, Philippe Mathieu-Daudé wrote:
> > > This series finishes the cleanup which remove the confusion
> > > of using 'softmmu' when we really mean 'system emulation',
> > > as opposition to 'user emulation'.
> > 
> > Am I mis-understanding what you mean by 'finishes' here, as
> > I see many references to softmmu remaining
> > 
> >    $ git grep softmmu | wc -l
> >    270
> > 
> > In particular under configs/
> > 
> > I was also hoping it meant that we'd be changing configure
> > to allow
> > 
> >      configure --target-list=x86_64-system
> > 
> > though the lazy side of me would like
> > 
> >      configure --target-list=x86_64-vm
> > 
> > for less typing
> 
> Maybe we should also bikeshed about the naming first... "system" is a quite
> overloaded word in this context already, and "vm" sounds rather like
> hardware-accelerated stuff ... what about using something like "sysemu"? Or
> "fullsys" for "full system emulation" (in contrast to "user space"-only
> emulation)?

Simply 'machine' feels like an option, to avoid suggesting a bias towards
either virtualization or emulation.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

