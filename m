Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp283667ejc;
        Mon, 25 Sep 2023 03:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUtJGE0GI1/8Bl7DCrNFXJJpL/m8Avf4VGoE6RFBlVlKkTzWjO0CipvlsHMNHuZSa9CGft
X-Received: by 2002:a05:622a:1116:b0:417:8b47:8486 with SMTP id e22-20020a05622a111600b004178b478486mr6713396qty.34.1695638272096;
        Mon, 25 Sep 2023 03:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695638272; cv=none;
        d=google.com; s=arc-20160816;
        b=yIuXfIqQGOAFiMavycI5hHGYzIgI0u+LdFlu+L5NU+hIaEbMTPY++EcUa6/c7ZMgR+
         xCtV6NINX5wSX76TF4AmAudV1j5CyABVVrEJA2xjWo87o8/WS5g8V0JJRS64s7n1Tn2M
         sQuzSVyXX9jK6/recaZbIH75TvFfOOvgfIPeXBbS/sx6BQRLY/EoWPBB9IWoTDPeXL43
         T0dZ3vgnwiyjtzxjMLMVcpBc8UNlfmFe2k8yc1IYRzWaLcSNJBKxYLsXdCtqpF5RRJpb
         jEm1MwK+ZucwJOhjZYguZC2lt2In+n4VZ61qxBrdydiqPrx8sshZHrL/Z7t0RTeUi2m4
         rsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=1boY5ZOfKlau9YDeKGe8IggUuSU8P3ufLqZdxmZfpDQ=;
        fh=0oQb13f7w1hAJ//3ClqbYbL+TSSX086iPZpT/Yq/pz8=;
        b=Gc6s+80jVPDTgxO4sP2LgjKMUosbK2T5O1/PHDPS8IKnKR5gKpRG3rLy7JS+mb/Ijs
         6c4+NBEgUwzljinOX6JvcRz1FMGc8+5u9fbKrFucmIVJsuORN86YI/7V4oX/hO9YeroW
         drlDB8xzTdEK9Y0FVxY73ZUPp//EhHo4Pru4X6itvbAmuiw/tf75Q3ARFXWtp8iOgmJI
         /RdqXJifgFJrjaNMBrkvmsoO2C28eU/yuMfc15Q4MNmIG/O+aO3EUDwbzYy1Yon7TRvU
         6W1qWrRoT+Ewbgr/3b5832mY6JxW0fhxvex/+GbHdvkRBPGR7Dh6XMplKetglCNaOx9F
         GuMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XHe8zMQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hx18-20020a05622a669200b0040fdce653bdsi4209305qtb.318.2023.09.25.03.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XHe8zMQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkiyE-0004GS-9W; Mon, 25 Sep 2023 06:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkiyD-0004EI-94
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkiyB-0003XR-Ua
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695638259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1boY5ZOfKlau9YDeKGe8IggUuSU8P3ufLqZdxmZfpDQ=;
 b=XHe8zMQFpu6KV8QsWgY/9RG+e58mz0UuEdqKFqirj0Nu0CtL4PLsgLDhTW3k+BZpxfjFd2
 jBqLW8X26q7YFesI93PnrDCPBhY0gcxfknuMt3DNbgaj9PJqjCiXWTx7zSEYRZxnbI+AfP
 OjMaz3MmwIjyVZqXnagwWASSLiqVJrk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-DSenTUfPN0uLOa_Dti0YFQ-1; Mon, 25 Sep 2023 06:37:35 -0400
X-MC-Unique: DSenTUfPN0uLOa_Dti0YFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F86B811E7B;
 Mon, 25 Sep 2023 10:37:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7AF40C2064;
 Mon, 25 Sep 2023 10:37:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A174421E6900; Mon, 25 Sep 2023 12:37:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>,  BALATON Zoltan <balaton@eik.bme.hu>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 11/15] hw/display/sm501: Alias 'dma-offset' QOM
 property in chipset object
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-12-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:37:33 +0200
In-Reply-To: <20230203145536.17585-12-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:32
 +0100")
Message-ID: <878r8ua68i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O7U2WmqW4pA/

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> No need to use an intermediate 'dma-offset' property in the
> chipset object. Alias the property, so when the machine (here
> r2d-plus) sets the value on the chipset, it is propagated to
> the OHCI object.
>
> Note we can rename the chipset 'base' property as 'dma-offset'
> since the object is a non-user-creatable sysbus type.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This has become commit 6a015046606ebf260950605ec48fc6420422f43c.

