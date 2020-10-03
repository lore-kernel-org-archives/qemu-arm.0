Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2595648lfq;
        Sat, 3 Oct 2020 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoip16y18s4DqVN06gVO5BEi1SUJMcnFpfTxE9VUMogl0xorbtzVVJjHjKVSiYvsT88WGp
X-Received: by 2002:a25:6811:: with SMTP id d17mr8900771ybc.62.1601743392655;
        Sat, 03 Oct 2020 09:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601743392; cv=none;
        d=google.com; s=arc-20160816;
        b=j+Xu4S500YldhsCr9/EhME0RANna7Ucy/uxtyLZvA974eiQXM9NmmcUYVfAP93wprk
         QhkZoOaxaPfseK18vlohCfhvN0pL2oExOQxlFsO0BCFkU/bNaivI9LqTxxKa58SIAapw
         Gwy6zSYom1R56Uax3TvWjHA4UzJYJohOi5tHWiq/ZJqUbYdmSmKGO2J6kM+kfJmX5Z8u
         vlx15O525u7udoqkIe5kKwOAP5d9K1tq11z1NMKdmheCQt0N/UW7ipnySnm4ycAeC3Ap
         yZXz8dHYEvpC10FmIkj7a/7nDFKJpKuu/ByxA5QLSLaxasPq3nvszr9NL46gBbDkrJSa
         u1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ni8ee3wtztSFtc2ljg2vGC6NqGqqRASoEoVa4fKfims=;
        b=D5aXwFJ/noQ6xoHJjhHlVv5c+SnpMYIplZTg3ZslAJPVnOKp/LKnmJmulp4gY31ci8
         uvV2/xopGRKSQZwgavngH9d6xz2QbcPWSocmgkHvq1g/Mb7Ery3H8oN5eni90m3wjoje
         3rnTzy9bzlgI7lPRa0PlhkT2sxUdcKWBuir1A/8dRz65VpJ5i0xP9eOmKBB4KPFDeQ63
         e/2gM6R+4cc6GaIB0UaeTXFBhOW2FELN651N1x/f6694Qn31Uvt/VNANFso9r6HyubQL
         i5HZ6h8tDOssgOlQYy7wbyPfvR4ndtHY3EArz5GBLjyGoWu5JJymmDErThsdsCk+ZmQj
         pu7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XX7oKf67;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si5617595ybq.458.2020.10.03.09.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Oct 2020 09:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XX7oKf67;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOkcq-0004GL-0E
	for alex.bennee@linaro.org; Sat, 03 Oct 2020 12:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOkce-0004FR-2s
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 12:43:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOkcc-0005Gw-9U
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 12:42:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id x62so15197oix.11
 for <qemu-arm@nongnu.org>; Sat, 03 Oct 2020 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ni8ee3wtztSFtc2ljg2vGC6NqGqqRASoEoVa4fKfims=;
 b=XX7oKf67HyYC6ledhKKzLNUsoz77PzyzZhdKW08hAeucV2Sqy2h4xfbHIEfWQrsQIz
 qMsfuRWrUQIyOIjh/QTVhak2M4g9RnSOiRUy4bR58G6CcfZqLpAyd9azspud4RfCXtDW
 Ge6OCXC7jF5Ld1D557RdOsWob1pUvqH43jCe4rNK3LRmB1ZEN0dgVTB2mP7mMrqBbIQg
 iFMBeB2g6AIhQg16JYESurAq7hjLwOWUAewWcevHnS9X0tN09CAEdqQaxwyzJT/NCrAR
 LNnrBNOvlMkiv4ljALAD7s4MaLfZSpNr/PaO6+PzRW83sEVyq9LLZhePRSnQtDx66a1V
 dCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ni8ee3wtztSFtc2ljg2vGC6NqGqqRASoEoVa4fKfims=;
 b=LuGIMpS9C6d7xXhWoBjlPki6LcOmhE/L0Oz85F3TcUMCTQy/TsF6O9WaBb1U21pUM9
 OagcI4vybXG/KQFv4C9YqNb4til3Qol5Odzz1jDznZ3IR0/IFMXUI/K1Les35Sb3rp1h
 0mOnv8cDKrKJSFEBPE/btgAoeRPmrL5wcI64LS78hJs9qrYo4tUHPvDqDVKq44eLI6f/
 6n3gQJEz56t/qmoIC4S+0nXE6AHOcNY9CzaGBkDr6snXJX+9DcJ1d1DDyx6mx8SseOkF
 t6m13SVxwDuS7zWAPt07D/CnIt70koAUVYKh9ElO5JxB7fWH2HZ5usj4+ISIQwJcLL2R
 jp6g==
X-Gm-Message-State: AOAM533H1Rul1YvusxxjtKjUbNIDg9LNPG08mUWJeVqtvi7NuwIKwXqG
 MwC6giurkIJGoEuKBSi9TrLD3g==
X-Received: by 2002:aca:31d4:: with SMTP id x203mr1060803oix.168.1601743377203; 
 Sat, 03 Oct 2020 09:42:57 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l3sm1377682oth.36.2020.10.03.09.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 09:42:56 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] hw/timer/bcm2835: Rename variable holding
 CTRL_STATUS register
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201002164216.1741110-1-f4bug@amsat.org>
 <20201002164216.1741110-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed65d118-7bd8-4044-ed90-9486d9c4e9eb@linaro.org>
Date: Sat, 3 Oct 2020 11:42:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002164216.1741110-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.252,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQVD5CA+zTHc

On 10/2/20 11:42 AM, Philippe Mathieu-Daudé wrote:
> The variable holding the CTRL_STATUS register is misnamed
> 'status'. Rename it 'ctrl_status' to make it more obvious
> this register is also used to control the peripheral.
> 
> Reviewed-by: Luc Michel <luc.michel@greensocs.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/timer/bcm2835_systmr.h | 2 +-
>  hw/timer/bcm2835_systmr.c         | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

