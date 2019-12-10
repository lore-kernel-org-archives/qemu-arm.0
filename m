Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6267937lff;
        Tue, 10 Dec 2019 11:36:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxlVZcbnEYrEdr5qnXzanI3kVtTkzX8mY5XQl7qzrC5YsVXaHVPcnnnIWukHgnHOgsltV/Y
X-Received: by 2002:a37:496:: with SMTP id 144mr34347385qke.338.1576006589126;
        Tue, 10 Dec 2019 11:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576006589; cv=none;
        d=google.com; s=arc-20160816;
        b=b1JY+Hvjh30kD5pkl9fkaDvgsVpuLUtvJXDCuzpfQdlARZmeauL1uR0uBqk5bZqMTL
         OwBEJZI9wlhC0mEWKo7dK9T4su+xxLzLstBfBYEvREB2CyVkwR1+f/vE3Ao2CnMbya+X
         uGMR52FtbRxvdPbqQx8UvGkH92MEeOK2u552brAEoNyq6TAqJcrFMZu236Mt5CjBMs12
         RN6+ip2QlB0kFX5U4joKURT2VvLaXprZ9Km41VzhVDwYo1leyPbZt94RHsje/H6ld5NR
         /KmWbPSCtwt/+rcuSQse7TmqX7dmDS4B04x4IJgAK5POssuwbrgMrLuQSLqVaSA8roqX
         UCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=eb7AmweRNmrhfF8rgwPCRN+jvonKHTPSJaOP2AIRHTU=;
        b=0vZ4kvjYLdFpS8uUOd8la7vmL7nCjs5yENp/p2EwLzcbCr6kgXdQx7lHOt0mTVzWd3
         3iJjL2+PotLfiEF4i5nGlzBLg7NEH+FMT8dnw1QGsXKFWHH4KNvfuR9Z0TXoj/gU+Rb6
         dFxtSGIoAPGwziBPat1JJb9nWY+7NW7lzzNc89abgd87YhSqgG26+Oxhxlw1NF/GDney
         oegR9wA5+0GD1fYM7nzoBnihYFrTp1ppyutxxJAD30kS68HtAXaRmiUXg2xoUmGtNAL+
         Ls72qWgNc/7vbuBbuUrj4Bt490d6TJcKqinzHndY5hkQ8GkJY8xlxLf6YQuxMEYNhztL
         rBfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V3uKNUDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v44si2616595qth.164.2019.12.10.11.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 11:36:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V3uKNUDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ielJ6-0006Q2-FI
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 14:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ielIx-0006Po-Av
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:36:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ielIw-0000x5-Dh
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:36:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58158
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ielIw-0000wz-AQ
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576006577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eb7AmweRNmrhfF8rgwPCRN+jvonKHTPSJaOP2AIRHTU=;
 b=V3uKNUDBF6UVyoziG+AfWFUQ5kyXhBU6p+U/BE58mvvhf14CskLqaUfRAImfLMoQfogpE6
 h7Xx7lYEjeyE6RsfTDOkWCX8GMXrDJCfBguQuHK1IdAGR/EWhKmTKrTEdikA1blEP95K1d
 uvFTOVKGvZTutw4SwZAgD2WKfB+ssb4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-P_4dVrFmMXWveGpR0-QHiw-1; Tue, 10 Dec 2019 14:36:16 -0500
Received: by mail-qk1-f200.google.com with SMTP id m13so12964420qka.9
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 11:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VoST2cwgUReKtnPRy2fmQ6MgjrANU6LbhWvd8CWPERw=;
 b=h8oqqGD3IEa9qmIoI/ubEpjpoXHJBwkv5EhppjgwFlzZvUf99IZLZb/QqRjXEa1ei6
 Q6X3DdKziAskME5RfDfg7BbZq1+cu5awyBoE89jZHqjuoalSNBGVjroNQkmvCmAPWVft
 DBTZ2bEQjSl/DsRxKPX2jikbKpYs64V+tAuSDxSK+rzcBauUDdrbwCJgPmU/z2T3wqSY
 Jii7tp3HyxBHZ+QvROmYKNDFsEV6TXPFv5//CnU9RMDzmYGDvQqY9ih/VAJUUmM/zO2l
 4gVGobZrmMYZ67Xk1UFwiR/4Ix5wVCBQHYuXaBzXyTcsQd9g4wNHFlXL4UPiyAmTy5uA
 JWYg==
X-Gm-Message-State: APjAAAWp4Z94ZARfhSd1IO5ODUu7evevfgY4OlDU41T0/ujILg3ploCj
 wvXpmXdw3Lugw3M4s3D/72veV8+bZeCfKHjVUk1iUXEXnDh00rBy2auieZM7/9p1G1NUT0uHB+r
 MaehaRERNjctE
X-Received: by 2002:a37:a1c1:: with SMTP id k184mr17377454qke.66.1576006576115; 
 Tue, 10 Dec 2019 11:36:16 -0800 (PST)
X-Received: by 2002:a37:a1c1:: with SMTP id k184mr17377436qke.66.1576006575903; 
 Tue, 10 Dec 2019 11:36:15 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id d32sm1456168qtd.31.2019.12.10.11.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 11:36:15 -0800 (PST)
Date: Tue, 10 Dec 2019 14:36:13 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 13/20] virtio-iommu: Implement probe request
Message-ID: <20191210193613.GK3352@xz-x1>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-14-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122182943.4656-14-eric.auger@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-MC-Unique: P_4dVrFmMXWveGpR0-QHiw-1
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
X-TUID: ZzFMb10jO25A

On Fri, Nov 22, 2019 at 07:29:36PM +0100, Eric Auger wrote:
> This patch implements the PROBE request. At the moment,
> no reserved regions are returned as none are registered
> per device. Only a NONE property is returned.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

