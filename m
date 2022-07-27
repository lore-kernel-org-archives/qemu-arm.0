Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp580922lfg;
        Wed, 27 Jul 2022 15:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXXDth1xeAsM97DlDDFOv3LRfLZ96VAqBtJE4MY4w3c5lNy8OjB94xyhUUVuWrPBfCLyi/
X-Received: by 2002:a05:620a:c16:b0:6b6:c7c:67c9 with SMTP id l22-20020a05620a0c1600b006b60c7c67c9mr18929777qki.656.1658962159099;
        Wed, 27 Jul 2022 15:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658962159; cv=none;
        d=google.com; s=arc-20160816;
        b=XfK3of7rTNPGM1IrSxn93WR5AdavUZ7zW4cqT905sfTIbpEMuhurT2QMbEAgoFxDNa
         FsjuAFJ8mQnNe6S9Jj1qVcfpDeRqrayzsyqMdbERJjdvb0Yq2XX1OAEoxUbjDJjdEsaD
         vBhtDXaQHDJwiSZDGGmhzNTOIcxWItzwQb4siTL3ejyICcZ1vhLHgVzWhRR7T3rzmAiQ
         tl6dfHa+SPQH8dmQSlVTOimijcRuQq4h4EHh2myswmsNjiTganJkFSTo8BfjYQ8WhjSo
         mwDSGIEwezwiUKnTeHFl/QwByV8j3qfa0ggcJIj8iyQFQD9EYb1mcZv6EYEtS3wp0DvM
         7nwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=Nd4EVn+ecj9f5EUJb5pqAeMc5yhg46D+V2s6QBOHEFs=;
        b=w2MOiSpCx3NTtx9HL5j/tGb5p5loWh/LQ2bc0or5y2By1ZQTccuEV6l2AvlcJ5TVPs
         5L5SI4eu9p33WgwT8AujirTmP4cw2OrPRdVo9vXKqMuGv2J5oh654GKBKJn9jDK4tCo2
         GnLMUiKsYCx1qJuhXR82hbKjSkr/gQM4PljFAyh7hD+L0qDvg/4t+pJeIfqsidcRN1iO
         R90JQ+NXSN9me0Q7krARl9j4wKuir039a7YFzP9r9rzFqhMdCZZPgqAvUS0Yy0DTu4JG
         oB5CAbzYcBagTe1ibxBdwL6GFXDxKjjcnEf/KU48CxX1KHwlNdF3caPZQ95rGB1q713s
         sllw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3-20020a05620a294300b006b5f144690csi13736233qkp.762.2022.07.27.15.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 15:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGpq8-0005eK-Ig
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 18:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oGppd-0005dM-BR; Wed, 27 Jul 2022 18:48:45 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:34320
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oGppb-0000vo-G4; Wed, 27 Jul 2022 18:48:45 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oGppX-0002bn-C5; Wed, 27 Jul 2022 23:48:39 +0100
Date: Wed, 27 Jul 2022 23:48:39 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Subject: Re: add qemu_fdt_setprop_strings() and use it in most places
Message-ID: <20220727224839.5xjxxy3f4tyvf273@hetzy.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727223905.624285-1-qemu@ben.fluff.org>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8LSqvqTBWwvZ

On Wed, Jul 27, 2022 at 11:39:00PM +0100, Ben Dooks wrote:
> Add a helper for qemu_fdt_setprop_strings() to take a set of strings
> to put into a device-tree, which removes several open-coded methods
> such as setting an char arr[] = {..} or setting char val[] = "str\0str2";
> 
> This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
> is not fully tested over all of those, I may not have caught all places
> this is to be replaced.

I've added a branch at
     https://github.com/bendooks/qemu.git dev/fdt-string-array

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

