Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2270502lfb;
        Thu, 7 May 2020 12:47:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypJj8kL+IrwY8ENMRzsZ/IB8XaxKjXGM+uUDpwbAB7bikXP/mPiz9ZKbiNDB5AltfCGzJgbl
X-Received: by 2002:a05:620a:12dc:: with SMTP id e28mr16868184qkl.38.1588880879014;
        Thu, 07 May 2020 12:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588880879; cv=none;
        d=google.com; s=arc-20160816;
        b=O03JjW7oxnhJS/R/vr+maX78QwYhMn1n/qKAq4LjbszY3nQiX9MKcSHDmWjsm2qv/J
         fYdG6kVpHOAfOUHRO5/SzTbp/w9vH3J/Bp8rLbf+/DEPRKALoMjwyoak0l8dd+H9+bEN
         iXd15uYF4Vg0hHRUjHJ6V2QlfGKvtzB+Ylo2PUkLADINhwmBGaKaPd1sZBXaBqIHEYuD
         E3TUf8IV0dl4LRPtmTspcebD6/19/wx/A7rAHqtO6qh4ZqMmqgPHN1ef2i+g5HYd07M1
         Fhycmw/btJj5mGVIYfc6oLbY/H9nh+somFM30cKupV5QEKUCJ8VQJtf3bSqsBHJ6h3Av
         L6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=mLKVmH1ls+kYXz+5pCKktKJ3qcZgCDjtDWhwK4TV2Mk=;
        b=LcqKSf007FzQzZmGzkr/ESuULhoCoBmy8CqOt7bbdf/26CtTQGve2iUXWYc46JFX/u
         /bfxR0RPq4KitQYlg822eMHKhE8U4/wQfquQgde69IgmR866lXSoltuMN3bO88eFemGQ
         LPI7JL1HmeF1X5ze16pXG2n5MtCh87j04xX3pb7MIjfhIjADoAig6TxVEK3C53+T3HVG
         st7ncRcYfFfIsnVj3VHidzJrUEgUZTWImjhMTUbg2LjmcGkVfSH+qIKTiWGUWIS74JMh
         UsAivGxoD1x2R/4ROXUmnLQDQ71nEc0mH5cQiLBaNXWw6ZBVmRgLSWf2xVQFX7Iguf36
         JFiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ESa5421Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id s25si1573757qtq.6.2020.05.07.12.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 12:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ESa5421Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWmUw-0000sW-FU
	for alex.bennee@linaro.org; Thu, 07 May 2020 15:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jWmUh-0000qz-Th
 for qemu-arm@nongnu.org; Thu, 07 May 2020 15:47:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31843
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jWmUg-0007i4-5s
 for qemu-arm@nongnu.org; Thu, 07 May 2020 15:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588880860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLKVmH1ls+kYXz+5pCKktKJ3qcZgCDjtDWhwK4TV2Mk=;
 b=ESa5421QQd9a4BFqZCZTlJWwgxJoO+EajqMeLg/7uovo5QBWDkLLcOXWV28LLBgR+VwYGL
 n1udHqeImp1Mjajv/B1od7N/oJwLx8nydnUwHxTmSjJPXabjhfHNe5SF/+DzwX92lidYUN
 T5WmFnC0Ul/BjTFnhnGM52mxkVGDVVg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-4E7zI9MROFKozINSyeus7A-1; Thu, 07 May 2020 15:47:39 -0400
X-MC-Unique: 4E7zI9MROFKozINSyeus7A-1
Received: by mail-qv1-f72.google.com with SMTP id b13so2702881qvk.5
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 12:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u19rLATa+GYdi/491nIpqQREZ59j6qVODpl8FKRo430=;
 b=sMEpi7mRASHLV8EvwivJgFr1tJhLer0AnJCemtmicaObhFFza0hpHmGHJxJnb7e2aY
 N7IQZnoANjagatFPmw8DRdXeLQboUqfVI3xTrJMkFnmjYvrzKdzUG+i33WjazKGI15M3
 U3Sc+31ew67m2QBROithAHySm9Cb5BlfctndUJL+RzxQ7pvRtCZlPmwnuwvt2zJFy8fT
 jBK5PUshEZUIyn6Kq9uI/h9XmliEc4RbYYdGqktsh7FnT0vXzApm9MaYmcWrQh5VrnBC
 sGbtNew1f/90BR/DEMsrqlJUTjl0KWXNeUDAhywDz4PzYTEGphogUEP//R9xHWlyT56w
 2Gcw==
X-Gm-Message-State: AGi0PuZmMibKjgmb+CN5ZFrBQFMAwycNtqQehO6LvxxjIK17Xf6912Tj
 c2jLmyGqAUlw5eYWk9z+FENMn/Wwh5n8lBqX59BnIZIRBX1aPPmePksiOZHGqJbl9KuT9RocRPi
 3dXpt82hDuzu5
X-Received: by 2002:a37:9cce:: with SMTP id f197mr15252688qke.35.1588880858714; 
 Thu, 07 May 2020 12:47:38 -0700 (PDT)
X-Received: by 2002:a37:9cce:: with SMTP id f197mr15252664qke.35.1588880858488; 
 Thu, 07 May 2020 12:47:38 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id n31sm5198815qtc.36.2020.05.07.12.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 12:47:37 -0700 (PDT)
Date: Thu, 7 May 2020 15:47:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 3/5] virtio-iommu: Handle reserved regions in the
 translation process
Message-ID: <20200507194736.GM228260@xz-x1>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200507143201.31080-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=peterx@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oFlkZNzDo48

Hi, Eric,

On Thu, May 07, 2020 at 04:31:59PM +0200, Eric Auger wrote:
> @@ -640,6 +641,24 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMem=
oryRegion *mr, hwaddr addr,
>          goto unlock;
>      }
> =20
> +    for (i =3D 0; i < s->nb_reserved_regions; i++) {
> +        if (interval.low >=3D s->reserved_regions[i].low &&
> +            interval.low <=3D s->reserved_regions[i].high) {

Should this be s/low/high/?

For this case (high=3D=3Dlow+1) I guess maybe it's also easier to use "addr=
 >=3D low
&& addr < high".

Thanks,

> +            switch (s->reserved_regions[i].type) {
> +            case VIRTIO_IOMMU_RESV_MEM_T_MSI:
> +                entry.perm =3D flag;
> +                break;
> +            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
> +            default:
> +                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPIN=
G,
> +                                          VIRTIO_IOMMU_FAULT_F_ADDRESS,
> +                                          sid, addr);
> +                break;
> +            }
> +            goto unlock;
> +        }
> +    }
> +
>      if (!ep->domain) {
>          if (!bypass_allowed) {
>              error_report_once("%s %02x:%02x.%01x not attached to any dom=
ain",
> --=20
> 2.20.1
>=20

--=20
Peter Xu

