Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp385973lfc;
        Tue, 9 Jun 2020 04:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUFwV+i3Xulvrjp76kvTc5yunkdIVbuPRne2/cJnYs9hv8m1A/n4YCccia+asDOQvaHf3P
X-Received: by 2002:a25:abd2:: with SMTP id v76mr5488203ybi.463.1591701444137;
        Tue, 09 Jun 2020 04:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591701444; cv=none;
        d=google.com; s=arc-20160816;
        b=ocvDT+sYaydJYE0vM2J3D+2CJNF5WisGzGoYJ443sjlXUq+wyVjLR5ruveInxf0k7p
         xYPUZK4cOT1HnqTfbTi54q4u798tCs3B7nO2is9gKb90FWRvtN9sVGS8G9dnsZEoVRlD
         Oy70MJ4K73tssz9m0aKTNgpSQwaAnydJilXBmsvHgmWgHvmTQKMaO643Ve4OLT7a3nWR
         x4Nnh19BQ5PG+lm+5cstU4chD4NnErdIHAG/6TTgcx9twnrs6gso0oztqScBwXDX38xe
         1+U47wpTm/eCi5cj6iYDkdH6GSbgYVx587FyzPpfPiiQZJ6dPz+tpByfAc3+1Iljzp+U
         RqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
        b=RZ2BTas7j3B4jEVpq+cCwtNG1gqI/5O1nZQEu/FHnXthnsEp+pN0ZvGoJWX2qpn3bG
         0hz/u4Ve6FH2R7uJfVsbl5aZUBiGfc/VUHu8OyKAPAyKKXCyU8ff/ZidqXz2IKOjBUNf
         Z8oNVyLS9gPooBjmEVwM+eojuCQZxlwv+ckygVvIjXkOOCIKyjm9visot8TR0vbHszbD
         J/hrikzF68+icu+tnWc19WE8ynWPEXvXendgICT+qxn4G+EU9S2mq9WWQrYpi12cMMpe
         jCQ1tRdy+BR2z6kpRACe6iu7Ko2zHDhkW0F56/K80pPveWxs6vh5Fma/8WxVBzJw6h+e
         Einw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A8i2mtWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l83si450091ybb.355.2020.06.09.04.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=A8i2mtWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jicFv-0005ie-Du
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicDT-0002gp-Ao
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:14:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41139
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicDR-0002MR-E4
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
 b=A8i2mtWa4lUufXsfu9UZxPLv6GIzi7zqSyIzBSlgaaTrHaq64jmJ8qJ2vSmfwLF93Du5bO
 LQQiHHTQaSIEaq/WTbF0Q5bv9w7fC8iXTrke424NsS0F+sMHD3leRlvcEMTqoJLTPwBD/p
 1V5i8Pd/OGjMxKFCbFJU7+JfKp2YVlg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-OPdH6ePdN4uS0TXR1lBeWg-1; Tue, 09 Jun 2020 07:14:47 -0400
X-MC-Unique: OPdH6ePdN4uS0TXR1lBeWg-1
Received: by mail-wm1-f69.google.com with SMTP id u15so529274wmm.5
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pM1sXV/7eH//dmNxCu9L646uRo7LpSiWcH+A4/9rq/Y=;
 b=BAPKufETSmlgctiT3ACC5hCY2gKmNzqv7ojTfEAdus77+IfIk1lVEfHQ+9g55ghGLP
 iZnmY+q4SiocxjJSiFQ3AzPDlSwPRFP0lo2tN373sX4Nx0RAD3d/pMU2CKTOLUJ3+9h1
 mhEaVN6L/JU4n+BNr8vcvXjNsxszjhe4AUt6II4htY7k8se+rBVtupLRhHGoENevprOU
 rT7oo/fthE7Opn2vZzf6DJqTtTrXbC0YmR8TZIk2NtwVLOkf66opIgq4BKNHHBVrZUHZ
 LW7/6d0cbkwxA5yU7+rWrpQLHjZbEN+Z5Oey25Zgf68JONngwLav311uH5Ba2vKvrQik
 raCw==
X-Gm-Message-State: AOAM532rNhfNWaXcqVv1DrdMU/jfhFHUJ/Wim1zWkNTOpfcxYdFGz0Jq
 Qx1xfouBUiySVtJIRshvej9LMjCishDTFLdh7a9NKu3c4ggZSkJ36dPqcZ8iyUOMchDZXdti/V0
 zSJ+lhf6iz278
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3651936wru.427.1591701286135; 
 Tue, 09 Jun 2020 04:14:46 -0700 (PDT)
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr3651896wru.427.1591701285907; 
 Tue, 09 Jun 2020 04:14:45 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id f9sm3121051wrf.74.2020.06.09.04.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:14:45 -0700 (PDT)
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200608160044.15531-1-philmd@redhat.com>
 <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
 <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea1a0932-aecf-3e88-1444-2f5ca369cc67@redhat.com>
Date: Tue, 9 Jun 2020 13:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DQQVDIVuXkYv

On 08/06/20 18:17, Philippe Mathieu-Daudé wrote:
> On 6/8/20 6:14 PM, Peter Maydell wrote:
>> On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> Based on today's IRC chat, this is a trivial RFC series
>>> to anotate pre-qdev/QOM devices so developers using them
>>> without knowing they are not QOM'ified yet can realize
>>> it and convert them if they have time.
>>
>> What mechanism did you use for identifying non-QOM devices?
> 
> I don't think this is the complete list, this is only all the one I
> could find with:
> 
>   $ git grep "g_new|g_malloc" hw/
> 
> Then on each match I manually reviewed (so I might have incorrectly
> flagged code too).

Yes, you did, but I guess for an RFC it was a good bang for the buck.  I
went through the patch and noticed both a few false positives and a
couple blatant violations in recent code.

Paolo

