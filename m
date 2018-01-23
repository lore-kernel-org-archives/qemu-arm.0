Received: by 10.28.71.27 with SMTP id u27csp4099522wma;
        Tue, 23 Jan 2018 06:16:06 -0800 (PST)
X-Google-Smtp-Source: AH8x225AjMitbKko8W3Z2awoF7MSpu25/ml5GvvQkMQBufgGflCOhUkG6pAKb3McqZ6zopRSxeqZ
X-Received: by 10.129.203.9 with SMTP id q9mr2598030ywi.426.1516716966556;
        Tue, 23 Jan 2018 06:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516716966; cv=none;
        d=google.com; s=arc-20160816;
        b=MG5ZSFLgIkY4Zvfq9FhjcRJdRz1I2oDkd4sdL/Sn1B4O+lE4jSEKU4rIij5GROI4cw
         sjmJXbXr+NAkTRR9X7fliN3yBQmsroZzLyFs7mKd/rU+eX3oOqOi9QNXSVl32D4cuRTm
         WbVzAxWRH+LSyjsXYV9/LW4BaDTD6mFRH+uATzJJb8NVxUhhFKKv1qw2xtWii/MHQfuL
         /uZUVfxVumMi/n4yxOfFRA9cagATgUtfhnWwFz66U2EVWZBcYsObLBDKNlv6Rhdzv8e0
         ZGG4w/vsDMhakL+qSRI4g8BUcalxgmowLGxjKEL7t1F5m80S1eyevGVM1UYPZvkgTh5P
         QXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=gXcPuj26qjzZKgP6ELOdplTPalFt5UQYYi9QnmfzTjE=;
        b=Bfybq4/z2iySKQLzvnqS9fvgKh/MPiiSP63dKDyRcF0621QxiYi3CjMtxO0hILm7/Y
         FZhZNHtjQvUJa5vtSH6h2fBEVFn+jQoDk6sN97UUOUMgHoqEZ0TWPWsuRzXdGduqz/ed
         smN7ZVLGkbJUbAAYsuXnH3VqYgEuk6Zt3+WZphjNWjQrByh891WKGAHIlZm61NA2eO1X
         9CqlD+NAYDUHFA53wR49FITSW8MwbwoWAsuV8s/4imAqcIfwvQ/tvWlrrsopHCXALG2s
         +ODjwlQB4nH/AdsNQ4pVt6EcPXq+QTHVuHGiIIzZdOBEd6UQpPbnf+CCxde34hFa+7Pu
         ZPlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=eXKFk713;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si2429063ybb.442.2018.01.23.06.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 06:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=eXKFk713;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1]:59864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edzMr-0006av-VR
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 09:16:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1edzEw-0007uS-LV
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 09:07:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1edzEq-0000Z2-O2
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 09:07:54 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:57736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1edzEk-0000XG-Hg; Tue, 23 Jan 2018 09:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gXcPuj26qjzZKgP6ELOdplTPalFt5UQYYi9QnmfzTjE=;
	b=eXKFk7135CAnifywiV0GX9S8mA
	7fbNmZXrL4JTAmLT3EiyjMQiQXhmivbrT1VVFG9COJeZ/ItoVIpAJo8HjMYApYPiayMN8UhQReUH8
	9lpMRD/GVd6bMF9/Cv9pLGwHr+amKRvAiRXtvG+8la6FlCSUn1ePoDQxXT2SLes7mkIQ=; 
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-19-git-send-email-imammedo@redhat.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <e272de4d-94c6-e164-0364-f54402695846@mail.uni-paderborn.de>
Date: Tue, 23 Jan 2018 15:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516694904-64879-19-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.1.2730818, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.1.23.140019, AntiVirus-Engine: 5.46.1.0,
	AntiVirus-Data: 2018.1.23.5461002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 18/25] tricore: cpu: add
 CPU_RESOLVING_TYPE macro
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kKetA3O9ir2+

On 01/23/2018 09:08 AM, Igor Mammedov wrote:
> it will be used for providing to cpu name resolving class for
> parsing cpu model for system and user emulation code.
> 
> Along with change add target to null-machine test, so
> that when switch to CPU_RESOLVING_TYPE happens,
> test would ensure that null-mchine usecase still works.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
