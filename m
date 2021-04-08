Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp773682lfr;
        Thu, 8 Apr 2021 11:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFU+kUNe9nl4Cdm6JN2uUaS0T57QaIQGjYaCklhCbjkjipNLCiIFjM79mfbHb88d8WkGwp
X-Received: by 2002:aca:3f87:: with SMTP id m129mr7195485oia.82.1617906941716;
        Thu, 08 Apr 2021 11:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617906941; cv=none;
        d=google.com; s=arc-20160816;
        b=GozhrCeTIZ+t+PgvzmBTkbNB0xW1YlsR86IZS/u2VxlIj5s9ody8ZYP23iehKlxY09
         O5RXQvqpCQXX+fbI8HLExBFXtwcURmlcO0ZmsllNAfr5jWq2+dP9DceE3K4FNznmoNcN
         KnAnV/+GKCwcsYiFBSaylU08JecWZKSSmlwWJQAUu6OH9bwRTq0ju+AmIezTGmFpRDSq
         /EZyxwPH1GY2ySS8A9tLU6hbuo8emLQrM8rruDXnyd6v+rSykgJAhsfD7ATJGd6DXSpd
         yRjQrHa8lpTV0F18F+VXHk8n4bvv5dTRSs6uifRJTk++Tx0mZfm9T04OQwd4UlbMD4tg
         j1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
        b=YGbIdEaclnr9DMRr6YflBDuoTbMwtSdnznoDPMW9azuNCDELuXbQOPtUoQulnFRSzs
         5hG3ykBsm8Q5nELv2eiAi9c5vZ4MW4V1gSJ9n/iAF9BLNp7UxlimAroQHWyU2BckOXYR
         LYh+5e4x8s67HfQIsFO3hVhNx1eu0Rx3L/cySn5DEN3bK/ahYJmKNrM2YHpJCqpt7MWc
         n8wlxBPjcyJzMpx5ugt3/qzo1FXsXec2DobcV8H4HDx1cePWSamRWIRfo2vn/cAL9UQQ
         iQlHbRHK8TS5Jk9yRH9fq5V/2TjP89WxzYNkTCwJJanF9zkTfO9MLXe9pLwClAa6dsn+
         9e1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EmSSTWyR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b81si760771oii.249.2021.04.08.11.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 11:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EmSSTWyR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUZVE-0008V2-Tf
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 14:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZTF-00074N-SU
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:33:37 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZTA-0001pI-H1
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:33:37 -0400
Received: by mail-pg1-x531.google.com with SMTP id t22so2042543pgu.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 11:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
 b=EmSSTWyRhagPmB4HheTS5kAyfM6XI24okBFT+svJ8KELdW+JEjHHc9xryV4VQukJhV
 4YwCppmm/KLoG2CVBwz2FTlwv5//Sai+H4Cdj5ItdY3ibLPTKiW0TOxLc0DoHn3+ajdZ
 8VMj6JFTpHhjdnG195ZEHjBksIwND8XGMfH18RV73RwqjPCwovhYP6Q9kOjPTZZpED63
 MnQfqQXrksG56RW5m81nfefRhQjPz7Kf+k5TD+DHEv6V7jhkofgolzmVtpI9TCXuLXtp
 WLXcIbXIuFgxlfECAixzQfMTaDPIpjZ+sb1Leue5VdCS0btraxvp5B8iThtxWIGHs6of
 FA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgwC6+hFz+TB3NYM6gJhEjKyEs4qCMPETynqq+oMI90=;
 b=WyhA/5CeVq4FkRMPAMD2RucJNutq/9CO8GoU2UszbOW8ZamJsDuJVRPR9ce7xL7FEk
 id32zn/Uej+WQeW/TcwxVg0A4gqxP6FdLmDpeHy0Pixs2iHBti05Ff0DAAc0NS6NIjV8
 B7DZBSq4zCj4+g6cWFapGQ8g39SkriXfwGDxiW5VDBSJkANe0O8FdPZdg8lRM2TPHP2q
 GkEyusgL9/iQoiESbq1rVMr4hJ8+QNYW/o+R+oTo2R4WeeC0Ef2R2yJPSJumTkv3xfLB
 SRzSDhmXdd7tmkU/q//Yos9p6prl5xbeHgwwse4jjOn1C2CBF6X7wbNo1CNGdHrnXvmA
 pbXQ==
X-Gm-Message-State: AOAM532ybniZLgXBGcOLZ4wJsOvGtdUvfxmiamucjEn1wIKDLFvFs93u
 eHpkkTPAHV6EcThsmNgZYzFiig==
X-Received: by 2002:a63:eb50:: with SMTP id b16mr9127532pgk.270.1617906810785; 
 Thu, 08 Apr 2021 11:33:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w134sm168281pfd.173.2021.04.08.11.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 11:33:30 -0700 (PDT)
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65ecfe1d-4a88-e432-7689-390c76e64d45@linaro.org>
Date: Thu, 8 Apr 2021 11:33:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pPiHb1Vv2U+8

On 4/8/21 7:07 AM, Keqian Zhu wrote:
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu<zhukeqian1@huawei.com>
> ---
>   hw/block/ecc.c           | 2 +-
>   include/hw/block/flash.h | 2 +-
>   target/i386/cpu.h        | 2 +-
>   target/i386/machine.c    | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
