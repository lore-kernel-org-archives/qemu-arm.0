Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp871975lfm;
        Wed, 8 Jul 2020 16:40:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmfpq/dxbKtHNoNRWaBNPZHBHxJLbCT0brI2m3DBL5ZzQAh6zBsAbQN1IOL7wXjMswnn53
X-Received: by 2002:a25:aaa9:: with SMTP id t38mr97031382ybi.312.1594251601115;
        Wed, 08 Jul 2020 16:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594251601; cv=none;
        d=google.com; s=arc-20160816;
        b=AnOy22J65EZFvrMVkTHeSrWt1O1YA/nJJls1VwI0Ao78Dpx5frqucz1VcVAswFgRRM
         lTHBn/0LVYTk7FJ262IZdhLRfzYKG0vYqeqlUGks3X6X2fHRz3z8m9mzQc6Np6cQBMN7
         RvXJgsyuz+Db9nDcLXoMf3lGOPtiFlsEWqbbuV95AnEAtipsx74n5UC1vBoENO7+s2Zr
         ZqKmeLvZUZgLhznGYs31P51kbrpazqDVxLb2U/iCkPvXvrV5J+RGpk4bAiVCtCG9y4W4
         aqIFoPcAUtA9cStNUZ9EqqX3vjtKuoF5lBd17U82e74qgJZV23ZRzgDnm4TOqfA1A1Ke
         Z5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7ZboWJxS0N+CSgusXstPnnIsHtDyEy1TBuACGgOpANE=;
        b=jgTbqs/e9Q/8LgRX3Oj2RyCv18AZHHPTIRyDBuYLOoIzKFgGrw2kLfvgaNJlXKEXfD
         KlV+znzCbH9jUnrdv7DdRYB5s7mdp/ByxaNYCZOeWTOlspG8MlF1lDRQ43m4qGd3iu8n
         1wLUT19IqdxKOOfWACAYji9Cff+8hs5Ay1g0toEKbuIzuB1dcTw18Bow401RJGCNGxDR
         lDlTDBlj3nQ3RDhXL3jYI9RJ++SqAqw5qQ8voIdqjGcguf3+ugE4XH7QD9UjQl/EQIoJ
         e01kE9k1vsj18NdaAerddwTtP1sgqpcN1FKdtLSPaGdv7ru3i/gZKGSkjJL+ezziuuOZ
         oB0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TfBf3Qgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f133si877440ybf.112.2020.07.08.16.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 16:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TfBf3Qgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtJfU-0000ex-Hc
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 19:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtJfJ-0000dw-IL
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 19:39:49 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtJfH-0002XY-Qe
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 19:39:49 -0400
Received: by mail-pg1-x543.google.com with SMTP id z5so106721pgb.6
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ZboWJxS0N+CSgusXstPnnIsHtDyEy1TBuACGgOpANE=;
 b=TfBf3QghA0TOAOM5XlIVksakdzaFQ7DNg9LwTsScpdrUxBweLHIBLtPTilFSLsjeB/
 7Vk4vjneQVx5RVlz2Cj+iuGp6auslX8DSLVLMBuUEJir0cnsHHDQLI4XdzHHXNZpGksf
 f6R46QoiZhOpwoseINZBsWvFP4LacUWJ4z0OdifEBzBXOPlXGmv/KZtRJeIXwYxmlECM
 G9Nab5pak4NjAKOvPDFdejjr/P6ovtRLROSahYEdzgIbD+0xSBHq4KdZSkujlj9Jk/ey
 pglZkaRT2XY0v+G17pdwRoW4fCiDxZgBpPuKi8Hh/2c0TLr74NdMmEr9m7JogES+8Neg
 XBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ZboWJxS0N+CSgusXstPnnIsHtDyEy1TBuACGgOpANE=;
 b=MXtjxZSnK8+pNALH01cMDc/qJBLIJVCoF0LOcow4p0PGvtEyvGVNmyRWHq6jVYgqL0
 aN3PWrm1VbN3jmy8GxheZUpAL3SX0EMdLuV2SX05OIFBtObZyiF/wmtq4gPiVPWRQXCw
 FAyfYYHf5QLqn4InxNphZXJ+CAIjqBGyONib8yI2Uw78SL0teuXA9xkZRHyueFGTbvmQ
 8NOPHkk5JB04nHc6sfTSYjeFh4X4oJU2ZKeIw4iQ4rvIZpTsei0TrHvBqeKf8XoTRdvR
 vTFtm4eL2aTz0wfLqhiJ9kn/0vAzLXmeJSgnrND85+wfQSGHgTs0gTADl2ExJ30bq9NL
 YW2g==
X-Gm-Message-State: AOAM530pXY59U+AYDhjRUgtNoT60wPvNctrVsSvtBGxnY5lw7DVYZnvx
 CLAJCeed2qV4r/5OR2mWdD+hrw==
X-Received: by 2002:a62:f241:: with SMTP id y1mr45405909pfl.136.1594251585367; 
 Wed, 08 Jul 2020 16:39:45 -0700 (PDT)
Received: from [192.168.7.121] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id d22sm755810pfd.105.2020.07.08.16.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 16:39:44 -0700 (PDT)
Subject: Re: [PATCH 5/7] hw/rtc/m48t59: Reduce timer precision to milli-second
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
 <20200616075121.12837-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f2811c2-eeea-f6ef-a889-2efe7fa475ba@linaro.org>
Date: Wed, 8 Jul 2020 16:39:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616075121.12837-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r3I1xhRlRBjj

On 6/16/20 12:51 AM, Philippe Mathieu-Daudé wrote:
> +    timer_mod(NVRAM->alrm_timer_ms,
> +              qemu_clock_get_ms(rtc_clock) + next_time_s *
> +                                             NANOSECONDS_PER_SECOND / SCALE_MS);

I'm not keen on this last.

I would much prefer a MILLISECONDS_PER_SECOND define.  Should we in fact change
the units of the input...


r~
