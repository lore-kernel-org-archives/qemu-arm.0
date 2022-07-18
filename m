Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1327674lfp;
        Mon, 18 Jul 2022 07:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZirsem4dLdA+Pfx1MgJVFpNq4K3ySO6PkpGrOItfMr7OQpFGj4jqpxRM3aYV41cKjsyQM
X-Received: by 2002:a05:622a:1004:b0:31e:f963:4f1c with SMTP id d4-20020a05622a100400b0031ef9634f1cmr219073qte.429.1658153722794;
        Mon, 18 Jul 2022 07:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658153722; cv=none;
        d=google.com; s=arc-20160816;
        b=xAvhEvesDqvdkh2b/gqeWT9mn/NDOUI5vuwPe38th2fNB1GteQRjmFFgmJe1y3c/GB
         bIxKlUw/XFNE0YpkizhUBfoJ4afDu6td0bADYmc29tFY8uhxuPXwmlSqq6b90jvI0t05
         TitkQQdwqdhAhZ8tHRW8jb/B0KjyeLKfOE5984WRogUxagFqMyrKpNQWj7SZUuwb/q/e
         iJ1h7+0+ssdan+UaDN+CTTT3NEwCQ0kVWFOVw42RKvczxxW/ypRU0JK1sl066pmlJ2c9
         VFrwsD7o2WsWtkrGjJ+QEj2QEgqIX3sPnTJm9DzTUVA5gUggoNMAPh/h9hFaHT1EfHNv
         lUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=B9q1k9Gv9yic6Wp9wCsHzg+dbpjY+8XdBKWECT51bI8=;
        b=NGQrah9cwcQX6z/GIjYrvWz45loAZdesKfMYUwAVGv4k9jnW0cOrnnL2ymQ79o/GLz
         b8QYBcjfIu4SPn2Pj7hF0eKC9psBfcI2otIVFPpwm7qqco8owx/gDPsC68LAlLNyr4JY
         qF5ChqSHBbTErzygVOg23hxbPoviGPGy6pe2hW/2kXFvlSw9YFLM2PNaFy+ldeZWv+B0
         ehcv38QlOFc57OigzQ9bsJUDOevOr+tjLAsSXc4rT0jxIKHY+8pCE/V57eejuPht+e/a
         lQjf6NbSwGZ/k2S/NylPSFxnzCHSCJmlqOEoOcfzlVF3fCdDpSF10uwg/Sniw3Klq/a9
         KDaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3bEdd8o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020ac851c4000000b0031ee0653b3esi3190885qtn.241.2022.07.18.07.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 07:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3bEdd8o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDRWs-0001yi-9O
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 10:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRSI-00018v-Nz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRSE-0004n7-Sq
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658153434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9q1k9Gv9yic6Wp9wCsHzg+dbpjY+8XdBKWECT51bI8=;
 b=a3bEdd8owMQp/M6juJZQ5kcc0NZfYKLkN94Q7lbw4GtbaStptq6hXtJg80OlroTYAQdBSp
 8YsN17/qnn70ibdL1Yb5kVsdKeLAyrjmBD4wH0tJeqguiIJvVzR7Ru88cvlJlubcRvu5a6
 hmyWSgPtIeTIivThvrWG7+Jh61/cfh4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-_IG4QSf8MniGzM8uuoEZoA-1; Mon, 18 Jul 2022 10:10:27 -0400
X-MC-Unique: _IG4QSf8MniGzM8uuoEZoA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f9-20020a056402354900b0043a902b7452so7919120edd.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9q1k9Gv9yic6Wp9wCsHzg+dbpjY+8XdBKWECT51bI8=;
 b=ZGI9/Y3sceZgS95lgA05c84Z2CV1xFho5wpeD0NdG3A8qp9q21jEyyZQX2yBUp9vCM
 N8kotKSPT2ovTvMiPJFc5LYCm+uRCQMF/8MloM3pYkf7M7SiCTQ8wy9VNhbEjNEu4S23
 nDfvocaI2Ogp4mtkpnvGuTu0CgbNQVA0WurBPlgWDN3pjTZNP9cxUpexMRXd4jZ/P0Fr
 dW4wIj1VBNp+Jz6/n9dKWSJjvdsvAEQX/OROdWq9gxS+9LylzPdTLgyNUMmt/7ppaf6l
 /oqWKY8Nv4qvC2LrM3pLgxDfDnqddodZwnkzqhG2Ww0Hrvzg7ou453ISj2VDpRCeKKXd
 8Wlg==
X-Gm-Message-State: AJIora92TUG3YvrTojRm+vyXRfpmow0ysplAgsn73kuJj6uVqbXXS4+c
 F/rek+Frw9lwwLxx4QnHTHxUHt0WQtUUl0fAouiPUEI+WhdYfFWxp0BPtuclbm5am+2TcdNxU30
 x/bdVR06sjesjuAI=
X-Received: by 2002:aa7:c0c4:0:b0:43a:20cf:3c68 with SMTP id
 j4-20020aa7c0c4000000b0043a20cf3c68mr37688033edp.172.1658153425911; 
 Mon, 18 Jul 2022 07:10:25 -0700 (PDT)
X-Received: by 2002:aa7:c0c4:0:b0:43a:20cf:3c68 with SMTP id
 j4-20020aa7c0c4000000b0043a20cf3c68mr37688004edp.172.1658153425716; 
 Mon, 18 Jul 2022 07:10:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r24-20020aa7da18000000b0043ad162b5e3sm8652759eds.18.2022.07.18.07.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:10:25 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:10:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 5/8] tests: Add HMAT AArch64/virt empty table files
Message-ID: <20220718161024.7e6cf244@redhat.com>
In-Reply-To: <20220711104436.8363-6-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-6-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A/JkKNsTKbDR

On Mon, 11 Jul 2022 11:44:33 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
> ---
>  tests/data/acpi/virt/DSDT.acpihmatvirt      | 0
>  tests/data/acpi/virt/FACP.acpihmatvirt      | 0
>  tests/data/acpi/virt/HMAT.acpihmatvirt      | 0
>  tests/data/acpi/virt/SRAT.acpihmatvirt      | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  5 files changed, 4 insertions(+)
>  create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/FACP.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt
> 
> diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
> new file mode 100644
> index 0000000000..e69de29bb2

> diff --git a/tests/data/acpi/virt/FACP.acpihmatvirt b/tests/data/acpi/virt/FACP.acpihmatvirt
probably the same as 4/8
include variant table only if it differs from default one

> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..44594cae59 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/virt/FACP.acpihmatvirt",
> +"tests/data/acpi/virt/HMAT.acpihmatvirt",
> +"tests/data/acpi/virt/SRAT.acpihmatvirt",

