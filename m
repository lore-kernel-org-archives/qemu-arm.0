Received: by 10.28.71.155 with SMTP id m27csp1071210wmi;
        Thu, 22 Mar 2018 19:26:02 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtE+Aki2TjcSVzqXAyZeR6Mz40ALCuvXmNA8AOHXzmz3I0fZnvnlSxvi0A66V9CUtYZ4Hbq
X-Received: by 10.200.50.114 with SMTP id y47mr39683166qta.25.1521771962510;
        Thu, 22 Mar 2018 19:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521771962; cv=none;
        d=google.com; s=arc-20160816;
        b=IVCkz6J+D82WhlWMpG75llXvSvvGmKBfjLDeOtFLzcyRE9oXizqNTF4MlV5ufvKIZQ
         U+APr/5fkU7IpQ78r53vPs57FzaAPvfdSpPHr7f+OdSsVipGDg3PDyTk23GI1NZ6eSSD
         bQH2eA8b0b6bGTwbQrM4rB0BDJucJce1FAcJDcr97evI9KLux924px96CqjpKhUHUznq
         GA5Rp7cDSRKvWtB+q6bJm+10J/Xz0yOmBCSZ+N/eGXIqM4tF4DZamCnCWqyO5qNp3tri
         xq23BsNyaLXjL/CCDKK9gSF2+AJOYuGl2iEgU0J6sajy+F+jnESHIHiG/9v5jRg8/Cz3
         CAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=HveAO1+blkqaRIp3cqaSyxhTq6vJ9jdtbG634SNXHXw=;
        b=W7ia4XsbKXYB7iW4TdZnWEeUseOK7SWqC09u8gYVLOdGYzIL6q8jKO2BI2KHzsj3UX
         jgm8DrNdVM92r5YRDgeSmBTycyax8ujwXC2Wyc/smGCb+/RAyQPFz4FA1UyZ8uhQzN8u
         fkH8mldEtTAKtYFQYE9WGD1rd7/Pt0eZa7ii+KyWg4GeCGjA9YTfAa8Bf5DFxitmhp+w
         97ixUnGEpONqnfN3KHO0llMlP+8oPfSGtWc606G5IczQluUjl2MXMFgTUKjMZ+iKi8uA
         Q6Kxdv4KiPsikWH06eneq7qJre6SQ2+bST0wGABzODGt55USKkkjbbDhovjABdG/hRWG
         /xAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=n/7oZmRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p14si2466670qtj.447.2018.03.22.19.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 19:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=n/7oZmRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezCP4-00077T-0j
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 22:26:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ezCOs-00077C-Up
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 22:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ezCOo-0007lr-SD
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 22:25:50 -0400
Received: from ozlabs.org ([103.22.144.67]:37869)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1ezCOn-0007jF-CB; Thu, 22 Mar 2018 22:25:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 406nSz2HgJz9s27; Fri, 23 Mar 2018 13:25:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1521771939;
	bh=DcziY97LBcXJjLqplPEw945Kk+q4V9vWybpRm034N58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/7oZmROf9P6kU64r+DdsIN7eOdCla1OTwekrmqwTosncBKKZp9qq9gO/W0x3SSBA
	ZS37AWiNOkhWgh9HxfzUwlsnlc9+TLYyXOmVfu+sRIMwfg4zmW6bIQPd54sitquUDQ
	KmqSqnRE99PFAxcjKbPmtl/RLa3FTm24kEHb6UC8=
Date: Fri, 23 Mar 2018 10:06:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20180322230612.GT3905@umbus.fritz.box>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OowMmFE4aK71mEhh"
Content-Disposition: inline
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H6y1FYXi2n4g


