Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C105606A327
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nc2AzeMx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNyPM-00051Z-9R; Mon, 02 Nov 2026 15:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xNyP5-0004yP-4i
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 15:13:15 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xNyOz-0006I3-S3
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 15:13:14 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-49de8ea072cso1545189fac.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 12:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650387; cv=none;
 d=google.com; s=arc-20260327;
 b=ehwA4jepGgu6l+8B7NtCaoAtzvzPYfYBPf/+y8glVldYSnGfQkeDyM1Cb+2nFHD+60
 5W8mkzesA7Bgg2SrB/T9CM0iDgWWOD2DtPPoDLXZCj6qkGGRD3VY9Fg2kwgSQZi5TiNa
 CYx4NBG6N3TjKGDCBuUAbP3fbOEdk296TQ6Y+JcTp6/yR/xmeZCuZ0M58jPwZFS+mKvr
 SCpcWn37GTHws274V29Uxse9wvqniywa+G8TeuCmqntUaxE5S//5W8ZxLQSs3+nIAtmz
 DMlkNjibYiNoAEI1VayWSbxDjT64ptOPXIU0jugu9KVRPm0kDWNJcV3VcE6XwHAMtx/m
 Chbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:dkim-signature;
 bh=BkLW/Qjl9XWp0QSmgsBLzmampHJZpInrPaB+53G/Ds4=;
 fh=Kjt++46HaJ775hto2pguE3/cEadKhzbZumLwAW802v0=;
 b=hYVSova6NAHpF9nbgQ3rAEhAeD6HId3LXRu4MKj2jkWmcXXKreFOWpXK1ESu35sKeD
 xQe1Hd3MC7m6P/+TxGsaP5B/y6V+7pgFs/r93TeVbLv0IqXqazdUKUln0+nAonzkorMI
 rwLnkYxQQBTwYHfy0FsUmr4gmAn/9HiX1W/i+UmAvZxe3NrbePgPJplpB8qDfi4LXMKR
 jJ4VcHyR/L2pSUfF5neoL8ZxagRw31hUkPJa01sUKW26LoBeD9HnwqQCgcEGLHkeitzR
 E+HKD6mjs7tZsQCVT6g7R6IU1xmKL9YbJZ21XecYM960r3P+X6ucgGl/zUGUtQGH0gSx
 EdNA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793650387; x=1794255187; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BkLW/Qjl9XWp0QSmgsBLzmampHJZpInrPaB+53G/Ds4=;
 b=Nc2AzeMxfJlXZdIxYMv7a/UhEpOj7evD4lvn2plVhJYLBYSY9ZvbQ9gH5q+LPPHn/T
 8UlJCdJ9Z19o9U+4Vh2MLEmQx0WZNRRRrw0ZgvFJiCAcc12y1G/uo6S7X2hni0acMGFY
 TCZiP1/IBz+GHKootna8LctT9cLmYiPo3hvRhxle99XYNdj2aGWrzCv1zJc1+Paxxhn3
 dPVCkKH9unuNdY+f64oe+7l8iMIUQE9G4gKfHHBjtj1Z+Ai5uNl5uElVBpTgdKRRQMIf
 SjMb7InUT4s6LPLGyobP1B2NtZlkA27atYNiRjORo7xjnc6fwOKOXiGqUtPuJOYNPFQ7
 oK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793650387; x=1794255187;
 h=content-type:cc:to:subject:message-id:date:mime-version:references
 :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BkLW/Qjl9XWp0QSmgsBLzmampHJZpInrPaB+53G/Ds4=;
 b=tM1E7EdhavC+KjA9x3pW31PQMrYhZ36M7GJLYwx8nhXcGp9evx0w1UDa4ETQV7d2hB
 IYvq12qzbwuK0Tn5cDbRXWAskSEJeEGFROLdxbuOaDJK5ttuKQWZrakBs1TV2LYtNYn5
 ylqsTwkxp+kNvQcUHMBanH8VUh8NNMqEdXEUTS4lH3NPeUMoy4b8NA3Mi1B8UTT3hYN6
 KEZERgGVUUjbS4nrrQquN4eQkUkQ/g3RaKrX1MdEl+5vWKftMh66PFkHpsJrCj7SzToX
 vgyZNFnNGMHRUThAp8CpvhkHst0aNBYkSJWTtzaEIhM5nPmZHD1yhHzJ5tPyDvYm04jt
 ra4A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqFX7WHfllTpb1i2I20AFKQmLRbt79nxgmFQxBncCprz1Sz/n8zLVzF21m8HzIVxxkQU623YVSNA==@nongnu.org
