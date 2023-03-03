Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1408202ejc;
        Fri, 3 Mar 2023 10:47:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/LYxmUCn5nyuW1IG5AukO2hV09VuTloE1jevTYpbOhdNLM8SOMwalUdF6hQoY92yUCIKHa
X-Received: by 2002:a05:6214:1cc8:b0:56e:fb4c:c1a5 with SMTP id g8-20020a0562141cc800b0056efb4cc1a5mr4194133qvd.18.1677869220228;
        Fri, 03 Mar 2023 10:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869220; cv=none;
        d=google.com; s=arc-20160816;
        b=ZS6YSDjA6AcYgTTphorTv0H9jhYLhQ2/YK9tWuub+9EiZbyiUqr7VDBAn5qbrVFs6u
         Ewt4R+87WL69WclJVFNgimAIc43hmMCRujK0yAXOVw2cH5OA93RjugeBJ4b542bO67ox
         bx2/viS/k031wwwVs6I4y9TsnWDgE3BV6VUq1QHQqTJcwrT4kyM9j4ZEEEfm23airoOq
         8taiqiYMRbCerE61rb2o5NUI+FpWDRR1WbXDhlSAnXzTQrPkDq17ie0Z+1ZTFkElqdOd
         VS/lo+tGgT/zbenbsjEuQKc+9mg0GJ+7LsTF/p9X1pyOLVzxK7wXnO8YfQEunD3ZE7lS
         Qgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
        b=et5MZZaccejD5P1zohVzNWK3zIEBW0CIwI7PJ5IQHiSfLxEyZExIwUMxq93x7LJu+x
         xoEOZFw7f7uNsoNwQv2t0HIUNhm3Pgs7xrvHY631PV8Mh7NgcNjb+m96+jO3jPjpt5oz
         b/ZUrcXaS4fFUyxAlpPUv+KvIazO38KZUwSCCh1VvC8phRyZaeGV86LTXp737z+8BQz9
         tnwXeAdgcdsoDEwVH4K8YLGX2u1lM9I2GMNA/ln8vQlBOMgFGEVGXf9LLhXwQKlDEGUr
         mSeR5/eaIdE1eSdyYgxTxQ+aPuqL+UfyQ7Igsd906FC/p2nztXU3lrW8N0OBxKffOIpO
         t00Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N2upLABs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020a0cb282000000b0056eab1c52e9si2053163qve.12.2023.03.03.10.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N2upLABs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAQZ-0004d6-So; Fri, 03 Mar 2023 13:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQX-0004bs-Ma
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:46:45 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQW-0000fL-7z
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:46:45 -0500
Received: by mail-pf1-x434.google.com with SMTP id ce7so2170896pfb.9
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
 b=N2upLABscZLAgOCnyJh9VokjzNhrtfLlel6t0bLhJlDbxDpQp09e5Or7f3fgj1hydA
 Kvqu9TjlPjiagkovIOTMby8R3dqehIfqCxiSmtK9Ht2BNNKaHMuadiASiGn8hawtIrIS
 X7UbjoPLJmDRKWiT9pg0lzgnjtZ3h9NKlKFjcODtQaUf8VDmDJTTpdv/iAdkU/rUf56P
 mKi4+hBmK4O74Yi8CPDDQXnMlfhsQsPDMdaYP/5jyW4GwEK8aP1vOZ4lFRcx27oI+mUq
 f3pX8ccYEd1Z36d0QxAjrv6+Yw5pCP6Yj+PFvcakJUMjVGimOYU8G/SWmpA8WSH7doyt
 dYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
 b=EaAfMWVQ+EurWtSBeWFKcMo0B7W1eGHD7u2X76kIDETCJBkCdi/ul8pF58Usv9pQ3g
 hCOH1HxgEcOkNmYXE6eFUnekj6I4zLxaLETh4kHl24Afbm+IGZCvjKl+UssTVxSBboAl
 /e1GPc2wBedTU+5z9Zd89jmwQ7+laK+dohBvPUNBoddaWZotnhv9JfsWzQWS3elL/ZYW
 n8XSISajEGkYfzDbLM6S1neEwjCDzSMkVUsXNC4UZ6alOdDK7NRDkl5+XZA9+x9jngTf
 SZ5apBjPtZjwtbs/OPc2I2TO+a042Njpjfhugswu8hHRwl+Qa08PuIBBHbK1q5RtllnJ
 cI0w==
X-Gm-Message-State: AO0yUKUoWzbnuIyOLE2HiOZroVsvSN37A0tadfLrwvSWjJW2JQ6VbtLE
 RRkHHrjP8ozUszEMs+2VvgXahNAKl/z3Hupc37UgNw==
X-Received: by 2002:a63:135f:0:b0:503:130c:aca2 with SMTP id
 31-20020a63135f000000b00503130caca2mr2351271pgt.5.1677869202996; Fri, 03 Mar
 2023 10:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-22-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:46:31 +0000
Message-ID: <CAFEAcA-44S55OsA=hHk4RJcqctBpnr4nOE=8OupoUk00AXPRMA@mail.gmail.com>
Subject: Re: [PATCH v2 21/76] target/cris: Drop cris_alu_free_temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7BmxD1UPi5Qk

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
