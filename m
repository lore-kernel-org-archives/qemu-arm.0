Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1766625lfc;
        Fri, 28 Aug 2020 13:34:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/Ae6+syQsptXOoZnFbYUU3zaEHLpWMap6qnztUV8aBal4MKKwpuA/YhijUgaKcsmEIapq
X-Received: by 2002:a25:2496:: with SMTP id k144mr4494019ybk.24.1598646863718;
        Fri, 28 Aug 2020 13:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598646863; cv=none;
        d=google.com; s=arc-20160816;
        b=XaD5O/W3tlagufycx0ri/XSEhqK657qZs5ELQoGknSVBaR7WAsUFmDAKJHE0vv21xt
         Mbdu4jagvq43pugtM3uU9sZvxMlj8zZG3niL1NGWQxMsDjMfh/3AjByFvVVYmmpJcpJm
         pw9FUxffphqJwYRtN4Zq7xT8Q85+zgnzbSELYbpHnjI0vXhc4u1xaW1trg+q8yPIMSlS
         SIJCf96lfoRi/autb84SrsZ8PvG2euDJzdVRUlZCYP6SL8agUR45mVDq+CQkY5NkIOTR
         VxwEz+/os0qIT2o5VEs02NZB6uJdy1zPFCtTVilKtj9Uz4xlLS4DYaBbzOdyBQ8qgVlp
         TINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OQygBWHACdJLdEJnsxYXuKSltvPMBiSKkoQRYnAo6OY=;
        b=p77g+6kUrH1fBePg2V34LKiUDeKbj9lGbv+46j/mpitVTH5R5cnP78tlPydyeKoLU5
         +M9Yt3Kfp/1fmiD6Bqr+K/rT+VaCE79ZSnzmrHkiZtVWT5083Xq1KkR0uekU/d8Dyr5j
         EA4sYyXC1UuQc2JvnlyeP/Z2lQpPtMTEExztc3F5KMnwyqMx2igcWTQLJFuGVWHwedG0
         Bf86Eg98SQQcO3ISS9pFGkRo7xpfUGxoH4ejojak5oSqKm99R7SY+M7wUzzz4km9r2lf
         2Zug3KDuLxxmhgmInMsBoG9BuMPpXZ+HIQtaA4KgrhVhQxxyxpz+Yp6A1bOTE77qH33X
         rIOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GV1rMkKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o197si353425yba.199.2020.08.28.13.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GV1rMkKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBl4p-0006AC-3g
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBl4f-00068U-F4
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:34:13 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBl4d-00045B-SI
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:34:13 -0400
Received: by mail-pj1-x1044.google.com with SMTP id mt12so119050pjb.4
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OQygBWHACdJLdEJnsxYXuKSltvPMBiSKkoQRYnAo6OY=;
 b=GV1rMkKleRFKRvpRfMUQ2JP3E1oBk/27tOlFyKhgzLQ6Jn+8uhUL0aprxYPYbaxZKF
 W5V01ZsSLOUTM2QxgQZSSbjDnBlWacY4QqW3PYc/DHo9Bq2lAFQy20Cxjyqoenas6yme
 tD9Yx1X1TTRlKblrItXMJIZg8nbZ/haz/U0rwOw9/3LAqajuh4drTNf6vI2Jg0bm06bE
 dQCncQ3hIhLGQ1zaZFTWhSRwzniH0fMbS951N3hOdjCi7m00eH1jqpsdTNFlq6SL1h9v
 fC2tJiZpYGhMfz0GN7vqCK6qo29fK1W+LIOGCWi3WNOWD+I1NC3C0lMxNmG3Xukiu2dK
 kdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OQygBWHACdJLdEJnsxYXuKSltvPMBiSKkoQRYnAo6OY=;
 b=cLC2iAxSA8v9TM4miPnVLX4/YX/bodG5aCG2H9n1iTb6YYMrEvP5wKf2hLpnGfaiJp
 BP/g2Hq0qbqZ/HBL/c4C2MGERHtlVDX8hPFUstepTO41JsTdA9wfdsIb+pcN59N/jydc
 Oer3DUUR2DnIa6WPxir6KuMq9uP6JZy8LBkdTQPPurLezTmNUKCPnf9giuHmJAyqJ51I
 mxkFwTroMKbZQAwDQOPbVHYUO9GyPXpSxtmdB/a9k1tyA+kVeq6yfJV0PAgunOoZ+rg4
 ArXSO55roTLKQ9IsEcLu6ySn2NeFUAh7Y1B0E1jFa0RqI/8SYkcRinz3UQysNSs0qfHG
 DcXw==
X-Gm-Message-State: AOAM533zU5QQ3GvaDWnxZFd9f933imopYJ8jiLxTVaB5oxTSwHrclVaA
 17PyK+xtHDuXpFYUsb8CHVhEqg==
X-Received: by 2002:a17:902:e787:: with SMTP id
 cp7mr500565plb.125.1598646850519; 
 Fri, 28 Aug 2020 13:34:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y1sm289191pfp.95.2020.08.28.13.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:34:09 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] target/microblaze: Improve transaction failure
 handling
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200828113931.3252489-1-edgar.iglesias@gmail.com>
 <20200828113931.3252489-3-edgar.iglesias@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3556c713-8635-2868-cd4c-387fcef6c50c@linaro.org>
Date: Fri, 28 Aug 2020 13:34:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828113931.3252489-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lcl5Xol3VQgP

On 8/28/20 4:39 AM, Edgar E. Iglesias wrote:
> +    if ((access_type == MMU_INST_FETCH && cpu->cfg.iopb_bus_exception) ||
> +        (access_type != MMU_INST_FETCH && cpu->cfg.dopb_bus_exception)) {
> +        cpu_restore_state(cs, retaddr, true);
> +        env->sregs[SR_ESR] = access_type == MMU_INST_FETCH ?
> +                             ESR_EC_INSN_BUS : ESR_EC_DATA_BUS;
> +        env->sregs[SR_EAR] = addr;
> +        helper_raise_exception(env, EXCP_HW_EXCP);

I think it's better to use cpu_loop_exit_restore, adding the one line for
cs->exception_index from helper_raise_exception.


r~
