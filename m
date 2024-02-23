Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp524670ejf;
        Fri, 23 Feb 2024 04:25:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUE5aLhrT+PiTjGh7xg7VtI+3Y/7lpqov50LpCvqbrHMQ67ObHgs1FikxwKX3SkWtEw2oe+EcpAlXIWLorjQOrMh8SoZc6D
X-Google-Smtp-Source: AGHT+IFY5YPNALr9E0knjizDPEX2Wcc1tP991nvYc4t3IwSDRk6D7s9KG/9cJsIf/sDm2meWbK1A
X-Received: by 2002:a05:620a:16b7:b0:787:18cc:722f with SMTP id s23-20020a05620a16b700b0078718cc722fmr1890252qkj.32.1708691099997;
        Fri, 23 Feb 2024 04:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708691099; cv=none;
        d=google.com; s=arc-20160816;
        b=muq7EQVCcwbULYQqy7dzvIzXXaaSLoySTQ3IS62q9AD6JwHJ9UIEHmXjqoYhKaLH21
         jyBSyuP7fn7Klowvzkb9+EN/bdPIoMUaRNUHFlfn5XNkHomX4RQ6ttRqtIxQI/GE4Kbl
         2mhuiTaBjNIpPIh3SVsnOrS2zitAwWpecDN8dxAxO1KtGPU6SKm9hHgg6abmnMN08sCw
         SAOZE/AAz2JFT/fWtINpRE2eJkfrSNleayg07UUNvyJgc7DaCOIvd4F/pas6lPPj3O5A
         YBh1kRfiLxa3sgSs4NzvFoVQYMfiqwd+R7MbMNzf6mdRRamBKnmuzmGnjh7CcdBbJi7n
         QXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:message-id
         :content-disposition:content-transfer-encoding:mime-version
         :in-reply-to:references:cc:user-agent:date:subject:to;
        bh=ItPr9qUB+GjntLufq9Xu8K+RE6F6Dz8Yj70r61DhBTg=;
        fh=NWXK+soNBNwUlRKo/DNqaPDpwxgBgYocd8nbduM0pME=;
        b=uNXO32T0+H1CtTdCynvBr2CpEY6FtGdBF87rWnU8H3cJymYmqGovqpDwuBTf5VeyLh
         +4hX7Pp89Ajgi31Yjs2v5xuuGeaLkjcpP8ZEdLuC0eiB5x+tp5yukUVCDGPr41DVHqCQ
         xbooDoUl6pM9SgKRqs1jSahC47tao//BMozU12m5FS5Lx97rw9LhGxdYePWKqhc5Y06r
         GXrlmokRZFxtY+F/cVfw6R/Pwen6zcgymqDRzmrkrigzx10us3ukUWiOEu6VXj1ExzKe
         XVZjBFCPWPo9iRt8Qga++QRQIsBTTnxQZsmPS983nXtTMz9r6NJQpA6q3xgEXsqt2f7B
         /f7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24-20020ae9c118000000b00787b3743293si924754qki.236.2024.02.23.04.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 04:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdUbi-0006qt-CW; Fri, 23 Feb 2024 07:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1rdUaX-0006L9-8k; Fri, 23 Feb 2024 07:23:37 -0500
Received: from smtpx.feld.cvut.cz ([147.32.210.153] helo=smtpx.fel.cvut.cz)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1rdUaV-00006o-6J; Fri, 23 Feb 2024 07:23:37 -0500
Received: from localhost (unknown [192.168.200.27])
 by smtpx.fel.cvut.cz (Postfix) with ESMTP id 0C61D3AD52;
 Fri, 23 Feb 2024 13:23:23 +0100 (CET)
X-Virus-Scanned: IMAP STYX AMAVIS
Received: from smtpx.fel.cvut.cz ([192.168.200.2])
 by localhost (cerokez-250.feld.cvut.cz [192.168.200.27]) (amavis, port 10060)
 with ESMTP id nXzd0wcDCi4W; Fri, 23 Feb 2024 13:23:22 +0100 (CET)
Received: from baree.pikron.com (ip-78-102-109-231.bb.vodafone.cz
 [78.102.109.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pisa)
 by smtpx.fel.cvut.cz (Postfix) with ESMTPSA id 959EB3ABD4;
 Fri, 23 Feb 2024 13:23:21 +0100 (CET)
To: Francisco Iglesias <francisco.iglesias@amd.com>
Subject: Re: [PATCH 16/21] hw/net/can/versal: Prefer object_initialize_child
 over object_initialize
Date: Fri, 23 Feb 2024 13:23:49 +0100
User-Agent: KMail/1.9.10
Cc: "Philippe =?utf-8?q?Mathieu-Daud=C3=A9?=" <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-17-philmd@linaro.org>
 <9f3cb497-d49c-4a35-b365-847ae1b60b08@amd.com>
In-Reply-To: <9f3cb497-d49c-4a35-b365-847ae1b60b08@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202402231323.49183.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.210.153;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=smtpx.fel.cvut.cz
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.257,
 NICE_REPLY_A=-2.533, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Pavel Pisa <pisa@cmp.felk.cvut.cz>
From:  Pavel Pisa via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HeTekLXQfRGl

On Friday 23 of February 2024 12:06:34 Francisco Iglesias wrote:
> On 2024-02-16 12:03, Philippe Mathieu-Daud=C3=A9 wrote:
> > When the QOM parent is available, prefer object_initialize_child()
> > over object_initialize(), since it create the parent relationship.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

Reviewed-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
