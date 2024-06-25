Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp685761njc;
        Tue, 25 Jun 2024 07:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTrcyggLXPL9CJqFfY9Z6I4/MQEMa6kak2BB1Wt0ZCK7kC+TZTpiExoTw3p2XS7865TmdV5aWxMwV4WOcQE0J5k7lwTYY2
X-Google-Smtp-Source: AGHT+IGaHvaOrPYzYVhkH3AriJZmz9mqvyLeh+DCKUFWFfxYsDTY3nkHteXb9BLTPjegHAmebgsT
X-Received: by 2002:a05:622a:758e:b0:444:f6d2:be59 with SMTP id d75a77b69052e-444f6d2bf7emr20810941cf.0.1719325127362;
        Tue, 25 Jun 2024 07:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719325127; cv=none;
        d=google.com; s=arc-20160816;
        b=kb9SueLPfbV3CsnEE88omGsS2BKmYHzZGcB/y8a06gWdVA4FLcgPCXahTxgqpwxVDD
         xAq5hVxIPc+nfGrzVBrXFskZaatsYGEPGlIIdR3Hbl6s42wNcIhPln2g2NTYDI2IqmG0
         LpSKxz22pgfC73C4WWfvmWyx+0Dcc06Tl4TOM32nqQot8nkUyElyRLKMG3xHsjw0AbHV
         eY6qxNXf/r71ai/MbfZ6X7KMWGqG6qvbuUUQ+PdESFeVCIYsw+kOJqwlStAOjssFv5X1
         wDquSubY6nlX/Tpzn13qGKG1pO8ww4ryWo/wB+KWbRR+GE9MEyDHvfuudc3VERmgCUMV
         qLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H/ixWVkgpNyWpGkhhn1OIETZnWzp+znJ996xRf7NEyw=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=wkwYUwcMfbDC2IpQ6kkJzcY95PDYwWYIjAC08CXq/dbauhmxy2Jc0MxKJZtbu8/KT5
         sYHDJgp3LvfZkXeJJPVEeIu7FGgQbu/Iv8v4KpEyZSPmgYbumuh2lgofoVEhjZdMxQoA
         snN3XkssNNZPK3CvEqQxI1y34fOhJ3/H1ivKkWD5jUljwXxy4pu2iUoA1AzTXQk9fTsn
         0Wllg6cLtaJv/zx+VDe9diz+yF+QGcLfQfz2g8/UB5FBiKuF+q1ONW+7/LLUjBvRm/On
         WR7xjzu6LDrYMxxD+N2f3NkiYB0Snigl8S+7VbNl+Mb3xwB0aM/QQQOMw1VX10+emnC6
         ZRAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JplviN+7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b72234si119900711cf.208.2024.06.25.07.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 07:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JplviN+7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM6zv-0001rG-1Z; Tue, 25 Jun 2024 10:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sM6zt-0001qu-HX
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 10:18:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sM6zs-00043r-1i
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 10:18:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7065a2f4573so2853997b3a.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719325090; x=1719929890; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H/ixWVkgpNyWpGkhhn1OIETZnWzp+znJ996xRf7NEyw=;
 b=JplviN+7lp0PLLA3sBbGDth3M0AroN4OJyMlv4CjIUZBliBByMvrkQm5pKS9KeZLhx
 FxH4RLlPBpKSMQ9GEw6kccuJRqN0kgsTp12IHPdfo4wWJdCUb+/gZsp+18LjOPMhAk+t
 CY9Wpa30ss085Ms1l5KC/Q4btJnB9FxOuWCGc1mxmM0X02WmTYGs57LYNR0cKNHP4fXh
 KG0CvpMHTnZYTuHXgnJV95JlTn+Gg9hYX02WUzz9c2xigw0iwjY37VLIKb2YzKKljFo5
 VCMcpwKNSxRTYvjr4iBuawv43OOO9FdJew0T+RKBWERVgZca/twl/evXZQkiz1tzJXDE
 E0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325090; x=1719929890;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H/ixWVkgpNyWpGkhhn1OIETZnWzp+znJ996xRf7NEyw=;
 b=UqkssK/KbpVH6JmI+EoXhE9ZedDcjVKvQJWOHDcBz9sPYRL6Cqxh90qIJG1AdQoRtw
 wCa00tcCKTp5qy9+rv7QudyryuQgbzClbcVAAatO7LODaRez/0z9amnX86BuOYr1B0l7
 JFEx7VU4noHUxtjGVWKV/nTpjWPY1wyYY14BvIp0rTT8Un7eBA9Bgfq1EKx7awenoSd/
 JHFNw27WfkT5DvWyO8KKFqMnvrxPbxwbUq+XYTb3i3sEvZcKi6jQW2KxkDe/q433IpV2
 0qdXPkuLLejSulKba0NjURaWtZpIs5rUP82lyfbsYwPqAO1aPwFf0mAwqJU3tYeJdPKO
 fyTg==
X-Gm-Message-State: AOJu0Yw+6koi1cyjaOwkTF7cw06+yEXl32mUNXhmG5LwBNJmuP9y0bSb
 NgoVpbJBozdnoiV/SI1YTx5oUpMwXH3tVSgalY3sz2KZQhoT1Hyvwr1O6G3BGJQ=
X-Received: by 2002:a05:6a20:72a4:b0:1bd:1d6e:d448 with SMTP id
 adf61e73a8af0-1bd1d6ed4d2mr2260438637.27.1719325089452; 
 Tue, 25 Jun 2024 07:18:09 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7068c719371sm3232547b3a.102.2024.06.25.07.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:18:09 -0700 (PDT)
Message-ID: <997bc99a-bf16-4a6e-80a7-c750435395f0@linaro.org>
Date: Tue, 25 Jun 2024 07:18:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] target/arm: Delete dead code from disas_simd_indexed
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-14-richard.henderson@linaro.org>
 <CAFEAcA9aij1SbdEQkR9=UhJO2uz1u90881FwC8KHLYuLFto5AQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9aij1SbdEQkR9=UhJO2uz1u90881FwC8KHLYuLFto5AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eg6UO75+Yhf0

On 6/25/24 05:41, Peter Maydell wrote:
> On Tue, 25 Jun 2024 at 06:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The last insns in this block, MLA and MLS, were converted
>> with f80701cb44d, and this code should have been removed then.
> 
> "MLA, MLS, SQDMULH, SQRDMULH, were converted with f80701cb44d
> and f80701cb44d33", I think, since there's still code for
> all four of those insns that we're deleting here ?

Yes.


r~