--OowMmFE4aK71mEhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2018 at 05:12:26PM +0100, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  accel/tcg/translate-all.c                          |  5 +-
>  block/quorum.c                                     |  6 +--
>  hw/arm/exynos4210.c                                |  7 +--
>  hw/block/vhost-user-blk.c                          |  5 +-
>  hw/hppa/dino.c                                     |  5 +-
>  hw/misc/mos6522.c                                  |  6 +--
>  hw/net/ftgmac100.c                                 |  5 +-
>  hw/ppc/pnv_lpc.c                                   | 14 +-----
>  io/net-listener.c                                  |  6 +--
>  target/i386/hax-darwin.c                           | 10 ++--
>  target/mips/dsp_helper.c                           | 15 ++----
>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------=
------
>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------=
------
>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++-----------=
---
>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
>  target/xtensa/translate.c                          |  5 +-
>  tests/m48t59-test.c                                |  6 +--
>  tests/test-thread-pool.c                           |  6 +--
>  util/uri.c                                         |  5 +-
>  20 files changed, 75 insertions(+), 247 deletions(-)

ppc part

Acked-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 5ad1b919bc..55d822d410 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -644,11 +644,8 @@ static inline void *alloc_code_gen_buffer(void)
>  static inline void *alloc_code_gen_buffer(void)
>  {
>      size_t size =3D tcg_ctx->code_gen_buffer_size;
> -    void *buf;
> -
> -    buf =3D VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
> +    return VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
>                          PAGE_EXECUTE_READWRITE);
> -    return buf;
>  }
>  #else
>  static inline void *alloc_code_gen_buffer(void)
> diff --git a/block/quorum.c b/block/quorum.c
> index 14333c18aa..304442ef65 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -608,7 +608,7 @@ static void read_quorum_children_entry(void *opaque)
>  static int read_quorum_children(QuorumAIOCB *acb)
>  {
>      BDRVQuorumState *s =3D acb->bs->opaque;
> -    int i, ret;
> +    int i;
> =20
>      acb->children_read =3D s->num_children;
>      for (i =3D 0; i < s->num_children; i++) {
> @@ -643,9 +643,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
>          qemu_coroutine_yield();
>      }
> =20
> -    ret =3D acb->vote_ret;
> -
> -    return ret;
> +    return acb->vote_ret;
>  }
> =20
>  static int read_fifo_child(QuorumAIOCB *acb)
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 06f9d1ffa4..d5ce275b21 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -156,12 +156,7 @@ void exynos4210_write_secondary(ARMCPU *cpu,
> =20
>  static uint64_t exynos4210_calc_affinity(int cpu)
>  {
> -    uint64_t mp_affinity;
> -
> -    /* Exynos4210 has 0x9 as cluster ID */
> -    mp_affinity =3D (0x9 << ARM_AFF1_SHIFT) | cpu;
> -
> -    return mp_affinity;
> +    return (0x9 << ARM_AFF1_SHIFT) | cpu;
>  }
> =20
>  Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index f840f07dfe..3f41ca9e26 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -196,7 +196,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>                                              Error **errp)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -    uint64_t get_features;
> =20
>      /* Turn on pre-defined features */
>      virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> @@ -215,9 +214,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>          virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
>      }
> =20
> -    get_features =3D vhost_get_features(&s->dev, user_feature_bits, feat=
ures);
> -
> -    return get_features;
> +    return vhost_get_features(&s->dev, user_feature_bits, features);
>  }
> =20
>  static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *=
vq)
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 15aefde09c..c5dcf3104d 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -403,13 +403,10 @@ static void dino_set_irq(void *opaque, int irq, int=
 level)
