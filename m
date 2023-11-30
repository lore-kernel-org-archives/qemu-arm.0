Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp34452ejb;
        Wed, 29 Nov 2023 23:18:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4hg2yXTW1tY51w6rkRzAwuOb0FwAQJYovcu5BxljkzZ/CqiJPC0TUWehKMYbcc+T3gcWT
X-Received: by 2002:ac5:c7c3:0:b0:4b2:960d:d9b4 with SMTP id e3-20020ac5c7c3000000b004b2960dd9b4mr3098351vkn.1.1701328683956;
        Wed, 29 Nov 2023 23:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701328683; cv=none;
        d=google.com; s=arc-20160816;
        b=mACFf1AnYKGtkUSWEYm2lbfhKJ8OJugdDAVz/kH9/P/BBFg4f1wTrNu+MAMDJ8wfTT
         paSjvaA9gPA3L3vZaZ51HX3m0C6db52PVMl4gn/J3mI2GyaxH75R3cZ/kto9DaAHKsKE
         FiVY2Fm9lp37eulWwVyanXrUrPs0SKMEoaKgylUd2u/cqztQ3rnz9j8PV4kpr9f/LuNN
         vU8FAj+mNnGx537DFt/OXxW2Bu8Z1MMW0a7hRQA3uGKdIgPQAVuAYaGFUP6f0qVjCF7N
         Oc6GjAqsM0eqhSmHufy7+OHLF0HrTdr8RkQ94sQXHfQfz5umasDB7EhkpiYJpzSq82qJ
         YwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=2p1/yCCqE7V/A9ix7GiHFBqyRKKVluWD2OXS34K6s/4=;
        fh=WgoSm14IW75gvpUx5RxZbWQ0I6GLX3YCUm1/f3vzI2w=;
        b=j1XYasnXpy3pUodkwEBbjlM/3qt3xv/VS0YLgmH5X4JN7E5S7kgpTYXBIt+RjwEAOm
         ryqsi9jY1otUK10cOmuKLWxKMXy6yZ5W35qDmTlnpXiHhUPa3IIjTpzRJdUi9bUvd38f
         54KMrK0fFiGzHnyFLJMn9vtbk1vtV8aPqr3f2Pg19shD+L3LnBEUNton9UyhwAKQR0ts
         asAq6aTzGc4Q+XEE2O52wliWUEV0l5CtbNQcoM063MVa/03Iodp6LZPXAxgGwMoXx1Vp
         Upt19TYHGGkcfYh0ljbmJgxvWlO2KR4VomGUVpAN0mayKCc6FCWw8gqW7tdr76DRdp7l
         S9Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSIXV831;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id df10-20020a05622a0eca00b0042395ddd29dsi482192qtb.761.2023.11.29.23.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:18:03 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSIXV831;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701328683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2p1/yCCqE7V/A9ix7GiHFBqyRKKVluWD2OXS34K6s/4=;
	b=GSIXV831uxaXHpruBNyqBb/s15vlMX3lUSDF72n8zCWgtxoC9o2VQAbN69DWOQ2PjDxpr3
	RO1GOF2Q2o1rpmFjAHLuCS2lxYn4RHx2HNup4NADrRYwTD6Csf/VI/9AjrKZ0SCIVDXiMk
	E9HUPItz9sT/c6KBk3vrWzexKIjTzlM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-faJQaflrONWae7UjryOpGg-1; Thu, 30 Nov 2023 02:17:58 -0500
X-MC-Unique: faJQaflrONWae7UjryOpGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF742811001;
	Thu, 30 Nov 2023 07:17:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D59D40C6EB9;
	Thu, 30 Nov 2023 07:17:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 90DFA21E6A1F; Thu, 30 Nov 2023 08:17:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Jean-Christophe Dubois <jcd@tribudubois.net>,
  Fabiano Rosas <farosas@suse.de>,  qemu-s390x@nongnu.org,  Song Gao
 <gaosong@loongson.cn>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Thomas Huth <thuth@redhat.com>,  Hyman Huang <yong.huang@smartx.com>,
  Marcelo Tosatti <mtosatti@redhat.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Andrey Smirnov <andrew.smirnov@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Artyom Tarasenko <atar4qemu@gmail.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Max Filippov
 <jcmvbkbc@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,  Paul
 Durrant <paul@xen.org>,  Jagannathan Raman <jag.raman@oracle.com>,  Juan
 Quintela <quintela@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  qemu-arm@nongnu.org,  Jason Wang <jasowang@redhat.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,  =?utf-8?Q?Marc-An?=
 =?utf-8?Q?dr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
  Daniel Henrique Barboza <danielhb413@gmail.com>,  Elena Ufimtseva
 <elena.ufimtseva@oracle.com>,  Aurelien Jarno <aurelien@aurel32.net>,
  Hailiang Zhang <zhanghailiang@xfusion.com>,  Roman Bolshakov
 <rbolshakov@ddn.com>,  Huacai Chen <chenhuacai@kernel.org>,  Fam Zheng
 <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  Jiri Slaby
 <jslaby@suse.cz>,  Alexander Graf <agraf@csgraf.de>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Weiwei Li <liwei1518@gmail.com>,  Eric
 Farman <farman@linux.ibm.com>,  Stafford Horne <shorne@gmail.com>,  David
 Hildenbrand <david@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
  Reinoud Zandijk <reinoud@netbsd.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Cameron Esfahani <dirty@apple.com>,
  xen-devel@lists.xenproject.org,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  qemu-riscv@nongnu.org,  Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,  John Snow <jsnow@redhat.com>,  Sunil
 Muthuswamy <sunilmut@microsoft.com>,  Michael Roth <michael.roth@amd.com>,
  David Gibson <david@gibson.dropbear.id.au>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,  Bin
 Meng <bin.meng@windriver.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  kvm@vger.kernel.org,  qemu-block@nongnu.org,
  Halil Pasic <pasic@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,
  Anthony Perard <anthony.perard@citrix.com>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Eduardo
 Habkost <eduardo@habkost.net>,  Paolo Bonzini <pbonzini@redhat.com>,
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>,  qemu-ppc@nongnu.org,  Philippe =?utf-8?Q?Mathieu-?=
 =?utf-8?Q?Daud=C3=A9?=
 <philmd@linaro.org>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>,  Leonardo Bras
 <leobras@redhat.com>,  Nicholas Piggin <npiggin@gmail.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 6/6] Rename "QEMU global mutex" to "BQL" in comments and
 docs
References: <20231129212625.1051502-1-stefanha@redhat.com>
	<20231129212625.1051502-7-stefanha@redhat.com>
Date: Thu, 30 Nov 2023 08:17:54 +0100
In-Reply-To: <20231129212625.1051502-7-stefanha@redhat.com> (Stefan Hajnoczi's
	message of "Wed, 29 Nov 2023 16:26:25 -0500")
Message-ID: <874jh3g15p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: WmjVBf1YzazD

Stefan Hajnoczi <stefanha@redhat.com> writes:

> The term "QEMU global mutex" is identical to the more widely used Big
> QEMU Lock ("BQL"). Update the code comments and documentation to use
> "BQL" instead of "QEMU global mutex".
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

For QAPI
Acked-by: Markus Armbruster <armbru@redhat.com>
