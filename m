Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3192570wrt;
        Mon, 22 Oct 2018 08:31:06 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fwTHD4Y9Bhsgq//CG5qVLsuHRql8f/Xq7+04EXHxcrIVt/NCpxyQNj4keIT15IcbjYvvte
X-Received: by 2002:aed:35cb:: with SMTP id d11-v6mr7682955qte.212.1540222266831;
        Mon, 22 Oct 2018 08:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540222266; cv=none;
        d=google.com; s=arc-20160816;
        b=b4/blKAeEaSPpIzshSnK53ikl4f5Kq76LhHkdjYoI3Wa+Kyu1DbAA9Pkx25RHwf9c5
         r9BpcwDcpipOWxrJjU3cT/NVbIUKu/aJHI2mOAhClNcHJAMyF1wVSQKo3/aE/j/5w37I
         tJ+cOsLOU/RKgIPmXNlMk+ZNsq9KM0iHBitAgb7VT76FyUd2rQJ5g0JpZKWXzDYAr0Zr
         RL0T2sAY3lYpcBGpVmbvyZ5rDJbnFrH0Q1qD1FKqwcWw3BfbkQMhg8QwrKRU0ynPKC0i
         0YEjKSR7bUNjDGV1Rwy50RacNNIv9KSqzLR47232M4fspfuSinAO14Fx6V/YF35ts3YK
         0vqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=5r9aVNnQYCtnDo7b0nLHUYjgxYk//pGB9buDVvpxyKo=;
        b=r+i/LmJeKXSA8/5TgqkfEqYu2LClxOO5XXYoabO8Y1elWnsnWodmm+TTkj4e/hyH3Y
         pe9fjQArwyP8bdMyeKBTURvpTU7GcpK95CJKwvr+pwD5a2D+aiN92M/L2Fo0l+0J/YD1
         mewyJ04bCebZi2r5EXh/Pg4USIYruGnwWhoSFH1WsHoBnLf6vNvEP54fCUZ0PaL6OH/A
         R/V5SLsoCdzPuToh1m0XhuQAS7pAnVaRmeq7eCIMtx2VRdM0C/17ErhjxEKmlwYDbVls
         5Gvuuj9ncKqeEa8M9FhKEW6PCxFUjizGG5nQEHsuFHsvanBsJHhwIG43BlGCshbtwVXS
         qdhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68-v6si7721379qkd.9.2018.10.22.08.31.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 08:31:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEcAc-0005Kw-8l
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 11:31:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gEcAJ-0005Jb-4a
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 11:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gEcAE-0001Uv-Lo
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 11:30:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gEcAE-0001SC-AL
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 11:30:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id d2-v6so45470432wro.7
	for <qemu-arm@nongnu.org>; Mon, 22 Oct 2018 08:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5r9aVNnQYCtnDo7b0nLHUYjgxYk//pGB9buDVvpxyKo=;
	b=dvAQ58Eog+dRlmlEauZTMRpG0TgZv+G4B62+/k83H+VKsk8NmRgDnJX4w5za/2fnE5
	cYsxtmbzQr3OVBH/rU4aVxKQn2WTUc4nuz2gZCx4tJFL7RbaC2K0Ah3hOiykvpPHcDtQ
	MquF22BxCI0blYjQR7wY0qXptLclTuQQDGKYGqVDTWV2P43vGlDVf3+pUG788CKjJrlh
	OrTHaCpYSJQQG/RamEKNDJlcJHpobTVQf8kqYX1mWf/C4KceMWqKErMQj6I16z70sxvc
	yxzFPFfHoggZAQ1Nydk2hZvrj7t2n69gdNiwFXiDlBpZUIwhuGlAGUVWfquO8VgnZrJg
	vntw==
X-Gm-Message-State: AGRZ1gJnROg2kyV8YLhYPuu9rg/2stDc9t0H95ogxqZyp78g+J73Inkx
	ZY5GThKPpGhtmth4wZXxMjCk0Q==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
	i1mr12449031wrx.310.1540222240180; 
	Mon, 22 Oct 2018 08:30:40 -0700 (PDT)
Received: from [10.223.168.229]
	(host86-187-162-114.range86-187.btcentralplus.com. [86.187.162.114])
	by smtp.gmail.com with ESMTPSA id
	v30-v6sm11760055wra.67.2018.10.22.08.30.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Oct 2018 08:30:39 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>
References: <20181019010625.25294-1-cota@braap.org>
	<f7067d72-3b2a-9e6e-4636-f18ac1cf5202@redhat.com>
	<20181019145018.GB7279@flamenco>
	<6190036c-cd1f-4549-9b7e-9e7913c972d4@redhat.com>
	<20181019192932.GA17761@flamenco> <20181019234608.GA32420@flamenco>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <74e14727-1174-0b91-94ae-6f07475e583d@redhat.com>
Date: Mon, 22 Oct 2018 17:30:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181019234608.GA32420@flamenco>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [RFC v3 0/56] per-CPU locks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>, Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4sXyBM+dxNvH

On 20/10/2018 01:46, Emilio G. Cota wrote:
>> So it is possible that it was my implementation, and not the approach,
>> what was at fault :-)
> I've just observed a similar hang after adding the "BQL
> pushdown" patches on top of this series. So it's likely that the
> hangs come from those patches, and not from the work on
> cpu->interrupt_request. I just confirmed with the prior
> series, and removing the pushdown patches fixes the hangs there
> as well.

Oh well, not a big deal.  You already wrote these patches and I don't
have much time for MTTCG anyway, so I am okay with sticking with them.
Thanks!

Paolo
