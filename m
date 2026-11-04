Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965C606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=StO2NSPF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOUoC-00014d-6A; Wed, 04 Nov 2026 01:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xOUoA-00014E-IV
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 01:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xOUo9-0002rM-1g
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 01:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793774955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwJzUsJ3QPjsEzmyy1ZgS7781kS5066RCde09YWteg4=;
 b=StO2NSPF9JfjBwbvAxy+HlMgwrDJZxxrnCW8K8xf02ri3t6O1XdcRc1vn/vQnylOyb0imi
 /4m7A2tO1GUWqbk85HkF6qpSkobdd/I5Vm+PKYa+NImx4Bg8TRWNgJJlL3sy01HlGRHJLC
 XrPDXckxdOdUA7A4g0x1CpDW2VwwU+4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-gGcpMOZbPeuD1k8cXPRWcQ-1; Wed, 04 Nov 2026 01:49:14 -0500
X-MC-Unique: gGcpMOZbPeuD1k8cXPRWcQ-1
X-Mimecast-MFC-AGG-ID: gGcpMOZbPeuD1k8cXPRWcQ_1793774953
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cbb92868263so305141a12.2
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 22:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793774953; x=1794379753;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gwJzUsJ3QPjsEzmyy1ZgS7781kS5066RCde09YWteg4=;
 b=qMBZJutG8Tb/CLdZVBhPKW+BC+riqq5QCm8YJ3Os+FOrlBy+nmpnRgoWF+fA8rtq4N
 2LQq2JP9UM/c6aW1unqt2kNQCqA8nYxhUcB5xY4Z490FeMBP3FbgoNdPFVZRAH5J0He3
 0GVgkcTjAMuDPKlUOlWpp7AnOMjR2xMobtDHabOPSBo1B/lLFr54v/aQzX3XDlHPLOvl
 6zzj90+8ULWwLgt/6QC313hgQuGmCU7fPBhKosKBV7f8LueVsgwMcDDpFKY9b3a6uRkS
 8paz/nd0bjNxZTXoOu3JexQcVbvVWlt+GnQoilz4H/UZtiu3UxDef34Xk7a2mqePjO7m
 p8Zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1A4KSOo/KPx1QlWsAkKE9+50wyEwq9TiIkg4RB9Uh+xskzm9tb26NncReZLIEYVQi/0ZevV4VAQ==@nongnu.org
X-Gm-Message-State: APuU4Z/cCNYqzZWMZYpxVjtipt+JDY+w1rdRuxJ1r/176LfteEpxYWiX
 PgP8hNA3QzsDXlA10dcAcXj2dNe7JjkGZ0nLy6NAU45Vye3YlLzvpAMK/vaK83nK1kilTWfOGE5
 4ILAAvqgcCQtcTnYUFNGDcRMi3N8ygljyoiy469aXNWgk7g7zjEW5NNpkQVCJXLAXwx65jigGKF
 0UmmYD+cKtIHQhLdLyc+qLY0zzpVsE
X-Gm-Gg: AYBFou0MwLBaLzEm5sztGjkyMnM0pWL7ZR6CeaM947o46xwdqmu7+VjNl31BuEXnbKB
 pTyRu3FDMB0bZCzQnJDHmMaQqV8r4AylDId9ZqY60dniN4NbpqUJHrAgecq8bnQ0dAhVrHZgOi1
 uhPFTmqQrVes+Dc4VakjZR5UrcyxBj2wmv2OdxDPiSXUl+17oxVLehDzyT8tIIPCKpGIYltW8lv
 4QKCuHl5Q60ILARDtnLOjPZj8aZzWnWpCxplvaup7UAntbZaBCkbOJWFCiF4cvZTj+StqCRW3Hr
 CA==
X-Received: by 2002:a17:90b:1c87:b0:3a8:195f:186 with SMTP id
 98e67ed59e1d1-3ae897ee656mr11491912a91.42.1793774953214; 
 Tue, 03 Nov 2026 22:49:13 -0800 (PST)
X-Received: by 2002:a17:90b:1c87:b0:3a8:195f:186 with SMTP id
 98e67ed59e1d1-3ae897ee656mr11491900a91.42.1793774952714; Tue, 03 Nov 2026
 22:49:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104064552.959862-1-armbru@redhat.com>
In-Reply-To: <20261104064552.959862-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 4 Nov 2026 10:49:00 +0400
X-Gm-Features: AclHuK9EVAJpRvnsMFITX85Qwp0kaeJKLiP1vOhhg6X9NUdidUcCWW2YlzDSWx4
Message-ID: <CAMxuvazeBBja=n5htpB7kRn0QtMjjLhTLnAwbt+L4Xa2M7-AbA@mail.gmail.com>
Subject: Re: [PATCH 0/4] qom/qdev: associate properties with QAPI types fixups
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com, 
 milesg@linux.ibm.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YmxwPJ1AErQNBWOPURAprzjHF-7_vvAobeuVw8n_xW4_1793774953
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 10:46=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Marc-Andr=C3=A9 missed one property, I lost two in my butchering of his
> work, and we both missed alias class properties.  Not too bad for such
> a big series, I think.
>
> Markus Armbruster (4):
>   target/riscv: Fix up PropertyInfo to set @qapi_type
>   hw/gpio/pca9552: Fix @type of pca9552 property led<N>
>   hw: Fix up PropertyInfo to set @qapi_type
>   qom: Convert alias properties to QAPI-aware registration

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


>
>  hw/gpio/pca9552.c  | 5 +++--
>  hw/gpio/pca9554.c  | 5 +++--
>  qom/object.c       | 7 ++++---
>  target/riscv/cpu.c | 1 +
>  4 files changed, 11 insertions(+), 7 deletions(-)
>
> --
> 2.55.0
>


