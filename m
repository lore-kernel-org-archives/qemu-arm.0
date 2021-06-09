Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5584588lfa;
        Wed, 9 Jun 2021 10:16:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG9I9CDWfwDwC5WcpCk0Y2gujfGhrP8jzZMxiKCiFDwxUxfzjEMgxhk/uHNRR72pwnOC7X
X-Received: by 2002:adf:e109:: with SMTP id t9mr884440wrz.372.1623259008719;
        Wed, 09 Jun 2021 10:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623259008; cv=none;
        d=google.com; s=arc-20160816;
        b=wEGQ0PfmFtrpTQoRYEGCtqhaNv7UFc9+WO0taRsO6LWGzpXpmK4CKHTVM6US/bjUxY
         xeh0p9aXkadqKURnlDjTG6mPdrMiEsrknsLgVlteds6xSIEwjPXFwGySx4kzk8S+bC4B
         PQf6ak5nC9RVNUkVNgLzv8fNuX0/D/qoSrlHiLAy8BkSZIZWCnsJXXAB6K7FbqCHjEDU
         3aofZqQHd5L+vMu6dhlw6k3zZJYJ501QAz+zUHWWAdb5HTfXK+v6lKxPgvBOSPhgOSbM
         E09g8pum7h9VQSg2N/IxdmS08VHHqhG73R1qQKTlddizHP+Cru8F7XajDacEnLnvXtmJ
         IAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hUdmkGn/19sRX69mgpNxzpzN0o3WuqwokrD2UVT7lsQ=;
        b=q/3CHfmP7GMUvSKuNeiKm12it4G3VZh28jvngjVi+/v/WwpUtObZ1zBrJ/oqoryuzV
         RA0QbL/KVpDlpfqlMG60AoBm/St1pWVqMpbuAhFcHtEuMhe683Rpoe0HEzRtrfLTA5uY
         0Gvg+rKRELp56vyhA2YfMVukcOqXazEfR0lJszNs5pciHEDAg6SGkghGaAUCbWJ2lyhS
         qDzX3xyHY0qbMCycWQIgWh9GtrZZ6AXLj008yWJWt8egKIjV4WTW48/JZJduYcS2wCS+
         DX2ac6zKWMqzKCMfUMSKWt1VUMKh29jLd0Ki/Knx7Uic4hkvEZNSBCBZOrccALOeg93V
         7obA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I8S8/6Pr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64si7300193wmf.48.2021.06.09.10.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 10:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I8S8/6Pr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr1ot-0003vM-RF
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 13:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1oh-0003sc-D5
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 13:16:35 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1oe-00053j-BL
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 13:16:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id l1so20064307pgm.1
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUdmkGn/19sRX69mgpNxzpzN0o3WuqwokrD2UVT7lsQ=;
 b=I8S8/6PrhkpTVez1527vLgRkTHOLotbejopt61WJTBOuSCzkK1t0O59RvidOXYF5eX
 CR4+RmOsY8dv0Pfo7DJQ9k5nx11UMQm7Rr3Nx2f8eC1Z9bQGD+H9R+4vj2vtoqVZzH+O
 heNPFCPvlLwDMgTBZvSNA87cUbV0xGJZyqZWEYKcTZfop1FJ9XiJCAHKWRdA6ON3xXPQ
 b7ElVroqStlWcQZOESU1bDJ9pC5hkgl27igFhUGFlVN4A0ig74MrpRHjs4sQd3+0Jefq
 n/VC0nkoxZd1/YVhjWTLZAnENnqNS8OCrIRm8aulW5Oinp+Yvx19RQV8u8sqMd1NI7bZ
 xhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUdmkGn/19sRX69mgpNxzpzN0o3WuqwokrD2UVT7lsQ=;
 b=fZg/Libq6CfybD+lUQBwu8d/Eg0n7mf3jZe3iQhcJsXkoNEiCLJaRZavR8Q/YRseRJ
 hCfOYsF+jIE3pkhplGwaF/u7rQ/9pT9qB8OirFeNM81lcgPVI+AVKUW6rp/6DJLVbUnb
 fr//T9OBF7dzJA+kCT8Dm5Gvnkv9Y6dXWYfCnuQ/pvkGQAifbAfIwfRyOXI3x9/Tz3FY
 PgxXXqnJr3vo79TZK8wEQLBIsAi7fQ9P5j5kh1SArYICJj+Qp+fhQWVePA+YdBpSr6Bt
 kp+dgXe8wzgGb5U/sOn6GXSQ874b/VK/kzpgojbQn+yQtKXAOMwpoKkG7B5+/sUjDaFt
 LnnQ==
X-Gm-Message-State: AOAM533Pq4AdtkZBwkf1VPht2b1ysgY7NW3QNj/z9S3017pz5CiuKg8k
 CHvUwbcwvUx5WWxiHm8WQt4xYQ==
X-Received: by 2002:aa7:85d3:0:b029:2ef:109a:7f08 with SMTP id
 z19-20020aa785d30000b02902ef109a7f08mr791392pfn.23.1623258990629; 
 Wed, 09 Jun 2021 10:16:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y205sm184346pfb.53.2021.06.09.10.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:16:30 -0700 (PDT)
Subject: Re: [PATCH 20/55] target/arm: Implement MVE VDUP
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-21-peter.maydell@linaro.org>
 <31d446dd-d17e-e036-7e66-fd7291827d9e@linaro.org>
 <CAFEAcA_bVkpO2pqqN8vKdt+U22gmkaSmmaWTP9KHwXQ-kOwz=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e49d28d7-5edd-78bf-41f0-e8597b678908@linaro.org>
Date: Wed, 9 Jun 2021 10:16:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bVkpO2pqqN8vKdt+U22gmkaSmmaWTP9KHwXQ-kOwz=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 5UYZ7SNfGPJK

On 6/9/21 3:06 AM, Peter Maydell wrote:
> Mmm. I think some of this structure is holdover from an initial
> misinterpretation
> of the spec that all these ops looked at the predicate bit for the LS byte
> of the element to see if the entire element was acted upon, in which case
> you do need to work element-by-element with the right size. (This is actually
> true for some operations, but mostly the predicate bits do bytewise masking
> and can give you a partial chunk of a result element, as here.)

Even if the operation did look at specific predicate bits, that simply puts it 
in line with SVE, which is quite happy with expand_pred_[bhsd].


r~
