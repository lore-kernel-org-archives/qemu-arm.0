Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3034581lft;
        Tue, 28 Jun 2022 02:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHVB45Zs7iNME3OPeMdwovOhBuvNo+IxBT9W0hPgr0jYpvtdw4WRHeR+8XjM7pG50khE5k
X-Received: by 2002:a37:a815:0:b0:6ae:e677:d56e with SMTP id r21-20020a37a815000000b006aee677d56emr10516724qke.722.1656407910090;
        Tue, 28 Jun 2022 02:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656407910; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3x+zz7F0GjZjBnA9psefdKP/tPBGy0nsmL6xx8a6C9QU3E5YAD9LNh6BGf1SOAj2h
         Gc4ZWu9nA6p7s1L8MT3yXwAvIKD1w0aFMXcIitdvhWaLcC5nJor+BJOIrI4qh54jXi/8
         upB5EqkZD83Wv50jURppsurW33Xy/Yy6aIr+gtjjP6F1ns9lJDOaLzdhUd84Bh6M4xkO
         nqypk1y/l7Ko7idxIDJNhF8r9ZVaHMna+fsRkgUwNGq6iG/Xj9nbBh9SUvdTJNN04b73
         cOYMvWBT0hRBlA6uJ/2c0FZRrDzG6ryMc8AwBsn6hNdgzHhu3/jtqCa4MEQZSHlTV8E6
         Xr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=kXDMIjxY9unsu6gakuMt4nlRdZVYxTOCuhLVurJseZk=;
        b=RtWsaXtOmKPAY5Eo2aDIPtXofydzn/+5TDNmRUrr/c7ssDUM4Iz0Xhv+3a3MwzONAM
         sY9PTT+W1udzNpsscoVlq3O9w7gDbP2J01hYNlK1Y1gEyw6Ifhwp3PY9HJkuf30Vu9CF
         BuU8UtRipoCNUoc53T7uSezRCNUmd8j+XWq9PJghlF1wNgU+TS6l9/xdlvdSyQoE1Qdc
         DRP+vtE4EHawGIAR+KE54CN4tA45JlG1D1WVc4gzOJYhmT3OnSi5mG0rEEHVPHOJwpso
         Htzg2Vkp+ITGQJRdwI4F2UJDPLWjQWBg5heR16EVNxzX1HMhz12ALgEow6pa8Jau3IwQ
         f7mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05622a14d400b002f94330d075si6425260qtx.39.2022.06.28.02.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 02:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o67Mb-0001ze-Hw
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 05:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67AR-0002rj-UG; Tue, 28 Jun 2022 05:05:55 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:41289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67AO-0002DO-P1; Tue, 28 Jun 2022 05:05:55 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MK3a4-1oM07c3iRi-00LXFE; Tue, 28 Jun 2022 11:05:43 +0200
Message-ID: <f87c5661-3b9d-c207-4830-8eec05e3a903@vivier.eu>
Date: Tue, 28 Jun 2022 11:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] Trivial: 3 char repeat typos
Content-Language: fr
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru
Cc: danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, kbusch@kernel.org, its@irrelevant.dk
References: <20220614104045.85728-1-dgilbert@redhat.com>
 <20220614104045.85728-2-dgilbert@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220614104045.85728-2-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HrFnAKUNYuaYZKZG7Bgl4fq1h3lThkBsBzRMlHp93gIXsDxdnBr
 VuQW6AaDDJyZXuYxbU6a/SEKj47BrEQpR2WFYFniDlbK7LMP9kmgRjGxHxVFdlHhMlaVCLq
 1QJCyGb0YFs5CbTqKUgTvc1mXY6eVXgkBf+gnDI1TqKhaQ9CS6C5S2EqEQ/zWjLI5LfOjiA
 SCHh4j4RhZuNzeFjuBxJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IG7pe6N0W4Y=:L+vDOoRJNjkBSlksNbZjXs
 mejMIs7r5mfs1OyQaJ/QLPAbBuDs8zrqU9gRXadxfc+0nTGVVNS0nyr6FYpGxiOuyGRXPJYug
 c/bq/N+MQ3hyjtw0lTHWT7q1/n8CygM70etoYOKs+/N0+p0j2I01H5eDBG1wAMBoZNOi9sp3R
 OCU+Dxts21nDHRNoen2pPY86YOBtb+nn6W6qfhkJRtqAOD6t5QAhs29bvU98/+NQ3uzbodNoq
 u0/6Zq5jRx5AZn6NKCbHNvekbFrY23LvfYQHXPhyL/yhrYgXSqLWGTaFKs2SVpof5WbyoPGdp
 sBON3S/W4dNTS8iiJL5Udq9BwxqG9UDQ4x2US/ihxglXEIunXaSHXlb8E4bVNYGEGNChimeP4
 J2K4BgF91GKVXbcliI3NB3KrzNrTda/af+XV4dgQQPKVu5A/TwPZVLpC9FEX6b8dN7rWvHY8M
 b4E0ZFGJa6Qr4yE9sDsaOMvy/iJJFvJMqzc2WmtkllXVTn9WjsmizuANKkKA0NcEfJm+odM0l
 PICBb5ewv2okfOBderRnmj4HsTdnzTAhbuzgAxgu1xU6Hc+FPib+SV3JrXSA6F3p77YfL0BCn
 61UGvMobbyazCEzKnnVPIhss/pPzUbncO0kAf6Ba9DzyfIma9nx6rd/OqofUrtgwTkNh1BeQT
 B0zx11+pnS8v/NximuhT7fSbYiUrwbIaE0ECly+pmlXKinnHVHO6bxDfUI2x64PcVCT996QSk
 bHHHEw7mq+O1fwdqBPIb5R7YUYWoHvVPrMSKpg==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MxL9iij6cPVb

