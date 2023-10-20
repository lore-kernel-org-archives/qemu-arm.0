Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1065404ejb;
        Fri, 20 Oct 2023 01:33:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+2ppU2QkWKlvsiaxRmSTMYZoHAgYHtlf7JIVuNC1vp2vcX9+S2yD/vEl/dJQ3xeJJhM/G
X-Received: by 2002:ac8:4e8c:0:b0:410:a2c4:d696 with SMTP id 12-20020ac84e8c000000b00410a2c4d696mr1222165qtp.35.1697790815374;
        Fri, 20 Oct 2023 01:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697790815; cv=none;
        d=google.com; s=arc-20160816;
        b=Q811hD+54jjxohVKvwBLoh3Eoc7k7GEA8ijliK5o3ZcFB7l0RT1upDaJJbNMRcuzlD
         Go4yHEWRv23NaXDfYJ/n8ia7rb+5ErgE5jnhxVFkQdzRoquHbUfcztzs8zZo9mINGf6j
         xjPcPjOGzFL1lmtgDrHZTmmytM5zGEMe33KlVe5T/IojbhgEuFWgZ72VA7IiywwkgkVi
         9+2s3mJCi4c3GOoCDfb4HLkZ0g00lLJmT9YhdNM5fPfudi9+rOYaNJL+m38nzOe8UfS6
         goemY6UeYf97FehFNIxcOijZjPBKN7AZ76AmO0WSP5Zx/FEf5DnHwmuNk7FbZi8vwFEJ
         QPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=6fpu/fAuK3pKdJMb1McE3nqogwVQveHzDFPZDMMtdpQ=;
        fh=I6+9dIR5WqHxPb/Jr8FBrs/9IvxCvbDsBgXvYlRWe2w=;
        b=dS/KhI37sWRXFSZCF/WS4qDiWLR0k76sZ522bP94mTMc7ujTjcE1RtHmWY1PW3Lxxz
         4YRxPvMqQpC806C5/YSFXndTBYD+esdyxkXvCt7q9yuVHccvkX2n2UhaJhuvhNdJGQsR
         mAGaNllMwCSAic+GWE/rYPjABRlxH7UTAdnoQ3Z11GZ7XO0eO2AKroOrntlM6WcqnmXU
         WpFv+vfw/16PZ6SnypjtSDFRvl9tnY7sqTwCWVLMeUVkQaItPWMHE5VIqTyrjzkTRVwt
         iOXH09RFOOXW4RkJfPy3QqpAEIm/4nXACHnMzerytvVfG412zDPALdMh/bBGIG0BOg3X
         s8SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WECj6KWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05622a164f00b0041822134c6asi920570qtj.158.2023.10.20.01.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 01:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WECj6KWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtkwi-0007nX-UW; Fri, 20 Oct 2023 04:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtkwh-0007md-2E
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 04:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtkwb-0002Ld-Cz
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 04:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697790798;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6fpu/fAuK3pKdJMb1McE3nqogwVQveHzDFPZDMMtdpQ=;
 b=WECj6KWwnJFmfZgGC6raPSpSCAjm+yQfnCCiYfZlO3HFTIhXFYaMO18prbM2ayZXizT1rK
 85UTlmZYt/lyEKvGmetV983/DCFaNzmmhla9u04YMQcJ+VP63k1vLIOzTnwA94YUQztlLh
 xZfJUI0LzqZx1rwDf+hWeWzF5UzIx4I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-tCQpP3LpMMy8gj-RKBbuzQ-1; Fri, 20 Oct 2023 04:33:17 -0400
X-MC-Unique: tCQpP3LpMMy8gj-RKBbuzQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so3322615e9.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 01:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697790796; x=1698395596;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fpu/fAuK3pKdJMb1McE3nqogwVQveHzDFPZDMMtdpQ=;
 b=ak/VpkocbisTfciCHplfzmmKme3+1U5Ze9pJSAqEqfSwDdmHjkJphFEn9x5qs9iyFE
 FVVP2oUSlOGxhJWgpViDDyidT1o5Ehib2FdSkeCIWlQ25E4msa+G5vvqx8oMEHRx9C3U
 AWKqqMpDEgMScIoCRZidnjIPdhrmM3+qoxrqDa1sTtaqS7lq+Wd+iAoKYpKxAbv4J6lI
 8QOfz6Xv6rAyZkvI2TiG+8L1AR3hymx0qPBKGFRyOJAESJcNNhDWXqMHGSVUjXRMm48k
 SaCcVr4c1Em7FZt4KcwO1YWxs74l9/F3QjLnT87DUdMr6AnjIjZuTLB7nTd1Mz2U9zLk
 fAAg==