>  static int dino_pci_map_irq(PCIDevice *d, int irq_num)
>  {
>      int slot =3D d->devfn >> 3;
> -    int local_irq;
> =20
>      assert(irq_num >=3D 0 && irq_num <=3D 3);
> =20
> -    local_irq =3D slot & 0x03;
> -
> -    return local_irq;
> +    return slot & 0x03;
>  }
> =20
>  static void dino_set_timer_irq(void *opaque, int irq, int level)
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 8ad9fc831e..606532aa65 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -176,12 +176,8 @@ static void mos6522_set_sr_int(MOS6522State *s)
> =20
>  static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer =
*ti)
>  {
> -    uint64_t d;
> -
> -    d =3D muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_tim=
e,
>                   ti->frequency, NANOSECONDS_PER_SECOND);
> -
> -    return d;
>  }
> =20
>  static uint64_t mos6522_get_load_time(MOS6522State *s, MOS6522Timer *ti)
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 704f452067..3300e8ef4a 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -511,7 +511,6 @@ static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
> =20
>      uint32_t cnt =3D 1024 * FTGMAC100_APTC_RXPOLL_CNT(s->aptcr);
>      uint32_t speed =3D (s->maccr & FTGMAC100_MACCR_FAST_MODE) ? 1 : 0;
> -    uint32_t period;
> =20
>      if (s->aptcr & FTGMAC100_APTC_RXPOLL_TIME_SEL) {
>          cnt <<=3D 4;
> @@ -521,9 +520,7 @@ static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
>          speed =3D 2;
>      }
> =20
> -    period =3D cnt / div[speed];
> -
> -    return period;
> +    return cnt / div[speed];
>  }
> =20
>  static void ftgmac100_reset(DeviceState *d)
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index c42b4a8f6c..a77e20368e 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -125,25 +125,15 @@ static int pnv_lpc_dt_xscom(PnvXScomInterface *dev,=
 void *fdt, int xscom_offset)
