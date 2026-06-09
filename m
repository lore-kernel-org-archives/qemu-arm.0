Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F61CD98C5
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:09:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz0g-0004wa-VZ; Tue, 09 Jun 2026 12:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz0f-0004w2-CJ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:09:01 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz0d-00057q-OX
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:09:01 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-bdb3fd39045so823391966b.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021338; cv=none;
 d=google.com; s=arc-20240605;
 b=aHTQu4Y80YjEzhzYUpbu8ttpiYvk506ZYxr/nASh9EvlTucOFaIFHbFOwDXCc2QM8o
 mtcxB1fTSvlHLwyoqvNPMgkTiAX8OdMOiNwrgcr4qA0BgJE4w+lUCtK1qTinGPfr+ceh
 OjQpYI41dTxLiIC35xRr4BCTsa83wjfxF4JVvc5mJR6pzJTt0+ErnbaEg/SChTzxJ+/Q
 7yF+QQAH4QSxPBu3a4ejIQnnaQUxf3Z5XGqfD2pq6i19WrhxF9LBEC2AKN145DM8RFTT
 xkTEIYe1KQAoAxWsDwio3zK0XnnvhIn9I2C5twuZzRCs0AgVKUQTX89BsQ7FOtIHk8Vx
 y37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PbmVMlBTI1D89FAE/1WRXmY+YS4Lim1UF2iTW3DOm/k=;
 fh=w0AbcjJd4zYOzeLBu7Yhe8THNKfI5jFocVvIucHvOY0=;
 b=AgH5E+IiIScgMduSK82yTiyQYFyCjWsea7bJldJKPTZ8mDZOMJQ3yGfaL75K5myPnY
 yZs0nIPq+Q6KwkhF8w5z+7lyuHqvWP3gDdySj9GiWfgeYEtTfwwP0UkuNCJPTpVdXoqV
 VgS88jnwdnDuGCy07odT2JuFn2jQh5FYAYvR1UZ5u1MO3HWZ8M6EYPMZ8pC97AA0gM66
 kLOVCjG/kbzDwCBOp0K/WqK7Fz4P8mQZYFnjVpChmVgljnabuwPzTtsBBLbetyIxjSll
 W8oXOopIaAeYmjfJ3UshHHMpLeZDY3o2yLMMKfUx4K8GRNlI0SYB5zOOFsq09EKiNCKx
 1fqg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021338; x=1781626138; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PbmVMlBTI1D89FAE/1WRXmY+YS4Lim1UF2iTW3DOm/k=;
 b=YDQx2SPC4RJnFlQetEIGsw9XTghnt5HCHJdHH0Oc1W6iffsi6BMnt8YZYYfugcYTJR
 GrjYeXoMplVrhWm5VxBmq3qF1SOQJrVFPtiXpHMtI4ZYqhn0087SwBEJF8gy5eSGgc6Q
 u23WXPWS4e8JLHOiUY84sPI6HCnqzK4qZGT1VfjH0QYR++Pg79OwR90HGfj6RvC2ITaM
 v4zAOA6UjecK+F5AsYxPpISxqzzhzMET/bSyqdaCTEEHYighQaki5s8vo8jLbAKcwQ3N
 h5GwY0eQLFC7dPWSkPBX4FCPFiolGTrKLu+bUJqowoFUePKRC9K0m+wwGbcgNG0h1Are
 peYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021338; x=1781626138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbmVMlBTI1D89FAE/1WRXmY+YS4Lim1UF2iTW3DOm/k=;
 b=NB2BKmbfzGaTLTY1dEQ8FUyEQLz94kQV0fGRYQEh2vpplMX72cqa7Zeuq4CYod5iUx
 Ffaqy6CLO8lyDNQ7hoLkShrkYVPY6aB/pPe5aGv3c5+x/iFyIWuQkbIe2HD/Fqrb9JGY
 Y+rggfAIdnZDRwKLdrz4FHu6atOB0hqI9J4exCZbfvhzg3ofzCR30As4TODgNpsz+d5x
 Y1pccJ4mpknzdqJOenVdC6g/6+Hn7mj9QDsLCtIozz5r/VhZXtYp/L09mQUzH3Kw9Sie
 iFqMuHIhHY8w8ByO5xQXFsESWvYEIgO2qBm3aZNyxcspTm1jvv531L6LkOZLmNpy+42i
 qURw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1bTsDTWzdw+wmOWcVm9c5QkNt+rrJSxJIYnHEsPMDjgFArQyhvHKKec7zrwWDI1MC5vfnDmXI9w==@nongnu.org
X-Gm-Message-State: AOJu0Yyq8mA6FFm/X33YIG2xf5kvBWzi7fSn/JBNDq36VgnuK+fcI+EJ
 kwMHFtCmpR+0Ar+pk/L3ZRMNYtwWHCCLm9OIARVjbndemYRBLPp8wRTZP1G7HUX7bNB2OFbcIWC
 6JhJKYnNHNXDlay7DkTQ9dBTRXhEYBnfJIz5ftaDFAFpSOG1pz70Y
X-Gm-Gg: Acq92OH1ZP0fhC8ThLfJ741wvLEj/ihWpfyACd6K31L8H+uYqjEcvFHpi8r3D0T8IXH
 uF7oVksboNjWBzf6qHne1jL89BnFDGbi08zQbvlB2wdyZPxPgCF2qqIBh48d9PM5PJyqN0td1MR
 nyjTrdobs2JtgR/Ovgfy+r3QFkAee0ez2HnEq3ltCthtaoZ07RZIOfeqWq8P5RMAeNA78pm0hB9
 KcyjVU+VRVpDy5dvaggUnCMs6B+bb72jrNgkaWKKZgXgp5N2vkMqtdj+hVJUhLcH6fucExKgYx6
 QmAHqs2hYK4lmS8qdFQD1rWupXaKtvxAVyfeu9gwhECpV5aTtKx5UtjVZRZ2aBJKedQ79be6J+1
 Xvw==
X-Received: by 2002:a17:907:98c:b0:bdc:9d94:3257 with SMTP id
 a640c23a62f3a-bf37086d218mr1156582266b.14.1781021337849; Tue, 09 Jun 2026
 09:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-32-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:08:44 +0100
X-Gm-Features: AVVi8CfNGi9WeMNwcHz9j9Vvj8wJSjCU6dlDLSe8Jr9M-q9whZH2BghVviLVve8
Message-ID: <CAFEAcA--Pfh0AB1TLGXZzqpqB4jSQyNYM3GuwCLk-XJdBT1DPg@mail.gmail.com>
Subject: Re: [PATCH v9 31/45] target/arm: Implement FMLALL{BB, BT, TB,
 TT} for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

