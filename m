Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3007626ejc;
        Thu, 28 Sep 2023 21:59:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/gc/vwVHYvW8ARMLqhEM1y2SVtPpF2HMiJcqb5O8mn9SpZBZi+gQhnzcgIRZlRHH5jiYa
X-Received: by 2002:a05:620a:2444:b0:76c:e2db:42b0 with SMTP id h4-20020a05620a244400b0076ce2db42b0mr3127570qkn.64.1695963565973;
        Thu, 28 Sep 2023 21:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695963565; cv=none;
        d=google.com; s=arc-20160816;
        b=Dhj6rc2ptdMGZP3vIzJQtpUNf/yIBcrfYm6Heddc9pXSCF0Z0P07SFdRpz+04ahr4B
         +gJkz/W0Q40Q2HB79TUssLFDHLkEtt9PqrLD3qn3tIaQPvqHj2fmfKW6qHPmLBZ3zqJq
         7bJacWGukR6cCkWtepwEVQ1n5Br+5rDe0SQfljzkQl/qo8+xDzGiEoUx4CgBMrPmlF0d
         riFq7446L5MyW0Bm+/8HSpXhZPE74/8P1rhs7e/zZjwpFKHRyhoaOPvPPkpHPeqH6ewW
         RhimeIYNMxoxjxDfRVWR2zzWjcsnsdr4ndyybxxeF65FM/iNQzoCZ+8hjJ7xk8xHNZUN
         8NIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=dItL0TvXfbuTtKqxkuHNARbrBHBLRVsgwGWFCicycY8=;
        fh=eK++/yuY1DfmC0FwWNnNY7mNAiLzTqe5xqtiB+k6JTQ=;
        b=y6CGCp8GA1muJhWBfNNr27R+pZbk3CyM2Vanp541FYCc5fTCvoS2n4vsGOsPdZFcQ/
         OgD/XfYxBF6rsiEfVkO2EtMJn80k1aobukpvoizvXzOJr2Fp0djtXjbQlG0aqYQG3DiJ
         BMMUA68je4NocWlCzEnD9J3CI+/WYzSOv7uj1Gvjiwvl+l8tAXn+mgV/k2hw209+AaND
         NCdAqBRG2mW1Prxgk1RtF+yDJHeRoh1qippQYn4NGk8gq71tht2Ka4ioTD0bgXeHDjfX
         FmXDahYwccwVfThSM/4dZ6mAGWa+yfC+gfiqQkChHOSL/fkcbUYy1oE9s9LONSRWhdYO
         YLtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ih4zLNNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a05620a298700b0077592c3366esi34086qkp.329.2023.09.28.21.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 21:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ih4zLNNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm5af-0006E3-32; Fri, 29 Sep 2023 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm5ad-0006De-Dx
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 00:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm5ab-0002ME-Qa
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 00:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695963537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dItL0TvXfbuTtKqxkuHNARbrBHBLRVsgwGWFCicycY8=;
 b=Ih4zLNNnqCnALvpPimAt9reZW7q2QoGh/tlAnMg7kKY/1MJJYD64Y8pebOg7KaKQ6EaQnC
 O8ShkQ4ujIJBZDawuFHOxrC7uKngzsXQoI7hfVIxZH4B/h5NP7zwsfKM/9AFEBO22dQuZW
 IVzMZ+dVtKhGY2ocVddQtDpbP02Tu1M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670--jMXBCxKNAu6iXwX-Pedjg-1; Fri, 29 Sep 2023 00:58:52 -0400
X-MC-Unique: -jMXBCxKNAu6iXwX-Pedjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6431F3C01BB8;
 Fri, 29 Sep 2023 04:58:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 368AA2026D4B;
 Fri, 29 Sep 2023 04:58:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AF7F521E6904; Fri, 29 Sep 2023 06:58:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,  David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 20/22] sysemu/device_tree: Clean up local variable
 shadowing
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-21-philmd@linaro.org>
Date: Fri, 29 Sep 2023 06:58:50 +0200
In-Reply-To: <20230904161235.84651-21-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 Sep 2023 18:12:32
 +0200")
Message-ID: <87o7hllgmt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: TqcwN/6diUrK

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Fix:
>
>   hw/mips/boston.c:472:5: error: declaration shadows a local variable [-W=
error,-Wshadow]
>     qemu_fdt_setprop_cells(fdt, name, "reg", reg_base, reg_size);
>     ^
>   include/sysemu/device_tree.h:129:13: note: expanded from macro 'qemu_fd=
t_setprop_cells'
>         int i;
>             ^
>   hw/mips/boston.c:461:9: note: previous declaration is here
>     int i;
>         ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/sysemu/device_tree.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ca5339beae..8eab395934 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -126,10 +126,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)           =
      \
>      do {                                                                =
      \
>          uint32_t qdt_tmp[] =3D { __VA_ARGS__ };                         =
        \
> -        int i;                                                          =
      \
> -                                                                        =
      \
> -        for (i =3D 0; i < ARRAY_SIZE(qdt_tmp); i++) {                   =
        \
> -            qdt_tmp[i] =3D cpu_to_be32(qdt_tmp[i]);                     =
        \
> +        for (unsigned i_ =3D 0; i_ < ARRAY_SIZE(qdt_tmp); i_++) {       =
        \
> +            qdt_tmp[i_] =3D cpu_to_be32(qdt_tmp[i_]);                   =
        \
>          }                                                               =
      \
>          qemu_fdt_setprop(fdt, node_path, property, qdt_tmp,             =
      \
>                           sizeof(qdt_tmp));                              =
      \

You don't just rename the variable, but also adjust its type.  When
we're dealing with at a huge changeset like the tree-wide -Wshadow=3Dlocal
cleanup, I prefer to keep changes minimal to ease review as much as
possible.  But it's sunk cost now, so

Reviewed-by: Markus Armbruster <armbru@redhat.com>

