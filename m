Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp177869lfi;
        Sun, 22 Mar 2020 03:40:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuPz0VAal97FryPmaoTRL68MeVIw/EoL6z5ndVq15SCMNC6no8cPRc392WRlo0gGzWvsTRy
X-Received: by 2002:a37:b9c7:: with SMTP id j190mr15322693qkf.21.1584873639174;
        Sun, 22 Mar 2020 03:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584873639; cv=none;
        d=google.com; s=arc-20160816;
        b=BpIr6JD4V3Iqg85q8S3f9FuLwhxVFOBEmZlIblAknQTE02Iy8m9hQ+CKkLyBWz7g9k
         +zC77lgfTjkYolDAQbvgK52OGK+9fbOGvD/S9KL9znyxpX1arACQHtDx27uCRZO4/lwP
         K3176q6rkkYghhFFAW5bhnLaHV008EAF1P7De9eP0dPRezv885c4AeVxxTKM1ZQqLGei
         PJDK9STr78WJhgCXpXnW0lI7iVVIaDOjZtc2+0XrIu9mCvz3dQ9YxVe1zTNswa2xEJ0x
         ncMaytauJ7D27rAiMe7C21tdqV2nwCDsclL4406PWeAIKoSqS4A1cz2L4win2CShmMoC
         +u9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=duMpB8DleZnOHhKxPfAWBpe4PQunBzcKKHIr85PPwAs=;
        b=r//H1gHv3SewxLAqdUHLPtlzxlggT10cmqwdk2VxOrVkcYsf33SF8CYpHKxvWH+6F9
         XongBoEpa9KvKwIajg+Sfq6pXxWSlLcUy83PMhqypvu9zKZNVNX86pnzastL8j0122/P
         NuQC++bS4/lRtpXxSZ3o5oMPF1LqQov+tpVckLzEiCSrooM3X3RTpsitlb3VyG9RpAUF
         cb+aIT4hHd7/GCTccgwKDn+nlmyXLuE2HL1x9K5INNHUhdD32pfqH0MoXqoxZwRPR3Vq
         1ychocu1+rhdCuaB6HbjL1gTZ5wKCZLQOcUjTVXozO6kE+mkVfm2j/RjmWZPDOG4wTVH
         Utbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SeI1ie3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si6768020qkm.206.2020.03.22.03.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 03:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SeI1ie3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFy22-0005wl-KP
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 06:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFy1u-0005wT-KV
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 06:40:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFy1s-0002hC-VR
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 06:40:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:55440)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFy1s-0002gj-RL
 for qemu-arm@nongnu.org; Sun, 22 Mar 2020 06:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584873628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duMpB8DleZnOHhKxPfAWBpe4PQunBzcKKHIr85PPwAs=;
 b=SeI1ie3QmqXkW/ThsyerwiYI7hgjf8Qw+Ijatxyl0Sf7WprzNwDAIKxEjWuAa7xpajTYHr
 qff7/BHUq9akAkcZBzcfJ4zqBC4p/lx6OpFcyMSpOC4nzjbtA4M4EKQevaM1/Qjna9Iwln
 G7emge9QITilB3CdK/PTNTkTVU0YTuM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-wbvivMjjNwqMct__Jb5ISg-1; Sun, 22 Mar 2020 06:40:26 -0400
X-MC-Unique: wbvivMjjNwqMct__Jb5ISg-1
Received: by mail-ed1-f70.google.com with SMTP id c2so8992721edx.16
 for <qemu-arm@nongnu.org>; Sun, 22 Mar 2020 03:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BGclFkV+PokZBLZOv1Tse73YS9XU5dXE/NWmqjm+7Gw=;
 b=JinorFAJDUlvPpJBhL/J10AFKPpWBG7jFHuiFS1oAh+6BtpEIXKT/pwhDLsxD0IUio
 ZhzkVcvjH6/HjnCkPlrUSu5Rkp7t8Ghe5f13CZu9diMikG/2l058zSQOE4kSJMhmk6Uz
 G0+QMDX5i7NczXMXs5v4xdFUqvr4N6aeK0M5kHzbe/dkQrEt5t/kFQP0/bnb7vk9wPEL
 fLoxFuibjptHkkycebywBU8TJC0owTYUD3PpMJT5dBnlJ6N7t0cpnIK4BabqCIor35gc
 Sh4v4+qu8WUwXoZ6TzuhG00Lz5OuD7FFe9mSX7oHZjUCWDQbX6B73A7X04z5hTTQaqLI
 neFA==
X-Gm-Message-State: ANhLgQ36nfWo6NygVtBI1FSrlspwyMFKfTYsltGpGSo6F0UXSVXUrUHK
 95RUDdTvpmQ7jAhTUEhd+1NPay7u0xr0db6grlDAsl/F1+Tad8TgCLYwOIIXxYqABmBXDUfqzVs
 zi2SPzGer+Bgb
X-Received: by 2002:aa7:db57:: with SMTP id n23mr1001786edt.211.1584873624679; 
 Sun, 22 Mar 2020 03:40:24 -0700 (PDT)
X-Received: by 2002:aa7:db57:: with SMTP id n23mr1001776edt.211.1584873624408; 
 Sun, 22 Mar 2020 03:40:24 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id x6sm676797ejw.19.2020.03.22.03.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Mar 2020 03:40:23 -0700 (PDT)
Subject: Re: [PATCH 0/3] target/arm: Coverity tweaks
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200320160622.8040-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6607fd2a-1409-3536-199d-b6b7bf5a8319@redhat.com>
Date: Sun, 22 Mar 2020 11:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320160622.8040-1-richard.henderson@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3KCNJ0kd2bH

On 3/20/20 5:06 PM, Richard Henderson wrote:
> Only the first of these appears to be a real bug.
> The other two are adjustments to help satisfy Coverity.
>=20
>=20
> r~
>=20
>=20
> Richard Henderson (3):
>    target/arm: Rearrange disabled check for watchpoints
>    target/arm: Assert immh !=3D 0 in disas_simd_shift_imm
>    target/arm: Move computation of index in handle_simd_dupe
>=20
>   target/arm/helper.c        | 11 ++++++-----
>   target/arm/translate-a64.c |  6 +++++-
>   2 files changed, 11 insertions(+), 6 deletions(-)
>=20

Series:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

