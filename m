Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1611564ejc;
        Sun, 29 Oct 2023 20:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2tyFStI5GTlYbC+4E5RKglXHzyTssV7fTLWmFC71r/Ng0IMupw5ldZLzOgFjFx6z7GX5l
X-Received: by 2002:a05:620a:3c4:b0:778:99d8:6adb with SMTP id r4-20020a05620a03c400b0077899d86adbmr8320759qkm.44.1698635939225;
        Sun, 29 Oct 2023 20:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698635939; cv=none;
        d=google.com; s=arc-20160816;
        b=aJfEAoezJy2wplJ3PVx1t5YwxaELdsdtPcRPAVpyU7i78rkcjk9aDz7y4FQiGL52jp
         c+w/dXNFNMgFZ/kMgGTVyGXdTlZfUgpEjgwE3nYNfzGVXdwCAIwoXWkSaDonNrq5m5Ip
         XYecLcWg5n2ecEXZwajfUoRlJPVARViB4jeVZA7tWX+JNlLnWtktxo/unfgO6AakNP49
         gEW6D8kJagATFDCmQTOyiJNz0/mo2u6fBwzYBdzIWtdsa/uMtyKUnhkG8n0sAx6TXxM8
         pEYECJ+dMXPTe+ew1zsdNqVO+FtEBf2oy45QvjzZsRR8sYDB7u1k7WvziB60hezsfHpv
         sIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QXdjaUTyztNJnuqJ51DB8PqlITILxnd7HmwWp4+4IL0=;
        fh=Hg5GsWkkEURgb3z6bjzv30cpIevLjynGSTcy1gDgd5w=;
        b=D5ZY74jk6AraUfHoqEC4UafXy1W3WQh20Courtve8YjhbsqZeU3EZ9gFhnh7vT6z55
         tPkezBcvTWcEQ1DakYfWfQMAKAq0+5qPAwzNF4P8qMGYyecT+fEqTTH+fIj3uyfPTDEN
         BXunTDwAK7+u9vua+W8+vWqhGq7qiCt2DP53wMLM0yy9Rvpu8UJyl1lsr8eCqCE9VKov
         Pmcfh/7erTvtyFcQ/f8PVhL2/X7BzZ1K5UotZJRGAcVTfChNt0RGLJFpHzyc/7GfmTpU
         fWPuqNPjaoRXmylQI0wf7rd2pBiRmsWtUtSyZyOOubCUNTo9dljNqGfmgzmqZcKEiOGL
         SHdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WfaKEtHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020a05622a120800b004181e8c291esi4959642qtx.381.2023.10.29.20.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Oct 2023 20:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WfaKEtHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxInn-0006Fr-8a; Sun, 29 Oct 2023 23:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxInh-0006BH-Io
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:18:49 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIng-0006CJ-3m
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:18:49 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso55266891fa.3
 for <qemu-arm@nongnu.org>; Sun, 29 Oct 2023 20:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698635926; x=1699240726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QXdjaUTyztNJnuqJ51DB8PqlITILxnd7HmwWp4+4IL0=;
 b=WfaKEtHxjL76cpyfFBNVOk8VEBvWaoXF0guREoR/uoQ1uykIMGZvIzdYJPS3OZeyGN
 rn7p+U1UMxLe2cGFbUFBK/rB/BGaVtJQwSAZEz6vCTUKTzPN1CLPguWhWiZVlIhQ1BOf
 oZO+ExPLXC2e6Mv9uOWalVO2n5QNiHdSQarM7OfxiyNGBlOrR54si/MBrrIfpBThruji
 3Y5AOapMn4vvkClt7cyptnFr37W+AdNdgI5gqgtv/gmHcZ8jaUSjtIITg14KxhSTQRM9
 v1BWlcfGucjMki/i8r7U5JPEP4GbaHpntcr0jU3iUVdU3w9IxKH2GlPVCe6CLXiyPaHr
 ttdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635926; x=1699240726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXdjaUTyztNJnuqJ51DB8PqlITILxnd7HmwWp4+4IL0=;
 b=fhLxivDSxCv1W3omv+X/xnYPhjE9e/j1m4sYNVf45jkEeRj/4IR+h6NQKsO2ZdK107
 saOZsYMc4XzkNLuNazLC0HF2zjzVZJhneHqlKs0bo/0asXPo6e9DCc6208Ltjr9CBMIo
 433+QUMnjaAo0O3vxdewCx0SThFc3bpZEC6gzIGh1qkylWMk4eVdJELPhtVxp8z/DGpI
 JoFwFQwuRmsyQ6Pu2Egb1bQdt3lFpwIwhtkEDVTLC0QwMvBAN0aKU6roJ8VwGlllo5h2
 7il/a+ZnfKN9/9LCHNPQH7xLiIkue3HS7uyjofwdPIp13BTpKoQOuZqfvyvQorxcnk2s
 VB/w==
X-Gm-Message-State: AOJu0YwoArkjKfZtz4lRekZ89ZpF3QbRSC02hn+V/qtTSKJeo3yCBSX9
 r2QlrIWMgJzK9xB2mCqEZ4Wkmw==
X-Received: by 2002:a2e:a9a7:0:b0:2bc:db70:b563 with SMTP id
 x39-20020a2ea9a7000000b002bcdb70b563mr7667009ljq.32.1698635926035; 
 Sun, 29 Oct 2023 20:18:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b004063d8b43e7sm11584532wmq.48.2023.10.29.20.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:18:45 -0700 (PDT)
Message-ID: <5f764920-b707-98ca-e58a-1c1726145685@linaro.org>
Date: Mon, 30 Oct 2023 04:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/6] hw/misc/imx7_snvs: Trace MMIO access
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: Lcjzp2sg47T4

On 28/10/23 14:24, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/misc/imx7_snvs.c  | 5 +++++
>   hw/misc/trace-events | 4 ++++
>   2 files changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

