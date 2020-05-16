Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1075629lfb;
        Fri, 15 May 2020 21:12:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxakMOE+RlIksCA4ZXkQUIxz+bSyrWcZ68/+hF8utubKkGsP6C81anisPaROvLLnl3n39Ta
X-Received: by 2002:a05:620a:1502:: with SMTP id i2mr6317327qkk.420.1589602372195;
        Fri, 15 May 2020 21:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589602372; cv=none;
        d=google.com; s=arc-20160816;
        b=KiXMqMnDxUImc4fIR/tSFsHO1j4Tgv5xuhz/KE9B2xo3lVsJIDQCKSju5XqdsvD5aM
         /GnoDTCsvh00vS51qJe8ixePl1LROjN2geQ3bLRT7UW7iWTEi3yUt28PKPnx3FM4NTsK
         p/K2afXkQ27YUpW7JVf5IbLZyTNux+RtdmzY3ry+32r7WsYUQpwOG5mhcmZpG+lfEPLI
         QKiOS6mUYkoukhRQ6W49yPTv8U8t77fr7LwicnrP1LXoqnrdJO63DMR3GasW4jVYGOoO
         azic/cYFXmKMnrIPSGo1EztAGajYxlxTAx1aVMWk6AhOSloMtevFRrP+ypJiXg8vuxbQ
         16Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZDKRidBIC85qhIE/mm8bhXDBJw4FDy1it2kQO0M3tLU=;
        b=dkbd7qq5E7LuR0huTpCzAS45p9D5WC15e4Z6bPAgybam9DI2Z2IzZxsChc8LMsobR7
         vYZOXXEHHvYjxA+wGAphsLdjFSucVJajBB69RsMXtP8IsSxVGoDoWOIyT9Il+6vTpsYg
         izXIyRBGX+1rDWWBIy7h4Y89vo8hqw4jGtXSEBIvz2YiJN/MCmu7UdyMF30uUFomZJge
         xMX16zWIEwNGIR/9hmUYMNKxFIGN96MEJ4PrRcwx1NENkPKS0VnoyhJCVV1qCA2jpFPI
         Pu3iLyVOpwg0LxB4c5Rlc5HJx9KV3d6HuiYUa8Ku93YVocdfHO1TKtyT9vEiwSZsRUsM
         GW3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rPyqbEfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l48si2429470qtf.319.2020.05.15.21.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 21:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rPyqbEfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZoBv-0002n3-IQ
	for alex.bennee@linaro.org; Sat, 16 May 2020 00:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZoBn-0002jP-O0
 for qemu-arm@nongnu.org; Sat, 16 May 2020 00:12:43 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZoBl-000342-TP
 for qemu-arm@nongnu.org; Sat, 16 May 2020 00:12:43 -0400
Received: by mail-pl1-x642.google.com with SMTP id f15so1753872plr.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 21:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZDKRidBIC85qhIE/mm8bhXDBJw4FDy1it2kQO0M3tLU=;
 b=rPyqbEfxzphncRuD58gLnYXZrshpk5d5NAKlcfjktRCfrPie+KzCYs6iIEXWaxym7b
 4xFmyv+FUkqbNI+LgqAsUvOxKmYC4NjxTrS+18tKEs0LGWxtF2xH85XpnnG+9IEQ0AXo
 z4uMs8q51o8ixucIpsgEsdNNBRmhad+yoPsr4XEUUJ0pIEShhg5HV1Zeb5Y09dj1guVR
 KvRNh8ljovte0nQAZrv33+JZFK/AimPKbYOpzwg+OTKZPBfSL9DqA4f1JnZZRMJ0pdUx
 lK5bdQmI9WJU4uk4RlcUqdtfjRzEpsORL+LT/YhtNFu6FtUKARxC7eY5WGTDfJuXc65p
 /S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZDKRidBIC85qhIE/mm8bhXDBJw4FDy1it2kQO0M3tLU=;
 b=p5HHned0UL9DHnFN9VtOrK1lom7oa2gm7UbK+xGwOHKWM+v6fzMbo80zoP7K2tVtIC
 2UT7MsiVf6zhlA0GrIB2YcAbupUyQaIGYbyInS+2atD77spacpXP68Wzmc0TCp2c1P4a
 uN69C9guEjeQ4KKrTDnaBgx2PNaEmXemLeBG4HfJo+YHGpk8gbs3klWth+aShAwKvw8l
 r0g+xJeXYM29QJcJZf+S8rmdEROLbBeJFqWdrqMVtmHpPZmXEyMiD8iZYT8K7aznfQ/r
 baWfLq5ZgBdMShBfXZIIfFpfHPcrxJRYTBq/LB04Gvjsh3uUrNUxP8VOICEFZvOwhbBL
 kiPw==
X-Gm-Message-State: AOAM530+96bV7CvVPHhmB0H2RvKPtZHUj2pZujhwNuo6sGbGV6YYdHDt
 ag2F1LHoxl7T3CxOjmtV5Qi53g==
X-Received: by 2002:a17:902:6f0f:: with SMTP id
 w15mr5734373plk.191.1589602360109; 
 Fri, 15 May 2020 21:12:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l6sm3121033pfl.128.2020.05.15.21.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 21:12:39 -0700 (PDT)
Subject: Re: [PATCH] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: Peter Maydell <peter.maydell@linaro.org>,
 Amanieu d'Antras <amanieu@gmail.com>
References: <20200507202429.1643202-1-amanieu@gmail.com>
 <CAFEAcA-n8-pOcwovsS1Z3T4AMa1Nueo2yik9zX5H16QAHeE05A@mail.gmail.com>
 <CA+y5pbSueV8HQKQEZnBS4DvOvMDXUY7HMaODNhY7v-fKkJJPYw@mail.gmail.com>
 <CAFEAcA8etD+V3KrCFwvqfDuZ0x4_cW-RN423WG13iVpJBRvq4g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47fd7f16-a7ed-e3ee-9a97-b2b21f43e7b7@linaro.org>
Date: Fri, 15 May 2020 21:12:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8etD+V3KrCFwvqfDuZ0x4_cW-RN423WG13iVpJBRvq4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wFJtz/S3wsqt

On 5/15/20 2:25 PM, Peter Maydell wrote:
>> You also need to call arm_rebuild_hflags() after modifying CPSR_E
>> otherwise the change doesn't take effect.
> 
> Hmm. I was expecting cpsr_write() to take care of that if we
> updated a cpsr flag that was in the hflags, but it looks like
> the rebuild_hflags() is in the HELPER() wrapper but not in
> cpsr_write() itself. Richard, does anything go wrong if
> cpsr_write() proper does the hflags rebuild ?

We wind up rebuilding hflags multiple times, is all.

Most of the time we call cpsr_write we also do something else that also
requires a rebuild.  So we do it once after all updates.

We could probably rearrange code such that the cpsr_write is last, and then
sink the rebuild.  But I don't know if that's clearer, hiding the side effect.


r~
