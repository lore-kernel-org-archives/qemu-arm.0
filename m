Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp948791wrt;
        Fri, 5 Oct 2018 16:12:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63yKvKDIGjF7uloOO62g2rRZlkO0PJuz1ko4IbObbDfIrWAVdFgh3rd6Vsqb6Yn+2H1LNoD
X-Received: by 2002:a37:8c05:: with SMTP id o5-v6mr10554644qkd.154.1538781170197;
        Fri, 05 Oct 2018 16:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538781170; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzrSHiKL9fQNxOgmQ01tWWRi+B/e08rcq3HphEGBWTeTA4czUpTrmVPIDNaQR1IwD9
         tBRUBu8GOEzZWfKYjrPo5rDMarJo3MzvUo3wP+uOzOdVn7kdNc88ezsgwKJs1KBTakYQ
         C4X86EQD3Y7opFVbGkS61+uwqVsXgM2HNnQvZwZVB0PaV7qCNP0thj1t2P/mTah6V2hI
         u5o3ZBhnsmOSNHphasLsqndbvOSD+f5oii6RtiVs9gt9Usx2WmHuBX4V1U/Apof2xMyR
         TmTRi0G0f2frQnRBCyuyl2EC2NcT4TQFSFvaqaCVwquihckJkJ2Iv7ilejnWJwluO6TU
         WJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=813EIwplnpNy90CcLnmIEgFbafI1NS2QeAJ+0//jhAw=;
        b=WIQzX7TpFprr3ASHavlmZ+FfB5XY0NsXW9xdpVesvqceruE/l4qjZSJZVABIICVcFf
         fn2+nOzba6eWNq0301ApeJcxuDNw96uKNabi6vWQNA8nqXYjT6g1fyijiXAXiWWdlpRP
         /TgRJyIQGvAcuMwMAPVCfvl1vhd8KNoGp55D4+PfeCnxLqXBzq84ggt6/w3BtXQ6hVqf
         nTjDnqBB4U2pxKoMOq6oXcCCoNVK09J7PJuMNq34rCI0kaVJLB0yfVNetxVRW1+K4I9C
         qWfecA9w+0aYJ90TXrXXb6Vch75+zoVVuxlZqavIGbcHtplP1saaftYR3zTM2AQvcf7C
         RlyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Go9HZbyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2-v6si1259266qtf.249.2018.10.05.16.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 16:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Go9HZbyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8ZH7-0004Cd-JG
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 19:12:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8ZGj-0003zN-Hq
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8ZGg-00025Z-Dc
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:12:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8ZGg-00023x-5I; Fri, 05 Oct 2018 19:12:22 -0400
Received: by mail-pl1-x643.google.com with SMTP id p25-v6so7474864pli.11;
	Fri, 05 Oct 2018 16:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=813EIwplnpNy90CcLnmIEgFbafI1NS2QeAJ+0//jhAw=;
	b=Go9HZbyLpltMWTectWhYjbAr/VphpU9Q/KcHa2FePK5uBccaVYIWiYN3Z1U3zNxAoA
	Wh2+JFpOh0eddJFrcI8G1g3EnrHmzuo+3vXQePBreH14OMJyuEEgA/n6HcL2POy6WnPE
	BtmjLt5aIBoNbqJWcZDjoW0pOnPS732ZJUHgWGAQW5zP0V3AJ99dyJCxTFbhjzOfNo23
	QTFZji3XOUbcMUtKEtfoy/3Pp1i+ZzvpgedX60rFBLeODIi32ths0+2TFmGWtu5KCwQc
	WXH0i55v5EgsN3gmIPRySOYl/bxCa163Ox6cD1w49R41028m+VccguB9VKCSMJyVtbm8
	qjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=813EIwplnpNy90CcLnmIEgFbafI1NS2QeAJ+0//jhAw=;
	b=f57Gtw09QtX81wwnVBnaanTu7MrQpCnQVpAuVnb1AyoNRxCEXBDOLma0hmU55CGlXt
	y9hnffG5DH9B5ptXYcCnFY98s+zqW+wXAQxNQNkuCZNTI7aA0lNou4bWQQCcUFCylPdF
	gGudVXDxp6vLEkKW31SZInIAm8lGB+wHp1B4hqmxtUmTXxxWIVdnmU9OBO8PSeEWPFEk
	KtPWTYNosv672EeV8oAlntxKktjpQtUbh2clDZ+odHUAJkH1VoL9qWjeIOx3nZ5+IWUM
	nNgh5R5bV45Hf67jE/gJemQwzeF+c2S5jgRD8v6NV/JTw0yYJXcDe+jo9YbPES+SM4bJ
	Z4Uw==
X-Gm-Message-State: ABuFfohm5T3FmUf0SZ2atscV4UfEsJhvUhOR/dk4cyB5VcagwE16D7dV
	EX+Ahhz73QBj0SA8p5+VGZU=
X-Received: by 2002:a17:902:5a45:: with SMTP id
	f5-v6mr13856623plm.26.1538781141016; 
	Fri, 05 Oct 2018 16:12:21 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	k13-v6sm11688450pff.30.2018.10.05.16.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 16:12:19 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-8-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <86063442-84a7-c546-a05e-fc4eb50edccc@gmail.com>
