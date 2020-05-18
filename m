Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2998492lfb;
        Mon, 18 May 2020 05:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBpdAVFVdvsIeE0fEJmZVAB95X0ZfTt9Q3wP9Dah89NEeSYUajl03qeHOkleRw1nwiag49
X-Received: by 2002:ac8:7586:: with SMTP id s6mr14733631qtq.96.1589805656260;
        Mon, 18 May 2020 05:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589805656; cv=none;
        d=google.com; s=arc-20160816;
        b=e9KczSp/9GvAhZm8hkCHBomOpbzVLxoRl6LcCZnNMqzkzdug3u/kRfE4s3NYROl3xM
         I+dfyoHauvgnD279a4bbsgg1XwFFsZ487xA66v0tzR6PE45DdXwBgH0IMfgy/rEMiCvC
         ogeiMongRR41hHROIKmM+XUJ0baP8oaFHqrZlLLjBIEJmFV2ScCkygTjZ82pMobjkkq4
         qakC6SzRuhvBs+7zkWf2OfG68uQy0dBgciK/8A1RO/YphyKMdbdSh2uKMFCiGgjLURO8
         b8pYXa7PQovkNik2gXmUJMSFF2FP5UkhNnQnoZpfHmuANA3UE09hsd/wGGkzUAxvrSbG
         BBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
        b=1DvQSYKAW4sdviwKDU4gSmE9+c0jiGSNDTgUtd9Bziaf496KqsCzBou8NwfLgFOigg
         QN54lHNx5BRRkPuPMqazO7inUXR11gQFyiEdW3tIks3DirVLaDeXCBhimWkQ5CYRYtpq
         VIlixQUiliOA5wbk/u1BaoW3OXeltgYE6Okug+nx3HXA5kt+dLSZ7EqKRxDQEsV450kC
         rMKbNAUDyvYiGqYf4ZPZQoulrrtPrAzIUO7Vok88PiYZ5FBdlNt9zuOXwmJhgCYbyRfj
         f74FRSo3d76zxYLG7p+PdPmMhKjZEuGvaBz9mgiiAReKYmLcThBLy3oKKpLUeq4R2deT
         XWuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W0duDIdf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si5422124qvt.83.2020.05.18.05.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 05:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W0duDIdf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaf4h-0007VB-O8
	for alex.bennee@linaro.org; Mon, 18 May 2020 08:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jaf4F-0006vg-Tg
 for qemu-arm@nongnu.org; Mon, 18 May 2020 08:40:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jaf4E-0003xQ-M8
 for qemu-arm@nongnu.org; Mon, 18 May 2020 08:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589805625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
 b=W0duDIdfXGr65U7V45zn+/ofPUqQ1kESzBrC3toMmo3wrlO1ubBVS/jtaTxRaYdxBBURzK
 q6QIvE6T4Lw5tAcKcEkgaYr9y9Hke9R72UV/GrCeoqmD41cV+D3Y17xhUstJDXK8dhdfhC
 MEJxcvZovLEUqImgrSzZ9YTwi5nD0Qg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-gien3k6dNeyo2j9DMP_G0g-1; Mon, 18 May 2020 08:40:22 -0400
X-MC-Unique: gien3k6dNeyo2j9DMP_G0g-1
Received: by mail-wr1-f69.google.com with SMTP id z16so5603465wrq.21
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 05:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
 b=jzcj1tAX0pLCODvVG2qlEndo1Y6uaa4Ne/ZqcAAUid1CQkOviFA39nWELj8Xefv8/4
 rBv6iqiKsm/16TtFv0wKizKX5/uVvKsr5osRUOOWFqLbDNLIYNwGKD2FYoAHtkJ+Wb1s
 pG6IYzwarOx9sITpzmDOwqv+t0makndSqf72ymF8dIXqjl8PGBQwdxPmovtg9eRSl6Ci
 DqNZLMysykWO1IaI/ahkAfoVc0B7rIffE6fqvkv1pTnmg3yonbhCO03SlH3YHHPcaUqR
 MaUKngGNa+Auc3+oEt0r6MaqNbzn+jOuYkRmeLpUHjcwxJUTuG+kI/lFS7mO9PyEK6rY
 UwtQ==
X-Gm-Message-State: AOAM533Ux4L+td79FBFugfNahE2HcYyc5hPyEbT+dtWpJcr9GvylDR90
 SpNVyqoGU8phTohzVghNURSuIRoCnU7cIXJUDyB7EiO4oA1ZyssXIKktHHGMIKV/iU13/6fkJk5
 amAff//ZP78Xr
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr19378275wrq.171.1589805621655; 
 Mon, 18 May 2020 05:40:21 -0700 (PDT)
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr19378219wrq.171.1589805621356; 
 Mon, 18 May 2020 05:40:21 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.90.67])
 by smtp.gmail.com with ESMTPSA id q74sm17336275wme.14.2020.05.18.05.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 05:40:20 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
Date: Mon, 18 May 2020 14:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <871rnlsps6.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/BCCpIMxy7E

On 15/05/20 07:58, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Remove unnecessary casts using coccinelle scripts.
>>
>> The CPU()/OBJECT() patches don't introduce logical change,
>> The DEVICE() one removes various OBJECT_CHECK() calls.
> Queued, thanks!
> 
> Managing expecations: I'm not a QOM maintainer, I don't want to become
> one, and I don't normally queue QOM patches :)
> 

I want to be again a QOM maintainer, but it's not the best time for me
to be one.  So thanks for picking up my slack.

Paolo

