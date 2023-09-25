Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp283578ejc;
        Mon, 25 Sep 2023 03:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoGppo+MIMGZSuH8IPHko0kgBde8bSkaXu0SysGKkqhm2BShAiy6blDXGhH2t0HHiZq+zU
X-Received: by 2002:a05:622a:118f:b0:410:8873:aca with SMTP id m15-20020a05622a118f00b0041088730acamr8647315qtk.52.1695638258877;
        Mon, 25 Sep 2023 03:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695638258; cv=none;
        d=google.com; s=arc-20160816;
        b=PC95NfjACTiHE+vLu4qL5P6fVcII/LnvQIxBB68OiuMTx7PtrDchyG3FZkzNwQ9/qH
         Lh283siXKhjfqzVrlMrc8gOrbfTjYVEYDXYBv1fluQHIhHjflFFXolfEYcbmWavlK3aR
         RaOu5BqfSHv8LIq4IS/3LnstCz3Mjtjst+DiBqY7YTMzCVW2DktEr2+oDTwuFzkwW9id
         wJB8nPudSjrZoFoS9q/3hS3IEWNC9fjMm8dyNoQH3FruegMT3CE5jOLMcUGHrMrinoKH
         e4NWoEhdCEo5aeYOMDAT62KPZIBYvJnIshi6T+dwSs1tOcDk2RN2sg62HvcReLanp4Jv
         g8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=dVYQymSKA8wS4L1ncGOwSn/xhtFdgMf+Jo+hqGQdN/w=;
        fh=VZNMYcowzgm9rn033PhlQG0GANWytFZ8tvvlhIK97to=;
        b=xuWtaMPcfco51q3XQyNx+1w4yvwsA/xUT7BC+LkWmcDqPY3IKn+VPnbk/9iUQG+Ev9
         k2PRZ30RoQXIRXc7JdWza06VTUKd82erImSogbyDkuokRYttHjerkedqml11W5EUWZNI
         VyzrK5/Y/WOLU1jtc4d5wf0hVzkjTHREejiCdOchBm4cSqJBXIETRZNtNkAn16+bg1b4
         VNF3BkXb8AqmzUPkrA74S/pFu7yElodBCDJquD8bUdfctx7xlzhSIZzc2qIDd3h0ekLB
         KIJ+vvdNyVCBN3Zm6VU41ZbSmrFq5jZBgzG+ucEh1syXQVcNRUvaTzHXldflf0wrRIb5
         HW8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OCqgcJ9C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a04ce00b00417a02aa226si1021095qtx.707.2023.09.25.03.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OCqgcJ9C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qkixw-000475-8T; Mon, 25 Sep 2023 06:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkixu-00046C-Sg
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 06:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkixt-0003VO-GN
 for qemu-devel@nongnu.org; Mon, 25 Sep 2023 06:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695638240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVYQymSKA8wS4L1ncGOwSn/xhtFdgMf+Jo+hqGQdN/w=;
 b=OCqgcJ9C1ohKjKuqYmYu7SFg8BTe8oRypEsqhkqjGtbIZxNPkbdQ9/pApju1aMjri+dZ2Z
 q3E3iJsYmcSgeq3luC14a9z1CQpj0eepdwC8fBAaHbIVJo+bYu80e4mdtKYXNDDZpWcMOw
 vY7KGbWf25Oq3JjobABwD2V6GVOJr5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-xi2o-0etPqmzCWH3Tb2OnA-1; Mon, 25 Sep 2023 06:37:17 -0400
X-MC-Unique: xi2o-0etPqmzCWH3Tb2OnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 104D3101A529;
 Mon, 25 Sep 2023 10:37:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E028B2026D4B;
 Mon, 25 Sep 2023 10:37:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DFB7221E6900; Mon, 25 Sep 2023 12:37:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 10/15] hw/display/sm501: Embed OHCI QOM child in chipset
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-11-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:37:15 +0200
In-Reply-To: <20230203145536.17585-11-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:31
 +0100")
Message-ID: <87cyy6a690.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WnDdKOkXuVzg

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Note this device doesn't implement unrealize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This has become commit 01c400ae435f911eaf575b016090922c074dc1e4.

