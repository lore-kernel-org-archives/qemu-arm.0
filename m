Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp265778lfb;
        Fri, 8 May 2020 08:48:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJeOTlOQ+XVF7tuBnnAAOf2yKoz8JQMIFIHJhm3lHMkibQhoGHolhl9YJZHgQea/upzH07a
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr3651850qtv.328.1588952913307;
        Fri, 08 May 2020 08:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588952913; cv=none;
        d=google.com; s=arc-20160816;
        b=hC9XWSCLMnwHIKqelZGmJE/Q7MNygPoUcPJ8kMimYDAprrZqYWLJFRwTCxTWhQMnl2
         2mytZP0Ak0CjzonOunYo3EWt6QaBgmVPE3Hwu3s3v046Xdkcr264O2I1xPk/uKgZMSct
         PG2P2tSNM2cMQLcPVUg2+rHFV0AK4iVsj8MGXTirwjz9toHLhoMOZAoTkmerfYkFdQ7L
         qr8GQUJAEaGdHTBY0Im1ekXTRrjDDULjXg9KuNQ/6I1cmQLiyjdNNQGW0LzPHjORPE9+
         Bj+LfasCE8wgGUyWOA/qHjTSy69GWz5UqNg9icxM2d+JWvpX5rQ/ehNiK++ANHZFuxB4
         xIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JuSorLg7Qq6QRnbKcuGatq1qidVnqnPNge7Pc1/vX6M=;
        b=RaVgulWL99avnOUYTdt1DhAsYXgPKjKqJJ9QQbqumruaZAZQIVM5U8pdiLWB/mPSgy
         ruKld7G73h56TLdP6NWqj4h23BB3FcHNAEWasMm/dinXuPfnYoB+TmfEYD1Hkv3bRMrD
         EKm724Z00GM+lF8s8s7H3JfP42uE5Jn6Y2DItQJfdunqPcu26iUrWdAK2ykgk9yDYKvs
         rWPUiiVczF5TC8OyH1wwVKoNqtyz1lEvHmiaEaVbDmZ9SlG8UoFgrtkaVhHR6dQBPl10
         X/Wt9GJLhYQvoiP/7v08Nvz4TF8QfvGc0AEDzm6/Sf7q8epTvg9aT1ggYZpM8aXw35ss
         M5bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E+Y5b9eu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k19si1186417qtp.81.2020.05.08.08.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 08:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E+Y5b9eu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX5Em-0005Oe-MV
	for alex.bennee@linaro.org; Fri, 08 May 2020 11:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jX50Z-0006sg-Hp
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:33:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20481
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jX50Y-0006FN-I8
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588952029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuSorLg7Qq6QRnbKcuGatq1qidVnqnPNge7Pc1/vX6M=;
 b=E+Y5b9eufZTOphVPV+hNY2DALImefD0WhElM2S2xP3SSMoK02NmxePUTiSNWJhCypaeqt/
 PVH/qQU+hbNQWL0o9S/fGiMcRdA208q0ugR6/gzxX/veHvI6Z8QRrzC8Tr5rUipPp1J0HG
 HC511wXgDh1BoqxF+IV1l8kd2+bQm+U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-ex6cFFWxPPiyh92sLPNNAg-1; Fri, 08 May 2020 11:33:45 -0400
X-MC-Unique: ex6cFFWxPPiyh92sLPNNAg-1
Received: by mail-wm1-f70.google.com with SMTP id l21so5347103wmh.2
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 08:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JuSorLg7Qq6QRnbKcuGatq1qidVnqnPNge7Pc1/vX6M=;
 b=js2czntwVMCiA06YaI9YqeESfP6mNOYwOgWhrUhXZrkhm7W9mjYy0L+Sm9ozpYYNs/
 a1BGQJEnMW7egih1/RHwRAqTbKT3PSv1h2NzSbRF2UJi12DeSKvAh7oCvJJGP8dK2sgv
 wTIrUhdbnlLeAog0hpdzwTT36dfZBe/Wt6nOC5Eh+d81kB8fTc8cECM5N+sojlQeDSpx
 5LvzZgcEIKU48CUuFNSf7lNGvPPlkLxwNJy7iGBO9O5bPS91IixlBgHYH0cP4z3xAP1k
 b+xQKii7iIzS4Zi9k13T9lJYwIfCugnSWaXEm30G8wlx3rpe+E1yiZUzCCnWKu0oaM3w
 KQ+w==
X-Gm-Message-State: AGi0PualYQkkCS/rOIjMi9UdArWfIJkKdOxHnW5yT6iwT7b3CG+Y0wm1
 7GMihrg+nde1hrhvjPVD/4zzPaWZEZbK1tkIBXoPcdDSY49G0Pq3puex+d+V7XY5wst8V/AvSd3
 npC0uRVZLucP5
X-Received: by 2002:a1c:abc3:: with SMTP id u186mr16284250wme.42.1588952024456; 
 Fri, 08 May 2020 08:33:44 -0700 (PDT)
X-Received: by 2002:a1c:abc3:: with SMTP id u186mr16284237wme.42.1588952024221; 
 Fri, 08 May 2020 08:33:44 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.138])
 by smtp.gmail.com with ESMTPSA id l5sm13068023wmi.22.2020.05.08.08.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 08:33:43 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: Beata Michalska <beata.michalska@linaro.org>
References: <20200508062456.23344-1-philmd@redhat.com>
 <9396e0cb-388a-e08e-c066-82a60708ecdc@redhat.com>
 <CADSWDzvECqOXzusk=tj8r4z-E5CDZn4TNG8PJ5pxLHAn3saOzA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <500bd6f3-2b14-eda8-72e5-56c46b7860bd@redhat.com>
Date: Fri, 8 May 2020 17:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADSWDzvECqOXzusk=tj8r4z-E5CDZn4TNG8PJ5pxLHAn3saOzA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gk4NH3dNwBpw

On 08/05/20 17:20, Beata Michalska wrote:
>>
>> mr->dirty_log_mask tells if dirty tracking has been enabled, not if the
>> page is dirty.  It would always be true during live migration and when
>> running on TCG, but otherwise it would always be false.
>>
>> Beata, can you explain what you had in mind? :)
>>
> It has been a while ... , but the intention there was to skip the sync
> if there is nothing to be synced in the first place - so for performance
> reasons. I honestly do not recall why I went for the dirty_log_mask,
> as that seems not  to be the right choice .

You probably wanted to look at the dirty bitmap, but you would have to
define a new bitmap rather than looking at dirty_log_mask.

But that's cool, because it means that we can just remove it!  Thanks,

Paolo

