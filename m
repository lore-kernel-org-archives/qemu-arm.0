Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3200974lfc;
        Mon, 1 Jun 2020 08:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcTRXeAyKkEr4IwAOEtFJpPQcp7DU/rfwgq6i76la26PX514Ig6reW9Ulo2GTxvWBuoKJf
X-Received: by 2002:a25:c08b:: with SMTP id c133mr35133867ybf.286.1591025099164;
        Mon, 01 Jun 2020 08:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591025099; cv=none;
        d=google.com; s=arc-20160816;
        b=VMHNZB2eyfei8dHxCX9rQl8CVsLzueVbzPe73W7vrjql/Dv8s8IqMUM6jd9nKNU/RR
         hNH41nE2Qw8XlCfTzTXOe5Wh5nknNlX7Mp87j6/b9nA0OdYDS/28MjncsQ7PyMwKbbL+
         fKvi752FNbeXv47QZpqe+s4RbPqtBosq7ELv+RNcf1jbJijAF/BUwmEEj84hdz8bGR/9
         2dzMWXz7jC/cNNFY3/FymbsxyOKgtrV2hQaqiw/DLf9U+J4/YQhjFYH8StvFs50a+GBI
         fT/PR5iI4HhC/TqHv8A/CfTr8KyUXbUEpHB4ovYTYNChVWpbHGHYnuwrwsAa6JMdGaAE
         U8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:thread-index
         :content-language:content-transfer-encoding:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:dkim-signature;
        bh=sxANU6nbFPCt0EhXkd5ZBvlOX0EDFxgYbGWL2UQmxw8=;
        b=myh3ANpSuKmmMzA4gp0eohAsmfJBk27iNv5I+VyFDlxWnLywvOhwyb7HUhEVXjrg4+
         Vo3buPGQ8RM+3Uqe7NcJmVfNUMrJXTq6gYkH7WLHOOPZz1eBGyWGjXCvMiK11V59U4ct
         DyJcsGdes21VpcIC/Q+HW1tc3UwfOmUPkeFRnC6hZ732k4TlJhwkF47L7Ugajrr94Z37
         lwJCKDL7PH1ivCFcQRCGRXR7THwuaPxfjFeH21X4aKT5M7MGpMUYvusMd5NoIiXOAWnT
         LAGtDewzC+hJWo1JTECTx12c0kSpgeciupKL0cwrs9FfRJyRkJOOop/pme7aeUYHDhkX
         5AeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aT3meGZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si4515358ybo.213.2020.06.01.08.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 08:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aT3meGZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfmJ8-0000Cb-HO
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 11:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1jfmIy-0000A8-RI; Mon, 01 Jun 2020 11:24:48 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1jfmIv-0008Nt-5d; Mon, 01 Jun 2020 11:24:48 -0400
Received: by mail-ej1-x643.google.com with SMTP id k11so9561974ejr.9;
 Mon, 01 Jun 2020 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=sxANU6nbFPCt0EhXkd5ZBvlOX0EDFxgYbGWL2UQmxw8=;
 b=aT3meGZ0q2O+/DvzNa1eI9jDNeDtfDBNnfp+nIxVOlgm3PenOJbYLI7lnI2kRdwtqT
 2ozqN1dNVccR2WJJWJedL5075rx7h3jHQRj9PMCuXauiit5mWhoj/ANlWEOEUYsLa5um
 3q4/399Wca9qZR3JnB1/RuLF56gFuzJfx5BSxpZdN4QqFlIYwhqHimJjYuKpjQnGfpGx
 7qqRQ4b653H3zZcHr8GfNddHEKlaxu/i6fLVM1xLE1O5w3ptajY8S1E8PT/SCxMJLWRj
 LN6mvLaPxW2x3yIW7IML7S4HnFdVOzNJ8gGp1+/Tznw+ys1adjB4yMdRIaZ4kEMGceWh
 0U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=sxANU6nbFPCt0EhXkd5ZBvlOX0EDFxgYbGWL2UQmxw8=;
 b=Jefg6hypXpgchgrht3RvNJ/Cvia251Uv98FrLBJhVf+WIVHsSydYS8bdlUyxHuUJ6o
 GovXRlUj3eq2fKDc5QOYl//B5SxaGRL/FvvNE0wrk06pxSKhbslKBibVD8fouMhQbeXb
 8OhWYCdcag52tuBlD0ki1jlwXa03v4bnM0qMxQRz96Oi7+JateGlnOgjWX41+vss0jsR
 yz0j49vA65GvITO4j4O7qMJyMgNW2szVAvVZZ4h/MjpNWbjxPpCswFyNHvcKJFUKMZ2P
 Od3jQFdq7O0spqeN0IjOgV9POOQUghqNGtTty2w20QJlP+OUWkRTtm0XVlgyVIayUSxv
 WXLA==
