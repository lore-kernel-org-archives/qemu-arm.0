Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1229735lff;
        Wed, 18 Dec 2019 11:31:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqyECbTTX/oJSfMPWzj+pXRZR3SMMvoRy5OUNcw57/85E1AmNLu4SUQEAkzHeG1drLuXaqZY
X-Received: by 2002:a9d:1c95:: with SMTP id l21mr4262109ota.271.1576697474554;
        Wed, 18 Dec 2019 11:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697474; cv=none;
        d=google.com; s=arc-20160816;
        b=gsjM8fh2LZYFBXzjMVJY51gAuCC5Uimkwok1guwQdU6JYh27MWLYQB624LzhuMSbbe
         B8AFfL8BGh74HPD6SJgiwfVeALtDKyk6Y6CrICUyC25+mPptNbhpnXZaWf/MJWifiCQs
         Zhr7EcsdW2OEL37D1JQndwtj0tmjMVX4/aA8Ayg87+51Q0JOlOnBedsjh1Eu/AjRb3kf
         lKaDQshNtgpinxkH8aqd4Cr76638JwJiIhVcMtVWSFP9LcqN5iACh1PiYsqkPn1k+h8/
         cYV6I7cOfs4jlv/0I86A4a255G7HOApOrwz7D9UbuyUXFJQhQuOIPxKf2PJs+dpkJMoQ
         V3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=sWLA50tMKnGCQKtua0vEBQXsCJiICSj38z3R+eLXr84=;
        b=So3VuW9GlVnX2SpgjQusVl9hg0A3SsNI8vn1J2Rm4LI7UwidtFPlMcLHCBELKsSLIr
         7fhWz19pLmVU/VHDDa1kvLm1mwG7MSVau/Tn6f3tQ7jtrG9+X3/G5hNLbpItnL6xvXph
         IU66ZVIvfY25I+vgiRXkiYPzy5ELbXMxvhcy9d/vMAGGcvkKgs1ZZDhdlckw5c9tF/9u
         Pc2IxYQnuzkqk8mQxRbO6cZBPgXGsJuYnbY7OWzc4oEv53pbI3nxjOH1iq6bdfM3d26j
         AbPQPUDeI0wTIGACope8DjpPxjsF2ZJvJi7VvHqrVdcQAtAwCyZZTOgoGmYUDlQcCccE
         f3HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XgEAO99T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f187si1914109oia.218.2019.12.18.11.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XgEAO99T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihf2P-0004aG-Nu
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihf01-0002pe-3s
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:28:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihezy-0003t0-UK
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:28:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46872
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihezy-0003nE-LD
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 14:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576697319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=sWLA50tMKnGCQKtua0vEBQXsCJiICSj38z3R+eLXr84=;
 b=XgEAO99TB2chaovLg3d3SvYtSiqkXiLSW0CPoiLtyAz6jVD07NJx4mpgjIQuOQT/ganIB0
 99eZxdthSfwM/Qoffd3pIpCyK2P9/L/O6akcq0ZpjXE18SgS5ItSx+ANd0i8aHCQ2doJIK
 0AVB5su9ZQxzRPneSNH5ExLZnadLYoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-KNTBxx16P4StjFBZEgxsig-1; Wed, 18 Dec 2019 14:28:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54A01800D41;
 Wed, 18 Dec 2019 19:28:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33ED15D9E2;
 Wed, 18 Dec 2019 19:28:32 +0000 (UTC)
Subject: Re: [RFC PATCH v2 5/6] hw/net/imx_fec: Remove unuseful FALLTHROUGH
 comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <4a2cd906-0094-2e10-d882-24d6794245e0@redhat.com>
Date: Wed, 18 Dec 2019 20:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218192526.13845-6-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: KNTBxx16P4StjFBZEgxsig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tR2fnRmmQyxf

On 18/12/2019 20.25, Philippe Mathieu-Daud=C3=A9 wrote:
> We don't need to explicit these obvious switch fall through
> comments. Stay consistent with the rest of the codebase.
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
...
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index c01ce4f078..5a83678f64 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -901,8 +901,8 @@ static void imx_eth_write(void *opaque, hwaddr offset=
, uint64_t value,
>              s->regs[index] =3D 0;
>          }
>          break;
> -    case ENET_TDAR1:    /* FALLTHROUGH */
> -    case ENET_TDAR2:    /* FALLTHROUGH */
> +    case ENET_TDAR1:
> +    case ENET_TDAR2:
>          if (unlikely(single_tx_ring)) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "[%s]%s: trying to access TDAR2 or TDAR1\n",

Reviewed-by: Thomas Huth <thuth@redhat.com>

