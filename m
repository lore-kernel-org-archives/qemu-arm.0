Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp8045206lfb;
        Thu, 30 Dec 2021 08:07:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRZUu3pAwbiW6Uc1xqxNWWw5D3aFnUnjqUE9ZDPCXnnT9DRBLI8IOFn4CUFpw0Oro7ec9Z
X-Received: by 2002:a05:6130:394:: with SMTP id az20mr6518007uab.57.1640880474274;
        Thu, 30 Dec 2021 08:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640880474; cv=none;
        d=google.com; s=arc-20160816;
        b=UtUqDDMmVODKexjkUUjLNmoLGc1aLOdMADDWWp29968pwTTe28Yt8On8VN+BjBOC0h
         htAIaR3JmDQRmroqyiO75GpnHSR29IlQBXwD2jK9r7VP5p+GbaC83MU3SJZdvDmkfWdB
         XTIi+5hRxSCHrQ0RsvTfqMrMGqFBvzfkEJ+rPv4RUoKeR87XJcScyr0Fp/fsyuWdkFbi
         zVlm0rvdJ7MIhyvTu70gdfn7HEjGuc+SNgBQ1gO3iVN5SIaEps08KgxG74Yy7iB/vZ9w
         BMz32xwKQuhqTT0+tghhwpxXoAwhDnA2OaKvVNFwDqFosGe+pFNR3ntAq9JPWvaoRLZo
         HNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=yX/pvSgj4F0NpydsSkEKwkLZ2HI2cTP2y1vAkSFiFbU=;
        b=q8KzI/CPlb+SKqBByWYoL//T9TJrRdt+VUI+GXAxVMjFdyPLuwHuzCXxMGIIyEkRo3
         RcgGxf7f5ZGOGccQ14/lIMeiszJxhGoYW7PLFkTMJ8jMWclbigMarZ59g6j8PKxkygOs
         /+r9jV7vQP3J6RxdAK5DBnuXGMkG8dxMTT5mKNvIyhfpkc22NugcW2NPN+lxTsxM32IB
         GCcVdlce4HDNWEZgLmBMZ5k0M7V997m3B6UZK+0nXe8LtlbHBaHkgst+37jeCF4WbKOr
         SGRlA/rgfumr3qCl71Q6xXyXk8YeXIWgfdR0XejNuTLPDaS44RQPQrtHlEgQnvn90p1f
         XyCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BhzbVAZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si1962452vsj.199.2021.12.30.08.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Dec 2021 08:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BhzbVAZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2xy5-0000nQ-La
	for alex.bennee@linaro.org; Thu, 30 Dec 2021 11:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xxs-0000kh-Hw
 for qemu-arm@nongnu.org; Thu, 30 Dec 2021 11:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xxr-0004a3-4V
 for qemu-arm@nongnu.org; Thu, 30 Dec 2021 11:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640880458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX/pvSgj4F0NpydsSkEKwkLZ2HI2cTP2y1vAkSFiFbU=;
 b=BhzbVAZA6Bc5oMI1pq5gzEwFwESInBg+KZyjxCWh9rjDAtpyAAHdwY8MKsjao+E+FAzc98
 opOm33aDpU55GpS4sIyuHOjRAwZZwVY/x4f5V/jJOIwXOszVB2q5RDQ9VEumxUi0dr7mY1
 iIokTJclPpNaZ3Gmv8tNc0g45jTOB7A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-avnu3-5FOtGW6vt_Pb23fw-1; Thu, 30 Dec 2021 11:07:37 -0500
X-MC-Unique: avnu3-5FOtGW6vt_Pb23fw-1
Received: by mail-wm1-f70.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso13596392wme.8
 for <qemu-arm@nongnu.org>; Thu, 30 Dec 2021 08:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yX/pvSgj4F0NpydsSkEKwkLZ2HI2cTP2y1vAkSFiFbU=;
 b=WAVEDxc2mAI88ELWeQLWEHna1MlXs5fepx4j0y9uVxv5CLo864rNZ6Va5rHIHEll7v
 Cpq33q4cOI1rtjkb1gLKSwuvfcO5gOJ1/041WdfORrzNl3dsYihPnM6FVMZxBm2QhGm8
 YzSGTHbUgheezeVmpoGSs9ujfVL0I70y/O16n1PwKn6Ez5uiELfpjZxPYNmSwc30XD4O
 xMUyj34TX3O4AgCJf8a/3r0INkxUxtm+DjYEBHOaYy8Ch5pCKy7sxLohCCNsSVbfrSSy
 83E79OavFSvc4emQg4L5qjCg71t2GtAk3o8fuUaCtVClncUvh5fW8OmTxBQZuHzCa/U6
 UDZg==
X-Gm-Message-State: AOAM531Lx3ZgQs4pOzVZLNyNdInBp6YuFfAivkkiwDCo21FpSlq3mvcR
 QACOdK3OboXkefDXuKZpVOi+Tyv0YD32lqZPqKuQFv6jrRExNRfJ+unZX+HyelO0ktbYa7BokR1
 MBueFWyaG2DK6
X-Received: by 2002:a05:600c:4e4b:: with SMTP id
 e11mr26423357wmq.28.1640880456404; 
 Thu, 30 Dec 2021 08:07:36 -0800 (PST)
X-Received: by 2002:a05:600c:4e4b:: with SMTP id
 e11mr26423317wmq.28.1640880456225; 
 Thu, 30 Dec 2021 08:07:36 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id h3sm24458082wrt.94.2021.12.30.08.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 08:07:35 -0800 (PST)
Message-ID: <60d8426a-b2fe-08e7-5ab6-ee73dcd114cc@redhat.com>
Date: Thu, 30 Dec 2021 17:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 00/23] hw: Have DMA APIs take MemTxAttrs arg &
 propagate MemTxResult (full)
To: qemu-devel@nongnu.org
References: <20211223115554.3155328-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9AXvOkDEJl2

On 12/23/21 12:55, Philippe Mathieu-Daudé wrote:
> Hi Peter and Paolo.
> 
> This series contains all the uncontroversary patches from
> the "improve DMA situations, avoid re-entrancy issues"
> earlier series. The rest will be discussed on top.
> 
> The only operations added are:
> - take MemTxAttrs argument
> - propagate MemTxResult

Series queued.

