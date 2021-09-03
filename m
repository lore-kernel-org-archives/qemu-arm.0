Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1594216lfb;
        Fri, 3 Sep 2021 12:29:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG19FCSlIzWSLbQaLIidAemfsjKlDUd7oFP/YZrDDKwrv0XWkDWTDbtZrpjmBsDNw+L8ff
X-Received: by 2002:a05:6e02:68d:: with SMTP id o13mr377663ils.228.1630697359108;
        Fri, 03 Sep 2021 12:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630697359; cv=none;
        d=google.com; s=arc-20160816;
        b=IP0iyljERHM3sOtHK8G0zgaQxJ77a/5BD0I6EbyT6V4emDtPrtNnv3zfhd70kMJeBS
         5o3q5o4/yqbRTkYivRKDOKcQln07jG2BxqHh/bh0cxr3ib00/YQ3LvkOk7+4Vv2BS83Z
         AkNfZ2VwjzSnmbHL0HIcS9pjPx2VRky0o2KWWsojKWc8lwUQY1tzV0Jag08OBlKf4JGL
         gpI1MC9PwlN6QTry41LLVi6RAELc49XG/EzpHdIaCPwCql1882vfz80T4y562R4H3BRg
         R4PqgHl2V0dBpuOGGhrErFGGW+GYzKHFDZm3OhNlBBsTtS9LwWOO4cYSkQwEz/rhz8UT
         9Wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fEOMvnRt3u1MPJ0C48yTmkBQGXP7tFiEG+N6OQmYsjo=;
        b=x+mGCTwVh1wI4UoJXU/bri+YynyYwkpHJjUhWrpwo8YUvtu+IEczRI85IZr4CD448c
         K85D0ook5uMAXQH+tP+N+nh6OiKNyOyYGGsaOqgC2jSKmjN8g640FgUDSlhMNDHVtm3H
         mqe2YJfAbgIltnYBXyrVFlinc3XLolSlbqV3EBPSLaucWuGnTZ489iPZq92+268x/mk0
         oxu/8m7daH+n7js7TicVrdJniJI5doILWljBCblE6XEW1qQE8jswNDosomm4h/K5Wi86
         zOMA1kRtqjitnIMp0Ogt8Aq9xf5qaMzdwqCxZsv06mw2VVZtXpZs9zS0H5VSzzvDTQFa
         B5uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P2pSCTQR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si315513ioa.93.2021.09.03.12.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P2pSCTQR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEsI-0008Rr-CR
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEpg-0004ZC-Uz
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:26:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEpZ-0007Mz-74
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:26:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id g135so4149407wme.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fEOMvnRt3u1MPJ0C48yTmkBQGXP7tFiEG+N6OQmYsjo=;
 b=P2pSCTQReq/NfuXlGzp+sOy6fpIESWIEw5CfGmWWhoHA6QU+aMtGRPT5QwL3G7cqaX
 qlsJZNSo19g2KqvrO+0vsMCULVfBC1SABLzWXL3a52khd1/0oDU5kA8ctU2xTA2t2tJg
 TFzPP5t9Z0ipMKdEPUNDpIthHRx7kRD5sydRKqae+dDdnRI3e3deHofjj3Dbhwx575FJ
 67HrHdc6flCcR1dTNOCqIgJe8YuQnAbaVUFvr1U0suIQSXf+wJ2/6/OFYotwZQAmxKck
 fROsg+wFBaKOY8CGviS1GZZW/PbZy2B4duETnBoUcub93bFwOnrH0QDrH6sINCV4Iy4E
 ZREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fEOMvnRt3u1MPJ0C48yTmkBQGXP7tFiEG+N6OQmYsjo=;
 b=Hya/BsZ2WzLca4PdxbwBLyiPnPU8aV+U/jM+qfX6cwuaNXTkJj6pRvuMLajk2J6S6B
 Y4qSWA9hSmy7LLq9NDqqycewIbM1ZyXc3BT1D+YEh+Wdl17nY3n2mKlfcRwKdXmSAazO
 f+sq0Qj9ZI1E6pryK4dP4r0v/SqIjBVQ6+Vnc8aT8ITdX3J0PyA/6cYHjBlNtmpMvibe
 aiy3UjJkhslDtBPg+9THlmnjo3VmnU1GhL522y2F6XtN3VMNObbdjGvwifTKn3dkGxit
 TBwynKqdB+G6tKW6OjjTOfMrnaKHt6zZA2tUhxmIGHGORc/jE7swjAwZ/JkHEhZzSi+R
 olPg==
X-Gm-Message-State: AOAM530uWtdyB1xyNAyVRTHFAbC5/fhZvqwjBCPGZXhqtpwGkZjoelsG
 5z7lINO37xUN3hpKOnitbpus+Q==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr296138wmj.44.1630697186866;
 Fri, 03 Sep 2021 12:26:26 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id f17sm134080wrt.63.2021.09.03.12.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:26:26 -0700 (PDT)
Subject: Re: [PATCH 23/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt()
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dff2d086-2472-3818-422f-0f64b242aa7f@linaro.org>
Date: Fri, 3 Sep 2021 21:26:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dd5Pj1cFd1Ma

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> All targets call TCGCPUOps::cpu_exec_interrupt() from sysemu code.
> Move its declaration to restrict it to system emulation.
> Extend the code guarded and remove the user-mode assertion.
> Also restrict the static inlined need_replay_interrupt() method to
> avoid a "defined but not used" warning.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  4 ++--
>   accel/tcg/cpu-exec.c          | 13 +++++++------
>   2 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
