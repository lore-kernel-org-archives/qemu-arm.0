Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1611312ejc;
        Sun, 29 Oct 2023 20:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhPcU5ttfVgjOUk+2fPqDONqz165kkLNI/BVMoATyLmXwNae4VXc8HP//x/3doHx3biPzK
X-Received: by 2002:ad4:5943:0:b0:670:6340:2b03 with SMTP id eo3-20020ad45943000000b0067063402b03mr3335519qvb.21.1698635893832;
        Sun, 29 Oct 2023 20:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698635893; cv=none;
        d=google.com; s=arc-20160816;
        b=i3Fp04UE5EUjoA941iu32Quk2J77Wr0FtQbmG0I4nvjHoHl0go610lwe6fdG6YUR9E
         X0tr2ldjqt/v07bENbkoiqMF1tFpT+pMvM4X2ZY3Om6/VGRQx1/Z/aYtOhG293HiW7mo
         JAjcDP/WsxGiJsXH40hhcXzsyZYE1EndnZtsEZ2wCgLzhb2rl4w1LEfaIU9P7HJxt3O0
         AE0rMQRZUCevMy0lUdRqn8t/BDZhZ4TwODTq3/+iOXrk6n94LAEjRUFlFoP4ET57u7Pk
         Fh3aNla5VZZzUBjQJ2m2ZInxECgTBCw8pepxuH6dpqdyB2iQ13XD7dHCo3X9RDV/MOkh
         PI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EZDWAj1ykkJn4R5/rp3f1Fz3f3ygHodsmieKmcp466M=;
        fh=Hg5GsWkkEURgb3z6bjzv30cpIevLjynGSTcy1gDgd5w=;
        b=A14rIhWOJ3q4IAe515H+ttq0r8TvnPWQ+nrVRBXDEayxM4Wo9280ybbjsw6yYStG3A
         0qh+b5h8vD4TFYjWw2KXbBaLB+qJXrYCTcwPLhJ1aXzTeh3WCA/wSxzbLdaqQwFfPThf
         Gg6sDS+V/CoOxpxoO38X2+5SVB7ZsV2/WwaGfEH4MFsBhsmywK+CmbDW9b1Mwhz9hY7x
         42/SmCkQxl+B+bHZAG5BSm0fl2CIcfDfQloKlgYLPANS186R92k1YNiFUe7Pmb9jguNn
         qtDlvPCdvnKQ9LvCtT+oEZxogWu22qUbjjZzd/9YmPIU63zTsLCmeNl8Mk72vYWn9jbx
         UZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zmIiWTzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj37-20020a05620a192500b00777722d8abfsi5058112qkb.244.2023.10.29.20.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Oct 2023 20:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zmIiWTzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxImo-0005RA-71; Sun, 29 Oct 2023 23:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxImj-0005Qg-Ph
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:17:49 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxImi-00067u-5p
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:17:49 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c50906f941so57986001fa.2
 for <qemu-arm@nongnu.org>; Sun, 29 Oct 2023 20:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698635864; x=1699240664; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZDWAj1ykkJn4R5/rp3f1Fz3f3ygHodsmieKmcp466M=;
 b=zmIiWTzD8gWWWFWNxjeQ/ZypjDUCDodRCTDY8nKLHBiSWJ1erJncw8LUPkVR3eijC/
 2JnjdorEqTUoaP3KZEK/DkrA8h5MomO87YBUs8DhzN4Nq9Xw3mmUDMbcaRUMQTM+dMsg
 1gGiRtCPSHhmentt/AcOPUR+IFmYXspmYI0wFT5rSbeyJHJbdYq9ixl9nQ3fnsz58KT7
 q08HsCYHfMHo1A7EGhWIO3yPJrPxU/nvC9NOxFzCVDF28m2oyvv0NSVbiFlPMzNR6e9n
 +xRDVbCKr96beN0EIJdNxP4A+27Zs5D4eaLKOQkSLbREu8YuV2VX6FccwCpJcwfghV1l
 Bgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635864; x=1699240664;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EZDWAj1ykkJn4R5/rp3f1Fz3f3ygHodsmieKmcp466M=;
 b=VnoeQcZE7eEpIDqYS1VR5u4xP5+pVfM0RF6lgu1LDnSznZMz4Jz77osCGg03zw5CEQ
 +nWifYwRKzBOj+prE/y3LA1j8V0nMwgispGlViap7Xbg2sfA5uhbOjl5AjSbGcCBbrP8
 FNvD6dtGLtZTqqAOo76kQ1X/5RFZhkQMFT6U17jw5ncVRoyKovgxtfu3HCMTzwxIGiOj
 fx0k+PtW1byOmwxbyTNC91tNnP5oi29KUVqAAqrI0ffw8MARDI2R3ic3cyj6xa5uqukT
 JdCpDqO1oBunUOhkCo8pDNFwhK9ToOWbfG7SuPkS5m90LjQyB1J+jXBIpWIXD9ytcX2M
 9UtQ==
X-Gm-Message-State: AOJu0YxS685sXe6VS0F68VXaalBW6JFRKTFk+2iD0qtOZqKKc0s+gEet
 RIdR/u9DC59juWpuhOPWNzDUmw==
X-Received: by 2002:a2e:bc83:0:b0:2c3:3c0b:d747 with SMTP id
 h3-20020a2ebc83000000b002c33c0bd747mr7670151ljf.17.1698635864024; 
 Sun, 29 Oct 2023 20:17:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a1c770a000000b00405bbfd5d16sm8002419wmi.7.2023.10.29.20.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:17:43 -0700 (PDT)
Message-ID: <2fe346f1-c76f-7b37-32cf-b9118037b235@linaro.org>
Date: Mon, 30 Oct 2023 04:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/6] hw/watchdog/wdt_imx2: Trace MMIO access
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
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
X-TUID: bWBgOhPUoAJr

On 28/10/23 14:24, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/watchdog/wdt_imx2.c   | 24 ++++++++++++++++++------
>   hw/watchdog/trace-events |  4 ++++
>   2 files changed, 22 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

