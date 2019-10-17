Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1161126wrm;
        Thu, 17 Oct 2019 09:11:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyV7Pl9S1LZgjjoQuC/LC2iIkC2eJO2VKrB2asn9fue9fBwsOoHc8DuvJj69BKddR37Q0+1
X-Received: by 2002:a05:6402:b16:: with SMTP id bm22mr4742309edb.160.1571328683070;
        Thu, 17 Oct 2019 09:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571328683; cv=none;
        d=google.com; s=arc-20160816;
        b=1LVDfp1w33aEf5AMvbR4wXBMl74FEg8b6Y8vHglrX/mIylF4q91Hi1UUXlkT4eoYvV
         moriTVGTMTcKgOvAZxgOILZj6oFZ6zblxgIc8vQznXM3k14AwjLTNuRfKt/9nwGtJW8g
         31LFjMsfD1lacyb6t33GBg18Di9a/BHVzorjDfNXlkLvQbN90PTfrduHTyZ+2Bf2bLzV
         C0CNy769pA9uTqlsNcAWALXRDCVuryPLBbDHaykjRHZyj9nyUKHffbm0Bp9CbSH3/rhi
         udunymrtwsaYZqLiryHK+VtSiTmbj/fwTeYMnGx6pyZeHr75rKcnhJ9HonH1y5Ckxks+
         6u0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=f01DwYMPtEcSrSlXvjXzmCIFMeBJq3Q4ESMo/1KBmU8=;
        b=lrRTdZ79xWArGKx5iCKt9HU1/IXWQAF9nzeNwdy2LsA1laLOZm5i92E3C9yNi7l+jW
         memhxfMnpHI6NryTQhtd/5CHvG0+YTrAz28HO4WCKLiL7SF9GdUnByvl/LZYqeIesO7J
         O7jIJSdIgIb251hxOsN36YrfnVlZ34fs/axWg9tC1HsSIiBDUrLjziQb6dQ2BRvVYVSo
         5VrsGDCkQCePv2pjAj3zM5Zzt8t+R/4uGXyxPAbvelQxP29COsGO0TrgGdU3tD79VPmG
         uKgUoxl5rQYAyp4SR8baWJG0TKc+wcNiBHvlcquN3HayUf4CAS/Yj8x4wlvJ1iHO56eO
         LdNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h50si2025318ede.423.2019.10.17.09.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL8Mz-0006OC-Kn
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 12:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iL7dh-0006a4-ON
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iL7dg-0000nc-MK
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:24:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48144)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iL7dg-0000n6-EU
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 11:24:32 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 896033E2AF
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 15:24:31 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id 7so1136945wrl.2
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 08:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IS/vtS+qEHcMK9d+rcriOqJkkt4vsA+YTxXci4TyB6U=;
 b=RdexYmYPDmjJsrSJQM7bHoKlattPtTWEqOhi3iaE0hOw6KADlmIybEohV3XchpPeYF
 edoRjjkc/JkY+nDBnDB5E7Etp4cEjVlNXji+vMwiCxtSTH2y8nbMxkLWexNGTIVQ7V+A
 sv4xX4V3ynzR0PGhEMd4xFh6WxY7aUGKb0uNslVlqQ0L7XBrG+90DsTKWC3bfnY4l/yQ
 IrsYaVe4IdIdLLs0Eyy+1pNME2owpBXyDYjfOFIz3xIOpQMOQZBtfrre6+9zDkhP1iX+
 1t3/eZTRkWhyrqZp48Y2xwAH3OpWWURb/72ED0oNj2ZDYc9Z7Q1au3pADkDyNMhFldAv
 u3kQ==
X-Gm-Message-State: APjAAAVB8qSwrLXxLSHem5sH5OssdfalhflPsdjSyfDQs+8t6QKkWYjU
 eja4FSBQQZd66w57VAUk8svZDUksYlErv8PihorTpuXN050g6UyJf59jIB2LLIcFXeQ8HkX92Fa
 ECKLoHqNxdeKkVLQ=
X-Received: by 2002:adf:8567:: with SMTP id 94mr591057wrh.65.1571325870249;
 Thu, 17 Oct 2019 08:24:30 -0700 (PDT)
X-Received: by 2002:adf:8567:: with SMTP id 94mr591040wrh.65.1571325870084;
 Thu, 17 Oct 2019 08:24:30 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id a71sm2433307wme.11.2019.10.17.08.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:24:29 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/timer/xilinx_timer.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-3-peter.maydell@linaro.org>
 <cabcec27-c6a7-6ea7-e933-589f2385c137@redhat.com>
 <CAFEAcA9dRMu_hauo_PuJyWh03+-Y9ogWmKSBfzu_6GhYCrnDAQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57a5d309-97a5-75ce-dade-504557071fc4@redhat.com>
Date: Thu, 17 Oct 2019 17:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dRMu_hauo_PuJyWh03+-Y9ogWmKSBfzu_6GhYCrnDAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +VoFK/oUymlR

On 10/17/19 5:03 PM, Peter Maydell wrote:
> On Thu, 17 Oct 2019 at 15:57, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> Hi Peter,
>>
>> On 10/17/19 3:21 PM, Peter Maydell wrote:
>>> +/* Must be called inside ptimer transaction block */
>>>    static void timer_enable(struct xlx_timer *xt)
>>>    {
>>>        uint64_t count;
>>> @@ -174,8 +173,11 @@ timer_write(void *opaque, hwaddr addr,
>>>                    value &=3D ~TCSR_TINT;
>>>
>>>                xt->regs[addr] =3D value & 0x7ff;
>>> -            if (value & TCSR_ENT)
>>> +            if (value & TCSR_ENT) {
>>> +                ptimer_transaction_begin(xt->ptimer);
>>>                    timer_enable(xt);
>>> +                ptimer_transaction_commit(xt->ptimer);
>>
>> Why not move these inside timer_enable()?
>=20
> Because timer_enable() is called from the callback
> function timer_hit(). Since callback functions are called
> from within a begin/commit block, if we called begin
> again in timer_enable() it would assert().

Yes, now I understood the point of this new API ;)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
