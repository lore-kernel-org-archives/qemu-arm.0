Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4560106lff;
        Mon, 13 Jan 2020 11:54:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw934oKhLzvxJYaVzckryxckeEMqJlNYSCvTbfxz/16BS43wHuNRjsSrtbLSacCwOP+vv6q
X-Received: by 2002:ae9:f819:: with SMTP id x25mr17870096qkh.192.1578945260869;
        Mon, 13 Jan 2020 11:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578945260; cv=none;
        d=google.com; s=arc-20160816;
        b=CvHStoeGv84Cvdxoh5v8KQIK4cGzDG1wufKk5cMG23MKetk8dedFRSqIHeB+zaGtiI
         B8gzIlxw8UW/f8xpO9KPKHKD3HByIj+4+dGYo13+CCpcuX75bzfk0h5HX3C8PbMtNgUO
         p+9J9BBRikTTW4DEmFGxcaZQQbvhdZKChhI3mLWyHxFO61vwot/ah3RTyVhTMCcAudW/
         dB+ufnjR4UmjUgzt2lw15Iy8FwFyTQwYrcN3467B53P0jbEyRx/Eu/16mdhn3mX3bYoX
         KwIHYSI4Gwa28lGHTh0yd2zVV3QnfHER1vufYHeJ8beZPui86zjFkdEwqquhq2+h7qfj
         mv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=1j+mPe4cJIBJCBm9ZPogUyr+mteKp3lGBIfY0ZzH+Uk=;
        b=K3WL3MfhVXLOa+M4B/EXv61howaCoW670lc4/omYDIghkM5EFP7GdQWIEeEacgfsel
         Es3h9NOu59FVpyLbre31zRGRiPT1JrXK/hYAYv58Z5ezkcPO7+FwimDkRHbZvm+M25yj
         iO//SWh83VQqQWq/qJ8mNI0BYDRpGx6UqmxMkNXnpC1Gw8etz+OkW52K55SVpCTzqrjL
         bBqRrEZN58gCV0/2n9sVTPmZOlgwztZiQMovmaPqPYqX6JfenOtYwa/d1y5coWMaDY0d
         KMUqLCf0Ggl2egxdA27dQdhFnS3Gxrx6gKqLEpXUA4cSYg55z2CqB2a8b8O+/BYjuIjz
         Eqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I9K8qCO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si6845096qte.121.2020.01.13.11.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 11:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I9K8qCO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir5n1-0008E5-Qq
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 14:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ir5mn-00089V-Qt
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 14:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ir5ml-0008GK-SJ
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 14:54:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36339
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ir5ml-0008Fa-On
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 14:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578945242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1j+mPe4cJIBJCBm9ZPogUyr+mteKp3lGBIfY0ZzH+Uk=;
 b=I9K8qCO36SCwEq18bPnzJ7DSBWt0aIMqRpresUVAVi0Xe7iUtjrwfW55h5W1/k0G6ZTXBJ
 PZFZ5wuVyrFDYRznDAgYRk/iROV59AlvMJwoLSNSEWQKthYdGBoOdORJRfVnit9THeqEfu
 23CdwSdV3MKDuNLNzKSOdmJ3mK90afI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-HI-Y9anGOxyCYR59HJAByA-1; Mon, 13 Jan 2020 14:53:59 -0500
Received: by mail-qt1-f197.google.com with SMTP id l5so7313163qte.10
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 11:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PoBP/FNDU8dSVutypfRBqxdZ4EzkLMcbKHU0J1nBkyM=;
 b=IBLUI6i+aldjrO3/KuqI+gwg+Ou7YXO/5rEpZ4B+JXdz2+9bEEu9fWhXhYR8mJF5OG
 W0mF46JsQw+L7JDFSv9PZw+r57zK7ULQ/5hP9MztOujH9xaTgBqgenMcgr4RlIgdwtP/
 4SER0IYyxQ1a31R+2rHVf3F8alpsvAfo58qo3ZqX74U3XNMltKu16ttcbTrzBIeboCkl
 BMAWLxfWVUgSxkr/dKqLBCjGHDHhxHigGm8kGbsT+fbkL5kM49+/hfrMQchJiUsvbF7z
 z0PIRD5pD5fEiIzy4MwbvFE0grDAUtE3ei84m8BFhVSe81RYU194syaADHc51k8OSbLf
 eIBw==
X-Gm-Message-State: APjAAAU8ZzqIpiAzwB441nYwFjATU4Y9h8zF1wHWrXW3BXHeU0hASuy8
 nw30o0UoDIHChqf9ujhKnAFFVwtNnFympBWbjIqPsK3kQ7xeY+WUpT04YnQhPVS4qTONElfVSTn
 4ePV9uNU/dlZs
X-Received: by 2002:a05:620a:1183:: with SMTP id
 b3mr17344629qkk.316.1578945239316; 
 Mon, 13 Jan 2020 11:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:1183:: with SMTP id
 b3mr17344610qkk.316.1578945239124; 
 Mon, 13 Jan 2020 11:53:59 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id d184sm5504762qkb.128.2020.01.13.11.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 11:53:58 -0800 (PST)
Date: Mon, 13 Jan 2020 14:53:57 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 02/13] virtio-iommu: Add skeleton
Message-ID: <20200113195357.GB201624@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-3-eric.auger@redhat.com>
X-MC-Unique: HI-Y9anGOxyCYR59HJAByA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xsFqjcdS572L

On Thu, Jan 09, 2020 at 03:43:08PM +0100, Eric Auger wrote:
> This patchs adds the skeleton for the virtio-iommu device.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

