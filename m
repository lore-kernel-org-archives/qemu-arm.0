Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6019775lfp;
        Tue, 11 Feb 2020 23:00:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxWzTny2K0pYVeNygVqnPr03Fzz9EHS2XNEZQ410QvQA6NGERGBENWcg8V/yCecdhrkPOs9
X-Received: by 2002:a37:a8ca:: with SMTP id r193mr6002678qke.335.1581490833451;
        Tue, 11 Feb 2020 23:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581490833; cv=none;
        d=google.com; s=arc-20160816;
        b=M11n8YfzGQBUxX0MFoKQFORFO8Pr++nGSnMHU8k92tZGAt8UCrkRwbBp2P+2XFgra+
         NYk0L1Cszk+bOPyXfNNhhKC1L3HTNP4/J5NX3TaWERgboAtzTeAP/X5+cJZjfOugQzqD
         v+OekF872QGwyYB9DjvBWg68aL7yQZUUvmXTQ2QT6vPYJTKmXaxhYLrYKf1JhmXEMFTj
         ZWLljjIKNKohHy3oi0YpdqHBXmce+jp+tXCKLwu4Tt13tXnwSGReELqLYxKlDnEg7vWn
         wkb9QsKcJWZWZO2eVAMGs3nvzJZIP6grThN04GGY4Qksn/8Kl2pshTYaiXWvIctV9+qq
         xVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6MRxxhJz5ACe4KFlcaa+fP4wgS0TkQlKalaXQCvWfjU=;
        b=LgYz8XhAoOVBF5nEC3x2093jPBQVSGk5iou9fJLVDRbV7c1QoN8jJR9Eg7WdGp952+
         QMKjYmH1cnTwIPzlTAOo20M85uuCmaMjQPSr96+dtZBxnfhe/K8hAqc/jhH9e82snDAD
         urcMhXaKUFINMhWADCg4wfSIgAd0zTHSmSTScG05R5prBwMDCgNHff4O0uQdQtToA2R6
         aGH1vRwvTYdJkt2nwfajdhhiy0lxqdk8TyieCsoJgT7+En47ZLqPoYOrcz9d9J2mt5Or
         lmdBXNBONO9EhX7IEcWg2iKPDKbXJ6OSWm3kvJ/SFuvaJbYMWXkZ26lFW+ERpRfRF6N9
         iQZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icLhncfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e57si3040900qtc.218.2020.02.11.23.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 23:00:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=icLhncfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1m0e-0006zN-T4
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 02:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1m0R-0006wp-Vm
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 02:00:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1m0Q-00076R-SE
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 02:00:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56110
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1m0Q-000765-Oo
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 02:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581490817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MRxxhJz5ACe4KFlcaa+fP4wgS0TkQlKalaXQCvWfjU=;
 b=icLhncfOK95X7IbOiHItr4EMDRkzXDI+Z+K9UZ24xiSv68/2PFU2Cx9Cv1GKCgkDv1FXKu
 e6KuEQZk76SEhyLDpEXk+4I3MSHZJ8FKCbY3SO6rsXVxTNYMYMe/WG/Z53izQJdzr0Tgtq
 dP0SgN7BV/gZ8V784Ub5Aftyolyk5og=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-t6a5-BjIPn6wB6zoSZ0rtQ-1; Wed, 12 Feb 2020 02:00:15 -0500
Received: by mail-wr1-f70.google.com with SMTP id p8so435219wrw.5
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 23:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JBqVS9TdpckNkCj29pRaqkiTCWcb7HanfRdJZjSEvaA=;
 b=jrZyhc9rfXwBGKblVv4sizyF8M+tQ4T9JoHp3mKnFh4fS0UboQcUET5PdgNyCpN0bX
 erO1VnQXpwvi7M1Aso4IpptncCEUuZ3wgw5n7qvGcH9ZYbO++ZHlm6vNjFHPxF1Yi47+
 FCLuC1ms0MHX/WExAxFXPYbdtgIlXRlMiejlbW9vpZ8R23MDKeu7EQmoNRk4q6Klhc0y
 yyn60PAeLW0h06WCuUEGLKM7pgb4RiBbu2KRtwIZpl7zzOAJxW0hjw2CpXQgBHZ54BdG
 Aq0r7UzILc+D1HpDdYGBcy+BgB17IulJuWEQF82BrRGonVWzLE/3uyU7szm9+a3OcUJh
 sZzw==
X-Gm-Message-State: APjAAAVY7vPg8fxJbEp1OQ+Jzj95RvOkYjIt7PsS8IxRttcQ+p0Zpllv
 eWkTJ5617Tyti0iJJcPi2WS2ZG7TMx5rSiDUQ+riKTIKw5HSf1N+cSWR+2rf/RUXxrbL3vkcP1c
 otrRRjexg1lnw
X-Received: by 2002:adf:ec83:: with SMTP id z3mr12972511wrn.133.1581490814188; 
 Tue, 11 Feb 2020 23:00:14 -0800 (PST)
X-Received: by 2002:adf:ec83:: with SMTP id z3mr12972470wrn.133.1581490813873; 
 Tue, 11 Feb 2020 23:00:13 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id c74sm7410596wmd.26.2020.02.11.23.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 23:00:13 -0800 (PST)
Subject: Re: [PATCH 12/13] target/arm: Correct definition of PMCRDP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c412f5b4-ce4f-8f7f-2ad2-24cc69a6dbc4@redhat.com>
Date: Wed, 12 Feb 2020 08:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-13-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: t6a5-BjIPn6wB6zoSZ0rtQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kceIWyBeIXwu

On 2/11/20 6:37 PM, Peter Maydell wrote:
> The PMCR_EL0.DP bit is bit 5, which is 0x20, not 0x10.  0x10 is 'X'.
> Correct our #define of PMCRDP and add the missing PMCRX.
>=20
> We do have the correct behaviour for handling the DP bit being
> set, so this fixes a guest-visible bug.
>=20

Fixes: 033614c47de
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cb3c30f1725..c6758bfbeb5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1017,7 +1017,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
>   #define PMCRN_MASK  0xf800
>   #define PMCRN_SHIFT 11
>   #define PMCRLC  0x40
> -#define PMCRDP  0x10
> +#define PMCRDP  0x20
> +#define PMCRX   0x10
>   #define PMCRD   0x8
>   #define PMCRC   0x4
>   #define PMCRP   0x2
>=20

