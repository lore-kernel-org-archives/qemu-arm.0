Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1868959ejy;
        Tue, 20 Sep 2022 08:39:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xogc4yYeIOQt2zUYpRM9lDK8dYlI7aR53q5eQ+NWif8e5eaUK/r+U/y2WsKZCicxZqm8C
X-Received: by 2002:a81:984b:0:b0:345:f5:8fa4 with SMTP id p72-20020a81984b000000b0034500f58fa4mr20098544ywg.186.1663688346280;
        Tue, 20 Sep 2022 08:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663688346; cv=none;
        d=google.com; s=arc-20160816;
        b=J7AtuwL68jT5vlp6t3zCJuG18oBcSwxPV8lNZJCEm//63Fnq4AxeloqKq+uLw5J02d
         zz/6cpB628eHOvA82E7vJ6vdc+9oWg63o1d0aScHwlYj9qh0Vi1bDN9O+uTfOkDyjDSr
         urQ7qTittSa9zr/9Gtg2mVgFlZSlS3ybf0xrke1RS6G2ElMwcr6hfNF3a65NkRnXSIX9
         k6kTpAE2F5sm9V0epQo3Oq1u7yV9XMdsOeolj1cubI650Mn8sgTuURKJmX3hefyFa/g+
         YBm2rRVkR/sz1SvnUJ8m38H0IcZ/sx3R84alntxem3AblU1dky1JbHvD+wus2+3/zOnf
         Pk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature:sender:precedence:errors-to:list-subscribe:list-help
         :list-post:list-unsubscribe:list-id;
        bh=DxUS2wc8S5XxDbYIITAjbCY/K9B97p0z/uIdsCi89f4=;
        b=owQLsOmVj1h+q8DyLifYfi6z3ExUZPDS28Bm8+n7GA6o2jaY02tXOPMryt/nkBPqTQ
         DmN+RvpPkuiTOtKuq54rNbqyfxJVk/G2uJPfKMPIvAS0/JZK4L2op2dxoOJ4pu2w+fRS
         km2EcIB75a3DhcGYlri/RQDr4WmQoE2BvWgI5EgrOY29BLunHogAcp6a/unWyFnVRuMR
         s4CtuTXsek/OPwAdks3manLYF4q58nZMN2QHH/gRlfYVWg6vPA4fvNQ06IMmHjhsZ2lv
         m4QlwE5lvBE6t6oXgdjmNJVis6IondzlSxaeXUssMp5rhWyyTH8f/bxJNJZAtKvW9i+u
         VgWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=q8dDxxpd;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id b188-20020a2534c5000000b006b48d7b9ba7si49139yba.706.2022.09.20.08.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=q8dDxxpd;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from list by lists.xenproject.org with outflank-mailman.409508.652475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oafJP-0003WS-QM; Tue, 20 Sep 2022 15:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409508.652475; Tue, 20 Sep 2022 15:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oafJP-0003WL-Nd; Tue, 20 Sep 2022 15:37:27 +0000
Received: by outflank-mailman (input) for mailman id 409508;
 Tue, 20 Sep 2022 15:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+PG=ZX=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1oafJO-0003TC-7N
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 15:37:26 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f92ac71-38fa-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 17:37:25 +0200 (CEST)
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oafGv-000Afu-Ct; Tue, 20 Sep 2022 16:34:53 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1f92ac71-38fa-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DxUS2wc8S5XxDbYIITAjbCY/K9B97p0z/uIdsCi89f4=; b=q8dDxxpdwWDpHEVedTNp99huTl
	ieOauNOwBFfYBDnKcDBqCHjuV4ahcE1blChUCvnn1ld2RsCLwnoBIq1ubUWjGD1XG+OipNXhMHYV3
	A5UVDUPeFztTSqKs6X7P+cnq84CeGwoY32GoPxxVEEcm4T6W++H/W2qq+IUbg08VbaPZn2PpQhA6G
	bLj5usr33B5oFZ1w1pzMsxXoWw5TqXPu+p5QK2QdWpGZxnhsfad6mIAO4emRZahrJpZli75qhfkPZ
	JidI8Md/95Pa4BTPf6Cssb8yEiTDu6oS0+mepXs9cZhYwKX0GB+Wh3jWanOFKnNugdGBTJ2negqZ5
	kQ5zkM8I3F09Yqn2tNuiF62sq4HjlfBTtNVHH/wu5YepzmsU+yGEiv75Er59M/E1rO+t7vI3zdHhL
	K6EOXVatICRAGXSZ2pXGTOtCsdntXKmTpLa28j5QBqhUoCSVwaSj/dnxqdkPzCQwQsRXyL4b13OSS
	pTWzfSYUZ3XA1cZjpzVW7U3+3jDQGahsb6BDRM7yMzynJF79hN3JliPwomVGl3TlmAF9ZXbgB6v8x
	EdBv3RhbS9nnzMB0fMo8v8PRvu4ZQAqDHvVlI+IWDk4CDXNVEIO08YEfWVoJ8mVf99CP1R3I6tydJ
	Gl7iS5zTOghPdk9mRJyFsq8Jqasp4a0Y+B74kjNoY=;
