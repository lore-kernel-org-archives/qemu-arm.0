Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp523903lfg;
        Wed, 18 Aug 2021 09:48:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpPmtgywUInTCfR6hcBRlJ+DxV+E/5QbpKacFcb5NiIDqS9zlRVPfpNj/mDWEzO78s81Vt
X-Received: by 2002:aed:3082:: with SMTP id 2mr8807282qtf.98.1629305301923;
        Wed, 18 Aug 2021 09:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629305301; cv=none;
        d=google.com; s=arc-20160816;
        b=r3/PJvBFzRl/YGCJ/xYs2RCI7aqKXimLg16QOU6zYo6NIIG1AdXF0XrFyXIlXmVbFd
         3LR7n+afFovGefW08YC7V63knOJIS/cGvVri1c7JEKQEWaYJ3kdlzHu005qdxYevEPCD
         MvnkaIZ1VEJFJLwxrouDmxKVJ/aA7wks2XAJkvAn103USMx25r3Dykj8qoLrbIPWFSt2
         aQETvfEKnV6fCkzJ2bPR096LKD/T8TFv7SXuTbz6FajjY4YOecr07gVYzY8WhsFfT0hH
         CHqOxJm6R5Vtdzjqqg0gnhXuH9gLHQ19ZZuhuk7rzhGslOLC6Hi2XS0T6gu6d3ZNSla0
         bJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=goj+x+Tv+22gFTT4BMtUkl6GA8T1ntkiQxv1L9/ytPI=;
        b=eR94i44y1YTyXdVmbmi2DtiG2LRn966pslUKUW8CRTI3V/KuObB7/DOqW92loSpvhC
         yQiq5Jz8xMYdY/DgcWn5N4p+hK6uedqJgcPVJhGBrb8wolff2MPIVA3hUyhIiNzy60sA
         owDrQ+JpQsgEN6iSdd0X2E28Z2JTXNj/fIPzddXLOi8wX/Eul3eKa8SvL57x+UnY/BNE
         oC1iynaE/GVQrfGLquCzOKehZx+6lF3ukX1NvVSru/06olZ2rksa/2SW0i1BDQ6W+dXB
         pa+jQXrqv51/tmB61nR7lQlPVOgu2ob+kYo3RRgaSNJhR0FjnodkNZifIlPLqgPvD9c4
         7+dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LqHDhh/6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si221228qkp.81.2021.08.18.09.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Aug 2021 09:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LqHDhh/6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGOjl-0004Iz-7t
	for alex.bennee@linaro.org; Wed, 18 Aug 2021 12:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGOg2-0005N9-HA
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:44:30 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGOg0-0004Vb-9W
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:44:30 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c17so2179809plz.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=goj+x+Tv+22gFTT4BMtUkl6GA8T1ntkiQxv1L9/ytPI=;
 b=LqHDhh/6RxFzvC44Xwnn+ubmKHbJ7MEM7xaR+QlB7oAx44dkuWH+ngua/EvJUgyXo6
 UfzwfJzEVX/NB2syCV8a+fIZd98Z/mf6poUmSBM8iTbr9kszMcP3vQYyYY7+R3KmMsJY
 ahCgss3zQ15AsO2ZexsT9P9X5Xqytt2Zf+77Dz+RtABFBnJ4/QrgsdiK9y7J2FafgMOS
 4rMj3f9Ve/84ZAAvpaHdR9jSOx8wtJNE1k7L1hB+A7T71Fl6qPu0U6iKixBceKVEDIFP
 9ZLg9fnxatJJVLmnIjLCowoyM9vIxAAbhkSDwyHu7V26+oSIoGKlEHh5PEuwRGmGtArL
 mcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=goj+x+Tv+22gFTT4BMtUkl6GA8T1ntkiQxv1L9/ytPI=;
 b=iH7yHIyWDJeZFnZ0gV1Eo0BQxa7AlYIvjkXxDPTGNaj6z15nNxYqtHUHAovvETFWJc
 X/+VMBQqeirEuDwf2OlEVpcL0T5jrzJVx/qKzc+h3/3OcN1lSbqnpEfrp8mnpl5yhP9Y
 xucfNpclOcJWlYHx/836gSYGyIQDIGx4DFcxoGU0vJaGBuXGE0R4bAUz4ykXJ+27vNcs
 8Z7BA0A1wE4bqTB7d7hxGuX9Fi7oSQYoHKPLekhPSzgVwFsoYVDKIdkyujXNTa/MMBsE
 daRqRyDUjoCIHEJOfq+DFVzl9Xy/z4dje1/MNaoK2tPRjZmzcM+qBvQ+ocN8x/vlOiEJ
 TwBQ==
X-Gm-Message-State: AOAM532N6jAGs0Lkixkpwk9qH70ew4FGichPmCroW4B+IEZslgvvZFXQ
 QAapW8Fw3NY5srffPbWySSgOfw==
X-Received: by 2002:a17:90a:d596:: with SMTP id
 v22mr5799416pju.51.1629305065548; 
 Wed, 18 Aug 2021 09:44:25 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l12sm244403pff.182.2021.08.18.09.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 09:44:25 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
Message-ID: <3da184bc-1af8-9730-f68b-3a00f20dabb6@linaro.org>
Date: Wed, 18 Aug 2021 06:44:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818010041.337010-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a8uF3NbSrRSg

On 8/17/21 3:00 PM, Richard Henderson wrote:
> With v8, this is CONSTRAINED UNDEFINED and may either raise an

Bah, UNPREDICTABLE, of course, not UNDEFINED.

r~
