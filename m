Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3105554ejb;
        Tue, 21 Feb 2023 02:02:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9wTHxl8mJRUROwgCSzKcqAM19KqH6D7X7ENHnVgLxg/yFkjXt+Og0gDXWyIxROuFKUV0nM
X-Received: by 2002:a05:622a:253:b0:3b8:5199:f84a with SMTP id c19-20020a05622a025300b003b85199f84amr19696426qtx.3.1676973741858;
        Tue, 21 Feb 2023 02:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676973741; cv=none;
        d=google.com; s=arc-20160816;
        b=mbBIW5ioflGnvCdWTIJY5lcmFuzmahITU2A4F8sVUXrD35Hd2E5Nl7TbTXYSPUFjz/
         SP5C9OwOIjU00nZv95cDek2AXpkqouRfqV5Gzwt3ik0UfDAVc8p5mIgEZN8YJe3GSp3z
         ApJMT+Px6lgetkseVRYBI+jzPEXu8mGCm+ghcQJi2wdo1B9cfswzhsTsEkgRMShhJl0m
         P3ntVUZwUUTe7KsN8l4SXTO7qLvJoklRPP3yaI/srnpOrUyWVHjH9q5WvNmPyVZE/hcz
         aBPWtE4eqTriRq+B0EE+dNSTvovtam7Dq0ib3oShmQO+7MpwA51JO7hgKTVTZJYOHr7O
         elbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ID2wM3HB9kWA3khqrfFXEgHQhC/o4a1L9oSoq9Y1Peo=;
        b=zXGD6Kw+c8D4E9ItXKwnmLWDSEbVBudokUycVRIeavhP/pi+mmbG+MacC5rUnT2ZXT
         yjKR5trgnQCSk91vQvwf7aALWk20qcUAK5fTuLRNN9gQZVqU6c/DjtZTwP4Thlvb9eMg
         MoPL0tKz4OWz7SDzZ5ukHkPp6VO80OUXN7u3XyT1Ysjn1MyAevtXwx5jKWBsez8F7GI/
         dv6+NjiqaVe6onmdmw1tDRoD3N2VQMmr9Ikc/fXX24z9G5UIPCqXagTa2G1WsJ+8jeZN
         zx6XOiKMyNXs6wVQTGB766hrrqgzTAg0HteNbBwHt2wrfHxLTSAdYBd4onkny1rHxc1d
         G+MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EugatnyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp35-20020a05622a1ba300b003b62eb6b10csi99659qtb.333.2023.02.21.02.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EugatnyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUPTI-00056b-TP; Tue, 21 Feb 2023 05:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUPTD-000566-Gh
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:01:59 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUPTB-0000YY-0N
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:01:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 b14-20020a17090a8c8e00b002349579949aso4130237pjo.5
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 02:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ID2wM3HB9kWA3khqrfFXEgHQhC/o4a1L9oSoq9Y1Peo=;
 b=EugatnyQo5GqAlexHTridYaSIi78Htqb+FJ+uTL7Uwth23/7zH/xNivXHv+qf3GaUg
 ZMaKutSAkInXN9qh+ZqyN5nUzFNcyiy0/8B1hzs7lTNBjOTD4QuU9kOSWkvWo4ZeA06J
 29Rxad9gBF446sPo/Asgu+jxpB85HYjIx5HyJgmAbUBC+d7+RHwqFSGkPZ8TDpX488ps
 yuWpzUYZK5l888X7Gnfj5+Ai/Tb8EoDF/BxX/xbjPGmRMO9OhTsJtvXeHKxBxOasCHxg
 WPRy7z9W0rZgopJ7t2HxSEz/5gBRsIxr59lZMq5oZysjSen1HJ+c/+UaHXuNEPB8py1T
 hD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ID2wM3HB9kWA3khqrfFXEgHQhC/o4a1L9oSoq9Y1Peo=;
 b=tOZzgeKVvdbkDG2RZeba674psgVvPc+yFZ44ylDCvVSsGNmClZrJbY+Azyl9UvWcVP
 hx659Z7pMxiPVuBGNxv0DrXz2r8NHVvwbg4MvxOjH8GAxAGd7dkDJB9Qgy9FjpMnN9v9
 eZlTb3hCNu6dlRbsThmLdJIUz9vgkD5+s5UZD9zBbpJ6uWLRB8ci9XpEVxx7BJr2EFQm
 zDAfPk+hOKYUyxSvDkpsYA9DNfusDUoezqJzdIi/ua0O5cHnvMEWTzLxrE3ShFGte96C
 g1ac5eXfVTFdINVu163qbWpuVu/6bxz9/zn3ZiY0a+/bRMna+qSW3KYyJhusLY/LAOsk
 VM4w==
X-Gm-Message-State: AO0yUKVMS3qsgDZdLAsFmItvENNEwr4VyYFWPFInD49scun7w2kFG2/U
 UszeiRhok+O268ahQmcdxiNTgA==
X-Received: by 2002:a05:6a20:6a0e:b0:c7:6c6f:76f5 with SMTP id
 p14-20020a056a206a0e00b000c76c6f76f5mr4283426pzk.51.1676973714407; 
 Tue, 21 Feb 2023 02:01:54 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b2-20020a170902ed0200b0019c919bccf8sm1150953pld.86.2023.02.21.02.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:01:53 -0800 (PST)
Message-ID: <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
Date: Tue, 21 Feb 2023 00:01:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: kUiuc3QjanCZ

On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
> they could be shared.

They are not.  ARM has Secure EL0, or secure user mode.


r~