X-Gm-Message-State: APuU4Z/u8iABA+Y8DgLQJDhgrF4OGZeulNlHTplt06OxP/qzwBXP4a06
 KpRCawhVWXFGMDf27P+UDiHfUYLL8s5Tdc1iEKRvuUaVtXJJzQjmal8ZDhmDEIr+2NHuy4B/dY0
 Heifdf81Z3CvPN9PiAkmc+WnDoBCYBjI=
X-Gm-Gg: AYBFou2aRjE1H4pMKFpB4AdrvlmcnakT8KDde41WwbB+FYoggMy7OHLRoFIZIarIio8
 YSmBdY0X6Zuo4jRcwzcZo/iuW1pciwmyaL8Ps4y2Q7I6Kg0gJwulQOYbRPM+ewxapss5MebiWbA
 auBcsraliZR7O82ucvOLYPp77+/aA7xMxCQw8ftfKf+xMLm/+qIzj390/aG97Wt9uIwA1S1GJbR
 00/p8M8SxEM+Gv6oT3lsL22CGexStyr9hau7G0NjLLMAWY74ARbF1YfNrAiCX8mLh4JpW0gBH7I
 DHG5vvWN5Qzie+7kJZ+VZOc3CKxYWV/gKJlLqOAIML7hiS9PI0n8IBIlKX1eNRgDo72j4IUdoBW
 ADPQriT8RqrRMVRjIe4rqlueCENq8J7bQuJ8cwGc7kjaZHQAFIMrlE+jaGA0bwFmTnoZIKr6iFD
 4CI0X8gmX3mGcHUEd4CqTza70kE0980mE/Df5PaGYmiLk=
X-Received: by 2002:a05:687c:250d:b0:4a9:58d3:b60d with SMTP id
 586e51a60fabf-4a958d3b7afmr2239390fac.2.1793650386884; Mon, 02 Nov 2026
 12:13:06 -0800 (PST)
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Nov 2026 15:13:05 -0500
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Nov 2026 12:13:05 -0800
From: Marcelo Manzo <marcelomanzo@gmail.com>
In-Reply-To: <fdaf96319d81b2b6602822fd5881a5b5a72e5daa.1793613972.git.lorandmarton.dev@gmail.com>
References: <fdaf96319d81b2b6602822fd5881a5b5a72e5daa.1793613972.git.lorandmarton.dev@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 2 Nov 2026 15:13:05 -0500
X-Gm-Features: AclHuK8kkevGmGIuDM8hwp2roLqlv3DEzY5uyLlVWlKcLRFvRCKzbREZpBeNA7o
Message-ID: <CAGaQodLx3Nu58RrFgcWNBqyYkuZO1e71Wkz2n+pDmzOwwiRbWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/net/bcm2838_genet: hold RX frames while the ring
 is full
To: lorandmarton.dev@gmail.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com, 
 qemu-arm@nongnu.org, farosas@suse.de, lvivier@redhat.com,
 pbonzini@redhat.com, jasowangio@gmail.com, serg.oker@gmail.com
Content-Type: multipart/alternative; boundary="00000000000029604b065f50c6d6"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000029604b065f50c6d6
Content-Type: text/plain; charset="UTF-8"

Hi Lorand,

I tested this patch together with 1/2 on our v6 series, running a stock
Raspberry Pi OS Trixie guest. A 300 MB download through GENET completed at
about 28 MB/s with no timeouts or checksum errors in the guest log, and the
new tests/qtest/bcm2838-genet-test.c passes.

Tested-by: Marcelo Manzo <marcelomanzo@gmail.com>

Marcelo

On Mon, Nov 02, 2026 05:51 AM, Lorand Marton <lorandmarton.dev@gmail.com>
wrote:

