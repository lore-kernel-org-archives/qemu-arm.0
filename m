Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2633310ejb;
        Mon, 5 Jun 2023 01:05:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/bo7zDUfDBSJVG0rgzlggBOp3HVjSqH+1LYM7mRwhgcMRP2CGUVvrkTgOPGfp20uRFBZq
X-Received: by 2002:a05:620a:2592:b0:75d:4025:99dc with SMTP id x18-20020a05620a259200b0075d402599dcmr6815936qko.10.1685952314160;
        Mon, 05 Jun 2023 01:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685952314; cv=none;
        d=google.com; s=arc-20160816;
        b=GSTV5UDq97KnGBbJPgQyOnPlMC4N0UGDAO/CrvxY2O/+degnBrOXEgBnWyUB0r8jUX
         a+a/p1yaC5KLErhWgjJi6fNtugekGcHuswqDqWK0sOXcvCdXhFTOnPhvvq/tgbOcb3MW
         ZQfavaS8WTzUhR4d9nsPX9xJM9OfeneGT/rd+RtraNykHi0+sTzaYCdCUJWBZrYOlu8h
         XaY73t47cT+io35BXlBV6leB87+W/tS/oJ6Slcx1fzU1kgEA4DfRTHqJAHOvFq40q+Ts
         tmz0XwAj2U5oxxPXGptu0Ap28JxmmfxjCR0h7kJyfZPcd/QJYEG+rwP0st5Sch8rFJ7G
         sFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature:ironport-hdrordr:ironport-data;
        bh=w4A3jYCjeUqlQ62V5urF7yBovv+nvp0YeMEm8/LTD4Y=;
        b=LihOLm/6pkthL80TCSD47zFigzoOrfCd/bLpe0tiaD0IyfuwS5LFren99T/04qp/ON
         jdReaR4PFXwOaqiP7lZuZ7o4SQ7BhURQW1hepcZqJRDneUqRNb4oHEwHhs2TH2Pyzqi5
         5/aOhBRVB6fLf/Y6E2U0v3VPSlnej3pq6+jTKcT/UBn55hJEFN0WY08LTlQojYFIM4Lr
         Ff/bQXuP8ywcBCRmdcwijQQt8wYZyXI4/9azI4m4LZkllMQEiCLPjh2v0uUKQViElI80
         6iYHgcjDt/vbPE0j0+5vmfivu4dPBI1Q499Bffgd2NhcmGDB6VTvPLX9GwN4fe1cwDQp
         8SFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=IbMBN+vA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc47-20020a05620a842f00b0074acb879ac1si4112064qkn.33.2023.06.05.01.05.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 01:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=IbMBN+vA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q65D4-0007rr-OD; Mon, 05 Jun 2023 04:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1q65D2-0007pw-HP
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 04:05:00 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1q65D0-0002Jo-IF
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 04:05:00 -0400
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 295512773
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WmUpialmxeYGfQU8W3TkRlPo5gwyJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXmGGb/6OMDCkL9tyO4qy/UxQup+EzdA3TgBv+HpjEC4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gBmPJingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ePo8U27xcDlx0t
 sc3ExEBRUi6ub2Y6efuIgVsrpxLwMjDOYoevjR502icA6l+B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2A2PVKfO3WjOX9OYH46tO6sln/zaRVStRSYqbdfD237ll0sjeG3b4WOEjCMbf9Ywn6Sq
 zrIxUKjJhI9OIe/lxWD+33504cjmgu+Aur+DoaQ7/NvnRia3Gk7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83s/F3+hPzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBeJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:L/O/i69dTbhd6c4Z/o9uk+AOI+orL9Y04lQ7vn2ZhyYlFfBws/
 re4cjztCWE8gr5PUtLpTnuAtjjfZqxz+8R3WBVB8bfYOCEghrSEGgB1/qa/9SIIUSXnZ8/6U
 4jSdkHNDSZNzhHZK3BkW+F+rgbsb262ZHtr8vli1lWcSFWR5dJ0zpZYzzrbXGehzMrOXP6Lv
 ehDwZ8yQZIsE55D/iGOg==
