Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3737870lfo;
        Mon, 1 Feb 2021 12:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP6APs5iZQMosdMsX//AmViQxZSCZJ0QpBca0rR5Hzzgccq/7yCYMtZ3CK6qKKhyg9V9MG
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr27395137ybp.314.1612212440932;
        Mon, 01 Feb 2021 12:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612212440; cv=none;
        d=google.com; s=arc-20160816;
        b=aSANCCtD5GcDJuRtH7Ivh0fr+rPNX/yhGwBGeEOf20sgKa56Z2hbJxfnAxKeHFTvvv
         EepwznXrAhGjOcbZr/id1zw+dJ4DrXs4l15cXLyNDUhg1WfOHUSwSyZv4ayvOR33GnOs
         cOzB3uriOH5Iq6NgIDvmrSZ/ytikbk2HdyUCqxHE/rH70bclq5pkrXhXPx/whs5fY8BT
         9Lh+5xmgUgKTvVXw5Ez99TTdkYp0ruu+LH6xTHmaaTXihS8LGCcCSCZ1opSNNXpxZ5Vs
         zrbCPAe1irUTwPhNK8cTMUin3cPB9uVsu6TG33GI3Nf/0VNYvhKvfVK00L8mUP7DCDb1
         GpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ROmWqu0Ho/eHyd+ShWzPt3UGHEwnijktRSVQfMwuHLg=;
        b=UJH/edZLIeEiOVm34O9fTHYHMR0HV7ArBDPMey7nzqBkbG9Fs5rzBQU400EfEAt494
         5oyzg+PqRiPjfuuTRDIJpUeP6hLn2ulJ0SPQ9iRf5sWHJ37a2s2UwCmGdL6Ok6ZUp5VK
         +Gp+s4Mjx5Ne4K12h7KO5XvfIJwr44Yeq9Oih7rsdi13qz+A69l1sm2zSJiGGVoMKC8a
         /GYydXjn46b7GZebNXgro/XoZ0xqoixHa9CkibZBZzpYyoy4HLbZUCGOs35Mgu1L6Nzs
         OEipES/TKml8T7utvLEfTR3lthhJnNpgD0z8u+jUpoLJdMulag4GmmBvh7veNts6UbP7
         x4ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si17693842ybm.188.2021.02.01.12.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 12:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6g6S-0003Ut-An
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 15:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l6g5E-0003Sf-Pk; Mon, 01 Feb 2021 15:46:04 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40130
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l6g5C-0002XO-TE; Mon, 01 Feb 2021 15:46:04 -0500
Received: from host86-132-83-253.range86-132.btcentralplus.com
 ([86.132.83.253] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l6g5F-0003Nu-Eu; Mon, 01 Feb 2021 20:46:05 +0000
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210129081519.3848145-1-armbru@redhat.com>
 <20210129081519.3848145-2-armbru@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c448e0cb-f0c4-57fb-20df-077b65e386c6@ilande.co.uk>
Date: Mon, 1 Feb 2021 20:45:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129081519.3848145-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.83.253
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH RFC 1/1] hw: Replace anti-social QOM type names
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, frederic.konrad@adacore.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, mreitz@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, andrew.smirnov@gmail.com,
 marcandre.lureau@redhat.com, atar4qemu@gmail.com, ehabkost@redhat.com,
 alistair@alistair23.me, dgilbert@redhat.com, chouteau@adacore.com,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, jsnow@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, jcd@tribudubois.net,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0thU4m8LgOV

On 29/01/2021 08:15, Markus Armbruster wrote:

> Several QOM type names contain ',':
> 
>      ARM,bitband-memory
>      etraxfs,pic
>      etraxfs,serial
>      etraxfs,timer
>      fsl,imx25
>      fsl,imx31
>      fsl,imx6
>      fsl,imx6ul
>      fsl,imx7
>      grlib,ahbpnp
>      grlib,apbpnp
>      grlib,apbuart
>      grlib,gptimer
>      grlib,irqmp
>      qemu,register
>      SUNW,bpp
>      SUNW,CS4231
>      SUNW,DBRI
>      SUNW,DBRI.prom
>      SUNW,fdtwo
>      SUNW,sx
>      SUNW,tcx

My personal preference for the SUNW prefix would be to either drop it completely or 
change it to "sun-" instead. The reason being that the "SUNW," prefix is the standard 
way to reference Sun devices/packages, and looking at the replacements which still 
have a SUNW prefix in captials makes me thing the hyphen is either a typo or my 
fingers go on autopilot and type a comma anyway...


ATB,

Mark.
