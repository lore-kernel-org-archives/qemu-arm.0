Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3530829lfc;
        Mon, 1 Jun 2020 16:13:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+umYZRhhn7ucswcwruj+Ekk1jFUXJFAbWa3VCczA4FwEGZ+qm26hA/wRkO9F04l34P3mY
X-Received: by 2002:a25:60c4:: with SMTP id u187mr36375124ybb.509.1591053222616;
        Mon, 01 Jun 2020 16:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591053222; cv=none;
        d=google.com; s=arc-20160816;
        b=q9o3DK0zv48XQTE+TjsCw/IbslGUj/m4zaUziNBhSJy2IgwiwmaOyQQuP9EFeq68Oj
         /duyikiRl252Na9pYKhQu6ccW0rlCq7oHbG57K5mWcESGl5PHZGgXkjY/YmG6jojfyFR
         jXQ9erMaImo2iMk22/IdDIGfd4/rn7KdKEkCofW6CCBZ7bOHTlPyCRuG7G+KqUyFi208
         rl1M+jwPW261ztfpEInY+aJKeI6I/5KoAOj57eObIWRw0KeDLhz7QeQdZs4vRhcSfs8p
         Nw8I6wqhS4c19zHLHSj9aTgaS1TBVGR6fWtwRjkJi8tShFAcQ7acblmEc8T81KGTbMhS
         afpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1h5rSefFpVt4cVbiRRC970N1zUoUvg35pQmhzPoffj8=;
        b=pn+vJf/KPwUVF/SeuprZGdU+GSI+/2FqAUF04I7xn2/NKmqCcyIME9x/2hxhC1srCY
         iBKMAGP95AJqVcNDcnWgBs3rLaYZW2pLMTY+pA7D+REkQrhhj78IVoHpxsXtehfW4xjb
         EqHrKB/egXPCeXEOuV+U7kRiZgWiU4YIj0XpretFXcjaO47z8dTVcq6/ep6KWAiyTWwF
         ++DY2JUMAEbQolhi7YC42CqyOwW97XXWP7BPzCZxgBSAcAk7CxrEko4J6iXb7jEVS4t7
         PfnHWShPvXx1Kv8do1KCRU1GqVQCvNz2PiFkq4z6tfDqxmO1JVP5CWcSbd8GHaDQT6ml
         bEIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrgtQpqj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j202si645993ybg.372.2020.06.01.16.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrgtQpqj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jftck-0000jt-07
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftcT-0000iK-LZ
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:13:27 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftcR-0006Ac-Ku
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:13:25 -0400
Received: by mail-pl1-x642.google.com with SMTP id q16so550785plr.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1h5rSefFpVt4cVbiRRC970N1zUoUvg35pQmhzPoffj8=;
 b=YrgtQpqjWZe3qaH+ROM1esVcTcPCkw8zgui7wEBOEwlF6htqSosMP3OkzifWHi/T1m
 6iuaOEGIj0d8lZLIiHvD6v5wIb7+PjkPijE910thT2qqRk/Gch/Eeyf6QDFPEs/QrUgB
 xdfJjM8TV/2M0XEzafD+VuUWR2iAJS6v078my8xkIsqQe01QSXYgNL29gK8r1Mto2BFL
 VFbKX4kvW26UcesaPgIFVbLW4wUL3e4oqitYgy9/MJDKyx/RFua6t41JtRdEZhWYmgHT
 CBaK/TZAGw9vKMMvtAlAQ8AqgZnDB7gdNN2dVAqJ9t5u2gVovPwFWi+NKf+IGlaMQR88
 WMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1h5rSefFpVt4cVbiRRC970N1zUoUvg35pQmhzPoffj8=;
 b=jeJd8xhHe7kcZMFTSgAsJ6UHAfxs4YLSF3qxgd5mTtu/lkQdh+eggICochX5jA+c37
 L4cOkBEUh+l+sLIchvr+R4E91OnsmKJAiP/Rc0/cmVWNai1/Z2WNbgtzTG2QmYgrhRYo
 +0pjtrU57PuIfluVy9RsZ7HizZvhqBEEugvayyVcPBbuZh/sEaiqnoSX9bgEa9JDzUu2
 A6MxzvUIj5syJRK6DPdFmEiGe9uuTmt+m3gD7EspEYGqWLdBT7UDGjWRzxYRjsTLfxh0
 vjghHT/DrGsX5F6+6e2iEWROaFRE+A832v7BYfkafCDzuZRyzZ+cRJKH/u2fjOqqHRyO
 3JAA==
X-Gm-Message-State: AOAM533UejDS7B1A7+GmHOWmbq0PXrM3HNRZKix8cXYLIu4F+CwCa4oC
 iUD5Bl9bCrV/WJtwle5M15rd3+v/8Bw=
X-Received: by 2002:a17:90a:2a8e:: with SMTP id
 j14mr1929789pjd.136.1591053202010; 
 Mon, 01 Jun 2020 16:13:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id v12sm453575pjt.32.2020.06.01.16.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:13:21 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] target/arm: Convert Neon narrowing shifts with
 op==8 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200522145520.6778-1-peter.maydell@linaro.org>
 <20200522145520.6778-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05a6da74-6142-c730-df9d-1122db434e01@linaro.org>
Date: Mon, 1 Jun 2020 16:13:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522145520.6778-6-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQBNEYTZmbik

On 5/22/20 7:55 AM, Peter Maydell wrote:
> Convert the Neon narrowing shifts where op==8 to decodetree:
>  * VSHRN
>  * VRSHRN
>  * VQSHRUN
>  * VQRSHRUN
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  27 +++++
>  target/arm/translate-neon.inc.c | 168 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |   1 +
>  3 files changed, 196 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

