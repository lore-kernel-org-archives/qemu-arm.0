Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp596617lfj;
        Mon, 2 May 2022 01:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhgLWkYdo4R0QBFkPsyNoBgF6sQtcL0DRAZhmmZNBtlJmuqLAoQRw40XA7w0ljJt8UOMU9
X-Received: by 2002:a05:622a:2cb:b0:2f3:646b:54b6 with SMTP id a11-20020a05622a02cb00b002f3646b54b6mr9417918qtx.380.1651481588657;
        Mon, 02 May 2022 01:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651481588; cv=none;
        d=google.com; s=arc-20160816;
        b=rhmxdAns3tkIv+7fS6wedd6xbRsGuEfwahf0BWB04EAcYpU6FFJ2pK0oTPG8il46dd
         NN+QWvdL+v6v4qF5zugARdGZCcZrdTcwY6Mz1CRqJW3nrjnxZG4HU94sQfwfCWLGyDXc
         xUjiBHtYhQWN3FfIfn1Zc8qKEpjqy94GTZfMbDZgJ7NVvpin5sGHHIMum70BL8YnlJns
         NBMvCg34KVrc0tfB+IMXgkSim5V5oRYe/mynpCeGT2NksF34OAW+HolBQKeUcbRAswDN
         uNdMbAN+0XkzA6Sfb2JN5qZiUHOo3SDLprKWYIwFugx3BurSkrn6hJsQgyjcFSv0MePg
         r//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=6iOkZJydTZ1DDJVlNVVL1kQIvLd/w098yBufSKctp58=;
        b=NbDmqGLJVAoOOulQPFm+ieD2/C5qGZrIdY7GCLJHUXE/3WUCXwVvbysSYaBHv6bjih
         w1Q40SjZo/i/ENW33p1JNRsn1JbZ2YZSiXlyyd1yBNSxLW8xoPkA6oRAOian+jXej0mh
         hinTVJOZ0g7CJN12fZLJqyWrOy1//Hk1Pmif8IA8yV6zJEmiHnlC1Zi9ePP3WAW7hIeh
         uApAdLux1OKyFRcOAceMmVY22L/SbmiBdJFCNu8DUa1KqGeBGuZc32IOZ94/7N8LNS7z
         Wt6cumZmLOS89ddgRPCLhgpreBuwQqYh28tOPgZ7Gj6R/GoNey8o9wvQgwEl9xpsezRf
         8vxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LOwmEmwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv5-20020a056214262500b00446123fcd4dsi3069433qvb.446.2022.05.02.01.53.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 May 2022 01:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LOwmEmwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlRno-00013E-1J
	for alex.bennee@linaro.org; Mon, 02 May 2022 04:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nlRnN-0000xE-TJ
 for qemu-arm@nongnu.org; Mon, 02 May 2022 04:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nlRnM-0000LS-Cu
 for qemu-arm@nongnu.org; Mon, 02 May 2022 04:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iOkZJydTZ1DDJVlNVVL1kQIvLd/w098yBufSKctp58=;
 b=LOwmEmwXwaM6rJwnWEx0oX9J/kAFKvzu5jg4t85+pI9z2RmKRX+kvmjGIkLWghFFEA/Kld
 CeIdjBYp+MYqEZ/+4Nlj2oJ4eTb8Gkj3gfhLkaGUzfqw65Ql6uuw1nGZ9espCiHUSUuwZl
 uY1Yr8g1zlIOSrMGZCRGqqE2JrtitRU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-0FLj6zU_MACKon5Td943vg-1; Mon, 02 May 2022 04:52:31 -0400
