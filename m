Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6242736lff;
        Tue, 10 Dec 2019 11:14:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYQ/f8o28EPt0EYA0iHYBQ1vPxPYRV4QurtqfiphDesCUw6ClskWxtgxD/Plzzf34pcT1r
X-Received: by 2002:a9d:6183:: with SMTP id g3mr20835939otk.304.1576005286382;
        Tue, 10 Dec 2019 11:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576005286; cv=none;
        d=google.com; s=arc-20160816;
        b=KavSNKhvwKMkf5ZauZyRUOBIFFlN11rZK5zHsD3U4dz5m79+c4tzqEKmFQQKVUKD3w
         J/yCjn4uAv6o8+MiYJdjDxKCL9pPXbB4ZRtNLeYwuIxJOAcUIDsNtQPIe/NeqbIc0Fvg
         PKDk6W2eWXX+c8NiyfSIPITSM3yfcUjZJHYSTwSJ+oT0CYhdejSZMIXXgs6ZIhuHBuzT
         W3VdSpQII2bDaQqwsY7FQYZg8PIBI0shbH72R8QTVwmX/zP6mqltxG87umxkRtFInlmx
         7ULDFNveL94SgxWNiw6YKxD70kmejv+L6H/gmOiYFpTo30HEACmrVdcSqgjKoo+qQ5qa
         PoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=QYz/6hrb7cqbBbeqZPE4uGuRtTwhiU/auYfMMLJF+NI=;
        b=Pf0td0xl3GmG6jNaX6kAxgjqqWEZA8iBWJIg9CxDWr5RcfHRUn/fNYdGdda5DdFHYC
         ww2UCCdEkxuGb6XdZHVvOalmyH0taBdj89fkrLS+f7nC48USSjajDCNktWWZ7tLuiPZH
         mgBTLtZN2bwHOiNiGkouFZgca62GHCGoVOUWCNzSMdIZl+7BFh+ESFQCkXqafDNcWs7h
         /6gau3/xrx8Pmnk+xJ+LzPG2S7agh9RURPGyR/JvMMVGDQXmcD3hd+JqxW/2TbfO9gI8
         4YMU0nKPnMFjtl+AabJQbTYluBxByKVWTWrCrpT0ISwafTIz1DyA1AWE7e/czhTkWWNh
         0dLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HQGknXgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b133si2437192oif.244.2019.12.10.11.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 11:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HQGknXgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieky5-00045J-Fc
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 14:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iekxs-000438-FE
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:14:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iekxp-0007ip-SF
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:14:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34120
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iekxp-0007go-Ox
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576005267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYz/6hrb7cqbBbeqZPE4uGuRtTwhiU/auYfMMLJF+NI=;
 b=HQGknXgxhsxyJKxdsTREfC44pus7vIDuoA6rwAWPCqSfI2OME0mxX45Zt+ADtd6EWffXHq
 MoY79k5E97/7E3EN7iFmLoZTTJ6a6qSsLB+misMuE3Da6vFqJpdXXo8kzBCfu1/2nK7tpm
 kc/HOdz1w/wpjhwf5xsUIv5/yhuEs58=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-TXh9UueoNSeYD6SePEVmHg-1; Tue, 10 Dec 2019 14:14:26 -0500
Received: by mail-qv1-f69.google.com with SMTP id g15so7466903qvk.11
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 11:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t5NRopCXac/TaVRyYxckA1Ih+aNBJ6X1xXjY0vMyIYY=;
 b=arbFDJHe5TGOY3/G0hqNg+pZrHT6zdFy5BT2LxdN1s9QsZJTtyB6v8bk8yF2oT0NyS
 jbu0XHMTFlMQqKw/tDdww1OzRNR4UfvDqXhReK3a2rq/FRhBtIqfhx58Rnh7eQvg8MeM
 1cZ8yx31z6DlSAhSdbpr1HKSzn4Y/NRBoF2WLRgzWj0jpjkq3SuJNE8VUS9y+/38JF58
 JupzLWognZt9wmrpVLEUsDEROHx7EFQ2bb5kyEZjwFgkQ4b0Emn6jYWw4dnNL9/Jf9Jk
 BWBJAjKIrZl/EaBJd+HILBdSGaEvubhogwiTPNmY6sO0qlRipqfpXL6S2gSBf7LwJ86t
 cYYg==
X-Gm-Message-State: APjAAAWFusneLP7aAHfpBM4jIM4byjl+pgxw+TYcXojVKWFzsYEg+ILQ
 A4jUy0ehz94dX9kYylMIeqGKCLjgumm/saFHrFsfPAQ+84R6xFS0faXZ7HgZzObWEYCbl+KKe9S
 r21AHD82K241a
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr33446196qka.386.1576005265880; 
 Tue, 10 Dec 2019 11:14:25 -0800 (PST)
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr33446170qka.386.1576005265597; 
 Tue, 10 Dec 2019 11:14:25 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id e2sm1211935qkb.112.2019.12.10.11.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 11:14:24 -0800 (PST)
Date: Tue, 10 Dec 2019 14:14:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 03/20] virtio-iommu: Decode the command payload
Message-ID: <20191210191423.GH3352@xz-x1>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122182943.4656-4-eric.auger@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-MC-Unique: TXh9UueoNSeYD6SePEVmHg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fRQezozx0AP3

On Fri, Nov 22, 2019 at 07:29:26PM +0100, Eric Auger wrote:
> This patch adds the command payload decoding and
> introduces the functions that will do the actual
> command handling. Those functions are not yet implemented.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I would simply squash this into previous patch to avoid removing lines
from newly introduced, but this is ok too so to keep Jean's r-b:

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

