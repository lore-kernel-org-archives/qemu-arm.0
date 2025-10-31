Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0218CCF9FE
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Oct 2025 14:24:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEq33-0006Mr-0p; Fri, 31 Oct 2025 10:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEq32-0006MB-4B
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 10:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vEq2q-00072u-2Y
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 10:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761920632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8NsndKxi9wjfiwiNCzQ0sDwvjij+/0YwRPZVMGXiAQ=;
 b=YAHqVDl+iZSv7GYhnlzNRSP0/byHBvTEPYtuhgCn4DKAtJxAWYYku9gO0uAPl20N1chnJl
 q/ftF13jk2e6L2QfbFqW2dQ4QdzmsQoLSoYbSdx6ctHBOwISewpr9v1QEP7CmY2auZAiWN
 qjVDqd2L5kV/MU8pNRIU8zOGiRfKWqo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-xLCN_8d6MKSJMpA79HfDgA-1; Fri, 31 Oct 2025 10:23:51 -0400
X-MC-Unique: xLCN_8d6MKSJMpA79HfDgA-1
X-Mimecast-MFC-AGG-ID: xLCN_8d6MKSJMpA79HfDgA_1761920630
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477113a50fcso18164565e9.1
 for <qemu-arm@nongnu.org>; Fri, 31 Oct 2025 07:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920630; x=1762525430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8NsndKxi9wjfiwiNCzQ0sDwvjij+/0YwRPZVMGXiAQ=;
 b=m7uINbTv9VquSYz2Mu/0EQd9eZMt+31S0jfKD1v6b/80DYrKKagg5BGMESyD8Z876a
 iQE2+/ewr0KTQZpqmLgK82QQqdLSHTTGZ9jBvH9CXLkz2yL2LWSG+HoCz8TAJlB1MEUX
 FojfxJqhhXAeyuJnHNu5AqNOTJw18az5bxhkLf1ORKZa87jjl1Ku/EpDp10LCUc3XgLC
 oGLIrmVsldTBSMPFZKmSMvn5tj2IHGUjKlcrbVPHqB+F8YdOMzsH4FtVugCwLfLhqI/p
 bTUpIhvBrtAb7TVc4WFrDD/Kx66ZQwU2yaRYTfY5+M/X9f+hOzOS3vCO8pEPwmGRbzND
 bLvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMEHInZ0nvQ//F0KOAUzC59aM3Rc8HAPvxxdflhVNGg2Lew0zoCqAvec5+7D4N1d+Jr1AIWTCwLQ==@nongnu.org
X-Gm-Message-State: AOJu0YxXyMP5O3Ux5MdFxL9rq43alp/Vy/3ZL9YMl9hQQZ1I5Z1p9uB9
 jhHkUlt7XLPhgVCIMXdeYpokw5YRNk/OBNp36lgM8DfiCOYKV5qo/YMKOwjfKKSwgGnhcgfermc
 BQ2G8f9gv9jbSv59LQUXydvsdP/qoi2Jju2WPLOmOWFPxpl9Hpa8lHg==
X-Gm-Gg: ASbGncvQrTE6se1NvreDwo3BNnuVJwr2aJld9h3GjALSj4+HDtQJOuzY0lOAwC0R1QK
 EFxhHbYWp9gPhZ3ursh4oOSLCvqmwGWvSYiIOl2Hg7ars8x5/VZwmxPDLG0icxxCmDN090rPpq0
 J1sxAElpu1If8+GheP0W6daKu2D6c0qjihS4UOphT5QeLEGOPmdQ3tYf+ET1JCZxjiK+35lXRz8
 Z7tGSnSt2BDeGPU3qMqxkq8raZxBR7Fbel2hq4mgWce081t9e5VgeNkP/I2rnhWlLyhIorxfzbb
 tZZYEVue/unpE4uA/gGt2m0W6HpBtjPH+RlAhGu/RjjHoolHZKsYMg3pU3rW3wpYzw==
X-Received: by 2002:a05:600c:c16a:b0:46f:b42e:e39e with SMTP id
 5b1f17b1804b1-477308c60aamr38306945e9.39.1761920629810; 
 Fri, 31 Oct 2025 07:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH73DZHEsR+mQzo+LpxpAHYqi6uaGXmBv0wFmteO6GGOwU3gZyA1bUah7DEckHfOtZkUbifcg==
X-Received: by 2002:a05:600c:c16a:b0:46f:b42e:e39e with SMTP id
 5b1f17b1804b1-477308c60aamr38306415e9.39.1761920629398; 
 Fri, 31 Oct 2025 07:23:49 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c2ed409sm664775e9.2.2025.10.31.07.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 07:23:48 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:23:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif
 <clement.mathieu--drif@eviden.com>, qemu-arm@nongnu.org, =?UTF-8?B?TWFy?=
 =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC
 machines
Message-ID: <20251031152345.65b2caed@fedora>
In-Reply-To: <aQTEKyQjqIIGtyP0@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20251031113344.7cb11540@imammedo-mac>
 <0942717b-214f-4e08-9e2a-6b87ded991c9@linaro.org>
 <aQTEKyQjqIIGtyP0@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NfWSGrGi73p4_uYaiTM38lyImxVMqA1zNvuO2Rg6CEo_1761920630
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 31 Oct 2025 22:14:03 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi Igor and Philippe,
>=20
> > On 31/10/25 11:33, Igor Mammedov wrote: =20
> > > On Thu,  8 May 2025 15:35:23 +0200
> > > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> > >=20
> > > Are you planning to resping it?
> > > (if yes, I can provide you with a fixed 2/27 patch that removes all l=
egacy cpu hp leftovers) =20
> >=20
> > Sorry, no, I already burned all the x86 credits I had for 2025 :S =20
>=20
> Don't say that, thanks for your efforts! :-)
>=20
> > Zhao kindly offered to help with respin :) =20
>=20
> I haven't forgotten about this. I also plan to help it move forward
> in the coming weeks.

in this case, I'll send reworked patch (not really tested)
as a reply 2/27 so you could incorporate it on respin.

=20
> Thanks,
> Zhao
>=20