>  static bool opb_read(PnvLpcController *lpc, uint32_t addr, uint8_t *data,
>                       int sz)
>  {
> -    bool success;
> -
> -    /* XXX Handle access size limits and FW read caching here */
> -    success =3D !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECI=
FIED,
> +    return !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
>                                  data, sz, false);
> -
> -    return success;
>  }
> =20
>  static bool opb_write(PnvLpcController *lpc, uint32_t addr, uint8_t *dat=
a,
>                        int sz)
>  {
> -    bool success;
> -
> -    /* XXX Handle access size limits here */
> -    success =3D !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECI=
FIED,
> +    return !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
>                                  data, sz, true);
> -
> -    return success;
>  }
> =20
>  #define ECCB_CTL_READ           PPC_BIT(15)
> diff --git a/io/net-listener.c b/io/net-listener.c
> index 555e8acaa4..3317aa6e5f 100644
> --- a/io/net-listener.c
> +++ b/io/net-listener.c
> @@ -25,11 +25,7 @@
> =20
>  QIONetListener *qio_net_listener_new(void)
>  {
> -    QIONetListener *ret;
> -
> -    ret =3D QIO_NET_LISTENER(object_new(TYPE_QIO_NET_LISTENER));
> -
> -    return ret;
> +    return QIO_NET_LISTENER(object_new(TYPE_QIO_NET_LISTENER));
>  }
> =20
>  void qio_net_listener_set_name(QIONetListener *listener,
> diff --git a/target/i386/hax-darwin.c b/target/i386/hax-darwin.c
> index acdde476a0..a5426a6dac 100644
> --- a/target/i386/hax-darwin.c
> +++ b/target/i386/hax-darwin.c
> @@ -257,10 +257,7 @@ int hax_host_setup_vcpu_channel(struct hax_vcpu_stat=
e *vcpu)
> =20
>  int hax_vcpu_run(struct hax_vcpu_state *vcpu)
>  {
> -    int ret;
> -
> -    ret =3D ioctl(vcpu->fd, HAX_VCPU_IOCTL_RUN, NULL);
> -    return ret;
> +    return ioctl(vcpu->fd, HAX_VCPU_IOCTL_RUN, NULL);
>  }
> =20
>  int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set)
> @@ -315,13 +312,12 @@ int hax_sync_vcpu_state(CPUArchState *env, struct v=
cpu_state_t *state, int set)
> =20
>  int hax_inject_interrupt(CPUArchState *env, int vector)
>  {
> -    int ret, fd;
> +    int fd;
> =20
>      fd =3D hax_vcpu_get_fd(env);
>      if (fd <=3D 0) {
>          return -1;
>      }
> =20
> -    ret =3D ioctl(fd, HAX_VCPU_IOCTL_INTERRUPT, &vector);
> -    return ret;
> +    return ioctl(fd, HAX_VCPU_IOCTL_INTERRUPT, &vector);
>  }
> diff --git a/target/mips/dsp_helper.c b/target/mips/dsp_helper.c
> index f152fea34a..739b69dd45 100644
> --- a/target/mips/dsp_helper.c
> +++ b/target/mips/dsp_helper.c
> @@ -3274,14 +3274,11 @@ target_ulong helper_dextr_l(target_ulong ac, targ=
et_ulong shift,
>                              CPUMIPSState *env)
>  {
>      uint64_t temp[3];
> -    target_ulong result;
> =20
>      shift =3D shift & 0x3F;
> =20
>      mipsdsp_rndrashift_acc(temp, ac, shift, env);
> -    result =3D (temp[1] << 63) | (temp[0] >> 1);
> -
> -    return result;
> +    return (temp[1] << 63) | (temp[0] >> 1);
>  }
> =20
>  target_ulong helper_dextr_r_l(target_ulong ac, target_ulong shift,
> @@ -3289,7 +3286,6 @@ target_ulong helper_dextr_r_l(target_ulong ac, targ=
et_ulong shift,
>  {
>      uint64_t temp[3];
>      uint32_t temp128;
> -    target_ulong result;
> =20
>      shift =3D shift & 0x3F;
>      mipsdsp_rndrashift_acc(temp, ac, shift, env);
> @@ -3309,9 +3305,7 @@ target_ulong helper_dextr_r_l(target_ulong ac, targ=
et_ulong shift,
>          set_DSPControl_overflow_flag(1, 23, env);
>      }
> =20
> -    result =3D (temp[1] << 63) | (temp[0] >> 1);
> -
> -    return result;
> +    return (temp[1] << 63) | (temp[0] >> 1);
>  }
> =20
>  target_ulong helper_dextr_rs_l(target_ulong ac, target_ulong shift,
> @@ -3319,7 +3313,6 @@ target_ulong helper_dextr_rs_l(target_ulong ac, tar=
get_ulong shift,
>  {
>      uint64_t temp[3];
>      uint32_t temp128;
> -    target_ulong result;
> =20
>      shift =3D shift & 0x3F;
>      mipsdsp_rndrashift_acc(temp, ac, shift, env);
> @@ -3345,9 +3338,7 @@ target_ulong helper_dextr_rs_l(target_ulong ac, tar=
get_ulong shift,
>          }
>          set_DSPControl_overflow_flag(1, 23, env);
>      }
> -    result =3D (temp[1] << 63) | (temp[0] >> 1);
> -
> -    return result;
> +    return (temp[1] << 63) | (temp[0] >> 1);
>  }
>  #endif
> =20
> diff --git a/target/xtensa/core-dc232b/xtensa-modules.c b/target/xtensa/c=
ore-dc232b/xtensa-modules.c
> index d322c3f52a..164df3b1a4 100644
> --- a/target/xtensa/core-dc232b/xtensa-modules.c
> +++ b/target/xtensa/core-dc232b/xtensa-modules.c
> @@ -1736,9 +1736,7 @@ Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_arr_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1750,9 +1748,7 @@ Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1764,9 +1760,7 @@ Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_art_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1778,9 +1772,7 @@ Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1792,9 +1784,7 @@ Operand_ar4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar4_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1806,9 +1796,7 @@ Operand_ar8_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar8_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1820,9 +1808,7 @@ Operand_ar12_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar12_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1834,9 +1820,7 @@ Operand_ars_entry_decode (uint32 *valp ATTRIBUTE_UN=
USED)
>  static int
>  Operand_ars_entry_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -2406,9 +2390,7 @@ Operand_mx_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mx_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2436,9 +2418,7 @@ Operand_mw_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mw_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2450,9 +2430,7 @@ Operand_mr0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2464,9 +2442,7 @@ Operand_mr1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr1_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2478,9 +2454,7 @@ Operand_mr2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr2_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2492,9 +2466,7 @@ Operand_mr3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr3_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> diff --git a/target/xtensa/core-dc233c/xtensa-modules.c b/target/xtensa/c=
ore-dc233c/xtensa-modules.c
> index 7c20f82349..0f32f0804a 100644
> --- a/target/xtensa/core-dc233c/xtensa-modules.c
> +++ b/target/xtensa/core-dc233c/xtensa-modules.c
> @@ -1817,9 +1817,7 @@ Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_arr_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1831,9 +1829,7 @@ Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1845,9 +1841,7 @@ Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_art_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1859,9 +1853,7 @@ Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1873,9 +1865,7 @@ Operand_ar4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar4_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1887,9 +1877,7 @@ Operand_ar8_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar8_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1901,9 +1889,7 @@ Operand_ar12_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar12_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -1915,9 +1901,7 @@ Operand_ars_entry_decode (uint32 *valp ATTRIBUTE_UN=
USED)
>  static int
>  Operand_ars_entry_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x1f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x1f) !=3D 0;
>  }
> =20
>  static int
> @@ -2487,9 +2471,7 @@ Operand_mx_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mx_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2517,9 +2499,7 @@ Operand_mw_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mw_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2531,9 +2511,7 @@ Operand_mr0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2545,9 +2523,7 @@ Operand_mr1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr1_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2559,9 +2535,7 @@ Operand_mr2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr2_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> @@ -2573,9 +2547,7 @@ Operand_mr3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr3_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3) !=3D 0;
>  }
> =20
>  static int
> diff --git a/target/xtensa/core-de212/xtensa-modules.c b/target/xtensa/co=
re-de212/xtensa-modules.c
> index ef7674de3a..480c68d3c6 100644
> --- a/target/xtensa/core-de212/xtensa-modules.c
> +++ b/target/xtensa/core-de212/xtensa-modules.c
> @@ -1798,9 +1798,7 @@ OperandSem_opnd_sem_AR_decode (uint32 *valp ATTRIBU=
TE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1812,9 +1810,7 @@ OperandSem_opnd_sem_AR_0_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1826,9 +1822,7 @@ OperandSem_opnd_sem_AR_1_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_1_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1840,9 +1834,7 @@ OperandSem_opnd_sem_AR_2_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_2_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1854,9 +1846,7 @@ OperandSem_opnd_sem_AR_3_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_3_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1868,9 +1858,7 @@ OperandSem_opnd_sem_AR_4_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_4_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -2464,9 +2452,7 @@ OperandSem_opnd_sem_MR_decode (uint32 *valp ATTRIBU=
TE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 4);
> -  return error;
> +  return (*valp >=3D 4);
>  }
> =20
>  static int
> @@ -2478,9 +2464,7 @@ OperandSem_opnd_sem_MR_1_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_1_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 4);
> -  return error;
> +  return (*valp >=3D 4);
>  }
> =20
>  static int
> @@ -2492,9 +2476,7 @@ OperandSem_opnd_sem_MR_2_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_2_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 4);
> -  return error;
> +  return (*valp >=3D 4);
>  }
> =20
>  static int
> @@ -2506,9 +2488,7 @@ OperandSem_opnd_sem_MR_3_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_3_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 4);
> -  return error;
> +  return (*valp >=3D 4);
>  }
> =20
>  static int
> @@ -2520,9 +2500,7 @@ OperandSem_opnd_sem_MR_4_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_4_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 4);
> -  return error;
> +  return (*valp >=3D 4);
>  }
> =20
>  static int
> @@ -2534,9 +2512,7 @@ OperandSem_opnd_sem_MR_5_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_5_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 4);
> -  return error;
> +  return (*valp >=3D 4);
>  }
> =20
>  static int
> diff --git a/target/xtensa/core-fsf/xtensa-modules.c b/target/xtensa/core=
-fsf/xtensa-modules.c
> index f7de2dec15..c32683ff77 100644
> --- a/target/xtensa/core-fsf/xtensa-modules.c
> +++ b/target/xtensa/core-fsf/xtensa-modules.c
> @@ -1379,9 +1379,7 @@ Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_arr_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1393,9 +1391,7 @@ Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1407,9 +1403,7 @@ Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_art_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0xf) !=3D 0;
> -  return error;
> +  return (*valp & ~0xf) !=3D 0;
>  }
> =20
>  static int
> @@ -1421,9 +1415,7 @@ Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3f) !=3D 0;
>  }
> =20
>  static int
> @@ -1435,9 +1427,7 @@ Operand_ar4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar4_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3f) !=3D 0;
>  }
> =20
>  static int
> @@ -1449,9 +1439,7 @@ Operand_ar8_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar8_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3f) !=3D 0;
>  }
> =20
>  static int
> @@ -1463,9 +1451,7 @@ Operand_ar12_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar12_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3f) !=3D 0;
>  }
> =20
>  static int
> @@ -1477,9 +1463,7 @@ Operand_ars_entry_decode (uint32 *valp ATTRIBUTE_UN=
USED)
>  static int
>  Operand_ars_entry_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp & ~0x3f) !=3D 0;
> -  return error;
> +  return (*valp & ~0x3f) !=3D 0;
>  }
> =20
>  static int
> diff --git a/target/xtensa/core-sample_controller/xtensa-modules.c b/targ=
et/xtensa/core-sample_controller/xtensa-modules.c
> index fba41b99ae..7e87d216bd 100644
> --- a/target/xtensa/core-sample_controller/xtensa-modules.c
> +++ b/target/xtensa/core-sample_controller/xtensa-modules.c
> @@ -1570,9 +1570,7 @@ OperandSem_opnd_sem_AR_decode (uint32 *valp ATTRIBU=
TE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1584,9 +1582,7 @@ OperandSem_opnd_sem_AR_0_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_0_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1598,9 +1594,7 @@ OperandSem_opnd_sem_AR_1_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_1_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1612,9 +1606,7 @@ OperandSem_opnd_sem_AR_2_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_2_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1626,9 +1618,7 @@ OperandSem_opnd_sem_AR_3_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_3_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> @@ -1640,9 +1630,7 @@ OperandSem_opnd_sem_AR_4_decode (uint32 *valp ATTRI=
BUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_4_encode (uint32 *valp)
>  {
> -  int error;
> -  error =3D (*valp >=3D 32);
> -  return error;
> +  return (*valp >=3D 32);
>  }
> =20
>  static int
> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index 4f6d03059f..f88cdbeecd 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -1272,11 +1272,8 @@ XtensaOpcodeOps *
>  xtensa_find_opcode_ops(const XtensaOpcodeTranslators *t,
>                         const char *name)
>  {
> -    XtensaOpcodeOps *ops;
> -
> -    ops =3D bsearch(name, t->opcode, t->num_opcodes,
> +    return bsearch(name, t->opcode, t->num_opcodes,
>                    sizeof(XtensaOpcodeOps), compare_opcode_ops);
> -    return ops;
>  }
> =20
>  static void translate_abs(DisasContext *dc, const uint32_t arg[],
> diff --git a/tests/m48t59-test.c b/tests/m48t59-test.c
> index 26af7d6e8e..5b695971c7 100644
> --- a/tests/m48t59-test.c
> +++ b/tests/m48t59-test.c
> @@ -256,8 +256,6 @@ static void base_setup(void)
> =20
>  int main(int argc, char **argv)
>  {
> -    int ret;
> -
>      base_setup();
> =20
>      g_test_init(&argc, &argv, NULL);
> @@ -267,7 +265,5 @@ int main(int argc, char **argv)
>          qtest_add_func("/rtc/bcd-check-time", bcd_check_time);
>      }
>      qtest_add_func("/rtc/fuzz-registers", fuzz_registers);
> -    ret =3D g_test_run();
> -
> -    return ret;
> +    return g_test_run();
>  }
> diff --git a/tests/test-thread-pool.c b/tests/test-thread-pool.c
> index 91b4ec5524..9cdccb3a47 100644
> --- a/tests/test-thread-pool.c
> +++ b/tests/test-thread-pool.c
> @@ -224,8 +224,6 @@ static void test_cancel_async(void)
> =20
>  int main(int argc, char **argv)
>  {
> -    int ret;
> -
>      qemu_init_main_loop(&error_abort);
>      ctx =3D qemu_get_current_aio_context();
>      pool =3D aio_get_thread_pool(ctx);
> @@ -238,7 +236,5 @@ int main(int argc, char **argv)
>      g_test_add_func("/thread-pool/cancel", test_cancel);
>      g_test_add_func("/thread-pool/cancel-async", test_cancel_async);
> =20
> -    ret =3D g_test_run();
> -
> -    return ret;
> +    return g_test_run();
>  }
> diff --git a/util/uri.c b/util/uri.c
> index 93ecefdaaf..8624a7ac23 100644
> --- a/util/uri.c
> +++ b/util/uri.c
> @@ -1065,10 +1065,7 @@ URI *uri_parse_raw(const char *str, int raw)
>   */
>  URI *uri_new(void)
>  {
> -    URI *ret;
> -
> -    ret =3D g_new0(URI, 1);
> -    return ret;
> +    return g_new0(URI, 1);
>  }
> =20
>  /**

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OowMmFE4aK71mEhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlq0Nt4ACgkQbDjKyiDZ
s5KaRA//fOkRHhJRod27Oqt/p22m8pA86xryUr1ax2yrCTqKu4NYAC4jVghqT0D6
xRi0+aegeSyxCqN3AXjoGxcQl1j4XM6W5jh1sHJvUueVX7DQvrslJhLotLCrVOi0
WD11C1WpKRvo4g/RxnY513Wx3YqUIxmqjgZdMC6bFbGVRgG3Ii4WzuM8iU1rPVOI
VfZKBi6Tf1lO8r5KXhtYybrbrKfHI4HMeGjqHcuqQZTVvU4A+7B7Mla8HLwDAzH5
DxkndPuADrt+9GCQpq1EYcFuHREZdz6ICwhkuOWCc565ZHMkCrasQh4CRAd/wUUR
NObxzga1AvrntBX8Tri50oY2dY9C9QTVzKF1JP3F5GAUfyYoCyge/5U0ovWthPpr
G2HCJrYcqYqscGyxj+oW45TXag/aDZH1JN2c+Ddk5BtcUVG3jC7K/mRsbldOpzoP
aRdjPcNsphsZqXjzk7SZwjYEzyuH6KBdxYipIfH5EzKIINRtjhf4n9qx6B4eCX6U
D/vD/mvlv7pF+LPHPuxxfA8Jd084Y6EOjckWFzC0FxJeEyxoGTVu4zk8lkatBVJ+
Y9ttx8cACRJeAYwwKlm65Tqo6mkC6rqYYGkW0lFsRZ8AJZT/D+W52CoOwV/M644+
jJhYyHFDcuUjjSl8sEHdyb0W1Rxo+VCJghGm+pq5l/S6VqnkiXU=
=yyHf
-----END PGP SIGNATURE-----

--OowMmFE4aK71mEhh--
