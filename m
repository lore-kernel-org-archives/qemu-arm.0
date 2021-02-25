Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp99530lfg;
        Wed, 24 Feb 2021 22:36:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3pS5GzVQiIqo2UhHj6xM7V+A7tsxdQzsySe3lEuZMniyOlBt0eDuM0V6rUB9U26T/fQol
X-Received: by 2002:a5e:990a:: with SMTP id t10mr1488455ioj.161.1614235003980;
        Wed, 24 Feb 2021 22:36:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614235003; cv=none;
        d=google.com; s=arc-20160816;
        b=oH+zBT+nQTW3YvihouNvo6RWbJ8+MkEfBKifV53THBux2ZRhZYlqdMTE6/8vAC2y0f
         SzU3V51ZS5kKtNdJV+bKFYiMBdRpnI93C2v55upnuq9IYEgx2DVnsMWB0xFaG/VvxdWO
         8vhWzGU3QbOTCOcDh4qQejFkBfSco2vk0JyyivfnmJZBylA+SAZacYX1BeYHyaQ7dobl
         uB8vZFFulbjeZMJphBXe02bGevFvgsFTS8YenXmwJkCjkOnRhrTCZsJU0q3fJQovWPG2
         RTAwIe0D2rMXg/H5B737bYiallxEv1Mt/YpDIEbg6mKIB1oyP60C5ONGPk/oGF6xye1W
         k4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=reBCH9NQ4PLO7z9HYq+Qls5ToyTit+apfHw2z710a18=;
        b=Eurl7r76LVjy4MIbqM2TPOjyH6V6dI1NWyjU+G5UxRtT+H+vO3nu9nRJQf0yJhACm2
         H+gK3vw5PkKddxyAoJxuF3cX6pbOlM6YIqRopEW/DZWloopoW6QF3g2PLUroPxrn32cR
         s3yNchxhTN4UACBwSEatoiOWNlcjTx+iO7wi1m+GMKWlGuvdsYPZIovABYAu4hEqlKhG
         jypqvMlFkwNaguREX6CyYEt9oWiPHsUMaLJb3RqrzMuD2/YRQvLLou/dpI50vr4BiMml
         /IqtVuCzPr/FOyvX+avHgFsdxiZ28aR10k2lI+amo9++MvkniNhi2ASihTOCrvVTK9Wc
         GqcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="oOd4ynZ/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si4989213ios.104.2021.02.24.22.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 22:36:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="oOd4ynZ/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFAGR-0001nt-AQ
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 01:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lFAFs-0001nj-GT; Thu, 25 Feb 2021 01:36:08 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1lFAFq-0004A7-S3; Thu, 25 Feb 2021 01:36:08 -0500
Received: by mail-io1-xd2e.google.com with SMTP id k17so4769054ioc.5;
 Wed, 24 Feb 2021 22:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=reBCH9NQ4PLO7z9HYq+Qls5ToyTit+apfHw2z710a18=;
 b=oOd4ynZ/8nMpDmvwu5Mfz5EkmQxkaC7+uiDHjbj+HPHFC7X+TqZO1TruH6lFLoVCql
 jj7XM2yMs3tsMEdU3ICAaSMg+qnaVXhfTiyAgjIfNR63O58X78bu3r6LdNbQ2OTlEV5M
 d6pjTLkQtVZLWjEJ16PyyY2sePe8s3WVxd25b+IaUnu9M11RSmohUUSBfh2DaXQtirFK
 sb2FJtpXqBC1bHo6rx+b29w09LNygNRvpSxepJIa/UyKYzn8X4jLtbL/39h0xKR3e/Wq
 up32yzW79xdN9ESmf9BiTNF99OooX7zk2TVq2PqBVbCwfMxDWLBTcIn5f0CM5qKK5X1C
 Rw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=reBCH9NQ4PLO7z9HYq+Qls5ToyTit+apfHw2z710a18=;
 b=FGo4qyFoHiJlzLFFOTOubYEwtpixIfyBNPk+E2PaoXgWhi51OVdAZ+UQrYPjIp+FTZ
 HYld+TMNsa4dta/3unHvQ6YnOEn2sgo31y9XyhH347NriUaBqms/QdQ+k76pGZfTlh4z
 7qKB98DDbGiXwJeQSdSnvlpSY7zYXZBVWfp8/AkAL0uzBfLRHw2Qqr7DTCoZ2itksD2a
 VjNOy2ks0vXF5y+b/lQIAcIEQkCMFU28UBayGlI5dNrfPN1L73jbm9R12IxWDDNH2GxL
 AXpZzBMH9jC4+eb4khIFFj1lC3sc3NXlUTwaDqj7NSdGtYBQ6HnU+DfWhIVQQuZ2wZQF
 PCtA==
X-Gm-Message-State: AOAM530IzgBNK8py+XM21SXAbEeejLMzquLJ7zRxpf9mFYJBypjoHEAe
 UhZnKLYd2H9jnags316soVk=
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr1497160iop.73.1614234965176;
 Wed, 24 Feb 2021 22:36:05 -0800 (PST)
Received: from [127.0.0.1] (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id w6sm2804967ilj.7.2021.02.24.22.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 22:36:04 -0800 (PST)
Message-ID: <aca79b9768aeae38512a35924aaad1a7c33368ea.camel@gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
From: schspa <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>
Date: Thu, 25 Feb 2021 14:35:57 +0800
In-Reply-To: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
 <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
 <20210205140807.GH477672@toto>
 <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Kevin Zhao <kevin.zhao@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UsuXiAnIJgya

On Mon, 2021-02-08 at 12:59 +0000, Peter Maydell wrote:
> I just suggested something on another thread: call
> memory_region_find()
> and then look at the offset_within_address_space field of the
> returned
> MemoryRegionSection. I think that should get you the offset of the
> transport within the system address space regardless of how much
> use of containers and other oddball mappings are involved. (If the
> transport is not mapped into the system address space at all then
> you'll get its offset within whatever that other address space is,
> but I think we can reasonably ignore that unlikely corner case.)


Thanks for your suggestions, I have tried it on both arm virt & the
Xilinx platform works perfectly.

I have upload a new patch v4 for it.
-- 
schspa <schspa@gmail.com>

