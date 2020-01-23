Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp747370lfp;
        Thu, 23 Jan 2020 06:50:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKX9kimUQTl9dht9lIHgt4bMBRaxhoWEI5jx+jGN5H/+47YFG22L+fUoT0qhqYdLcOcjxV
X-Received: by 2002:a37:e10f:: with SMTP id c15mr16372208qkm.331.1579791018756;
        Thu, 23 Jan 2020 06:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579791018; cv=none;
        d=google.com; s=arc-20160816;
        b=uZPxOJxzENdU15GhZO9f4R/FNUWRvF43zrcOw/Zu6EqNR5rut87QMHp9ZzxdDl9lzh
         jiUZ6FirbGy9wHyZrOGksyw27T6Pa9cIE1Js023wWCbNY7CcwV7DxtotF1ciVflQT2VO
         E/GMH8D0gB39SCyTjg7MQdsY02Qj137QKWRTj2EeK2OLI1dSzqKUGR7iH+eWbUSAXaIs
         J7RdrC18ezBWaqMCu1q+Yxj2ofteUTih678XaD8JzpGix8f0nmIDI9FZomGUykb8Ey5R
         ZXOpKbduJ8g+h1xF/cifq+qa/E960H1CutGK+HsPJvZghBQWYvNy2Vso/5CKC41XI7hi
         xnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=m9UPhOnRabdsdLcNcK3PP/8xogz+cYcmH6Xcd3AlmBc=;
        b=Wui47+It6e65ByzdxYfsN4zIXs2fsqBg6d7uu7rufN26DUFdg73Yyovn662arx9EPp
         qLAu+STgccpgPEWpIuHtZxKUMaoImOEPrF2mki1XnXSokJ1U1usZ8p4/P/oJPWNs5BN9
         OQxaYFP3mwPwMgSPGZex/4J6ISzmbnmJ2EpNrQOnnhotDD83Wp/rPVNzN/7JsLaB5oUT
         tFYZP1JbbLmdkFaVbzP88qRzpjINNtIQcmStqbadGfArszoF3ZVvxz/PdEPgq9sjdBIx
         wfe3nMd9h7XBjfjImcfPa5+aQ1WXYStDvDj9yZvSTrUpxRRH+yEXnmaasoCBqnX2+GK5
         mH+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ryctocrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl5si1411039qvb.113.2020.01.23.06.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ryctocrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudoH-0001BM-BI
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iuc6M-0003vX-Ui
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:00:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iuc6L-0007Bd-LW
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:00:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26928
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iuc6L-0007AV-Hh
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579784449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9UPhOnRabdsdLcNcK3PP/8xogz+cYcmH6Xcd3AlmBc=;
 b=RyctocrhRUzMMO0SBqMBcITQrOIVQwkzeMdchv9LJ5VVZSDfD7Lyy+N5V1oCf/lxeiCfoi
 DwburwEYgHFsZgLguqG7cRukSep3PJ5x2BGObT0xHpaO6//bQ0mBvoobYUXsLJo8eeeuOp
 cljjUeT1FpLeNy4MvapyFaHr+zFalno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-5oOSJUz-PGuKv4lhWUb0lw-1; Thu, 23 Jan 2020 08:00:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09C9A800D4E;
 Thu, 23 Jan 2020 13:00:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 113AF60E3E;
 Thu, 23 Jan 2020 13:00:42 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:00:40 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 21/80] arm/mps2: use memdev for RAM
Message-ID: <20200123130040.fa5pjoplcmz6nus6@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-22-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-22-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 5oOSJUz-PGuKv4lhWUb0lw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uc6qg7I+BDGX

On Thu, Jan 23, 2020 at 12:37:46PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  while at it add check for user supplied RAM size and error
>  out if it mismatches board expected value.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   * fix format string causing build failure on 32-bit host
>     (Philippe Mathieu-Daud=E9 <philmd@redhat.com>)
>=20
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/mps2.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

I don't know anything about mps2, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>

