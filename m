Received: by 10.28.71.155 with SMTP id m27csp1064130wmi;
        Thu, 22 Mar 2018 19:14:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsh79y1/VKjP8CRBI7owVSpbibkh2zdjbHV+tf5zNgkBiQL7xTEt6s9wBhkoTMdG4dTuGBl
X-Received: by 10.200.82.15 with SMTP id r15mr39447816qtn.75.1521771299310;
        Thu, 22 Mar 2018 19:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521771299; cv=none;
        d=google.com; s=arc-20160816;
        b=cL1Xp1uv+17ZRXH9bAQPGTeMKFDT7k/W8oI0oyp93zcvJ/c33yeZIWfOEkDt6JPidn
         2prKkcG2bL4z4PkioSTGFT1tCe61WtaMqEq+Y49eEqbSLCCpPiskxYCRrVE3aZiSJghQ
         UJjSE/QaIY9wUcnK9DvqV6IZFA4akWQ2bqyoZRrHZ9ih9BsSqcdXW2/9s8sxdH/vcEhV
         O8KCR9+0jOEgUIZLaaq/RcLmdhvAuMCJwd0K6NAse+HQPrcJX29l48nO1rzOsQVssTX1
         vvuaJ4KaSwLMLC161AJxukcez1E/am6MDVt3fswldJ7J11Sodo6QGRaYvB/YrgYpBMB8
         cZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=i3InWIVML9XDrjKTOrsINksmxn8euuw/I/Ji9rtFrQ4=;
        b=WjEnSAZzFRaW1tuSxFW/lQ27oN9EG4U62ATYtct39HcU2bSv5Fl5krwEWGuyT+e4LZ
         jU01bgdQUB76Ji5NU+1/ot0ZWcpxVTS5PmfhYHVSVCzFOsqHkluLA3tBrdbmSRTVN/EN
         Sh6PNpbFHrW4tTdktUgGROPVeK7c2PutVO2G3QwFzJeLN447gIfJ08rVe8+MpVD5E+sx
         PdKqNe9QDEPCJTnJG2D2MxjH+rBGdf5m0XrMG6ebOJmNPJKTCN8G4VdkAdjDkr03K6bd
         AdNOXAYwMFvhueSullcY1Ys7pTojepgOtlXQHDa3dkoGDYWEl8HxuL71jn9E9LvqSdB3
         rbbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oJlTRzYj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s49si8471236qth.42.2018.03.22.19.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 19:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oJlTRzYj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezCEM-00027u-NR
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 22:14:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ezCE3-00024T-S0
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 22:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ezCE0-000196-Ty
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 22:14:39 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:40987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ezCDt-00012T-35; Thu, 22 Mar 2018 22:14:29 -0400
Received: by mail-qk0-x242.google.com with SMTP id s78so11431979qkl.8;
	Thu, 22 Mar 2018 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i3InWIVML9XDrjKTOrsINksmxn8euuw/I/Ji9rtFrQ4=;
	b=oJlTRzYj5yJmktfkayquxAzlQ1m5tIR5GJtsFd6tD1gXgST4ZBr4vw2V1JjWVZ9FXv
	bmMr2gSxhMDhcxXjrWNAj0TW/S3QOZyDz5V7JFm/G9XzFAmry15vF6lCEOl5gwC5aYeS
	kd03pHjz/qT4+Pbwh7KYrTbI9IUkqHfllFBdkzKzcmFdQ1IYSBZtiPphWsTnPTzX+Vxf
	te11aq+lRb9jfGFgRdgYv5IGXN7duGLboklqyC7TOEJWmHmmDMPnB8QoUK6A4qVopkcE
	EKLz2orDnMQm29Vi9Vq0nEtK7vfor7zkwsT50f793K+b/36OAJOTkL36+dXxPGjIxRVq
	xXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=i3InWIVML9XDrjKTOrsINksmxn8euuw/I/Ji9rtFrQ4=;
	b=Fzz5fG9U65URJWkZjfxaiVqSckvp7MQwohXJmznU3S6YSxnqUe1N+iIOmNuhz2XAmZ
	IeDzCKgVCgMjT/R9f0aPzwMgSoEVTpJbqhNWV/tXtQqLkfSHw3V/UO4p6LDdFv4+pTTm
	t3UMIJcc7xUtRA8Av5MzZiZVMTB08aC8ZIK0dK9fGBAWlggSi9asGcJxDnKBZvPjbc9k
	ZXjIZhQPOje+jdVZC09iNBVyL3hhAnVYWrKQ+wUf88Su1w62LROwHqA2eB8ODzSt2ob3
	eVN3UC5Q2dXCPS+032FMt1JUrL3qIcpmrH7J+lXz0jJ7FFUyJiQoYJRmxXPOmYAqC/Pg
	Wk6g==
