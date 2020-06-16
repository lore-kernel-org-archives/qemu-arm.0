Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2850625lfm;
        Tue, 16 Jun 2020 11:20:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmDEnr4zgOBAkjal9xXA0ua+ATKPjBC8oan93hkMKZ8WKXDIfpL24xiq3UUXiDo/yCec6v
X-Received: by 2002:a5b:f4f:: with SMTP id y15mr6277815ybr.184.1592331640383;
        Tue, 16 Jun 2020 11:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592331640; cv=none;
        d=google.com; s=arc-20160816;
        b=YBm72UXZiXi1XzjsjGLRHSNjOUwn1le83YoW1v7D1GrFebfuJE2YQ5mz+EF0FGiOGb
         UI/bThBMlG/X+hj+zybBG21O7wjl7CXZ7hMdcJqqy87sm87acHxkxpHQUtIjeIZ8clTA
         a+fniDwMfXeLoFN1iLORmfO2RQtUGoQBBtqXwv064KkA6zkiuRmrVJkXLhm+2ZFrW/9y
         /6RSRl4hcjLPre2E7L7tb6ttsvhZCp2/Qv5g7hlESbDTgBxqs/92HLrOoLEWOEMQJA5K
         25cgLzz1ERstP+nT16uPqDtn6tSQoiXp77cRNQCKGlY72d0oz1JPER5pLSCOSUgV13QU
         cOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=T7EH541OwJ+vrz3gLWn+IAXHtNpDt4gK6bJ8iw4e7F0=;
        b=jVn2eMTpkkU0QpdtBZqTS7b3YPMvT3slbZ5EAE1efrZKJ3fI+1ZRLXOTdcMWNxl+5g
         etCaqwoFk5kbIrG4M7myHfMMu5V4vPj7hntv3GlqJNYsmZyxd5FDyiF4NcgovZzYcjec
         jTWs16ph+wfdvFZpUoUVc1/9rMtusXDdYkanwsvqxvRxyqlyiIGDj/Ts6lH+dzy8GJVV
         9Xe4wj3pMHFQmJExMKFJ5CXMwO6idXHATwl2PDv48Mae4a7Xg8GRbLZGIpDp4uccagm1
         zt44o14X1pBdCblDnnyBK+wWD0n/q4nV/0oNTPxFfsht2/jl9/whKXC/xOZO7J4+gfxq
         DuaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6GXsRQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si11851045ybc.254.2020.06.16.11.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 11:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6GXsRQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlGCN-0002JF-5G
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 14:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGBl-0002If-JV
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 14:20:02 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGBj-0003Wu-9v
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 14:20:01 -0400
Received: by mail-pg1-x543.google.com with SMTP id v14so4580737pgl.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7EH541OwJ+vrz3gLWn+IAXHtNpDt4gK6bJ8iw4e7F0=;
 b=I6GXsRQrfK/+moh0oI6VM26S11JJlnTrRUgeyhoqZsLMqn6GiQu4U0Zb3mcpAj77EN
 5adRHuwrG+rDJtJ2KVT/182NMSUGXph0x66juyJXzgWXdSFq0kjTfxQrEdepQ23EXlXm
 IUTD/L/jv8q2Dev/tsTUtQB5szxMEe0H065PNnMv6AqDglvjzAz1Xc33y9q3wr3rIWED
 oAcz79QFIsqjd5h9qBsqXdDXl7oU6mIH6Qva9/gwSI+JFh+PPUFrRBJh0bprNiRc8mHj
 hB9H8LsYCatuw8p/M7Kdh9twN2hHBpIS4fvH1XG3pOmZfYOxZAmrbaFTD1WVYG/DW3Em
 12KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7EH541OwJ+vrz3gLWn+IAXHtNpDt4gK6bJ8iw4e7F0=;
 b=KY1EvrC6MRMPFP+w4jYeqzSPlzB14SE0x2t9Dz1Z48WTZd94wOJL2zgFi9G5oJuU0Z
 swasDi3RsZgTH0r9xmS3sS2gzddxJbIP9OSgk8yqTIVAn68ooIZo6Iw3AgZX6NdHKouI
 MoWh8Orw3xlR4M5wX637np9Hl51siPXSVIOdTTKkEpxQ75olJOMbqkYh2RaSdTk9Yue6
 RBGsdosbcwzVEPUQob0M0h5qCtpSYfKYIO7GNKCpilO9EQsSet4xeTe+n9n/GoR9m1Vz
 iANYdPIYySwrv65NHJVQNcOExp7sC7kA91HrAzQQiZCBGK8vIZKOwNP08iwREgnn5qGh
 scCQ==
X-Gm-Message-State: AOAM533Qh+GD2uytCc9TEMLalVCbS93IlkIbDLILODxgfCc3yyju4bOe
 vu7k/xcVfph+0QMUfQ/xsSBA6g==
X-Received: by 2002:a62:1c8a:: with SMTP id c132mr3295154pfc.69.1592331597550; 
 Tue, 16 Jun 2020 11:19:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm14534684pgv.5.2020.06.16.11.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 11:19:56 -0700 (PDT)
Subject: Re: [PATCH RFC v3 0/3] target/arm: Implement SVE2 Crypto Extensions
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200427214046.31401-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbc874a5-2e5b-05a3-d52d-d96ed1fa9237@linaro.org>
Date: Tue, 16 Jun 2020 11:19:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200427214046.31401-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qj0d7mywvuiT

On 4/27/20 2:40 PM, Stephen Long wrote:
> Modified some of the crypto functions in crypto_helper.c to take in a
> desc parameter.
> 
> Didn't add a desc parameter to SM4E and SM4EKEY since it is used in
> translate-a64.c and the functions in there need crypto_sm4e and
> crypto_sm4ekey to stay the same type (i.e. take 2 or 3 parameters)
> 
> Stephen Long (3):
>   target/arm: Implement SVE2 AESMC, AESIMC
>   target/arm: Implement SVE2 AESE, AESD, SM4E
>   target/arm: Implement SVE2 SM4EKEY, RAX1

In the end I took care of these insns myself, after rearranging the AdvSIMD
helpers.


r~
