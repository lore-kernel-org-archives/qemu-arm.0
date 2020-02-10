Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3785815lfp;
        Mon, 10 Feb 2020 04:33:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJWMvMhAjHrOTLrD9qqHJQ47EZn1R4tewh00tDSL2OIrMeP88riMlrSWKivl6Kbkk1ACrK
X-Received: by 2002:a05:6214:450:: with SMTP id cc16mr9813433qvb.175.1581338021015;
        Mon, 10 Feb 2020 04:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581338021; cv=none;
        d=google.com; s=arc-20160816;
        b=rGBg7+OKndj+eKWomPLL4mRkXJbc+cIHQ7Qe+OCrfTnzP9Wnd2k2jrX2Oi7BRfwOD5
         1dgsNDG+EDAjdo7BymJYYY5RmycfiQ4xxAas1v0+x1pmFlETVZzqdgj2kWEHlt3DBPS5
         iS0yatzlYn+AN4rCxEUSbdype+0QSCF8Jt62NQKHR87AzPZVXEsC5zoHGFFR/rzgV+uV
         3D3ru33Kk4MxKF4f783gugQG5rX64aGwqOvqUSS9Oua9Z15/HjkJehr8yIOnDVWnC1ws
         9FAHpkLaJAM3Yjmpv2kb3cUItZ907SX5aNN2GOOPO0E3P0tSI13MjK578C2A3gVg+FQi
         YM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=SD9gDvtqth/m9PBLWpRPD7Flt4lz7t7JH8l2KPId8Pg=;
        b=HmaanOhGiQ0N8O6SdT3fQCRTP+Mt8+YgSEudWHDRBdd6OmJaxiWdfXNlsT+WKGKd25
         yGq6lTwEhGyu4G0Ivv0YURGjhCjnNwqITVYrbDjAdOiN/qGUrLx9DwCNND+z1OHuoPrK
         BRGoVAgriuOTgoA76CYx80Jas+jSl7vGS8xzLVx7+V750dRESDQq3ZI5JtrEjnBlFjQ6
         MlAbBYvcnJV3TdrlwjbiInDd1/CQl/C6UnPS9++dJITYruEfWZBKQWett2DLO367cNZ/
         hOVXtS6ut+2BmKz4c4dUeephOKl/Ks9oir+d4TYUSjO37ZbENqKGJDjWWeXjdSfjESo/
         JiSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PTy2yyi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si4069705qtq.104.2020.02.10.04.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 04:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PTy2yyi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j18Fw-0007Y5-GK
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 07:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j18Fe-0007UD-K3
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 07:33:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j18Fd-0000ex-NT
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 07:33:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j18Fd-0000eh-KL
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 07:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581338001;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SD9gDvtqth/m9PBLWpRPD7Flt4lz7t7JH8l2KPId8Pg=;
 b=PTy2yyi/A1Ae3TYw2SRACdlRIdAcBUZ6sTUedFnbkWdB5eNORtLQYulLA4sLnxU7LiLMUa
 4afewDz0p6IfRKGmdIzohA3Y4zPIlsox8yqukBYhJDoLrFH6zfCFCzBjsfCh/GgQGO3FjV
 aIykiwrPwetn9lD1abYVOuhAkwFFPqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-LoLTLXy-MAyRpzESH4jTaA-1; Mon, 10 Feb 2020 07:33:17 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25B5800D6C;
 Mon, 10 Feb 2020 12:33:15 +0000 (UTC)
Received: from redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BBF660BF3;
 Mon, 10 Feb 2020 12:33:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 12/13] virtio-iommu: Support migration
In-Reply-To: <20200109144319.15912-13-eric.auger@redhat.com> (Eric Auger's
 message of "Thu, 9 Jan 2020 15:43:18 +0100")
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-13-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 10 Feb 2020 13:33:05 +0100
Message-ID: <87eev27hby.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LoLTLXy-MAyRpzESH4jTaA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAI+jyDv4yVS

Eric Auger <eric.auger@redhat.com> wrote:
> Add Migration support. We rely on recently added gtree and qlist
> migration. We only migrate the domain gtree. The endpoint gtree
> is re-constructed in a post-load operation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And yes, this is as confusing as it can be:
 a tree of mappings (i.e. key,value)
 a list of endpoints

I will propose this as most complex structure migrated ever.

Later, Juan.

