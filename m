Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1141053lfp;
        Thu, 7 Oct 2021 01:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyneRE6Pm5TqZSGtydw+P4diMgjGVcZovOstznov9a+RmZtJmxq8tMt5xP9Ojh3ckuYRsFH
X-Received: by 2002:a37:9b43:: with SMTP id d64mr2283678qke.111.1633594574616;
        Thu, 07 Oct 2021 01:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633594574; cv=none;
        d=google.com; s=arc-20160816;
        b=xYhtOF3MuOxqDwS35AVnFXnCN2xA87PBlwwtp0FAOY2ZhI+1ddfjODNpwW/A3fHKwP
         1O6aW7W5IvR+p+Uw9phx4/yfKt8heOkLuDPanrPLAw4wcSJo6I9zVw6cmrhSsZmJQQZI
         uW8c+UEXt3bXywXGFokAlvm1Vpg6uB8eQTbXVp3B4wk6Bga9pMF0BuHwaXypmJpXWRaJ
         G/dCvx/hrBdos0JAXoNmQfv7TPPXfiuHpbKUlc7xIZ7bAHM6JTU+8u4+lC5bbAk2Ao2Q
         GstEyloRUOMqR3A6Pj8qaxaagASrM+oShaUQnS7k1oxIvP1UTmVmel9Irt5ByJBzqWXM
         hdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=DxAK0yUVKIgbMKdHtp5pztcrNSv2WtNDIOBUjJJ0tr4=;
        b=muWmiCHwz7uJnfTXKQMzkYqNl1DKl/PNcPVTXS8kGAjK/MD8SpfMj91IlSe1V3ccyO
         ltGSgcSMMBdwJoX1RphzxyljdONmImuiHuoUg2+y1R8lf1YYk0mvVbc+pJI3rQi7M2BD
         hGlAMaNV/dD+Je+PU4ZHfpXjM5W2qn6xvlhczmZwtfpeLmUSA/iveLBDgeajRgvLd0Aj
         j37RfhLM3ugDu1+oJWkBZAMyKfXfwPBU8qXrv53wKPMBUQauSHqNQc7QNvBbBFWfp1FW
         aRYNMlLSljesuci68GLNiSZ4e4IXriwCl4N9BzNHfGy/UXS7MUHRYkuWoqXZAMk9TxFg
         CB/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PGFSXS+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si1494263qvs.191.2021.10.07.01.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 01:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PGFSXS+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYOZa-0007zZ-0C
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 04:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYOZ5-0007zJ-Km
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 04:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYOZ2-00033W-Uu
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 04:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633594540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DxAK0yUVKIgbMKdHtp5pztcrNSv2WtNDIOBUjJJ0tr4=;
 b=PGFSXS+HsNqFMkWeKMJZr1CM6R6e8LWma30sdfFYKN8RU+gSZif0qHJJEMwlAROZ1sxLbF
 NWWRBJTH2kJXnWZtOVblmJZFEL3tYrmVuFJvpI6XoYsuAGptZS8iU2Kn2muJOcnQkvm7E3
 77zVPoD5qynyD8QdA2lfzvQEluZGmpM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-866VvrD5NB6a2942YXkJAw-1; Thu, 07 Oct 2021 04:15:38 -0400
X-MC-Unique: 866VvrD5NB6a2942YXkJAw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so5221328edj.0
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 01:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DxAK0yUVKIgbMKdHtp5pztcrNSv2WtNDIOBUjJJ0tr4=;
 b=e9HEP3TRCzsZGO8hx+fkmknbRqgyp7P5UsE4NGSj4t7u2+Bb/RPEvQTh75lIAe/no3
 gdSpcD4cW1xYpS6UQvUdgslz1dCq4aPgwoaY6yC5ITq+eH8Hj9dgG7+mWDSuMBpgYS79
 Mkkk2twwH9dfTguFFhDw89F7OAsor7n9rVI35FEDR8AnwqrDNsLX82F1H5Cg5Cvt9OI0
 7oS4DbXGSQY4z0MwE44Mme0KLXzjMdsgrIbps/UW+6adYsIZhoRRq+MQ3IILlbYv9NOt
 8I9245K0HK2u909L8QqGDyzGX7Ly6YKzLcUYWLF3+m44qgsDAIVIKCriWeemRxiZoHJb
 RzOA==
X-Gm-Message-State: AOAM530cSKg/mMGGqF8AxR+Gv2QUhnGyw3AGBdfhwo3oO+Pp3tReAX/F
 j83+ow0OvMIrF2mAP+W9WF5bdQ+GvulinI5QVZligGLPiGgsPoSlqzJ4BYmb+N3Rtm8m/tjMoDr
 qKygx3WKZBoYc
X-Received: by 2002:a17:907:7790:: with SMTP id
 ky16mr4030291ejc.490.1633594537417; 
 Thu, 07 Oct 2021 01:15:37 -0700 (PDT)
X-Received: by 2002:a17:907:7790:: with SMTP id
 ky16mr4030271ejc.490.1633594537261; 
 Thu, 07 Oct 2021 01:15:37 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id p22sm9793303ejl.90.2021.10.07.01.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 01:15:36 -0700 (PDT)
Date: Thu, 7 Oct 2021 10:15:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211007081535.izszbazepu7yp67c@gator.home>
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211007072922.655330-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksz8L5mfLcls

On Thu, Oct 07, 2021 at 09:29:21AM +0200, Eric Auger wrote:
> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
> 
> The DBG2 table allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at
> "Microsoft Debug Port Table 2 (DBG2)"
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - Change the revision in the header (0), + vs comments,
>   s/0x1000/vms->memmap[VIRT_UART].size
> - Added Michael's A-b
> 
> v2 -> v3:
> Took into account all comments from Igor on v2:
> mostly style adjustment, revision references
> 
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 63 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

