Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2217676lff;
        Mon, 14 Jun 2021 11:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHypf4jBnk0su17Y6xgAbxDSpCsulHTv8+TEuhgiFnlMtXjSjp4DLsFK/uDvYKYYjGCUjJ
X-Received: by 2002:a05:6102:2330:: with SMTP id b16mr996427vsa.4.1623695732554;
        Mon, 14 Jun 2021 11:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623695732; cv=none;
        d=google.com; s=arc-20160816;
        b=jy+qcxT55bPp3s2LwqVk3axdwn1x6sIx2EdNC4E72OdEstUnFVU4d6neIqUrCCpR1H
         d+zGDdD34fnyEaDzl3kK0GSuXP1WWRFHXHq8ToK4Q060d39IMGCjOxdV1FC70JqP9hIZ
         q9506nD3m3E/HRHRHLt5HoI8jfyNCPhYYSjUxZaEBx4ntflgrybcSa2QMrqvzV0tvyVb
         16hn/glOreztRPdWQW8rIvz4idXnC/qFG3RCYIMOvTgExynMv0LMFv/AH8wyq3RhARhe
         fAow8exezAeuxJELztsAxUx6PwuU4IUleudr2Tr6OcCpnitc1fmGsAl0DnGNukIW40kr
         fCBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=i6au0zli2DyDeiA+G44i8BacBqoJD4SVV1zNjdo/H2U=;
        b=QdLffmrsj9nBBFbFOQW22a+cxbtaSJqE6wonmmXN/cc9sRVIg5UjLf/sEPGgHm/Tyz
         Yu7JgPuyLjcHVnx1FtWJmymhdo2gXC7TMNW7hW2pWYAhhKZ/Gc0dWz2JXQ3EHx+qIprY
         5bkOw14CU2DmB92cdRSPzf9J3tjTKyAIy4ERUgKbXcEsXmL5i3Qd89czQUAA7/Lmi27z
         4nWTrJbVcRxpZ2GrdgZ36JR4Sg/XlcqM32NViQQ5joYHI34hfUlm823VnZPkJQoFh1pZ
         lvry9/+APqZ9V6GY5IMQSYvcHE2cVun2qJYOsIOPsF26cNUoTfzY9jdRFCFwUYvdUmML
         iEpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b="Le/otDfp";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Y6x1rXQA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si7670333uaj.168.2021.06.14.11.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 11:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b="Le/otDfp";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Y6x1rXQA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsrQp-0007DW-Mb
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 14:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsrMy-0005XT-7V; Mon, 14 Jun 2021 14:31:32 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsrMv-0000tp-JM; Mon, 14 Jun 2021 14:31:31 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D5BF5C0044;
 Mon, 14 Jun 2021 14:31:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 14 Jun 2021 14:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=i6au0zli2DyDeiA+G44i8BacBqo
 JD4SVV1zNjdo/H2U=; b=Le/otDfp/PiTGsVpDuK9eOVA3AJh/HjxDBtCw6MA+d3
 sCv6nkioFbreGQWH9g6GNAo4bZegCFfIT8nJsoErw02TulpAACOXA6M0OynT+MQL
 9o49DdOQ4iQ0aZwmoSviIP/3YTNesnwRjG7f2Kl5bnC0PJCtuQPYXnX5e9Gt53Y1
 d1UhqSCDSx7L8jeySZM3ckMj+0+3cTC75Bp5zroDViXSCtyUGHfOFRg2oGlVr99M
 GFygXBEZMusAZRNk0ZPzboWnBYRyhIMEabSHrG/BrwbcYZp5H96S6Tm54QWV3bA2
 Z2PViD1Ok6PkHB3OenZVmkPlE4gxZzEcThlSwAvfuew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=i6au0z
 li2DyDeiA+G44i8BacBqoJD4SVV1zNjdo/H2U=; b=Y6x1rXQAGWRIzX9QVaCrSP
 r9WdS7/OojHNXhDdp3bKFhyEERvDY9hyaBtZJGOxabrzZ328bRqEXhExzCk7bx9Y
 b5ZisoRcsyNYRwgxLzdzNNdjSd3C3O0zl02ZgUzkcFhPXGPO/L6sJz5NgqY49nNG
 8btgCojeB4arm8vH+0Lnqk540430nFjdeR3xf2Js6FmWAlksvFdRPS9Kdhk7Ipds
 BbCZAr2a4NsKVkxxgJ5/NO67k3ml6EI/YNoEtaYMvd6ZKsjez5A2PM1pvo+JSm1H
 YJ4MC6aaep02G+skZFBwTlSFsuloxVxe3fG0NlcDQwVxZlFhWAY/qbF++NGdhlVg
 ==
X-ME-Sender: <xms:fqDHYHeq3DMbYOFHRtc1dn3B0iijMSXkE2nmpdhdTaZii3_SmMBZuQ>
 <xme:fqDHYNOaxfW7C3rNu5wkl04nEBi7Nd0noTfy1FyKRRUgEebTeF0n5iexPlDIfbCu2
 rF05zqoNrXD29dMcRQ>
