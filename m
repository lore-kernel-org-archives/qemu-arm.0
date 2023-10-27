Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp861831ejb;
        Thu, 26 Oct 2023 22:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpcQkPuBcTWw8jEmB3tNz0fHYPHLGvzgEzY68hQJIhpW1wzjmw1gA/oDCRTz4/0MHpWknc
X-Received: by 2002:a25:d703:0:b0:da0:5c2e:1799 with SMTP id o3-20020a25d703000000b00da05c2e1799mr1577112ybg.19.1698384383553;
        Thu, 26 Oct 2023 22:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698384383; cv=none;
        d=google.com; s=arc-20160816;
        b=dLeWhGJRP64L+SsTG2SEZjSsTPu7ddIFzGWgO+oUXeOUpkWVo6H4O1FWAQwKrKPfit
         hvY0bdAtb9iFnwQN2KHUw0dNgIyjmtlsRwBSxrLHvnuORLp3pf4jVuYHs+OVdd/DhWZ9
         gsy6xAafodykzrQGNg5GxHZYcA4UvyP8xpv9eHepDN0fEmloEDRyVm2a05jpZQs+S/6B
         aqEXRPKigeampNFsi3A8DeKZ/Ka7C/7wWUWhRVj4HTOufyi+QN5IcU3sMopO/u404plA
         I2hPRNxU16JdnEG75RiVgKTlMYvBcNM6j6HdsEI+11DizMT+w53ax4/m0xXGscMOJvct
         aGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=5M6omcZ1++I5xXaxt2ZIw3e2GzEoErjFk0+NchsSNVM=;
        fh=ugDoWmK4Bg64XKGzfFI0Zizzjgs9LZdN5oE/Kz5ANK0=;
        b=AIOCkVNz3iMcSXfmfuFriT7r5RdrmkLoz92ZadPHRGxS7hIVmLBW2ZeXzvKWNn3+TN
         j6iZtS2xNVUpv5FfUnSu7iAJiYZMeV5CzRy9rP/7igF+wvL5oz+I2CkWnyZYUqTAOCGG
         NCBm0Qb7/bhUpWeJgUvVSrFEewe7Gsml/MYOWeUNtL5M85tSlg2tdyjVRjMVg/OimNgu
         i8rDDzgec4sGgpm7VaDoCkUVjlHTnFWvI9iClSqaVJHrwk6F1pZ2CQmVWMxYcLTxHYh8
         QFI/MensoGUI49YnqOLZNUa1hFp/WdQa4nCqtgchITtv5P2EHwi1P5cEwdK/museDQ1Z
         qkFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=IfX9KgEz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n189-20020a2540c6000000b00d9cb899c106si1374425yba.649.2023.10.26.22.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 22:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=IfX9KgEz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwFMJ-0008Dh-OX; Fri, 27 Oct 2023 01:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qwFMH-0008DH-3l; Fri, 27 Oct 2023 01:26:09 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qwFME-0004lE-Hg; Fri, 27 Oct 2023 01:26:08 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CD9EB20038;
 Fri, 27 Oct 2023 13:25:53 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1698384356;
 bh=5M6omcZ1++I5xXaxt2ZIw3e2GzEoErjFk0+NchsSNVM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=IfX9KgEzbKDHJ2TwdNAWtJuAoHfZdfqRf+7U8uer0dSK8lFyJ0kF9DiVcehxA4kZw
 v0Pzr8QHjRQjL8t8XFfaQN9c4v/TnDqdqrvwAu097MSkHzF2P1a0KMTaZ9WC0BQQrx
 2zA0bmLy4FP/N+Kf9MPIPiFJEk+y3AO6ZPVuOdeu718ozpvO6qdjgc2fzmQqvk+pTN
 ao4MFJVIlbOwQLzPZY3uEZSHbE0Y2Dj5kFp5gwxr6SZp20VX/ftrSI27ZyYmzxMYXS
 yWhgiGyDzo8yHXKna09AhlrheUp/AEEhGGJn8iHbqOpQJdEBJr/9Fkraji0wf+c4pu
 XivfHZFgY3YBg==
Message-ID: <6976919f53a8643d23903d05d3642083da5f9421.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 06/10] hw/fsi: Aspeed APB2OPB interface
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 joel@jms.id.au,  pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com,  thuth@redhat.com, philmd@linaro.org,
 lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 27 Oct 2023 15:55:47 +1030
In-Reply-To: <8269cf50-05d1-4f57-8fc8-0a074721a0df@linux.ibm.com>
References: <20231021211720.3571082-1-ninad@linux.ibm.com>
 <20231021211720.3571082-7-ninad@linux.ibm.com>
 <c1aace06-0eab-4805-b58d-e108b53158dc@kaod.org>
 <1b83521d-4885-490e-b8d7-1d760de5c173@linux.ibm.com>
 <58deedee-a291-4d73-a3f1-09ea16c953f0@kaod.org>
 <8269cf50-05d1-4f57-8fc8-0a074721a0df@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wvJWGEL0v8Kg

On Thu, 2023-10-26 at 10:27 -0500, Ninad Palsule wrote:
> Hello Cedric,
>=20
>=20
> On 10/24/23 10:21, C=C3=A9dric Le Goater wrote:
> > On 10/24/23 17:00, Ninad Palsule wrote:
> > > Hello Cedric,
> > >=20
> > > On 10/24/23 02:46, C=C3=A9dric Le Goater wrote:
> > > > and the fsi_opb_* routines are useless to me.
> > > We are trying to keep the separation between OPB implementation and=
=20
> > > interface hence we have all those fsi_opb_*. I feel that we should=
=20
> > > keep as it is so that future extensions will be easier. Please let me=
=20
> > > know.
> >=20
> > Well, I can't really tell because I don't know enough about FSI :/
> >=20
> > The models look fragile and I have spent already a lot of time trying
> > to untangle what they are trying to do. Please ask your teammates or
> > let's see in the next QEMU cycle.
>=20
> I have decided to go with the approach you suggested and it looks much=
=20
> better. Fixed it.

I intended to reply to this before Ninad sent out v7, but life
intervened.

If we can't justify it with the code we have now I think it's right to
pull it out. Add the code to support the things we're trying to do when
we need to do them. As long as we don't do anything that precludes us
from adding that code later (and I can't really imagine how we'd corner
ourselves like that).

We should bear in mind I wrote the initial models several years ago in
the space of about a week while I was trying to learn FSI (and more
deeply about the QEMU bus and address space modelling). I think I was
doing that to unblock some CI due to the introduction of the kernel
driver for the Aspeed FSI hardware. The models were pretty rough -
prior to all this review the code reflected my hazy understanding of
the problems. I didn't get time to remove the complexities introduced
by my misunderstandings, and now it's been so long that I'm not much
help with fixing them.

Andrew
