Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp418498njb;
        Wed, 10 Jul 2024 08:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUL6Vdxk3gaDqXEBbuxyFgDxC2y2D1F0q9ISsXQRX8Gq8t1pdwXURYJa8k1kLswidNKXCdNNrzTg1YGmYFFO+tHp2dAktDf
X-Google-Smtp-Source: AGHT+IFlKeCp7mIiWlysrqY51gafHXr/cMxOxzNNPebO5x0UO7Unl2GzuZQuVJWTsB99wFb1x9SZ
X-Received: by 2002:a05:690c:c05:b0:64a:5493:e0bd with SMTP id 00721157ae682-658f09d2b03mr82746457b3.40.1720623758510;
        Wed, 10 Jul 2024 08:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720623758; cv=none;
        d=google.com; s=arc-20160816;
        b=LvHgighY7e3hNhGRxQqqocuXw7XwJiV4K643Gl6njkiDFX1085YCyzutIWbmtxEZPi
         JKG/Lp4N5Eag4MeFcCzlhmxJc6mS/DchpoKtS0eGA5mYEkXyXL6wUS1VdZTdpsab5zyL
         P3PJ9uPeWc7LuinrFdZhK2Lh0sXdp7sB1LdQVbAYZSedz7Lq4hmXEDbVQfIMtkoXt165
         hUiey1ZRP+iY8o0uORRohXguPpQnITgD9+gSgISGj22ak88gS4s7eeFotbch29IW9vYh
         WTWiDrBU+lVvYr5fLXHZ1YJEZbXj/j4PV8pzUoA+Z42xjBjalBciv1CD5sr4R/wuxnPY
         7/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=RKQSs8FWr7Zn5l+H828xnzTIT8nIZAPC2TEWmBUKCkQ=;
        fh=4XVu7TQoKrvdONIRlvaRr/gKOMn8AdHwgrKm7lELf3k=;
        b=zMKwZO0nCk13iklGZPxNCQdbbofQjuuRpnE5WFB08L9Il412ZOx9uQpRDn5Pkcl/K3
         ZndmcFh07wGr+RUnnpyPag8GbkczHdMMUk868bX+gdJyYjOg6vLa68jUMXdL2Q9GIVXu
         tWZwg67kuYv2pUUoIa1jF08lPdlGL8dcjs8W7ozD2jyrx9GeXwMK86yX9SUtKaosz1k9
         hRr2uGrnIPoqN+c/AH/sn3bIwBg0DOThexkq24L3ISTlhf1v2SY9rDx48YWlKY9SClXj
         u3S+KPPXXTtQti0oVOMjGYqVroNMr3R0VHnykgCxl5yEpysb+hyWMlF5ZhoBBxKHj3U8
         UNgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItFrRK7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-81076956e6bsi678422241.97.2024.07.10.08.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 08:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItFrRK7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRYpf-00010Y-SQ; Wed, 10 Jul 2024 11:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRYpe-0000yD-E8
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 11:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRYpc-0004RX-H7
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 11:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720623727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RKQSs8FWr7Zn5l+H828xnzTIT8nIZAPC2TEWmBUKCkQ=;
 b=ItFrRK7yI4Rt1SsPrjo03Rt+gtPYZSeihyO3JkGYFrBUlhIA2VOMRKKNqxedCSmUlhrUv1
 LObFqLcvvV6HC1CjvG6jcqNXerNWL5dZwk+6A0bWwz3r6DpLMfdcvA7rpcbPGcMAVGIZHT
 Z5CwURSaY62CsyfM+rnupBLaxwvW1cg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-wPB7hp57NGeZXD3h0DA91Q-1; Wed, 10 Jul 2024 11:02:03 -0400
