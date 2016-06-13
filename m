Received: by 10.25.85.209 with SMTP id j200csp1109021lfb;
        Mon, 13 Jun 2016 02:52:57 -0700 (PDT)
X-Received: by 10.140.85.8 with SMTP id m8mr12658483qgd.7.1465811577878;
        Mon, 13 Jun 2016 02:52:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 51si14715717qgj.50.2016.06.13.02.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCOYD-0006Ck-Cp
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:52:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOY8-000670-W8
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCOY4-0004Ln-Qj
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:52:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCOY4-0004Lf-KV; Mon, 13 Jun 2016 05:52:48 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E200350F49;
	Mon, 13 Jun 2016 09:52:47 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D9qgcv023070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 05:52:44 -0400
To: vijayak@caviumnetworks.com, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
	quintela@redhat.com
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fe539d79-cac4-27e3-589f-66290ae8f243@redhat.com>
Date: Mon, 13 Jun 2016 11:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 13 Jun 2016 09:52:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/4] exec.c: Remove static allocation
 of sub_section of sub_page
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Prasun.Kapoor@caviumnetworks.com, Vijaya Kumar K <vijayak@cavium.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /OyqniwW9G3H



On 13/06/2016 11:08, vijayak@caviumnetworks.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>=20
> Allocate sub_section dynamically. Remove dependency
> on TARGET_PAGE_SIZE to make run-time page size detection
> for arm platforms.
>=20
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> ---
>  exec.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index a9d465b..e803a41 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -154,7 +154,7 @@ typedef struct subpage_t {
>      MemoryRegion iomem;
>      AddressSpace *as;
>      hwaddr base;
> -    uint16_t sub_section[TARGET_PAGE_SIZE];
> +    uint16_t *sub_section;

Please make this a flexible array member instead, so that you can avoid
the extra pointer dereference.

Thanks,

Paolo

>  } subpage_t;
> =20
>  #define PHYS_SECTION_UNASSIGNED 0
> @@ -1151,6 +1151,7 @@ static void phys_section_destroy(MemoryRegion *mr=
)
>      if (have_sub_page) {
>          subpage_t *subpage =3D container_of(mr, subpage_t, iomem);
>          object_unref(OBJECT(&subpage->iomem));
> +        g_free(subpage->sub_section);
>          g_free(subpage);
>      }
>  }
> @@ -2272,7 +2273,7 @@ static subpage_t *subpage_init(AddressSpace *as, =
hwaddr base)
>      subpage_t *mmio;
> =20
>      mmio =3D g_malloc0(sizeof(subpage_t));
> -
> +    mmio->sub_section =3D g_malloc0(TARGET_PAGE_SIZE * sizeof(uint16_t=
));
>      mmio->as =3D as;
>      mmio->base =3D base;
>      memory_region_init_io(&mmio->iomem, NULL, &subpage_ops, mmio,
>=20
