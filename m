Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4880538ejc;
        Mon, 27 Feb 2023 09:56:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+QzRtfuUmcAmsKJ6HDE/jWuT++PSx6xofyPrNPhRdSXzR9toF3hkuZxnLNPGJSKncICKHp
X-Received: by 2002:a05:6214:d49:b0:56e:c00c:bf5c with SMTP id 9-20020a0562140d4900b0056ec00cbf5cmr546365qvr.31.1677520588064;
        Mon, 27 Feb 2023 09:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677520588; cv=none;
        d=google.com; s=arc-20160816;
        b=b1NXt4GF8B6/Cmvd/B9F5av/zy7g8y4qyjtdw1Pqv5BeclNlVAD1S1aDp7eHzkNq3T
         no/U4yV3mbfG3zQKJq0XHWGZHHlZVmx5Psv3uy8gl0VegH8+VUcSZvleHuhxW4UT+sLd
         eKCeGaDnr86bX4BwsbGKjWFJsUjelH+/+gYWb10CyEiAkvqTSXC5ev0v7nemk9Fb+11V
         toipyvBKdxa620Okt1mUwGR3Oh+2tlagEC8Fj5cOBJzoFkqCiwOmPUw0JYAeQfk/YnzJ
         rSWcUIxFPUnjUva0YM1e8lgHN6wUcNoXjIBhoiVP+IML/Ik8zfbejPDqu2LxFQbe37HW
         3iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=80hjrlqlexHHPcLCpZJQDNiDJotlGJiIxpwf4WkZL1I=;
        b=J9EtnEcjXxaPF4o06xOH7zGjj4vAwo1iWqj0RgOvlmrJsnPR/nqQCK/pR50Cx9afEt
         n5D3n3B9iSH3zrJFIRxGp6v70V0L9mCofSZbpr8wbfY2UjtPLPak/SQbLUcstJ3jpYGO
         Fge0gOIWsZYFr0XUvg431D8b6bksHd6tVGhKUgEjSChlSRH8+fvd+qpFqopo1HBkxtfI
         CJ3++vgSL2uZ/HXiHLb7pi53fkCI31GYWtajsUBzT0sIn8KHrIcjeGzt48Gm1+5APRz6
         +kDpIXECEZV2wn65eTJBLwKdKTbo89h/ENkz/fBXAvwEkQ/3aIxUEqImP0FWp4HfYSNA
         IDkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm2 header.b=1mKOmQp9;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=d0P6015a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020a0ce4c7000000b00571f69aca76si7430700qvm.19.2023.02.27.09.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 09:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm2 header.b=1mKOmQp9;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=d0P6015a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWhjc-000557-Cg; Mon, 27 Feb 2023 12:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pWhjX-0004xo-Km; Mon, 27 Feb 2023 12:56:21 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pWhjV-0004Td-K3; Mon, 27 Feb 2023 12:56:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 26D555C0152;
 Mon, 27 Feb 2023 12:56:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Feb 2023 12:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677520573; x=
 1677606973; bh=80hjrlqlexHHPcLCpZJQDNiDJotlGJiIxpwf4WkZL1I=; b=1
 mKOmQp97rqp0412RtJF7/EWO3yBTPi3mfkLpw+anH36uU5YzLtl7pTs1OyK1iJvx
 veuvnhpPSwXikLMkcsdp1OLZS433pPuErg8qdspvAVjbXxOlawN/nn4uGnv98Z7l
 t7Di2Dc+HPOGqejX7uj9LjF/JMaTVngN3Qtjjw0o4pgY+r+PtFZCCb+ef6A7XIQN
 KTREJ7I6Vvx0U/UCFfeXoAFONBorAQ/xfklmnm1He3mykvMCej9aggc8uLnr0nNJ
 Qmm+eqpUQ6zlUuZCC4inUtvKsE/zBata0b64+1N4efv6bKYSCAwdW9OLEEHcFAW0
 1ImwIm9rfaeEg4ww5BHaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677520573; x=
 1677606973; bh=80hjrlqlexHHPcLCpZJQDNiDJotlGJiIxpwf4WkZL1I=; b=d
 0P6015auGBaeGS05d/EC43T/tAZQE9FZPdLNq+BinQqpxVbMyPKinIi4x8DsWenV
 ixPU1ukNxf/AaJtFu/V91YEdRIRHNEBoU1/vONUkFJvwHhCz4XFlZFliBZztTm3i
 cT433w0bOySA/sGXXXH9Xui2s9CG97fS0Ic54c6xUWTxMtUkfQRFx9xglNmS+kbW
 XhAtgNsiZnCQakQufGNPq2ZcNuFSBc7/ZTUMb1c1zYSFDjl9JbimJ+uLb6d57Yk2
 eQgTit4UNLHOZjOlhVjOKcbDEaLRXpMacZw5+M8lKM20hcLNqWJOcJ7ml87PTmoY
 06133TUKfLldRyMrSbH6A==