Message-ID: <49325e7d-5020-23f7-4bce-c53d8d988c95@ilande.co.uk>
Date: Tue, 20 Sep 2022 16:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Bandan Das
 <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Alexander Bulekov <alxndr@bu.edu>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <CAFEAcA8GjXFO4WK=KybgSc8rMfqecwD9EXS0kZMKtqogNf1Tsg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA8GjXFO4WK=KybgSc8rMfqecwD9EXS0kZMKtqogNf1Tsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 0/9] Deprecate sysbus_get_default() and
 get_system_memory() et. al
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: rkCj+UzexNaP

On 20/09/2022 10:55, Peter Maydell wrote:

> On Tue, 20 Sept 2022 at 00:18, Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> In address-spaces.h it can be read that get_system_memory() and
>> get_system_io() are temporary interfaces which "should only be used temporarily
>> until a proper bus interface is available". This statement certainly extends to
>> the address_space_memory and address_space_io singletons.
> 
> This is a long standing "we never really completed a cleanup"...
> 
>> This series attempts
>> to stop further proliferation of their use by turning TYPE_SYSTEM_BUS into an
>> object-oriented, "proper bus interface" inspired by PCIBus.
>>
>> While at it, also the main_system_bus singleton is turned into an attribute of
>> MachineState. Together, this resolves five singletons in total, making the
>> ownership relations much more obvious which helps comprehension.
> 
> ...but I don't think this is the direction we want to go.
> Overall the reason that the "system memory" and "system IO"
> singletons are weird is that in theory they should not be necessary
> at all -- board code should create devices and map them into an
> entirely arbitrary MemoryRegion or set of MemoryRegions corresponding
> to address space(s) for the CPU and for DMA-capable devices. But we
> keep them around because
>   (a) there is a ton of legacy code that assumes there's only one
>       address space in the system and this is it
>   (b) when modelling the kind of board where there really is only
>       one address space, having the 'system memory' global makes
>       the APIs for creating and connecting devices a lot simpler
> 
> Retaining the whole-system singleton but shoving it into MachineState
> doesn't really change much, IMHO.
> 
> More generally, sysbus is rather weird because it isn't really a
> bus. Every device in the system of TYPE_SYS_BUS_DEVICE is "on"
> the unique TYPE_SYSTEM_BUS bus, but that doesn't mean they're
> all in the same address space or that in real hardware they'd
> all be on the same bus. sysbus has essentially degraded into a
> hack for having devices get reset. I really really need to make
> some time to have another look at reset handling. If we get that
> right then I think it's probably possible to collapse the few
> things TYPE_SYS_BUS_DEVICE does that TYPE_DEVICE does not down
> into TYPE_DEVICE and get rid of sysbus altogether...

Following on from one of the discussion points from Alex's KVM Forum BoF session: I 
think longer term what we need to aim for is for QEMU machines to define their own 
address spaces, and then bind those address spaces containing memory-mapped devices 
to one or more CPUs.

Once this in place, as Peter notes above it just remains to solve the reset problem 
and then it becomes possible to eliminate sysbus altogether as everything else can 
already be managed by qdev/QOM.


ATB,

Mark.
