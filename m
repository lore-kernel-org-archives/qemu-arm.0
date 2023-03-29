Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp538177ejb;
        Wed, 29 Mar 2023 07:16:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKOCFao0lmm62/sLUdTnvtf6uoQScqV0V/xqcFC2LHBmJlcjjv7lit2ex3blrP1r/uF5Xk
X-Received: by 2002:a05:6902:18c6:b0:a03:e5c3:4614 with SMTP id ck6-20020a05690218c600b00a03e5c34614mr27348034ybb.0.1680099375933;
        Wed, 29 Mar 2023 07:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680099375; cv=none;
        d=google.com; s=arc-20160816;
        b=X9PtMz7MzxjHIaMuR+cT86AHUbshMF/KrQfc1iBCN6Dsy/czLij3TV6D7jc4FbRJUi
         gXyQo6CFXqrYStL+x6+UFkKjneqV8sWjMxTGXi7NzzQhrDeTi26hAJcc6Ha/thMd82zc
         0e4rdkMIbnXpEIYE1N9i3YXqfYILp+c93K7SBwgzWLQquZw7r+L5/hK9Vs5/DGpp3Y/n
         O25uLI/4LX7sI6A0hZcGbyRY6HmiH/cRtfF4sSAazzoVriUQK6bkbxeiyOrLn3YhAtf4
         49LvER7x73W25mpRS4gxWxK5mXfzKH9xm4XtsKXUjajZEfbvrc2GqnclccaxbuTCFPev
         vdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eWpRz6gOe4hJGWqEzQt0Ul31TyoaFV40MpKnTLCSEHM=;
        b=Lja5rmGsClMykXFlFeoK8Dw6B0V6gAHgW3WWntUmoiKbznH4QZpoZITCwuxB7PLnCr
         MHysYsOwUGcS8oVdfYsP1oC221MfFwrGtaE6PhL3ciCrBFMfqvyhM5oK+iR1YKBUuxdX
         M2Ik6vdqzqkrV9QMUHe+x12dTU1k/4B2dvYIk30qdXtctPV8SlKQ0KUndscTDjcUxZ+5
         z2AWC+fRCqaZEPnFiTAG+Us5Ojxl6ptNcnmAEsT1gpHMoL4xFOKpzBc9b/IUKTUo8th1
         W1h+RoH/aS2kXzSf3kpNZr/22Tjdi/h5bHgpBvdXnzP1R/X52dt834mCX9VKRqBu5ZGn
         FqSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwoUHcBN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05620a2a0900b0073b398ce12csi9997374qkp.95.2023.03.29.07.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Mar 2023 07:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwoUHcBN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phWaf-0005TJ-GE; Wed, 29 Mar 2023 10:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phWaY-0005Sk-GQ
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 10:15:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phWaW-0003bZ-07
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 10:15:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ef90adc168so1992935wmb.5
 for <qemu-arm@nongnu.org>; Wed, 29 Mar 2023 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680099342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWpRz6gOe4hJGWqEzQt0Ul31TyoaFV40MpKnTLCSEHM=;
 b=wwoUHcBN/zpK58oVMxmMH4MDK7GEqHQ/plvO5JRFVmLaRKbl4lcVnF3bILnmXjcHMc
 FVhj2ipg1jct20tDUMB96u4NZtSTDdwr2qXy7l1ph08sxqgMO1Dl3j7L0PoYgjbNGYEa
 pxOHRaL5XFIX2bL7up6kSYtB7UIOJlnmDCk43BrBPwp0fpk+LmhzSNn/YGpEUJ3XClu4
 1RlCAT143IQJGvwgxclkGS756n2Sf7XERRRVClkzQngpUGiTh7H/g7Ijj9c9gPCEGmBj
 p7d8UQc7JEFVD+q0CdnGoQTxGpiPgSXIOCS23qYO31SaBqe+Tw0VPBA7w3pygpLUyLx6
 yNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680099342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWpRz6gOe4hJGWqEzQt0Ul31TyoaFV40MpKnTLCSEHM=;
 b=P+hq11VKJo256ND89btqrFsOLvjMDB4UC6W8Ycetx4htqoW1JO/QRg1avhwKXsz9uK
 nHh1Uphb5tf4mJsmYIDlQQ5uQLi06Wdn64fxSGqTFZqvLultaMMK7U2NbGxuGzzNiKAp
 6rjEnyQCeChicdzZaceARp8t+ST4jOzdQB9fqeYiQhiL0LdY4ViEuLtTUOt1O8J+cJCB
 sJ37W1G9B13ljM6dZKEXgZxJOFq3aZ2LOHHC6HLL0fOqjj2bWLWAh/aooaA1HcTN+jq/
 bOMunLVSSRDnxm5LhXxitfFJ4rmy+AaZvyW1qx7rqk53ah1Dy2RZbUd6dww3U2mNUENU
 82jw==
X-Gm-Message-State: AO0yUKWFQWCbSVbeMAXIrIVJZvCn3HIixpMawXxBSNgJFm36gu2Um7yf
 VOP4U9GeVgsH+dDIlLNq4u2Hzg==
X-Received: by 2002:a05:600c:204d:b0:3ed:e6c8:f11d with SMTP id
 p13-20020a05600c204d00b003ede6c8f11dmr15195807wmg.7.1680099342147; 
 Wed, 29 Mar 2023 07:15:42 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003ee610d1ce9sm2708420wms.34.2023.03.29.07.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 07:15:41 -0700 (PDT)
Message-ID: <85eca121-d447-7861-c73b-b68adb517d53@linaro.org>
Date: Wed, 29 Mar 2023 16:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] hw/i2c: pmbus: block uninitialised string reads
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Patrick Venture <venture@google.com>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-5-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322175513.1550412-5-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mWyJwwSxUhuX

On 22/3/23 18:55, Titus Rwantare wrote:
> Devices models calling pmbus_send_string can't be relied upon to
> send a non-zero pointer. This logs an error and doesn't segfault.
> 
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

