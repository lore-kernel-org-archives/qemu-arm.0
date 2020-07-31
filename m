Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3754808lfy;
        Fri, 31 Jul 2020 10:56:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI/bpKK1v72AzsFklcb6I3ixRNFsfZe5KTApzWVu1An539eONA/qVTtTX6h2dPmfsbmADn
X-Received: by 2002:a25:e90a:: with SMTP id n10mr8553602ybd.71.1596218199198;
        Fri, 31 Jul 2020 10:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596218199; cv=none;
        d=google.com; s=arc-20160816;
        b=zLZLsrp4FQgwEoxxG19VKwXuXdSmcOd/1aVHeAE7o2cpB3NFFyCrWDdPLvuejXDPtC
         6HzE3/+cv3ID7EHWW8fUuyJnTIepgfc5jo6/S24ntKtGXFkz8LW0oVrSC36FEHZwXxom
         LMsLPJaHOZlk1Eii0EQMA6neIfw0uA+ietwFY6e0zaHAZm/aX5yMMx8G0cjn3crA4DdM
         /BM4Y8UtC3hXw8LBvwnh4h4qcRVY0FHBIp3ZCX4mQW4cXqxmpiK4uWZ1PqNHsvXOOPiQ
         JgQ/l2UfVTxs0gniBk4Pa2ot+tRcmD/sGixu0aOXjIqWZxZawR8mjxVSHBjMnI2Kvc0d
         IXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MI0Bdz/CXN3HQeCnNcDPC9blrrXV7ibmK7ZZMdb1z14=;
        b=n8PaZ/L/IyBRHo3cA5hdosKhS7ZbSP/pZTCwKb+QIIB09XVCp96dCwT/FbZV73TSrl
         6poVGjW5EacZc2QbZsojYdxFms19bl44UTlpNr9q7E/DqHdBUGcENYKGmQQfrLYzbVaT
         jLqj/nG6BEbNigCJheIOlaqrPnNXWKG2JCFk4aOvw+CHoxKB+8c7kw4ASi7IT0jNcP61
         LGonXmPFGMcVXZTewuK4/S0yqnJ1B6gAaAV7wAe5TocfN1/GIYdkTJGnKzo3F9IFfY7W
         9k52qpYNU9OmGZJSU/jHvyTV7GTgDpKg6zllF3zp9tqvL7y5IvdMwEY6PKwTwctf6ehO
         oAtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DaIS7kIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si7582652ybp.182.2020.07.31.10.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 10:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DaIS7kIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1ZGo-0004Qw-J0
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 13:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1ZGg-0004Qj-Vp
 for qemu-arm@nongnu.org; Fri, 31 Jul 2020 13:56:31 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1ZGf-0002ax-C2
 for qemu-arm@nongnu.org; Fri, 31 Jul 2020 13:56:30 -0400
Received: by mail-pl1-x632.google.com with SMTP id r4so7158165pls.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2020 10:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MI0Bdz/CXN3HQeCnNcDPC9blrrXV7ibmK7ZZMdb1z14=;
 b=DaIS7kIecGIj7J4wp6gpDBEbmHMcPzpf5YW3rnH2C48wPrk5uJHcWicZ+26d0TNhQx
 EqZ5tskdUGDege3+T1Umy8489xt/zuXLXUrq1pCXO67aD2aknUfJSlCFbbLAMoVAX4IL
 iD4bY7dexrRa16w5LHAV4OKE3sc9HCFP+oGjfe2WpmCFaFy+sdM5hB0NF8pXnX8QEkWc
 Fj5LTxIEC/ume3mLPE/mh8IM0Qfn3vHJG4MU1WHHE9rZya2r2KH+156V4THn62EoKWHa
 I0U6QJ+yRJVF1iCXrmX1ECplh1iZgGeZcl6IttS0eVbPkkKy58OZGr+xzGwmY4xdMFSf
 Csgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MI0Bdz/CXN3HQeCnNcDPC9blrrXV7ibmK7ZZMdb1z14=;
 b=GkQzGksdFK4KqRYtEMabUHCG46nVS+74XouPaLfwDxSMrgYdJGY5OY6HY5u/GwIA3C
 N/c6T158T+Rp9ui3C8yL9LUMACxrh3mIGP5xFfn6O/0VnDaBGH7ejcgVWf0+SNjzes6S
 v4kbFx8vuUn9PeBqgQp8jpWwps5QTgOeLfNNwJMwMOKbtloYwxrHtJCXok7q2dB8iK/8
 hGfAfptE4niu6fBu+x+1lM+r4bHVSb9DLaiGGuCF30l+d53eI0Ghb+mFnSAqhTx0aMez
 jrdXVYb26zC5wyNIBvw0bRGafvlShO2VMXAWUdFZeATdbJlvKeJE8WrZDYTlBCZd6w2A
 9B3g==
X-Gm-Message-State: AOAM5314OBKR7veOOFZNTAdWOnKqKIeQxzvy3m+G1Qy3gJu696ZsE5nl
 3nM7qx05RrLFHXUWI0zM9j6NQQ==
X-Received: by 2002:a17:90a:7c04:: with SMTP id
 v4mr5458406pjf.191.1596218187716; 
 Fri, 31 Jul 2020 10:56:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y196sm10646556pfc.202.2020.07.31.10.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:56:26 -0700 (PDT)
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Peter Maydell <peter.maydell@linaro.org>,
 Derrick McKee <derrick.mckee@gmail.com>
References: <CAJoBWHzJq-51dBxP8pniQPd7fy7J+jU2gHwZOkn-NRJzc5uNiQ@mail.gmail.com>
 <CAFEAcA9XmXhp+Crx09k++Ryd3jSL8U36FSMvw6X73sBFEmiofw@mail.gmail.com>
 <CAJoBWHypu+nJ4L3fE-tQzr_EWf294THGQkovTrn+j5iQ+b4MyA@mail.gmail.com>
 <CAFEAcA_H5V4EzaDy0C2j8VBYHtPu25vNj0SXuYLbypj6-m9M-Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52ca846b-5b0f-6366-da1f-277d73b3374f@linaro.org>
Date: Fri, 31 Jul 2020 10:56:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_H5V4EzaDy0C2j8VBYHtPu25vNj0SXuYLbypj6-m9M-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BwHVVEdAstx

On 7/30/20 1:23 PM, Peter Maydell wrote:
> On Thu, 30 Jul 2020 at 21:06, Derrick McKee <derrick.mckee@gmail.com> wrote:
>>
>> Hi Peter,
>>
>> I just got a SIGILL trying to execute a stg instruction with the QEMU version later in this thread, but the same instruction works correctly on the FVP.  Are you sure that all the MTE functionality is present in the master head?
> 
> I would recommend that you cc qemu-devel and Richard on
> these emails...

Yes, I'm sure all of the MTE functionality is there.

You'll need to submit a bug report with more details than that.


r~
