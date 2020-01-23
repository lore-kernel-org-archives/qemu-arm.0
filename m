Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp768095lfp;
        Thu, 23 Jan 2020 07:08:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwAcXwEdaDBle5SHpumT3niqh7uWjZnj5nDJtKd0cuSnQ2S5Ck/IIIaoj3LhRiQOTVagKH
X-Received: by 2002:aed:3344:: with SMTP id u62mr16319607qtd.73.1579792115639;
        Thu, 23 Jan 2020 07:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579792115; cv=none;
        d=google.com; s=arc-20160816;
        b=N3wbHg151go8mu5JdTM0ODqafj/1YOpFpTvRgOrtmQntg0NJrLf6E6MOT5oyOYjki2
         nwUUIUANlLcFKgpzLQ0PPhGmHeVX7/iqG7+7qgilJabZ4YTZkrYTuYlPlTJE+H2NYOk+
         I9g+Q/8s66wuLKoEiB2TtwIf23RR6cQ5TcCRLE+ikhly3T9pofw/TdFwh2d1AnLjubGu
         Sq95CygQtqFE70zRfC+VAHY1pJrKUlTeNTEyaAiLoHpJbm2YnyQNEhVd5NGP9XE0LuAo
         sQBTIBx8NFi6W53fBlETDqyOmJV6BcUoQWcK8gvatkZeDM7NyAMTDlq2SsyRfucvaqad
         svzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=8uwTBTYdE94Cmo1wsjToF423Flsydw/GLIHlPO32hQU=;
        b=loOSc1f+Pm3M144bC+BKHtgTpgsXIT3Ubnqi3qQRsCJcGd/wdgiipkDdwGGCLMUrV0
         sutOo1Vr33xWLduef+GLjNGzn3KRLFBUGAxK2bdOaefy2wNxN2Nf5Gj2w0HLfNsfIhIK
         11zfIYdMfb45wJ8YBXB7TDajRmp2pTSK1IZW0GgSdXwoWilPrTnSJdw4FvUO6MBhYdYi
         p5HQknhsAZMBpvbejGqzg+26G8e7dVEJUlxDQq6Yrw6kPfRpSmgbkUTEwYl3jd49T8Ar
         Jvn9yY1d47/4eW+ApSzmMUmdz2H+fkcNnoCaBoma3In4GvlgyUGKD+FsKluJQERuZnKj
         UUKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="JuaGI/Wb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28si1592067qkl.158.2020.01.23.07.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 07:08:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="JuaGI/Wb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iue5y-000269-VG
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 10:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iubw5-0006MH-7K
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:50:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iubw3-0000PX-UA
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:50:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45910
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iubw3-0000Ma-P4
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 07:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579783811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uwTBTYdE94Cmo1wsjToF423Flsydw/GLIHlPO32hQU=;
 b=JuaGI/WbpQ6bT3YxU7sbNuNH9dr6uNWSFnTc+7G4BDMnazCMLkTk/ekLQTYeSollFYOe66
 OQvh4tcxmOX+BymMojN/zjhjua37K/JlJ4jhm8SOsisgkg7UdTQJeiE+abm2AdS/8BYIH5
 8TzNcS7DfUI7tB7JclmPTN2/OWQvi1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-mioDkcWYNQW6q4IgZR-o8Q-1; Thu, 23 Jan 2020 07:50:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 517B318FE861;
 Thu, 23 Jan 2020 12:50:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FBDE2898F;
 Thu, 23 Jan 2020 12:50:05 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:50:02 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 18/80] arm/mcimx6ul-evk: use memdev for RAM
Message-ID: <20200123125002.bcdbwbfankqsn6bz@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-19-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-19-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mioDkcWYNQW6q4IgZR-o8Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jcd@tribudubois.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WYbWQ8AOrlQh

On Thu, Jan 23, 2020 at 12:37:43PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>   remove no longer needed MCIMX6ULEVK
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: drjones@redhat.com
> CC: jcd@tribudubois.net
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/mcimx6ul-evk.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>

I don't know anything about mcimx6ul-evk, but I promised Igor to put
another pair of eyes on his changes. Looks fine to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>

