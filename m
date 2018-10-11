Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2651992wrt;
        Thu, 11 Oct 2018 08:24:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60G3oGvw3FuD4HtPcgyB2pR5C9H/7o+1KKii0SBisUsc3YGY2XviHakt10pQA2jNF7ez+us
X-Received: by 2002:ac8:2e11:: with SMTP id r17-v6mr2035068qta.12.1539271467955;
        Thu, 11 Oct 2018 08:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539271467; cv=none;
        d=google.com; s=arc-20160816;
        b=lCrWhUM2+TUC14Cf6oiQ2qCJmj9OG+xc4Us7gGvaxWORpBo2+oVwRd3k17OgeqAXTt
         ONkOEEr4rimAvcGjgJyctkzcNRCFhE+DfFP8qA8B2oJRcN6azKDEx98w/4YeeNg+FvG2
         Pf1gr2xph5nsfdJUixVVEOPaaNHrZcXwmhEriVxhWv3MGxiS2G50H47lqtighAnLPI84
         2MiMlTfVomYdvSniR/yP/CLw1RUrI4lHPCHRQn2/fGR+UghSRrgaCYiCRhnzb+YubWpi
         JdzR1SAxGczMaX0QEQKGdwAtQr+qqjsUMlrNABSX0ufZvX7nFNgGJTNf/6wS8Dvr4/L7
         dZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=GhZp7qIyyzbvFwWEFTvOfOXcpSLNRZCAErhrQKiMIg8=;
        b=BWMk/7wdtWJ1vENPykoBqPIBmDdqRBc6J/1mJIm6qVjydWhb0Az7g53ZwLpDpSGSV5
         bWmyKlGz9iMTW/DCGwvqo98BTbHs+7kpNcybAysdFN8dD8t4eZhjcjMxrDUXpkMK4Nup
         Ytmd+Bhv7V51Ly/Nkt9Qc5WjbL7+3AnnxgNNXQcPKwP0vcQnt3CG1XY8fOY1ZTlesDIo
         3T9IYwRevAWF3SJMc9fKSEfk7PeJRs4dyzKYljf/bWu7iTcpS0NYxNsjyppbB2zBH4o9
         ypqsWWOUzEmvTtqnubMw5GmfoqDxiTFcQ8InMy+hZAv0WrUX2ecLf8dde1Sh1pfCcHUn
         oc9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v78-v6si2539281qkg.90.2018.10.11.08.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 08:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAcp8-0003n8-Qm
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 11:24:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAcou-0003l3-6Q
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAcoq-0001nT-Uu
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:24:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAcoq-0001mw-Ma
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:24:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id w5-v6so10177121wrt.2
	for <qemu-arm@nongnu.org>; Thu, 11 Oct 2018 08:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GhZp7qIyyzbvFwWEFTvOfOXcpSLNRZCAErhrQKiMIg8=;
	b=oHYzyIdMBkcVUX54cYoGhcCqrUSdyK1zT5CeZV0aUbazMkjFqlaP56KMnZ4RmilxEy
	Ii/1nf7y17K0+VC2koOOLeGdblVKXXMv24I4pGd0bwBjfwB9m5SzjUdSwKnNdLP3XfTE
	AHfF5tlLfyqyLWvJc8G1qjY9bPKvsCCHiTn64+z0CDiilGivZeK3cyA1hS/frhMnc9qZ
	4L01MSzQyJNOrUvHCsNt8sh19wmyKS8X7FFNkjxKLBgNkZAn067uTSaQQ+XV9NuSoTXA
	gEVeOHzTBQe2BuSi4H7DWnTu4j4SIt7nIbhWOACDd+4i6SGG5u1T4ObbgRat3rSn9HuT
	AW1w==
X-Gm-Message-State: ABuFfogDRH1V+IpujfW/TJyE7q6x95YOpINOYPfVe6ap/hruhknC5Nfz
	5c9sC3T0iNE/6HNj/ntGEVyt9A==
X-Received: by 2002:adf:f346:: with SMTP id e6-v6mr1916814wrp.49.1539271447645;
	Thu, 11 Oct 2018 08:24:07 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	t194-v6sm26034812wmd.48.2018.10.11.08.24.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 08:24:06 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
	<7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
Date: Thu, 11 Oct 2018 17:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
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
X-TUID: A+V9HVYKU9ht

On 11/10/2018 17:14, Paolo Bonzini wrote:
> On 11/10/2018 15:14, Philippe Mathieu-Daudé wrote:
>> The number of bytes can not be negative nor zero.
>>
>> Fixed 2 format string:
>> - hw/char/spapr_vty.c
>> - hw/usb/ccid-card-passthru.c
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> See: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02212.html
> 
> Not that easy; you need to adjust qemu_chr_be_can_write,
> qemu_chr_be_write_impl, qemu_chr_be_write (which is where the callbacks
> are invoked).

OK.

> On the other hand, fd_chr_read_poll is not an IOCanReadHandler, and this
> patch therefore probably doesn't compile?

It does compile.

fd_chr_update_read_handler() uses fd_chr_read_poll with io_add_watch_poll():

GSource *io_add_watch_poll(Chardev *chr,
                        QIOChannel *ioc,
                        IOCanReadHandler *fd_can_read,
                        QIOChannelFunc fd_read,
                        gpointer user_data,
                        GMainContext *context);
