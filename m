Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3129670lfb;
        Sun, 12 Sep 2021 14:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEHQDeVw1X2K2TuDomqevIESiSWUCkb5QylCv8EvbTl5krGYkRTPQ1Mi69d+orNtTWodso
X-Received: by 2002:a05:6e02:b46:: with SMTP id f6mr5329527ilu.202.1631481636575;
        Sun, 12 Sep 2021 14:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631481636; cv=none;
        d=google.com; s=arc-20160816;
        b=YxCduh4iB3Xoi0LoI/nSD8W2KHoypf7hBB0dxnta0Wvf0PtZZhrZO2p66+8ugJ1RGQ
         8HQuIPLGNAABIChTL63kr5Rhrtnb3NqaHr5qlWkUSXPg4cBSYUaaqnM1XmIXNR5LLV5/
         vBtD/C/F85OXHspnikbMVKin53MI9Ry3BK0C6urHqpV3r8ioE1dGM9Z1RNSsMWFh1aIT
         b5u8HHgkZxMCSF4LFh6PHPVU/Di8K4fnYxELcGIx7ccj0SN+Mglc1oKY/S/72cArBlPS
         sP4F6mfCUN3Ye8V1RAlSd2jQnEgBZvNaN4DRcm3TYbVL7Ck9mX69b6V2bVINaPHsMe2I
         0b2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=A1F6q3PY+I6g6jYniRTZHRQefubfUz8wzHqRavTvzuk=;
        b=pGjtzrH37olk9UkVJLEj+xHs3xwbBuWTeE5/YpJrQ188pdsfY8xpsmfhvdv59sDj54
         jvpjoOp1qc19SaGjpIlA2Q0SCRdkCSfv3b40s2391H6tX6qTojqtTWXwWdU7b5mlWOpO
         JvZLNNjQx0z+Rgz9lK4aH1X1Kk1r1LqakAaudnpYEl68kJvgwZq8742V0BSf1UQIF8kE
         Rftvi8/b2ihKFd9RynckrfbK0kncvCz6o6AyG2L38xAREehI9qwW+lPsN7bIPql9VmlF
         jnhiXpzLJPfqpx+HFtk09UL7UvwadJZL9yX39ESkLVpHUNO/N3vv178zFp4RWcivvHZ5
         K7Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P68v3foS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si5660939jaa.111.2021.09.12.14.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 14:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P68v3foS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPWtv-0000ct-T6
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 17:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPWtj-0000c9-Sa
 for qemu-arm@nongnu.org; Sun, 12 Sep 2021 17:20:23 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPWti-0007M4-Dv
 for qemu-arm@nongnu.org; Sun, 12 Sep 2021 17:20:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so6996701pff.3
 for <qemu-arm@nongnu.org>; Sun, 12 Sep 2021 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A1F6q3PY+I6g6jYniRTZHRQefubfUz8wzHqRavTvzuk=;
 b=P68v3foSNQyPbuvTfsM0lwVv2zLXf0Kn3CGJ6Pwd4wd6KMTJMNHdiS589JeGpKYj1F
 HnmHSvpVnYSxXYtawjIom+chOo8t0eJYIMPAoBQ8uFls90kswUj9Q3MqWRJq6jbpW9ZF
 oWHFcXORISyGv6cMrOOSkUrRnyzgphFHlvS4ZuaTckPJr/YNooZOmGg4YTiIUX2dmJ3K
 Xc9vw5GNtnEDF/IqUX01ZO8FFRt5/l/hFlKFbsCgezdu7HPxJtMvNsnFP9ZS8qWdHIG/
 BBmNJWTHl0GWq3TzwHg5GpMd9MznMvN44eRxaOic2nihew/3KO0RBGywu6qqTpZl9mhf
 M3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1F6q3PY+I6g6jYniRTZHRQefubfUz8wzHqRavTvzuk=;
 b=AlXFihKjkH63o0vcn9deYbeAalSzKVEt+/2vilHZzwbY6Hr2YJTcXte7UEHnyA2GbO
 xhlR02y7AE7ROnQUe7wCTvcFtZTOy8Bg2lojh1aL5CFMM6WvOHEmYS1rhpbi7CUQs7RE
 z/wbroKr1LPAR1KEPPY7iNBPOzX3ee9cn+wtWk1vcOOKRlG5IN31bgYEi8h/86f3tQ63
 LxEnBe7318VGjzNdkWFgXUR031LB7H4kA7g5ZYEaOga4nG+zAAZ0JyoZPtl+r87OTt3l
 KOOpLpx5oruoaLApwKiR7KDlM9g9ILxhPcBTaMwdNIMtm5LQ6YivQMfMnJeXdze5Zj0J
 g+Eg==
X-Gm-Message-State: AOAM533epYypKL8ZUvUA86H+FfQN5vEelhcDLgogtnWkH4IcD7LAVB0W
 plkIoi7rzTcVKpjYeEOBCFGrJw==
X-Received: by 2002:a05:6a00:8c3:b0:3fd:4333:897 with SMTP id
 s3-20020a056a0008c300b003fd43330897mr8014705pfu.67.1631481618826; 
 Sun, 12 Sep 2021 14:20:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z124sm5433920pgz.94.2021.09.12.14.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:20:18 -0700 (PDT)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
Date: Sun, 12 Sep 2021 14:20:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hEgO2wWIgJLU

On 9/12/21 1:36 PM, Alexander Graf wrote:
>> I think the callsites would be clearer if you made the function
>> return true for "PSCI call handled", false for "not recognised,
>> give the guest an UNDEF". Code like
>>           if (hvf_handle_psci_call(cpu)) {
>>               stuff;
>>           }
>>
>> looks like the 'stuff' is for the "psci call handled" case,
>> which at the moment it isn't.
> 
> 
> This function merely follows standard C semantics along the lines of "0
> means success, !0 is error". Isn't that what you would usually expect?

No, not really.  I expect stuff that returns error codes to return negative integers on 
failure.  I expect stuff that returns a boolean success/failure to return true on success.


r~
