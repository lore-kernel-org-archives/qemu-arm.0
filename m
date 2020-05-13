Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp710379lfb;
        Wed, 13 May 2020 13:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhsw8AeoB2dOn+A3mT/cOsBjOyspDM/Tm9pXabtcVlDN32ZD1ALoT2JaHf5S9HjLPc6tMl
X-Received: by 2002:a37:a551:: with SMTP id o78mr1466572qke.439.1589401814736;
        Wed, 13 May 2020 13:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589401814; cv=none;
        d=google.com; s=arc-20160816;
        b=mfETeCP3zDolct0Y6RsioG7aOG//FcpVa7xyIv/S9zEcZZpyDbUhsz5kqH2BujSGNv
         ITKovaty068+YqBaGzzR6PF8bOX4tDb208tDX9iMak4A/q0Inl4aDlZZVrzTHBK4D+FH
         KZod5XzNTSSIMLOTg1Ketihzr1Qza/GXE4hcawohdWeUeUVloROU8em9OGMxLEXeaBuf
         0pGoB4XUYfxd+v9oNY717383O5vrL9WZM6xmc1kW9wTHDzlIShycsb4bGG3/p5rUWxJM
         Wjkr1S3nMOQHs7130k7z3wGYYsqMP9HsXraiTwsthYX89HlmA8lCooAiuoGtc0tYqLmg
         JNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dlKWQlnRe7VeGR1jc+33OUHP7qtqCYADhb8eLWTmcWE=;
        b=L16HbLRdCue9ZSh3PhYBQFWi2nHcawi955wK74M7siu4VnSWs2huPx107Mi1Gisv7c
         WIoDIJfo6FDeHs8LUqXE7K4Vb6dxXZshbZ0F1uRRDP3JXnp8Bgdx0Lr+So+pfBX/pUJn
         5G6J/Y6OJ2QWlVkC9Z5OOx8vVxKahSDjxBJn3OP/wqrcdxusrU5dI1VtTl+h+u734u+d
         Drm6gCDGfxBgZmnYsznCrtdyJT0wphhE6LDB5r/srBT8fwc9NpjIhiIsqZd7BMBj0zdD
         XJu/wuXYWoD0LYx/1Q5ofunWOQZXtZMHS7rUWZ+MxWOyx9qakMUCGpHCFLXvznyIaCBe
         ScCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keh8gorX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si329738qkj.210.2020.05.13.13.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 13:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keh8gorX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYy18-00066R-4M
	for alex.bennee@linaro.org; Wed, 13 May 2020 16:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxzw-0003xX-Pe
 for qemu-arm@nongnu.org; Wed, 13 May 2020 16:29:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxzt-0005Za-SC
 for qemu-arm@nongnu.org; Wed, 13 May 2020 16:29:00 -0400
Received: by mail-pg1-x541.google.com with SMTP id t11so259897pgg.2
 for <qemu-arm@nongnu.org>; Wed, 13 May 2020 13:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dlKWQlnRe7VeGR1jc+33OUHP7qtqCYADhb8eLWTmcWE=;
 b=keh8gorXAYfnkUOpY2saXB3crcpyssrf8r0CPY/9vWTSc2X3bbzlJMITkiQ80qp1FM
 2VZPHelL5/zmkPlpYFiS8H5H/kfqZb6UIFIi55/JjA+32UqsVAASqqEU6BIgLrlXDj8Q
 1X1rpYEfoF9ibHtI0epxTYgGkeWp+K72lNfZLZsLMB0ViCao/N5xgjTnk1X8Qcz5nA5q
 5m36Y1BDPai1FuFV/AqBhVt35Kkcgt5r+W+eDO8u/eoRVN09ifZu/kDg92cKM5TRu6ta
 utKoipY/h7/69y/XdfgXcnBo+YutqjX4+gGCrlD3qSGOif/Zd+VSJA5GDJgsWZtzY01i
 XHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dlKWQlnRe7VeGR1jc+33OUHP7qtqCYADhb8eLWTmcWE=;
 b=bKMRY9YPCYy47oGcAi4oKX3mpKUoxs84oe6obW+I53etqa64A7W3TLxyq8zAkI4l0X
 ZhkfiEQipmMcWanGBTPcGg+QIffbo5cRuBqvU+nJYjehFdpjjmATJ8xDrcKOV53Z/sMJ
 veapeMUkP7znaSvEIcHWWFegQF2PTI5EWnOIBYGU+VRVmvQPjoGpG0il8a0MrNz9en/0
 jL6gjuebYcs8kN3kylqpqVMg+BPrewQjc9JAdFoT/qSnT4YSQCVByCZvQu79Y9WDAkX5
 BuEYxnmoabfz5i0pOaLXqevlky6VRext6s95Xgw2nD/hrJMZ/eIZZcBbUIQSlXxllqvy
 rXsQ==
X-Gm-Message-State: AOAM5319qHh1mblfDWhX5l1qtQByIfB/G4/pyvQGC9p236UtlMSz7EL1
 tdTBjZ14tL9UdumCtvJ532+CEA==
X-Received: by 2002:a62:e51a:: with SMTP id n26mr944286pff.301.1589401736449; 
 Wed, 13 May 2020 13:28:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z25sm336890pfa.213.2020.05.13.13.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 13:28:55 -0700 (PDT)
Subject: Re: [PATCH v2 13/17] target/arm: Convert Neon fp VMUL, VMLA, VMLS
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e18bcf96-be43-540c-6471-1681acb4a653@linaro.org>
Date: Wed, 13 May 2020 13:28:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
X-TUID: CzpYq3s7b7Oy

On 5/12/20 9:39 AM, Peter Maydell wrote:
> Convert the Neon integer VMUL, VMLA, and VMLS 3-reg-same inssn to
> decodetree.
> 
> We don't have a gvec helper for multiply-accumulate, so VMLA and VMLS
> need a loop function do_3same_fp().  This takes a reads_vd parameter
> to do_3same_fp() which tells it to load the old value into vd before
> calling the callback function, in the same way that the do_vfp_3op_sp()
> and do_vfp_3op_dp() functions in translate-vfp.inc.c work. (The
> only uses in this patch pass reads_vd == true, but later commits
> will use reads_vd == false.)
> 
> This conversion fixes in passing an underdecoding for VMUL
> (originally reported by Fredrik Strupe <fredrik@strupe.net>): bit 1
> of the 'size' field must be 0.  The old decoder didn't enforce this,
> but the decodetree pattern does.
> 
> The gen_VMLA_fp_reg() function performs the addition operation
> with the operands in the opposite order to the old decoder:
> since Neon sets 'default NaN mode' float32_add operations are
> commutative so there is no behaviour difference, but putting
> them this way around matches the Arm ARM pseudocode and the
> required operation order for the subtraction in gen_VMLS_fp_reg().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 ++
>  target/arm/translate-neon.inc.c | 81 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 17 +------
>  3 files changed, 85 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
