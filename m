Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5232041lfc;
        Mon, 8 Jun 2020 09:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXIqb/8kEvSVKuHk7B1S3dcXM7pf9hF6WRXOhKRhT9sDdjoj7Gye7ql7rAyWGccJjv9KsT
X-Received: by 2002:a25:abd2:: with SMTP id v76mr32275581ybi.463.1591634230339;
        Mon, 08 Jun 2020 09:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591634230; cv=none;
        d=google.com; s=arc-20160816;
        b=s6ANVKWD9ZekUC6uiHdCashMnTJvoQWvgdNqmXnaNOhAtQDtJLLMWeMfLE41h0Y5NS
         DYy8NVNa0GENWxupQ0p0m62CRAMR6qogdtnihZ+I661j6h74ZlBauZ6QC9H9bGKRKvtx
         WWuYgCYS2WpEbtxjWnoZIKdyUQL6xsHuH4SkYklYVsrZ3svpjtT2IgbTSX/919wnePL8
         HvWAPgYj6TRtqBy41mkBvsy+0U6dgmhEOKE4BQxAxAAABb3qBzCdKL7hvS5aIgllG6Z8
         LbDd5grTCth48TB1qeUlSPnL5xrm9ICRI1fglpuBIIryrfQawTh4MkLbsb+EKkGvu98c
         XEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
        b=0NINYuhpQ+eZpIObffRGehLAYkySyRm656cM367K6eNYj95YQRHkm1inx/aTGxbx2r
         mtFcTGbZf8pv5WbKV8HlhI44zYY3p/bmnvJmuNRKK64Up/lxoZV5wMBagERSIij4N/Wp
         aV4MCFTaV7eypZz46TCxZGXR/MM6YoIIW5/au63y1GDVNZSfhC/vAsdl09g0LjYJvoGF
         u/+gKnoMAy1R/NVvPqOjJWgGL0W4pkXLF29/0hdQbmlmvKVLigQDixq9OKkPXDTEyFvr
         ghc5qSXXyuopAtu0gd2uVR2A//AAC5dTv2IVGJyC+1E5ZIDF/Qz7NsdQU0XhlQeUUAfs
         YuJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JRcWnRER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r134si142681ybc.194.2020.06.08.09.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JRcWnRER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKlp-0007PM-NA
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKT5-0003Xm-9S
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:17:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKT4-0002f1-7j
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591633065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
 b=JRcWnRERdA858LJdWhdyW/963/iUinf3bTRO/Rw/ewmQTBXoxSYMDveEn8Q6NiiyKseU9Z
 yNjvWHZMf+Smy3BK2A64FcPnNJhXdFj9N1V9m3qHQGkWtqTHBThgvfE16rBfFNW9A6G/EB
 MV5mwSMpzwST2Cx6q8tbjSNhNXjtSbo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-3YL_rfdPOwuSW06fDq1RBw-1; Mon, 08 Jun 2020 12:17:43 -0400
X-MC-Unique: 3YL_rfdPOwuSW06fDq1RBw-1
Received: by mail-wr1-f69.google.com with SMTP id l1so7351851wrc.8
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1jLMVbVyOeQVt3DxZyMkiZa3v5bA58Ubvf1vYrVyoKY=;
 b=r5gCqgh4NS+qOEPG31cN0bKwVNXGGimeiW7ZhdvCXhr503BNS54tZ6arUbKEhIw07X
 V37zU+2u2nbjHwQHpVYex9FYkjyx+UfhAhtzyGXpstf8h+0fWgSdiknbVVY8qiDOrbJr
 pHwXUyFwGL+Qi+mUZNkL39jEiMHcIQiFET0e5FFDIl1+8CqL2SwjIw06dXzaT4HrOA5C
 ztj+XUL/gC6KZahRQafVOwxGwt4mV69JJ4mHf+aYdrH4+OfY5ucL5GxuI9adAjrwd5pn
 g0ub6YGbiutXafzxWI0ViIF/EvhVQSp6X9DIJvdPSiNAzMZdC4+GkHI815jc/aU0XBzH
 4Vvg==
X-Gm-Message-State: AOAM532b3ihsYEmHE1/Vhf3EaZ7cYc2L8zU9Ult2dsx0/Pfi1oBMzUs1
 jpIjehWraRGOck5C6G/JPYfoeaHQMWjEkTPi1iUJBvQhar92svL2sddpcj0+4vtlogH9Nmga6Yv
 CCzbvnKvfso9N
X-Received: by 2002:a1c:1f48:: with SMTP id f69mr104667wmf.67.1591633062298;
 Mon, 08 Jun 2020 09:17:42 -0700 (PDT)
X-Received: by 2002:a1c:1f48:: with SMTP id f69mr104619wmf.67.1591633062031;
 Mon, 08 Jun 2020 09:17:42 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id k21sm247677wrd.24.2020.06.08.09.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 09:17:41 -0700 (PDT)
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200608160044.15531-1-philmd@redhat.com>
 <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <81653f82-484b-a04a-7b2c-1362a724d0e8@redhat.com>
Date: Mon, 8 Jun 2020 18:17:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6E6Ie78qxgac

On 6/8/20 6:14 PM, Peter Maydell wrote:
> On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Based on today's IRC chat, this is a trivial RFC series
>> to anotate pre-qdev/QOM devices so developers using them
>> without knowing they are not QOM'ified yet can realize
>> it and convert them if they have time.
> 
> What mechanism did you use for identifying non-QOM devices?

I don't think this is the complete list, this is only all the one I
could find with:

  $ git grep "g_new|g_malloc" hw/

Then on each match I manually reviewed (so I might have incorrectly
flagged code too).

