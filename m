Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp658235wrp;
        Wed, 2 Oct 2019 02:45:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfkChhZ4grNSfjwJXz0jglQ8Jbn7YikogaOAa7WJYdYUBeIhplcOQ0zjlAGr3KNaDFazsa
X-Received: by 2002:a37:4286:: with SMTP id p128mr2891862qka.40.1570009545387;
        Wed, 02 Oct 2019 02:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570009545; cv=none;
        d=google.com; s=arc-20160816;
        b=itI0ZNKb+0IljmQS8KRRW2H7oCcH7RF7wyJtQNeuJuVFn8/0LLGQ2FzSO1lBpqkWJa
         La6m1AyBLiwT7J+4r59OclSX/k/ZJlWLlVmJqCqJoFqwj+J2jyHr+s9JPPJCHtL6SI2p
         d5TST33fmg826cFoQaLctxEUOTdnh01oq0tubddMQZMZ4ZxhN64r5y8LBe0AIOl+/n3v
         sde4tYpQ84aovGSQ2mP4YXpf1uVXjyx0g7mRlOtJsRnFdJgu0ASQyneRMVGHCTM6ysAZ
         d7KUbIoEYlY0PR5V0a9o/NHUKxO64oaKDryAJVQD03P+RDsP8ued4cJhESgm+yaBV6IA
         JNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=HwHarkphA9D+jIDPSZKU/4gQsD7vDw8YlYviK82k0hw=;
        b=EnmtWWxX4NQGzC6C4HSzw7qNasvBKY1DqK0fc9xdJ0uhpohLTOIdVlJDIpmb2hPwUK
         QApVK84sD0s3EKkyh9IvbsBUi1/ebSjTXg81kq2LG+NsD6eJHcpwLaRIPv4meesU+vkw
         VnKRJFnFGgEipsmFl98ZUUW/vMGx1anfib24ouW11ccYrOfy3XsMTPHDVdm8V9Mpb0hX
         O0fLgTtX412ESv6G/77w5c9ZibpTJnXIiWSd7CiBMCdf4Nsl6oKeYn7I9ek2JcWE7mPy
         hdqzkL8bjdN/gw8q1aWpUXfC7kgZ14NrUwiJODfT7XhoWIhBxyMXPJmkmU/LM+aN+AQL
         sIzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T+JIeHgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si17541957qvh.67.2019.10.02.02.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 02:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T+JIeHgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFbCa-0005Dm-MZ
	for alex.bennee@linaro.org; Wed, 02 Oct 2019 05:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iFbCJ-0005Aa-FH
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 05:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iFbCH-0002cP-DH
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 05:45:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32144
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iFbCH-0002c8-0V
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 05:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570009524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=HwHarkphA9D+jIDPSZKU/4gQsD7vDw8YlYviK82k0hw=;
 b=T+JIeHgzEXkjqrWXhZ9NDUP4VfldfVE1uJ9QhmBnwWxm6VIZJmLoQ6aTmDio1Wp0zNZDMQ
 3iaJY1IlRgFfaB8UnGc3FQxCycpmLYa6VsMIaqoj1l1+YTRvo3rUVv49AZmINzpsYkCwrx
 EZiWmKJcxBi/+2kNOs+bmGevNpQOfNc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-vSBMrnD1NWmuqiXvcXv7BA-1; Wed, 02 Oct 2019 05:45:22 -0400
Received: by mail-wr1-f71.google.com with SMTP id i10so7236208wrb.20
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2019 02:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lg9JQP45K8oT6LUd1iuA45DVuRH8rq68PBEPgDP9zmw=;
 b=rAVQYwyDiY+lwe3DBOXY2g3Fj2OVtK5K2CGmhNBfGo+BxmoLr5YnwDYrpBR0qMpGGK
 R41JU3HofCcizm/BLhJsCykrqwBavW6m0R3k/O9qRmgSz986xXJjbKRti7SxHWikQauN
 oc3QYEe/K6I4Dl+2fB8yJOql3zqv1GFHMZ1r3q+wExqKQpc9NgfdAhFx9f40ccsS5Tzs
 CCxlfDh+qfrZaTiSxlGzT/QewRrgtyypilM0UGNQYK1KU8JQoUG6LBSFoHrwxMILoTKu
 GutEFvxDBNLLLYE56MMtcSU8Yi8kLPJYEH+fH8XdFSzqdo8eW2ORRuRJYZ2ox9hoiCSK
 g2Yw==
X-Gm-Message-State: APjAAAU8ik63tmfDr/kZbsC2bo9y+UkAIWvD9mU9568Tr3LWfdfogBNe
 NHijg42wTJhN4WOHMTtLhGFQ9aL0ykWgvaBZ8MFxUn9KJFHNC1fIY/Z8mhYNcIaVBddZaG2TwQu
 go58BWDxG+aFi
X-Received: by 2002:a1c:c78f:: with SMTP id x137mr2262382wmf.42.1570009521455; 
 Wed, 02 Oct 2019 02:45:21 -0700 (PDT)
X-Received: by 2002:a1c:c78f:: with SMTP id x137mr2262359wmf.42.1570009521174; 
 Wed, 02 Oct 2019 02:45:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dd94:29a5:6c08:c3b5?
 ([2001:b07:6468:f312:dd94:29a5:6c08:c3b5])
 by smtp.gmail.com with ESMTPSA id u83sm6687745wme.0.2019.10.02.02.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 02:45:20 -0700 (PDT)
Subject: Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible issues
To: Jan Glauber <jglauber@marvell.com>,
 dann frazier <dann.frazier@canonical.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ed5c4522-9250-e403-c55d-d3dbcda82540@redhat.com>
Date: Wed, 2 Oct 2019 11:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002092253.GA3857@hc>
Content-Language: en-US
X-MC-Unique: vSBMrnD1NWmuqiXvcXv7BA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>, lizhengui <lizhengui@huawei.com>,
 Bug 1805256 <1805256@bugs.launchpad.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xwk5b4W8q2Aw

On 02/10/19 11:23, Jan Glauber wrote:
> I've tried to verify me theory with this patch and didn't run into the
> issue for ~500 iterations (usually I would trigger the issue ~20 iteratio=
ns).

Awesome!  That would be a compiler bug though, as atomic_add and atomic_sub
are defined as sequentially consistent:

#define atomic_add(ptr, n) ((void) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_=
CST))
#define atomic_sub(ptr, n) ((void) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_=
CST))

What compiler are you using and what distro?  Can you compile util/aio-posi=
x.c
with "-fdump-rtl-all -fdump-tree-all", zip the boatload of debugging files =
and
send them my way?

Thanks,

Paolo

