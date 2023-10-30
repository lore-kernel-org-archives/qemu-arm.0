Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1613392ejc;
        Sun, 29 Oct 2023 20:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEI9nl0/iAgK04Mcnodd+2sTMn7RbNfrCoDSqjZCX7fCq6NwZeRrgKgWzYKH8tNiKA6h8R
X-Received: by 2002:a05:622a:1a89:b0:41c:dc7a:5e31 with SMTP id s9-20020a05622a1a8900b0041cdc7a5e31mr11710699qtc.63.1698636336150;
        Sun, 29 Oct 2023 20:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698636336; cv=none;
        d=google.com; s=arc-20160816;
        b=nL5aSuwB/ZnpVMUaQcDcs28ODagqJQMEjtsL7DCL1RunoZyiz3YslU6oGwHRdQjW3J
         ATtJKqaFJriw7a/oPwAFF9j9EIgJoFSJxw8FD1004kGMdqFycttQ4apXHMzOlPQPUPzF
         +73PAZF7Mf3XmRUDc/ov/s5ca8viXabQNxZGuV0cN5vMQpYpWv3TUA/ZqwahI0jI7lDp
         FDjnTluynZZw2C8TteSRXaxZmT6CSAgruon3BB6C9mKsoZgeanPtnLDlbldnWFoYwxlL
         rOPaLFX8SqQ9wyPbJ5JZKKVQRircKJMsi/uYVIkghGbusY5BeHF8PYB0j2mw4rgL6L3S
         1vyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CA4Cc5NcuqRSXETvF3rFlUbu9tsfX9/DuNOw/i/MYE0=;
        fh=Hg5GsWkkEURgb3z6bjzv30cpIevLjynGSTcy1gDgd5w=;
        b=U0P30BCeW975kwWqBMoUeEu3bV4rvXF+Jomr03rRYfHRG2haM9JABNY9PZSHZ71ZNc
         cabAySo2n0BcG8hA4UaKUYzl3H264GfmhgbuH38omjz6uvEVkkwuEq1/PHKxdcg/SL3M
         yq+US/RSprXeC0eR4XaEmBg2a9phtjHYOVcqJKzR7K21XXfGU3AF7VXRtfPrg799c5XW
         o5u7LNxKjZbtX2/SOBVFyhQDSRhCMBlWcPotIvH1agDPfXsx4Z5ctPDi5djA1NA3Q46K
         ZwmmGRGZbuDqrpQ1uUTzC2Aa0PJI9e8+JbGeod3IaTy2r1LsHZc05pCEzYJsnPonjFk9
         OVXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITPzb87m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac85ad3000000b0041cc53aac18si4811732qtd.644.2023.10.29.20.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Oct 2023 20:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITPzb87m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxIuB-00018q-RI; Sun, 29 Oct 2023 23:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIu9-000185-Ab
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:25:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIu7-0007Bs-6M
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:25:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53d9b94731aso6685794a12.1
 for <qemu-arm@nongnu.org>; Sun, 29 Oct 2023 20:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698636326; x=1699241126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CA4Cc5NcuqRSXETvF3rFlUbu9tsfX9/DuNOw/i/MYE0=;
 b=ITPzb87mrEgn8vjYIRhxyQVKCDcxnCiIlJ+X9kwVJK7QhpvqcteCtMs2XiWnahYTdD
 wFgsMEwv8t9XLNZC+htIVopR5A/OXnH3RzqTq+TCGXY3mnvDpOozXYhyn/9CVqInkBSW
 OFjF9vwEWLFo/GT3JoKhDvDfVwWV5/81qt57b/oYYvjqlFkixEw3b6ZpgPoxBvHDpGcn
 bLRAzmg1+06J0ex9ZW2aOtmCixcJQN22hXdLT5FHkxEFZV4I4qXo0ORb6HueQTdpL30T
 yiGoeMsoJW/jEmWsNRgfGFGKcS+3egABDYkaJ0WemvaJyL+sN0dWvFpUWYDv/rRqq84M
 ITeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698636326; x=1699241126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CA4Cc5NcuqRSXETvF3rFlUbu9tsfX9/DuNOw/i/MYE0=;
 b=qa6Klep2eMLp4BijofwCe7GrKQvXJ/4mtXhJmiUVGbzqhM158rBPgXuP8g4FpYwlFK
 fpi8lpJHzT9i3MxiHACIFETmO62MiPuEQ4rl4weA6mSCJOWnm7xyWKWecLliV7snXssy
 AGlEIxWpZLyYMZz/+PfjXPpn5HKzynzxUWcwIu3RpSlKYRI62dZTuQyInRw6ELQllp68
 xAaakkdHtUYsiF6wLRg/R73A+wJ3TB+Z/663x59ZRO5+VUCFJU0e3xHNw+FhEmCdla9l
 v+wopWWWjBGZSBcBoVPe1AqLnYb5/ScCIIFIXlt9Q+TSJIT8dCB8s7tQdI68x2CKQP/C
 Zqjg==
X-Gm-Message-State: AOJu0Yy1PuCpmMoUG8AHlkex4/MJwfVXJTdo/yrPmg9A7Qd4OmPo1goU
 8qHqdQGRUpk3KPC8cCKnsaUUOw==
X-Received: by 2002:aa7:c1cb:0:b0:53e:3839:fc81 with SMTP id
 d11-20020aa7c1cb000000b0053e3839fc81mr6230351edp.32.1698636325662; 
 Sun, 29 Oct 2023 20:25:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a50bb08000000b005400dc94f43sm5445469ede.45.2023.10.29.20.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:25:25 -0700 (PDT)
Message-ID: <43cd9b97-54b6-f57b-6194-de7a3e5e07ca@linaro.org>
Date: Mon, 30 Oct 2023 04:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] hw/i2c/pm_smbus: Convert DPRINTF to trace events
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: FfZyFCyPSFQl

On 28/10/23 14:24, Bernhard Beschow wrote:
> Let the trace messages slightly deviate from the function names
> ("smb" -> "smbus") being traced in order to avoid conflights with the SMB
> protocol.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i2c/pm_smbus.c   | 18 ++++--------------
>   hw/i2c/trace-events |  6 ++++++
>   2 files changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

