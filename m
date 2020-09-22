Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4639395lfq;
        Mon, 21 Sep 2020 23:56:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMRV4xl40vtzfpVfUVcfZqBa2BLsYiILbR7rNSpXf1VDiNMB3zsx4JYnpcujH9A9s4EbHu
X-Received: by 2002:a17:906:85a:: with SMTP id f26mr3319722ejd.389.1600757776392;
        Mon, 21 Sep 2020 23:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600757776; cv=none;
        d=google.com; s=arc-20160816;
        b=XhoJnkIzDqpAlAnaIPBYq0lxJMz9xFxCVveTz+DtnQEB3jNUHrMYl45KTBES/J/+MM
         6BWGNFYXovzAB37XfPou4/eAw5YynT6Kr1hCUKXaDjWKOh5lOK62vaqiPjehPoTVSftT
         E8kRwJEO3wC1FIgpG94aG1afnFBOBrbfD3V9XMcuqXpkvqerlUraapcxQ9VYUMojbu5P
         Ie3SMWs3xhSIcmrQn8dGGFmRFT+vTHU+wsFdSXW2vj84t6xGRmHX1EvnINxEHrvhqG3v
         pM7rp6P5EkgehL/ylepOb5vUnLCO06SHmlqxrhnJ8ILPatLVkAKeRMxrnLOX/YQS0/E4
         xaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=fdmGL0X3kZ623XBvGj6grePr2oGnneoqjceqFQ7hFKo=;
        b=kpqKdVAEEqcOvyMYDGb+0X8e8Pi9wfPSEdZy3xQ4WVlrBmUeLUmk4IdteOd2f4j+7j
         bBpuFe0MccpMenmgeh0l6VSG1BhTRpeeRd5vc42q20gkLVOoqYQb///ZveUVd4B/uNi9
         EVfJW+Cl5ke+Oeyurs7174TBAmvMjaRak6D1jDdG3h53mr9BbasYm/S0DiLqhDGIeRyg
         NIHLh/vU5UoDVBhZ9Ih4suKwcfiQcBuNt7dMusLxHNMxj1SgojLvJ5diu7jC0Pz690Xv
         FteL98w9pbdZwTq9OE7qp05hgba0BDoedYPi7AOvnGTGZ+eGM/UW95KpqkibyVGLwrqY
         JXOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BLL6mPoH;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id q18si9759443eja.581.2020.09.21.23.56.16;
        Mon, 21 Sep 2020 23:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BLL6mPoH;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgIVG4P (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 22 Sep 2020 02:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33466 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727710AbgIVG4O (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 22 Sep 2020 02:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600757773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fdmGL0X3kZ623XBvGj6grePr2oGnneoqjceqFQ7hFKo=;
        b=BLL6mPoHhwG+NZEGA3eMiMf2V15xS8emNXEN1jHwRuHwoQCJUuiWeNTZKGn/AznxuUANZA
        V9BMSfg0zH95gZP1cgqKjLFD0SPzF0zuIILiJJNutQhU7SE73Otp+D4LugeLVLC2nNMMuu
        blhb3jNtX4sM/y7l453043UBbmV31JI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-wGNLihoeN4ueq8iEww--sQ-1; Tue, 22 Sep 2020 02:56:10 -0400
X-MC-Unique: wGNLihoeN4ueq8iEww--sQ-1
Received: by mail-wr1-f72.google.com with SMTP id j7so7033571wro.14
        for <kvm@vger.kernel.org>; Mon, 21 Sep 2020 23:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fdmGL0X3kZ623XBvGj6grePr2oGnneoqjceqFQ7hFKo=;
        b=Vgj4WH4G04L9gHddbIICQKi33kVYbh/OhautCJQSiilTiUOuOO3v2odeEltbkQwkAc
         V5fzHha3th9zsF97+E5vTYihu3aOn32YUj6kUL7e71uSC0V6x4eb/vbg57WRukGcwJh9
         hpBIL8k7mM93GAn2L/WHD6lym8l5tZsfuCG2DlTXkh6f5mCdV6tvqtqGdnamK0w9ZrDx
         vDY4I4REaG7O7+WgnlFxUb+MAz1dTD3aiQUpqgeNfhVskRs91o8e9Yy8zhcZSaeTuqLD
         Dcvpgbdb6i6FEx7DF9DYDEbaZBsWWpmVLA7mbr0VsQ5HUtbB8mGVtdvSCq1TNYmbQQXM
         M1iw==
X-Gm-Message-State: AOAM532b52yyHFa9iybu3jkA1ddo40W3xrnXKRWsXHUf/EtvgvatSOyE
        xA/YQ9Ih+0AjDlAU2uswIB6nAlUha8h8Ul4e3d18PPxLQ6Cc5olV1VjXY0uqdb2FJZcWF2Zmejo
        zoJfI6idhzoWf
X-Received: by 2002:adf:8187:: with SMTP id 7mr3658796wra.266.1600757769265;
        Mon, 21 Sep 2020 23:56:09 -0700 (PDT)
X-Received: by 2002:adf:8187:: with SMTP id 7mr3658757wra.266.1600757769000;
        Mon, 21 Sep 2020 23:56:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d153:8d0f:94cf:5114? ([2001:b07:6468:f312:d153:8d0f:94cf:5114])
        by smtp.gmail.com with ESMTPSA id g131sm3054048wmf.25.2020.09.21.23.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 23:56:08 -0700 (PDT)
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To:     David Hildenbrand <david@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc:     qemu-riscv@nongnu.org, Fam Zheng <fam@euphon.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Alberto Garcia <berto@igalia.com>, Jiri Slaby <jslaby@suse.cz>,
        Richard Henderson <rth@twiddle.net>, Peter Lieven <pl@kamp.de>,
        Halil Pasic <pasic@linux.ibm.com>,
        Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
        =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Markus Armbruster <armbru@redhat.com>, kvm@vger.kernel.org,
        Yuval Shaia <yuval.shaia.ml@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, qemu-block@nongnu.org,
        Stefan Weil <sw@weilnetz.de>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Michael Roth <mdroth@linux.vnet.ibm.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        John Snow <jsnow@redhat.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Thomas Huth <thuth@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Liu Yuan <namei.unix@gmail.com>, Paul Durrant <paul@xen.org>,
        Kevin Wolf <kwolf@redhat.com>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Sagar Karandikar <sagark@eecs.berkeley.edu>,
        Jason Wang <jasowang@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        xen-devel@lists.xenproject.org,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        sheepdog@lists.wpkg.org, qemu-s390x@nongnu.org,
        qemu-arm@nongnu.org, Juan Quintela <quintela@redhat.com>,
        Hailiang Zhang <zhang.zhanghailiang@huawei.com>
References: <20200921162346.188997-1-stefanha@redhat.com>
 <c8892b73-6cee-9fd3-54b0-289149926041@redhat.com>
 <52b8a46e-ab9e-1645-163d-497122ece907@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8610ca0e-0b3f-6d95-43b9-e2e49571e311@redhat.com>
Date:   Tue, 22 Sep 2020 08:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <52b8a46e-ab9e-1645-163d-497122ece907@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ri0HbavnBFSD

On 22/09/20 08:45, David Hildenbrand wrote:
>> It's certainly a good idea but it's quite verbose.
>>
>> What about using atomic__* as the prefix?  It is not very common in QEMU
>> but there are some cases (and I cannot think of anything better).
>
> aqomic_*, lol :)

Actually qatomic_ would be a good one, wouldn't it?

Paolo
