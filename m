Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1287539lfc;
        Fri, 28 Aug 2020 02:10:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycI76MZ8mkOGoRRL8E1hCfB/4PR3Fqgp3Dkjgko6wtgVe+VMX3eLq7NVAh+dwLk1Qw/KFc
X-Received: by 2002:a25:850a:: with SMTP id w10mr1036477ybk.219.1598605807165;
        Fri, 28 Aug 2020 02:10:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598605807; cv=none;
        d=google.com; s=arc-20160816;
        b=harkX8r0/yw7j81mpvA+kDydYoQyJ/D26IcEeDH04K30XB2JuxE10p+nmmoQFsKGcq
         /78mBEH1ci0GTvpRjZZur+LaYUlnlctbAqTweLsKaPKQZfD2yHu8q0RB7iAEjVQYXFdq
         OmB6q14/ACi737raUNeI1DbSZXuEBevrRI6f91cCou0fk+uMNlgZ8bJxqg0EW2rvBzhz
         P4sCpuleWiRrbf+6aLqUqarMZt/4q0RHMXOJqU+p31E/HrB2RzfM0IFVfrV9j09DuIEZ
         ZW7j7+qShOG0jYHiOxdIbrLP4eHdQZpp1pzcQwuIF3Vgpi9ocwPnld7MJkgPnK6sQyYf
         2ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=quwABx0Fo6f1jKo3zGWrVxb+C7c3VPi5/w0oHKS2yNc=;
        b=yyQgzQlkkt9Jc/ya5pTTSMOVGFc4PlOc99S0wTtQPp1LtTjS/kVaBb3yahYXPqv+2n
         9ng/qxrgxrrcr2eBP1ZMkIsZuY7WdB6Fgg/PjeWrVgtRlj3wkpA/NfC0E16qeowBszPN
         dtfDCX2ubJsH2aPR4SZrtgdB3nRxCaE7eJiXmJ9P93oFnD/gNX2wuuob4tmpAPkuhLH3
         Zt5iXLEgTVft0w0k4t78F5T+zIC7GG5vYbBdG4LA2AeJNssMwp0MCUmWIJ6mOQzWra52
         KTjBHAk/mMHvt1mGtkE9MYb2W8rLmx4n4hAjTPv8pYUcFjP3puunvgwxMuZ6MJBOWprB
         0DHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KW95Z3oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si404532ybq.381.2020.08.28.02.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 02:10:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KW95Z3oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBaOc-0005nV-HK
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 05:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kBaOU-0005n0-Se
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 05:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kBaOR-0002Ow-Pg
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 05:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598605794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quwABx0Fo6f1jKo3zGWrVxb+C7c3VPi5/w0oHKS2yNc=;
 b=KW95Z3oYUCl3RQHtMiCag+V2sJfabLKqvUHRwRxrdd/9h6iYsV6kXilMymrn9q7QGEsGrq
 PlLX3TfrYEIcPcP7IsQPFeqDmPpo0A/iOJmJ9WCkdwlQddNSH+dv/IFVX6+d+wX4EVCRDK
 /eF0X/VLrFkZVVnXP1yqLcDGQCfSt/A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-P20Ef4_9O2uYFCGpgtAJpw-1; Fri, 28 Aug 2020 05:09:52 -0400
X-MC-Unique: P20Ef4_9O2uYFCGpgtAJpw-1
Received: by mail-wr1-f70.google.com with SMTP id i10so207830wrq.5
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 02:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J5v3Ti6swFBgpT18Yym5OHIK3PkjljTxnSeQWNfDM6Q=;
 b=EmfP5qHCt+JxqJzovzDWKa1kRxPDLNyLqujuFQlxNxBKG0M16euGFhuSie6l5fHRFF
 J4urkKSJqIE1DeZqZJFLnKLxC+1uHeDbNrfBkelG7qIQ8CbaV0eiVlUoQuOozbidpwic
 wKy6ffkUzrC9/rTL7c8h4xBS8cST9YzMH6wawMW6nQBALc5nDCBPfRV3tPcjMQ98Mnjn
 g2oyLzxF1iLbJY3yiSGy9jh54+YV6EpWs9uoh1VpFvSRMyYT+mPyD9hKn4cTnWrHmIB4
 tNXaXxp8nuCVx8dRrHBg0yQeRPGiO/7TPIiGq218LA8p7ENvvSW1b80B/XgjnFATXM/S
 ALZg==
X-Gm-Message-State: AOAM530LqE5rhMvD9wyou0agPuX173bW0Sn+l9KjUI01n0wz4f7MjVZ1
 0EA/ZlL7Ta3NHo3o25xFP4pIRI8koJyZzVq+p2REMmFyvEb336kLE6AaU6OhcFRw4sGepuHKPQl
 P50tPhiD7F1t3
X-Received: by 2002:a5d:544a:: with SMTP id w10mr558623wrv.317.1598605791506; 
 Fri, 28 Aug 2020 02:09:51 -0700 (PDT)
X-Received: by 2002:a5d:544a:: with SMTP id w10mr558588wrv.317.1598605791160; 
 Fri, 28 Aug 2020 02:09:51 -0700 (PDT)
Received: from steredhat ([5.170.38.42])
 by smtp.gmail.com with ESMTPSA id y16sm842548wrr.83.2020.08.28.02.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 02:09:50 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:09:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
Message-ID: <20200828090947.k7enk535sce64h4h@steredhat>
References: <20200822180950.1343963-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200822180950.1343963-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 02:09:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, Zhang Chen <chen.zhang@intel.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22seybNqDPsd

On Sat, Aug 22, 2020 at 08:09:48PM +0200, Philippe Mathieu-Daudé wrote:
> - Pass const void* buffer
> - Reorder arguments
> 
> Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   util/hexdump: Convert to take a void pointer argument
>   util/hexdump: Reorder qemu_hexdump() arguments
> 
>  include/qemu-common.h    |  3 ++-
>  hw/dma/xlnx_dpdma.c      |  2 +-
>  hw/net/fsl_etsec/etsec.c |  2 +-
>  hw/net/fsl_etsec/rings.c |  2 +-
>  hw/sd/sd.c               |  2 +-
>  hw/usb/redirect.c        |  2 +-
>  net/colo-compare.c       | 24 ++++++++++++------------
>  net/net.c                |  2 +-
>  util/hexdump.c           |  4 +++-
>  util/iov.c               |  2 +-
>  10 files changed, 24 insertions(+), 21 deletions(-)
> 
> -- 
> 2.26.2
> 
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

