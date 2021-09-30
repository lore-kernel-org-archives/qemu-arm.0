Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp186300lfp;
        Thu, 30 Sep 2021 04:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn6yF07nOYdTCfJyDojaQWenuShfAXEKLIUk/+Gw6dFXpHihgvboEQ7kzqypbJQ/Ec7raB
X-Received: by 2002:ac8:4357:: with SMTP id a23mr5961676qtn.172.1633003028919;
        Thu, 30 Sep 2021 04:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633003028; cv=none;
        d=google.com; s=arc-20160816;
        b=jXnnNCi5lBDjRDEzAsA7MCxFfH8Kb2Dev6+qqb5HOv4Jd8wZ2gAKSwPMmhpd0OBrZq
         baHhcfFfmqn6IVbbe4pdzIZfg1yW431KovIBY/h7iB/oeaBUekb1goHhrTfosFygbOrO
         t4wQZhgPqrK/v5tB1iBMg5vCYm6se0ljT+A7m9DX8RW3/sTK5nyq3ZdXzGqVWMTRkEDO
         RhSODMjHWN9Ff4DpILy4Xa/1wYoANKHSouUYTTFsVXjC/6xBHFGHMvKF1kEceDiQTXpC
         QyfxTbrRX0Ju/dEQSQExg/T26/tQWLzmc83y4/0cVnDR70zZAhegkEq20h9mexu7FnYQ
         8r0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=+z7Bn/UOVVjoGhkhabBmuGWW2yFQ+RALdORnM1duT8I=;
        b=c8kNU3Jn7WzQja2k8x+UVIbZwGqEsZOtlkvELKuhTnSdKQjQakLanQ1hYV52YZx9sL
         Xna7sTzhRfaZwhyl2xjRhZpWbd0Csazx1gydifFIPIUsKXcMz+KNx9GjI963KwR9vXnK
         K8s/fPegN2aQ+HTiYa4F81W7U8kwfBbk5yvdsMRE2X3Jg3nknad8oyc9SzTguxlIFdRG
         0+sn08A0IQ96GMp9+DKdSbJFk9A7VfKdlkGlRAw4SXFflZvW2H0Oi434VxjH3f7YJtkc
         XHE1500coi86ODnZPI8NFeFK/yixcuhKNvq/uIF9YmrEc4UjlCb/1N1Vw8QseVnTpfpG
         ApgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si1703945qtn.351.2021.09.30.04.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 04:57:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVugW-0004Z7-8n
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 07:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mVugF-0004Wp-3E
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 07:56:51 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mVugC-0006yA-1c
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 07:56:50 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-DtC4IzxUNaCsWwgcVAjWdA-1; Thu, 30 Sep 2021 07:56:37 -0400
X-MC-Unique: DtC4IzxUNaCsWwgcVAjWdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 950191926DA0;
 Thu, 30 Sep 2021 11:56:36 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD5E65C1A1;
 Thu, 30 Sep 2021 11:56:34 +0000 (UTC)
Date: Thu, 30 Sep 2021 13:56:33 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <20210930135633.63566d4d@bahia.huguette>
In-Reply-To: <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 38zxv1fb0T8m

On Thu, 30 Sep 2021 09:10:12 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 27/08/2021 14.09, Thomas Huth wrote:
> > The dtc submodule is currently pointing to non-release commit. It's nic=
er
> > if submodules point to release versions instead and since dtc 1.6.1 is
> > available now, let's update to that version.
> >=20
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---

> >   dtc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/dtc b/dtc
> > index 85e5d83984..b6910bec11 160000
> > --- a/dtc
> > +++ b/dtc
> > @@ -1 +1 @@
> > -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> > +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
>=20
> Ping!
>=20
> David, could you please pick up this patch if you don't mind it?
>=20
>   Thanks,
>    Thomas
>=20

Hi Thomas !

