Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1311381ejf;
        Fri, 12 Aug 2022 11:49:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR58J/W16c846wCgT8sSkq3n3P7JO0RlkRjBXyMStaC1u7TP2m9NnTqBJshipCuM2J60Z4HL
X-Received: by 2002:a05:6214:c8c:b0:479:2293:4cd9 with SMTP id r12-20020a0562140c8c00b0047922934cd9mr4678719qvr.104.1660330183012;
        Fri, 12 Aug 2022 11:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660330183; cv=none;
        d=google.com; s=arc-20160816;
        b=oHos6XRnvrfRZncRCXHFFZ0NLukF2RIYlsbLBhMF+JIYBTRyLCWEc3g96Pb5bSG19D
         DlFYe+D14pIYFF5RC+aagUj9Yc4Qr3EiTY77/eEgv/gH4Y5wwVx+uAHzRnAhrFzYQiS6
         IHWp4d9Pe84d7v0XT+nD1LcDFdKZVuRevhMatnSDvhyS01VbvpDIV6F5y31ssMiSH6f3
         kbMo48NETjI7UlPRCrdoIqIgF8H20u/Ut0MK7gmGjAJvqTGPlqB7QAKyvgSW0ea4fpBO
         ObYL4a9dNeeetV5HR9znvM3FABXMRjKs4Ql/KMOEoC6t9r4BW7cr04oMzASf7MMA/nNa
         H8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gTqMZbvThYf+YZ8rZTncJub37ToENrJ/c+STF8b9lyU=;
        b=itlIQw80M0Gg+wAj3wsJ4FZ+H0QA3Suk8JMsm5afQTHuSLKfz3r4jKYfy0MM8ZMQQJ
         y7OhBM+T4xIp7qIBElvJyyVCoTqT/fsVYhj68rR/1ranULie60Gk+xBeEFhBM1RqvHuM
         sBzYVzljEfEUnGbrz0ZIEEjxRg3QOxZrojTFz9asYEsbAjy+7QEKPZ+9B4J+GQB9sLHB
         nvh54HMA+M/xmyO0ef2P7c73IBPTp+ZzJdj0gXHN4aYZApvhgG93rBDw49bugLJrd9hF
         qpBxbmlx+Fh1Mb7HACB6FTM2Cgg/EPSA/oPe1dVnx+sNvymV0hPz/6oel1GCz1K6xaDh
         l/Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSNkC6Y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020ad45bca000000b0047b295589d2si1489906qvt.554.2022.08.12.11.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 11:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YSNkC6Y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMZj4-0001zk-A2
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 14:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZB0-0003Yk-HC
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 14:14:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZAy-0007Ha-Nn
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 14:14:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y1so1427031plb.2
 for <qemu-arm@nongnu.org>; Fri, 12 Aug 2022 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=gTqMZbvThYf+YZ8rZTncJub37ToENrJ/c+STF8b9lyU=;
 b=YSNkC6Y4lrG6oOWpZrc3ZbrUPYlspKbsgnBnDdopJtAFYN89tFn1NyjrwxkUB3j/uG
 GiN75U1vZxaCdMZYgOEAfNo9yKdahkuD3Vy6aftuKvpz/Sjj2+VnLR8ZEPjaMUcrrrE7
 /+LNZdH6pRLSZxpdH37rS9XuqxBR/bkfVRF6oCW99fKsYxF2J4PKTtQuyXxSME6vz0Nu
 o6MiyiuFsHGEQsb9vk55jAe3KN6h45hn8LUuSdluATyzOnvTNPN8xMr6cVl1ruJhkGxl
 WsBn/xesY3S05cAwJ8H+bapbxeYmM2EOXA1EHrXY03kGuM0AiJGcwytvdiDP8GQqoLsO
 /5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=gTqMZbvThYf+YZ8rZTncJub37ToENrJ/c+STF8b9lyU=;
 b=gV5R2TY7Kbc+DQy/2b2BTpI28eh4QWNB2xdFLAVLoZTJGPAb5XBhtwdpcc11vykwHm
 FTrpTPZcdNEcqnm+AoWz/x19fZ+l/RtLkYwckad6EBUBFFm2T4L/0DJxlJijjjN6ZnNp
 uMMl1rFYbKaZYtTHUB5zMVI2wMimJOFf/ERpGck8LKK2/auBuDCt8dnbVa84f8+/rDst
 NtIPEtsC/vrCk6CCc9zfF5H1FfFJe2JJLTtBmja2v8kaBIMBJG66t6jFSfyXg3J0F9xw
 bmDM1RijkzU0k95TWxenyLT74/sJ0txVCH2rlXAaBYXdItdENi1P3jJa7xR9J0wGwo5O
 G2Tg==
X-Gm-Message-State: ACgBeo2iYHeG0cPbe0IoQ0kV4NCUhrozYsoaeyjA6JW2ig1dk8fnRZ8C
 fDtmqkDYYG8gdFjqXQsh2nOKfQ==
X-Received: by 2002:a17:90a:9b85:b0:1fa:5d22:c92 with SMTP id
 g5-20020a17090a9b8500b001fa5d220c92mr77002pjp.51.1660328067085; 
 Fri, 12 Aug 2022 11:14:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a656091000000b00415d873b7a2sm1625154pgu.11.2022.08.12.11.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 11:14:25 -0700 (PDT)
Message-ID: <6bf620cd-6601-e624-ac4b-9d2f5f4a11d0@linaro.org>
Date: Fri, 12 Aug 2022 11:14:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Rearrange cpu64.c so all the CPU initfns are
 together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220812174156.1460714-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220812174156.1460714-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: CWk2Lg1I+qD/

On 8/12/22 10:41, Peter Maydell wrote:
> cpu64.c has ended up in a slightly odd order -- it starts with the
> initfns for most of the models-real-hardware CPUs; after that comes a
> bunch of support code for SVE, SME, pauth and LPA2 properties.  Then
> come the initfns for the 'host' and 'max' CPU types, and then after
> that one more models-real-hardware CPU initfn, for a64fx.  (This
> ordering is partly historical and partly required because a64fx needs
> the SVE properties.)
> 
> Reorder the file into:
>   * CPU property support functions
>   * initfns for real hardware CPUs
>   * initfns for host and max
>   * class boilerplate
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I started off thinking this would be a relatively simple "move the
> a64fx initfn up to live with the others", but because we effectively
> have to move all the cpu initfns the diffstat has ended up quite big.
> On the other hand this patch is purely code motion, and the resulting
> order in the file does seem to me to be more sensible.
> ---
>   target/arm/cpu64.c | 712 ++++++++++++++++++++++-----------------------
>   1 file changed, 356 insertions(+), 356 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
