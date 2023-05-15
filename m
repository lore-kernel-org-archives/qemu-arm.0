Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6395580ejq;
        Mon, 15 May 2023 03:04:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rJe9jrqC9K8RowEMz4oydca2gXVrcq0JG2R5h4dyAlmKMU4zavSKg9Vlpvb4/IfLxSXAa
X-Received: by 2002:a05:622a:164a:b0:3f5:16fd:c5a1 with SMTP id y10-20020a05622a164a00b003f516fdc5a1mr9840868qtj.10.1684145085199;
        Mon, 15 May 2023 03:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684145085; cv=none;
        d=google.com; s=arc-20160816;
        b=CfArQzrRvHGR08eQBoaV8BbwYAuEsCXH8q+V4nYDXgPkReqpFqCKUPvWuZmuM4yi6o
         C7TLwGKnffkCQzRQ0yTcmyojyoauRvADA0ZuoHsBS0jBpI7h/RM4+KRWGGHIGTPSMV/1
         sx3tFX1n4IROzJyzEM0Y0l/u13XF2ddqYpm0YQwtXdnbo2+2oD9r/aPnfOsH8yYatOOg
         BLLq1ctop7qSMbW4/wA0tcslRR6c7FKhHRvZbUdmnW1pPtcI5LBxZE0bueCV2ew4nk+m
         PgAZZjzcMdwbfUETRo/fvdH6p4QMKgc9tOmqQ+z6w16A1quqrAejySia1SIFFA/7nbIb
         Gsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ytu6mNbKiHMRjxb5/HCxd8UnrRmRjwtii8S1gvg+KXY=;
        b=pdyJFsTDZk+BBXv0oogwaRAADmiZ7xwhZ8ys/Cx24bWWQMhecDaaAgerYIyG3rXamm
         m1aFcwkOCDzWzRJe1KpgI+ErapHg4xNaNzAI/J7VGepYMooJQg+FFLPQGGOMBvBR88Xl
         HUZRk6oYEgvSBefc4ruCElXk7OPo3CBjm1F1Pp8RPDC7OzC9oeBd/7VU+S6XditOvMkZ
         34rXZxupk/dslC8MQNB6nj+1J7BpsZkxelbo6gN7pF1I2aasW0HPNuoEssFBPu8pPRAv
         7Ktmcnbw0oKbxNvzDe9/2SDHRim9XAmxRmK9nK7duiyciu5BKH2Wf2l2sevvFcpr1KET
         BIPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgIa2rQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a05622a021400b003ef3cea5b61si9056562qtx.764.2023.05.15.03.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 03:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgIa2rQX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyV49-0001BY-Le; Mon, 15 May 2023 06:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyV3y-00019G-TS
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyV3w-0000VL-Sz
 for qemu-arm@nongnu.org; Mon, 15 May 2023 06:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684145056;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ytu6mNbKiHMRjxb5/HCxd8UnrRmRjwtii8S1gvg+KXY=;
 b=MgIa2rQX4vP0F6nS/wUuLY4cp+R4zgYc5O/xRdCYkt6sed2WAqpGXI8Hu2HeSKpI2UsXGd
 M1uFHwpOo8YCRyKtTVjRI6/twbw6WOEdk5791b1tVTJxloLg94CRUpzvGe0kAxTbbr6Klk
 DKer+HesjHIPE/uzVY/e9TTW9LBNAMI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-6OUWgs3bN06D7NJZwwlGvQ-1; Mon, 15 May 2023 06:04:14 -0400
X-MC-Unique: 6OUWgs3bN06D7NJZwwlGvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0EF43814948;
 Mon, 15 May 2023 10:04:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D5B82166B26;
 Mon, 15 May 2023 10:03:55 +0000 (UTC)
Date: Mon, 15 May 2023 11:03:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
Message-ID: <ZGIDg+8xIOGpTIO4@redhat.com>
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
 <e2d06c7a6528a16b6ae58360d49a1fc9c7e8ade5.camel@kylinos.cn>
 <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8fN-+FUJapo=+ObZgfrJW32ccFj22qvU92ndNzPLQ9Dw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kSuB3SA82n2G

On Mon, May 15, 2023 at 10:59:16AM +0100, Peter Maydell wrote:
> On Mon, 15 May 2023 at 10:57, Hao Zeng <zenghao@kylinos.cn> wrote:
> >
> >
> > On Mon, 2023-05-15 at 09:52 +0100, Daniel P. Berrangé wrote:
> > > Overall, IMHO, we should keep QXL restricted to as few build
> > > scenarios
> > > as possible. Given the status of SPICE, possibly we'll even want to
> > > deprecate it on x86 eventually, not add it to more arches.
> > >
> > > What are you seeing as the compelling use case that requires QXL to
> > > exist on aarch64 ?
> 
> >    Thank you for your answer, it made me learn a lot. No use case, just
> > outside customer feedback on the ARM architecture qxl use has problems,
> > I compiled the community qemu, found that the default does not support
> > qxl display, so the submitted enablement.
> >   I agree with you, please ignore this commit.
> 
> I would still like to know why QXL isn't automatically
> enabled like every other PCI device...

Historical reasons ?  Originally both QXL and SPICE were x86 only and
SPICE was broken on big endian if you tried to build it. The orignal
QXL code in QEMU had a hard dependancy on SPICE until an enhancement
made it work with other backends.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