X-MC-Unique: wPB7hp57NGeZXD3h0DA91Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-79f1b638b6bso4632085a.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 08:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720623723; x=1721228523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKQSs8FWr7Zn5l+H828xnzTIT8nIZAPC2TEWmBUKCkQ=;
 b=M+OIVKDklRLVJaDVTjEgTFDdat7sTP5aZyi429uslnbYBQrrx8HQiqF0FI8VljYY3P
 dDxmuUTF/9ZnSvSgteY31R8W2/NFXiyiEjPE0xMzvSV+VsY2Rnp1j3h3r15cyC3a2LPC
 4LeZHZ6ifVwPNE+LWP6bmU3E+YIXvyuymoja0pXuNCA9/HUySCl8Fwb9TGKxzX4yBBWR
 X2vdJGG+rRVrKQK2m7Srtt8aVKck5XgpDQSzS1sdWgqPHY1pVtaRSjqlPAN+DlFObWTA
 1kVJliV/dmaERHN5n8Z4EqCsWmxzWfAZpsh6XgoK9y5iYHZ94ycooovUOB3cKhxJN/lY
 mPlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCl96bBYHtoq6gHhdffLCJpwxR9aJQAfzkRB3Mz2RnkV54jSMh6YYjjx20exqHbHhG7ptXKneW7IWNp9HyMYuOSQIx
X-Gm-Message-State: AOJu0YzINrRyLWwx5irtRw2EfVmrGPHtaMkqAFE7R2u0avPNAVHqcilu
 7U8zm3Yk8Dbf+n+TxS23TgcLT2JaeRUXLDVxcvEyiDCoUdybPl+BAAkymPChBV/MZmWbLH9Z/k+
 RHCfX5VCD9xIaJ6JnECU4SkbvYGzXeHpZtLYFd9Tr+MN5pUs8ZQ==
X-Received: by 2002:a05:620a:1a94:b0:79f:b3c:8fc3 with SMTP id
 af79cd13be357-79f19bee0d0mr649669885a.6.1720623723051; 
 Wed, 10 Jul 2024 08:02:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a94:b0:79f:b3c:8fc3 with SMTP id
 af79cd13be357-79f19bee0d0mr649666885a.6.1720623722685; 
 Wed, 10 Jul 2024 08:02:02 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f190103e1sm202838085a.42.2024.07.10.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 08:02:01 -0700 (PDT)
Date: Wed, 10 Jul 2024 11:01:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>,
 Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org,
 Luc Michel <luc.michel@amd.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Message-ID: <Zo6iZjc8YpI1_9dW@x1n>
References: <20240627162232.80428-1-philmd@linaro.org>
 <20240627162232.80428-7-philmd@linaro.org> <87cynmfggx.fsf@suse.de>
 <Zo2lLLAwcZ8bBvO2@x1n> <87a5ipfigb.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87a5ipfigb.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uECINygYePMO

On Wed, Jul 10, 2024 at 11:08:20AM -0300, Fabiano Rosas wrote:
> >> I think it's ok:
> >> 
> >> {
> >>   "field": "unused",
> >>   "version_id": 1,
> >>   "field_exists": false,
> >>   "size": 512
> >> },
> >> 
> >> vs.
> >> 
> >> {
> >>   "field": "vendor_data",
> >>   "version_id": 0,
> >>   "field_exists": false,
> >>   "num": 512,
> >>   "size": 1
> >> },
> >> 
> >> The unused field was introduced in 2016 so there's no chance of
> >> migrating a QEMU that old to/from 9.1.
> >
> > What happens if an old qemu 9.0 sends rubbish here to a new QEMU, while the
> > new QEMU would consider it meaningful data?
> 
> It will send zeros, no? The code will have to cope with that. The
> alternative is to put the vendor_data in a subsection and the code will
> also have to cope with the lack of data when the old QEMU doesn't send
> it.

Ah indeed, that "static const uint8_t buf[1024]" is there at least since
2017.  So yes, probably always sending zeros.

Nothing I can think of otherwise indeed, if we want to trust that nothing
will migrate before 2016.  It's just that we may want to know how that
"2016" is justified to be safe if we would like to allow that in the
future.

One thing _could_ be that "rule of thumb" is we plan to obsolete machines
with 6 years, so anything "UNUSED" older than 6 years can be over-written?

-- 
Peter Xu