X-MC-Unique: 0FLj6zU_MACKon5Td943vg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p32-20020a05600c1da000b00393fbf9ab6eso8746892wms.4
 for <qemu-arm@nongnu.org>; Mon, 02 May 2022 01:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6LTA2/dze/7ZUghvqKYPOWZc5bHVhq3ikE2h8oasSR0=;
 b=Bc3gWWmQ5x4LIZodLIqFSOCsD+FEgY8sqkXZfRaGPDWEfr40lgvhU76Jl5UXcz2pOI
 ZfLlhoYxwqfzTimRctU8e42hq2p8SUx3tTHs30BrQoY5q9Gjk0IVbXkfAXjOB3EmdzUC
 f8MmYczlhTpMbBWrCCBUEQL5g7riPQAIdpipuFjGJ0rNnm8/vDGkqx7IXWVCGCAJS9Ws
 LWsdG/rsBckJXfv3xBAxXGCg5QFdf19mtVfFuiw4AuXlxKMhEPb3+PvQh/BLFR1f0S8s
 UWmdzdVhdj2dmKTF1QL+QRIKGO3pZp1sskdk2VzuKp8DmwkJwcKw7wu+jTmWGesyQ70K
 4Fng==
X-Gm-Message-State: AOAM532n6HLiKW/AwC3toGJ6ucBP6UW8JBTQJfAY5mk4hiDGW84iNufW
 ucBQCXkrz6t46x3SUWqwWdHfAbf4XB+kTm5D/rDkuoLQlc+lZoL2nUevAN20ARFt688Fb58ghN6
 pKy9hsnop1QUR
X-Received: by 2002:a7b:c446:0:b0:394:3293:a88f with SMTP id
 l6-20020a7bc446000000b003943293a88fmr6370008wmi.22.1651481550284; 
 Mon, 02 May 2022 01:52:30 -0700 (PDT)
X-Received: by 2002:a7b:c446:0:b0:394:3293:a88f with SMTP id
 l6-20020a7bc446000000b003943293a88fmr6369970wmi.22.1651481549899; 
 Mon, 02 May 2022 01:52:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s18-20020adf9792000000b0020c5253d8e1sm7837492wrb.45.2022.05.02.01.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:52:29 -0700 (PDT)
Date: Mon, 2 May 2022 10:52:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v8 2/5] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
Message-ID: <20220502105227.0146dcce@redhat.com>
In-Reply-To: <20220425032802.365061-3-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PcM1uYlYq8KH

On Mon, 25 Apr 2022 11:27:59 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The CPU topology isn't enabled on arm/virt machine yet, but we're
> going to do it in next patch. After the CPU topology is enabled by
> next patch, "thrad-id=3D1" becomes invalid because the CPU core is
                 ^^^ typo

> preferred on arm/virt machine. It means these two CPUs have 0/1
> as their core IDs, but their thread IDs are all 0. It will trigger
> test failure as the following message indicates:
>=20
>   [14/21 qemu:qtest+qtest-aarch64 / qtest-aarch64/numa-test  ERROR
>   1.48s   killed by signal 6 SIGABRT
>   >>> G_TEST_DBUS_DAEMON=3D/home/gavin/sandbox/qemu.main/tests/dbus-vmsta=
te-daemon.sh \ =20
>       QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-da=
emon         \
>       QTEST_QEMU_BINARY=3D./qemu-system-aarch64                          =
             \
>       QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D83                   =
               \
>       /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap -k
>   =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
>   stderr:
>   qemu-system-aarch64: -numa cpu,node-id=3D0,thread-id=3D1: no match foun=
d
>=20
> This fixes the issue by providing comprehensive SMP configurations
> in aarch64_numa_cpu(). The SMP configurations aren't used before
> the CPU topology is enabled in next patch.
>=20
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index 90bf68a5b3..aeda8c774c 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli =3D NULL;
> =20
> -    cli =3D make_cli(data, "-machine smp.cpus=3D2 "
> +    cli =3D make_cli(data, "-machine "
> +        "smp.cpus=3D2,smp.sockets=3D1,smp.clusters=3D1,smp.cores=3D1,smp=
.threads=3D2 "
>          "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
>          "-numa cpu,node-id=3D1,thread-id=3D0 "
                                ^^^^
make it sensible as well, i.e. socket/cluster/cores-ids ...

>          "-numa cpu,node-id=3D0,thread-id=3D1");

