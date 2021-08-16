Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1453520lfg;
        Mon, 16 Aug 2021 08:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAtn1xD18R1upA34UXcUO6SZvL8RNQKFdoGM8ImCDuW9S2JWy+LGlIAKc0tKYNMSH/uKmq
X-Received: by 2002:a05:6402:1a45:: with SMTP id bf5mr20784871edb.169.1629126676158;
        Mon, 16 Aug 2021 08:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629126676; cv=none;
        d=google.com; s=arc-20160816;
        b=iB/2Itfbh+D/YtWMtJCLq9PyLerNRuw1Wm6qS3v08vqY+SPqZObnKysbTlZtPmaoVz
         u4zMjyamBW0hfLTFfTomyjAmIFdRGDlPRW3xF729Q3t/VvRAFOEykyPx9iUWV4eZaVIX
         WKOqmf+OJw6KZYVVfn2ts0qnAWaVTDKWertHdNskJM19pqyO6/n7DAxGHCEjmVGVg+Sd
         XsjeovfxjUbXcYF4+sLrr7bA4Pt9LNM46ITY+bY7u6fbuXAV60yPJ6d6DJPic3VH+Iqi
         WfStB57sTVuNloYOz1N8DgfITa/VJvMakRsoGWytgoqtCRPTur2ymSe2n36CWgcyVGLH
         rJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HKulyNk6YqguuigdtKxw5iXke5UTKiP1/4aJ6Jo3a9I=;
        b=Xt6hdvnosyVfLbprVnwoTR7moE76J+K08SxqELzVXTqwOGizRS+GA0ywsE/pOsNBuP
         EOrjkYpP+kPtOUqi/czx+OSKsVT2f3mx8/kzVegNmeRCMlIcaCEUsJzAtFK5cnn0diwg
         IWHnF4wDa9yZ1L3vZE0yInqSbY/3Y4dQ9dAk8R+EBjdLV/2CUCeUZHzU8vtvAFbUn1Vq
         OttoRcKxdfPrXeC/zOf9qdxNzriff9P3bwZYmXp5tbjcTa8TrqoZJP5xYWP+NhPiEABv
         24TkcWYK0QnUE97+MIxgTgmqrCUUxB7rF35mx1s8bouz+BitIQvYyX+2Lqn3Dtz4CxK3
         Y/XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G8Ko2bhc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lt5si10467936ejb.702.2021.08.16.08.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 08:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G8Ko2bhc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFeGh-0001N9-6i
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 11:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeG8-0000Xt-WB; Mon, 16 Aug 2021 11:10:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeG7-0003hq-Io; Mon, 16 Aug 2021 11:10:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id q10so24173682wro.2;
 Mon, 16 Aug 2021 08:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HKulyNk6YqguuigdtKxw5iXke5UTKiP1/4aJ6Jo3a9I=;
 b=G8Ko2bhcP8lqNTf062f7MkzIAJztHpRhrCajsbJVX2oLQkhAG5D+YeuUS06lQRlkix
 UTfiwNovlnL1/pw/VOgognpfWVBJzlnsBNRjKlHeUTkPerBBcuaPV1h2V1kcqwkaDDho
 8JlZ2ED9l0qXCtqnirF3XraSE2GF/6WbosECr1rMn4ufPGaPDdBeQm+FLrFMUG1qidr0
 MwGNxovmfFmsa6bAHA31KsJ/KVyiARKx72pKw+Q7S+W81ia/i3zZJJ0ts8oy3ESRh1EH
 sBxYhEKQQxJZiQ/LZXqhYqsZ2nfo8aUBjplrpxSwXeJkDeCJN1yGkQNrbAZcmKQiy10J
 mSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HKulyNk6YqguuigdtKxw5iXke5UTKiP1/4aJ6Jo3a9I=;
 b=ILuU99fVqNZ/tCPLhW97bIxIK2WsY9sKgVnKANHzOmNsaimExFeGyAnPv0DNCz0eSn
 vSTQbnNHigwpQYjZy1kvY7XLEbYcWv14NT7vK7OtqAk8gIjwAY7hoJD10Vv7xE7MpRVP
 7CIYON452GWKsd7D8RUA6cLUQw2UoeRNFbiMB4ygfy3tduMoCk8JNnrwtvY06msDtr2U
 1SgcObh0M3xF6UBnp/E/uk/HLbw+nXGJhgWZkypqiz9m781HNg2SnITjVH5JaANFv8rM
 ThGrxS1wFcNJjlQxkXA+aB1bHkWA04KN3QLNps0ty7WS7OHmj373UH/Qc1OAekHR/Y5G
 cr2A==
X-Gm-Message-State: AOAM5318Ziy4E4SrRJjRsf+orM/tYfAIz+3FKTp3th+FaJ0edqDS7umu
 T0YsoPuEC1q/vTK8x5IBhsk=
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr2650193wrt.137.1629126637881; 
 Mon, 16 Aug 2021 08:10:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p14sm10802714wmc.16.2021.08.16.08.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:10:37 -0700 (PDT)
Subject: Re: [PATCH 1/3] raspi: Use error_fatal for SoC realize errors, not
 error_abort
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816135842.25302-1-peter.maydell@linaro.org>
 <20210816135842.25302-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <de768677-d58e-4244-477c-fbc8abe58baa@amsat.org>
Date: Mon, 16 Aug 2021 17:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816135842.25302-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R31iBTQQjiwK

On 8/16/21 3:58 PM, Peter Maydell wrote:
> The SoC realize can fail for legitimate reasons, because it propagates
> errors up from CPU realize, which in turn can be provoked by user
> error in setting commandline options. Use error_fatal so we report
> the error message to the user and exit, rather than asserting
> via error_abort.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/raspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
