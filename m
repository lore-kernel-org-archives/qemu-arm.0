Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp716085lfp;
        Thu, 23 Jan 2020 06:22:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6/j6PULZKxsjtznnKcJVhBg1nx01nmBb6CJD9l2rxJ6AQdDE1M3lBCJiW3NO8iyc6iWR6
X-Received: by 2002:ac8:1496:: with SMTP id l22mr16465590qtj.38.1579789359666;
        Thu, 23 Jan 2020 06:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579789359; cv=none;
        d=google.com; s=arc-20160816;
        b=0lOVJNSd58HReFXHTkADV9NBy0BDNRPyDKBlzNbFFQyq01sCQUmu3h0FGKFvymX23p
         ieScY36b5GDnge4rtHz1ke6vgqEcVTDJgUB90LJsRMyULfPFzT7EZn7Yg5xINvAYwDUg
         mNc5mvKdbzhopdFzI+QUGeQvlhxk4JQDZSsw0VtI+UNGpBxWenKqJnNcUtcaxvOFL4Ib
         D1i7x+HZBcc3oAeXvLBhnLzFNxOWP6Dpwo5T9BHzXUiqkrND6l0lMMtrT+xrE9yD54ov
         rVyvYteizG4X7a58PvNrBxN8g42fOqVi1B7O+yj7zAvYgX5JwLfFHtiAwEs0sD3pR+sa
         HUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ddyN+QWpksXKSfxyuElhlYq/7MuNqPYA5dbPgrAa/h0=;
        b=w9DTdtQ6a9W7Gt70otr2B3gKau/H0ZG34jtIsn8Ml2Qxnwz46d5AE1eCYqPoPE+aQ8
         c4LQnX3VPn3O0DwzQuE7rnuClkJIbN6o9kScInfm0IiNqS8YeGFQN35Zx24dgyBEvNMY
         1eQckY8d4rVbFuMAKOWd288zhR+QfI5O7MMrObt40AXgQT4cN0oTnTGFJsFfIKSgzpPj
         4Zdue1HTZ7SfVPwDiQjVlHl06mDP+EQ8IfJJcavIALgCJgY2e0SgH2xYWGKyMGhuEsE6
         cVRyDXqcpXu09NBE7jY1EzY3kbIYbR/tVI7rMcYMHA4Kny1d1o5jNc7fpWMiD+iFg331
         xgqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TrSnU8P9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si1625265qkc.126.2020.01.23.06.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:22:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TrSnU8P9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudNW-0006Fi-H7
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iubxr-0000SX-LY
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:52:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iubxq-000614-II
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:52:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23071
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iubxq-0005zY-Do
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579783921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddyN+QWpksXKSfxyuElhlYq/7MuNqPYA5dbPgrAa/h0=;
 b=TrSnU8P9Ys79GMUSR0k0KZI1dhwUSpIFKzpdqkZNc6TDDqlbmLjyaTkIY17JMDvsoasjIt
 uv7iblCJ5HplC/4lJY2QbijCNDRQFzw2HsbdEEkO51dNxWWz7EqAmAhR6SnxchZJ2ri1F3
 iuhzm1FcmYasXH1Q0dLa1vmVFa2oxLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-MBzRGOpvN9WIpiljGcresA-1; Thu, 23 Jan 2020 07:51:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D55BA0CBF;
 Thu, 23 Jan 2020 12:51:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F08860C85;
 Thu, 23 Jan 2020 12:51:55 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:51:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 19/80] arm/mcimx7d-sabre: use memdev for RAM
Message-ID: <20200123125153.w7ud6fks7ejqiafk@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-20-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-20-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: MBzRGOpvN9WIpiljGcresA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: andrew.smirnov@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bJlgxg645Pol

On Thu, Jan 23, 2020 at 12:37:44PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  remove no longer needed MCIMX7Sabre
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: andrew.smirnov@gmail.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/mcimx7d-sabre.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>

I don't know anything about mcimx7d-sabre, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>
=20

