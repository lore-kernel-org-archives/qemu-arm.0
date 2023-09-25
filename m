Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp278912ejc;
        Mon, 25 Sep 2023 03:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGczfvVALTo8B3X2OYgvF69a37yaehMUGodkWUTOtOtpvRph0zaukLeM9kaHvDWWptfeHwp
X-Received: by 2002:a05:620a:7f5:b0:773:db7b:26e6 with SMTP id k21-20020a05620a07f500b00773db7b26e6mr4747852qkk.52.1695637637363;
        Mon, 25 Sep 2023 03:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695637637; cv=none;
        d=google.com; s=arc-20160816;
        b=PSYbid87Synl3h9eF8ifTFfXZ06cb/oE91ckK/dAkuIQOUsGAx0s20bas2cyW9akE6
         QGTGQSuy6lHX/qAWlp6X36UVitBlfWzFQaJNZUKPAgLoNuIGVplsrxSIwyLH1XgNX/FL
         XUztmeQxggOiY+VY7CedqBhggYOvMSvPFcMQ2LCLdy6V9MmyatODZhm6xLX9E3RlQbfT
         bqnyaAXQB6ES8DYrtpO6RtV/MgNKDVUF99ss8jwM6X9ai3y60IGqxDU+KAALpx72n3gv
         WNGEfDQtb3gHeKmef4Cirzol4p2lgnGFr4Ocb7Uu/DLy6vow4NCvYr+3pq23Fyoofk9f
         bHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=/2xlzOxoYzOUyfvoqPfqBKT/PN7ylKqsVzVgaqkZs48=;
        fh=X3C9n4MgKwKAcdIz7pYsgXIgSm3f18hXzdSvlgMhT7c=;
        b=ZQbUQjHDMwNN6gu3964ZqWnsT+i3UUsdGd2SSK5HMrdcnz6nEoUgoedRorDWl8LC0e
         uUEowYtjF79njkK8U4pzlgGCSVaoe34pnAK8WGR+rqi+sXyvFuEni1MqMAjy4bG+i2nt
         yJ9Aulot7MVbiCK1tq2MU3thlK8J4E5kSGB3dGt5RLFGgfneAGED36Y8n10dgb/SXS43
         3x2RsKB62C+rdsmYywzR/wsfsVeUiLiziqXHuH2XkpFB+Na6znRH/rDpAFiM8oso4Zh0
         zTOOBs0GGi0W/VM884CY0yQ5A1FIeastDO3/7YBkDtj/4UcUMG0C8UlBFgd2TfrQnkLV
         +huA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNMkAupQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a05620a254700b00773ea7b80b9si5979397qko.676.2023.09.25.03.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNMkAupQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkinH-0004hN-M9; Mon, 25 Sep 2023 06:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkimG-0004UX-PP
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkily-0000qD-Eh
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695637500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2xlzOxoYzOUyfvoqPfqBKT/PN7ylKqsVzVgaqkZs48=;
 b=VNMkAupQTpKjpCzSb83iUk1arqvATOpIKrcpO3l/gxPyx+IvWUCtPDyrvQbJAhARxGywkN
 SByqUqf6T489GPBqCbTuHhVChBkOTfyf4TPH/cTTSuwWI/lm3wtLiiLHxF6dnOL6rZlnhe
 X4WFVOh/5Oj3QkeJib+ysuIWkiuQwqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-696-vPtgFpWSM4a6E67ACwto5g-1; Mon, 25 Sep 2023 06:24:56 -0400
X-MC-Unique: vPtgFpWSM4a6E67ACwto5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE3885A5A8;
 Mon, 25 Sep 2023 10:24:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E932156701;
 Mon, 25 Sep 2023 10:24:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB7A921E6900; Mon, 25 Sep 2023 12:24:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 01/15] hw/pci/pcie_sriov: Replace
 fprintf(error_pretty) -> warn_reportf_err()
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-2-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:24:53 +0200
In-Reply-To: <20230203145536.17585-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:22
 +0100")
Message-ID: <87y1gua6tm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-TUID: 21mGwzB6f+7Y

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/pci/pcie_sriov.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index f0bd72e069..93b0624599 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -196,19 +196,17 @@ static void register_vfs(PCIDevice *dev)
>=20=20
>  static void unregister_vfs(PCIDevice *dev)
>  {
> -    Error *local_err =3D NULL;
>      uint16_t num_vfs =3D dev->exp.sriov_pf.num_vfs;
>      uint16_t i;
>=20=20
>      trace_sriov_unregister_vfs(dev->name, PCI_SLOT(dev->devfn),
>                                 PCI_FUNC(dev->devfn), num_vfs);
>      for (i =3D 0; i < num_vfs; i++) {
> +        Error *errp =3D NULL;
>          PCIDevice *vf =3D dev->exp.sriov_pf.vf[i];
> -        object_property_set_bool(OBJECT(vf), "realized", false, &local_e=
rr);
> -        if (local_err) {
> -            fprintf(stderr, "Failed to unplug: %s\n",
> -                    error_get_pretty(local_err));
> -            error_free(local_err);
> +        object_property_set_bool(OBJECT(vf), "realized", false, &errp);
> +        if (errp) {
> +            warn_reportf_err(errp, "Failed to unplug: ");
>          }
>          object_unparent(OBJECT(vf));
>      }

We use @errp for Error **, and @err, @local_err and similar for Error *.
Recommend to stick with @local_err here, i.e. just

  -            fprintf(stderr, "Failed to unplug: %s\n",
  -                    error_get_pretty(local_err));
  -            error_free(local_err);
  +            warn_reportf_err(local_err, "Failed to unplug: ");

