Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4929978lfa;
        Tue, 8 Jun 2021 17:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfaTK/buTHCKvwvwPnmwvwa+a6MOW6aJ+uXozeg1Esoh3oMQry4u7prNyJKKDJWPy+uoCH
X-Received: by 2002:a37:f909:: with SMTP id l9mr25122029qkj.428.1623199628708;
        Tue, 08 Jun 2021 17:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623199628; cv=none;
        d=google.com; s=arc-20160816;
        b=Zyu+TjxjN5ahaHp5V0A2ljxTrwzCDTbLRS/NW9QIiGFPjVsRri9Xe+VBaIZqJLhCnb
         Q9tj64iigrMQ4wAoxTHkGxPy8heGEMhmAsDg/JDaYu/nm1qhwb/DaDdgSa4wqU4OEitV
         xhXK8e7d7wJmyAmv86ThZuUm3Hjg6ap8KIT3In/OADOkLTjKx5bGGm902GhWERevEo0U
         Re91Oz04klcLWbMSjbpFYjFlhz452xhegjRGKhKrNKYAXtPusdokkUF+Ttwdbe57vRuj
         /UWzmg6b6PvesGHP35DuTcmF8axGye4n9y9ekKUiA5FeLWucQeAVBSqRRUxHMI9MgCGe
         Jknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kvCaA4w107vpYjDLy/NvOpdPSVG5jzDqtXtBXoWmdPU=;
        b=gHVBADuDNzkbneX42VDg/2BcDhYbqTOSBmqOIWiyNiQ+uVznEW5ET/Tk/XLTxeho1I
         lk6nnNxNgHiw5maIA14Jc6MGk6O7T7JFYhIpRWhUKgLlOShbspQdjmLKdRoDiux4sSN+
         oD9c8Y+dqJNPzgw2Eot6qAkNthS3kHoqcLp2Za3rEE0xZ5fPrAFmN4HhE51t33/eHLGh
         AuCkYO55iNLhVCGHJNP5AB+4r2AsXS1uUdxYjawVE4gPSLUWFJ2UliI6Jkw0FCOHdb8C
         y2rlQGg5fj1L+++ax7+ebSyaTccMDW/BApo1vQm70o1yt88NR69Ut5rQrEheyNfUrsve
         tfYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7U2NICQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si3381055qtw.72.2021.06.08.17.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 17:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7U2NICQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqmN9-0003Q1-U3
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 20:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMg-0003CY-Mi
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:46:39 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMb-000442-2X
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:46:38 -0400
Received: by mail-pg1-x536.google.com with SMTP id t17so1422930pga.5
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 17:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kvCaA4w107vpYjDLy/NvOpdPSVG5jzDqtXtBXoWmdPU=;
 b=q7U2NICQRMrT5uln+f7aidvQBk8Cfrpl8exG9dE/G5XDSGHodLIUToQfgP/5X4YMqg
 VA1j4InJorapIHuH4k94pV8of9i90dz5sNNseAekZfjzynOwND45XNuiiZk+eBbEihKr
 HIWZaBLpeXke3pK2URsll/lkHw8a76zrKSfw9gtTbag6w7viE25x8DJwWwifV4maHW3x
 dntTAZ+bFAo7JU/u67lFIKJ21lEUPyzt9KnNZ0HREzs/bhtlG8xbUt7UbQq51ovP3Rdq
 iYJcBULOY2q0OZNmAhgZZ6dkOEzCR6Ev265OzRzEW4z1AU5kKA6s2dXsuLkPqt5jJvd/
 0y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kvCaA4w107vpYjDLy/NvOpdPSVG5jzDqtXtBXoWmdPU=;
 b=Q06gRPqVKc54VE7NLu0erxw02gu7prARtrlglnuV5pfeGbFIn84BO7FNrpjdLXm5Oi
 54oA58l4OCLjCgzgTfruS44cUdZEvyR+SjdCClkP7ScWuCmEOoEPidP8aRFx3MHrdMHf
 +TKr2UCDyvT/cFlCWWODh0YMvVIILpLAvVgw0K005gSeFKiILgPfmG1ptVZ8Jmv2eRh7
 C0r4cwLBR6dknbYvva5uJti5WZN/Vvv+emCDT3JJLOb7d0T1br0HrVAxIqMZAsZZFwRr
 z+JhMJLshEa1ve0zlmzNLzUhD0Hv/9UDTY/PMDZiWWw/nrdxdCxaV695HhMEYPhZEhGX
 nT7g==
X-Gm-Message-State: AOAM533A5a5Da6Pl7RhXP3ni5aK+5eE6jA4T4nB+hJiyEz9Xl45YXmY4
 Oe31pHYov+XoGlO3sNr/pNwjmQ==
X-Received: by 2002:a05:6a00:1794:b029:2ee:c59c:56bf with SMTP id
 s20-20020a056a001794b02902eec59c56bfmr2541867pfg.2.1623199590145; 
 Tue, 08 Jun 2021 17:46:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a4sm15490205pjw.46.2021.06.08.17.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:46:29 -0700 (PDT)
Subject: Re: [PATCH 29/55] target/arm: Implement MVE VMLALDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9200eb0-0f53-55eb-c6bc-40a683157b42@linaro.org>
Date: Tue, 8 Jun 2021 17:46:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LR3/k22i9Lc/

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static bool trans_VMLALDAV_S(DisasContext *s, arg_vmlaldav *a)
> +{
> +    MVEGenDualAccOpFn *fns[4][2] = {

static const, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
