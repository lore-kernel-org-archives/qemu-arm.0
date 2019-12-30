Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15450280lff;
        Mon, 30 Dec 2019 06:03:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSAJV2/GplbOEOP8fBGtKw5UaJ+40hMyjhQXE4ogG/8ghwd9t7RunB/Pe8rBIscaaLyHaG
X-Received: by 2002:a37:a02:: with SMTP id 2mr53690814qkk.111.1577714625941;
        Mon, 30 Dec 2019 06:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577714625; cv=none;
        d=google.com; s=arc-20160816;
        b=Q31i9yaea4Vb85tWZ6ROlSbuxtcZOi3qBNN9+vMhwPeSMMw+sazMQuC3E8REdEj/E/
         KkEnauykSIovMeVEiv+l+3/hUgBxPnrel32Ly5+g5EePjTad5oIzxm/MYU+lZl56qkW7
         uWEyzWfNs650mArgpOQdluyFwZjcZ0m9k+VgglNqUi/q3UGb8w2rRKH5vN0CaCzjZCb1
         Fn2WcaZ3WuvLc0S7sCcaK1Fmv4epc13L0v8Urv0BrY3iebvkE5y9T/JhjLhKdzrlU1Xf
         PoxnksbIunnljkQ++5sgCf+RWtPyBLHHmW7U8kWt9vOimNHE1j0FHcTWi8GLCKz+wMdR
         8oPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4fFnOsfrdzXZNd/V8o3HYvj6SVkAdaSl9sgyoNeK6yc=;
        b=Rs7fgVckhcCmGphyda0zREn2hv3EmpAA/m5ZFfV+C0v9TF/qsu5VprnXtYPK6iXlTb
         3TKqgs4W3zc06otxDrpwDa1rJ/bM5lvXElHPGV8Uwtp3ycdWXv671BOfnb5J4gNpXNQI
         QdOUfkzQb3AMcPSEmlVIk2BqBgZFTaD5qGe2o/Q5UbJYuFJ2c5Aa1O5vGOt28zLp9MkJ
         mjBi2JCltHLA6ayDOq68EXNiAsTbAy5dQZTx5Ymyr9KOyoQ/hl7O4kH1iJOPoetxylo9
         ENoc4909HRgNUGDiQ7/9AvJUnQA9yaeZjh7JVVIkA5sVeiCunTsTr2C3SBYEv8XJsFcI
         TS6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FjERHHrx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o45si17291490qtk.333.2019.12.30.06.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 06:03:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FjERHHrx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilve5-0003XJ-C9
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 09:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilvcZ-0002iq-KJ
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 09:02:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilvcY-0008Sm-2b
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 09:02:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58315
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilvcX-0008PH-Ht
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 09:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577714528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fFnOsfrdzXZNd/V8o3HYvj6SVkAdaSl9sgyoNeK6yc=;
 b=FjERHHrx0J1gA/kzljJ+EjKgcwc5brB6q7wE94/mdS6aFDOe47iYOe/AEspNfz317xTR9q
 pBxsKNZNg3EHPu0e4BDh8zi1qwetFglUEakniuI7HeOCTkpgNb/sD1Dg7KFf4EsWwLdt3n
 aloyU3OXCbGSD8KGOxncilaG+uOJNRs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-SiR2wCr_OM-b9ZF4dRYU_g-1; Mon, 30 Dec 2019 09:02:07 -0500
Received: by mail-wr1-f69.google.com with SMTP id o6so13830799wrp.8
 for <qemu-devel@nongnu.org>; Mon, 30 Dec 2019 06:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/J+Rnxkgh1lDLNt07hjUKRxIL0vPpkp6G8hyPyXwQiE=;
 b=fywhSfAu8mRda47O24xmA6ZYeWPw9OXu3BU0Bt+VvRfK5VCy/eOV7S6vpy+TDhYaLB
 4i6aiOdNkh3OqtkA0a8nl/XY0yLJr6c5GeiB/8ElulxTOeQFK76piNRXHO/2zKegIebc
 wBjXCLhQhS2v48Qx6uOP6lOH9DRjWpeb2RW6UuYYNiP9Js1hu4exurn2ZWAkILPS2/gT
 ceYPwcRjYO8wliExi6QsALS78s8j9XJouOqkmcgWTF/GSVb/n/0a+gEjqRuMayaacdA+
 WVucegLUUzYhj6qsGDVpp4+GJCbqhhbplsNtCIEiOztaPffQPBGHLPTFKkbIuy0RXG7N
 6cdw==
X-Gm-Message-State: APjAAAUwUhp92DqnGc2b4LkBwX3+x94GWphShvpLWhmcMCto0TA+WgJY
 ndzLSC+upTYZ/Xs/Wa+CTw0kRpmQLDnx8sTD2EpzpQUMUETmoPlv9BxItDBqUGzJ+UwcdSeMsgv
 l4XjZ6dA06PM4cEA=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr35197795wmg.110.1577714526064; 
 Mon, 30 Dec 2019 06:02:06 -0800 (PST)
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr35197742wmg.110.1577714525829; 
 Mon, 30 Dec 2019 06:02:05 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id f1sm46608781wrp.93.2019.12.30.06.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 06:02:04 -0800 (PST)
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
 <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
Date: Mon, 30 Dec 2019 15:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: SiR2wCr_OM-b9ZF4dRYU_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAWGZzk+tFFG

On 12/30/19 11:33 AM, Paolo Bonzini wrote:
>=20
>=20
> Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
=20
> <mailto:philmd@redhat.com>> ha scritto:
>=20
>      > I'd prefer not changing those files.
>=20
>     OK, I'll wait to see what Richard/Markus prefer.
>=20
>=20
> I think it's best if you keep the include directives as-is for files=20
> only needed from tcg/, and move the other headers (those that are needed=
=20
> from other directories only) to include/tcg.

I thought moving headers to include/tcg would diverge too much from=20
libtcg, but this project already did it, so why not:
https://github.com/S2E/libtcg/tree/master/include/tcg

