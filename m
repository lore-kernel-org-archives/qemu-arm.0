Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1830532lfa;
        Fri, 30 Oct 2020 12:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnyQjk5cdysKU8rDaMxJIiXJqeZe4CWfuTnwUA+JsuXXSNykNl1gmxMhSkb/OzG7uYZZj9
X-Received: by 2002:a37:b204:: with SMTP id b4mr3792844qkf.217.1604085712547;
        Fri, 30 Oct 2020 12:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604085712; cv=none;
        d=google.com; s=arc-20160816;
        b=V4atR1GcM5ww2J991wcWJdxJOgipDTNNxldMJYLbWqjTdWaqs34kxb0TlyYq4pCIVA
         A04fJgbfKsGuc8du4muTGQhXMZt2VDeAXBBnro28DsVWV5j7HYQqPlVAZ/QAManlUHIh
         mH1qHBN8kR72C+azTMfKahPGxD0xAgAudUvVV6VTptxuTIcT79ZNmMk19prrfdovoKqm
         Np5cyuCMptOH9sr36ZBlPFPn4ZeHCRoQnGgyxIHAPJkWOTXpb5HmUvTz4kioSBWP0FVC
         K8b2W4oI3peAikmjlGxOVh8lidASuVEirOc6tsen6FLik9dVizzKRTVtclAdFrOakydf
         l/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=d6sn0vcYdHHLiroTj9OvS1IZnUzqp3JVkiPdOZLorUo=;
        b=rvxHIvNCDBBDzFOenNwVTrQPZ9QNdoy45H2qy2TDbtktAqtE4uKafjyBfhcEyCKEGo
         Mc0s8qtyx+lmrJFL5nD5fX0CvMB6nZoMAHtpMXy5Cf5syWrWewkQBwVpBRttL57xUM8a
         92a/QKEQGRDx+GGRkHmqibOIW9mGYN/qfnz+4vMlUPVV/m55yksT0L5ZUMNXJzFcQfSo
         gMUEkBpsaPPymDor7flgmi7fTOncUEEU4RvtT7W665nvnBk3R8e1rcW4KLmOPmeDsush
         6296GNNNqP4lRt+PbYlrjIVWj0wYUEUWkUES/Cex3AXT1I8G9nHh+H0N6RCNmwPIeou8
         A/yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vb5FKwoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si4187106qvt.16.2020.10.30.12.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 12:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vb5FKwoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYZyC-00027M-0E
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 15:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZy4-00026w-1o
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 15:21:44 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZy2-0007yh-5h
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 15:21:43 -0400
Received: by mail-pg1-x542.google.com with SMTP id g12so6037154pgm.8
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 12:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=d6sn0vcYdHHLiroTj9OvS1IZnUzqp3JVkiPdOZLorUo=;
 b=Vb5FKwoUwkmLnEmeRKlGqwviHcpOZkAOWWRdqUQlFozlCkCXXt6oKZOpKOaOzu0jZp
 KhkhBvptgEGYE0IBOraGUzsJYJti9PNJcjb4dDZkOXcI51OQd9r9j9nlOn/xYNMF4BJv
 lOCdV/Gjx5o34JdSpb+f8lS2PEYzc6XhD47Is3bDOMK/oLIT04VhneYUIdJH6hjDJMFL
 QK8eNu8uZAoCoTNHlpmBfnTs25fFcCZWRcjwUc/b1DwOc1hsAdrS2FOIK5idQMVhMY/+
 TvHtEG5oI1Lu5Vmbjvm0Uhcj9RmY2pNZsH/CBuSDZhQnz8t/7o4aALHOZo0Lpg4qqTh7
 mJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d6sn0vcYdHHLiroTj9OvS1IZnUzqp3JVkiPdOZLorUo=;
 b=Mr+JhZm4TOH2k3g6QGSeYXmKHO+L28CfDtk3AheYrq66+/8DGEotjOTLA0V1AlIqhf
 9yRfCmKCPpU8B/zUhjveIuO0fpdTX9QrsrblA58ztsnCg2xr7Xc/Hm3BExAqfFDJKpoF
 k9IjnOzZ+WlAhDCzSW6MWZH3PV15alEJHPQylIKf0lXDqQdlETu/rzPJ7QmQiXEIOwOv
 Wyc810h4KewXyo2mP/v5zFI+0u1+U1NSrgGoN9XlCsu/rJVDFkk2bo4szu4eKTj7N4nw
 Rs9Q7kMCSVCK04vOhWR18V8jslZbNy9QEx+sLwnzRcBD1sKof0lo/MmhEzd0p7yc7nFj
 FEqQ==
X-Gm-Message-State: AOAM530RdUJOG+xVtsDASa0gtQl6yF2+IBNNXAz8GDhyfwpDBlXHoLVm
 KLEm6NZcFa8AYZjGys38tN9Fhw==
X-Received: by 2002:a17:90a:8c:: with SMTP id
 a12mr4627046pja.155.1604085700400; 
 Fri, 30 Oct 2020 12:21:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fy13sm4166667pjb.10.2020.10.30.12.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 12:21:39 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Get correct MMU index for other-security-state
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201022164408.13214-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77a9f90c-5106-27c7-ed74-8d68967e0cfa@linaro.org>
Date: Fri, 30 Oct 2020 12:21:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022164408.13214-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-TUID: jdkwM0k9lWYj

On 10/22/20 9:44 AM, Peter Maydell wrote:
> In arm_v7m_mmu_idx_for_secstate() we get the 'priv' level to pass to
> armv7m_mmu_idx_for_secstate_and_priv() by calling arm_current_el().
> This is incorrect when the security state being queried is not the
> current one, because arm_current_el() uses the current security state
> to determine which of the banked CONTROL.nPRIV bits to look at.
> The effect was that if (for instance) Secure state was in privileged
> mode but Non-Secure was not then we would return the wrong MMU index.
> 
> The only places where we are using this function in a way that could
> trigger this bug are for the stack loads during a v8M function-return
> and for the instruction fetch of a v8M SG insn.
> 
> Fix the bug by expanding out the M-profile version of the
> arm_current_el() logic inline so it can use the passed in secstate
> rather than env->v7m.secure.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
