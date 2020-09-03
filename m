Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp542858lfc;
        Thu, 3 Sep 2020 06:39:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE8u79KZRo64eSuJeRzD5EqNlXcnzS3n7Ph3E9wDscZNVy69dnL4iXFbcjuOR2M+5dbvil
X-Received: by 2002:a25:3416:: with SMTP id b22mr2431239yba.361.1599140366940;
        Thu, 03 Sep 2020 06:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599140366; cv=none;
        d=google.com; s=arc-20160816;
        b=YvHK1I5XxYdnESbsOwR9OyIixTQ2u7/BWVyJmNqu+LAMIyvwl7SG07rDz0VnEBADAO
         5sP1OpFFwGh+oV4VlXvxNmLbq0wq3j+UPD1hdONeYBtyi4jvRhbqz7q65SSLVqm/vRq5
         y3CMvN71iZh187oIl0+OtHmJ4I7kbGgv77AjNcZ2A3eXAKeBlJAGryNGUMynrMD5UqvO
         +q7vn24doIafO+mFfkUZV4yDXnTsnCJYCjEviezw1Cooak5TAyfXyJeeiMt3BTYisn97
         y7qpAIV6tCkqrJIFUbMMrvJGViQ7YMWx1taTAPcbc+4soQayuwmMY6lhoXRpYdsAqgCL
         BIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:date:message-id
         :from:references:to:subject:dkim-signature;
        bh=dRJBfQeCMDwTlzmw0J5lUyZe8gzXnGtoqkpN7lbM33E=;
        b=HTaKmeKqCj3w3MaYhGhbrRV8AkPUCjjPgq81iI8Q3HsJtPHs/yuhVtABlH+8v36Phy
         U6TOyseNeuFLx7WAhuxx+zh1BwMLIY0q3oNwpw9ABGWTH7IlwLlok9ZYFvDnNq9AdmZt
         /EcfSS4xwMnz+WuF4CcmadB3w9xQO7QME+awuE86BnzM5qoocgcpedLAhY+7Y8chpXaA
         FkLRL3L9OsSV7F83HiKigVSv7ifO0aOIr7xFRcLuqGUmkHKV2j3W/e65cyeoxQOaX5rs
         3clt89KYnYYfT6hZl6KsvoOvM0hFB376+WMfYyMVmb44b2fUOmsHx1y2JUMoIrWhj96N
         tNrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AmDd+WO9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a84si3170887ybg.103.2020.09.03.06.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 06:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AmDd+WO9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDpSY-0002MF-9K
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 09:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kDpQw-0000fB-RR
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:37:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21186
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kDpQu-0000Di-Vw
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 09:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599140263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRJBfQeCMDwTlzmw0J5lUyZe8gzXnGtoqkpN7lbM33E=;
 b=AmDd+WO9KdlngN77s96k0o0l5S574oIrOXxsYL99WxAMyGEpjW7JcFlRyfUisVQYmzdiIz
 RK+JNHRLqyLrmqDWTvjypim6O1Pd/cIBIYi4oeKU3Hqq4oIzlMxpmkD88i+ZbWbz6NjlS8
 ZCJxRkARZOPvgmL/ZeHs0YUuk/9rtfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-sI0d2f7gMU2TA-9Y4eApdQ-1; Thu, 03 Sep 2020 09:37:41 -0400
X-MC-Unique: sI0d2f7gMU2TA-9Y4eApdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD8EB8014D9;
 Thu,  3 Sep 2020 13:37:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-168.ams2.redhat.com
 [10.36.112.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 821F07E405;
 Thu,  3 Sep 2020 13:37:07 +0000 (UTC)
Subject: Re: [RFC PATCH 00/12] hw: Forbid DMA write accesses to MMIO regions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200903110831.353476-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <658fdd16-33da-af3a-6d8d-f7ea1253f061@redhat.com>
Date: Thu, 3 Sep 2020 15:37:06 +0200
MIME-Version: 1.0
In-Reply-To: <20200903110831.353476-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <rth@twiddle.net>, Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z//DoLadFrWh

Hi Phil,

On 09/03/20 13:08, Philippe Mathieu-Daudé wrote:
> Hi,
>
> I'm not suppose to work on this but I couldn't sleep so kept
> wondering about this problem the whole night and eventually
> woke up to write this quickly, so comments are scarce, sorry.
>
> The first part is obvious anyway, simply pass MemTxAttrs argument.
>
> The main patch is:
> "exec/memattrs: Introduce MemTxAttrs::direct_access field".
> This way we can restrict accesses to ROM/RAM by setting the
> 'direct_access' field. Illegal accesses return MEMTX_BUS_ERROR.
>
> Next patch restrict PCI DMA accesses by setting the direct_access
> field.
>
> Finally we add an assertion for any DMA write access to indirect
> memory to kill a class of bug recently found by Alexander while
> fuzzing.

I've briefly checked LP#1886362 and LP#1888606, and as much as I
understand them, they seem tricky. It's not clear how we can recognize
long chains of DMA-to-MMIO transfers, and interrupt them.

Peter mentions an approach at the end of
<https://bugs.launchpad.net/qemu/+bug/1886362/comments/5> that I believe
to understand, but -- according to him -- it seems too much work. And,
I'm not too familiar with the qemu memory model, so I don't have
comments on your solution.

Maybe we can have some kind of "depth counter" for such
recursive DMA-to-MMIO calls (even across multiple device models), and
put an artificial limit on them, such as 5 or 10. This could be
controlled on the QEMU command line perhaps?

I don't think such chains work unto arbitrary depths on physical
hardware either.

Sorry that I don't have any sensible comments here. I hope I didn't
misunderstand the problem at least.

Laszlo