greg@bahia:[main]dtc$ git log --oneline  85e5d839847af54efab170f2b1331b2a64=
21e647..v1.6.1
b6910bec1161 Bump version to v1.6.1
21d61d18f968 Fix CID 1461557
4c2ef8f4d14c checks: Introduce is_multiple_of()
e59ca36fb70e Make handling of cpp line information more tolerant
0c3fd9b6aceb checks: Drop interrupt_cells_is_cell check
6b3081abc4ac checks: Add check_is_cell() for all phandle+arg properties
2dffc192a77f yamltree: Remove marker ordering dependency
61e513439e40 pylibfdt: Rework "avoid unused variable warning" lines
c8bddd106095 tests: add a positive gpio test case
ad4abfadb687 checks: replace strstr and strrchr with strends
09c6a6e88718 dtc.h: add strends for suffix matching
9bb9b8d0b4a0 checks: tigthen up nr-gpios prop exception
b07b62ee3342 libfdt: Add FDT alignment check to fdt_check_header()
a2def5479950 libfdt: Check that the root-node name is empty
4ca61f84dc21 libfdt: Check that there is only one root node
34d708249a91 dtc: Remove -O dtbo support
8e7ff260f755 libfdt: Fix a possible "unchecked return value" warning
88875268c05c checks: Warn on node-name and property name being the same
9d2279e7e6ee checks: Change node-name check to match devicetree spec
f527c867a8c6 util: limit gnu_printf format attribute to gcc >=3D 4.4.0
183df9e9c2b9 gitignore: Ignore the swp files
0db6d09584e1 gitignore: Add cscope files
307afa1a7be8 Update Jon Loeliger's email
ca16a723fa9d fdtdump: Fix gcc11 warning
64990a272e8f srcpos: increase MAX_SRCFILE_DEPTH
163f0469bf2e dtc: Allow overlays to have .dtbo extension
3b01518e688d Set last_comp_version correctly in new dtb and fix potential v=
ersion issues in fdt_open_into
f7e5737f26aa tests: Fix overlay_overlay_nosugar test case
7cd5d5fe43d5 libfdt: Tweak description of assume-aligned load helpers
a7c404099349 libfdt: Internally perform potentially unaligned loads
bab85e48a6f4 meson: increase default timeout for tests
f8b46098824d meson: do not assume python is installed, skip tests
30a56bce4f0b meson: fix -Wall warning
5e735860c478 libfdt: Check for 8-byte address alignment in fdt_ro_probe_()
67849a327927 build-sys: add meson build
05874d08212d pylibfdt: allow build out of tree
3bc3a6b9fe0c dtc: Fix signedness comparisons warnings: Wrap (-1)
e1147b159e92 dtc: Fix signedness comparisons warnings: change types
04cf1fdc0fcf convert-dtsv0: Fix signedness comparisons warning
b30013edb878 libfdt: Fix kernel-doc comments
cbca977ea121 checks: Allow PCI bridge child nodes without an address
73e0f143b73d libfdt: fdt_strerror(): Fix comparison warning
6c2be7d85315 libfdt: fdt_get_string(): Fix sequential write comparison warn=
ings
82525f41d59e libfdt: libfdt_wip: Fix comparison warning
fb1f65f15832 libfdt: fdt_create_with_flags(): Fix comparison warning
f28aa271000b libfdt: fdt_move(): Fix comparison warnings
3d7c6f44195a libfdt: fdt_add_string_(): Fix comparison warning
10f682788c30 libfdt: fdt_node_offset_by_phandle(): Fix comparison warning
07158f4cf2a2 libfdt: overlay: Fix comparison warning
ce9e1f25a7de libfdt: fdt_resize(): Fix comparison warning
faa76fc10bc5 libfdt: fdt_splice_(): Fix comparison warning
54dca0985316 libfdt: fdt_get_string(): Fix comparison warnings
f8e11e61624e libfdt: fdt_grab_space_(): Fix comparison warning
0c43d4d7bf5a libfdt: fdt_mem_rsv(): Fix comparison warnings
442ea3dd1579 libfdt: fdt_offset_ptr(): Fix comparison warnings
ca19c3db2bf6 Makefile: Specify cflags for libyaml
7bb86f1c0956 libfdt: fix fdt_check_node_offset_ w/ VALID_INPUT
3d522abc7571 dtc: Include stdlib.h in util.h
808cdaaf524f dtc: Avoid UB when shifting
3e3138b4a956 libfdt: fix fdt_check_full buffer overrun
9d7888cbf19c dtc: Consider one-character strings as strings
8259d59f59de checks: Improve i2c reg property checking
fdabcf2980a4 checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
2478b1652c8d libfdt: add extern "C" for C++
f68bfc2668b2 libfdt: trivial typo fix
7be250b4d059 libfdt: Correct condition for reordering blocks
81e0919a3e21 checks: Add interrupt provider test

I don't see anything obvious that would preclude from updating
to v1.6.1, but I don't think either David or I will post another
PR anytime soon. Maybe better if this goes through someone else's
tree.

FWIW I could successfully build QEMU using the updated submodule,
so as discussed on IRC :

Acked-by: Greg Kurz <groug@kaod.org>

David will hopefully nack it in time if he's aware of an issue.

Cheers,

--
Greg

