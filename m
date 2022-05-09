Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp3904257lfj;
        Mon, 9 May 2022 13:43:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTdjYCu0kQzM8JZ4v17YbbI1PVuoV/BdOLIxjQXGneiE29ATXa1E+SptnsBkCrXAgckXa3
X-Received: by 2002:a05:622a:1113:b0:2f3:cf1f:3af1 with SMTP id e19-20020a05622a111300b002f3cf1f3af1mr11411111qty.516.1652128989903;
        Mon, 09 May 2022 13:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652128989; cv=none;
        d=google.com; s=arc-20160816;
        b=nq2gG52bEyf0iBiWLNgYwHKb7K+/ek5i1429YiCjM3/C4R4Vay+01NSlbS3op7zfIs
         +5zHYdEq2Qlov/RdG4yA15dBVI8NMhoUxDs9EPLKv1fQeb4naSqJk5mkvgyj2M90NKsu
         KrBbpTimucBF3rhPuaCB+ckp+Yd28QV4iW0X0DGn6EN3aXNuOUURWeJjan+SrBpJPp+s
         30h7lAqPdYW95od0mL6MwJFYv/DWdnCTT6uoR8sZCSUGwxWV6o/EEmUfQghHmH8n7far
         7F5VankJXRDoAHkepyrC+qxImcopbgOg+1Smd2saIef909Dar41oQvBoY8dkLK7O5WZv
         Y8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JUQ504MnQHGnlG80Ce1nCg0VwTC5aoJxM7f014+HvOw=;
        b=Mp5dhETC03BqaLaA68vXSXgZ1VuX3JqaQ2r5Ko74LsBXGleiG8rkrFjqOT3YlfIoQ3
         +nFK55/TmIv7ssIoznAZ8utlzriJvOpDdjs2RLKVLSTA+UKIoGNtA6H2w1UHmMOFtUvW
         XxHtwMPZoOuem96L8sFHXwFALxoM6crm8KuIo3saeLQ+VloD49+63YDWhOimUHCUETnv
         DgPVKNX310a9oPoNa+cxItWvFseovWvExwTHnf3nGOMoiwyAW7sLRNTdo90EezfFtLcV
         Pyq7AO9F6NmJ9GzFqygEHXoRIMym1gfueM4zQ9mXsWytmKq4H1yikfIccfXPsJHUVOvx
         S8fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ag7ev+ct;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05620a0d8e00b0069f049b9dffsi9898013qkl.5.2022.05.09.13.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 May 2022 13:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ag7ev+ct;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noADl-0002Dz-4R
	for alex.bennee@linaro.org; Mon, 09 May 2022 16:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noADU-0002Di-Tf
 for qemu-arm@nongnu.org; Mon, 09 May 2022 16:42:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noADT-0002xZ-95
 for qemu-arm@nongnu.org; Mon, 09 May 2022 16:42:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d25so13224731pfo.10
 for <qemu-arm@nongnu.org>; Mon, 09 May 2022 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=JUQ504MnQHGnlG80Ce1nCg0VwTC5aoJxM7f014+HvOw=;
 b=Ag7ev+ctd2hEGpmSHt5miOeUD05G3j8vmXWOXfvjlWv9tsHThea6RB5PJCgOnhITf7
 MUwzz7co/MeuMV27yLTRRJA5pplPW9hjJYUG79djXniW9hC/g8ykk3RsRIHyV0NztvpY
 DQdWmrv+QZTwwndszbtdNoWtdV2300xAbp+zRixPL8zwdSbmBBk34lT6zsZOz9oLX0lu
 73pe4IVIk8/sh+D0g9RktuYBnG3mopJ/b8cZoCdF5gWl3GoYXhJNJJWNsA0GKZaTtMi3
 qmfR9yxOvYQjRgj4zUw+uSw9S215j07GgRYkwp64QWH+dfy58drrXieOZM7R6tX2YRLZ
 iv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JUQ504MnQHGnlG80Ce1nCg0VwTC5aoJxM7f014+HvOw=;
 b=CaHlnp9E3BlsBbCl4ie5AxtMDUQr8KTHEAiFsJ/cIjO0lsEnMLJesh8IhOommOit9w
 Eu5dUICYvU/lFvWhNbCMvOp/81KFFNm9REyUlV1NrZTE0NoS0BDHJDl3zD0K8ZDS1LZC
 jG/Qnp55TSvXvONqs/kMCPVgM+xpixsDIV6pSpefmB86Yhivr1A4+oZKozpGX+ua0rQg
 1ABouzhldb9iCaX0U+/JfA5XK/i62ntYP19hLWqkimhBo3cVzxgOR0WYOEByu4G2WLdD
 Fwz7zObl5o3ubbrhsLk+lymCucauVgQxJkyyo7H2UdqZGLdJC9GsPNohT0fao74XZbxN
 oydg==
X-Gm-Message-State: AOAM533BD+fcFf//MblOGdaje5BogtTTQKWD8Mjzm7q0N5OOb+kxatXk
 zIFxwPfogpwMOb01HFNJ8b6InQ==
X-Received: by 2002:a05:6a00:21c2:b0:4fe:81f:46c7 with SMTP id
 t2-20020a056a0021c200b004fe081f46c7mr17332545pfj.5.1652128969850; 
 Mon, 09 May 2022 13:42:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 z29-20020aa79f9d000000b0050dc7628170sm9099010pfr.74.2022.05.09.13.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:42:49 -0700 (PDT)
Message-ID: <517b84ca-a27d-c79b-b649-b8358ff60857@linaro.org>
Date: Mon, 9 May 2022 13:42:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Drop unsupported_encoding() macro
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220509160443.3561604-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509160443.3561604-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: b6Uh5LvwuatH

On 5/9/22 11:04, Peter Maydell wrote:
> The unsupported_encoding() macro logs a LOG_UNIMP message and then
> generates code to raise the usual exception for an unallocated
> encoding.  Back when we were still implementing the A64 decoder this
> was helpful for flagging up when guest code was using something we
> hadn't yet implemented.  Now we completely cover the A64 instruction
> set it is barely used.  The only remaining uses are for five
> instructions whose semantics are "UNDEF, unless being run under
> external halting debug":
>   * HLT (when not being used for semihosting)
>   * DCPSR1, DCPS2, DCPS3
>   * DRPS
> 
> QEMU doesn't implement external halting debug, so for us the UNDEF is
> the architecturally correct behaviour (because it's not possible to
> execute these instructions with halting debug enabled).  The
> LOG_UNIMP doesn't serve a useful purpose; replace these uses of
> unsupported_encoding() with unallocated_encoding(), and delete the
> macro.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a64.h | 9 ---------
>   target/arm/translate-a64.c | 8 ++++----
>   2 files changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
