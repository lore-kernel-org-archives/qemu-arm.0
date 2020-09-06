Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2731856lfc;
        Sat, 5 Sep 2020 20:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeeuvUJAzdsfDJrTWHETBGzUG0wryEABOs9NzXZGkZSn5K1yUHmL8YuMVvTxWQ/A+lYVY8
X-Received: by 2002:a5b:14f:: with SMTP id c15mr3032520ybp.90.1599363964069;
        Sat, 05 Sep 2020 20:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599363964; cv=none;
        d=google.com; s=arc-20160816;
        b=qQsVAvMkU2FaJD2S02EoF2D8RJDVfdRx2bzZbvhrZ7M/BvDuFs8m9/5IjxSz7XP+x4
         GgxnVtaBp59QeLAWHUzR86mCci4ZbjINoT44dAYcyhytft5RYh4qN7yIa3kPvCjbAekp
         cTOAEvCEQkgWPDGALPf/sr0dU+XSCsNXcjgUY2d3HLjZVLKRYyLmQp4ao/Q2Z6RIAmwX
         I8JwsMqr3gzVkBKCSKLnps216mMcuYaTZ8UVGpeCHl6qJ0ww2/MZ+2IUZDHMVNNcVWaj
         zsjxmifXNe32h0u6fywp9WcvL64dRiTMUCiP9pFEq9kVUVmtvHVWDitODOT3i/YOTuvv
         QFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=t2VnuRpgNp/JrCV+HPg0YJnBxE1cK2hkQDvKZ7hGxfI=;
        b=K78dv3w6ESbkE0SxfIv7Jqb+JRATLwopcdNdoDaFeO0JQvLuZ5+Ik0yUKwhJacHmc/
         BwvNXsAbZ6lZPbdmRwWmTolQolsHPzjC0kyZ9b1KgrG7bZdz6jvR+rSyPEDRp3fMlwpn
         cMFv+Cg8wTJLgx3lqdm6jsO4XKtUoVwZSq9FE2VR1pPXpHCulreoF+qAsNzHC6pBjiMb
         8NXZ7+ovZWsRx3nEUOgA2o9CNi1hqTr82e3b0OOAHTKkFP+Elgu9jYs4Pkn7GYRFn8wY
         9UZHbwXiV7vvWR7sdMMTLRBCgGS8ujgUqjID5de6gYzZkBZOzX91A6DunCTxFdSOP5Pk
         8ETQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qXqlIx8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si11122698ybl.146.2020.09.05.20.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 20:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qXqlIx8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElcx-0006AK-EG
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 23:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElcn-00067W-VR
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:45:53 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElck-0003Yl-W5
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:45:53 -0400
Received: by mail-pl1-x641.google.com with SMTP id m15so1818751pls.8
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 20:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t2VnuRpgNp/JrCV+HPg0YJnBxE1cK2hkQDvKZ7hGxfI=;
 b=qXqlIx8m2fGiZiZp/aJ3cCrMKdMVDosOHIWk2+vzObOwEmRI+dz+AmtMp4GbJRHt6B
 yaNMMKrmpQprkuue+ZSsFI3pfgpvrqoHzB2GtzKVLEXizuDR0vviTzWTEce8/HFd4SHQ
 QkxLui1Ode1cw3ga9zxtXlG2AtiSHYuzoUWmTvVSiEjIc3J0arQ2A6JXGEMMyL3rlyKU
 ufh1AQxbuU2H07Ajf0/TdZUorTeH38eGZDDNBtahM414E4eLuuzGg00sfYNPOvcEWpsO
 1yS4xmx8zf50IEFyOdZMshc7RG1r/WU2St4AhVUh2ULfwqXX7jvIjZqSFTzUMy6CCDjT
 4BVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t2VnuRpgNp/JrCV+HPg0YJnBxE1cK2hkQDvKZ7hGxfI=;
 b=gvM8xbSKevK3valG7dVkK5TGYrbg46dSvd/acQAgf3Ltrx5DcYflLm34GEj1z6iDYY
 0U5s21ZL1NI6gAoGeqXZ6uU6VEGn54pPd490WRmPTzjrxmsprJMp/4j1nZ6T+dXfb8R2
 w5e4abHLXLuNHhkipU60pPSmwkRznHhoMRL/ZZc+JcWP7nPQbqA8sK0iwzJULhFPS7ly
 tYuMhAcpqSxormRTLpM60TbQBiBQN4dqA4mswe7kw7qOAZVWuil2+1DSDj2TszWG7FfE
 LLij2qc+3oRdh5Kxuw2H1NOCHsOPvuLw7xFKl5scN7waY+dmSjfUFNzFBj7YwKhWIsqA
 l5BA==
X-Gm-Message-State: AOAM531gAMSt+/B9JwcSJ4NhnD/WWjGsYoweC+m9k0UdbMoNSZgmShur
 xi46f+lm5S14By1f3vaydDTYTw==
X-Received: by 2002:a17:902:a9c2:: with SMTP id
 b2mr14583057plr.56.1599363949849; 
 Sat, 05 Sep 2020 20:45:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w6sm8812245pgr.82.2020.09.05.20.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:45:49 -0700 (PDT)
Subject: Re: [PATCH 02/13] docs/devel/loads-stores: Add regexp for DMA
 functions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf52d63d-047e-42ac-5336-829ae3e9028c@linaro.org>
Date: Sat, 5 Sep 2020 20:45:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-TUID: tiHwXsBj+wXj

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/devel/loads-stores.rst | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