X-ME-Received: <xmr:fqDHYAjWINocMNPreGy293P59ZMx2OB0hNaczYbXvrY-X3GPicJ2_Jz7YvHkMDYROLz-x2kcndTYuo0P-W1xBpggp3fPb7vi1rEcHVdcc0vXyp6KSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:fqDHYI-9ieTObdXNV9dDGzBNeLU51ROmYiOuxjCXHevANDK_cZqCBQ>
 <xmx:fqDHYDv0Cw3JFr6tySCafUvOkzDGOseDnueuijdb9ESyr2ePOUGF8w>
 <xmx:fqDHYHGbzhy9_Rzqyd9wcEnv-ey0lJGvKR7JcvMK9MofOJA3LHPYlw>
 <xmx:f6DHYM9_Zyy-A4viGjuEu0LfMIxlzZxvrjjBGaca0Je_U3AERmV8Qw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 14:31:24 -0400 (EDT)
Date: Mon, 14 Jun 2021 20:31:23 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v2 3/3] hw/nvme: default for namespace EUI-64
Message-ID: <YMege+mwy768d/Uk@apples.localdomain>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
 <20210611234631.81314-4-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R21P43LCfRwuxcmB"
Content-Disposition: inline
In-Reply-To: <20210611234631.81314-4-xypron.glpk@gmx.de>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VzgSpErGqHUY


--R21P43LCfRwuxcmB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 12 01:46, Heinrich Schuchardt wrote:
>On machines with version > 6.0 replace a missing EUI-64 by a generated
>value.
>
>Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>---
>v2:
>	new patch
>---
> docs/system/nvme.rst | 2 ++
> hw/core/machine.c    | 1 +
> hw/nvme/ns.c         | 9 +++++++++
> hw/nvme/nvme.h       | 2 ++
> 4 files changed, 14 insertions(+)
>
>diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>index b5f8288d7c..33a15c7dbc 100644
>--- a/docs/system/nvme.rst
>+++ b/docs/system/nvme.rst
>@@ -84,6 +84,8 @@ There are a number of parameters available:
> ``eui64``
>   Set the EUI-64 of the namespace. This will be reported as a "IEEE Exten=
ded
>   Unique Identifier" descriptor in the Namespace Identification Descripto=
r List.
>+  Since machine type 6.1 a non-zero default value is used if the parameter
>+  is not provided. For earlier machine types the field defaults to 0.
>
> ``bus``
>   If there are more ``nvme`` devices defined, this parameter may be used =
to
>diff --git a/hw/core/machine.c b/hw/core/machine.c
>index 55b9bc7817..d0e9348888 100644
>--- a/hw/core/machine.c
>+++ b/hw/core/machine.c
>@@ -39,6 +39,7 @@
> GlobalProperty hw_compat_6_0[] =3D {
>     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>     { "i8042", "extended-state", "false"},
>+    { "nvme-ns", "eui64-default", "off"},
> };
> const size_t hw_compat_6_0_len =3D G_N_ELEMENTS(hw_compat_6_0);
>
>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>index 45e457de6a..4275c3db63 100644
>--- a/hw/nvme/ns.c
>+++ b/hw/nvme/ns.c
>@@ -56,6 +56,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
>
> static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
> {
>+    static uint64_t ns_count;
>     NvmeIdNs *id_ns =3D &ns->id_ns;
>     uint8_t ds;
>     uint16_t ms;
>@@ -73,6 +74,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>         id_ns->nmic |=3D NVME_NMIC_NS_SHARED;
>     }
>
>+    /* Substitute a missing EUI-64 by an autogenerated one */
>+    ++ns_count;
>+    if (!ns->params.eui64 && ns->params.eui64_default) {
>+        ns->params.eui64 =3D ns_count + NVME_EUI64_DEFAULT;
>+    }
>+
>     /* simple copy */
>     id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>     id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>@@ -533,6 +540,8 @@ static Property nvme_ns_props[] =3D {
>                        params.max_open_zones, 0),
>     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
>                        params.zd_extension_size, 0),
>+    DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
>+                     true),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index ac90e13d7b..3fb869731d 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -26,6 +26,7 @@
>
> #define NVME_MAX_CONTROLLERS 32
> #define NVME_MAX_NAMESPACES  256
>+#define NVME_EUI64_DEFAULT 0x27fed9272381cbd0UL

Is there any significance to this value? Any particular reason it is not=20
using the QEMU OUI (52:54:00)?

>
> typedef struct NvmeCtrl NvmeCtrl;
> typedef struct NvmeNamespace NvmeNamespace;
>@@ -84,6 +85,7 @@ typedef struct NvmeNamespaceParams {
>     uint32_t nsid;
>     QemuUUID uuid;
>     uint64_t eui64;
>+    bool     eui64_default;
>
>     uint16_t ms;
>     uint8_t  mset;
>--
>2.30.2
>
>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--R21P43LCfRwuxcmB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDHoHkACgkQTeGvMW1P
Dek6XAgAmyr/88n/8p/DsVOdE/V/GyFLDt3D2mpM+fw+Lqyh3WNMBzwdTHoz8UXA
gt29Xdo+Mg/XRAeJoCnjfL/d4i9oTM1a9d3psXwONsvWiG0As1F0bdOgPP+xzQ8+
fyOV+2UV3cG//U+XAFKe2mbO8iontM6HeMFTjwp4CR3f47mtPdAAYhSrzAEU3VE4
ncu59YjqKY5MSN6QztCBm29/vh3xZXSy0Swq/XJncc7c7TMo9z/9naRUPdXP6orG
w20d4n2G7UDQAEZ4RWwR/C5hbX4Wgr5MELsIyJogQuYZ6PWaXP9wVlwVdEUIgFfR
iCyyLm3SIuHOLWsqS+M9PiTM6cJb4A==
=ZVF/
-----END PGP SIGNATURE-----

--R21P43LCfRwuxcmB--
