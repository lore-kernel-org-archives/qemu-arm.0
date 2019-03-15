Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1477511wro;
        Thu, 14 Mar 2019 18:15:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxugNd8/qzRDtQi0yCD7sOlofi8CgUKP+FMpev0qxvlB8AKcW6qOwfcfqUYG5izbfO0NfDg
X-Received: by 2002:adf:ee50:: with SMTP id w16mr441573wro.293.1552612539194;
        Thu, 14 Mar 2019 18:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552612539; cv=none;
        d=google.com; s=arc-20160816;
        b=j436p4yolVxFQwql0sWtmLyF8hMpO4DvjpCogBGgpVkSRFwUwzh4HJhmQi674JgZQF
         vZqSQo48HIkpPtlpWsexAsOyfn6cVf/QnG6626Hg6NvQ/bezzeSGKK0cA7RNwxy1O407
         vit03qidCElweiZ0w1fGMOHRTKhwPWIuaDnu7Mpg8LQYGwsGB6t7q827AQkhRug/8q45
         0PHZcQYvWlPlPQpABuIsZi6KSXVI02C6ChtDXi3WFaphfZoazd4hEYR2dSDTN2Yf1MRE
         Gb9M+XSF22tAMBetkWEJ8N5EVk+KTJEh/MapgYZJuUP3C28zjYexCTPJvGLsk1Vnu8Ar
         /0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature;
        bh=Mks9ZH/pnNVpo5RpUIoEVYw+YqdVdBHuAAEfPmql/8w=;
        b=RFJ6md/izZ1hABA4VBDgjhLWfxM1uTuOzBJ9bKJqVQKLWJBvBbD8TiQLgeZf2epj/q
         Q7PE4dMJIS4Hx2EAPQrCQm8cfuDUqLJm/oQxxP8Zfn0Ic6PQoHZN52LPjdUHYwtTE3GV
         yd0Up7M0IfWYxzhI1ZVBhi44aa3GAakm+g9KwmJjMG4a9nr8f+ZUPVPZxVpJ0PQnCGJb
         XTqhiUj8qT+CQWQsWEB3QAv5lFfHPYErsHYvv6LO8I2QFea9eP0rfbZP/4D8rGGm+8i4
         4AurzV5Xa+S8qMFFe273ibMLkfveKondET+7CAAcArD9SWAp1mFFzG5SOs3wMHyAqLb9
         /HhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uNYr6BQU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si294854wrn.82.2019.03.14.18.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 18:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uNYr6BQU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:47370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4bRi-0007uO-5Q
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 21:15:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1h4bRU-0007so-IV
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 21:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1h4bPM-0005EJ-Ms
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 21:13:13 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41295)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
	id 1h4bPM-0005Dd-DU; Thu, 14 Mar 2019 21:13:12 -0400
Received: by mail-wr1-x444.google.com with SMTP id p1so7828272wrs.8;
	Thu, 14 Mar 2019 18:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Mks9ZH/pnNVpo5RpUIoEVYw+YqdVdBHuAAEfPmql/8w=;
	b=uNYr6BQUPuBmJ+JjhY3sBnkIXaMzme9ySnbZBomC3bkEAP6RSN4Cks2CyIlhBXJLf+
	8PNakZDvppFDpe5STbNfKog9OY+0K/FtoTSYKgzPqlCN6y9zBfNrhf6bk1L0EhKZRZ6Z
	onucP6JHau3zN/BVYIvzoPo18cz9yBA47N08JTeOUGiE1OYgVFkXsJEYf/IB3MH55r9Y
	zsLw+ctyaDuSfiKZbevptEppdPExtnPEDvA0DstyO1gQ06AOrP/VlyyK13PEMhHycmQD
	1ZO/QuSiCmt2zTNmS161gYQcW/vwdnxtNfwv6nrJUHQOYMsoj3emDr3GLCpsyhdf8TlC
	wy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mks9ZH/pnNVpo5RpUIoEVYw+YqdVdBHuAAEfPmql/8w=;
	b=BWP6Bztx6Os4AVKlwIjyIaChpfU5WeY0llrwdf/733QWLVMiQQJVRqapYL5xjzozDH
	2uVsPO6IbqvQbKLc5El9/A/bGUEXyMKPkAIzem1iFmCQGGku3BKE5z/1kWJzE3h63gwT
	oGeIZX8RAXbc/u5s5nfn5LQ6gcwXvPsq6iPcV/NK4eg/FJVZk+tOJt2hE5Gv5CGFlVaB
	NMVG24E97KzNB0hCLU4xe3Esbir1+oLRBoAHKV6L4S8P+mQ3WmUZ7Gfg1BghuOtHGNl8
	eVxLbfMYKTakPwGkl06wp9WsfQgInj5YSXBrhRsICLmrsqFZ/XuewgCGUTWx9Q+Jn5zg
	6brQ==
