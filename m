Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2138691ejb;
        Tue, 30 May 2023 05:30:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yZIZ0ZjTv6meByYF15okTZY25UNZhWm3IeIcFkh3SYcuiZflm1PzozGtfLH5cQi1qC022
X-Received: by 2002:ac8:5b0e:0:b0:3f6:b49a:c137 with SMTP id m14-20020ac85b0e000000b003f6b49ac137mr1461167qtw.39.1685449855797;
        Tue, 30 May 2023 05:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449855; cv=none;
        d=google.com; s=arc-20160816;
        b=MvwaOzhYB5+HV8DnIDYOS0G3uzGKZe+bpLg//VDjkF8aQU16TlGPa/VYtLIoerXh6m
         JjtxKltKBD4PwnXOT1zPfEWoDjoJDGDwE03Nn5MFn7hF9pJWXBk7EKHtg51bel99VBs9
         pbgr5/JF/sSWj1LgsRClWsTkKrsEpdiVweyusb1XYFYWx83m4tqNi5W2hLtBsUt6n6/f
         zuphXVDKcSUWeDQCeDx7OQsW9V38IUZRgIr4xndOiBPiNgkRJm8TUTmaYyhFLSLLd3ho
         mfat2Hi1bUcoLccoCc5y9JLCkfWyXcZKcl0qO2fRLKyabJd5gTeFyjVA+L7XxYy7NQJ3
         NfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5aCI4yNqcUK7XYzwGuwgqxLfmdzwJW23J4p5WWeGwAc=;
        b=1K4ytUaitLrohrr9x3T2t6S2lOuH8RH2wE4UkBUJSoKZXw22GcjtMA2oUwUjSHYCMc
         zFsOnBiyVr/RHodNaS+BpzeqHaWO953vNMSs7EZ1tKeLa/I80SPkGXRWOkMADmEWNS7R
         uc6hzbFHTfod0LyGjuptwEf9Si8SQVY3V3ICNNMCTBRgnc+EYqF4K0+5UpJPo5Vjcv5W
         T/XAJPNelbog/ze7mKWq7wO2UYYLiQhK+M4ii4ZvHpUAJb5G9NVpf3sjfbkWDXcIYRP5
         aDzkE+yC9pu0zG7/qHAoLKEDEIvPENkU05L8lHKP4d/Hukq/VTL9Kl3aVm5vAqu5H/WS
         75qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2pfDymF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f39-20020a05622a1a2700b003b644b7e22bsi6328353qtb.155.2023.05.30.05.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O2pfDymF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yUY-0004Bh-27; Tue, 30 May 2023 08:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yUO-0003qc-Aa
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:30:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yUM-0001Fm-FF
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:30:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f60e730bf2so45840455e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449807; x=1688041807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5aCI4yNqcUK7XYzwGuwgqxLfmdzwJW23J4p5WWeGwAc=;
 b=O2pfDymFA1KVyq3dT7DAMEIwr+XCvexxOBZgysUbi7YOXTBsUTciExxEDi30o+cKIP
 W4pcuzgr18kxb7WnBUAqvmwSduH0Va+Wja5GEgpR3+263hQ73PyyxjGNJZtFXP7VMgVJ
 OkZ8MLow9QwQCvDtVhfoK/K0vb+2pnzM9c6IPuBB2JAIqy3omJawG49nE6wXd0jLhuy/
 Kpriaj/FUOiMG0IUKGw6r377a5FhKWEGqubWTdfx1PU1/v32TTz8aZ33tBeCoLog0ACZ
 EYOsCN1spk7LI0GFu+OxvsFBzRT97bTfdbma+QcwvpLhy93I0MBtbw24JiYY6gbVlxzD
 sbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449807; x=1688041807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5aCI4yNqcUK7XYzwGuwgqxLfmdzwJW23J4p5WWeGwAc=;
 b=V5eUTeKp7gjecCQL48TAD8PE6PsoSfoet+yk/COv1yRDKeIJehQL5mmY3xaBlNW0x0
 6RHXZXxSyNqap4lkzxtmkGBFbMT+7iAYQu6AZKTbAvr14JtogWc5W79uw5zqYI6SWmJr
 OZkvgUzZgcedjG+0OF1f0GAPKPF6XUJPNBBZOHFCFswc+UFpTIZikNoRRUtDGr3Wik3J
 qmMHu+BKGRny/BfM0VJ7SKsvNLas5zFMtSixONCmeOq0yZp5+JpyXvjEB+r7bB+DKnYN
 JtOyEUUBkjxYVNbRXyeGrN+mw6pTu7701m31xJjmDyOgwIlaBoCqLJFyThqfG0vLgvi+
 WNLg==
X-Gm-Message-State: AC+VfDyOr63UmsCN0lKJ2Iv8QWT+RcvS6+gljcpmIzIpKrvmPMZTGJlU
 7vQSF9qf3aNOcmdzkSQpNpScbA==
X-Received: by 2002:a05:600c:2105:b0:3f4:2ae5:b35d with SMTP id
 u5-20020a05600c210500b003f42ae5b35dmr1962471wml.40.1685449807147; 
 Tue, 30 May 2023 05:30:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1c6a09000000b003f4272c2d0csm17220780wmc.36.2023.05.30.05.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:30:06 -0700 (PDT)
Message-ID: <68163136-0439-cb05-e13f-0aa49c1417dc@linaro.org>
Date: Tue, 30 May 2023 14:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 01/10] memory-device: Unify enabled vs. supported error
 messages
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-2-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RuNGGYuwP0ap

On 30/5/23 13:38, David Hildenbrand wrote:
> Let's unify the error messages, such that we can simply stop allocating
> ms->device_memory if the size would be 0 (and there are no memory
> devices ever).
> 
> The case of "not supported by the machine" should barely pop up either
> way: if the machine doesn't support memory devices, it usually doesn't
> call the pre_plug handler ...
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/mem/memory-device.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

