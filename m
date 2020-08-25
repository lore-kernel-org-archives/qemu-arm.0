Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp98954lfc;
        Tue, 25 Aug 2020 11:52:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAjpZh79D9cYz3FQsyPjoZvNYSsyfd12+sx2tN6Rf2yX04oHCXMqrhl1ntdCTeyd/1CBuC
X-Received: by 2002:a25:e049:: with SMTP id x70mr16834952ybg.428.1598381524831;
        Tue, 25 Aug 2020 11:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598381524; cv=none;
        d=google.com; s=arc-20160816;
        b=i0YnyD0IC7MZfPl3IAPJXgeo5MJSu8nOsngS7UU0m+TI+Bxm5FSuuXfZHkldF1ui8a
         n9cZ7LXfoK0Ok2GK+3o03arXLnNbeNH0U86WuP2NigJHbF87swumrkiIpdmnTlxlCtFr
         qndOkbsPJVA2JrIB5XhN/K/k35WeapflYJYMA3wUgWs5lxS0nirgYsifi5rGOM7hsKln
         h8Iyp4dnBNio+JsFfN4j/YsePtm6hE+wAlxJkTeduyKuiSKsLOo/XG+BMSZhu9uweVrs
         pBDOvm+cOWyHYJ2RG+TbUD9k04gW2xUpN/okqH0Oh4KBvFf7dNKnpmt9IntEDFQuZBS3
         88ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MIMHNjqCWChO1zQcIX6mrRMds4H3wWi3qxahwcJEa4A=;
        b=TlhRhpzJnPCKt7Lb7KiI4jwNdHNlOILZWDtjI6TzERuGncKtDDAH7S510hYXDodmMD
         imGEUFJdK4pS8p117QaJhFTjpNUQYKLmabLVq5Dyf/+AJ1KBJ3DMsunEYJX9WCFzj/Db
         p5uh/CAfzgRkJgKRX5SDs8Ra9ygWzIlC+vYbM4sfSQrHpKIhD0AxHpmW+ccvJ5Hk7+MB
         pML2e0j8RT0ua2NxBEvjLHmRuSjr6+zYF03CsbFYpZAMEmOhwaTgxUCn75o2LCg5EZbr
         tBVcVNRyaLqmtX2AV1MQIPnDdmjCUoDs+c3m9rU9DQ95TklsvqaqDeeKSN30Jhuv0djD
         sk1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kHWS/Wks";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o186si15445805ybo.358.2020.08.25.11.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:52:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kHWS/Wks";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAe3A-00012q-0J
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAe2j-00010C-Hp
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:51:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAe2h-00028u-U6
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:51:37 -0400
Received: by mail-pf1-x443.google.com with SMTP id t185so4931249pfd.13
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MIMHNjqCWChO1zQcIX6mrRMds4H3wWi3qxahwcJEa4A=;
 b=kHWS/WksGT7JXtxvjSx7h1BJklrzTydWDGhQJiZQ0YWmFH1R1vEQrreW7qkZ5zQPuw
 w/7Gvtw3bnyaaNw/konlmDu1Fd1M04A47JEaihCVo7dzazldb6p63LJrh6dKJZCmBPFD
 uO80vkzPaPwbQqsRXXtsLAF6MIwcIz5tQT0GOTSQLEgMZQa+Uka/x1N8IY9EmFo95Bs0
 id6Bd2IQ+Orgvlg9OfjXp8mZvGWpej/Z+jTMQVuNtMF5Ml7S8vclrmpj1yuPD5kIZw5k
 gDNsgD9qQ/cJnKOrg0CmEKCk5FKu6ogxYQf5iYOznoobLNruVkNHenPQDm9Ea5ZmJMbp
 jDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MIMHNjqCWChO1zQcIX6mrRMds4H3wWi3qxahwcJEa4A=;
 b=Ni9uWLif549ZaAoTx7wugdtaE8fSJB4vdv/W5DFwlafOCrl5XwmVss8zOtDOowAVbM
 Cmp55nag64Cs7ShaoX8wl+55hN6MyBwYnLs5eYIzvIB2SjvnsAL30rUx5MfuJeqGjfDM
 OVpbDmJ8tGOBWPy86VuE9t/lsmNhc00VwPD/0FgFaX3eBl5zR1ybIoYDhpZSxBfwdE54
 RcOnYyi0XP291bEE2536AB52tnIa2XmDn83GepIYY7g94bRLKXNLKtspWw6JtBWR/pDk
 KRTb67d/duBb1NmGb6L/ldrYK7hFnDPoTzreiBPqGnv+MV+dkTHanmDvYOWtjljImiHW
 1QCg==
X-Gm-Message-State: AOAM5311Etin83XbprKuS0QNsGy04rzhGiv30+ncAuKW0iQPzyn7l9rc
 wYK+2X+M4wmPVET7WMZ5ECILSA==
X-Received: by 2002:a63:5c65:: with SMTP id n37mr7679134pgm.294.1598381494402; 
 Tue, 25 Aug 2020 11:51:34 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id i123sm2442577pfg.85.2020.08.25.11.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:51:33 -0700 (PDT)
Subject: Re: [PATCH 16/22] target/arm: Implement VFP vp16
 VCVT-with-specified-rounding-mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cea54f7-dea2-9e54-8f4a-a1c171d17bc4@linaro.org>
Date: Tue, 25 Aug 2020 11:51:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
X-TUID: gywr26d+NJeo

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement the fp16 versions of the VFP VCVT instruction forms
> which convert between floating point and integer with a specified
> rounding mode.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp-uncond.decode   |  6 ++++--
>  target/arm/translate-vfp.c.inc | 32 ++++++++++++++++++++++++--------
>  2 files changed, 28 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
