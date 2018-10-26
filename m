Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp367815wro;
        Fri, 26 Oct 2018 00:02:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eyxGNcsVVnNEgGWIBXGVx/mtWwMrN5PkMG/dX8c6G+LWugUe+xr4NfSZy/nskpbMGMeE/O
X-Received: by 2002:a37:8984:: with SMTP id l126-v6mr1909360qkd.195.1540537345836;
        Fri, 26 Oct 2018 00:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540537345; cv=none;
        d=google.com; s=arc-20160816;
        b=RBd9poFZ5lT4uerASgvU7iLsxc40I/2fdpuC93uuJzqdk+5VNKmgBqw2kn8I70FyTw
         D1BKohey3250Ae4Fb46Lfm2XQVhpZ5Bpi7AkhK8k88MwVn4nHSIyP1VBAvWJuAgIuk3P
         szhipmv7tg4uXpht05Z9aUFAOHBRMUf4x7vvcZWJMdYc6W/RhrWMUAQmeS3zmjjgUn3O
         lBPDP3RP3itUXz6swy7C49fOeIGvOJXw/dir+3Iz/ciyN2YkY6oY92n9YgjwIz8PsKGH
         Z+nJCOBwylUwLjsfHc5WLIdSBvc+F+3gtd9sYMQYAQcolIMyo8OV1yxc52tv7LtNbkx8
         YaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=Vb3vufRuLCEn18DNJg4xgV19FWJECe3GMYL/UfkeS/U=;
        b=zVhj8pLuQEURt6zAPdtvXD3IjRUfLpASOr0EmY7MUCNUAlCXj7exDI/B4O5z7M+yLW
         ajIgT3GFgBEmN4ZYbQNaOnKutlkD0b/p89j+8W25kZgXiadIUwQSv7h58bTeX6uRnKVC
         HKFpxLWqoFeZWFXmiYnYdDgMhndaV3UsuJg40lK00OaABl8y4uZxKjbKNtdXnB4tQTaK
         Ewl9zcqQKZR+h7/Av2x3GSep2vppKuqriD6bUS3Zh8TG2WNv26pXh4dcZO5+UZhzbAjW
         RW2x1HbYehXJ84rMcUlWRDIEEKOTJdJUN634Y9aW/XDW4W6bXECx6iQ+vw/T+bhMHAyn
         4Pew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2-v6si167136qtp.305.2018.10.26.00.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 00:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFw8X-0005ui-DB
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 03:02:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFw8E-0005qC-Bd
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 03:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFw8B-0004gs-3K
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 03:02:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gFw8A-0004gO-Oy; Fri, 26 Oct 2018 03:02:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AC4F300C230;
	Fri, 26 Oct 2018 07:02:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE11436F9;
	Fri, 26 Oct 2018 07:01:58 +0000 (UTC)
To: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org, peter.chubb@nicta.com.au,
	andrew.smirnov@gmail.com, qemu-arm <qemu-arm@nongnu.org>
References: <cover.1532984236.git.jcd@tribudubois.net>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <2cfde3e3-7c63-d96f-921b-5a49fdc91762@redhat.com>
Date: Fri, 26 Oct 2018 08:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cover.1532984236.git.jcd@tribudubois.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 26 Oct 2018 07:02:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/3] i.MX: Add the i.MX6UL
 SOC and a reference board.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GA9ASctonfmP

On 2018-07-30 22:03, Jean-Christophe Dubois wrote:
> This series adds the i.MX6UL SOC from NXP/Freescale and the reference
> evaluation board.
> 
> This series was tested by booting linux 4.18 (built using imx_v6_v7_defconfig)
> on the emulated board (with the appropriate device tree).
> 
> Jean-Christophe Dubois (3):
>   i.MX6UL: Add i.MX6UL specific CCM device
>   i.MX6UL: Add i.MX6UL SOC
>   i.MX6UL: Add Freescale i.MX6 UltraLite 14x14 EVK Board
> 
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   1 +
>  hw/arm/fsl-imx6ul.c             | 617 ++++++++++++++++++++++
>  hw/arm/mcimx6ul-evk.c           |  85 +++
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/imx6ul_ccm.c            | 890 ++++++++++++++++++++++++++++++++
>  hw/misc/trace-events            |   7 +
>  include/hw/arm/fsl-imx6ul.h     | 339 ++++++++++++
>  include/hw/misc/imx6ul_ccm.h    | 226 ++++++++
>  9 files changed, 2167 insertions(+)
>  create mode 100644 hw/arm/fsl-imx6ul.c
>  create mode 100644 hw/arm/mcimx6ul-evk.c
>  create mode 100644 hw/misc/imx6ul_ccm.c
>  create mode 100644 include/hw/arm/fsl-imx6ul.h
>  create mode 100644 include/hw/misc/imx6ul_ccm.h

Can we please also get an entry to the MAINTAINERS file for this new
board / files?

 Thanks,
  Thomas
