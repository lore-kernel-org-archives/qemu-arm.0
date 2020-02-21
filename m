Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1699093lfg;
        Fri, 21 Feb 2020 03:44:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgv3ElkGIw36qRFDRatQeM5H8AA8zUg6+4t9d0fFDZ43IBGqAUR+lHms4HGXgHhJ3Wexh6
X-Received: by 2002:ac8:39c5:: with SMTP id v63mr4810922qte.134.1582285470254;
        Fri, 21 Feb 2020 03:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582285470; cv=none;
        d=google.com; s=arc-20160816;
        b=GIWX9GnsMixK2GP1u4rr/iKMYYtxDF4jlmo/f7nq2nKIMv/K8O1BbBPIca17fGuFQQ
         1I40g9VqfLczKOyzm/2PlqwwuwOQzA/n5OOVg6Vbh6TxuNa58bObEKDZYbvqhGnqkNOP
         uMFU2x2sZfp+ulDlnZXdoY26z4cn52uuB2rdwbWG6ZhslLFVIVGiw+5k0chq+MOR/key
         BLo7DYSzZ/jFeK6q1sKZ8Te9sLCE37qbBdXePDamSf65PxVGoyEJzF0B8t7E4/156ARg
         Iwtu4DcBPEHbbpu4GWsnG70ebU+NTxkqLWBfZQToCylNCuh82tYLFc+x/tAUtBmd8OcP
         zn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BrxS/WPLSZQoq/vG0r6Ye9JuHndQSvui9uLouqeXHn0=;
        b=JXOONgdRrK3On3wZPWcPrHILA9QerIDjx5CB8FAOPHp9RgrTHkqSn3jt2Olqx9yPEK
         TMRug3MCbM/jkG+paiK5mU8RuMxomqchBEVqLmXJERsSCI/pn9UAZnt7DkHkVVokFRG8
         Wra0fJvEe/AZiAPZTkGtWKdUUo8n93JQwQefuL8K0sZXDUj/kMQt2C+ew/So1CWPOehK
         lT3g+v1koi06etwEpwQM8g6ft+DcH/0Q3ceLUMNYw5IDKd4Or73uTxyiNL/rVBC+X97O
         ov6EuuWNvsOry6hXyBa+xFByITuKNH4t8SMsJAn0UtmsGEOuMeHDhfc/5NUaOUCH8SgP
         590A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MRKLprMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22si1190266qkh.11.2020.02.21.03.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 03:44:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MRKLprMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j56jN-0001zu-OO
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 06:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j56jH-0001zm-LO
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 06:44:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j56jG-00023w-Dr
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 06:44:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45839
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j56jG-00021t-8e
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 06:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582285461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrxS/WPLSZQoq/vG0r6Ye9JuHndQSvui9uLouqeXHn0=;
 b=MRKLprMeItt9A7TlrrPombPpSbiockDFy7XVEJJiBSICiE3d0ma3HxR2RghXqO0MNrZfe8
 UmcvAASnc6v3PqZRrOAHUIXu6fyYWSjFMSb5HDxcTguLG6vcEgELcCtey6IQ5OltpcR/dz
 Ie399NhSpf1ZqnUV6Qa2uUkpI5atJp0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-0QsBe8u-MvaSUF53U_2J4g-1; Fri, 21 Feb 2020 06:44:19 -0500
X-MC-Unique: 0QsBe8u-MvaSUF53U_2J4g-1
Received: by mail-wm1-f69.google.com with SMTP id b205so512542wmh.2
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 03:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BrxS/WPLSZQoq/vG0r6Ye9JuHndQSvui9uLouqeXHn0=;
 b=IHRMloqrdLWBbZnznHSmjNZfT/sz+s0qoOQY7+DzSkvdvOZu9Q3pBuNbUq+1nYyb+w
 pjZ/MVMvXzTNFvxEcjW41GkrFV55u7G6y9dJb6gQxpE4x0mMSpOXGe6tBJQlxw6Q5a/W
 DxNW7C2SevmFl1BmHbGM/WUpRLissZoa9+xMtxYAWUyZoJ3RCBxFp/D6AU0nWgfnXmK3
 qrA4DP3/g9BvB1NHYLZNT66JO3A47ZK1DA50D9JQAJ9N/bNDMSdG+OnWmeIG66COaJRQ
 Z+hmubj7g5AubKQn1qVCwVTYxhMnOoIMzAdlpiNpm2nbldmK3NxMOamdO7pI/A6GAHEq
 HCcw==
X-Gm-Message-State: APjAAAXT7L5aVh+/F7zA2CkQPWFO22RAvPI6W+9tihPb6fQ3JJOLT/4b
 /shj0wLfFA05uEOSnEXlARoEIhm/7y+OkSSJkBjsEXsO+HssHytUV5Aqmgwh2SUx9Q2ctOSNkmd
 fq5UdlUSXY72a
X-Received: by 2002:a05:600c:295d:: with SMTP id
 n29mr3313611wmd.101.1582285458443; 
 Fri, 21 Feb 2020 03:44:18 -0800 (PST)
X-Received: by 2002:a05:600c:295d:: with SMTP id
 n29mr3313587wmd.101.1582285458173; 
 Fri, 21 Feb 2020 03:44:18 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
 by smtp.gmail.com with ESMTPSA id b11sm3788650wrx.89.2020.02.21.03.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 03:44:17 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
Date: Fri, 21 Feb 2020 12:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 37YqQz1U4H+1

On 21/02/20 11:21, Peter Maydell wrote:
> Before you do that, I would suggest investigating:
>  * is this a problem we've already had on x86 and that there is a
>    standard solution for
Disconnected sockets always lose data (see tcp_chr_write in
chardev/char-socket.c).

For connected sockets, 8250 does at most 4 retries (each retry is
triggered by POLLOUT|POLLHUP).  After these four retries the output
chardev is considered broken, just like in Gavin's patch, and only a
reset will restart the output.

>  * should this be applicable to more than just the socket chardev?
>    What's special about the socket chardev?

For 8250 there's no difference between socket and everything else.

Paolo

> I've added the chardev backend maintainers to the cc list.

