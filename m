Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1733701lfc;
        Wed, 10 Feb 2021 15:12:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7gbHlW6toLq2K0Mcpt7gy5aEyYsSZFbbNgbw6JUjYFQ8nIp4eUlRfGNg6TZap6bDrNxra
X-Received: by 2002:a25:a267:: with SMTP id b94mr7899349ybi.277.1612998730956;
        Wed, 10 Feb 2021 15:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612998730; cv=none;
        d=google.com; s=arc-20160816;
        b=T8qq5GjaS3yaI0az3Q/kdzZnhF10mM+6w+Uaevh1B1p5F5yFqzzUOij9pgwwvm/nUI
         3UaqBEv82tIXJ2TpTRPCfZ1ICVanTcmP7b+5VCh1N84hSlQzVFSFUCHxghgTHm3b6NBu
         RD2nVHsfPIBFLULZ2gE0PIinNal8WaCBanjVPG/hX9PllOFsWS4mXgyxGRzAjlScgncb
         ahYpB8QVP7RQAqdPmqpk2QU9m2yxleAmqToELoTsvqs+QdkB5K87EoIeCwjRnFWYoDcg
         3NawlId31Q0wFFAnRwkTAzj0JPyKJ4nt8ntHNt/m3QrDy7VJ78fwseV7krcTP27DZ+n2
         bhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LLfiNbU3sAn4PR5p63LmLEJ4cyvvQ2hmVLUQWUf3KRw=;
        b=yryOotAK969AVT7KZmgu5depBZOcxPC7Qh+BBSWs6u8Wss4d+hqDFoSQwWUj3ncIHg
         AK9kTJEefLLK2qp4FqeK6GGaMMELzE11DZX9fMd4Y1iSfykOwKFOLi8dwWxNsxSFmTRz
         nPsUmKk5uNDtFO4UJ3WpniLebh4Mi3JeHePXt2v/qqTBwEG9145ADZ7SEvkbx5EHor/5
         MRIHKg6WEQ2ve4P7nlt39a+9m1ecM4aGyL1UmSchk+CjXDxN05h6R1YLgeVEe0cF07rJ
         fVt8X6qWYGmmN30e7xyz/KerM3VseWq8iPfQWSmCV81NhpprFgN4TNyiwnPaOR1OQcvu
         tqhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p6m57yff;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si3110546ybj.393.2021.02.10.15.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 15:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p6m57yff;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9yeX-0002mN-Cb
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 18:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9yOg-0002Go-42; Wed, 10 Feb 2021 17:55:49 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9yOc-0003Ow-EH; Wed, 10 Feb 2021 17:55:45 -0500
Received: by mail-ed1-x529.google.com with SMTP id g10so5005519eds.2;
 Wed, 10 Feb 2021 14:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLfiNbU3sAn4PR5p63LmLEJ4cyvvQ2hmVLUQWUf3KRw=;
 b=p6m57yffJAuG22S/JfLy0YbSPuHxs/iugjm3qVoeSQRhiuDYr2HNWYj6G/ws3lyZNt
 k43g8DrxJtd0iPA3BrDFGeO/jIfLrqMqqFo4/GbSrBu68YlRDn1Mm6ptJBDzxoZwhuY1
 fhrSnd9Xb5sEKAC/1qazSQRhccea0MNW/1WNcHuenS+mlbZfW2to07wX689botTRLvIp
 B8h5S+q79a/4x4LxD+JMvbXJy9LljWwPrQD3Ny1HLCliu4F1DlLt7EEIYmMfGW1p2fr5
 fTcO9qP1i952srioFeVe6oMxtDwIN06A4ihoNZD9/BouuPGgS9liC2U4mk3kt6bZxYGM
 bvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLfiNbU3sAn4PR5p63LmLEJ4cyvvQ2hmVLUQWUf3KRw=;
 b=In1P6TiXwPcyZA+79blftnlRLx+4QiIZ7pHW99vjliMPKKOdzn92SWdEWG0zl8IG1k
 yUOXri2QG2Q4QZt8UJAxP+4A9mOHCkHcniVe+5me83fqmDs34TZ7tV2zRVFh3Wf/EXl4
 Yd0e9XV2D6emrCNifTdwoWZr8aN9d76GWAlmnGqsEE8lX2UmyBe869gfGOz7h4Wb0rga
 t7kFZv70FM/tStCJqB1ZKneYa7o6aJScNxZuX/6Uauxni/lBTRBQVNzmI0F7yi0kBjsI
 aGk3gF3wRZ4bR3OWte6GJ2YN7KWqoZCjmbj1rKfhYa1Qn9OksekbmCFdbJev4XTZr3LQ
 YmqA==
X-Gm-Message-State: AOAM532PjGfmtsl7iX7Gdsz1OStBEAE6pkwYF1FKmEIimfdxPBPD9pZ9
 GmM7MWLTuehcQA+ThOJXl2k2YUwTWII=
X-Received: by 2002:a50:b765:: with SMTP id g92mr5439436ede.317.1612997739074; 
 Wed, 10 Feb 2021 14:55:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v20sm2190562edt.3.2021.02.10.14.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 14:55:38 -0800 (PST)
Subject: Re: [PATCH v2 2/4] clock: Add ClockPreUpdate callback event type
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e651d35-bda1-8236-4141-2debfa87bd81@amsat.org>
Date: Wed, 10 Feb 2021 23:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209132040.5091-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8o9kYYD9DaDj

On 2/9/21 2:20 PM, Peter Maydell wrote:
> Add a new callback event type ClockPreUpdate, which is called on
> period changes before the period is updated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/clocks.rst | 9 ++++++++-
>  include/hw/clock.h    | 1 +
>  hw/core/clock.c       | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
