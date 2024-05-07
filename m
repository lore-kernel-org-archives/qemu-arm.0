Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1902555dlb;
        Tue, 7 May 2024 02:44:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/pTGibzpdYhQXljEJfNQuO37enN5z59ckx7ZY5ySDrpFzcASJ5+X+7FF5JVLrnpeCxkbSp+bLhQxmu26EHBhAaslO9P6h
X-Google-Smtp-Source: AGHT+IH3ZvQSknyWRMvNvSvZwKImE6JgMixvQXKbMtmQJwXNrhChlWNzUXSZUD4yuNNzQ3Ej5kCW
X-Received: by 2002:a05:622a:d2:b0:437:b582:cbc9 with SMTP id d75a77b69052e-43d8f5b9d82mr35463811cf.24.1715075096411;
        Tue, 07 May 2024 02:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715075096; cv=none;
        d=google.com; s=arc-20160816;
        b=HTHah402z6BrG82ioHWQyOSfeZ0A87551dCkxEOQvDRc+woI9RHvnfWMsbxz7qGGZ9
         ygTAbLaCaP2FNxdD15zYaVmxKiQPuIppEYQN/3ApkWMTSjP3xIchoCOscB9fWil2j49N
         9Y4GhuYlNA3Px5LsPherNnazIdR/UkaLnZPC1KQZsDzc/XKyW7qbdtgl7yiOUR8P9iY1
         5CZYWseatJ57kl7bR/S2Cx0jiO0COcQhz2fWYmaoLyWyX7f+iyP5hTFjpstjds6L13HB
         7BqcC/wD2QjMyocpm2MzClOLZsHCtH6UVk1QOGzQBEGTmzhW5OowLxXcJtP/SF5ejDLb
         HGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MhfhWaRrMvPU54vrJIoL/1T+Zon9Fg2fYR6SvkTPvuA=;
        fh=ihy6+amGIraMb0QeZ4KpO1wsC+o/KPt9YF89yF98C6c=;
        b=aV2lLzP93l0As7LvuUvxw5yXtWbzWyZMCzTaNt+HEYMJ5NxvLdXedNLFpLJO2PBCEK
         WH3BzaDMW+1CA/7kR3cjOgQYPTkSvVbQQHfIH2ua34jZPJXDz8LrvvMiLbwGSTs29arm
         ILgJx0DggdSBTYFBwnJH3XvmwnRxDivkx/5V+yzHoouq0Jv+eO7Q/yIyKbIKYJyEOrSe
         7ZXI/EReuRs5/UmSw141ER8kwA9S8OIINdd4ysU0N0sB1pUVsqMoV4SZUri+oyrzCXpM
         laoOqqt8U/Vhh3C5Z73stlLbF2QzxsZfltvTd4262QCrIaT1q6W0IM3XEw2L8GhY5457
         lGYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHE2WRtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05622a121200b0043aef50e6ebsi11428537qtx.80.2024.05.07.02.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 02:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHE2WRtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4HNW-0002JL-Im; Tue, 07 May 2024 05:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4HNU-0002Dg-Rp
 for qemu-arm@nongnu.org; Tue, 07 May 2024 05:44:52 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4HNT-0000j7-97
 for qemu-arm@nongnu.org; Tue, 07 May 2024 05:44:52 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a51f9ad7684so314392266b.2
 for <qemu-arm@nongnu.org>; Tue, 07 May 2024 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715075089; x=1715679889; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MhfhWaRrMvPU54vrJIoL/1T+Zon9Fg2fYR6SvkTPvuA=;
 b=IHE2WRtX9jcGNlHe0pz2NwLMxOpdB3iZp6OGc5FL6oZyIxXTAina4AHx+grV0Iw+GR
 8R50omJ55yIo3wVMXnPZ9KzBJ6yPX5tK6OnarblqP6Vl6qbgxwOWIdjMeIqdPHGHyEQp
 pLb+9HMBOyFAYWjsyvpyWR0tYs6Nk/0oJWWdVQu1CMmX34rzhb9I8ueCuCXefM28hxEx
 InNhIfJwqcGdACiuHqTlkS2/tTFbQK9VJTLvHrbCh5ACUZClBltYOR/fUoOk/UoLZcg5
 vuZTvLxmK7hnFuYFJ834WJrs+I14q0cmx5r3E8p2e+vy3sbMyiQipD6pf27jjawcH0ii
 iFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715075089; x=1715679889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhfhWaRrMvPU54vrJIoL/1T+Zon9Fg2fYR6SvkTPvuA=;
 b=qdOUsM2tSCG0Lov2Ky5oLnBB5Dkh2H4MRNhbUDuERYe4Vk2zjUDKiUV9muvsi9ocSo
 xGhZw9UvGTawEVk7HbJ6esXFrDLynOCsSq9iUtkC8AjH4eFClpmWiB3y3bh3pkBzsgqD
 W+dav1KVPj/Sxoc0CVn0B8pPjwmAnNQ2H9tYlHlVpaXCcasiK/qLQx88lv0eQfmpZM4m
 qcc021F9rN7RncRfV3lIfS1UeH48/dKWSW+z+U3Lz2S0Fdf7LCjodUSh+uHF/uWWnady
 WWlH9pKW5nIT3aKe6AAFUR9FfHEJEtcxZTUEEOdDNJWfbpzwu1H4q115DQZn92ysHBp/
 oAog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHnVrYwEWGETNnhpZlKvNAGSqdGAcbJeEnvpFOcWPtxc2MOlKiBJA7WXUr5KmQm87sQCGE0dmwHEBfVru6Rk6QENSF
X-Gm-Message-State: AOJu0YwEjMMXBx9nwwgiWpkkQyqxqJLexLGBAN0WBf8LagUwTCV4bm7Z
 3RMdSYMvjuAhhZFG6WsRjlyWfdSle0x9YJTMMKNFpZ7QGU+54up2h6387WkMT/ECUUDi4jjN9Mp
 k+jRuGw3d1skQYGukGsfIADoRxVIQj5nzu/svuw==
X-Received: by 2002:a50:f613:0:b0:572:689f:6380 with SMTP id
 c19-20020a50f613000000b00572689f6380mr10504336edn.3.1715075089507; Tue, 07
 May 2024 02:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240505141613.387508-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240505141613.387508-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2024 10:44:38 +0100
Message-ID: <CAFEAcA_KAOwFMudJXvPCF9bDk-oFRuiY2beyRf4Zp3G=t6NDxg@mail.gmail.com>
Subject: Re: [PATCH] hw/char: Correct STM32L4x5 usart register CR2 field ADD_0
 size
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FkggoqXDq0Lv

On Sun, 5 May 2024 at 15:16, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>



Applied to target-arm.next, thanks.

-- PMM
