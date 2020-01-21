Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1684518lfp;
        Tue, 21 Jan 2020 08:28:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzjAWHFUAHudJyVBAFcViVPV1Qbbp70YpUH4voQnfXhlGA2tgywmH/bJOLow0gx84zFDh0D
X-Received: by 2002:a17:906:4089:: with SMTP id u9mr5196452ejj.205.1579624101300;
        Tue, 21 Jan 2020 08:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579624101; cv=none;
        d=google.com; s=arc-20160816;
        b=aRP8IxPg03bYClF7hRpBNYxDioJ5EA2GB/zY0awp8PnnwWQb/sE65j0vnFy5b+dmkz
         JuN5j0Fzyc7qeWg0JzVsDvM0fRpUP/ls2iPENX2N1BpdLpFBQqLBMj0gYrdy3lnERIjM
         5B+JSY+FpkSYEHOPUJZ+neYvPC5Bi7o8ZiaknDehSqsRVGFxA2ZiHbKm8hgElgxOB84W
         jw8BjgsHKouFTQ5jZs1nKtbHZVDupALtz/e79JvzKoF3BRQyno8yyPR6QDe1uQ6+Drxh
         lGIxLfiVWBIelP+/54QlCIZCTX+D+SAS53rD5Nj98IujLLI6/5Tt+u7cef+t0aHFUizD
         bSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ObnXMVLixb7W8aUnHhyzGhIwT9m7etDtZMKzg1gq/R8=;
        b=b/6kw6URu3iuxDf6jiWKntVC2TtIM97L5+KTOBSB3Py92XbX8P9rSmY022jeDzRk8m
         kh1LpJPYku119ul+xihe+1+N4qdFCh6ZqZCRrqDkG1ddu7LcntWQvbPFceDw+IIV3bSh
         MHVDFpVHabko+OThT2etPTOCzEdLNLdja/08gsuBL+7Xu7TbOqrw04SP096BcLlJCwtd
         A+ekwpsEhgjcDw5HGNDG+8OgoLI4cN2bRxQtw2SOB2jKyS2UygeQaMrNEk1I+0MHpCFO
         IxZZPGksqPwlkUmVq2dfwrq8/JEBrPZ5mInFBbgtMRF705JEuP3J2JRXxgr71nmj3TSG
         E9CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bQGUC80c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si24352104eja.153.2020.01.21.08.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 08:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bQGUC80c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itwO4-0005wO-5k
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 11:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1itwN6-0004wG-Ps
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:27:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1itwN4-0002vd-A7
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:27:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22605
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1itwN4-0002vF-6L
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579624037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObnXMVLixb7W8aUnHhyzGhIwT9m7etDtZMKzg1gq/R8=;
 b=bQGUC80cXDxatKPtcQ9CM0bvzOR+8vzJhCxMsQuAmArrTlVf4/0TBuQMVlmqrBnBItYLPO
 bU+BeBrgp9QaboJeDCX4675FfT3jVdr3Hy+bnL/cducIaNGGcPSVuVog7UBXCyI6x5I/fu
 oBDu5dzevWzEBvv5GEJlSyn2gKsuZyM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-63d58APiMJKh9Khv7yd3qw-1; Tue, 21 Jan 2020 11:27:15 -0500
Received: by mail-wm1-f70.google.com with SMTP id o24so570788wmh.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 08:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HpDJDcVh0R2d5kNLvddhR3AlT9Puti21RBbZkMveJ6c=;
 b=HMPAvVe/Y4vAs8jRvcX069DOicYyKnEe+u/oGwY1jjJdelsKR/+Qbr4JRtobxDPhnz
 nBkNrArV3m9b4CnS0AwLrU1L83nPDey1E7e+1eepSj/y19b4hBttycWzZO5g2SrJR9Pv
 BBvn7zdEVFD9Z7AJgpBBJAEvZavZUwWXGWOqViS8iVA0w4sdEt56kWkoelOHbsDmPHiP
 OH+LSkyZHQuTFKjsLh6td82rMix8/P2iUy0JJVfKr6rXFcvV4ioF/2t1gTVOHXcjM0W8
 FYuyBB03qU1oqLg+k6TX/j/2ri+hgME07NEFUIQfgGoI21iLPjYJu30QmCEKxRzd7BH+
 m7nA==
X-Gm-Message-State: APjAAAVR4n0NQpKVW6UkEdW+jwxVaxft60tTwswI1n4LUGtMRYkkype2
 ZtekorpXGjRprn+3X6bYm2bJsbGCyBDToO8nkDeSEpBs2amSL6HgKfTOfyPpLQZMjONDDHqMAq7
 QuLO/UtW5So4SEAA=
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr5069387wmf.60.1579624033851; 
 Tue, 21 Jan 2020 08:27:13 -0800 (PST)
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr5069355wmf.60.1579624033557; 
 Tue, 21 Jan 2020 08:27:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b509:fc01:ee8a:ca8a?
 ([2001:b07:6468:f312:b509:fc01:ee8a:ca8a])
 by smtp.gmail.com with ESMTPSA id q3sm4337331wmj.38.2020.01.21.08.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:27:12 -0800 (PST)
Subject: Re: [PATCH v2 00/10] Cleanups around the 'current_machine' global
 variable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200121110349.25842-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <11145254-2dfe-a699-2f92-b11b287d7ab8@redhat.com>
Date: Tue, 21 Jan 2020 17:27:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 63d58APiMJKh9Khv7yd3qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +3TiskAOWoxJ

On 21/01/20 12:03, Philippe Mathieu-Daud=C3=A9 wrote:
> v1 was "Replace current_machine by qdev_get_machine()":
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg669611.html
>=20
> But Markus objected, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg670122.html
> and older discussion:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg611338.html
>=20
> This series salvage patches from v1, and add other trivial cleanups.
>=20
> Can the ARM/PPC/S390 patches could go via their own tree, and the
> rest via Paolo's 'misc' tree?

I think they're trivial enough so (with the exception of patch 7) I have
queued them.

Paolo