> bcm2838_genet_rdma() never looked at the consumer index of the RX
> ring: it wrote each frame to the next descriptor whatever the guest
> had read, so a burst longer than the ring (Linux bcmgenet gives the
> default ring 256 descriptors) overwrote frames the guest had not taken
> yet, and the producer index ran more than a ring ahead of the consumer
> index, which bcmgenet_desc_rx() does not expect.
>
> Count the free descriptors of the ring from its start and end
> addresses and the two indexes. When there are none, return 0 so that
> the net layer keeps the frame queued, and flush the queue when the
> guest writes the consumer index of an RX ring, as e1000 does on a
> write of RDT. If the ring fills inside a frame that takes several
> descriptors, stop there instead of writing past the consumer index.
>
> Real GENET drops such frames and counts them in the DISCARD_CNT field
> of the producer index; holding them costs no frame on a slow host and
> matches the other QEMU NICs.
>
> Test that a ring of 4 descriptors keeps 6 frames apart until the
> guest moves its consumer index.
>
> Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
> ---
>  hw/net/bcm2838_genet.c           |  38 +++++++++++
>  tests/qtest/bcm2838-genet-test.c | 107 ++++++++++++++++++++++++++++++-
>  2 files changed, 143 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
> index 557a8a9636..92d550cb63 100644
> --- a/hw/net/bcm2838_genet.c
> +++ b/hw/net/bcm2838_genet.c
> @@ -779,6 +779,13 @@ static void bcm2838_genet_write(void *opaque, hwaddr
> offset, uint64_t value,
>          FIELD_EX32(value, GENET_DMA_CTRL, EN)) {
>          qemu_flush_queued_packets(ncs);
>      }
> +    /* The guest gave descriptors back to an RX ring */
> +    if (offset >= BCM2838_GENET_RDMA_RINGS &&
> +        offset < BCM2838_GENET_RDMA_RINGS + sizeof(s->regs.rdma.rings) &&
> +        (offset - BCM2838_GENET_RDMA_RINGS) % sizeof(BCM2838GenetRdmaRing)
> +        == BCM2838_GENET_RRING_CONS_INDEX) {
> +        qemu_flush_queued_packets(ncs);
> +    }
>      bcm2838_genet_set_irq_default(s);
>      bcm2838_genet_set_irq_prio(s);
>  }
> @@ -823,6 +830,23 @@ static bool is_packet_multicast(const uint8_t *buf,
> size_t size)
>      return !!(buf[0] & 0x01);
>  }
>
> +/*
> + * Descriptors of an RX ring that the guest has handed back: the ring
> + * holds END - START + 1 of them, and PROD - CONS (modulo 2^16) are full.
> + */
> +static unsigned bcm2838_genet_rdma_free_descs(BCM2838GenetRdmaRing *ring,
> +                                              hwaddr start_index,
> +                                              hwaddr end_index)
> +{
> +    uint16_t used = FIELD_EX32(ring->prod_index, GENET_DMA_PROD_INDEX,
> INDEX)
> +                    - FIELD_EX32(ring->cons_index, GENET_DMA_CONS_INDEX,
> INDEX);
> +
> +    if (end_index < start_index || used > end_index - start_index) {
> +        return 0;
> +    }
> +    return end_index - start_index + 1 - used;
> +}
> +
>  static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t
> ring_idx,
>                                    const void *buf, size_t size)
>  {
> @@ -855,6 +879,12 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState
> *s, uint32_t ring_idx,
>                        BCM2838_GENET_DMA_DESC_CNT - 1);
>          return -1;
>      }
> +
> +    /* A full ring: keep the frame queued until the guest frees some */
> +    if (!bcm2838_genet_rdma_free_descs(ring, start_index, end_index)) {
> +        return 0;
> +    }
> +
>      desc = &rdma->descs[write_index];
>
>      desc->length_status = FIELD_DP32(desc->length_status,
> @@ -948,6 +978,14 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState
> *s, uint32_t ring_idx,
>          desc = &rdma->descs[write_index];
>          ring->write_ptr = write_index * desc_word_size;
>          ring->write_ptr_hi = ((hwaddr)write_index * desc_word_size) >> 32;
> +
> +        if (len < size &&
> +            !bcm2838_genet_rdma_free_descs(ring, start_index,
> end_index)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: RX ring %u full inside a frame\n",
> +                          __func__, ring_idx);
> +            break;
> +        }
>      }
>
>      if (ring_idx == BCM2838_GENET_DMA_RING_DEFAULT) {
> diff --git a/tests/qtest/bcm2838-genet-test.c
> b/tests/qtest/bcm2838-genet-test.c
> index 393abd7da2..35653773d1 100644
> --- a/tests/qtest/bcm2838-genet-test.c
> +++ b/tests/qtest/bcm2838-genet-test.c
> @@ -1,8 +1,8 @@
>  /*
>   * QTest testcase for the BCM2838 GENET DMA rings
>   *
> - * Frames go out over a socket netdev. The producer and consumer indexes
> - * of a ring count modulo 2^16.
> + * Frames come in and go out over a socket netdev. The producer and
> + * consumer indexes of a ring count modulo 2^16.
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> @@ -14,8 +14,16 @@
>
>  #define GENET_BASE          0xfd580000
>
> +#define RDMA_DESC(i)        (0x2000 + (i) * 12)
> +#define RDMA_RING(r)        (0x2c00 + (r) * 0x40)
> +#define RING_WRITE_PTR      0x00
> +#define RING_PROD_INDEX     0x08
> +#define RING_CONS_INDEX     0x0c
> +#define RING_BUF_SIZE       0x10
>  #define RING_START_ADDR     0x14
>  #define RING_END_ADDR       0x1c
> +#define RDMA_RING_CFG       0x3040
> +#define RDMA_CTRL           0x3044
>
>  #define TDMA_DESC(i)        (0x4000 + (i) * 12)
>  #define TDMA_RING(r)        (0x4c00 + (r) * 0x40)
> @@ -26,9 +34,11 @@
>  #define TDMA_CTRL           0x5044
>  #define TSB_LEN             64      /* transmit status block */
>
> +#define DEFAULT_RING        16
>  #define DESCS_PER_RING      4
>  #define BUF_SIZE            2048
>  #define BUF_BASE            0x100000
> +#define STATUS_LEN          64      /* receive status block, then 2 bytes
> */
>  #define FRAME_LEN           60
>
>  static void genet_writel(QTestState *qts, uint32_t off, uint32_t val)
> @@ -41,6 +51,98 @@ static uint32_t genet_readl(QTestState *qts, uint32_t
> off)
>      return qtest_readl(qts, GENET_BASE + off);
>  }
>
> +/* The default ring uses the first DESCS_PER_RING descriptors */
> +static QTestState *genet_rx_init(int *fd)
> +{
> +    const unsigned r = DEFAULT_RING;
> +    int sv[2];
> +    QTestState *qts;
> +
> +    g_assert_cmpint(socketpair(PF_UNIX, SOCK_STREAM, 0, sv), ==, 0);
> +    qts = qtest_initf("-M raspi4b -nic socket,fd=%d,model=bcm2838-genet",
> +                      sv[1]);
> +    close(sv[1]);
> +    *fd = sv[0];
> +
> +    for (unsigned i = 0; i < DESCS_PER_RING; i++) {
> +        genet_writel(qts, RDMA_DESC(i) + 4, BUF_BASE + i * BUF_SIZE);
> +        genet_writel(qts, RDMA_DESC(i) + 8, 0);
> +    }
> +    genet_writel(qts, RDMA_RING(r) + RING_START_ADDR, 0);
> +    genet_writel(qts, RDMA_RING(r) + RING_END_ADDR, (DESCS_PER_RING - 1)
> * 3);
> +    genet_writel(qts, RDMA_RING(r) + RING_WRITE_PTR, 0);
> +    genet_writel(qts, RDMA_RING(r) + RING_BUF_SIZE, BUF_SIZE);
> +    genet_writel(qts, RDMA_RING_CFG, BIT(r));
> +    genet_writel(qts, RDMA_CTRL, 1 | BIT(1 + r));
> +    return qts;
> +}
> +
> +static uint32_t prod_index(QTestState *qts, unsigned r)
> +{
> +    return genet_readl(qts, RDMA_RING(r) + RING_PROD_INDEX) & 0xffff;
> +}
> +
> +/* Send a broadcast frame into the socket netdev */
> +static void send_frame(int fd, uint16_t ethertype, uint8_t byte14)
> +{
> +    uint8_t pkt[4 + FRAME_LEN] = { 0 };
> +
> +    stl_be_p(pkt, FRAME_LEN);
> +    memset(pkt + 4, 0xff, 6);
> +    stw_be_p(pkt + 4 + 12, ethertype);
> +    pkt[4 + 14] = byte14;
> +    g_assert_cmpint(send(fd, pkt, sizeof(pkt), 0), ==, sizeof(pkt));
> +}
> +
> +/* The byte at 14 of the frame that descriptor I holds */
> +static uint8_t rx_byte14(QTestState *qts, unsigned i)
> +{
> +    return qtest_readb(qts, BUF_BASE + i * BUF_SIZE + STATUS_LEN + 2 +
> 14);
> +}
> +
> +/* Wait up to MS milliseconds for the producer index of ring R to be N */
> +static bool wait_prod_index(QTestState *qts, unsigned r, uint32_t n,
> +                            unsigned ms)
> +{
> +    gint64 end = g_get_monotonic_time() + ms * G_TIME_SPAN_MILLISECOND;
> +
> +    do {
> +        qtest_clock_step(qts, 100);
> +        if (prod_index(qts, r) == n) {
> +            return true;
> +        }
> +    } while (g_get_monotonic_time() < end);
> +    return false;
> +}
> +
> +/* A full RX ring keeps the next frames until the guest frees descriptors
> */
> +static void test_rx_ring_full(void)
> +{
> +    const unsigned n = DESCS_PER_RING + 2;
> +    int fd;
> +    QTestState *qts = genet_rx_init(&fd);
> +
> +    for (unsigned i = 0; i < n; i++) {
> +        send_frame(fd, 0x0800, i);
> +    }
> +    g_assert(wait_prod_index(qts, DEFAULT_RING, DESCS_PER_RING, 5000));
> +    /* the rest must not overwrite descriptors the guest has not read */
> +    g_assert(!wait_prod_index(qts, DEFAULT_RING, DESCS_PER_RING + 1,
> 500));
> +    for (unsigned i = 0; i < DESCS_PER_RING; i++) {
> +        g_assert_cmpuint(rx_byte14(qts, i), ==, i);
> +    }
> +
> +    genet_writel(qts, RDMA_RING(DEFAULT_RING) + RING_CONS_INDEX, 2);
> +    g_assert(wait_prod_index(qts, DEFAULT_RING, n, 5000));
> +    for (unsigned i = 0; i < n; i++) {
> +        g_assert_cmpuint(rx_byte14(qts, i % DESCS_PER_RING), ==,
> +                         i < 2 ? i + DESCS_PER_RING : i);
> +    }
> +
> +    qtest_quit(qts);
> +    close(fd);
> +}
> +
>  /* Transmit across the wrap of the 16-bit consumer index */
>  static void test_tx_index_wrap(void)
>  {
> @@ -96,6 +198,7 @@ static void test_tx_index_wrap(void)
>  int main(int argc, char **argv)
>  {
>      g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/bcm2838-genet/rx-ring-full", test_rx_ring_full);
>      qtest_add_func("/bcm2838-genet/tx-index-wrap", test_tx_index_wrap);
>      return g_test_run();
>  }
> --
> 2.56.0
>
>

--00000000000029604b065f50c6d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div dir=3D"auto">Hi Lorand,<br><br>I tested this patch togethe=
r with 1/2 on our v6 series, running a stock Raspberry Pi OS Trixie guest. =
A 300 MB download through GENET completed at about 28 MB/s with no timeouts=
 or checksum errors in the guest log, and the new tests/qtest/bcm2838-genet=
-test.c passes.<br><br>Tested-by: Marcelo Manzo &lt;<a href=3D"mailto:marce=
lomanzo@gmail.com">marcelomanzo@gmail.com</a>&gt;<br><br>Marcelo<br></div><=
/body></html><br><div class=3D"gmail_extra"><div>On Mon, Nov 02, 2026 05:51=
 AM, Lorand Marton &lt;<a href=3D"mailto:lorandmarton.dev@gmail.com">lorand=
marton.dev@gmail.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">bcm28=
38_genet_rdma() never looked at the consumer index of the RX<br>
ring: it wrote each frame to the next descriptor whatever the guest<br>
had read, so a burst longer than the ring (Linux bcmgenet gives the<br>
default ring 256 descriptors) overwrote frames the guest had not taken<br>
yet, and the producer index ran more than a ring ahead of the consumer<br>
index, which bcmgenet_desc_rx() does not expect.<br>
<br>
Count the free descriptors of the ring from its start and end<br>
addresses and the two indexes. When there are none, return 0 so that<br>
the net layer keeps the frame queued, and flush the queue when the<br>
guest writes the consumer index of an RX ring, as e1000 does on a<br>
write of RDT. If the ring fills inside a frame that takes several<br>
descriptors, stop there instead of writing past the consumer index.<br>
<br>
Real GENET drops such frames and counts them in the DISCARD_CNT field<br>
of the producer index; holding them costs no frame on a slow host and<br>
matches the other QEMU NICs.<br>
<br>
Test that a ring of 4 descriptors keeps 6 frames apart until the<br>
guest moves its consumer index.<br>
<br>
Signed-off-by: Lorand Marton &lt;<a href=3D"mailto:lorandmarton.dev@gmail.c=
om" target=3D"_blank">lorandmarton.dev@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/net/bcm2838_genet.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 38 +++++++++++<br>
=C2=A0tests/qtest/bcm2838-genet-tes<wbr>t.c | 107 +++++++++++++++++++++++++=
+++++<wbr>-<br>
=C2=A02 files changed, 143 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c<br>
index 557a8a9636..92d550cb63 100644<br>
--- a/hw/net/bcm2838_genet.c<br>
+++ b/hw/net/bcm2838_genet.c<br>
@@ -779,6 +779,13 @@ static void bcm2838_genet_write(void *opaque, hwaddr o=
ffset, uint64_t value,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(value, GENET_DMA_CTRL, EN)) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_flush_queued_packets(<wbr>ncs);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 /* The guest gave descriptors back to an RX ring */<br>
+=C2=A0 =C2=A0 if (offset &gt;=3D BCM2838_GENET_RDMA_RINGS &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset &lt; BCM2838_GENET_RDMA_RINGS + sizeof(=
s-&gt;regs.rdma.rings) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (offset - BCM2838_GENET_RDMA_RINGS) % sizeof(B=
CM2838GenetRdmaRing)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D BCM2838_GENET_RRING_CONS_INDEX<wbr>) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(ncs)<wbr>;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0bcm2838_genet_set_irq_<wbr>default(s);<br>
=C2=A0 =C2=A0 =C2=A0bcm2838_genet_set_irq_prio(s)<wbr>;<br>
=C2=A0}<br>
@@ -823,6 +830,23 @@ static bool is_packet_multicast(const uint8_t *buf, si=
ze_t size)<br>
=C2=A0 =C2=A0 =C2=A0return !!(buf[0] &amp; 0x01);<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Descriptors of an RX ring that the guest has handed back: the ring<br>
+ * holds END - START + 1 of them, and PROD - CONS (modulo 2^16) are full.<=
br>
+ */<br>
+static unsigned bcm2838_genet_rdma_free_descs(<wbr>BCM2838GenetRdmaRing *r=
ing,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 hwaddr start_index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 hwaddr end_index)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t used =3D FIELD_EX32(ring-&gt;prod_index, GENET_DMA_=
PROD_INDEX, INDEX)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - FI=
ELD_EX32(ring-&gt;cons_index, GENET_DMA_CONS_INDEX, INDEX);<br>
+<br>
+=C2=A0 =C2=A0 if (end_index &lt; start_index || used &gt; end_index - star=
t_index) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return end_index - start_index + 1 - used;<br>
+}<br>
+<br>
=C2=A0static ssize_t bcm2838_genet_rdma(BCM2838Gene<wbr>tState *s, uint32_t=
 ring_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *buf, size_t=
 size)<br>
