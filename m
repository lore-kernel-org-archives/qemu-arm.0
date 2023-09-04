Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1317052ejb;
        Mon, 4 Sep 2023 05:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsSsCkSzJFsnccRw3UtdDW3H/xz4l/r9iH7gND5+6ijD2tR9eeIthx+RTgwJFZYnN92FtY
X-Received: by 2002:a05:620a:2906:b0:76d:a812:e67 with SMTP id m6-20020a05620a290600b0076da8120e67mr11479067qkp.15.1693832246751;
        Mon, 04 Sep 2023 05:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693832246; cv=none;
        d=google.com; s=arc-20160816;
        b=lkTNSoErxCCv+t11gnDwVun/mkMnQEtKwtR9E1LE1bu8X0fRtooojXScpSVZKtWpBR
         jmsJeTFcrAeDryWCamtXkX4FDlHgIFYhEZhZIHLUlNa4J8nbUPt0kLJafct39die/6qs
         z9ktPkQZPBnOuP0PfPRxS1U6GbJP8219XK8uaEy2ZjCaolI/YVVGWaIK9WN2yB0hxASZ
         9S2+6L14+hWXJwqKPjLnNYMgwgDJ+PgXV81Qf3Wqm2qbHk9q1bRqXUF+P5gWMq/ww2aJ
         EsbFuOkqKaG7CcD+cjE834G9dSlqGlOlCNJwJX8GLnkW7rahWjXP4oPFwS6YrXFFnx+F
         A/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EIFk4asiXVbZjDtNRoSWvsSRIvli9XzizwBjE/hbJ/o=;
        fh=jrY80YtWgWpkBdG4iEG6r8jkPbgFq/F/MJUdigB4eCs=;
        b=I/1PYhrZrajqruVqqcY5jVNn2TJvWE0AV0I+TCS9ziE46yiGma7lW4xukl/mFfsHXC
         IAz3dbS9WBHjBuM0U4CTwQSovilCeL7ec+4pJp5S2zzaBJuBkmTm4lgnq0XwfW8+zdMU
         QqEfRl+S5KAFQpgN8uWwIjsFS94iCtbR6hhI/xHdHsWFCFhhHrdWJ9q6sLE64WHS/TZF
         IVtTMg/a96GIdFSw2GjrYyyxMTOITMN4cpGEEU/heZ8P7oQ/pCBrDlo/FPxUfLlUm5FS
         eaSAGs4FKcDxDfrFlKCs3lYAcUVHvvF21SrdTnXBX66UeaMiEbSSFbBfz1ppW/vdY/e5
         uwfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vC1NPEHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a410300b0076d9ca72d0esi6632325qko.699.2023.09.04.05.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 05:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vC1NPEHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd98i-00024Y-62; Mon, 04 Sep 2023 08:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd98h-00024C-2M
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 08:57:11 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd98e-0001Lv-Kt
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 08:57:10 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-500c37d479aso2189248e87.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693832226; x=1694437026; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EIFk4asiXVbZjDtNRoSWvsSRIvli9XzizwBjE/hbJ/o=;
 b=vC1NPEHzIS9R43DrMhlhlQ4CAiZt3+lyFbVAZEUo7XdzOWIAerI7lTgTYA6qsvySy1
 GMqn1V2j1TkqI9Ffuen/HyRpqMMwcQJSX15H09X4wXUADFFr3j52op5lCUkb0QdQn4Q6
 vUmV1MLripx3zGHGD8Jlkk67PsRM4ACXN62TW/K9ilFiNgqscsM7ktNlYAh6s8yiXmg1
 GhgRgqHYrf0IUtOcaYWFeI/5skezlQPiFXXEd6ZXTSmchT0Xy3E/0aiTs4n2hBiKhge2
 qDOGtM9qO9hlViefEEP3oEiFmO5kciw/ZuAQvWAp9PtA6r2rkPHtHZvmUvb8p003blwE
 dCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693832226; x=1694437026;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIFk4asiXVbZjDtNRoSWvsSRIvli9XzizwBjE/hbJ/o=;
 b=LdGuba007dwpvILxGejqRezeTDN0hpipnfQt2lOU+RIxJi22eRWHzYPy3MuCQBPM6V
 A5tGmSM2H34FzpMm9Yxy+ZaXWYDdpo9EA+ouDvKDjTOcp94CGrMMOMAWn0DZiOnJuMtD
 q5k4nr0EyuTtTczsHqQTmK0VHwcDdLC8bbUz/gQ1vmh7cy/xQxnLaixsaQgbmY2ipUeS
 3G/mTnc12J3Qf1QDiQYY13bpOLBFaU+4s3TKaAPMW3UHYV2TdlTk7JyS83/SzJrk7b3c
 kAMKHCsJflQfwV0mGxcE7HJym5ZtwQ0w0MlTPThVkihVsfsUC6brmdfucv2ZE91n831X
 lqWg==
X-Gm-Message-State: AOJu0YyeEUjbzbE6LJuXJo+ceRV43clxQVfl7CfhWLzcZJYweLY48hc0
 BAI2zOABGEGDSgovN3c1T+YIkw==
X-Received: by 2002:a05:6512:23a0:b0:500:ac0b:8d58 with SMTP id
 c32-20020a05651223a000b00500ac0b8d58mr7889454lfv.18.1693832226231; 
 Mon, 04 Sep 2023 05:57:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 r2-20020aa7c142000000b00522828d438csm5838886edp.7.2023.09.04.05.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 05:57:05 -0700 (PDT)
Message-ID: <056c8c4a-5d51-0cd3-39ac-364a36dbc3b4@linaro.org>
Date: Mon, 4 Sep 2023 14:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 10/11] net/eth: Clean up local variable shadowing
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-11-philmd@linaro.org>
 <17caf9c8-94af-4bbc-9b48-142606b319dc@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <17caf9c8-94af-4bbc-9b48-142606b319dc@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: PuY8qrYjMB2t

On 1/9/23 09:07, Akihiko Odaki wrote:
> On 2023/09/01 7:56, Philippe Mathieu-Daudé wrote:
>> Fix:
>>
>>    net/eth.c:435:20: error: declaration shadows a local variable 
>> [-Werror,-Wshadow]
>>              size_t input_size = iov_size(pkt, pkt_frags);
>>                     ^
>>    net/eth.c:413:16: note: previous declaration is here
>>          size_t input_size = iov_size(pkt, pkt_frags);
>>                 ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   net/eth.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/eth.c b/net/eth.c
>> index 649e66bb1f..cf030eed7b 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -432,7 +432,7 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, 
>> int pkt_frags,
>>           }
>>           if (opthdr.type == IP6_OPT_HOME) {
>> -            size_t input_size = iov_size(pkt, pkt_frags);
>> +            input_size = iov_size(pkt, pkt_frags);
> 
> You can just remove this statement.

Clever eh, thanks!
