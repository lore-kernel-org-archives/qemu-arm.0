Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D3CCD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 14:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMoNY-0003R4-Hn; Tue, 12 May 2026 10:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wMoNS-0003PI-HZ
 for qemu-arm@nongnu.org; Tue, 12 May 2026 10:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1wMoNP-0000Ea-87
 for qemu-arm@nongnu.org; Tue, 12 May 2026 10:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778597183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eqFZGo7bqqC/7WbJ2AxbrIAghKZbUfRI1lIy9wNfRI=;
 b=fa7ask3L+VNUVuokXEUeU9QAjU7SMJFqM+VEdGt18D4z6hFH0FWXPwr6rDnxwJzbysofWx
 p5UH8w04Yu2Oa9uEoSg5DKNAInYc7mHvGl2ZQIczGZHe2y0b6hghXO4CfEEXUJqz2jesfa
 NeCQzLYmHK3DkFqtWWHq0wsPR+LJwS8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-73bu2DQ1O9WEkaPH1E28dQ-1; Tue, 12 May 2026 10:46:17 -0400
X-MC-Unique: 73bu2DQ1O9WEkaPH1E28dQ-1
X-Mimecast-MFC-AGG-ID: 73bu2DQ1O9WEkaPH1E28dQ_1778597176
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-82fa5ecd760so2969055b3a.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 07:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778597176; x=1779201976;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+sz1D8FB0DY7piXNhjmP858LGUGVUSa94FPd7NONQZg=;
 b=Gyc7PiqFp2DYACuJL4YvFAWApaJzLZnM8A//ha+YtzueqKljCFEmHUgL3lzOyb7fmc
 M/HI2hl+MOhUk45aCsxjh2tQQjsajqjBGsx7BtBSUmp3BeU0lIFFa1vp8JAS6NdmwMYT
 YEBLqK8NYakKcfbu/5slbfAv4uMTQ4azz2WjGd8cM5SNDWamjC2hDYNxnRLCn7eh6nR/
 Po1OD3RVgxlEzMm0R1+Biw+jnEUzoryeIXstskU7NfQTn5CStXFzrNymJchllvoRk8CL
 VWDn4pf9xRdcv6JWrBtEtCROgbfWicucq3gE5pNYhbN7EBNbUul5hY4JvooDz7LobjjF
 7uoQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/uZZuljYaRTbc/+oeL8TADBu+bAIhPh3h1GhsN/HARJ9j0P+Bpf3y4Q6oZdJqcc8gQRUEmJw+flA==@nongnu.org
X-Gm-Message-State: AOJu0Ywr/t7c6hs9G4OqWLHIYqWTP15TzyjGE0CqXco3E/qCTNzZfghG
 9XG/JrXfexd9cf+W99fl79DsByhuLRjJb9Nn0qMj6knQIsh9phaK/rxmjCTQmjiF+DrYETBF2c2
 MDBxud1bf0FkFVWcHOFz6jSohs5YNj79rYvn1L1yo5txUrQsb0i5xHQ==
X-Gm-Gg: Acq92OEolbBWeKRbIAcEHTHBI2VpvBRjqK6xPBeJMFe7ioamJUjuJ+ChbZSc3A4xTzd
 f44iBA3IiT9QKljdB+MEwxnFQY0WXqox9cZ47qK5pcPzlfENy9wCZC2F+lpFf+wOK30PSdhZIau
 u/p7bCj7o5sLOVY4xQtoUXTqNHohCQlYlMTkv4Z9prrX7UGz9oKzeP7hF96Wp4hKQEzQIpdks/2
 37eDxcszGvHZ7Xmgz9cOZBKe9y03PYXJV+o6Jb0g6yCaY1U6SPyNIJ6vVQuSHht8QAFY5ZTLIsz
 idX+mNIK+c4z3vtZmRV7Uco6/0RKgm7j+An0kocCidZUW3vwkrl02GlmCa9M1XeKfLT6xCeMJ5f
 I/LvVU3n9vq0XCub7V0PEPdbOWerBrOHZ/99cjdqU4TG3j5elQ6RlFqbRW2A4LtUHutA89BSSSd
 w=
X-Received: by 2002:a05:6a00:2e83:b0:83b:b0c2:17ea with SMTP id
 d2e1a72fcca58-83eebd6e52cmr3692388b3a.37.1778597176276; 
 Tue, 12 May 2026 07:46:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e83:b0:83b:b0c2:17ea with SMTP id
 d2e1a72fcca58-83eebd6e52cmr3692350b3a.37.1778597175763; 
 Tue, 12 May 2026 07:46:15 -0700 (PDT)
Received: from smtpclient.apple ([122.163.114.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8396563f03bsm24450070b3a.9.2026.05.12.07.46.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2026 07:46:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v2 00/21] Introduce ACPI watchdog for Q35 and arm/virt
 boards
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20260512153057.1a353c3e@imammedo>
Date: Tue, 12 May 2026 20:15:59 +0530
Cc: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Message-Id: <9E96C22B-D035-4CA8-8127-96D8A8E5E4AA@redhat.com>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260428161215.49cc1c0f@imammedo> <20260512153057.1a353c3e@imammedo>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3864.500.181)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZObtyeGpdthUuFOvNjVTT92j2vvKRNRgKCUu0kd6iiU_1778597176
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



> On 12 May 2026, at 7:00=E2=80=AFPM, Igor Mammedov <imammedo@redhat.com> w=
rote:
>=20
> On Tue, 28 Apr 2026 16:12:15 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
>=20
>> On Tue,  3 Mar 2026 10:25:11 +0100
>> Igor Mammedov <imammedo@redhat.com> wrote:
>>=20
>>> Changelog:
>>>  v2:
>>>     * ditch generic '-machine acpi-watchdog' option in favor of
>>>       board specific variants:
>>>           x86/q35:  -machine wdat=3D{on|off}
>>>           arm/virt: -device sbsa_gwdt,wdat=3D{on|off}
>>>     * arm/virt: add FDT and GTDT ACPI entries for GWDT when it's presen=
t
>>>       and hide GDTD one when WDAT is enabled.
>>>     * arm/virt: add test case for GTDT=20
>>>     * [18-21] optional GWDT cleanup/fixes in handling WCV register upda=
te,
>>>       make QEMU behave according to spec (at least the way I read it an=
d
>>>       it appears MS also read it that way). It fixes Windows 11 reboots=
 when
>>>       GWDT is present (without WDAT). With that fixed it's up to MS to =
fix
>>>       their driver to set sane timeout as with the current one wdatchdo=
g
>>>       will never trigger. =20
>>=20
>> given merge window should be open by now,
>> gentle ping
>=20
> 2 weeks later,
> yet another ping

I have this in my queue for review.



