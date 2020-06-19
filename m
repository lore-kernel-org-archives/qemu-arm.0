Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp881455lfm;
        Fri, 19 Jun 2020 12:26:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiXZfknkUkUZJieCo8dQ+FMttsvw08Zhk3Wb6EBHYnc9egKAyg6P9/vwoMQ4Al2zNDhv2B
X-Received: by 2002:a25:c141:: with SMTP id r62mr8287549ybf.52.1592594777502;
        Fri, 19 Jun 2020 12:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592594777; cv=none;
        d=google.com; s=arc-20160816;
        b=Qom+d1Bzh2N1YHMBUyQfCsQArUYm1fVYDGk93/eimfDnSjcD4rCTflvdIlSgCEY1oI
         PmdxhRdeVDWTdAABdMY85OarvYuGue5SoCVkYEwv/GwnAYQnknpo1Uh4WSEY1s03l1AS
         HZYFONnCSgJi4ooD+BxtPMGax8ceReokBogWs0fhiy3nWL8IgU905m07J+jaNgZaybEZ
         GZqAmRtPvu7O4aFH67u/QJXD3yw7NPS9xrQtB7nJ+uucBiGyPSzuHL57fLcMbuzi/rz1
         mvA4DufXlUxN1ztwyVfo8AlylZ/5RxaJhuglQsVwXqQ87suV30jz0/iw4en0CP9fVvrG
         Pozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TJlps8KoSmjaLf7uOiyh88B4yeRZgq7XCqlG0Om+4HM=;
        b=fn8vmOi1Zk+txcyDieT1ZMA+zb6SLfFYc30pyRoaotMA/WzDlCbDiscQcINBU4Au5D
         bn84VlloIm7cwmpD+iE7QxzdHr2N8zptfX/NwKJOHxBoA5ygp73U/vZ+lsEdxI52J1sC
         gIL0KxWu6OZHKQ5m+0OEo88lbpK51mLibDQ9T/edGjC/nwAbWcAfkkAG/4halN7Ej0Hu
         2MJ6eawSEtxKb0/mmapKhynYsXsDxrOo88wiAC0Cxz3Nk7R7OJxoYeD7HeDKCgNdaYwm
         e2YexnFYRCXo8rajytxgvXVR9JtYbxTEGP3maNwO6HZMtAOcfwi47jfAaVIL97o/812+
         4Dsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GXIfl0JH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si8989280ybt.495.2020.06.19.12.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 12:26:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GXIfl0JH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmMeW-0004AX-TE
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 15:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMeP-00049h-NX
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 15:26:09 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMeO-0002ip-3z
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 15:26:09 -0400
Received: by mail-pl1-x644.google.com with SMTP id k6so4282248pll.9
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TJlps8KoSmjaLf7uOiyh88B4yeRZgq7XCqlG0Om+4HM=;
 b=GXIfl0JHnGc2oYD5fIwZFaqgNmBG0iKsIBIMECayK4Tp2ke1rO+DKwYweGhT6Vax9g
 Vv+wMp2cDit5VK/f6DbS0MqZCidRpJV8uuRJV9jDRo7JyhWM1sQ37xBXPDx4DTliVDxg
 NedcAL7ZNOKPlFiMI7rLRJD2cGz7R5Vd/VfK3otnn1o10QeQiV1zKde5+/Ynxb9vx3zB
 yRSbB6s7hghK3+2uKP5zN2WvlmVxNax18VGUZITus3rxaV5uxIy3C5d1gnueVmwDPMCZ
 TZCB8G6dPjnly+KbEZL46s5M7wIGmfg2I87kxt7xQvY1HPVJa7sBSII+O1k9yCp1MsTf
 O43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TJlps8KoSmjaLf7uOiyh88B4yeRZgq7XCqlG0Om+4HM=;
 b=SGC+uLWSICXTMXMHwE6+jhsFvr7fL20fuDxqvNAmRpcRvq0wP+u/XL2AoH6P6umm64
 5BFA6/HD1hb4Y3SQr7OUQrpwCb9iMqDDUSXDYZmbB7jUr+YRbfbxxiZKuN+Q84p6uW4V
 DBszAVCDlpxSqFgPiwJePqYfG7n6dmmrcVfrFLOF/WSNlGXkGY8yoh/neMX7BAlWYBHi
 htQ1nn8cLg/qG85Dse8wAaWHWbzFpkLFHHC1Rr1WnDF93+CrfPCpNMvnkZVl8FHWsu8R
 W0CyeSfMgRUAM1v007r1qag0StqOgKERPAnApdnC46McJ5vDVZ0B6hgaqP5dW9NhbWaQ
 mZgg==
X-Gm-Message-State: AOAM531p9s3jarBu5lRfGCBoy/svoo1NzFG66PAM0zINOA4dCdoLlRqq
 kmFi5xAU+goX2cTaUJdkHqs8Gg==
X-Received: by 2002:a17:902:968b:: with SMTP id
 n11mr9140381plp.331.1592594766507; 
 Fri, 19 Jun 2020 12:26:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 84sm5901012pfu.167.2020.06.19.12.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 12:26:05 -0700 (PDT)
Subject: Re: [PATCH v7 28/42] target/arm: Use mte_checkN for sve unpredicated
 loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-29-richard.henderson@linaro.org>
 <CAFEAcA8ZYhqbO-A=FkVzgKkcTm1tVVZSB0C9HOFAnYG7jaFPpA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2ad7bf4-7972-5640-244f-e25ef29c6ec7@linaro.org>
Date: Fri, 19 Jun 2020 12:26:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ZYhqbO-A=FkVzgKkcTm1tVVZSB0C9HOFAnYG7jaFPpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZ61TcQhVtAZ

On 6/19/20 6:58 AM, Peter Maydell wrote:
> On Wed, 3 Jun 2020 at 02:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Commit message suggests we should be just adding an MTE check
> but patch contents appear to be moving insn implementation from
> inline codegen to a helper function? If you want to do that
> it would probably be easier to review done separately from
> adding the MTE check.

I don't recall why I did that.  I've made a more minimal change for both of these.


r~