X-Gm-Message-State: AOJu0YzCvpW8xU2vAcEnGydOwCdfcxWry4T9pbFsfkAzMz+7zxx4miPQ
 zoqNJOFXAyDvv4sakGTtzMcWdFi38MXAc40q3XZSoZTnlDuVZ4ouDsSvgB9Szxwf8vkf8pCR3Is
 QSGtD9YWcO2vM
X-Received: by 2002:a05:600c:3b17:b0:405:39c1:a98b with SMTP id
 m23-20020a05600c3b1700b0040539c1a98bmr950180wms.20.1697790795812; 
 Fri, 20 Oct 2023 01:33:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3b17:b0:405:39c1:a98b with SMTP id
 m23-20020a05600c3b1700b0040539c1a98bmr950137wms.20.1697790795423; 
 Fri, 20 Oct 2023 01:33:15 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c4e8e00b004064288597bsm1595702wmq.30.2023.10.20.01.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 01:33:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Nicholas Piggin" <npiggin@gmail.com>
Cc: "Greg Kurz" <groug@kaod.org>,  <qemu-devel@nongnu.org>,  "Stefan Berger"
 <stefanb@linux.vnet.ibm.com>,  "Marcel Apfelbaum"
 <marcel.apfelbaum@gmail.com>,  <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>,  "Gerd Hoffmann" <kraxel@redhat.com>,  "Corey
 Minyard" <cminyard@mvista.com>,  "Samuel Thibault"
 <samuel.thibault@ens-lyon.org>,  "Richard Henderson"
 <richard.henderson@linaro.org>,  "David Hildenbrand" <david@redhat.com>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>,  "Fabiano Rosas"
 <farosas@suse.de>,  "Eric Farman" <farman@linux.ibm.com>,  "Peter Xu"
 <peterx@redhat.com>,  "Harsh Prateek Bora" <harshpb@linux.ibm.com>,  "John
 Snow" <jsnow@redhat.com>,  <qemu-block@nongnu.org>,  "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>,  "Christian Borntraeger"
 <borntraeger@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Stefan Weil" <sw@weilnetz.de>,
 <qemu-arm@nongnu.org>,  "Jason Wang" <jasowang@redhat.com>,  "Corey
 Minyard" <minyard@acm.org>,  "Leonardo Bras" <leobras@redhat.com>,
 "Thomas Huth" <thuth@redhat.com>,  "Peter Maydell"
 <peter.maydell@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  "David Gibson"
 <david@gibson.dropbear.id.au>,  "Halil Pasic" <pasic@linux.ibm.com>,
 "Daniel Henrique Barboza" <danielhb413@gmail.com>
Subject: Re: [PATCH 07/13] RFC migration: icp/server is a mess
In-Reply-To: <CWD3OHT178VU.3NF8B5Y5BOK1S@wheely> (Nicholas Piggin's message of
 "Fri, 20 Oct 2023 17:49:38 +1000")
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-8-quintela@redhat.com>
 <20231019233958.17abb488@bahia> <CWD3OHT178VU.3NF8B5Y5BOK1S@wheely>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Fri, 20 Oct 2023 10:33:14 +0200
Message-ID: <87jzrh1ynp.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /D2Nd+NPnpOZ

"Nicholas Piggin" <npiggin@gmail.com> wrote:
> On Fri Oct 20, 2023 at 7:39 AM AEST, Greg Kurz wrote:
>> On Thu, 19 Oct 2023 21:08:25 +0200
>> Juan Quintela <quintela@redhat.com> wrote:


> So the reason we can't have duplicate names registered, aside from it
> surely going bad if we actually send or receive a stream at the point
> they are registered, is the duplcate check introduced in patch 9? But
> before that, this hack does seem to actually work because the duplicate
> is unregistered right away.

You are creating a new general case that has only a single use that you
agree it is "hacky" O:-)

The problem here is that you haven't made your mind what "ipc/server"
means.  You want sometimes to mean pre_2_10, sometimes to mean other
thing.  That is not how this is supposed to work.  See my proposed
change, it is one line change, and just do the right thing.

I know, it breaks backwards compatibility.  But for one machine type
that people are proposing to deprecate/remove.

> If I understand the workaround, there is an asymmetry in the migration
> sequence in that receiving an unexpected object would cause a failure,
> but going from newer to older would just skip some "expected" objects
> and that didn't cause a problem. So you only have to deal with ignoring
> the unexpected ones going form older to newer.


Ok, found a different workaround.
Sending a new version of the series with a different hack that maintains
backwards compatibility.

Later, Juan.