Date: Fri, 5 Oct 2018 16:12:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-8-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 07/12] net: cadence_gem:
 Implement support for 64bit descriptor addresses
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /LgBmSqW3YKF

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Implement support for 64bit descriptor addresses.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c | 47 +++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index ab02515..f93cd8e 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -153,6 +153,9 @@
>   #define GEM_RECEIVE_Q1_PTR              (0x00000480 / 4)
>   #define GEM_RECEIVE_Q7_PTR              (GEM_RECEIVE_Q1_PTR + 6)
>   
> +#define GEM_TBQPH                       (0x000004C8 / 4)
> +#define GEM_RBQPH                       (0x000004D4 / 4)
> +
>   #define GEM_INT_Q1_ENABLE               (0x00000600 / 4)
>   #define GEM_INT_Q7_ENABLE               (GEM_INT_Q1_ENABLE + 6)
>   
> @@ -832,18 +835,42 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
>       return 0;
>   }
>   
> +static hwaddr gem_get_desc_addr(CadenceGEMState *s, bool tx, int q)
> +{
> +    hwaddr desc_addr = 0;
> +
> +    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
> +        desc_addr = s->regs[tx ? GEM_TBQPH : GEM_RBQPH];
> +    }
> +    desc_addr <<= 32;
> +    desc_addr |= tx ? s->tx_desc_addr[q] : s->rx_desc_addr[q];
> +    return desc_addr;
> +}
> +
> +static hwaddr gem_get_tx_desc_addr(CadenceGEMState *s, int q)
> +{
> +    return gem_get_desc_addr(s, true, q);
> +}
> +
> +static hwaddr gem_get_rx_desc_addr(CadenceGEMState *s, int q)
> +{
> +    return gem_get_desc_addr(s, false, q);
> +}
> +
>   static void gem_get_rx_desc(CadenceGEMState *s, int q)
>   {
> -    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
> +    hwaddr desc_addr = gem_get_rx_desc_addr(s, q);
> +
> +    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", desc_addr);
> +
>       /* read current descriptor */
> -    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
> +    address_space_read(s->dma_as, desc_addr, MEMTXATTRS_UNSPECIFIED,
>                          (uint8_t *)s->rx_desc[q],
>                          sizeof(uint32_t) * gem_get_desc_len(s, true));
>   
>       /* Descriptor owned by software ? */
>       if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
> -        DB_PRINT("descriptor 0x%x owned by sw.\n",
> -                 (unsigned)s->rx_desc_addr[q]);
> +        DB_PRINT("descriptor 0x%" HWADDR_PRIx " owned by sw.\n", desc_addr);
>           s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
>           s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
>           /* Handle interrupt consequences */
> @@ -947,6 +974,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>       q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
>   
>       while (bytes_to_copy) {
> +        hwaddr desc_addr;
> +
>           /* Do nothing if receive is not enabled. */
>           if (!gem_can_receive(nc)) {
>               assert(!first_desc);
> @@ -994,7 +1023,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>           }
>   
>           /* Descriptor write-back.  */
> -        address_space_write(s->dma_as, s->rx_desc_addr[q],
> +        desc_addr = gem_get_rx_desc_addr(s, q);
> +        address_space_write(s->dma_as, desc_addr,
>                               MEMTXATTRS_UNSPECIFIED,
>                               (uint8_t *)s->rx_desc[q],
>                               sizeof(uint32_t) * gem_get_desc_len(s, true));
> @@ -1098,7 +1128,7 @@ static void gem_transmit(CadenceGEMState *s)
>   
>       for (q = s->num_priority_queues - 1; q >= 0; q--) {
>           /* read current descriptor */
> -        packet_desc_addr = s->tx_desc_addr[q];
> +        packet_desc_addr = gem_get_tx_desc_addr(s, q);
>   
>           DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
>           address_space_read(s->dma_as, packet_desc_addr,
> @@ -1144,16 +1174,17 @@ static void gem_transmit(CadenceGEMState *s)
>               /* Last descriptor for this packet; hand the whole thing off */
>               if (tx_desc_get_last(desc)) {
>                   uint32_t desc_first[DESC_MAX_NUM_WORDS];
> +                hwaddr desc_addr = gem_get_tx_desc_addr(s, q);
>   
>                   /* Modify the 1st descriptor of this packet to be owned by
>                    * the processor.
>                    */
> -                address_space_read(s->dma_as, s->tx_desc_addr[q],
> +                address_space_read(s->dma_as, desc_addr,
>                                      MEMTXATTRS_UNSPECIFIED,
>                                      (uint8_t *)desc_first,
>                                      sizeof(desc_first));
>                   tx_desc_set_used(desc_first);
> -                address_space_write(s->dma_as, s->tx_desc_addr[q],
> +                address_space_write(s->dma_as, desc_addr,
>                                     MEMTXATTRS_UNSPECIFIED,
>                                     (uint8_t *)desc_first,
>                                      sizeof(desc_first));
> 
