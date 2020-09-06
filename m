Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2736403lfc;
        Sat, 5 Sep 2020 20:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcHDWcDOkyFVBFGECfGD8xsNZKAU2jEyOsna0eO3MymbLmqRhcIqtSf1JVS7jVfBmVuvi8
X-Received: by 2002:a25:4a8a:: with SMTP id x132mr20088097yba.67.1599364655069;
        Sat, 05 Sep 2020 20:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364655; cv=none;
        d=google.com; s=arc-20160816;
        b=Re2CSIDuCq57F0Tq/86ni1Pzc8wk+aYCeAaTwDki6hNMqVcYO23kW0cHjK5igo+Bqf
         6rnFy53NFr9h5VZTnhLG0s2LhCIJ5AE2IzAFEwp8FSQhmC+1wFDlGnqgnfext/hsiu7U
         CDdLviLw6jCvF78assC477VRH3uHfYliRFUzAe2beqzrtj1Yw7b0hSKrw5wxPQFHZo06
         yxG/TLYyJk57orUTn5z6PxjGhAET+UJ06F1vc/UytuoTkBpqYslVmF9Zv8F4D7uv1IQc
         O2+vcOWD96zJelbgBZXC7lqU2h8PAp5MfvMsuE7q7JfqZK0xcWOFikx5xqVSdaKiDdZD
         vZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RnqUtE4ljk8DtHfZkW5V5MIYZY7r2mGN0YOahYj8MCo=;
        b=p77S3JbA0YU4sAenwegraS4JWDS8QRcJBil2J0/+AZItkCadOlSt375+iVr1ov7cMh
         qiXFfzZN8A8yyfUwVeUAw9borcjh6iMOt8DvSVPnqpi8up9ykffT5RzFaajduqY/+uym
         if0HB/ewLXHPnUNIA25TkyywG/zdNm3NmC0xfw1BOGG6MDvF6jRP83RZUZdKsSPzNkOY
         08vtrx4P93mfQiPu2WyPy4TO1R59ROHWZRJjWbV+99r3sl6J7qej2lD03K2SFuywJaiv
         E4qMMb4cL1yIIUnl0VkwpdQ6SXnlvdPrt4MENQgQdgVdkx1Pw5WsS2vAuxrWOC8+FFJv
         dt0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tja8Xl8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p185si4944227ybb.318.2020.09.05.20.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 20:57:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tja8Xl8L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElo6-0004tf-G2
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 23:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElnz-0004tV-HQ
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:57:27 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:53672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElnx-0004ph-Sv
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:57:27 -0400
Received: by mail-pj1-x1042.google.com with SMTP id t7so1877240pjd.3
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 20:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RnqUtE4ljk8DtHfZkW5V5MIYZY7r2mGN0YOahYj8MCo=;
 b=tja8Xl8LEq2mkghIKXgo4a2qYj7UAdF9DnQ1ZGO35L8JjgYia2a0igWEM9hD6jbzFO
 dwz6lnVj4GK6fa6YBHrT3HqTRXfNzsB9Sj7/HWPKEiqnrawZX9aAjLZocKiuH0rtkqkN
 dWOL790Pf49SyBaigoQ6UXHSZKujKuZJd0rHO8A4mKFmXCB2dXH9tkKZOggj8kaKkOHg
 L9p+vHcWrIjH2JWQaLUUen0L306ca05an2DhM9NhJw9BcNYA32oY86kaTgwA+Z5KKIab
 slXv+6b2y/K/dECyTXMYA7F1hscbyeHAgl/OpSIHdnOjwIx1waNxiHzAATrXIArreH5X
 tWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnqUtE4ljk8DtHfZkW5V5MIYZY7r2mGN0YOahYj8MCo=;
 b=oIiRZF5BlbQdiAV2edZR6LBkHvJzqgUnayHHxykIkrVc61C2aQHnKUeXSwAKJ+iT6p
 a57Gy5RsaWbPUl+GOrc+IZFoxtO7usRSHEQF+NJd03O06+WKYqYKom+E9JGFJO4zEz/h
 MNH1QELh39+hSKdUFJTNLrbb5NOUUJCUQBMKbvt6OxzbsZoDMFP6HVgXV5ON69FTXVwT
 AeY7O71+Kakxt8rnFsRGeJVD1YlgBEEWBjS+KS8p+xKtj5mkbWBynJuxjXALHba09InA
 u63IAA/jXP2wYsNeMCKIBos7rsjOIE4hvOrXauKAzsCK9kJbW3Uy/eB6H8HHmqA1uQwY
 IgLg==
X-Gm-Message-State: AOAM53292wKKn56FmpV7NGSNFOikCPo/vNXJDgkeby+2Nk2hg31F/wWL
 I7z2b5cRco1dnlQPFvlgbOWZVQ==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr14823732pld.1.1599364644473; 
 Sat, 05 Sep 2020 20:57:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s9sm8665683pgm.40.2020.09.05.20.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:57:23 -0700 (PDT)
Subject: Re: [PATCH 05/13] dma: Let dma_memory_rw() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <67fa39bc-1eb4-50c8-2e96-2c399a42d642@linaro.org>
Date: Sat, 5 Sep 2020 20:57:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4rhl2SDTd4gh

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> address_space_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

