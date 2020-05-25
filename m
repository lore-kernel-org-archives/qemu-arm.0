Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1960047lfc;
        Mon, 25 May 2020 04:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsmOIW/c4m6ajkKpiYbbA2hs4BtgIZMZVFKAx2kk+iNlNcCHjujJBhlUBuzPBE3u1PvLEh
X-Received: by 2002:a25:e08d:: with SMTP id x135mr40480811ybg.360.1590407396853;
        Mon, 25 May 2020 04:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590407396; cv=none;
        d=google.com; s=arc-20160816;
        b=HnlY9gYmiCWah3aRc8jrZH4EoTL+s8TYhl49u8QaAbe8b8lxndyx6yEDz8DQDAP+xn
         9/s++amn3rdT0FIE3hYS5cKG1N7rQR8EbI2rX0nI0KxBe+nd0LM/Nfhy7Zhjte8UJpYH
         Uw+L1vHJpaWlMyn97PiB4poYwp2QcxIa6N+kioHroSssUB0a6F+4/dDp+7anbm0X0AhR
         dgckniBdjr6S2B6KvM/m4bxTpkayz+0lqfzJ0Ledq2LPFU8SkBKofRwrRWOg3AJQq+G6
         h6iE5Lk4tT/t9H7+KvgNJITNAIy6scq5+MmXnXmHvfBjRRHRsjkgNSrW4PnyGVhVusnw
         T4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=6BYumcl7n9u8rYMbfHj3az1YycQBHAt5cTavKp8F5g0=;
        b=InZE6TCDOpvhZ6YGvgWvHVUmAN+Bg22MrS/Im3P+esgNbIyukCK+mzfkCNEVu+QOl0
         Wcm7NhLP6T7m2LivCYuyo/E4igMNXNC78F1pxTn3WAvF3EfyfQOGh6wdS5W8/d1wT7l6
         PxWC2tDiTQ2+bX4d4fahcCfl1AZngslDa+Swg48lf5mJW0YnkwV/ruspDGoUB4mWOv/Y
         18TntzF3mie+FxCj+hzO27RI+FjPUSa28oZ9c8ezLnb0k7Bwg6v0/BXiFikudhHmdjxk
         pyyidBJrHY6wa7JQ0iH6D9TTHRS3zC0OCpkY5PB8Dxhj7hSeFZLN+OtrpovfpWjua92f
         AVHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K7IA0D26;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a96si15973609ybi.245.2020.05.25.04.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 04:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K7IA0D26;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdBcC-0004rM-8s
	for alex.bennee@linaro.org; Mon, 25 May 2020 07:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdBc2-0004r7-OC
 for qemu-arm@nongnu.org; Mon, 25 May 2020 07:49:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27925
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdBbv-00050p-Ti
 for qemu-arm@nongnu.org; Mon, 25 May 2020 07:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590407378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BYumcl7n9u8rYMbfHj3az1YycQBHAt5cTavKp8F5g0=;
 b=K7IA0D26Q4GFLFj/1SWnwBj09O2LxAjQgWYkIyslolDeasmEi2HAVaGVXnTuD0IrlOhX1g
 HkmtNCQBJx3rChUMYRZ0571QxLpJ0dE5aD9TKrnWQ0Le92HUEHvQiYPgsnloMBzlLxkacE
 LGcNjBY3l0ZtIZr50oeGLBGDo5XKuD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-TC_YNPe2MqSLrNOokT2ZyA-1; Mon, 25 May 2020 07:49:36 -0400
X-MC-Unique: TC_YNPe2MqSLrNOokT2ZyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 952CF8015CF;
 Mon, 25 May 2020 11:49:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D82385D9C5;
 Mon, 25 May 2020 11:49:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D516D1753B; Mon, 25 May 2020 13:49:28 +0200 (CEST)
Date: Mon, 25 May 2020 13:49:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 15/22] microvm: make virtio irq base runtime
 configurable
Message-ID: <20200525114928.lxfqu2uo5xfhtywx@sirius.home.kraxel.org>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-16-kraxel@redhat.com>
 <3e0451d7-5692-10b3-ac01-90128765643e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3e0451d7-5692-10b3-ac01-90128765643e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 06:55:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLAJyAiGByC/

  Hi,

> > -#define VIRTIO_IRQ_BASE       5

> > +    mms->virtio_irq_base = 8;
> 
> Hmm you made it runtime configurable indeed, but you also changed it from 5
> to 8. Worth a different patch, or at least mentioning in commit description.

Oops, that wasn't intentional.  I'll change it back to 5.

take care,
  Gerd

