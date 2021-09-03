Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1600764lfb;
        Fri, 3 Sep 2021 12:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx9Cf9hYRqUGdpAwJJ+S51acrtofQ0deDlP/YEH3mLG194aSbyzdWzZMZ5KZb353gg3MTQ
X-Received: by 2002:a6b:8e87:: with SMTP id q129mr451310iod.176.1630697855506;
        Fri, 03 Sep 2021 12:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630697855; cv=none;
        d=google.com; s=arc-20160816;
        b=RK0m73cp6Jb7koYdh9gS87b1iMURXSCq++Ko7bkSYiY5JPo4oK+YhCjCRvTbcEClM+
         RfbL3GTv+fjZDKRp24JlEPcyx1LKOFjkXxE7YQtoBV155JkLkqUFsbc2kzLstNKH7uVS
         16Et4kOuqYaiY9JhtgoAWmFfeG3IueQ7K4V0eO+D66dneArnfqxKO0AGMaNLSBK2BtXC
         HQT7lYc4WzdEcu7Bn6YJbQwvp9KlaMe7QzYBIpG/m1vbZeX9uWTSLFHCSb1NtFLimJN/
         o/u68tKdL6STyNgBQfGF+poWzuOL0uQ1VGE9Xuy5pWJbC9ePEcxp6PbDdBo9bdzkuj5R
         gayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qhw7DxCf6SfIVowzbh8yAc2qUc+bl4pVxEleJ2/Dj+A=;
        b=r0bBaEoOdEc4AE9FY7hxcyC6eqNSmhissVpBRjzlO0BFYa8+wSfz3xXGzxJ4SjnWLr
         VVR0dzLghnDVQit7RrmChXrU1fYoUFW3iyAb2silJpVbgtDWtja/EnaKxseGe55jg7NA
         dYwMKcRWGHj839b0m6FEe59Nsbino0hVlY2iX75DYb23LuYLaeNNo/Ms/FSbep8W+6pO
         4YSkM6b5cJL8WoMPb0IoSc90DCT6BSWmdcaes/DOWQneNdZkKrsxeciy0q8xYMISLhSJ
         wfKoN4KRegTpO3hUER5Qw4AgcQLr9Y+BmPgs4Nz0u3SdVkjeTsOPmzjBxP1DiPZqNfRQ
         M1tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eA86I7Wz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si259802ila.78.2021.09.03.12.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eA86I7Wz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMF0I-0004BQ-RR
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmH-00063J-9C
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:23:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEmE-0004dm-IW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:23:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so168484wrb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qhw7DxCf6SfIVowzbh8yAc2qUc+bl4pVxEleJ2/Dj+A=;
 b=eA86I7WzSViVKS6H0gihDzK5qG7/gzh4NLmvLadT3zm/obXiiHOswktrwCIiRZ033Y
 pgVYkQ3ehgdUCSK3swwv5rqGRQ0uam84y5OTk8SwC8RM3aX7FGDXVVPhPN2q6xv5I+Pg
 xWvSqQkCs72/s5vqzHjyTPT9nBfm4KBz0QZnUv0umk0af5oT/uzrliLEI8gyEVbY6UNx
 kcaT7KHncWPX6FaZ7AD8aWKNFMmz0d89lG1wGRc7NstQmDbyJGGEg7+NcS+U/W4JJOOn
 vVOn5VI4YolCYZUlJ/erz0vBmCEC3b6IBhTzZv9dxqTGSSVyMcFEK9PMCkzGWHjb75rb
 ziaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhw7DxCf6SfIVowzbh8yAc2qUc+bl4pVxEleJ2/Dj+A=;
 b=s//rFuz9tnPR0Y2SJyXyZGki4aoGiLLWxAbBKJXz8pO/0UGtkRj6TzGv8rICS6By9h
 +HN8yr4crXsCuLcGXKV738TIrtqxukaMYSk5zJqYnKk9oMpMiG1YZkjEK7LQFbHBRBWj
 1ROMsYgQMHTwQ4cqh4Hhssftz7UlBtKJ8AnqoYxGG+2ivsED0aCGZLhaqnqK0iVxuJbc
 OB6+UT/QfuKyhcBrDvKPnWNl2Twm3tRnlp5UCGaqBkOouJzD6vXz6ZAj59ySHNO+TUE8
 gtLIxqwW0+KOxry1ivS9ps2v8vUNfwXJXLTmCCkMU0vaYuXmfbBALtEgvNhx/U0JubeT
 4DOQ==
X-Gm-Message-State: AOAM531Qra3LEsZKita0MDXj2nQKKTWPNAXiSKKTW6FMToL/lZuSRZ56
 ixNzqTVLjk6kcrnhM1wr/iWXNQ==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr647806wrw.116.1630696981047; 
 Fri, 03 Sep 2021 12:23:01 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id p4sm200939wmc.11.2021.09.03.12.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:23:00 -0700 (PDT)
Subject: Re: [PATCH 20/24] target/sparc: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81dfd498-e661-064a-8323-10ef0eaef4b8@linaro.org>
Date: Fri, 3 Sep 2021 21:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lnq2AFbqtMtD

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/sparc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
