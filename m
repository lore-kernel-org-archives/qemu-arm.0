Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp680646njc;
        Fri, 13 Jun 2025 22:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOAORfbmVzq6p54+cly4YJcLC6g8rqdIpw4cvZBu0rtkuRJAP5X/AY001fc2kvlNjOtbTQSogk26HTzg==@linaro.org
X-Google-Smtp-Source: AGHT+IHFP853M+0EjZeRvSKXwR8ZXXNeY+a2N+67ZRmJUCWqJ0YopxMj7FiTMnbeCsPFcnaFt70F
X-Received: by 2002:a05:620a:2a03:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d3c6cc98efmr304530785a.35.1749878989549;
        Fri, 13 Jun 2025 22:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749878989; cv=none;
        d=google.com; s=arc-20240605;
        b=S2E6hirOs6OGdbdlRUN9xy5CQEOOdYqi6PenEMTbX9vcBqR1ik4RwmJTAyCxG6DNyK
         t8UeM3HGBzFN5Uu23vTG0KvVDf/O4PlK9kEQ51iJTzJOLHUhGJ8CDGhC9F9PSUq6LWxn
         4DjaoXM7LSmjjpdSFghmdguXxMtmiDDRyjHALUcdRQlb2/IA1dqQjbRm3HEGa9sy4YK1
         TfdvBQZF6sgjnCPqxxdwGI+OF566un+kTQf5KevT5lBHZs6sJGoBuTIOOhsPXy+kdHZJ
         kxwj1vQei9/AoD0I8MaPo3yuTMnG3qPOj1re2Um7h0POHwF0eYmeZH4tSUp/tqeeKz22
         IaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=AOcDAiIu3bsy/S6B5TlWD11rPlbaKfGoZoTLRjk95oE=;
        fh=B7mlmFCKLR8OMScXX1cPhTh1ZhvEGVIxtlNAwinfGrE=;
        b=CmLFo1E0Ba15A7Jmzd74pDgWJcSqFVwQsU/vUO99lVaoLIlAejFEbIU0C4dhmY1adr
         0MByKvS3Lz7b45p0W8H++c642g+bHFmp70eqD28HenqWSm1GhxqfBAS1mq5EOJYwPaLZ
         +7N8ln4eE9RJNiSgywpH8XBwIyg2S/nN/uGginmjaQLcXeuczzOQxa70dQkYBlidUimA
         UksrXrTD8SQizTgi1fwWwjOSIp+NaM6kX5blmRO+wvhQT72R5Hd9bjgrXHGkldBWh6P/
         ZA2aL0dZ5ELibZROt3TuyoETBUOyHh1H0GyVQa2oUYPOTn+RuVn9M8qGOyHIp1Zc0N4T
         jzrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dffac3si447306985a.147.2025.06.13.22.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 22:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQJSV-0006uM-SW; Sat, 14 Jun 2025 01:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org>)
 id 1uQJSP-0006ty-Dj; Sat, 14 Jun 2025 01:29:33 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org>)
 id 1uQJSM-0003xQ-PS; Sat, 14 Jun 2025 01:29:32 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bK4ZS1l81z4x07;
 Sat, 14 Jun 2025 15:29:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bK4ZK2WJ1z4wj2;
 Sat, 14 Jun 2025 15:29:13 +1000 (AEST)
Message-ID: <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org>
Date: Sat, 14 Jun 2025 07:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] include/hw: replace FSF postal address with
 licenses URL
To: Sean Wei <me@sean.taipei>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
References: <20250613.qemu.patch@sean.taipei>
 <20250613.qemu.patch.05@sean.taipei>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250613.qemu.patch.05@sean.taipei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.097, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bcp2yF53Nbql

Hello Sean,

On 6/13/25 18:44, Sean Wei wrote:
> Some of the GPLv2 boiler-plate still contained the
> obsolete "51 Franklin Street" postal address.
> 
> Replace it with the canonical GNU licenses URL recommended by the FSF:
> https://www.gnu.org/licenses/
> 
> Signed-off-by: Sean Wei <me@sean.taipei>

Instead,  I would remove the license boiler plate and add :

   SPDX-License-Identifier: GPL-2.0-or-later

Thanks,

C.

> ---
>   include/hw/i2c/aspeed_i2c.h     | 3 +--
>   include/hw/pci/pci_bridge.h     | 4 ++--
>   include/hw/timer/aspeed_timer.h | 3 +--
>   3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 2c4c81bd20..2daacc10ce 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -14,8 +14,7 @@
>    *  GNU General Public License for more details.
>    *
>    *  You should have received a copy of the GNU General Public License along
> - *  with this program; if not, write to the Free Software Foundation, Inc.,
> - *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + *  with this program; if not, see <https://www.gnu.org/licenses/>.
>    */
>   
>   #ifndef ASPEED_I2C_H
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index b0f5204d80..8cdacbc4e1 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -14,8 +14,8 @@
>    * GNU General Public License for more details.
>    *
>    * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> + * along with this program; if not, see
> + * <https://www.gnu.org/licenses/>.
>    *
>    * split out pci bus specific stuff from pci.[hc] to pci_bridge.[hc]
>    * Copyright (c) 2009 Isaku Yamahata <yamahata at valinux co jp>
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> index 767cae4b05..a850625a05 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -16,8 +16,7 @@
>    *  GNU General Public License for more details.
>    *
>    *  You should have received a copy of the GNU General Public License along
> - *  with this program; if not, write to the Free Software Foundation, Inc.,
> - *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + *  with this program; if not, see <https://www.gnu.org/licenses/>.
>    */
>   #ifndef ASPEED_TIMER_H
>   #define ASPEED_TIMER_H