X-ME-Sender: <xms:vO78Y03vmrK66ZwVukv-_A-Kv4afZ8LqmYmD0tyQIpf9bcBRlZDcSA>
 <xme:vO78Y_Et6ecHnmsLpck6DsEV2zM-FjeACmtMPEX0KHeRdv0MN7cfZpB6E8LwOqfJ5
 zuMXzLtDSkz55Z5Q2A>
X-ME-Received: <xmr:vO78Y85tG42cXi033t1Q0qOpoyi-GU0-Iyvqc-UB9cSL5zG8ccAP4oKgzf7TRCjEUzWdYSVHjTyLANaTnyY2AR5K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeelhfektdelffdtudevffdthe
 eghfdtjefhueelleelhfefvdfffedukeeffffhkeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:vO78Y91AINyiFYBgK5x2STisOPZmdQSq5GbL2V_cwZ1CHzyLHU6lhw>
 <xmx:vO78Y3HwAWIn9FNzQbh3rK-wb_b_9GV4tXSB2ezz4DETWRUH6HhXdA>
 <xmx:vO78Y2-C658DBJDqYVfW0L8P96cJJQWDJhtXUyHjjORJ0m8LxE4AWA>
 <xmx:ve78Y-BS64XczQRaKOh94-obnvbD02uK6U0nzAZQOeEEWX7xLCtRqg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 12:56:11 -0500 (EST)
Date: Mon, 27 Feb 2023 09:56:08 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: ~ssinprem <ssinprem@celestica.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 ssumet@celestica.com, srikanth@celestica.com, kgengan@celestica.com,
 clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Subject: Re: [PATCH qemu v3 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
Message-ID: <Y/zuuKaIihN8aYam@pdel-mbp.dhcp.thefacebook.com>
References: <167660539263.10409.9736070122710923479-0@git.sr.ht>
 <167660539263.10409.9736070122710923479-1@git.sr.ht>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <167660539263.10409.9736070122710923479-1@git.sr.ht>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: r1BvQ9nVsbj8

On Fri, Feb 17, 2023 at 10:31:27AM +0700, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestica.com>
> 
> Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
> ---
>  hw/nvram/eeprom_at24c.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 3328c32814..64259cde67 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -41,6 +41,12 @@ struct EEPROMState {
>      uint16_t cur;
>      /* total size in bytes */
>      uint32_t rsize;
> +    /* address byte number 
> +     *  for  24c01, 24c02 size <= 256 byte, use only 1 byte
> +     *  otherwise size > 256, use 2 byte
> +     */
> +    uint8_t asize;

I was going to say "why not address_size", but then I see right above there's
"rsize", which is also very obscure lol, so whatever, this is keeping
consistent with the existing code.

> +
>      bool writable;
>      /* cells changed since last START? */
>      bool changed;
> @@ -91,7 +97,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>      EEPROMState *ee = AT24C_EE(s);
>      uint8_t ret;
>  
> -    if (ee->haveaddr == 1) {
> +    /* If got the byte address but not completely with address size
> +     *  will return the invalid value
> +     */
> +    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
>          return 0xff;
>      }
>  
> @@ -108,11 +117,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>  {
>      EEPROMState *ee = AT24C_EE(s);
>  
> -    if (ee->haveaddr < 2) {
> +    if (ee->haveaddr < ee->asize) {

Yay, love it 🍍

>          ee->cur <<= 8;
>          ee->cur |= data;
>          ee->haveaddr++;
> -        if (ee->haveaddr == 2) {
> +        if (ee->haveaddr == ee->asize) {
>              ee->cur %= ee->rsize;
>              DPRINTK("Set pointer %04x\n", ee->cur);
>          }
> @@ -199,6 +208,18 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>          }
>          DPRINTK("Reset read backing file\n");
>      }
> +
> +    /*
> +     * If address size didn't define with property set
> +     *   value is 0 as default, setting it by Rom size detecting.

Helpful comment, good stuff

> +     */
> +    if (ee->asize == 0) {
> +        if (ee->rsize <= 256) {
> +            ee->asize = 1;
> +        } else {
> +            ee->asize = 2;
> +        }
> +    }
>  }
>  
>  static
> @@ -213,6 +234,7 @@ void at24c_eeprom_reset(DeviceState *state)
>  
>  static Property at24c_eeprom_props[] = {
>      DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
> +    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
>      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
>      DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
>      DEFINE_PROP_END_OF_LIST()

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> -- 
> 2.34.6
> 
> 
