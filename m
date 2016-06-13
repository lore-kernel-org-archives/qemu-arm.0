Received: by 10.25.85.209 with SMTP id j200csp1099970lfb;
        Mon, 13 Jun 2016 02:25:52 -0700 (PDT)
X-Received: by 10.237.34.102 with SMTP id o35mr13481349qtc.50.1465809952097;
        Mon, 13 Jun 2016 02:25:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si14618571qta.130.2016.06.13.02.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCO7z-00086o-Fy
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCO7v-00086E-C5
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCO7r-0007Dq-6v
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:25:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCO7q-0007Dl-UZ; Mon, 13 Jun 2016 05:25:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D0B485364;
	Mon, 13 Jun 2016 09:25:42 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D9PbGO014985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 05:25:39 -0400
To: vijayak@caviumnetworks.com, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
	quintela@redhat.com
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <16ef20d6-8c02-8617-0b6a-16fab76d3333@redhat.com>
Date: Mon, 13 Jun 2016 11:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 Jun 2016 09:25:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v1 3/4] translate-all.c: Compute L1 page
 table properties at runtime
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
X-TUID: 32+IfaB/ve+X



On 13/06/2016 11:08, vijayak@caviumnetworks.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>=20
> Remove L1 page mapping table properties computing
> statically using macros which is dependent on
> TARGET_PAGE_BITS. Drop macros V_L1_SIZE, V_L1_SHIFT,
> V_L1_BITS macros and replace with variables which are
> computed at early stage of VM boot.
>=20
> Removing dependency can help to make TARGET_PAGE_BITS
> dynamic.
>=20
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> ---
>  include/qemu-common.h |    1 +
>  translate-all.c       |   57 ++++++++++++++++++++++++++++++-----------=
--------
>  vl.c                  |    3 +++
>  3 files changed, 39 insertions(+), 22 deletions(-)
>=20
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 1f2cb94..d5f0450 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -129,6 +129,7 @@ int parse_debug_env(const char *name, int max, int =
initial);
> =20
>  const char *qemu_ether_ntoa(const MACAddr *mac);
>  void page_size_init(void);
> +void init_l1_page_table_param(void);
> =20
>  /* returns non-zero if dump is in progress, otherwise zero is
>   * returned. */
> diff --git a/translate-all.c b/translate-all.c
> index 118e7d3..a580ca9 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -57,6 +57,7 @@
>  #include "qemu/bitmap.h"
>  #include "qemu/timer.h"
>  #include "exec/log.h"
> +#include "qemu/error-report.h"
> =20
>  //#define DEBUG_TB_INVALIDATE
>  //#define DEBUG_FLUSH
> @@ -99,25 +100,18 @@ typedef struct PageDesc {
>  #define V_L2_BITS 10
>  #define V_L2_SIZE (1 << V_L2_BITS)
> =20
> -/* The bits remaining after N lower levels of page tables.  */
> -#define V_L1_BITS_REM \
> -    ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS)
> -
> -#if V_L1_BITS_REM < 4
> -#define V_L1_BITS  (V_L1_BITS_REM + V_L2_BITS)
> -#else
> -#define V_L1_BITS  V_L1_BITS_REM
> -#endif
> -
> -#define V_L1_SIZE  ((target_ulong)1 << V_L1_BITS)
> -
> -#define V_L1_SHIFT (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - V_L1_B=
ITS)
> -
>  uintptr_t qemu_host_page_size;
>  intptr_t qemu_host_page_mask;
> =20
> +/*
> + * L1 Mapping properties
> + */
> +static unsigned long v_l1_bits;
> +static unsigned long v_l1_size;
> +static unsigned long v_l1_shift;

Please make these uint8_t.

>  /* The bottom level has pointers to PageDesc */
> -static void *l1_map[V_L1_SIZE];
> +static void *l1_map;

You can make this array have a static V_L2_SIZE * 16 size too.  Peter,
what do you think?

