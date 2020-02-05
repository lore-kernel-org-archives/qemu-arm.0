Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp239102lfp;
        Wed, 5 Feb 2020 07:27:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyENgskzDVHoROKxqbVhbqjwhASOxj/465uyEaWQrMTEy36Tup9oDHnJ0IK1FuwDVsVP7bH
X-Received: by 2002:ae9:e50b:: with SMTP id w11mr34178444qkf.110.1580916427576;
        Wed, 05 Feb 2020 07:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580916427; cv=none;
        d=google.com; s=arc-20160816;
        b=BoiiIXL4+g/g/aybu49FoFb4bzTWrN5MGV6Mnr/wqS7Q4G88EVENYEx6PxQB26HGVm
         1+RpPzaXvDxioxLtj40TqmMIf4TQ0ioCbr/zU5pGve5O7lDJLL7wz+klblqX4Yg/aNJd
         4xa1xHHkBJm1lKahkGX24vXSPjjKs68mnBm77IFCsPWAq+vI1gUo/o6Jzs+CY2Pt+1B8
         z37TfHox3K5gawbEaDXVdnJuQJE7uVCFudYGiEmnJmo2CtzxcmJvDKgyOYm/Tpe4DYTc
         yGJ1i9N2uMpI8qioqM2C0A25SuEinY1w4SSI9pyHpilbCSRS42p96Y9c4wSXaU972DP+
         4WqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0G934c4ezx5PqrNBWltm4RKTNT49Jlg/JBkQmGNu+dY=;
        b=o1Gv0m+lgZfYnmrcip5E4VFqGKO4urrP5zPODTagXT96KoI4gw51t1OI6HmDniw3ER
         zmfRKOPfGCFdKruQ+YxuB2clQVxhgameD1/r74dARmBJvYCAX9D265ynauIGtHiCd4Mn
         Fh5941jSoPEs72SVP5m1fQXTGT7KKlt8spYMUuBCIFFTIIWCfBh4PELhtkPvCbEsEJmN
         tntMKy3OlFrnFQCg3CpP+iVctWjPPX/Z06ks0NnaUbfRfeV0iNbvH8rQUabVdH4q3Eur
         nwIKKz4K8tGZm4nqgds+4je1v1zd2ml1w93Pp2O7bNSnURDwQ+qsedvH0jziS55AOzBf
         iC4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="MC4wme/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l37si7613781qtb.216.2020.02.05.07.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 07:27:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="MC4wme/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izMa2-0007ec-Vp
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1izMZt-0007aV-Ny
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 10:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1izMZs-0003CM-OI
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 10:26:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54100
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1izMZs-000372-K5
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 10:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580916416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G934c4ezx5PqrNBWltm4RKTNT49Jlg/JBkQmGNu+dY=;
 b=MC4wme/SxPgu4VPyDk8snws5qM9aB6OHBs8xuwlbKZBDXtzkVhGn4uIjdxq0YECFex0M2o
 wroA3CVFy+B3HJ8VXIQvP1yRPR4/wMEoWYzOpe7UgyBlPB2QK4VsWbxvBQhLvo1tJD2pZt
 B8gqb6/q4tAgT0y2bhrxSO9WBNNn780=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-FrcgUKlHMCmqSwEY_TBz9g-1; Wed, 05 Feb 2020 10:26:54 -0500
Received: by mail-wr1-f72.google.com with SMTP id w6so1337468wrm.16
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2020 07:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HFSvnF4h3RbLYLc/xxbbhYMLGqdBwO8aieKoCsyDA6E=;
 b=hqj9vBz6+tXGpAhWnK7FhnCVvCeNKXDnsEVre9yQK0zF1exiMudi0YwzRXRDvwvIiR
 qJcJqh2rs8yqAKFPo7BZYUjaLnYssp1o076sur1I+Z8215BTAvPfODmb1VsKq0kr9kEs
 i+6bWXbM6FQWB9AtQTNCCiiNkWK8hmLQeozNbnUrkJI4fBznXTqCkQwd3ZLf1WXw91Q3
 cjoncbi3H9Ed65G3NKFmIVoFGOIaLAuZFv2ke13KfASV59/OkrxlL4apyD/e2wnrbMaW
 zbEu2s+d8wX57i9KmEi41wU/y9Od1kI92neT1NkDOF9U5OxL2UM1PmJ27oZGR8GG48Tb
 P/tA==
X-Gm-Message-State: APjAAAXm+NvNxD0t15Sz8cuKfgmBjikt/aU9Eega9RoSLEn3psV3ZUAT
 stKUI1S5JhLAD8A/uv4wlQl4FR+ufsJjZiAvhC2ndL6keQ7ioQA9bT/jr5IXRTQYsASkgUXemeM
 0QPGfzQRWQZ2B
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr6051451wmj.108.1580916412768; 
 Wed, 05 Feb 2020 07:26:52 -0800 (PST)
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr6051416wmj.108.1580916412427; 
 Wed, 05 Feb 2020 07:26:52 -0800 (PST)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b10sm173148wrt.90.2020.02.05.07.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 07:26:51 -0800 (PST)
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e90fb38e-bf41-c696-6c94-8626ecf69a8b@redhat.com>
Date: Wed, 5 Feb 2020 16:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: FrcgUKlHMCmqSwEY_TBz9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kNHad0OWVhP

On 01/02/20 19:53, Philippe Mathieu-Daud=C3=A9 wrote:
> I thought about it but this won't fix much, it is too late now.

It would help distros who are already disabling bluez, since they
wouldn't incur a compile-time error.  Not a big deal though.

Paolo

