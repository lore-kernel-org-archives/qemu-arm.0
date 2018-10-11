Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2688271wrt;
        Thu, 11 Oct 2018 08:53:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60hMMYas9++8CBON3Wiapysv7AE0HFxx5STFvBwxSAyBJFayRjOmj+KyCgA7Qsr6dqqheNm
X-Received: by 2002:a37:cc1b:: with SMTP id r27-v6mr2113950qki.272.1539273239678;
        Thu, 11 Oct 2018 08:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539273239; cv=none;
        d=google.com; s=arc-20160816;
        b=VFRhVa03HH0SXb5BUP6xbo7YxmGND2XeW3lS4rCX1CcD7MyBwMw8Wi5Mm4HFUSJmlq
         mwdefFmnExSebFhzwgq0O6LJuI/b/JlIadKDHaEIekWfLijIzisvKgUDHPQUBey1+swh
         UdS0OFSK9Yt+A0pxlPvXSp8+AfuTBBZtWVyWIEHe4+iwH6TkvdXhV3gu2NsWyQqMscMQ
         2EBSxJ9P1nCEsP+M2a1tyqz87/DUmYdyBIXu85nSmmEPZsjK+SrHsnkY12Sk75hoyadn
         KO2taO1Zx9jsGN3dmznB0Q+Xq9I+0H4eO0o8AljranzF20/fdLHpp9fX/HKfSAdOmHaw
         6dWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=x0BkSTdeq9rP2gdAjXwek4ubYtG72LV5IvipbdsuhQA=;
        b=VjayquXoVXI+k/0h5q5NWNnWs1LbmCm7t+Y1IGZLbiu6I6aaLXT8ZLmet5a5c/czLq
         ydD01M5If8VTx5omMKgI0MnlE6fR4V6WFcFP8garV2o70OZJDfqkNyWxBg+yBq32kVby
         7TBya6qxehq/UYWxDl4A8TuwekzVKwdf70qu/X+oxVPrwNEfn/BIOo/ZLHqR0r2O9nFs
         +HxPfR+XQ7i5UTR8Y+46ZUOYUepUHWPy2ESsqr2zOmJHF4LrFyv9HJe/tEoXX79mpvc5
         XfFXMHxkIr0ayTyTfYBWHFNgzZdQwitKleN8o9PLSi5LFBGQ8sVjineMYrvDcTX+oPpa
         cwPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h27si6001533qvb.78.2018.10.11.08.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 08:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAdHj-0006fl-7I
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 11:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAdHP-0006W8-1k
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAdHN-00031C-J7
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:53:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAdHN-0002sY-77
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:53:37 -0400
Received: by mail-wm1-f68.google.com with SMTP id z204-v6so10029088wmc.5
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x0BkSTdeq9rP2gdAjXwek4ubYtG72LV5IvipbdsuhQA=;
	b=nKzmmVZ58ono81wnL3HlXUEKv6d8/zNvRa+mn9WQ409pZVDa94j1m6whCorQhu2R/X
	kwQds2nneW6VlzXDuFF9iPPZnZ4UbhSknmsm/kr2OHOqh5g+2tla+iSa7oz1fIBMQ0pT
	kNFGRjsp4qa2QkfTQyM4jkJA1vuj8lNlA74rrikPKkwrahqdBeaSw25ZG3C1hlMHdoYL
	7T7rXtxCRW7nQ9gWkoC4jnzF1wpGB4Tj+lmByAL5cJhhSm0f0C1L01w4EyVayWgxCsPp
	a5lSPJJ38UrAAZW9bWxlJVNRBlao3i3D2c76vaKIBFNj+iyvM8BHmDTo4TTRTbsl1Edg
	Disg==
X-Gm-Message-State: ABuFfojxO/F3DLm/Gffe4eQu1xP9KagN5xyqkrDsmwFV1w7glcTbgkKY
	KgwwmCCQpJQ4Ify4+drcb5NPgQ==
X-Received: by 2002:a1c:9947:: with SMTP id
	b68-v6mr2117608wme.22.1539273205470; 
	Thu, 11 Oct 2018 08:53:25 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	o7-v6sm15941785wma.17.2018.10.11.08.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 08:53:24 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
	<7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
	<4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
	<8d285029-2b6f-a841-2489-c6761e62c02c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f670390d-7409-1989-6ed3-7b31d64e583d@redhat.com>
Date: Thu, 11 Oct 2018 17:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <8d285029-2b6f-a841-2489-c6761e62c02c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	"open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>, Zhang Chen <zhangckid@gmail.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
	Michael Walle <michael@walle.cc>, "open list:sPAPR" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QoQLC2Z0fUjr

On 11/10/2018 17:34, Paolo Bonzini wrote:
> On 11/10/2018 17:24, Philippe Mathieu-Daudé wrote:
>>> On the other hand, fd_chr_read_poll is not an IOCanReadHandler, and this
>>> patch therefore probably doesn't compile?
>> It does compile.
>>
>> fd_chr_update_read_handler() uses fd_chr_read_poll with io_add_watch_poll():
>>
>> GSource *io_add_watch_poll(Chardev *chr,
>>                         QIOChannel *ioc,
>>                         IOCanReadHandler *fd_can_read,
>>                         QIOChannelFunc fd_read,
>>                         gpointer user_data,
>>                         GMainContext *context);
> 
> Oh, that's somewhat weird.  It could just as well return a bool.
> 
> However, this made me notice that you need to change e.g. s->max_size's
> declaration (in include/chardev/char-fd.h) from int to size_t, and
> likewise for: 1) all users of s->max_size, such as len in fd_chr_read;
> 2) all the similar variables in other char backends.
> 
> So it's probably best to structure the series as follows:
> 
> 1) change fd_can_read from IOCanReadHandler to a GSourceFunc (which
> returns a boolean value), changing all "return s->foo" to "return s->foo
>> 0;".  Then you can remove the > 0 from
> 
>     bool now_active = iwp->fd_can_read(iwp->opaque) > 0;
> 
> (Having the > 0 repeated in all backends is now a bit ugly, but there
> are future cleanup opportunities here to move the qemu_chr_be_can_write
> call to qemu_chr_be_can_write; this way most chardev backends can skip
> defining a read_poll function.  But I digress).
> 
> 2) assert in qemu_chr_be_can_write that the returned value is >= 0
> 
> 3) for each backend, change the assigned variable from int to size_t
> 
> 4) now the rest of your patch, touching all front-ends.  The assertion
> from (2) now does not make sense anymore, since ->can_read returns an
> unsigned value, but perhaps you can keep a "fail-safe" assertion that
> (ssize_t)returned_value >= 0 to catch undesired overflows.

OK! thanks for sorting this :)