X-Talos-CUID: 9a23:kHLbZmFg+lO3tP/iqmJk9kI1QOsqT0ee91jrAkOTUV9XF5O8HAo=
X-Talos-MUID: 9a23:Ma5aWAa7gMafxOBTjTKwvDtvbMlSxf6KC2cByrVYlM+NOnkl
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 04:04:49 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6260e66ec46so51996086d6.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 01:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1685952289; x=1688544289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w4A3jYCjeUqlQ62V5urF7yBovv+nvp0YeMEm8/LTD4Y=;
 b=IbMBN+vAcgK+aAFD29t1o/yfaumyrZlp4ewTvq96ZZQOXhdv75UQR+RD1v+hU8Qgn5
 T5Mx3YqU7U6354/hUsjKfa+olIYA8kn5Fckwqr6MaCuInDLfuxGosJJmUd9Vx8aDOtpr
 MV4thWNQaKDI7GGZpbxgOdKD1kRSDf190eNqHKhKs99JRTzYxgko1wDk4sxpQN2CsdtM
 AjK9svvdgZ0qEZb9o3YOjwSZ4uOoa4vciQLTNsJMBVuZSpBsibG2V5zY/R5soRUtQXek
 cCCIPXs7KV/2Yh6v6QibjKjK8pbJqPf6Cx/z5cs5FpkvO5oQs3enBFOW43bPGhpCoaPh
 QJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685952289; x=1688544289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4A3jYCjeUqlQ62V5urF7yBovv+nvp0YeMEm8/LTD4Y=;
 b=OswPd2luvSZ13/s2BRkkSivESCtjhpAx+dlMOBjsaiGJRYYbt31XNodiSVEguEZI69
 X0WwSDLa5ZB4j7i3JXvWTItEj6Rj9nYYi58q5OMqhclG0yWdKWExlY/035LQQwW2NxfN
 U1HNTKoqvagPV/gKobu8895HKxOBua7MWEjB3duVl5ck3vSner++ve1qg9nlZ7N+Ya3f
 rj/hFG+GpFdpTCsp9liRvZ1BuwdinPbEHDmS2BQZ/gV14RRHvYlFIOANN7DpBHkSfjx9
 /7X5eLxB6+4Kwlp9gHSJADMYOlk/cQ9l4V9kFr4/RLtAkeyHm0dmeustvNu2CnP1i1sz
 sIUw==
X-Gm-Message-State: AC+VfDwCOb3+Mwoq7ratK0xic72Q18jbSx8HqDsLuTgjL2BUMTZ4m6Pp
 MxdROythHfQS2QEnUgi4AOyYyjPKN48wZyIi8PdBNeSuLedcxiX/6z1L7tAkcz/PwdJaEdCkXJS
 DoSpHessCEB9Tsm129kVRi5nVBUk=
X-Received: by 2002:a05:6214:234c:b0:625:e039:5af1 with SMTP id
 hu12-20020a056214234c00b00625e0395af1mr6631334qvb.42.1685952288850; 
 Mon, 05 Jun 2023 01:04:48 -0700 (PDT)
X-Received: by 2002:a05:6214:234c:b0:625:e039:5af1 with SMTP id
 hu12-20020a056214234c00b00625e0395af1mr6631314qvb.42.1685952288574; 
 Mon, 05 Jun 2023 01:04:48 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 c9-20020ac80549000000b003f4a76d4981sm4435084qth.66.2023.06.05.01.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:04:48 -0700 (PDT)
Date: Mon, 5 Jun 2023 04:04:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P <pj.pandit@yahoo.co.in>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Rob Herring <robh@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] net: Update MemReentrancyGuard for NIC
Message-ID: <20230605080440.ljfqlc7u6f7ipdty@mozz.bu.edu>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-3-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601031859.7115-3-akihiko.odaki@daynix.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +PTPhoSPg1JN

On 230601 1218, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> This implementation follows what bottom half does, but it does not add
> a tracepoint for the case that the network device backend started
> delivering a packet to a device which is already engaging in I/O. This
> is because such reentrancy frequently happens for
> qemu_flush_queued_packets() and is insignificant.
> 
> Fixes: CVE-2023-3019
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  include/net/net.h |  1 +
>  net/net.c         | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index a7d8deaccb..685ec58318 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -124,6 +124,7 @@ typedef QTAILQ_HEAD(NetClientStateList, NetClientState) NetClientStateList;
>  typedef struct NICState {
>      NetClientState *ncs;
>      NICConf *conf;
> +    MemReentrancyGuard *reentrancy_guard;
>      void *opaque;
>      bool peer_deleted;
>  } NICState;
> diff --git a/net/net.c b/net/net.c
> index 982df2479f..3523cceafc 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -332,6 +332,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
>      nic = g_malloc0(info->size + sizeof(NetClientState) * queues);
>      nic->ncs = (void *)nic + info->size;
>      nic->conf = conf;
> +    nic->reentrancy_guard = reentrancy_guard,
>      nic->opaque = opaque;
>  
>      for (i = 0; i < queues; i++) {
> @@ -805,6 +806,7 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
>                                         int iovcnt,
>                                         void *opaque)
>  {
> +    MemReentrancyGuard *owned_reentrancy_guard;
>      NetClientState *nc = opaque;
>      int ret;
>  
> @@ -817,12 +819,24 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
>          return 0;
>      }
>  
> +    if (nc->info->type != NET_CLIENT_DRIVER_NIC ||
> +        qemu_get_nic(nc)->reentrancy_guard->engaged_in_io) {
> +        owned_reentrancy_guard = NULL;
> +    } else {
> +        owned_reentrancy_guard = qemu_get_nic(nc)->reentrancy_guard;
> +        owned_reentrancy_guard->engaged_in_io = true;
> +    }
> +
>      if (nc->info->receive_iov && !(flags & QEMU_NET_PACKET_FLAG_RAW)) {
>          ret = nc->info->receive_iov(nc, iov, iovcnt);
>      } else {
>          ret = nc_sendv_compat(nc, iov, iovcnt, flags);
>      }
>  
> +    if (owned_reentrancy_guard) {
> +        owned_reentrancy_guard->engaged_in_io = false;
> +    }
> +
>      if (ret == 0) {
>          nc->receive_disabled = 1;
>      }
> -- 
> 2.40.1
> 
