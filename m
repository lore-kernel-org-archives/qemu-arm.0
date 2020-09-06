Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2739015lfc;
        Sat, 5 Sep 2020 21:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZnFTVzyeuKezfmsLgQiOmaVM7MyURWEVcNunB5F+lzTmfsg9UDd6tXepTifsqwhX47Z+g
X-Received: by 2002:a05:6902:4cf:: with SMTP id v15mr19887480ybs.373.1599364969306;
        Sat, 05 Sep 2020 21:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364969; cv=none;
        d=google.com; s=arc-20160816;
        b=Ie8JLrWZb0E0vSac0xwuceYMLfsEymSidOns1dIaMnYAzWn2FWbFJYfgX4OMhsNyBn
         DBpq44TsFre3XPlDP0BmAmJJd/qN3uyd7UyW/7T7BP/SOnTal8uSKnKglE1OwgAhe9NF
         kRG5JjZLpLhyx7I68yXwNexeNFy20/Fx3AQrpDPx6wqp41z/MjBPdrIBVcpn3rRdb6aI
         pRIGA5F9dRsxNxZlZIIuXN211C4Ih+IA2FI22Smr/GMu9ONvjO3BtDtlZ5/4lyOcUCGa
         GrBil8uvqQt6hXbBJmP5qP5clbdpjQ890hf82Ew6XDrrL+2bsTaVATu7kYt7rgwqeOOd
         8ddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+FK3z7SEtHHMAHcUbWz3yY5WEnySEdB15eOW6FkW6Pk=;
        b=z88uuMQ9c1teY7o1MFLLax0IgKkDrogrIzDL3qN4IyS2ncXAQfMKQQ1r0YqyyeoPjH
         LE/7x+WakHjDZocOrlmuQvbaKIewa6jLiwFrdAH6Tyy0TmB0n8zvAVhId1bcjIYRSGRL
         eThA3WqcjVOwgr+dMrNUg7qk7Yr1qAGuU5rat4hQ2kMf3CqGYimwrTcmYSt1A+O+OAI+
         xMAFUy6coTueaFqFA5ZP5fyiXNQnl6QM/29/nECQXAw3r08/LIAHHmqHFKzfFQh38etR
         1DQ1d4xFqZdAK0cnk6Dj23sZdaXHCsN06BIMD7Gc1rS3EXm+gXaEAnDxsIx81sxl300E
         o8KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pTO2s3B7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si12147710ybm.129.2020.09.05.21.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 21:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pTO2s3B7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEltA-0002at-O0
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 00:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElsR-00023t-GZ
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:02:04 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElsK-0005Rj-Ny
 for qemu-arm@nongnu.org; Sun, 06 Sep 2020 00:02:02 -0400
Received: by mail-pl1-x642.google.com with SMTP id z15so2935789plo.7
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 21:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+FK3z7SEtHHMAHcUbWz3yY5WEnySEdB15eOW6FkW6Pk=;
 b=pTO2s3B740aWaEYgsDYQjq6N2JpqRdS7uvxP/5LRTU2vnjGq4qfHiTRI7QNeQM2DgX
 Ks6iJYPzZ9QRTB2/nw+SznP4R/NNxuAZQGtvEqHgMANlCQogMryrXHeoHXB4aApyxtSI
 SU4CmgAeOtdFkJPk1I2s5qDQt7ABtrNxtK6YxwV1RO5370E1mDayVKwBAg5j6m39Hnbx
 hfuaNctH1SadDOjG0bMy4C23R3xK/M2ZOUwG+q+dQ8531kgKrOSNK91dyD4Ktc+qtFMd
 kKL4o1qH9qfe/T6H4qNT0wkL5lcCSd3b3leSlw1QneyFVdx7L6l+abK2eD6GxvZyDbxT
 eRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+FK3z7SEtHHMAHcUbWz3yY5WEnySEdB15eOW6FkW6Pk=;
 b=ccFAyyKa7txNMpa8jRqNFWTrp64vRzJM9xcSqcD00990+xVk3SVDA88iNI1crikiF1
 8PEdWecBAX0NC40D0GXMmKQLJCrSzaHBnatUVBHfh1jZ4eqrp/CJlbTvJrnkPk+q8Ba8
 nVxYdRKhIBeqvecvGDbAVIuRQodBvrQtfu+2mqnFO5Pn3hOK/3C2oRYIHdnc+tpqw1IW
 Aoody+ciTFhElYiAiDhHahBDPKWI7Fh1JdVsk2E/olpfwePDT+DBggZnocYQjSt/WdmJ
 9TwmuiIUdXASTMg69FiJx45bJZHvIB3Y0+k1IRZCZoS5iVHFZLF3ZHT1U4J0jQJyO32r
 vISA==
X-Gm-Message-State: AOAM532M0eg5r9kow77pJxOrDaModOFr6hdDY5EN9+ridBh/F2l4/JjU
 JlZx75tbu6bZ4OXEmNumiW8J5w==
X-Received: by 2002:a17:90a:de09:: with SMTP id
 m9mr14617064pjv.231.1599364915228; 
 Sat, 05 Sep 2020 21:01:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d12sm10924564pfn.146.2020.09.05.21.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:01:54 -0700 (PDT)
Subject: Re: [PATCH 10/13] dma: Let dma_memory_rw_relaxed() take MemTxAttrs
 argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-11-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a73f8e2-85d9-e6e8-255b-3644406352e5@linaro.org>
Date: Sat, 5 Sep 2020 21:01:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
X-TUID: V/+AZO3DItI0

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> We will add the MemTxAttrs argument to dma_memory_rw() in
> the next commit. Since dma_memory_rw_relaxed() is only used
> by dma_memory_rw(), modify it first in a separate commit to
> keep the next commit easier to review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