=C2=A0{<br>
@@ -855,6 +879,12 @@ static ssize_t bcm2838_genet_rdma(BCM2838Gene<wbr>tSta=
te *s, uint32_t ring_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BCM2838_GENET_DMA_DESC_CNT - 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 /* A full ring: keep the frame queued until the guest frees =
some */<br>
+=C2=A0 =C2=A0 if (!bcm2838_genet_rdma_free_desc<wbr>s(ring, start_index, e=
nd_index)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0desc =3D &amp;rdma-&gt;descs[write_index];<br>
<br>
=C2=A0 =C2=A0 =C2=A0desc-&gt;length_status =3D FIELD_DP32(desc-&gt;length_s=
tatus<wbr>,<br>
@@ -948,6 +978,14 @@ static ssize_t bcm2838_genet_rdma(BCM2838Gene<wbr>tSta=
te *s, uint32_t ring_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D &amp;rdma-&gt;descs[write_index]=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ring-&gt;write_ptr =3D write_index * desc=
_word_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ring-&gt;write_ptr_hi =3D ((hwaddr)write_=
index * desc_word_size) &gt;&gt; 32;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; size &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !bcm2838_genet_rdma_free_descs<w=
br>(ring, start_index, end_index)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s: RX ring %u full inside a frame\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __func__, ring_idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (ring_idx =3D=3D BCM2838_GENET_DMA_RING_DEFAULT<wbr>=
) {<br>
diff --git a/tests/qtest/bcm2838-genet-te<wbr>st.c b/tests/qtest/bcm2838-ge=
net-te<wbr>st.c<br>
index 393abd7da2..35653773d1 100644<br>
--- a/tests/qtest/bcm2838-genet-te<wbr>st.c<br>
+++ b/tests/qtest/bcm2838-genet-te<wbr>st.c<br>
@@ -1,8 +1,8 @@<br>
=C2=A0/*<br>
=C2=A0 * QTest testcase for the BCM2838 GENET DMA rings<br>
=C2=A0 *<br>
- * Frames go out over a socket netdev. The producer and consumer indexes<b=
r>
- * of a ring count modulo 2^16.<br>
+ * Frames come in and go out over a socket netdev. The producer and<br>
+ * consumer indexes of a ring count modulo 2^16.<br>
=C2=A0 *<br>
=C2=A0 * SPDX-License-Identifier: GPL-2.0-or-later<br>
=C2=A0 */<br>
@@ -14,8 +14,16 @@<br>
<br>
=C2=A0#define GENET_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xfd580000<br>
<br>
+#define RDMA_DESC(i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x2000 + (i) * 12)<br>
+#define RDMA_RING(r)=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x2c00 + (r) * 0x40)<br>
+#define RING_WRITE_PTR=C2=A0 =C2=A0 =C2=A0 0x00<br>
+#define RING_PROD_INDEX=C2=A0 =C2=A0 =C2=A00x08<br>
+#define RING_CONS_INDEX=C2=A0 =C2=A0 =C2=A00x0c<br>
+#define RING_BUF_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A00x10<br>
=C2=A0#define RING_START_ADDR=C2=A0 =C2=A0 =C2=A00x14<br>
=C2=A0#define RING_END_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A00x1c<br>
+#define RDMA_RING_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A00x3040<br>
+#define RDMA_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3044<br>
<br>
=C2=A0#define TDMA_DESC(i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x4000 + (i) * 12)<b=
r>
=C2=A0#define TDMA_RING(r)=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x4c00 + (r) * 0x40)=
<br>
@@ -26,9 +34,11 @@<br>
=C2=A0#define TDMA_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x5044<br>
=C2=A0#define TSB_LEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A064=C2=
=A0 =C2=A0 =C2=A0 /* transmit status block */<br>
<br>
+#define DEFAULT_RING=C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
=C2=A0#define DESCS_PER_RING=C2=A0 =C2=A0 =C2=A0 4<br>
=C2=A0#define BUF_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2048<br>
=C2=A0#define BUF_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x100000<br=
>
+#define STATUS_LEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 64=C2=A0 =C2=A0 =C2=
=A0 /* receive status block, then 2 bytes */<br>
=C2=A0#define FRAME_LEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A060<br>
<br>
=C2=A0static void genet_writel(QTestState *qts, uint32_t off, uint32_t val)=
<br>
@@ -41,6 +51,98 @@ static uint32_t genet_readl(QTestState *qts, uint32_t of=
f)<br>
=C2=A0 =C2=A0 =C2=A0return qtest_readl(qts, GENET_BASE + off);<br>
=C2=A0}<br>
<br>
+/* The default ring uses the first DESCS_PER_RING descriptors */<br>
+static QTestState *genet_rx_init(int *fd)<br>
+{<br>
+=C2=A0 =C2=A0 const unsigned r =3D DEFAULT_RING;<br>
+=C2=A0 =C2=A0 int sv[2];<br>
+=C2=A0 =C2=A0 QTestState *qts;<br>
+<br>
+=C2=A0 =C2=A0 g_assert_cmpint(socketpair(PF_<wbr>UNIX, SOCK_STREAM, 0, sv)=
, =3D=3D, 0);<br>
+=C2=A0 =C2=A0 qts =3D qtest_initf(&quot;-M raspi4b -nic socket,fd=3D%d,mod=
el=3Dbcm2838-gen<wbr>et&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sv[1]);<br>
+=C2=A0 =C2=A0 close(sv[1]);<br>
+=C2=A0 =C2=A0 *fd =3D sv[0];<br>
+<br>
+=C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; DESCS_PER_RING; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 genet_writel(qts, RDMA_DESC(i) + 4, BUF_BASE +=
 i * BUF_SIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 genet_writel(qts, RDMA_DESC(i) + 8, 0);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_RING(r) + RING_START_ADDR, 0);<br>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_RING(r) + RING_END_ADDR, (DESCS_PER_R=
ING - 1) * 3);<br>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_RING(r) + RING_WRITE_PTR, 0);<br>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_RING(r) + RING_BUF_SIZE, BUF_SIZE);<b=
r>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_RING_CFG, BIT(r));<br>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_CTRL, 1 | BIT(1 + r));<br>
+=C2=A0 =C2=A0 return qts;<br>
+}<br>
+<br>
+static uint32_t prod_index(QTestState *qts, unsigned r)<br>
+{<br>
+=C2=A0 =C2=A0 return genet_readl(qts, RDMA_RING(r) + RING_PROD_INDEX) &amp=
; 0xffff;<br>
+}<br>
+<br>
+/* Send a broadcast frame into the socket netdev */<br>
+static void send_frame(int fd, uint16_t ethertype, uint8_t byte14)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t pkt[4 + FRAME_LEN] =3D { 0 };<br>
+<br>
+=C2=A0 =C2=A0 stl_be_p(pkt, FRAME_LEN);<br>
+=C2=A0 =C2=A0 memset(pkt + 4, 0xff, 6);<br>
+=C2=A0 =C2=A0 stw_be_p(pkt + 4 + 12, ethertype);<br>
+=C2=A0 =C2=A0 pkt[4 + 14] =3D byte14;<br>
+=C2=A0 =C2=A0 g_assert_cmpint(send(fd, pkt, sizeof(pkt), 0), =3D=3D, sizeo=
f(pkt));<br>
+}<br>
+<br>
+/* The byte at 14 of the frame that descriptor I holds */<br>
+static uint8_t rx_byte14(QTestState *qts, unsigned i)<br>
+{<br>
+=C2=A0 =C2=A0 return qtest_readb(qts, BUF_BASE + i * BUF_SIZE + STATUS_LEN=
 + 2 + 14);<br>
+}<br>
+<br>
+/* Wait up to MS milliseconds for the producer index of ring R to be N */<=
br>
+static bool wait_prod_index(QTestState *qts, unsigned r, uint32_t n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned ms)<br>
+{<br>
+=C2=A0 =C2=A0 gint64 end =3D g_get_monotonic_time() + ms * G_TIME_SPAN_MIL=
LISECOND;<br>
+<br>
+=C2=A0 =C2=A0 do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_clock_step(qts, 100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prod_index(qts, r) =3D=3D n) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } while (g_get_monotonic_time() &lt; end);<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+/* A full RX ring keeps the next frames until the guest frees descriptors =
*/<br>
+static void test_rx_ring_full(void)<br>
+{<br>
+=C2=A0 =C2=A0 const unsigned n =3D DESCS_PER_RING + 2;<br>
+=C2=A0 =C2=A0 int fd;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D genet_rx_init(&amp;fd);<br>
+<br>
+=C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; n; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_frame(fd, 0x0800, i);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_assert(wait_prod_index(qts, DEFAULT_RING, DESCS_PER_RING, =
5000));<br>
+=C2=A0 =C2=A0 /* the rest must not overwrite descriptors the guest has not=
 read */<br>
+=C2=A0 =C2=A0 g_assert(!wait_prod_index(qts, DEFAULT_RING, DESCS_PER_RING =
+ 1, 500));<br>
+=C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; DESCS_PER_RING; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(rx_byte14(qts<wbr>, i), =3D=
=3D, i);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 genet_writel(qts, RDMA_RING(DEFAULT_RING) + RING_CONS_INDEX,=
 2);<br>
+=C2=A0 =C2=A0 g_assert(wait_prod_index(qts, DEFAULT_RING, n, 5000));<br>
+=C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; n; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(rx_byte14(qts<wbr>, i % DESCS=
_PER_RING), =3D=3D,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0i &lt; 2 ? i + DESCS_PER_RING : i);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+}<br>
+<br>
=C2=A0/* Transmit across the wrap of the 16-bit consumer index */<br>
=C2=A0static void test_tx_index_wrap(void)<br>
=C2=A0{<br>
@@ -96,6 +198,7 @@ static void test_tx_index_wrap(void)<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/bcm2838-genet<wbr>/rx-ring-full&quot;,=
 test_rx_ring_full);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/bcm2838-gene<wbr>t/tx-index-wrap&=
quot;, test_tx_index_wrap);<br>
=C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
=C2=A0}<br>
-- <br>
2.56.0<br>
<br>
</blockquote></div></div>

--00000000000029604b065f50c6d6--

