Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3635550lfp;
        Tue, 21 Sep 2021 20:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJTp8qaigKWiDpqUCjKBtmoj5CA/hfdzaNhdrUsLXB8FbmoqXRVv5DYnqF8FE9w+3RnRYy
X-Received: by 2002:a05:6902:1145:: with SMTP id p5mr43770699ybu.305.1632280941597;
        Tue, 21 Sep 2021 20:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632280941; cv=none;
        d=google.com; s=arc-20160816;
        b=B9Z5l5yayGiBfOnAvVYPpZNCeqfuo6nDi6CwoNmsm8/HPhDwupRw/QlmuJ+EGXONhE
         xODdPI8h0aHAb52f5BBoPFegnpvbBeJYesr41AtNjn658EVfOA7H3NNDtXDLRg/2zexv
         IE4GUkF9bwRG0btWnUNdRYjrpFKio8JRIPcQQOH27TBdt2hi1XBKpI0ycHb3Ze/BaYCH
         hdbGjQbbmIomb8GQ6ooZcJjCipU705cYHbGP0dMIR/cCgazpzE5s12uXVJyFSEIgjEYx
         bPFmUaVqYMuVB6O1r/xmtyoo33S77nemYhOU1HHNflEWRL0FoMOvRuo6uK7uNm+1kV1C
         OBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uFL8DGo4ba5MDEPYzEJDrobGVTS/6kQpYyCVlL8MUA0=;
        b=iTi5+mYNPZJPPg/4daa0NyoeLe9b6oX166RPvOss9eIZrfvgLHmwExVaL1AKDLml+P
         jqw7vHlCIiX+SQvSRD4A+xwHVDLW9e1wT+x136qfwkryAk4mnoUOwtJnV8CdEFgOl+ZP
         R1Fe3yRQHPODWs/2BlRFB8VlTnfgZYdZxQMTU9rO0NXszlMOanzaadI+gyDoGzBGNWyt
         KdAa5gEVwMo7EbSMyOWt9/2wiyT+GFUc6brL+c2EMNysYkgHRl6AkE6IxIB3v5F8cNuv
         7bnuNjbVh15I+rdtk5PXmeNK2GuiJzvh9f6+dn3N9dYIT9ToXWnzusF8uVdP//eTcXmX
         UZpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqZ5HzMI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si1052858ybm.20.2021.09.21.20.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 20:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqZ5HzMI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSspx-0004Z2-0W
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 23:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSspm-0004YN-Q4
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:22:10 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSspl-0000sI-6E
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:22:10 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m26so1496894pff.3
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 20:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uFL8DGo4ba5MDEPYzEJDrobGVTS/6kQpYyCVlL8MUA0=;
 b=OqZ5HzMI1N+VvJliz5zn+AgO28gQiGQNDORDwWpM1mfz0LksZze5EApERncLD/p6er
 CR7LedNdU9xGrf3cP8DBRCD4mx608R6ztAYcSO4gy3GSeOa/LiIM9TJVx26dybCaN2PN
 HOHttobxYfWk2C+050BowXE7C88yhlNIhhkuw8FWYCvbHnQDyXKc3R3c77GqIkk+9Gro
 wTdLL9tgsQ4Zniw2/pwQA7epFZpm3zuuKKfo9+9n85rCHV+j29Jh+INzVrXrF5hBDQSi
 72wlFSkYaYCe8VCNzNZkY0fCSV2QgKvmWTH2xhhd0N5MpqQAB0QN5MPYcia1/0uu4smp
 H/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uFL8DGo4ba5MDEPYzEJDrobGVTS/6kQpYyCVlL8MUA0=;
 b=LfO5uDDh8R87lGPPLXHNshDZ/8KVtSDmwoMY6SPQRmgmJpuCHDqZad2MYLeqRrblf6
 8vbK2VPB/+Cp4v4ry58APtMJ0VdHdhSnmt3eYOhdzo05jKJ5NIfhAsa13IuBhcH7I3kX
 /0DGW6PuvHMlrDt+lS4lTwSwUPYdGLfnfCgJ6+V4fkqsYYFntOfg374xTMA/pEE42uDn
 I2ogBQyQ0UelY9cxKPOje18wNAQPQCUD1Xxjo7HH7sGd/bD3sO4jKLujRc04HdI8WiPv
 +Jb1sqogWJbiaFhAoLq4RaANgs/RkxMt61BwoOHWf8zeTFtOfy+BMyHp1gEqDdf9rZEe
 gK4w==
X-Gm-Message-State: AOAM531zRUumOWjDHw9/6YHCWjGIj+ONGJFg5Qaal+oZwYBynjx3glNe
 kRG5d7zTffiguQsedxH4zh/Gww==
X-Received: by 2002:a65:48ca:: with SMTP id o10mr31704791pgs.129.1632280927203; 
 Tue, 21 Sep 2021 20:22:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id lj7sm419682pjb.18.2021.09.21.20.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:22:06 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/arm: Move gdbstub related code out of helper.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4e54849-5d6b-fd10-901e-9403c4dc0770@linaro.org>
Date: Tue, 21 Sep 2021 20:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5MoaGJYAe8Rm

On 9/21/21 9:28 AM, Peter Maydell wrote:
> Currently helper.c includes some code which is part of the arm
> target's gdbstub support.  This code has a better home: in gdbstub.c
> and gdbstub64.c.  Move it there.
> 
> Because aarch64_fpu_gdb_get_reg() and aarch64_fpu_gdb_set_reg() move
> into gdbstub64.c, this means that they're now compiled only for
> TARGET_AARCH64 rather than always.  That is the only case when they
> would ever be used, but it does mean that the ifdef in
> arm_cpu_register_gdb_regs_for_features() needs to be adjusted to
> match.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h |   7 ++
>   target/arm/gdbstub.c   | 130 ++++++++++++++++++++
>   target/arm/gdbstub64.c | 140 +++++++++++++++++++++
>   target/arm/helper.c    | 271 -----------------------------------------
>   4 files changed, 277 insertions(+), 271 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
