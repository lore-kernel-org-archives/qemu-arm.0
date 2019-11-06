Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1091969wri;
        Wed, 6 Nov 2019 09:54:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuuN068mDqgje8XjzQ6zUzbG2Xf0L5l/CWiQBmYcsvkv0fCJw/HzSlwRjTl211f4l2rjPG
X-Received: by 2002:ac8:4a0d:: with SMTP id x13mr3776196qtq.164.1573062862433;
        Wed, 06 Nov 2019 09:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573062862; cv=none;
        d=google.com; s=arc-20160816;
        b=t5qRqDsCd7hokwV9F8yzFMGe3ayMxMFxTI6QPKiAmkaDge8SSENTYtz4l73lDtJcn2
         cKZTsF8onmxLvYOYbBH7si8/UnxJtN5u5XIlZa7iANw+z1v9Kc6qn1/fMcwXh2U1KXH9
         iBoMQJp+5H3qe0PVmjHuZnQ0Ly+Z5EbiyMdvlxloNjWwsRpXfpLW7K6VF6SEAokXFgxI
         BDQHNrRwyR3WavsQ1EPBAHavsWalDnzeE90K33W0kbVuZci84wbnGnzGy1KBvAFehKI3
         Pyoe30n5JjSjojR0V2/zZ89a0cminaqHkoDmIpVXe1Hn87y4+8h1s886SORDipsrBqDx
         xL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=kxccAulp2H9KiGiCKasLaPzlUz0orGJjTHDfwzfUEpc=;
        b=mPYeM4v3UX9cVANvvE7AqZBI2FTrWlS5OE4KJYtlQv8lnQTBv9TCtp5IPn9UKGQCvA
         gAZTnoiid3+uYS/xBUvGCrrbGOG+1pUAOe4vWsbIexc/OUSJruvIwmPpm4YNjfWlJ+m5
         TZ/OIE+rmCZkEFEN9MJ9nNXMBUnDyVd6/0iAEzDXGIfQ+qrKoQ7BRbB8f3RFxIJrq0QO
         Y21eXxmEHCb5JqSRxlY46/sn8BU67316aj1rAzPwcp0jKkaZCsvZehsr6qUb0MgiLHwE
         zP0VAVerNYgRQdNbTXv1R+gucnesssAq7AAqbGPhUQF2Uko0EwnKopejmhYI1lQ3eQCR
         j+EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A7Y5HVeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19si18287957qte.365.2019.11.06.09.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 09:54:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A7Y5HVeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSPVd-0002uk-RW
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 12:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iSPUG-000226-RG
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 12:52:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iSPUE-0000Q1-Sz
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 12:52:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53763
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iSPUE-0000LP-Pi
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 12:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573062773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxccAulp2H9KiGiCKasLaPzlUz0orGJjTHDfwzfUEpc=;
 b=A7Y5HVeB1vVMdLnJEKeZX+sfIWuEMgwy+vANT8KymbfBY5cKUrQqMaWok/xanrbOuvMhKT
 z8vq5VTg/kute508U10PQtMJULgscXNFpVj83qs7BU0FfQtB/o9zU9GgmItnsA8P0gz0le
 +/0ZKUIV2CmPR7HfvcJtyfwAikYxV54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-JRI6_7IxOMG1E4HRWFxCmA-1; Wed, 06 Nov 2019 12:52:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C148017E0;
 Wed,  6 Nov 2019 17:52:47 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B22A5D9D6;
 Wed,  6 Nov 2019 17:52:42 +0000 (UTC)
Date: Wed, 6 Nov 2019 18:52:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [RFC v2 02/14] standard-headers: import arm_sdei.h
Message-ID: <20191106185240.3f5e2c2a.cohuck@redhat.com>
In-Reply-To: <20191105091056.9541-3-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-3-guoheyi@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: JRI6_7IxOMG1E4HRWFxCmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: urkxRoXKdgki

On Tue, 5 Nov 2019 17:10:44 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> Import Linux header file include/uapi/linux/arm_sdei.h from kernel v5.4-r=
c5.
>=20
> This is to prepare for qemu SDEI emulation.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>=20
> Notes:
>     v2:
>     - Import arm_sdei.h by running update-linux-headers.sh
>=20
>  include/standard-headers/linux/arm_sdei.h | 73 +++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 include/standard-headers/linux/arm_sdei.h

Just a remark that I find it a bit odd that that a header that looks
arm-specific is in the generic linux/ directory (already in the kernel,
I know.) Is this for sharing between arm and arm64, maybe?

