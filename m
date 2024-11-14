Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp467762njc;
        Thu, 14 Nov 2024 10:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa71JBVqtKMnTxH356htc5xVaC2DjxfM0td+NxPFGS2XCyjYVGengf7/5iNbtPOeFcnBhJhYWxSsnxSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEW8lR36rL+yazFFMKQMKLAQ5aW0JJlvuE5xlu2L7AtOOtIdMcKZ7lF9isQSuwwNo3tDqPi
X-Received: by 2002:a05:620a:f10:b0:7b1:5424:e994 with SMTP id af79cd13be357-7b35c0bab64mr368625885a.26.1731608164257;
        Thu, 14 Nov 2024 10:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731608164; cv=none;
        d=google.com; s=arc-20240605;
        b=gHEr3WOxao7CfVh5LkA9AhTksj4xCy96KDaHbuQQXBCv8QlVxSJMdB407nUUlbSysZ
         lDKcQfHcNIzqZwyouE3lKSRsZ301C60W4CC/a+0sMiZg4V4vAQ8Rq8WYYdkyU6RTcsb+
         rvvqAeTFQoue4c60sZ+95tbLAxz1ZO6zkpCQamVIk0pFbToiP/V0BV4WQhNT+R5iQ9p9
         LN+sNPKvy/xxZpCpe3ISxu4Rqx74nQkDHrSWqe9LxbEB3R41+vIFH1vdSphtyE7P48Qv
         A15+dQaNEPNnbv4PxJ8hgiwYJ1nHo+l0tlK7/pfhOI5g0freebfL3x2b4+YrwMI3adnL
         by7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oK0qe6rZPZL+Jl4h4TVfnW307/hc1Lf6CUUL31FU6Ys=;
        fh=BJLEpMFkRBiPKfC671lYNdYB5e5FHwdzZ4ORSJyfnYs=;
        b=FCwPhOVuPGPPgknqd7X+2gPTIZupy9BadUBbi7dte2rczQYYJ71Ni8hMitDNFmsn5j
         Ky2/hNoWYspVejv28bPzG5DS2gUprl41AQ7GX8VeQXMzvgstQJdPf+pkJQeCGhypcsoW
         kOpp/gB6yJ7XW0db/1rQwfL4zi5kTuou6hQaIyqzG+EsDqAgDXBhg27Z4nCupT+UFv2O
         0VDBDRdza8L8fyvPbRnknwhV+EIgOqeLfqutqt3RzoxUOFclgfBKAVsp+ZPfxPA4UR/N
         slI4ASVr0c0pZ6iVHjfq5Oo+iUCIbpKJshuy4fyS58q9B6WNe/S+RbhJs8xIWqCYUye8
         JgNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMVQbXGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca9b5a8si162627485a.434.2024.11.14.10.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 10:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMVQbXGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBeNE-0005IW-PI; Thu, 14 Nov 2024 13:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeNC-0005H4-UR
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 13:15:18 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBeNA-0005YC-6D
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 13:15:18 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-210e5369b7dso11082575ad.3
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731608115; x=1732212915; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oK0qe6rZPZL+Jl4h4TVfnW307/hc1Lf6CUUL31FU6Ys=;
 b=bMVQbXGjZvMAp7xoGXTk8Ch3g7CcarcJsaVink5eIIa30zKIRmSlQsMVzU/tLqlzbP
 OulZ8LYGrHrZ0Je1eqofxeNDl66carFa7ckgEUluDEd+dgVZr4j6qc+0uUwh6LBMMTyy
 D125WdERAr/qYdF2t2BpZbBPWr/GlZK1saowrwQCl0tPGy756iQgkL583xa3zgKN47zG
 9OMgmy5XFHhRo3cIli1CEquM5jrGWsZEokw8JAYl9pGMtKtQMgf3BcLL+kA15qf15eU8
 mU9yi0guXxa/9NNK16ivVXsA/mmnh4ofAxhPSYOtJHbRWuhhTmGnXCcDsC/tQ4uub7SN
 sC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731608115; x=1732212915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oK0qe6rZPZL+Jl4h4TVfnW307/hc1Lf6CUUL31FU6Ys=;
 b=K+gmAZYBvtDT/dzeWHewJFiIkX/PWEIb5ujo/dZOrdcsjxX7bpu4+YMmwHTRhzCAU3
 KMNWfNvidRdrQT+QsM4UtyXmfc24j/D5/UwBdAlNBlBk+TccxQe3eDObMAOlTKHnvhTi
 Iy5YZ0RBSHW9EB3rfATiBlPveIVxjK3g8cDtzsb5gozd0ocwP3JV64n/YHAEwP7kcmLa
 gZycAUFwSXEXrxl9ufwKXELU+Rot/4jqJxduSPy4LB/OVn1weBwlN6//gOcQiq8u50b4
 vhjVhunlW/xq1R+PoFAHBIZA1xSHv5646yqevW/XUJsTIu9Np34tPUcgkhGpt13/jFwg
 ogyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJb4JywLS1oPDTBE2geHzDFj0VuLjqI/Gz5qOEac95Xrn3qyGZtnXu64CWS6jzu+AtrZqVNxp8Ts98@nongnu.org
X-Gm-Message-State: AOJu0YyAXCtjI1iB94jQVdmbIH/SYqHZM5Z0Uo4PWTBzmpip/NOhjvW2
 aruF2oI7yn2ZoYQSpyUCFYT82cA7hR2gOwLfMVYBmIU3Unh88jzFwngB2kMt+fg=
X-Received: by 2002:a17:903:1788:b0:20c:e4c3:27a3 with SMTP id
 d9443c01a7336-211c50c0c0amr37845065ad.43.1731608114713; 
 Thu, 14 Nov 2024 10:15:14 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7ce96fdsm13591905ad.160.2024.11.14.10.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:15:14 -0800 (PST)
Message-ID: <bb19efcf-654d-4476-b34d-72900df877f9@linaro.org>
Date: Thu, 14 Nov 2024 10:15:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] exec/cpu-defs: Remove unnecessary headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GjcXtjSDgEgS

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> "exec/cpu-defs.h" should be kept as minimal as possible;
> besides these includes don't seem necessay. Remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-defs.h | 8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

