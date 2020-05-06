Received: by 2002:a05:6214:190c:0:0:0:0 with SMTP id er12csp2082108qvb;
        Wed, 6 May 2020 13:26:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKfvAEse1xr7NPQoZ2zaya6Fk1XhZaxGLMYjJiysFPyCNbOFBc19tNH4rsOchg4ZQGZOJlc
X-Received: by 2002:a17:906:3b8b:: with SMTP id u11mr9184612ejf.352.1588796759924;
        Wed, 06 May 2020 13:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588796759; cv=none;
        d=google.com; s=arc-20160816;
        b=XHW7SOG2oMb9VZEPsVuJ+hl3BjmsZz2ckNjER62UtdrF+rH7Bcm4CSBbwx1BURXP9p
         mhdnCNdJHpFf1DswIN6HxSz9Hn7x3prUgXHbQnKHqyI49P0uQByWxvec8MzqREirrUox
         DH+RAKVyCmmwLcMP11lnBC8jVR3tgHapwyqMTCxRMBkhcH5R4t2PGH2/dp96y0veOxZf
         qxcCAJyG7RHV5cmDywpdSvOEgi2V0lWbRwh6byt5z0+nqPWn+xUlGnXDZxTanFbu2ph4
         EW53d+zy9MHG3dbPPUGJqYm4FcRh5ZXQ2QBVCxe1c02gExC8qNIZswaPEUhPBATL+ijZ
         Z7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=edUuwFI9D0pStLV5uuIILbcmJQZgHW0O1swcyaE3mzo=;
        b=F9L05d8SXy8jUCr5csfqQpevHvNM8xcjoIqpgpDdWN4dWIG3NC+3hQ510JBshI2SGq
         EkO5tzWW0hhhLd6HqE+wfHBx/qFfgwJiykqEKyqsp7GqvzavqDMGwl1U/w+SIFHXyN6a
         +Or2pGr9rccVwB314o0Gfqo+TVI1uN5ftkwePRPs3IKlKz+ANqr1aepbMCtccxXGYSg3
         DwOGnloCMMJP2t9S7XZsY3QKAYz9OH6CSiBPlr4mGzzHTAJ7QQFMwJNC49J202Cfhly1
         PhSChHgkowkJzL4s1zYnGldJQzZrKEVG0wSedFrlj4x3I7S82lA9iZLWGy1MMYiYHbJS
         0F5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f72QJ9fP;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id j9si1929384edn.415.2020.05.06.13.25.59;
        Wed, 06 May 2020 13:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f72QJ9fP;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgEFUZ6 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 6 May 2020 16:25:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44634 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726627AbgEFUZ6 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 6 May 2020 16:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588796756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=edUuwFI9D0pStLV5uuIILbcmJQZgHW0O1swcyaE3mzo=;
        b=f72QJ9fPdwWSZqujnSIkcpIhlhVTqQlYccqafNr+Vt1hIkxGFUflhYdZikwwxStItcFn92
        0FF5ELsvoAvf0DbgykfST3tR4US+PPwNQ8MI0k5XCisBVEwlquGhNzlcbJLNY5e8k5mhj/
        qnkYWQt563hFXVn3ad+mRVlh5hTTQzw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-51-TcDd7PC2bWNBa7iRCOg-1; Wed, 06 May 2020 16:25:45 -0400
X-MC-Unique: 51-TcDd7PC2bWNBa7iRCOg-1
Received: by mail-wr1-f70.google.com with SMTP id s11so1916870wru.6
        for <kvm@vger.kernel.org>; Wed, 06 May 2020 13:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=edUuwFI9D0pStLV5uuIILbcmJQZgHW0O1swcyaE3mzo=;
        b=k4d6IK0itetvguPpYxHNuRSwqFdIQBvVhGYgfxPKsbGBIu7vbcU8TWbB1RpmOmbR3F
         amz0o0pEmxRYpcWD79AttwbWIz31dHO5H8iYaK8aLzxy2IzbUqoqzSE/MOFtZCb8JjKz
         g/DYJlhYyibvMCSBsO0d5IBEDEG7d7pa8p/mFvAhXo6cRWTUEbBdnCWAD2DW6Jso9i9/
         HgUbV081QDT8ltqvW6XmpBGeVL3aStxUgXvDMxIbFcboSkpRs5v/x0x+JC5elLcRAaEc
         S1Jg8SMeIvKQ2XPzxX60dEQhQzPPWQGo15pzgKIG0FatNMqB4LNVVGfkQUUbKAnuhyG1
         tSSQ==
X-Gm-Message-State: AGi0Pua6EDtwrhAflT3wNxxSfIRo/5Ikj9eFubRtT2wuQ0weOOmAM7pn
        j9wJWn/Mh2Kn+jX08IWrrSoSnj/a1mLih8vb2eEOlycaJHFRHVtujTMipTL7Z1L1x1zdA0QsMWX
        fwTMg2VdEOusq
X-Received: by 2002:adf:cd92:: with SMTP id q18mr11911021wrj.237.1588796744842;
        Wed, 06 May 2020 13:25:44 -0700 (PDT)
X-Received: by 2002:adf:cd92:: with SMTP id q18mr11911002wrj.237.1588796744645;
        Wed, 06 May 2020 13:25:44 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
        by smtp.gmail.com with ESMTPSA id 1sm4679753wmi.0.2020.05.06.13.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 13:25:44 -0700 (PDT)
Date:   Wed, 6 May 2020 16:25:41 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Fam Zheng <fam@euphon.net>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Linuxarm <linuxarm@huawei.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
Message-ID: <20200506162439-mutt-send-email-mst@kernel.org>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <CAFEAcA9oNuDf=bdSSE8mZWrB23+FegD5NeSAmu8dGWhB=adBQg@mail.gmail.com>
 <da3cbdfd-a75d-c87f-3ece-616278aa64d5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da3cbdfd-a75d-c87f-3ece-616278aa64d5@huawei.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mjhBSXZgPFm5

On Wed, May 06, 2020 at 07:42:19PM +0800, gengdongjiu wrote:
> On 2020/4/17 21:32, Peter Maydell wrote:
> > On Fri, 10 Apr 2020 at 12:46, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> >>
> >> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA)
> >> and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed
> >> information of guest, so it is expected that guest can do the recovery. For example, if an
> >> exception happens in a guest user-space application, host does not know which application
> >> encounters errors, only guest knows it.
> >>
> >> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> >> After user space gets the notification, it will record the CPER into guest GHES
> >> buffer and inject an exception or IRQ to guest.
> >>
> >> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> >> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> >> notification type after recording CPER into guest.
> > 
> > Hi. I left a comment on patch 1. The other 3 patches unreviewed
> > are 5, 6 and 8, which are all ACPI core code, so that's for
> > MST, Igor or Shannon to review.
> > 
> > Once those have been reviewed, please ping me if you want this
> > to go via target-arm.next.
> 
> Hi Peter,
>    Igor have reviewed all ACPI core code. whether you can apply this series to target-arm.next? I can make another patches to solve your comments on patch1 and another APCI comment.
> Thanks very much in advance.

Given it all starts with patch 1, it's probably easier to address the
comment and repost.


> > 
> > thanks
> > -- PMM
> > 
> > .
> > 
