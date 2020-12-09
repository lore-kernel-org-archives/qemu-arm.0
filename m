Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4747867lfb;
        Wed, 9 Dec 2020 00:34:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyedmSBp9cDl5ZUL+btceuFCN1xLkByPzTsnu0lkP1tMEL4IYxeh6oCFWwJIt1Ck43W8Gh9
X-Received: by 2002:a25:d845:: with SMTP id p66mr2078099ybg.69.1607502849041;
        Wed, 09 Dec 2020 00:34:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607502849; cv=none;
        d=google.com; s=arc-20160816;
        b=xHV0S8YnoXRf44UpFSXp2kIFl+yEThC/vvT9Y/Xfn4HtSXB5kimd8EWTffUcnabzvn
         tvWQQwZQunFIwYXZNSBBELzI5pyzPQ49556RmRPDnvq3XjNDotYUW+pP8zCeR5ZAo4a9
         u968nttMHuwFdXgGy0H6dNG3i5oYXLl7sVTnOaXooSuTE11urBsfgnG+Q3sRcw+0Sgsd
         hTc1XDyQ/DCMcQOwZZs2zprWO/05irNCJSgRQr7BY/6u/QF9MzaBPk1ZapXFpx752X5K
         sYZJP+Qsm1Hs5fZ4FaUYvRJNBM20WVNYVAMuuAYtNjoI7b8I6GgqEpS4CXzUmynuEgXF
         abCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=DtNEW6LlXpJKlrnCrCb+mnyDmuiBR7v5aJhsZOJxbPs=;
        b=Im+CYmmMQGYTeN6uJIFwJngVsuVkxixKIO5rrz4Eztm1BqrHLeoEp6EG6Via1m5eY/
         t71i7B4fTuVg6UDh6p1noSv6AwdLz9XzAUR8ctYdC7FBRsJ4xJmMKr6vrhCzZtQ8UKLS
         YB2/xI0zJXoZeBnMFQcmlnGZRn0FO2CmVa9YEqBJ8o9M8DbzttrS9AGMHf93n+/w4ugd
         kiXwocrq+PHU+A3XZV1yqp02YPeFyNqxJhRoVjfgPfvklqirxmqWIHncoTxin684in7N
         BHWkecBsHcm0TgCKCNg2vbw7FnPgA8GdzPNC44Nd3XupPJwypTT8BAALlo2udegoClUs
         zBSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si1568218ybj.291.2020.12.09.00.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 00:34:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmuvI-0002dk-CF
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 03:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kmuv7-0002dH-Dt; Wed, 09 Dec 2020 03:33:57 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:51258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kmuv5-0006xU-4f; Wed, 09 Dec 2020 03:33:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id AF737240B8B;
 Wed,  9 Dec 2020 09:33:38 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 09:33:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00683016755-4cd7-4a58-9314-76cd7bd62976,
 F89B705946B58AFC48376D7414C518838B559611) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum
 type
To: Bin Meng <bmeng.cn@gmail.com>, <qemu-devel@nongnu.org>
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <adb845f8-8623-988f-cb11-148ec4cc2f4b@kaod.org>
Date: Wed, 9 Dec 2020 09:33:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 481ee65c-d874-4de9-800e-f6db287e3d47
X-Ovh-Tracer-Id: 10079618919775570899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefudeltdfhtddtieevudduveehffeutedvueeuleduiedvgffgueduhfehgfejheenucffohhmrghinhepohhffhhlohgrugdrnhgvthdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepsghmvghnghdrtghnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Zhang Chen <chen.zhang@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wLkSSDksYKO3

Hello !

> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 782ff19..fbae1f1 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -573,7 +573,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>              }
>  
>              if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
> -                net_checksum_calculate(s->frame, frame_size);
> +                /*
> +                 * TODO:
> +                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
> +                 * however previous net_checksum_calculate() did not calculate
> +                 * IP checksum at all. Passing CSUM_ALL for now until someone
> +                 * who is familar with this MAC to figure out what should be
> +                 * properly added for TCP/UDP checksum offload.
> +                 */
> +                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
>              }
>              /* Last buffer in frame.  */
>              qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);


You can test your changes using the HOWTO Joel provided here : 

  https://github.com/openbmc/qemu/wiki/Usage

Please also check the Linux driver  :

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/faraday/ftgmac100.c#n685

That said, something like the change below should be more appropriate.

Thanks,

C. 

+static int ftgmac100_convert_csum_flag(uint32_t flags)
+{
+    int csum = 0;
+
+    if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
+        csum |= CSUM_IP;
+    }
+    if (flags & FTGMAC100_TXDES1_TCP_CHKSUM) {
+        csum |= CSUM_TCP;
+    }
+    if (flags & FTGMAC100_TXDES1_UDP_CHKSUM) {
+        csum |= CSUM_UDP;
+    }
+    return csum;
+}
+
 static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
                             uint32_t tx_descriptor)
 {
@@ -602,6 +618,7 @@ static void ftgmac100_do_tx(FTGMAC100Sta
         ptr += len;
         frame_size += len;
         if (bd.des0 & FTGMAC100_TXDES0_LTS) {
+            int csum = ftgmac100_convert_csum_flag(flags);
 
             /* Check for VLAN */
             if (flags & FTGMAC100_TXDES1_INS_VLANTAG &&
@@ -610,16 +627,8 @@ static void ftgmac100_do_tx(FTGMAC100Sta
                                             FTGMAC100_TXDES1_VLANTAG_CI(flags));
             }
 
-            if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
-                /*
-                 * TODO:
-                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
-                 * however previous net_checksum_calculate() did not calculate
-                 * IP checksum at all. Passing CSUM_ALL for now until someone
-                 * who is familar with this MAC to figure out what should be
-                 * properly added for TCP/UDP checksum offload.
-                 */
-                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
+            if (csum) {
+                net_checksum_calculate(s->frame, frame_size, csum);
             }
             /* Last buffer in frame.  */
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
