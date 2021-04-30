Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp546449lfg;
        Fri, 30 Apr 2021 15:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuV6+5wFUGoa8e+L37G2V2i7fpzhEwLyZncFq3ELO+CLLdbC6Hj8BW9EDufWrrGoGlGwbw
X-Received: by 2002:ab0:310a:: with SMTP id e10mr7747894ual.93.1619821194831;
        Fri, 30 Apr 2021 15:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619821194; cv=none;
        d=google.com; s=arc-20160816;
        b=s+1CddPYpgfFuqMDeguchdDQp6pYQmKCEuAo/Y50qAWR1w0uIlYxaVbv0ZDY6rXK+o
         z5tWruZ1hpR2L1nGjwajlAIoINMkaepv4W2u0PpVbvlitSJ8Tf/KRxEOwo5Jvw/kyLN7
         sCwgjkSMyP7DQlGkRLb8qEARXbAqjaLN4q98X0ZzO+WOq77zWymf4i3BBqTuLnQm3lUQ
         i3urpNICcKtolyDSdQ0mLx49sEdZBPEtBjTi+nR71X3X3v01mOEyxTuYXuuHqjM5SMDK
         NRh2PPjSsifxnbzIbP956Z75XmgR83vYTe28MF+u79vUBEHdbY4S4fythRylqdL8eCE1
         7plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s69swnRzpykzAej4Nz/f6AqqvO7/sIYFPkzweVc94/E=;
        b=LPBQNsh+kmfvZoa45VvIugwBrjpXtxSBQI+x/9HAMF1YiWtnpWp0Hpt+EqeIXc+ary
         TmK1wk8TiMyoBWVIQCyHLXL+gTc28OHtwSYUVy5LUrZFGvqHKi+BoPWDl8d4KMcY3N2a
         y7k3NT6dSD1woNZYWRGTEX90iT/QzVadlkRf7yjVeqKkPJtB8MTCocfWhg4uhKukkdi2
         Ki+Bl72NgWp2ab4BQxTNuoFEJWDap94xSUoe0/DaJGtXfaCkRk1h/WFHUE6pSjJT3E6O
         dfZWwVZI18U73GoISn1A+z9+SIvV2s+6eCGOMfvbOQFsJTenQj+t5oS9ld8E5ANGaaxp
         X4WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ClnAPmgf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si2376175vsh.42.2021.04.30.15.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 15:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ClnAPmgf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcbUI-0000pi-4D
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 18:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbU7-0000oU-KR
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 18:19:43 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbU5-0003GV-Sj
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 18:19:43 -0400
Received: by mail-ej1-x629.google.com with SMTP id t4so24130594ejo.0
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s69swnRzpykzAej4Nz/f6AqqvO7/sIYFPkzweVc94/E=;
 b=ClnAPmgfFZs0OSs8iQSKI5oTyOt8pxnKRXsQNGO9Ar7MGZ+V4Kl8hCNvGuwv0XHixp
 n6f9XGs1ldx9dSeSrAUh43JLFzd54a1zrWBsW2IlUkOpXLMKAX01U7qfdNN3UUbPqrhF
 euBSgTUrTYmARwbUbOtYU9tTqZCeCDhRVR82GND6STPTSh/1KiZ9YcheyOZyK8J/zE0E
 03MkmoEKTNlFQpO0QlidtzAhNrRFyMSG2FKV7VzfNGnDYC+ZdgPSsSk3YAUYZ5iCBlKl
 8OeNswcD5FCgYao51FfWI9E5RTYHl7J7SL8kK+ji1kYTbi1ZnqqX0Wvj79qZLUf1PsuR
 5DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s69swnRzpykzAej4Nz/f6AqqvO7/sIYFPkzweVc94/E=;
 b=DuGN5CDf3OlXdjR6I/v3ScYWT0kwYL4oRR94EM8PMPv70XyvDHXL2A+1NxEge0aL5K
 6wDh/tQ0JqozporkucT7JLQ5YkF3cYmlVkex5GY5tHWp+9MGoZVVz9vNi75FgCByoTrQ
 kKspXW/xIIdzaiSlM4kfkKkgeR6xTuiQee/A16l14phbWpq0qjyJ5PqzNH5FQU1SJEtf
 Q2n1ow6mqtOgybdl89I1Q3AWlcfIcl5wCHO2vtg4egbOhsYWyfsvOf4lPfwmGL6bVPUB
 P0trq8Zr/5dGxWcWKt8hMV1tIeppP3Tj6+6U2VQ+C41ByxO48rSvCeMA5Gmd111y07ak
 WCPA==
X-Gm-Message-State: AOAM5319BqG4MKs23H34Y41s7F0FH4HZF9LsDCLzzRIFAC0G3O5AYhwj
 wBpuPSeFWTJsxMYT+VZD0+c78N96jA/dZmJuY2RKwA==
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr6730786ejt.482.1619821180423; 
 Fri, 30 Apr 2021 15:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210430163309.4182922-1-clg@kaod.org>
 <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
In-Reply-To: <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:18:38 +0100
Message-ID: <CAFEAcA_2fuec2KiY=ayUf6e1y-nEuBtdU4KwL5un_mgaBaXrcw@mail.gmail.com>
Subject: Re: [PULL 00/18] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lAWJEv0gebXe

On Fri, 30 Apr 2021 at 23:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> Same thing is also a build failure on 32-bit hosts (where the types
> are genuinely different sizes):
>
> ../../hw/misc/aspeed_hace.c: In function 'do_hash_operation':
> ../../hw/misc/aspeed_hace.c:128:49: error: passing argument 3 of
> 'address_space_map' from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>                                                  &iov[i].iov_len, false,
>                                                  ^
> In file included from /home/peter.maydell/qemu/include/hw/sysbus.h:7:0,
>                  from /home/peter.maydell/qemu/include/hw/misc/aspeed_hace.h:12,
>                  from ../../hw/misc/aspeed_hace.c:14:
> /home/peter.maydell/qemu/include/exec/memory.h:2438:7: note: expected
> 'hwaddr * {aka long long unsigned int *}' but argument is of type
> 'size_t * {aka unsigned int *}'
>  void *address_space_map(AddressSpace *as, hwaddr addr,
>        ^~~~~~~~~~~~~~~~~

If you like you can repro this on the gitlab CI where we have
cross-build jobs for the 32-bit targets, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/1227559504

-- PMM
