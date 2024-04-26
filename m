Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp488413ejb;
        Fri, 26 Apr 2024 08:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcKkEjI5s/JTEIA1uta88vtT+fcWBTb8uon8wUghZNxKF1N5gsJ5UAjwBzvT9aj28CuCXT
X-Received: by 2002:a37:e102:0:b0:78d:6b42:6c17 with SMTP id c2-20020a37e102000000b0078d6b426c17mr2699790qkm.76.1714146513817;
        Fri, 26 Apr 2024 08:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714146513; cv=none;
        d=google.com; s=arc-20160816;
        b=df+aytq6e6casfxaGk3dn+JCosjjLvjbaxAGuv2KX1bjxghHzGEGgBYbC0l8+L5gSH
         F/vDkWRUVcgc3AU5BpcCoRaItML8DUNNeZMfd754Yb+j9tej1E0T55OZGXvAELxP6kV1
         w/9mJzBSaqzEZScQsWqkSc8R2tIr+oN/iLqQGQqb8j+166dHv9Z2X9Gxnjo696oaVPrS
         cSLBY5IpQMuenT9gyCAgFVCOyMKiFiSkzuq37UyDON/VPltm5ZWy99cXMOFuiHQdeNAk
         uzaiPb8gOaeD70e6W38qxsbCidxUdhNxoXFvj0kIIzys0ytKLrdBcS4BGHKvQZ5U5xZG
         9UNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=GpHrMy0ZmUYcPZkZklsSZ55eNbY71dye6Cs/F0ZOHE0=;
        fh=cjYgWqJnTn9V0y86yKjZqtduwi+Gzb1lgZo/tjZf0qM=;
        b=TnL3uqRwT8HgaHn3TK88XmyvYJhWZkm5Ml23pfCcXu9r5T5lLZyWYspLJbgIs1WdhP
         CF3Rx1yvZVx76D+hWYAnyOaOvvVsplZMKdly2i7LTRO1WG+/5w+Kkv9AiTQp0jUJoFcR
         EcuMo2fgGcj7mnzLMbIY6ofYrkRG97tkGjdpWvxVM5QmC3stSZGTbEwI0rQ4WBknXM4U
         KY3ruyNsecVq9LrR9Wr3Czb5yh1O8jqoEcuzdBkwgQxkTBzUPsO8fRNGtzx+bZQNZe9Q
         ZfAV9/X3+2xQrI0peIZCm6200X9AoGLzIugUCW8n6vBRmjCXhLrfaj5W+K3q/D2ZpTmp
         BEZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMwUdbpw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de11-20020a05620a370b00b0078eec30de20si23536883qkb.65.2024.04.26.08.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 08:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMwUdbpw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0No4-0006gJ-PJ; Fri, 26 Apr 2024 11:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s0No2-0006fP-Mq
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 11:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s0Nnz-00065A-PJ
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 11:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714146485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GpHrMy0ZmUYcPZkZklsSZ55eNbY71dye6Cs/F0ZOHE0=;
 b=BMwUdbpwa4sTkYdkYsuqDw8nzSOL5fiGdP+fXjZRmeGq0XSAfVmLkXh+AwKkJe7yMJeOYx
 tW+Xn7Cwua7Hbqb5umxL7kWBC8TtWGQyZaz8zUbI+ZyA/HAu1kgFd1gIZbtWJuEBFbnApP
 whjkUayg4Iystvuf3wulKTR/rNEc89E=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-WoeyivgNP9GXdlnaHoSCAw-1; Fri, 26 Apr 2024 11:48:03 -0400
X-MC-Unique: WoeyivgNP9GXdlnaHoSCAw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-51b03d0d5c0so1898424e87.3
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 08:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714146482; x=1714751282;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GpHrMy0ZmUYcPZkZklsSZ55eNbY71dye6Cs/F0ZOHE0=;
 b=LfnlelgDCcnUrJK06GuJZ710Bb9iBl2zKMipV5Q/sH/CcacZLGTmfagk2YfadLeD2D
 VDe7Bgv42DOkXAXlnhs9SoBkSiKZlfCaQpQiC4HnLXO5A4p0hd5D5S5svl2AMNX41N2G
 lPcafNcpBqCLlwjORDJp+rnaw0O3Q5DIgjwOXqkM4tKpcG3UvHg2J2Ik+5qU1ISNVcSI
 +LrD0fQ2T05BxPi6wj7LkFnoxMkCjyaMulmDcSGohszLCIm3ac0T2w97IuCSpDDl5S86
 df5LaXRnVGQJP9ibpDDJq1A2Cn8EevtI7q8YSZ81u8ZNnPl/Eh0O6IZ//te6LzPc0WHl
 fe/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnWYUz2jWjqyuXs3qVw62xfTspJBwrkO1ObXBjwkCtv56ch6SeaxnbXOGczK5QQeFw5wK+kTwNF43i0AdvcrBzpYCzIho=
X-Gm-Message-State: AOJu0Yzl+IEZhzqhhG9IctgYyEjnGbcNCcAGLf6+LeDcF9iFrjeU7CoI
 ZataMFNSOapjhnFiI0xw5tgTMW03voE5OsrG23ju/ovU9v7eQyki8Yrd9/GabTMWYG7Ne+TNagy
 EqESDR1pn4INHctJGejgudV3bmP6my+3TrpXAvlxjM5JNJcKK/6eD
X-Received: by 2002:ac2:58ca:0:b0:518:e69b:25a2 with SMTP id
 u10-20020ac258ca000000b00518e69b25a2mr1842979lfo.45.1714146482214; 
 Fri, 26 Apr 2024 08:48:02 -0700 (PDT)
X-Received: by 2002:ac2:58ca:0:b0:518:e69b:25a2 with SMTP id
 u10-20020ac258ca000000b00518e69b25a2mr1842958lfo.45.1714146481797; 
 Fri, 26 Apr 2024 08:48:01 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-20.web.vodafone.de.
 [109.43.179.20]) by smtp.gmail.com with ESMTPSA id
 q21-20020a170906771500b00a51d408d446sm10741982ejm.26.2024.04.26.08.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:48:01 -0700 (PDT)
Message-ID: <9b582960-7505-442e-8a8a-9ae51b835d8d@redhat.com>
Date: Fri, 26 Apr 2024 17:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gitlab: migrate the s390x custom machine to 22.04
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Markus Armbruster <armbru@redhat.com>
References: <20240426153938.1707723-1-alex.bennee@linaro.org>
 <20240426153938.1707723-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240426153938.1707723-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.669,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: urPEf8lZMTG/

On 26/04/2024 17.39, Alex Bennée wrote:
> 20.04 is dead (from QEMU's point of view), long live 22.04!
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml               |  2 +-
>   ...20.04-s390x.yml => ubuntu-22.04-s390x.yml} | 28 +++++++++----------
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-s390x.yml => ubuntu-22.04-s390x.yml} (88%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