Le 14/06/2022 à 12:40, Dr. David Alan Gilbert (git) a écrit :
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Inspired by Julia Lawall's fixing of Linux
> kernel comments, I looked at qemu, although I did it manually.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/intc/openpic.c                | 2 +-
>   hw/net/imx_fec.c                 | 2 +-
>   hw/pci/pcie_aer.c                | 2 +-
>   hw/pci/shpc.c                    | 3 ++-
>   hw/ppc/spapr_caps.c              | 2 +-
>   hw/scsi/spapr_vscsi.c            | 2 +-
>   qapi/net.json                    | 2 +-
>   tools/virtiofsd/passthrough_ll.c | 2 +-
>   ui/input.c                       | 2 +-
>   9 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index 49504e740f..b0787e8ee7 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -729,7 +729,7 @@ static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
>   }
>   
>   /*
> - * Returns the currrent tccr value, i.e., timer value (in clocks) with
> + * Returns the current tccr value, i.e., timer value (in clocks) with
>    * appropriate TOG.
>    */
>   static uint64_t openpic_tmr_get_timer(OpenPICTimer *tmr)
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 0db9aaf76a..8c11b237de 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -438,7 +438,7 @@ static void imx_eth_update(IMXFECState *s)
>        *   assignment fail.
>        *
>        * To ensure that all versions of Linux work, generate ENET_INT_MAC
> -     * interrrupts on both interrupt lines. This should be changed if and when
> +     * interrupts on both interrupt lines. This should be changed if and when
>        * qemu supports IOMUX.
>        */
>       if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 92bd0530dd..eff62f3945 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -323,7 +323,7 @@ static void pcie_aer_msg_root_port(PCIDevice *dev, const PCIEAERMsg *msg)
>            */
>       }
>   
> -    /* Errro Message Received: Root Error Status register */
> +    /* Error Message Received: Root Error Status register */
>       switch (msg->severity) {
>       case PCI_ERR_ROOT_CMD_COR_EN:
>           if (root_status & PCI_ERR_ROOT_COR_RCV) {
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index f822f18b98..e71f3a7483 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -480,7 +480,8 @@ static const MemoryRegionOps shpc_mmio_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           /* SHPC ECN requires dword accesses, but the original 1.0 spec doesn't.
> -         * It's easier to suppport all sizes than worry about it. */
> +         * It's easier to support all sizes than worry about it.
> +         */
>           .min_access_size = 1,
>           .max_access_size = 4,
>       },
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 655ab856a0..b4283055c1 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -553,7 +553,7 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>                * instruction is a harmless no-op.  It won't correctly
>                * implement the cache count flush *but* if we have
>                * count-cache-disabled in the host, that flush is
> -             * unnnecessary.  So, specifically allow this case.  This
> +             * unnecessary.  So, specifically allow this case.  This
>                * allows us to have better performance on POWER9 DD2.3,
>                * while still working on POWER9 DD2.2 and POWER8 host
>                * cpus.
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index a07a8e1523..e320ccaa23 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -1013,7 +1013,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
>       }
>   
>       /*
> -     * Current implementation does not suppport any migration or
> +     * Current implementation does not support any migration or
>        * reservation capabilities. Construct the response telling the
>        * guest not to use them.
>        */
> diff --git a/qapi/net.json b/qapi/net.json
> index d6f7cfd4d6..9af11e9a3b 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -298,7 +298,7 @@
>   #
>   # @udp: use the udp version of l2tpv3 encapsulation
>   #
> -# @cookie64: use 64 bit coookies
> +# @cookie64: use 64 bit cookies
>   #
>   # @counter: have sequence counter
>   #
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index b15c631ca5..7a73dfcce9 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2319,7 +2319,7 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
>            * If security.selinux has not been remapped and selinux is enabled,
>            * use fscreate to set context before file creation. If not, use
>            * tmpfile method for regular files. Otherwise fallback to
> -         * non-atomic method of file creation and xattr settting.
> +         * non-atomic method of file creation and xattr setting.
>            */
>           if (!mapped_name && lo->use_fscreate) {
>               err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
> diff --git a/ui/input.c b/ui/input.c
> index 8ac407dec4..e2a90af889 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -364,7 +364,7 @@ void qemu_input_event_send(QemuConsole *src, InputEvent *evt)
>        * when 'alt+print' was pressed. This flaw is now fixed and the
>        * 'sysrq' key serves no further purpose. We normalize it to
>        * 'print', so that downstream receivers of the event don't
> -     * neeed to deal with this mistake
> +     * need to deal with this mistake
>        */
>       if (evt->type == INPUT_EVENT_KIND_KEY &&
>           evt->u.key.data->key->u.qcode.data == Q_KEY_CODE_SYSRQ) {

Applied to my trivial-patches branch.

Thanks,
Laurent