X-Gm-Message-State: AOAM531P4piAw5UwZoTUWWKP+obIFCApb7yBTbXga+bTdmd23a+QwkiC
 nA3XrPlXNyI5HMeQOJ0MXkE=
X-Received: by 2002:a17:907:9484:: with SMTP id
 dm4mr21098613ejc.56.1591025082794; 
 Mon, 01 Jun 2020 08:24:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id b21sm9163015ejz.28.2020.06.01.08.24.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 08:24:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-8-f4bug@amsat.org>
In-Reply-To: <20200601142930.29408-8-f4bug@amsat.org>
Subject: RE: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix
 definitions
Date: Mon, 1 Jun 2020 16:24:40 +0100
Message-ID: <001601d63828$c5b132a0$511397e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF4w9KWcHxvvYD3VioCudSt4ChIBAL7l7qKqWbtDxA=
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=xadimgnik@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: paul@xen.org
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Eduardo Habkost' <ehabkost@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'Helge Deller' <deller@gmx.de>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?'Herv=C3=A9_Poussineau'?= <hpoussin@reactos.org>,
 'Joel Stanley' <joel@jms.id.au>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 'Richard Henderson' <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bsVhkaJGiG5m

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> =
On Behalf Of Philippe Mathieu-Daud=C3=A9
> Sent: 01 June 2020 15:29
> To: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org; Anthony Perard =
<anthony.perard@citrix.com>; Paolo Bonzini
> <pbonzini@redhat.com>; Herv=C3=A9 Poussineau <hpoussin@reactos.org>; =
Helge Deller <deller@gmx.de>; qemu-
> arm@nongnu.org; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Michael S. Tsirkin <mst@redhat.com>; Eduardo =
Habkost <ehabkost@redhat.com>;
> Paul Durrant <paul@xen.org>; Andrew Jeffery <andrew@aj.id.au>; =
qemu-trivial@nongnu.org; Peter Maydell
> <peter.maydell@linaro.org>; Joel Stanley <joel@jms.id.au>; C=C3=A9dric =
Le Goater <clg@kaod.org>; qemu-
> ppc@nongnu.org; Richard Henderson <rth@twiddle.net>; Philippe =
Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Subject: [PATCH v2 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix =
definitions
>=20
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  hw/i386/xen/xen-hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 82ece6b9e7..94fe5d65e9 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -9,6 +9,7 @@
>   */
>=20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>=20
>  #include "cpu.h"
>  #include "hw/pci/pci.h"
> @@ -230,7 +231,7 @@ static void xen_ram_init(PCMachineState *pcms,
>           * Xen does not allocate the memory continuously, it keeps a
>           * hole of the size computed above or passed in.
>           */
> -        block_len =3D (1ULL << 32) + x86ms->above_4g_mem_size;
> +        block_len =3D (4 * GiB) + x86ms->above_4g_mem_size;
>      }
>      memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
>                             &error_fatal);
> --
> 2.21.3


