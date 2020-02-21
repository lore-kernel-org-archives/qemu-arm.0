Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1803463lfg;
        Fri, 21 Feb 2020 05:26:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXDk3amUm6O4zdI0tab4F3EzZvHLC8lkKPoqQ+Grke7bT+626Eox4L6iQT89LlP8ta3npv
X-Received: by 2002:a37:e317:: with SMTP id y23mr33131167qki.431.1582291562781;
        Fri, 21 Feb 2020 05:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582291562; cv=none;
        d=google.com; s=arc-20160816;
        b=UYsPAI0VN3u2OHbzsIYwwychxusKz8+ngNXfA/cLmNIHD5JAT1wgTnzidLpqeruXzM
         s38zIeyKA1SBnWrXZNg2m0ymS3HMf9zW5Jbj/mi3FY1HETwQ/fzHqeS0YWMIe3UebAkF
         QJaonS9bjXaD++xElPitOngdi8KsW2UnavYuOQe4dzJgGY5+Nq2Cj2J13lZV01JhLtch
         him9W8cBEWVMgjd2ce1+oyw+bCX2eyUvrNI+U7HpmkQEaJWyrwuvDEbFJAE6AU8Kh3Tb
         JhaCwXG3HD6Et85r+WCdR1DvqyczPyjdmfvygZsVJH6xM53jIvT30PaRusRAwCa/TYKw
         H9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NQbeFl2hhSMamiHGGFNVxXXEEsK3mfH7N2oov1RSkp0=;
        b=AOQfo5N4IbmYyQFAk3wFbxzRw1bx/bF32lm+X5sCWqOwuv4inVRTxWwShjbVHMZYsp
         1Z7qcZa0xjZEx0LiYm71GOImgN70lcvGDerrttHlubOTpWUbE9Cgh1IMMIfg85iIhOJH
         3lAGup8IFajTBuRD34gIKS1xkFqo8BUIXyVPtB6CYkXSo09Q1axSu+2aepkwpTWnIAxs
         v/S9G9MOgKwQMuvHQCJh6t6QmckOvlq/2DDsIcXE6+zSy+65WE6HrNCKc1H/3lUkbyHm
         fE++fMUqYTC5GFQJvuvODktp9Zi7ctgdUa/MEKs7CiTC3OZJyzMvX2RArs/ma0aOeYzg
         uh0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MjoKaU8F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ej6si1310162qvb.147.2020.02.21.05.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 05:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MjoKaU8F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j58Je-0001Yp-6n
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 08:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j583m-0001iD-8G
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:09:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j583l-0005e2-2s
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:09:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55527
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j583k-0005al-Tr
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582290576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQbeFl2hhSMamiHGGFNVxXXEEsK3mfH7N2oov1RSkp0=;
 b=MjoKaU8FawsKwOXJhlGjaOZePb0VyQ8k6O9r5UK/CX7+972+RXksBLBkUUyKiW7Otl0mwa
 R5UBCLshkbnj8Q78R3oHTt9PR9fl1c4kuewZ8oQ7vvHPa8zkwT8AchwDI0dfeHvzYiC/Fy
 XV9e3xhKP1mRxrg3CNjnEk+nP9C0IY4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-4Ahbd55cNHea0wv39p8oug-1; Fri, 21 Feb 2020 08:09:35 -0500
X-MC-Unique: 4Ahbd55cNHea0wv39p8oug-1
Received: by mail-wr1-f69.google.com with SMTP id l1so1009797wrt.4
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 05:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NQbeFl2hhSMamiHGGFNVxXXEEsK3mfH7N2oov1RSkp0=;
 b=nsXKXh69IdRRUqZTPYA+5szeeHWa67XyxffaAk50zprUYVpvtr8t9+O9JS1YqrSupY
 90xHdFBRXdUf9ujGWUoxGW4i6BHrIsdVrq4CZKzHkHOdxHPwRL6Od4N/ewh/KaQpgViu
 b9Kvgv6OcHZnN+vcDxJIbvLFnwVlT5bJ2rBfuutQCmPgzlub8K4Uw8CWg8CTy07zljLJ
 BqXYtM0umb9ZNE51H6S0OAel9hPbN2Aws0v6MQLxuq+buIARPClIZCPtkihwUG/+4rQI
 vAMIfed9bqDb9xLpB8tmahp3bdqiDF916+kPKS47ZVJxsJlZ060vcacWoZxm3oWsqiJX
 CelQ==
X-Gm-Message-State: APjAAAWiZ4jcN8B264Aoy+twWX0ioAAX9YO9lbe7Ho0ZizGmDEljlFQR
 w6RdRUbcSC4isOU342uDNteNMTENYhiaBfa/Xt8AALZieSkQBXKrYPRxxiZq76318x49r5eqln9
 uxlR1be3cIEkbHCA=
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr3984732wmg.151.1582290573770; 
 Fri, 21 Feb 2020 05:09:33 -0800 (PST)
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr3984701wmg.151.1582290573474; 
 Fri, 21 Feb 2020 05:09:33 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
 by smtp.gmail.com with ESMTPSA id r7sm1704369wmh.45.2020.02.21.05.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 05:09:32 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
 <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fe7f3a60-5d90-ea3c-44d1-119f8b45b15c@redhat.com>
Date: Fri, 21 Feb 2020 14:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: poUcE4a9lIs7

On 21/02/20 13:44, Peter Maydell wrote:
> On Fri, 21 Feb 2020 at 11:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 21/02/20 11:21, Peter Maydell wrote:
>>> Before you do that, I would suggest investigating:
>>>  * is this a problem we've already had on x86 and that there is a
>>>    standard solution for
>> Disconnected sockets always lose data (see tcp_chr_write in
>> chardev/char-socket.c).
>>
>> For connected sockets, 8250 does at most 4 retries (each retry is
>> triggered by POLLOUT|POLLHUP).  After these four retries the output
>> chardev is considered broken, just like in Gavin's patch, and only a
>> reset will restart the output.
>>
>>>  * should this be applicable to more than just the socket chardev?
>>>    What's special about the socket chardev?
>>
>> For 8250 there's no difference between socket and everything else.
> 
> Interesting, I didn't know our 8250 emulation had this
> retry-and-drop-data logic. Is it feasible to put it into
> the chardev layer instead, so that every serial device
> can get it without having to manually implement it?

Yes, it should be possible.  But I must say I'm not sure why it exists
at all.  Maybe it should be dropped instead.  Instead, we should make
sure that after POLLHUP (the socket is disconnected) data is dropped.
Then, having retries triggered by repeated POLLOUT should not matter
very much.

Paolo