X-Gm-Message-State: AElRT7F9bfJAfcxcXzbGwwuNkJwAuKfVNDobkngA+aqBozJPV0qtnzgv
	36IhY8GFRHFUR1I6kL+lruk=
X-Received: by 10.55.33.37 with SMTP id h37mr38442966qkh.208.1521771267957;
	Thu, 22 Mar 2018 19:14:27 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id 16sm5750419qtp.88.2018.03.22.19.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 19:14:26 -0700 (PDT)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <16b814b8-2047-b00b-b353-7dbea365391d@amsat.org>
Date: Thu, 22 Mar 2018 23:14:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
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
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pihrWqEEh0lo

Hi Laurent,

On 03/22/2018 01:12 PM, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
> 
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
>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
>  target/xtensa/translate.c                          |  5 +-
>  tests/m48t59-test.c                                |  6 +--
>  tests/test-thread-pool.c                           |  6 +--
>  util/uri.c                                         |  5 +-
>  20 files changed, 75 insertions(+), 247 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 5ad1b919bc..55d822d410 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -644,11 +644,8 @@ static inline void *alloc_code_gen_buffer(void)
>  static inline void *alloc_code_gen_buffer(void)
>  {
>      size_t size = tcg_ctx->code_gen_buffer_size;
> -    void *buf;
> -
> -    buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
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
>      BDRVQuorumState *s = acb->bs->opaque;
> -    int i, ret;
> +    int i;
>  
>      acb->children_read = s->num_children;
>      for (i = 0; i < s->num_children; i++) {
> @@ -643,9 +643,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
>          qemu_coroutine_yield();
>      }
>  
> -    ret = acb->vote_ret;
> -
> -    return ret;
> +    return acb->vote_ret;
>  }
>  
>  static int read_fifo_child(QuorumAIOCB *acb)
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 06f9d1ffa4..d5ce275b21 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -156,12 +156,7 @@ void exynos4210_write_secondary(ARMCPU *cpu,
>  
>  static uint64_t exynos4210_calc_affinity(int cpu)
>  {
> -    uint64_t mp_affinity;
> -
> -    /* Exynos4210 has 0x9 as cluster ID */
> -    mp_affinity = (0x9 << ARM_AFF1_SHIFT) | cpu;
> -
> -    return mp_affinity;
> +    return (0x9 << ARM_AFF1_SHIFT) | cpu;

You should run spatch with --keep-comments.

>  }
>  
>  Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index f840f07dfe..3f41ca9e26 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -196,7 +196,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
>                                              Error **errp)
>  {
>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> -    uint64_t get_features;
>  
>      /* Turn on pre-defined features */
>      virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> @@ -215,9 +214,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
>          virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
>      }
>  
> -    get_features = vhost_get_features(&s->dev, user_feature_bits, features);
> -
> -    return get_features;
> +    return vhost_get_features(&s->dev, user_feature_bits, features);
>  }
>  
>  static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 15aefde09c..c5dcf3104d 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -403,13 +403,10 @@ static void dino_set_irq(void *opaque, int irq, int level)
>  static int dino_pci_map_irq(PCIDevice *d, int irq_num)
>  {
>      int slot = d->devfn >> 3;
> -    int local_irq;
>  
>      assert(irq_num >= 0 && irq_num <= 3);
>  
> -    local_irq = slot & 0x03;
> -
> -    return local_irq;
> +    return slot & 0x03;
>  }
>  
>  static void dino_set_timer_irq(void *opaque, int irq, int level)
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 8ad9fc831e..606532aa65 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -176,12 +176,8 @@ static void mos6522_set_sr_int(MOS6522State *s)
>  
>  static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
>  {
> -    uint64_t d;
> -
> -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
>                   ti->frequency, NANOSECONDS_PER_SECOND);
> -
> -    return d;
>  }
>  
>  static uint64_t mos6522_get_load_time(MOS6522State *s, MOS6522Timer *ti)
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 704f452067..3300e8ef4a 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -511,7 +511,6 @@ static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
>  
>      uint32_t cnt = 1024 * FTGMAC100_APTC_RXPOLL_CNT(s->aptcr);
>      uint32_t speed = (s->maccr & FTGMAC100_MACCR_FAST_MODE) ? 1 : 0;
> -    uint32_t period;
>  
>      if (s->aptcr & FTGMAC100_APTC_RXPOLL_TIME_SEL) {
>          cnt <<= 4;
> @@ -521,9 +520,7 @@ static uint32_t ftgmac100_rxpoll(FTGMAC100State *s)
>          speed = 2;
>      }
>  
> -    period = cnt / div[speed];
> -
> -    return period;
> +    return cnt / div[speed];
>  }
>  
>  static void ftgmac100_reset(DeviceState *d)
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index c42b4a8f6c..a77e20368e 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -125,25 +125,15 @@ static int pnv_lpc_dt_xscom(PnvXScomInterface *dev, void *fdt, int xscom_offset)
>  static bool opb_read(PnvLpcController *lpc, uint32_t addr, uint8_t *data,
>                       int sz)
>  {
> -    bool success;
> -
> -    /* XXX Handle access size limits and FW read caching here */

Ditto.

> -    success = !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
> +    return !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
>                                  data, sz, false);
> -
> -    return success;
>  }
>  
>  static bool opb_write(PnvLpcController *lpc, uint32_t addr, uint8_t *data,
>                        int sz)
>  {
> -    bool success;
> -
> -    /* XXX Handle access size limits here */

Ditto.

> -    success = !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
> +    return !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
>                                  data, sz, true);
> -
> -    return success;
>  }
>  
>  #define ECCB_CTL_READ           PPC_BIT(15)
> diff --git a/io/net-listener.c b/io/net-listener.c
> index 555e8acaa4..3317aa6e5f 100644
> --- a/io/net-listener.c
> +++ b/io/net-listener.c
> @@ -25,11 +25,7 @@
>  
>  QIONetListener *qio_net_listener_new(void)
>  {
> -    QIONetListener *ret;
> -
> -    ret = QIO_NET_LISTENER(object_new(TYPE_QIO_NET_LISTENER));
> -
> -    return ret;
> +    return QIO_NET_LISTENER(object_new(TYPE_QIO_NET_LISTENER));
>  }
>  
>  void qio_net_listener_set_name(QIONetListener *listener,
> diff --git a/target/i386/hax-darwin.c b/target/i386/hax-darwin.c
> index acdde476a0..a5426a6dac 100644
> --- a/target/i386/hax-darwin.c
> +++ b/target/i386/hax-darwin.c
> @@ -257,10 +257,7 @@ int hax_host_setup_vcpu_channel(struct hax_vcpu_state *vcpu)
>  
>  int hax_vcpu_run(struct hax_vcpu_state *vcpu)
>  {
> -    int ret;
> -
> -    ret = ioctl(vcpu->fd, HAX_VCPU_IOCTL_RUN, NULL);
> -    return ret;
> +    return ioctl(vcpu->fd, HAX_VCPU_IOCTL_RUN, NULL);
>  }
>  
>  int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set)
> @@ -315,13 +312,12 @@ int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state, int set)
>  
>  int hax_inject_interrupt(CPUArchState *env, int vector)
>  {
> -    int ret, fd;
> +    int fd;
>  
>      fd = hax_vcpu_get_fd(env);
>      if (fd <= 0) {
>          return -1;
>      }
>  
> -    ret = ioctl(fd, HAX_VCPU_IOCTL_INTERRUPT, &vector);
> -    return ret;
> +    return ioctl(fd, HAX_VCPU_IOCTL_INTERRUPT, &vector);
>  }
> diff --git a/target/mips/dsp_helper.c b/target/mips/dsp_helper.c
> index f152fea34a..739b69dd45 100644
> --- a/target/mips/dsp_helper.c
> +++ b/target/mips/dsp_helper.c
> @@ -3274,14 +3274,11 @@ target_ulong helper_dextr_l(target_ulong ac, target_ulong shift,
>                              CPUMIPSState *env)
>  {
>      uint64_t temp[3];
> -    target_ulong result;
>  
>      shift = shift & 0x3F;
>  
>      mipsdsp_rndrashift_acc(temp, ac, shift, env);
> -    result = (temp[1] << 63) | (temp[0] >> 1);
> -
> -    return result;
> +    return (temp[1] << 63) | (temp[0] >> 1);
>  }
>  
>  target_ulong helper_dextr_r_l(target_ulong ac, target_ulong shift,
> @@ -3289,7 +3286,6 @@ target_ulong helper_dextr_r_l(target_ulong ac, target_ulong shift,
>  {
>      uint64_t temp[3];
>      uint32_t temp128;
> -    target_ulong result;
>  
>      shift = shift & 0x3F;
>      mipsdsp_rndrashift_acc(temp, ac, shift, env);
> @@ -3309,9 +3305,7 @@ target_ulong helper_dextr_r_l(target_ulong ac, target_ulong shift,
>          set_DSPControl_overflow_flag(1, 23, env);
>      }
>  
> -    result = (temp[1] << 63) | (temp[0] >> 1);
> -
> -    return result;
> +    return (temp[1] << 63) | (temp[0] >> 1);
>  }
>  
>  target_ulong helper_dextr_rs_l(target_ulong ac, target_ulong shift,
> @@ -3319,7 +3313,6 @@ target_ulong helper_dextr_rs_l(target_ulong ac, target_ulong shift,
>  {
>      uint64_t temp[3];
>      uint32_t temp128;
> -    target_ulong result;
>  
>      shift = shift & 0x3F;
>      mipsdsp_rndrashift_acc(temp, ac, shift, env);
> @@ -3345,9 +3338,7 @@ target_ulong helper_dextr_rs_l(target_ulong ac, target_ulong shift,
>          }
>          set_DSPControl_overflow_flag(1, 23, env);
>      }
> -    result = (temp[1] << 63) | (temp[0] >> 1);
> -
> -    return result;
> +    return (temp[1] << 63) | (temp[0] >> 1);
>  }
>  #endif
>  
> diff --git a/target/xtensa/core-dc232b/xtensa-modules.c b/target/xtensa/core-dc232b/xtensa-modules.c
> index d322c3f52a..164df3b1a4 100644
> --- a/target/xtensa/core-dc232b/xtensa-modules.c
> +++ b/target/xtensa/core-dc232b/xtensa-modules.c
> @@ -1736,9 +1736,7 @@ Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_arr_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1750,9 +1748,7 @@ Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1764,9 +1760,7 @@ Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_art_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1778,9 +1772,7 @@ Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1792,9 +1784,7 @@ Operand_ar4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar4_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1806,9 +1796,7 @@ Operand_ar8_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar8_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1820,9 +1808,7 @@ Operand_ar12_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar12_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1834,9 +1820,7 @@ Operand_ars_entry_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_entry_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -2406,9 +2390,7 @@ Operand_mx_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mx_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2436,9 +2418,7 @@ Operand_mw_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mw_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2450,9 +2430,7 @@ Operand_mr0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2464,9 +2442,7 @@ Operand_mr1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr1_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2478,9 +2454,7 @@ Operand_mr2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr2_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2492,9 +2466,7 @@ Operand_mr3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr3_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> diff --git a/target/xtensa/core-dc233c/xtensa-modules.c b/target/xtensa/core-dc233c/xtensa-modules.c
> index 7c20f82349..0f32f0804a 100644
> --- a/target/xtensa/core-dc233c/xtensa-modules.c
> +++ b/target/xtensa/core-dc233c/xtensa-modules.c
> @@ -1817,9 +1817,7 @@ Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_arr_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1831,9 +1829,7 @@ Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1845,9 +1841,7 @@ Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_art_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1859,9 +1853,7 @@ Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1873,9 +1865,7 @@ Operand_ar4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar4_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1887,9 +1877,7 @@ Operand_ar8_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar8_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1901,9 +1889,7 @@ Operand_ar12_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar12_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -1915,9 +1901,7 @@ Operand_ars_entry_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_entry_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x1f) != 0;
> -  return error;
> +  return (*valp & ~0x1f) != 0;
>  }
>  
>  static int
> @@ -2487,9 +2471,7 @@ Operand_mx_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mx_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2517,9 +2499,7 @@ Operand_mw_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mw_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2531,9 +2511,7 @@ Operand_mr0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2545,9 +2523,7 @@ Operand_mr1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr1_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2559,9 +2535,7 @@ Operand_mr2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr2_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> @@ -2573,9 +2547,7 @@ Operand_mr3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_mr3_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3) != 0;
> -  return error;
> +  return (*valp & ~0x3) != 0;
>  }
>  
>  static int
> diff --git a/target/xtensa/core-de212/xtensa-modules.c b/target/xtensa/core-de212/xtensa-modules.c
> index ef7674de3a..480c68d3c6 100644
> --- a/target/xtensa/core-de212/xtensa-modules.c
> +++ b/target/xtensa/core-de212/xtensa-modules.c
> @@ -1798,9 +1798,7 @@ OperandSem_opnd_sem_AR_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1812,9 +1810,7 @@ OperandSem_opnd_sem_AR_0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1826,9 +1822,7 @@ OperandSem_opnd_sem_AR_1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_1_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1840,9 +1834,7 @@ OperandSem_opnd_sem_AR_2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_2_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1854,9 +1846,7 @@ OperandSem_opnd_sem_AR_3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_3_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1868,9 +1858,7 @@ OperandSem_opnd_sem_AR_4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_4_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -2464,9 +2452,7 @@ OperandSem_opnd_sem_MR_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 4);
> -  return error;
> +  return (*valp >= 4);
>  }
>  
>  static int
> @@ -2478,9 +2464,7 @@ OperandSem_opnd_sem_MR_1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_1_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 4);
> -  return error;
> +  return (*valp >= 4);
>  }
>  
>  static int
> @@ -2492,9 +2476,7 @@ OperandSem_opnd_sem_MR_2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_2_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 4);
> -  return error;
> +  return (*valp >= 4);
>  }
>  
>  static int
> @@ -2506,9 +2488,7 @@ OperandSem_opnd_sem_MR_3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_3_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 4);
> -  return error;
> +  return (*valp >= 4);
>  }
>  
>  static int
> @@ -2520,9 +2500,7 @@ OperandSem_opnd_sem_MR_4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_4_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 4);
> -  return error;
> +  return (*valp >= 4);
>  }
>  
>  static int
> @@ -2534,9 +2512,7 @@ OperandSem_opnd_sem_MR_5_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_MR_5_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 4);
> -  return error;
> +  return (*valp >= 4);
>  }
>  
>  static int
> diff --git a/target/xtensa/core-fsf/xtensa-modules.c b/target/xtensa/core-fsf/xtensa-modules.c
> index f7de2dec15..c32683ff77 100644
> --- a/target/xtensa/core-fsf/xtensa-modules.c
> +++ b/target/xtensa/core-fsf/xtensa-modules.c
> @@ -1379,9 +1379,7 @@ Operand_arr_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_arr_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1393,9 +1391,7 @@ Operand_ars_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1407,9 +1403,7 @@ Operand_art_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_art_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0xf) != 0;
> -  return error;
> +  return (*valp & ~0xf) != 0;
>  }
>  
>  static int
> @@ -1421,9 +1415,7 @@ Operand_ar0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3f) != 0;
> -  return error;
> +  return (*valp & ~0x3f) != 0;
>  }
>  
>  static int
> @@ -1435,9 +1427,7 @@ Operand_ar4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar4_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3f) != 0;
> -  return error;
> +  return (*valp & ~0x3f) != 0;
>  }
>  
>  static int
> @@ -1449,9 +1439,7 @@ Operand_ar8_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar8_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3f) != 0;
> -  return error;
> +  return (*valp & ~0x3f) != 0;
>  }
>  
>  static int
> @@ -1463,9 +1451,7 @@ Operand_ar12_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ar12_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3f) != 0;
> -  return error;
> +  return (*valp & ~0x3f) != 0;
>  }
>  
>  static int
> @@ -1477,9 +1463,7 @@ Operand_ars_entry_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  Operand_ars_entry_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp & ~0x3f) != 0;
> -  return error;
> +  return (*valp & ~0x3f) != 0;
>  }
>  
>  static int
> diff --git a/target/xtensa/core-sample_controller/xtensa-modules.c b/target/xtensa/core-sample_controller/xtensa-modules.c
> index fba41b99ae..7e87d216bd 100644
> --- a/target/xtensa/core-sample_controller/xtensa-modules.c
> +++ b/target/xtensa/core-sample_controller/xtensa-modules.c
> @@ -1570,9 +1570,7 @@ OperandSem_opnd_sem_AR_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1584,9 +1582,7 @@ OperandSem_opnd_sem_AR_0_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_0_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1598,9 +1594,7 @@ OperandSem_opnd_sem_AR_1_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_1_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1612,9 +1606,7 @@ OperandSem_opnd_sem_AR_2_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_2_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1626,9 +1618,7 @@ OperandSem_opnd_sem_AR_3_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_3_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
>  static int
> @@ -1640,9 +1630,7 @@ OperandSem_opnd_sem_AR_4_decode (uint32 *valp ATTRIBUTE_UNUSED)
>  static int
>  OperandSem_opnd_sem_AR_4_encode (uint32 *valp)
>  {
> -  int error;
> -  error = (*valp >= 32);
> -  return error;
> +  return (*valp >= 32);
>  }
>  
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
> -    ops = bsearch(name, t->opcode, t->num_opcodes,
> +    return bsearch(name, t->opcode, t->num_opcodes,
>                    sizeof(XtensaOpcodeOps), compare_opcode_ops);
> -    return ops;
>  }
>  
>  static void translate_abs(DisasContext *dc, const uint32_t arg[],
> diff --git a/tests/m48t59-test.c b/tests/m48t59-test.c
> index 26af7d6e8e..5b695971c7 100644
> --- a/tests/m48t59-test.c
> +++ b/tests/m48t59-test.c
> @@ -256,8 +256,6 @@ static void base_setup(void)
>  
>  int main(int argc, char **argv)
>  {
> -    int ret;
> -
>      base_setup();
>  
>      g_test_init(&argc, &argv, NULL);
> @@ -267,7 +265,5 @@ int main(int argc, char **argv)
>          qtest_add_func("/rtc/bcd-check-time", bcd_check_time);
>      }
>      qtest_add_func("/rtc/fuzz-registers", fuzz_registers);
> -    ret = g_test_run();
> -
> -    return ret;
> +    return g_test_run();
>  }
> diff --git a/tests/test-thread-pool.c b/tests/test-thread-pool.c
> index 91b4ec5524..9cdccb3a47 100644
> --- a/tests/test-thread-pool.c
> +++ b/tests/test-thread-pool.c
> @@ -224,8 +224,6 @@ static void test_cancel_async(void)
>  
>  int main(int argc, char **argv)
>  {
> -    int ret;
> -
>      qemu_init_main_loop(&error_abort);
>      ctx = qemu_get_current_aio_context();
>      pool = aio_get_thread_pool(ctx);
> @@ -238,7 +236,5 @@ int main(int argc, char **argv)
>      g_test_add_func("/thread-pool/cancel", test_cancel);
>      g_test_add_func("/thread-pool/cancel-async", test_cancel_async);
>  
> -    ret = g_test_run();
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
> -    ret = g_new0(URI, 1);
> -    return ret;
> +    return g_new0(URI, 1);
>  }
>  
>  /**
> 
