Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3789671lfi;
        Mon, 6 Apr 2020 03:20:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypLsI4V/oB+HLtUEu1zFe45Ibwx++/L10v0VgSCUW1FKCeQ6Q+g6mOAASfCBcZasVDND63Z6
X-Received: by 2002:a05:620a:24d:: with SMTP id q13mr13175178qkn.382.1586168418121;
        Mon, 06 Apr 2020 03:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586168418; cv=none;
        d=google.com; s=arc-20160816;
        b=AZB3dHIhQycFI9tecg0OyY7kdFe0eXci56ZC93A7H5ytpZEWAIE3CE1KxTF8ACIypx
         7rrDuosrsP/IKWpcfbc4LUfW/Fl396eOO2ZR1CHKRL8e45c7i2MrFmIK54Gp5Ew4j8qa
         FngiKeoke9KiKbHR4YS/dPcvO76Cb6dTYYirW3oQa9qSQfAaQOI7fWYeW3T6iFNJO1ox
         uNJSYnjIgHGxUtB4ZcLBqUljvqST3Pub1RtwhUvWFv20+HL9i4QPhGoR4MzO03uqu5n2
         7jhm+59TK801jPBB4sGEgXIE8uM6RLV9NzlqSSqGBdcrLnANJii7UrKCcSlw5AhqC1PD
         OxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2SmZfaD8FZztWo3SmUJfLfJx+RKEm5IsODq5F9p69ak=;
        b=rZBiJbBKPxbV/Zat1phS5Iq3t5m6/p/FtVsUj1NFaG1D/QX3vGp1GUfBeo/k3lyQa0
         ryWrFQC6b2fDuhy0n6+aNq8MPrwxE18YYirwgO0ENYOO+jHzgaF9dj0eT4Ag3hILecJl
         mKC9PUM6dvCTYBiCxH6W7i6/jqJvxLory3wAJJMV7QX7QAsiYfRJu8YoZf1VYvvSjBB9
         eQqIXB21FKTyRp/g4e4pjOnDcZvQ+YG4JFh/AI1OaPtqio8+fvoEnthIQIfs2i1vi3FI
         yFRr7bl2VW9A3aix9yKNY3JWtIafcDx4Yy3tdf8viEjsADpvj3AGtL1MQcinJQV4S9os
         P3kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YOKwLf2v;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si10102040qvb.180.2020.04.06.03.20.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 03:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YOKwLf2v;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLOrZ-0004PB-Ft
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 06:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLOmW-0003Bz-GC
 for qemu-discuss@nongnu.org; Mon, 06 Apr 2020 06:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLOmH-0004oz-6g
 for qemu-discuss@nongnu.org; Mon, 06 Apr 2020 06:15:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57714
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLOmH-0004oP-3B
 for qemu-discuss@nongnu.org; Mon, 06 Apr 2020 06:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586168088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SmZfaD8FZztWo3SmUJfLfJx+RKEm5IsODq5F9p69ak=;
 b=YOKwLf2vM25Tv4gx3iDoqZ0B/D4pTXMu0EmYpLh2PxBx5CSBjc6ofvuqPVJ5igtTDvfCIg
 XtRare2lklAiCglhOB0CPnomEpMAV3kcjQc2u5DgtdHX2ukI6j+Q1V6ad2Ueq+cYoXJouX
 Hdxg8HrCA8Xck1GdoCkBXd0La9LtpsY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-YE1DWIfGPKWzxpH5pRt6Ew-1; Mon, 06 Apr 2020 06:14:44 -0400
X-MC-Unique: YE1DWIfGPKWzxpH5pRt6Ew-1
Received: by mail-ed1-f70.google.com with SMTP id bm25so11293158edb.18
 for <qemu-discuss@nongnu.org>; Mon, 06 Apr 2020 03:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2SmZfaD8FZztWo3SmUJfLfJx+RKEm5IsODq5F9p69ak=;
 b=OWH9dtRga3iPjeLdU+hyS7fL6ZEnMBK8DXxE6NpFMHW8YnMQRC4qYWoOjLubxzfrjh
 28PyU6gFRkSYNmJ+XYASudOzvAAHm+6Y3gq2ohJ52bQ6u+oLrgXNnMiRzZw36PkBViaf
 I2VgTBsbpZZQgHTjAVTsX2bka4dcK4TF5cwm74cXyc174lCql6LcjJFPVkm5tUC9YJ4G
 C3sCM0errRZDMiGQP/sepvZwvSvAod2EEJNdBQCTD8MV0p8tkPU3YDbglqsnuf1w512V
 0hkcALQSD9FEqDnVM+94ikuS2NRUvAPeVC+yN7aCaD3xub98Z3IblnQE0GlohquntwGM
 S6/g==
X-Gm-Message-State: AGi0PuaVZeM+mTntc1SA75IM+ex0l972v5yfjAQnMs2w4AFOBSp8e/ey
 n8odD81z3aRehp7L1QIX0+TKjrYK1BPDN+CDZRwFg7zoZlPH7p8raXSWtgOZevIGWuIY6W+nwS9
 4B+3bl9tgn1p65HHWxQ==
X-Received: by 2002:a50:ab5a:: with SMTP id t26mr18684379edc.380.1586168083635; 
 Mon, 06 Apr 2020 03:14:43 -0700 (PDT)
X-Received: by 2002:a50:ab5a:: with SMTP id t26mr18684357edc.380.1586168083323; 
 Mon, 06 Apr 2020 03:14:43 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id oe24sm2216118ejb.47.2020.04.06.03.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 03:14:42 -0700 (PDT)
Subject: Re: stm32f429 flash writing
To: Mohannad Maklad <msala.work@gmail.com>, qemu-discuss@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <CADxp151=4QduaHYugXGD+gcKffUUdkxfzWNvk5xXAqMWRKEQGw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e415fc55-359b-509b-15dc-79181b0a53d7@redhat.com>
Date: Mon, 6 Apr 2020 12:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADxp151=4QduaHYugXGD+gcKffUUdkxfzWNvk5xXAqMWRKEQGw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-discuss" <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jji7nyCeIRFN

On 4/5/20 3:41 PM, Mohannad Maklad wrote:
> Hello all,
> 
> I'm trying to write to stm32f429 discovery board on flash but it doesn't 
> seem to work. Can I share the code with you?

You can certainly share your code/use case!

Note that the stm32f429 is not modeled in mainstream QEMU, only the 
stm32f405.

Please also include the following emails:
- qemu-devel@nongnu.org
- qemu-arm@nongnu.org

If you want to share/attach example files, you can also fill a 
bug/feature request here:
https://bugs.launchpad.net/qemu/+filebug

Regards,

Phil.

