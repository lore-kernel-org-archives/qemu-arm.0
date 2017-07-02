Received: by 10.25.227.6 with SMTP id a6csp480320lfh;
        Sat, 1 Jul 2017 18:13:27 -0700 (PDT)
X-Received: by 10.237.62.201 with SMTP id o9mr34355289qtf.4.1498958007720;
        Sat, 01 Jul 2017 18:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958007; cv=none;
        d=google.com; s=arc-20160816;
        b=yeZHUNIQzgD0NKq8MorKWNPtnKqbC5Tb3Tx5yCBn8JNMIXbpV/FasX5KuegDCWwydc
         /OsNWgZFDXcPGgtkH1EBjfbgcfG5e+cAc5m18zFy43tRbrkXjfdVVmYMfbP2Tg4bMvjP
         LcNz4+AvNL9PqvXiQ0ni0RYuc8G86XN4MmHHAcGVEmxnm+qLftyJ2FNHWsYtSCQ5ydx5
         oZhcT+ghQOfqZrkBSA2zOH7zUdwTIpPfJ7GYDU8lhJ4FKiXs9MRd62kJTG6CgyKdJgvr
         xAJJy6HsLL+Ny3M0P5TIoN93voRy0o7ENX0Fk0yO/1qFml7JMRNXIfu/KCo6hRdaT5P9
         mZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=bCPJmaqI2TS1fcbEFY23BGpTNPFr0Tm90+a94Y2JhGQ=;
        b=kc1dHCJxV0aGUtgSQ86TosukujpGpbnwg/nhB54SwxKhEHkV7rqz7i7FX4EKkJ0qPH
         PiRflkTZuJZQmW4x8TieD3VtuQ8MJzSXXcqdBTuCOk4SNdWNLcQhwTDu+WXYB1/UJ9Rw
         4KtErXfkKDNw28O7Kc4MSLdOT6R99v6qjD0RD8PyJlBRD9UqxiJcHJ8U5x10xsDNSRgr
         QaT1AB930tqmxPr6E1StYTSSRCFvlRTB+qyH8v+LefMhjFiUdEIRb69M+4kvHlEJKmHL
         3/44v/tLe9pfF1ZFO/J4qUaFzOx52QFTa5+xOUL01x/A1hnkGp2HmQrTXBItmuQFk5Um
         G4Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=gyT3olOl;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id i16si11265744qtf.90.2017.07.01.18.13.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=gyT3olOl;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id 91so20069935qkq.1;
        Sat, 01 Jul 2017 18:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bCPJmaqI2TS1fcbEFY23BGpTNPFr0Tm90+a94Y2JhGQ=;
        b=gyT3olOlw8uSVWFice2k9tubXpUQA4JbrnU89nbUXeA0RNkzSJwGtETHoQn2e7gxBX
         myUt6ylhpd10FWGTSvQJxKSH17S321oMeswrZVXFMxFfgsj3dqHQwtKSkTqxm3mKxLA/
         F/keCKX/nXLA3QIjo/wWI8XR9KpA4pnhbP+BIeRrJiUmNtfYHu6Vt6R3sCXdrfXiUY4V
         fgE33DtMRRtzjEAjh89TO0M7XQVgo4H+dEOgb6WDS7EBY/x3e8YjARpa1jFJHZmMBtOP
         HO0OJMId5lhW7cg0c0WHewu5pk0ALMgHooa24/OSfjSMAWCNMAIvcu7fQbGiXTiYt6oG
         DU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bCPJmaqI2TS1fcbEFY23BGpTNPFr0Tm90+a94Y2JhGQ=;
        b=pVK/dXnMzSizdKfDlq9S0yX2m55CnKtltk60N7mJ0mREJ4Pwg/mdFP7k6XZeUsMAgw
         78oLA4wq7yynKqbHvZupiz9tX/AvgAnPd9/g8SujwubYB2q+8y7P/az24FVW3VbhOYcJ
         OtzVQDmYhyk2gS9ZcYww6gpYK9fznXIgK0cKzgMTGUyBFEgVZ5OfpK2zA/cv07e2xMDw
         6VTQqWjUsmrkgQtzCSBhREPKDjfIwBgtVEcDug3MMWipRP/Dzn/YO55va4JdfgiB5PR7
         Vk+FbYtiyxUdAkdjPkJwgmGuXHv/sVBETsUgpMduioKOlOewtKrmcMCAd0gLfTE3kSwv
         heaQ==
X-Gm-Message-State: AKS2vOzdCAj+tpx2VFg0/WMlwWu1HoNPOBLo4vsmxlqbnIPfK9cLBdSx
	zDJmR+4Mh/t4edehz+w=
X-Received: by 10.55.103.194 with SMTP id b185mr31605429qkc.55.1498958007178;
        Sat, 01 Jul 2017 18:13:27 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id o39sm10546945qto.10.2017.07.01.18.13.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:13:26 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 16/29] target/arm: [tcg, a64] Port to
 init_disas_context
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865607253.17063.18194249796068858104.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0a119583-3110-d3a7-4c2c-c2b0ad9d5798@twiddle.net>
Date: Sat, 1 Jul 2017 18:13:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865607253.17063.18194249796068858104.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: R+0cjzshLj8Z

On 06/28/2017 06:21 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |   36 ++++++++++++++++++++++--------------
>   1 file changed, 22 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
