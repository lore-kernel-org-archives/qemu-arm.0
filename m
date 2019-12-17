Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6268687lff;
        Tue, 17 Dec 2019 08:50:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxbJVmS4nf49llxkuwqbMxM6HyPm3h6qHrmfUQrsWDmkYyhFJjc12JUaikoVrbOoYTkEm/
X-Received: by 2002:aa7:c2d3:: with SMTP id m19mr6240517edp.136.1576601444549;
        Tue, 17 Dec 2019 08:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576601444; cv=none;
        d=google.com; s=arc-20160816;
        b=zq1N+smPTsRnAKkhdiUcc06XVTdFbRN3kiNaZPL/MiOyqtMDzNtBXZ3nVMjOA8sdCx
         aE/v0N/aLTGAAggE3jTOSjC+MjBv7V0sKzqppFK5ZpG5Ou5qhfgLzM76NI93IlpX+yuL
         KkGwj0mYs4tzOoxNZ2pDPjDwUWT6AixWLwUixg9v/E2IccSOEFbwN+n2gkeRLQFVaqxp
         N/pJl0lfMB3atUZAa01IBemlsFWI+HXM2A/zErIsjAhDjqcwJjYI+DVLh3oLAaTKjIkA
         rKrbwypBypkwx8Q1YkqsX9nAKkqSIkkNz8Hc7VCXO1w3LZ1FHPMgZgwCeYF71boSfl7D
         KBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Hxi4TFPUAhXySks0MDg1YAzEzstwrloAcjIJSqHZj1U=;
        b=NjUeYl6G6Y2nl3WbTrot3himCOmF3IqHZPgqQyFTT2oL0QQy4FKgfHDT7PQ5baGOyI
         nudGWAZy/WgSLJceo80vvjmq1v/1F+i34qdp/ficoD5SOgViZY/f1UbTBOiTcUGSJLLB
         q9OKTf9KgWWYe4f0brJc6qf88YauiR/SyOhz3zO21RsvidB+3wS2CzH0m/jRZ3a1MU8c
         xFqaCRvZwa1JgQ5EA4blvLIsDVBKPg04KplWIvkNM9GAVKxcM4g1OJSfQyX7JxEFk12z
         MeLdgQd3nGXdnuN6VaF978TqP0kqIObkg+uPL2JISus53vcDj7nE9w9Bpmk5QxBA3nmK
         rNtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNcPD3er;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k8si16034313ejb.13.2019.12.17.08.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XNcPD3er;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576601443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hxi4TFPUAhXySks0MDg1YAzEzstwrloAcjIJSqHZj1U=;
	b=XNcPD3erCJ2pmg2N3rgG5QJrwu0bulGZqdXzv8una6NNhXrnwJwOtXjaZVj/iNoZLzJ1gI
	jibt//3mUsKmVCclpB+sLIFooXU8PUUJA2YHY07jKH3e2Sm35u3WA0Ij87JcOZ6vEgXSLw
	ITR49mt3vhBvv3ABxVYdSoumV5QcqOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-AqKb79UINzCizyGOdjZtxQ-1; Tue, 17 Dec 2019 11:50:41 -0500
Received: by mail-wm1-f70.google.com with SMTP id n17so598473wmk.1
        for <alex.bennee@linaro.org>; Tue, 17 Dec 2019 08:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aQejgbF//N7qVjT/SefZZofdV97veJrrkximXLqTP+A=;
        b=O/Kigr7UCy1LUgkbxfltHr8DJc+NovIeuaSL/kaEpG2JEadrIcNBaeDmzaayBGvQQQ
         7Kxq21FSC9KR8FJSVLL4DDeRm5sr44+NsOxlBJ935PfwLomAejRWtJQ7ui3sI5AT9lch
         xKO/lukEd5m9hh8fSlCxNhHXzzGRZf2ZvTEIN/qG1t1+l4gudQnU2/BNrrAU57Quxbx4
         QBGaxLEy6JK9PiC/97lx8jgcRD2/iIsFKIZjOeVGVvGdXZl9s8Q2SKPIJN0ME/9i/6Fk
         2YN3eLEEvZiwxZ2HVXIPUOdwtRKk+FZTzEA9WzNWgnLQHD/hcSHYUCyXQwzNM6x0/nPo
         ncag==
X-Gm-Message-State: APjAAAVht4MHJP7mD6TMByBff+8B5K2oxIaidTSno+HRTNzi90Z1cBEy
	wViKadqlmXJEPqsfEvJ9wb341+Vmey6GaygkfSGXQxkkEwDizq96R02iPeWYMYI8XdXpB0udot/
	Oxi7o5pqRIaaXIAb0
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr40284784wrr.74.1576601440836;
        Tue, 17 Dec 2019 08:50:40 -0800 (PST)
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr40284727wrr.74.1576601440590;
        Tue, 17 Dec 2019 08:50:40 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.34])
        by smtp.gmail.com with ESMTPSA id s1sm3636122wmc.23.2019.12.17.08.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:50:39 -0800 (PST)
Subject: Re: [PATCH 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler
 typedef
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabien Chouteau
 <chouteau@adacore.com>, Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 Max Reitz <mreitz@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alberto Garcia <berto@igalia.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <huth@tuxfamily.org>
References: <20191217163808.20068-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <154a68ee-c683-d5c5-dad8-df483aa00c20@redhat.com>
Date: Tue, 17 Dec 2019 17:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: AqKb79UINzCizyGOdjZtxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: PAAL6ZNghfbc

On 12/17/19 5:37 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> After this chat on #qemu IRC:
> 13:20 <stsquad> so what is the difference between a IOReadHandler and IOE=
ventHandler?
> 13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
> 13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
> 13:27 <f4bug> see QEMUChrEvent for IOEventHandler
>=20
> I thought it might be a good opportunity to make the IOEventHandler
> typedef meaning more obvious, by using the QEMUChrEvent enum.
>=20
> To be able to build I had to explicit a 'default' case when frontends
> use a switch(event) case and do not handle all events.
>=20
> Then I used a coccinelle spatch to change the various IOEventHandler.
> I don't think the last patch can be split, but suggestions are welcome!
>=20
> Regards,
>=20
> Phil.
>=20
> PD: I use git-publish. To avoid spamming too much, I'm using per-patch
> Cc tag, after the '---' separator. This way each recipient should get
> the cover and the specific patches of interests, + the last one.
>=20
> Sent with: 'git publish --suppress-cc=3Dcccmd'

While 'git-publish --verbose' show it was adding recipient from the tags:
(mbox) Adding cc: ...
(mbox) Adding cc: ...

It still sent each patch to everybody from the cover:
Server:
MAIL FROM:
RCPT TO: ...
RCPT TO: ...

Maybe the list was cached in the tag and I should have use the=20
--override-cc flag too:

   --override-cc     Ignore any profile or saved CC emails

I apologize for the no-relevant patches I spammed you with :(

> Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Fabien Chouteau <chouteau@adacore.com>
> Cc: KONRAD Frederic <frederic.konrad@adacore.com>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Alberto Garcia <berto@igalia.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Paul Burton <pburton@wavecomp.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Zhang Chen <chen.zhang@intel.com>
> Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-riscv@nongnu.org
