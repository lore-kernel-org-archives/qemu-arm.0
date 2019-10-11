Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp529987wrm;
        Fri, 11 Oct 2019 01:19:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVqgCeQorl4WlTAFWejIFvN0A9t+uPNr91MujMnMw7F5yoY+mipS836LUd/iUAooIdgvcs
X-Received: by 2002:a17:907:20c5:: with SMTP id qq5mr12425962ejb.96.1570781943036;
        Fri, 11 Oct 2019 01:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570781943; cv=none;
        d=google.com; s=arc-20160816;
        b=sO9WeZfSk0OAc8VJGvNqD64LSdgczlvsCTBS9+RMYoowC6tIyIHmfo8t0xpr87FQa1
         EVs2kZ8Mg35Sud0NVB/n9q7iHFHSu1w0zidn8JLUtYkquEZrEsBixzvr2fpkxMma+k7A
         SbmJkKnTYxq/v3AVGnvSYiN7XgyJin4LQEfcDR0iCY7/HiFJWB96wCWQAFg7kz17G6/X
         qZ73ZDNQZuwXHO+HsJI3mM3qdcOWECgWz3h6WIg/vlyygyaAX7hkW4oeIpwuhzxOt4xb
         C9EFWMnGJ2V4BNVCvzfZVTQGRKxX87D3Ao38hmY+pMoO4PGXcCynkh+0LUpzUWu9PvJN
         j5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=1jV/mODnn2DVH9KFxtojSvl+p43Aps7LrdTlKd/bW9s=;
        b=Cx/hF1C1Uh1kjidVO585BiuXAOJ8ebMmXDlrTLUzPSPw3Mkdd5ekmgSgljB6IKoDoA
         evtBQlPnPhAu4foA80lGTM1aQZH/ewT3KzHiKm5KK4P2rrOHKc7RB3f+Y1mkZLxzTxMc
         5LoQr2uSfo8jzXZ3osn08kiQWGqe/EKKTeE94VL8yabE2lhohSAbM8YqL4mjUju+8M0U
         ucJnw5FGbrbNzeJ7iTNXBhDDhi92Ung1MsRdRtkh97GA312FBuL5n55PtjccQ7IQCcLG
         q0jvWpFygehR++vesdn4QL9qmBDG7WugtdGL+DPtNXgFHE6bSnKRwF+M5WCRWMoVk7Eq
         pPlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H+ic4bi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si4861280ejd.32.2019.10.11.01.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 01:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H+ic4bi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIq8b-0003ZA-4T
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 04:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iIq85-0003Xp-CY
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 04:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iIq81-00085K-0g
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 04:18:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59107
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iIq80-00083r-Oh
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 04:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570781902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=1jV/mODnn2DVH9KFxtojSvl+p43Aps7LrdTlKd/bW9s=;
 b=H+ic4bi19ie1qnXuF9E8NyIuBWa+lSwxPWSV09ymKhEPbKn5HuRcnYVz4l61Xk9VuiBY7D
 K0RIBZz2c3MTUUmk8gXiV8XCNrJ1uqZVHlMoRxgOLdziY455/y/6+51XPgQR5WIKMCt9MT
 p/hc4IY3FsQFi0vvIgwS5FBwT098Gwo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-yEZOd-dBNl-siOdw4Th6Ng-1; Fri, 11 Oct 2019 04:18:21 -0400
Received: by mail-wr1-f69.google.com with SMTP id n3so4018883wrt.9
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 01:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nGQHkZKxs0mrU0xBIY0tI2iUOB1oBvE192TbOdN7jT8=;
 b=G0fCBEw0yb7Mh1UmRbpuPY5w4IP089vcfZ9Z3DRLTbQisrOmcvrVCqWHPtSwYcnSjz
 5OEyfdXZnIDsx8wPebeGrmfOTACnIm5hXZqMcOMNad2RjE/BMA6KNP+hKWLuXynxPJLS
 UPMYQdm5GUgb/8vPmXtNnsBy56F5pZggZ7/dOPyBPq1PC2er3zplt0Q22LWjZ6IRFa1x
 zEUvvp4MlKLfVm6AfvBEyCsdtzwIGWso1YYdGGuYozS8DGxZwK3wLIaoKWIxaCJMZ5av
 QdQzOfqwD8632B2Flaz9j3XcXIjEg148ZshsRjDjuQQqMQWja4c3DReoYLEqgAF6XC4X
 zppg==
X-Gm-Message-State: APjAAAVXnidcHoXKNd8KcLBA3k719dzDVUf17L4DW3rr8IqdkLWosWnz
 dmMS91+DL4RjzczTc0rT7p5E/iR+yIP1VU3gwn0498q3RmJ0jcr+P4Ui68GWJkpiS1k5ZpQVSRR
 cdfnJ10skQZNC
X-Received: by 2002:adf:dd4c:: with SMTP id u12mr12379799wrm.170.1570781900549; 
 Fri, 11 Oct 2019 01:18:20 -0700 (PDT)
X-Received: by 2002:adf:dd4c:: with SMTP id u12mr12379777wrm.170.1570781900229; 
 Fri, 11 Oct 2019 01:18:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ddc7:c53c:581a:7f3e?
 ([2001:b07:6468:f312:ddc7:c53c:581a:7f3e])
 by smtp.gmail.com with ESMTPSA id e6sm8527217wre.29.2019.10.11.01.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2019 01:18:19 -0700 (PDT)
Subject: Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible issues
To: Jan Glauber <jglauber@marvell.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
 <6dd73749-49b0-0fbc-b9bb-44c3736642b8@redhat.com>
 <20191007144432.GA29958@xps13.dannf>
 <065a52a9-5bb0-1259-6c73-41af60e0a05d@redhat.com> <20191009080220.GA2905@hc>
 <d5367b2a-84ee-1211-a2dc-7d631c94fe3f@redhat.com> <20191011060518.GA6920@hc>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <966c119d-aa76-2149-108f-867aebd772f7@redhat.com>
Date: Fri, 11 Oct 2019 10:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011060518.GA6920@hc>
Content-Language: en-US
X-MC-Unique: yEZOd-dBNl-siOdw4Th6Ng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 lizhengui <lizhengui@huawei.com>, dann frazier <dann.frazier@canonical.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Bug 1805256 <1805256@bugs.launchpad.net>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /WuBDj33p+b2

On 11/10/19 08:05, Jan Glauber wrote:
> On Wed, Oct 09, 2019 at 11:15:04AM +0200, Paolo Bonzini wrote:
>>> ...but if I bump notify_me size to uint64_t the issue goes away.
>>
>> Ouch. :)  Is this with or without my patch(es)?

You didn't answer this question.

>> Also, what if you just add a dummy uint32_t after notify_me?
>=20
> With the dummy the testcase also runs fine for 500 iterations.

You might be lucky and causing list_lock to be in another cache line.
What if you add __attribute__((aligned(16)) to notify_me (and keep the
dummy)?

Paolo

> Dann, can you try if this works on the Hi1620 too?

