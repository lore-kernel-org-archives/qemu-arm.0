Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1856001lfc;
        Fri, 28 Aug 2020 16:17:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvfNwNwoGNhKFCSS0yc8FWmx6wOaJCw+ZoOogaPSR6j7RyLb16go8/hkJb2rTqpmle9KMx
X-Received: by 2002:a5b:f4e:: with SMTP id y14mr6279627ybr.71.1598656646035;
        Fri, 28 Aug 2020 16:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656646; cv=none;
        d=google.com; s=arc-20160816;
        b=TSermsbBsnJDXY8NLeF16UZC0le22HwV/ny2lUD13NsN9zIR63Ylz7naQH13+ztxsL
         dfk3fnI05WmZp7D8yudj8lU/8wW7r9RWIsn8dGOaWWFHvTyIq1wuv0vC43XOBwQXwM/S
         NClKDQzpJe1hgwP/DfInNqsujJ8knegRAZ8vgY9kB0atsGfkirg97xtodsTIMTbsg7Iw
         In0SVwFxm1nPE8wNcMbqHFqwSN4puvzFCh57A/V+ls1HwbV+jHvPAQKu/odJugVWQWtN
         RhPMmTE1FprDHFeRWceWaJaW2rT8vsu0Zg2VU7a2KM9EpR7XOp/MwjJvGDkU8XyhdQQs
         d0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WKPuF6nu4k/2N4sO+8gvg9BI3JXuK9p6B4RQgnxh8h8=;
        b=U+UjWSm9UrB23mJiD6rY3IQVRSF96cj8PWQ2eE0GSpbloCamXD/NPY3nmtjoa+gstC
         AKjj+mSTkyvhr8ZJreB+XsD8fSkO42Jpq2MfD/6MYPnrBHVKuC6pmbSV4k/LPs+BhA17
         9ur+GhPEWJcsfh+XXdqcTtkeNcky3UF1lBcRIurK7I3wnvUyNIbN2+B6iLs/rwNmsDEX
         BWEOnURrRWnrIbZyawMDGA9k7JiB6CxLQEksITE2We0rCSNUpsq4o+ARQCF3+84HiBoY
         vnvkTT0Be0xvSNw5He8IJ0SIjXqN3+PuQhHKILjTDoY4XolxDEVflMT3mtKuRKs4l9VC
         QkEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NW79tk1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si667098ybj.55.2020.08.28.16.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NW79tk1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBncb-00078D-CA
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBncT-000760-Fx
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:17:17 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBncR-0005p3-Te
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:17:17 -0400
Received: by mail-pf1-x441.google.com with SMTP id t9so1395884pfq.8
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WKPuF6nu4k/2N4sO+8gvg9BI3JXuK9p6B4RQgnxh8h8=;
 b=NW79tk1KpnlqiWJXb0vUr20f376PEiJWAA2xuBcXIShPy/9VBu+CkMGgur1WHBFuka
 49dqQIAKStoRg4pnlHKOHjgf03lITChPKG8aNrSjDNTuTjMtFnJKO7MYUHhU05M+D0PB
 RwOL6GalmucfTCp2VF+QekLy9Wfw63k5fAzMvHIp3kGo3LUdgNSxTTcKvk1mh/wIsNgj
 fu7oJC55Y0wKar1Mxmq8GnL0BzSH9TqVUpJaXk20VVIa6bN4XeWEzXHW7b7N3pUa7HVk
 F1XWSrKz4NCKMSEO3UNZen7zvp9zZt289CUFc2UQugGZbCn8rVK/PSaNY1g+/WfgQFTJ
 VGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WKPuF6nu4k/2N4sO+8gvg9BI3JXuK9p6B4RQgnxh8h8=;
 b=dDXm7s/f9li+hWTMBLPghflHqjsPlqRyKthEp5hSKGxD6f0BOq5EFDcpujuHafCrmM
 rZgmLJMPUdUeY+buH48SwFO0pDTR7/RJmZ3PQWhk5uwSSdsn6StVsvU5IivFsGSTRf+E
 pCwWgI/UrWfT78H638F94sXUmoVkKct90noU8LGXUYspGUYFoIaT1qmEmKeh6bRjvbEP
 DCrXHcISgx2AaEF5sgcZlrDkg8rtZIP0gxn2x1fBquI6LcPNaDqYtmYOXymOIEajAyZZ
 tq1upv4VBvbL3MJ72JVN9n4/WrhFAdJySPHs2x3Z/qRbKiGjn+SZUZ2BGtA8NHSaiHbg
 b5/Q==
X-Gm-Message-State: AOAM531UFsQlNWbOWowbgZEw9Fuq1xrkUKTW62Weah4vtNw+2iEDs1xu
 3TmrNfEg3C0iuqAR4iDrb4H6BQ==
X-Received: by 2002:aa7:92cb:: with SMTP id k11mr1016253pfa.233.1598656634658; 
 Fri, 28 Aug 2020 16:17:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a12sm471811pfr.217.2020.08.28.16.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:17:13 -0700 (PDT)
Subject: Re: [PATCH v2 42/45] target/arm/vec_helper: Handle oprsz less than 16
 bytes in indexed operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <637fa692-1cd6-9860-d895-199a531f8385@linaro.org>
Date: Fri, 28 Aug 2020 16:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8QvXdJcqkwPL

On 8/28/20 11:33 AM, Peter Maydell wrote:
> In the gvec helper functions for indexed operations, for AArch32
> Neon the oprsz (total size of the vector) can be less than 16 bytes
> if the operation is on a D reg. Since the inner loop in these
> helpers always goes from 0 to segment, we must clamp it based
> on oprsz to avoid processing a full 16 byte segment when asked to
> handle an 8 byte wide vector.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vec_helper.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

