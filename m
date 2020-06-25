Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1164165lfm;
        Thu, 25 Jun 2020 03:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ3/7hYTzOuQS27dPIIP+TUuUYDmrqb60CWtWdTpzKY3LXInVSddFQ04ImWX+ehm3ujT3A
X-Received: by 2002:a25:bf8f:: with SMTP id l15mr50638886ybk.453.1593082140887;
        Thu, 25 Jun 2020 03:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593082140; cv=none;
        d=google.com; s=arc-20160816;
        b=0+AncvFJRB217i9zXRgkyDcFEhH5IJJokkHrLVKnZ7r2dwK6qGam5bACy59aGfKagJ
         P8CheYJSm0sOMfsb7j2zt5vVIGyTNGD7aMPyeI+6HxWgXBn4QO4qaATtK4fX1lMgkmyu
         az3e9oMGJczGf5vGweFjSbYBkE9kOodOi+mSD01hwh/xati69ECL6/q/h7ME4CFo6j0R
         OrHtTLJF8Dw+koxh9WKpOykp1yHwN9l6nvFct0Y9YCe2I8uY5+iEtZMgnWHNilfEtMt0
         w4xihC7EcwIVd6gOyJDfou5uRxm5zhzqWcCKQUjPmh6kZbQAjfAEKjKO3kHnglvGQA8s
         ph8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKjZbtR39GokOoxaA814Owpvk65agAdbzHUDYnKetpA=;
        b=J9e6MbcIsJnGCaa6EbbgxDgLkDM4tAQ6jFhFJ6nKNs6LRwIuipwvjd2pKRVrrsF9kv
         T86cnpxLu+f0s+vPnzZRT0qOLPzJ4A/iUBtljpqMtQW+R52Rm5hafFt+6lqTsZwVfvD4
         oOzTWEd+mJhxAb/w6QQLgdSjOdYot6MA1pDps2JF4eI9cAL9X7CMBpU++4GjcsySoOPq
         K06XV3++5hkxyDTxDjrUDKDeqFr9q42/j4+1YfLTKQVpzeyTTUJAKkBrHvMEru750cSv
         vxLoI6UNGvpestcBom/wCFNknHZBCum/rBv+ViXiejF6N7zrB86TVAW+qFsi/YT8PbLB
         1SCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MgQvm5Mt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si26143068ybb.475.2020.06.25.03.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MgQvm5Mt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joPRE-00027x-8a
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 06:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPQp-0001he-Pz
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:48:35 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPQn-0007cA-Tf
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:48:35 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so4822770otc.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 03:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vKjZbtR39GokOoxaA814Owpvk65agAdbzHUDYnKetpA=;
 b=MgQvm5MttJqoOt8BJTOdJ2jWIwBwnmC0Y2lvCLpmDRON7X2bPyljWlMXacsJ07JVhS
 7K55kcxtO9EsQcOreGFTTcBEFVX9MkDbBuFtu9yhjJff7V9S2DYCHOoFMM99ZC0IDYBV
 ZInVWqqdp9aW1/Z3eoWxRmJmxIQ8bu4hhM8bNXB+SPVB2LPsrH6Bwn7pe6BvHN5S/B7z
 B+7er+38yoJcxvdTdREfNrs3HsEdeVCwBCoSjVZa+o0GHq6o9tQwxitzu043inTUNjEe
 amCqHvWvton2Q58ECp8gkLJPvBzzTaxPQhZ4OYoAAI0mAqCR2vsCpMSApBi01tegwREC
 HWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKjZbtR39GokOoxaA814Owpvk65agAdbzHUDYnKetpA=;
 b=sTo0QhnfdA8bdhP5rjokbjykS2rWy5Xban2LuA2XYY37xHDlNS9TrgL4RSvuT0GFpc
 8kJDX7AFRoYS5ANsziZTXUP++TTWA1FLAHZ5mg6Xty1hLYm6X3TMRA0rT57MsOlhIYDn
 Ype8w/8U/OV9UnzMLEj/C/NJsuqfB2JGS8Pb1GLXXfa+rRhKQGZdJB1MrMmN+K8p8qbv
 WArujf5DUcrZKxvA3Qo20oJ37L3GiZt1RrHgbHR1qy95dvqVX1H/QYqdjwS02bRHQght
 ScsG5V+l2ZR+WmBv12LYCyVffJAb5W5HbmI59o1UMvbsbsrbNfq3UX+wSzGpEIKr6cuO
 hpEw==
X-Gm-Message-State: AOAM532xJ8C/5+bKfkOuUOlyY/gIFeTe4mdYQNcUKvaC0Od5Fog8y2gg
 9kdhG1oLbe97agVNIEBYZ3/R6FmhJ8G6MHOM8i2HfA==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr12342673oth.135.1593082112919; 
 Thu, 25 Jun 2020 03:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-16-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:48:22 +0100
Message-ID: <CAFEAcA8xCDbbKn=p7GPB8qiJoT9LSTHraoeHmsVFcXXVVe5E5g@mail.gmail.com>
Subject: Re: [PATCH v8 15/45] target/arm: Implement LDG, STG, ST2G instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJ1TXuZVgVQJ

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Split out allocation_tag_mem.  Handle atomicity of stores.
> v3: Add X[t] input to these insns; require pre-cleaned addresses.
> v5: Fix !32-byte aligned operation of st2g.
> v6: Fix op2 extract, stg pre/post-index, stores vs sp, commentary;
>     use pre-computed ata.
> v7: Fix STZG iteration (stephen long)
> v8: Merge gen_probe_access patch; align address for ldg (pmm)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
