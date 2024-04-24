Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp566532ejb;
        Wed, 24 Apr 2024 05:33:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2rurSndLyGIkbezZHBH19Ywi9xnUdzWGyAqhRqbKS8opl78Sa4jvoeb/9BUxnjfSBJ0gx0aM/rA6VXfYV4DHgplYGQ93E
X-Google-Smtp-Source: AGHT+IEQUVxHs9NQ3k3DjOXIbVGpajWLORTL9Ppnv+U8lBYuh9BZaNjH4PFt7+iE+7XUVIf6PMOb
X-Received: by 2002:ad4:55cd:0:b0:6a0:98c9:11ad with SMTP id bt13-20020ad455cd000000b006a098c911admr722662qvb.55.1713962009918;
        Wed, 24 Apr 2024 05:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713962009; cv=none;
        d=google.com; s=arc-20160816;
        b=Wt5tSLZB+L0RhkeyWaZBkm9cBp37oorAkJ7cIpFli2Xmb1ubwarxZaOzypurS7cZwN
         zctR01xhit4F3QMUEgvBYz7egQcCdLXI21vNKIETIasLW7E0KEBcg1eHJaVSUpL9CWPw
         CRjZgC/SBa9VFO5LdtIVnS/e7Xufsm6lRKx+qgvdcWMLO58G6GrtNOtk5iGmB2QA03r/
         ppz1tFD0UPYvnQXEgGnZIdIyJWnBedY5+f1My6qCeC9mEGWf9pSD0AlFWXlToCXqTs0y
         YY3qwR00iaVvoGR15Y8XE5dPtCOyKZaGpwwRnrQ4jm2p/dPoWwVyPLt8fmTZTZ7Gw3ZQ
         PPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :mime-version:date:message-id:dkim-signature;
        bh=BO2dltNyUZzTqGNvUX6tiYRrcsIZEsbNBSf77++6jk4=;
        fh=CajUykNCQEGUZ9AsTqCPwKBwpe5RkrGs4peptKZka/0=;
        b=CfU4THs4+b6Cqnz09v+TnKi7QQaleiiQon9uwwhWgExOnZ1ssRnkSCL8op8TuZxUFQ
         LI/a7DagPYnbAJNJzM59oW7H4cjll935dDHc7ckIoV1yZ0tZhmEMrnZcd4A9DSAcZ/fC
         gLd3hT90go9WK6iCMViikNr9ZcJn48bhq/4rnweihBbdIe+cmpTCvdwTAQNQmwZiu9wj
         2iCUYoEhaCV0kbOVmvq9VnHfUSLMyeiDB/1c5CVo+O91hYff03K5bJJjKV7etqpLH65r
         P37ZqCv+GBPmFE4oDOVP2A4EIZadkOjGBu1bHLWVgYz6AHDUA2R7VS0r57aV5Gf63cAk
         uPDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@posteo.de header.s=2017 header.b=ptv7qhbb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a0562140e4700b006a065260ff1si11764660qvc.443.2024.04.24.05.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 05:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@posteo.de header.s=2017 header.b=ptv7qhbb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzboK-0005Dg-HO; Wed, 24 Apr 2024 08:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@posteo.de>) id 1rzboI-0005Cq-7H
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 08:33:14 -0400
Received: from mout02.posteo.de ([185.67.36.66])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@posteo.de>) id 1rzboF-0003zA-MA
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 08:33:13 -0400
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 2AA99240109
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 14:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1713961988; bh=9Ev9618ma5vERQhBo1JV5P5yZ6fPuNrS0jsrcfWeBHU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
 Content-Transfer-Encoding:From;
 b=ptv7qhbbNkf//eI2Nh9He1fmIKvifrvkBbId62jUXUbHffLCiCgT2gC/UxCD40QJf
 S/csiDg+SiKUem4x+H9XEYjGhmVzrjVJItNNweoSQu88/HZdoxqMsLQB6zMCJEFflH
 nqgkUP+6VeQC0qXurWQazaL7sS6hLcvRhJebf1NLm7lE+yaxV/bFwVQXYIm16NmwoO
 Ua/ltPSIkQrhjQrfL1HGbCG9QVhXn1X/ZYhr/EomV4N6v9hUVEgWGcQy6EQ4jNAU68
 Y/hCZ/ePP9xAwMjuBu+1gd1+3t+8ormTy2IWarKJuy11QfazKZI2+br5yTFAHVgMau
 NC1DWjGe6L8Jw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VPdgC5dCpz6twh;
 Wed, 24 Apr 2024 14:32:55 +0200 (CEST)
Message-ID: <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
Date: Wed, 24 Apr 2024 12:32:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to qemu_new_nic()
To: Prasad Pandit <pj.pandit@yahoo.in>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
 <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
 <1497808863.2030924.1713955286878@mail.yahoo.com>
From: Thomas Huth <th.huth@posteo.de>
Content-Language: en-US
In-Reply-To: <1497808863.2030924.1713955286878@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.67.36.66; envelope-from=th.huth@posteo.de;
 helo=mout02.posteo.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: gcdH2mRX5Q3Q

On 24/04/2024 12.41, Prasad Pandit wrote:
> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe Mathieu-Daudé wrote:
>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>> device is engaging in I/O. The network device backend needs to update it
>>> when delivering a packet to a device.
>>>   
>>> In preparation for such a change, add MemReentrancyGuard * as a
>>> parameter of qemu_new_nic().
>>
>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>> any clue?
> 
> * CVE-2021-20255 bug: infinite recursion is pointing at a different fix patch.
>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
> 
> * And the this patch below has different issue tagged
>    -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>    Fixes: CVE-2023-3019
> 
> 
> * They look different, former is an infinite recursion issue and the latter is a use-after-free one.

I assume the eepro reentrancy issue has been fixed with:

  https://gitlab.com/qemu-project/qemu/-/issues/556
  i.e.:
  https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3

  HTH,
   Thomas