>  /* code generation context */
>  TCGContext tcg_ctx;
> @@ -127,6 +121,25 @@ TCGContext tcg_ctx;
>  __thread int have_tb_lock;
>  #endif
> =20
> +void init_l1_page_table_param(void)
> +{
> +    uint32_t v_l1_bits_rem;
> +
> +    assert(TARGET_PAGE_BITS);
> +    /* The bits remaining after N lower levels of page tables.  */
> +    v_l1_bits_rem =3D ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V=
_L2_BITS);
> +    if (v_l1_bits_rem < 4)
> +        v_l1_bits =3D (v_l1_bits_rem + V_L2_BITS);
> +    else
> +        v_l1_bits =3D v_l1_bits_rem;
> +
> +    v_l1_size =3D ((target_ulong)1 << v_l1_bits);
> +    v_l1_shift =3D (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - v_l1_b=
its);

Please assert that v_l1_shift % V_L2_BITS =3D=3D 0.

> +    l1_map =3D g_malloc0(v_l1_size * sizeof(void *));
> +    if (!l1_map)
> +        error_report("Allocation faile for L1 MAP table\n");
> +}
> +
>  void tb_lock(void)
>  {
>  #ifdef CONFIG_USER_ONLY
> @@ -408,10 +421,10 @@ static PageDesc *page_find_alloc(tb_page_addr_t i=
ndex, int alloc)
>      int i;
> =20
>      /* Level 1.  Always allocated.  */
> -    lp =3D l1_map + ((index >> V_L1_SHIFT) & (V_L1_SIZE - 1));
> +    lp =3D l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
> =20
>      /* Level 2..N-1.  */
> -    for (i =3D V_L1_SHIFT / V_L2_BITS - 1; i > 0; i--) {
> +    for (i =3D v_l1_shift / V_L2_BITS - 1; i > 0; i--) {

Please cache v_l1_shift / V_L2_BITS - 1 into a new variable v_l2_levels.

>          void **p =3D atomic_rcu_read(lp);
> =20
>          if (p =3D=3D NULL) {
> @@ -819,8 +832,8 @@ static void page_flush_tb(void)
>  {
>      int i;
> =20
> -    for (i =3D 0; i < V_L1_SIZE; i++) {
> -        page_flush_tb_1(V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
> +    for (i =3D 0; i < v_l1_size; i++) {
> +        page_flush_tb_1(v_l1_shift / V_L2_BITS - 1, l1_map + i);
>      }
>  }
> =20
> @@ -1825,9 +1838,9 @@ int walk_memory_regions(void *priv, walk_memory_r=
egions_fn fn)
>      data.start =3D -1u;
>      data.prot =3D 0;
> =20
> -    for (i =3D 0; i < V_L1_SIZE; i++) {
> -        int rc =3D walk_memory_regions_1(&data, (target_ulong)i << (V_=
L1_SHIFT + TARGET_PAGE_BITS),
> -                                       V_L1_SHIFT / V_L2_BITS - 1, l1_=
map + i);
> +    for (i =3D 0; i < v_l1_size; i++) {
> +        int rc =3D walk_memory_regions_1(&data, (target_ulong)i << (v_=
l1_shift + TARGET_PAGE_BITS),
> +                                       v_l1_shift / V_L2_BITS - 1, l1_=
map + i);
>          if (rc !=3D 0) {
>              return rc;
>          }
> diff --git a/vl.c b/vl.c
> index b0bcc25..b6da265 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4044,6 +4044,9 @@ int main(int argc, char **argv, char **envp)
>      }
>      object_property_add_child(object_get_root(), "machine",
>                                OBJECT(current_machine), &error_abort);
> +
> +    init_l1_page_table_param();

Please call this from cpu_exec_init_all instead.

Thanks,

Paolo

>      cpu_exec_init_all();
> =20
>      if (machine_class->hw_version) {
>=20
