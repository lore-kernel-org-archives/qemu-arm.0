Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp571923lfq;
        Thu, 7 Jan 2021 11:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8Ph/B/8fcxWqKlCQxA0s7F/Vdol5prqUwz1nzVX4LZGawAxmq+KgI66eyFoG/A04Wcof+
X-Received: by 2002:a25:5c3:: with SMTP id 186mr654687ybf.131.1610049515158;
        Thu, 07 Jan 2021 11:58:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610049515; cv=none;
        d=google.com; s=arc-20160816;
        b=hX7VW2EgOcW/NvA82HEhpV9QsFQxXKPgkf6/EdjYrsMCXs03Efry7P8Igq51USS5iY
         yTWWjc/EypdkavnQz+cve5VFnuXWJxZGXjj8rvDJppkxEfNXHMxr8ZxmD6So8i8ioPKO
         jJ1T0PD0FP/QjqLprXKyl4g3Ls+VJSEvrnR7QoSX3soDR8G08ksQbu6+hnodeVxI6oWz
         pXKcPzXbQEDY+CW8VbY2BhBWWx0tkpwVX4CNExiouJZC54RVRFJcn6SCA3chAx110Zc2
         N6aJEOQlvFB99OjuM0JahXql+thGElGEFWuVS6KSbldNlRXo0zoCcWXDMVnfBCrqTK9P
         KLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MsJKpkvAdQay/uAZyKckKdRqHA4VcbTbkpGrIBkZSVs=;
        b=c5A56iGPVBaw0UK/EbDFBNFhTe0t5bJAgMrRfIQQNhAl55laJpd0BITYQckQ53zWnH
         +4xn00XIUXZy9xycFL1SgC3hooDFbFYk6Cma+fLbq3ZWVXbNVx8OJ+rEhZu7bMER4UPp
         yPOd34U2oiT8o+fjutZSqhUiQs20AN74bZ3IeimYFB/RvF0oCUelCYymLlbT6awC2Nm8
         Q9nEGb5BqdNUmy0sReVmoLYzGYMVFQUuJoDSvF4mUAhw7dwYRuYRyNyK6UssnazH5oT5
         TeoEmLcnU/0dmhWgaveT8eYf9deJ+an6DRtGzl4OXLnVQ6jF5kXvHMYT70b/RhOrWHNc
         FUqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xNT1vJO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d204si7025587ybh.382.2021.01.07.11.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 11:58:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xNT1vJO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxbQY-0008SN-Hx
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 14:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbQO-0008Pq-Hi
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 14:58:24 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbQN-0003bo-4h
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 14:58:24 -0500
Received: by mail-pg1-x529.google.com with SMTP id v19so5672770pgj.12
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 11:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MsJKpkvAdQay/uAZyKckKdRqHA4VcbTbkpGrIBkZSVs=;
 b=xNT1vJO9LVtuC9+dsfsrSMTR4BVBklQDk+JY43KfAWu9eUU/gmSALPh00M/iNhyQm5
 NVbiLwSHuzlhqQ/ZJzzkGWMLuHEI/sG3WbWi3ph9N3UOnWvdWoyvOEo5im0qYqwBU4GA
 EarOsI0y8xEBxn0KB3EGTruiHP1bU93WMDnmgnIp16H07IkeaTB8ZFXZXI0Nab4NsgWw
 tDkYPiXIJGpx1sLCugUI5tbLZoi9/2Sg1Ourkz9WHfDkzQB9uvAuuSJCd3Nl8qdSTgn6
 ZMzL4gsuZ9yH6hpJr/MjrU+aB/BNDusRTURllT4eh9tXI7/nl8KVHivbO0ikRisuqMEY
 vygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsJKpkvAdQay/uAZyKckKdRqHA4VcbTbkpGrIBkZSVs=;
 b=d1IqZhL2RemCyIiQ9p03X1BBR/a8GWUALdK+wQkEXQG75GRcbyw7iCo5uOFrwYjUJg
 5bRY58H1IE3GRkHbbzVtgfUrMoWKZXly4W+07U6sDE+JHUAcX6w2+Z7nfM1naGJZ5bsy
 qX1EAqzZPWiNT4paV2FFV6Dj7w+Anqbu3Y2/q3HNOXrBTFMh9XSSHTqPjqWh2FxQR/RL
 mUQh8ADnKzV56XPwfzrO59QNRhD72gYSNV/piOdGlUH1poQIlJYeMVmOTi7j8eeE1DZ2
 +TAsCAa0/C54Rl0cB4n1VpFTULMvuvizHm+Z53FFE/uzlSj0bkH86a0iiVtnZ8Y72fAH
 srIw==
X-Gm-Message-State: AOAM53186BFSPkcAEePDdkC5qKo+JPsVHjT6gWp4XWlDfpqpVF7mHnsm
 UbwBnlYBAVFMDzce2G2yC8uceb5aG5JT+g==
X-Received: by 2002:aa7:80d5:0:b029:1a3:832a:1fd0 with SMTP id
 a21-20020aa780d50000b02901a3832a1fd0mr310351pfn.6.1610049501390; 
 Thu, 07 Jan 2021 11:58:21 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i2sm2991449pjd.21.2021.01.07.11.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:58:20 -0800 (PST)
Subject: Re: [PATCH v2 02/24] target/arm: Add ALIGN_MEM to TBFLAG_ANY
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-3-richard.henderson@linaro.org>
 <CAFEAcA8C5hmyTWq1VYfLueaVbw99=D-AgW746eOuQAOMc_tk4A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ea987c7-af0f-1428-5cda-0a53393a3838@linaro.org>
Date: Thu, 7 Jan 2021 09:58:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8C5hmyTWq1VYfLueaVbw99=D-AgW746eOuQAOMc_tk4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tRaq8vxEIVjq

On 1/7/21 5:42 AM, Peter Maydell wrote:
>> +/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
>> +FIELD(TBFLAG_ANY, ALIGN_MEM, 19, 1)
> 
> This is trying to use the same bit as TBFLAG_A64 MTE0_ACTIVE...
> We might have to finally start in on using bits in cs_base.

Oops.  Didn't notice this as I extended from a32 to a64.  And then of course
didn't enable mte while testing alignment...

I'll use cs_base in the next version, moving all of the target-specific bits
there, leaving only TBFLAG_ANY_* in tb->flags.


r~