X-Gm-Message-State: APjAAAV197d7QyXkNsUkzO4YU1EeaeMPlj2dEHqDPWM+vb6k1x1/lWOu
	/Wbr3opu4VeHvDFQ9ZnK0Nk=
X-Received: by 2002:adf:f9c7:: with SMTP id w7mr439134wrr.311.1552612390322;
	Thu, 14 Mar 2019 18:13:10 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc:1::c9?
	(2a01-036c-0113-6af5-0001-0000-0000-00c9.pool6.digikabel.hu.
	[2a01:36c:113:6af5:1::c9]) by smtp.gmail.com with ESMTPSA id
	f196sm754492wme.36.2019.03.14.18.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 18:13:09 -0700 (PDT)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
	<DirtY.iCE.hu@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
	<20190312071250.12168-5-kraxel@redhat.com>
	<CAFEAcA_04sdrC3vvOAE_=camjFEssdzMArRxTUz4LsgBM4zZLg@mail.gmail.com>
Message-ID: <db044760-83f7-a0f6-eeda-4d0d78706deb@gmail.com>
Date: Fri, 15 Mar 2019 02:13:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_04sdrC3vvOAE_=camjFEssdzMArRxTUz4LsgBM4zZLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [PULL 04/14] audio: -audiodev command line option
 basic implementation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, Libvirt <libvir-list@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +uMw7KesGZWl

On 2019-03-14 10:46, Peter Maydell wrote:
> On Tue, 12 Mar 2019 at 07:13, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> From: Kővágó, Zoltán <dirty.ice.hu@gmail.com>
>>
>> Audio drivers now get an Audiodev * as config paramters, instead of the
>> global audio_option structs.  There is some code in audio/audio_legacy.c
>> that converts the old environment variables to audiodev options (this
>> way backends do not have to worry about legacy options).  It also
>> contains a replacement of -audio-help, which prints out the equivalent
>> -audiodev based config of the currently specified environment variables.
> 
> Hi; Coverity complains (CID 1399706) about this, which isn't
> a change in this patch as such, but the code change has
> probably caused it to reanalyze:
> 
>>
>>      if (!done) {
>>          driver = audio_driver_lookup("none");
>> -        done = !audio_driver_init(s, driver, false);
>> +        done = !audio_driver_init(s, driver, false, dev);
> 
> Everywhere else we call audio_driver_lookup() we check
> whether the return value is NULL before using it,
> but here we don't. I guess this is a false positive
> because the "none" driver must always exist ?
> If so, I can just silence the warning in the coverity UI.

Yes, "none" (implemented in noaudio.c) is currently unconditionally
compiled in along with "wav".  "none" is used as a fallback when nothing
else works, so I think it's a bug somewhere else if it doesn't exist.

PS. I think I managed to break something, Thunderbird complained that
non-ascii characters in email addresses are not supported.  Somehow
Kővágó@redhat.com ended up on the recipient list.

Regards,
Zoltan
