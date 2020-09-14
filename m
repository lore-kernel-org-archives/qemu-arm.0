Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1870221lfq;
        Sun, 13 Sep 2020 18:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCrju5EtSFKnXc0JpB+cMDodwoqJQGOOxATCILeKy2B2a2qrChJBb4fCKNWJiSNLEumKZo
X-Received: by 2002:a05:620a:74c:: with SMTP id i12mr11130651qki.438.1600048028132;
        Sun, 13 Sep 2020 18:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600048028; cv=none;
        d=google.com; s=arc-20160816;
        b=i/5ZTmNydgemkbyWzNdIGXDAjPp1QoZfhOiPyNg3Yi1mPvxLQjH8S9EVjz7kgQoJrN
         ISI68kTS/0on/xwflsWeh+O+UftGHJoex5jmFN4SlvzSJ8oT2pTcbs5ADyc9kLRdTFPH
         9PV2XS0x8eChAvbpxSx53v91m50I2LYp6V3z3MRbwAQoDuz0pGJfNHPG7Pj4q1+lusPo
         0J984hD1wo/HV/mZpMQr0T9ggRyD6rgoDXkaspVGvdsBzWQYMZPUqKDNMQfGzTj9qNku
         3XAwT4oGWG8k3vjmOPpzm2WOynq1MhfNXs4giqH/Q33G3DQ8CiDiKRv8hr+W8PcDZ3jL
         tIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IprehSuAYTMjwyuJSUvS4u+1YaptMi5itIJb0dN/3Ec=;
        b=reP0jzJNJdy1EalsqZpaY6sZyWDH6/9+a9nVhEcCUfIOYOuFNOd0UlwgMKje9Q/XP9
         c1ddE8A3dq2NQ8XsBKzmU4/KgFtvUWONLdfoQt/VLWEts+1jY1IsElSa5g9wkbaJFw2f
         APGfgddiVfMgsmzq5aysXvOL8QaRQT9+pHQbVQfh9gf/TjWDj+r6hZ2mey1UxFr0aAOY
         rsKQXW6GupiNNeHmYsXXKDCp64vf0+cWcdKJRVeJ8SvBsLHvrqV9h071hBIzHd4XEDtF
         H84FgTVuKaC6ezRCVIoeqmHj0eGJF5jtczs+f3d26QWvJdNXhf9XsjJ+MHO40usZ8F98
         bJ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flF+uah8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si5764287qkj.95.2020.09.13.18.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Sep 2020 18:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flF+uah8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHdaF-0007tL-K3
	for alex.bennee@linaro.org; Sun, 13 Sep 2020 21:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHdZo-0007J2-8q
 for qemu-arm@nongnu.org; Sun, 13 Sep 2020 21:46:40 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHdZm-00077Q-PA
 for qemu-arm@nongnu.org; Sun, 13 Sep 2020 21:46:39 -0400
Received: by mail-pf1-x442.google.com with SMTP id w7so11231436pfi.4
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2020 18:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IprehSuAYTMjwyuJSUvS4u+1YaptMi5itIJb0dN/3Ec=;
 b=flF+uah8fLu/B7cgmRzCm9kR1VYXxPnXJdp1eWyaKdZiWmBxRPm+k4+Sa/YQ3qegYl
 P7JsETEjHa/Dgofj2rcAtJOTtMfpc89DXtVX/pQZj3/HXMxP6/YmCmkKr6dnnnyZE9gG
 5/FTonceJYtg6QVa7914BjyCbO/7rXGYzW7l4nyq+NNjfRpw5zAxxHVDgglAdn9a8beS
 4B7YH1Wb70pKNsViDNHjlHBAoCZbBCWAEPPabK3A9BtKnVyfFedDsdw7ix9Gph9K/JKm
 Bx7N2XQRc6vd1pwJNgWlnBYnsF/Ac6sdvVoR8a92WXyc1hjxT7g+0NmxqxSr8PI2aKke
 JkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IprehSuAYTMjwyuJSUvS4u+1YaptMi5itIJb0dN/3Ec=;
 b=pV7YH/brhQkp1TD6jg4friMppOQ23MjCO7OIVFBUkaIvjEP6De1R6BYxi+4f5cRgla
 g7FrOp0UPiJh1kowqgdi/28NphV+z2/rTxjTJ815EsNUMHsI4zs5pnUtBwMR7XyifODb
 RawLV5QPQA3TxF6CqcP572l0EJqOC4btzj7B72H/kiZV0L23OXS9TlVGsTGrt+Op434x
 SKywQ/r1eit5U2k7T0i1eXX4LDwAkFKe129ED85c+5gDklhZKIuB8AZm5wOwoDc7Tfs4
 1yWQSZT2FKXY7FcXge/tzi8SacB1eEGNkq8OVbnUzyAVLCEeapzrwxmpKSExuxvJRWHh
 2DcQ==
X-Gm-Message-State: AOAM530gSLTqmX2bdBC5OkXtF4IMGmBU3ru0IlnBFRBbxcFtiYqaMN0E
 73doKmVq40BUc10Xjj05Q7m8Bg==
X-Received: by 2002:a17:902:eb4a:: with SMTP id
 i10mr11784241pli.109.1600047997647; 
 Sun, 13 Sep 2020 18:46:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j11sm6709263pgh.8.2020.09.13.18.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 18:46:37 -0700 (PDT)
Subject: Re: [PATCH v6 2/7] hw/misc/led: Allow connecting from GPIO output
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200912134041.946260-1-f4bug@amsat.org>
 <20200912134041.946260-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7d511a2-1a94-c602-39f7-e3ce733917a9@linaro.org>
Date: Sun, 13 Sep 2020 18:46:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200912134041.946260-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iO13nMdsO/Jh

On 9/12/20 6:40 AM, Philippe Mathieu-Daudé wrote:
> Some devices expose GPIO lines.
> 
> Add a GPIO qdev input to our LED device, so we can
> connect a GPIO output using qdev_connect_gpio_out().
> 
> When used with GPIOs, the intensity can only be either
> minium or maximum. This depends of the polarity of the
> GPIO (which can be inverted).
> Declare the GpioPolarity type to model the polarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/led.h  | 10 ++++++++++
>  include/hw/qdev-core.h | 16 ++++++++++++++++
>  hw/misc/led.c          | 17 ++++++++++++++++-
>  3 files changed, 42 insertions(+), 1 deletion(-)

Oops.  Failed to have r-b in paste-buffer.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
