Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1417706lfp;
        Wed, 15 Sep 2021 00:26:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWmH0YHyMUOzkMMIWVjeBb/sOCW2XeX7QW2GUVL8UCc5FIu/EcF5bbPieT/uOo62epdpU8
X-Received: by 2002:a25:c6c1:: with SMTP id k184mr4466234ybf.277.1631690798165;
        Wed, 15 Sep 2021 00:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631690798; cv=none;
        d=google.com; s=arc-20160816;
        b=CVdCmR8oNDH3nb05ce7jbITsR6E2lWBuDw+uc5n3H3eXPTAtxlgoE+XIg4tkiYITUV
         sX/0uEO4+iNwOIYApLLsQ5ntGyHjSV0VdiZP8GLRxGT+xJdlLXns7T81GghdOMGDyTxT
         7ZvuPvxqU54zcmCkhrd49d67jZUUQ6O32moY9mlDxUEe+uwpL9KxQzQzcsOROVUmp4Am
         65uBIhp/92VOX8Y5Gx2VyZbwIZfeBMSlI5Qmb8bHNxW6wpI7TXfwd9HF6CUsFXCh56hE
         LztNrdK2E/PculJ+BF9hhdnWfxgyvL0JTHCy86BofdF/nqvaGdx0yVAcMy5P5tWMEbtS
         7Adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=t0XCTivJki9fnWZ6BB0w86GFuo4fGUBWF4o1x/Gj2FI=;
        b=LKvHUoHRV/M1XoIDq+8uIoDyS1Gz4Dpa/4vvKj2D6oy8wuhVYtWQNjQ8Vph/FxW1Sq
         YBfkWKy1K7+7U4ER4dqAHM1ZLTT1NlmJLpVBNDdttoa3WcZWecipa714GQXqDoHuHeSP
         vn0Puhrw/uxc2/X+d3lWKwz4r9XDZlww1pOAPU8PqgShc7cAmpouyLFH4OKAhxptqo3j
         f8LS0mF1IxCjoFt4nahL+A/NLcE8GN+oTDA5sjyjWKlX2tzfmv9u1+OH6RdlRZ1pvAJA
         05Z3pHvM39ii3aXP3Xb4qLZZWeD1GzUO1uhMlR+zM9VY/OhpyDmdLXIfvfzX7V89yHCg
         oQOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Xl3Z5P1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n204si13736613ybc.20.2021.09.15.00.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 00:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Xl3Z5P1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQPJV-0000to-Cy
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 03:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPEz-0000Ji-BP; Wed, 15 Sep 2021 03:21:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPEt-0001Zx-WC; Wed, 15 Sep 2021 03:21:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso3955146wme.4; 
 Wed, 15 Sep 2021 00:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t0XCTivJki9fnWZ6BB0w86GFuo4fGUBWF4o1x/Gj2FI=;
 b=Xl3Z5P1NVOhgE9NYSnyRLrwaTdisL16TapxGihVsoMc9EXL8S9uKPyTs2UoIo02f5n
 1ICNRAFoIxjXEkD/Dn4NVCi/VZ5eW37MbanUofXS0hO6VvYFHcKRVo7f+F6qRvK95uDF
 o1RHPV2rSU3ynnZguZKzsaubS4+Z/QoCdQfbzvqrSF05P9T1DQK99lzOrGy38vTOyuSa
 NjisVecVWR9A70bE692vPMl8Q/zoipGm01bCDUx54q0+WfyDCn025gYGpcj5rHOsIgHG
 QnC7pKWkvYywJ707iQBXYMglk8qOTqVrusuK9qsqFCHT0VR3qesEt0slGFPktvdNjNKW
 zCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t0XCTivJki9fnWZ6BB0w86GFuo4fGUBWF4o1x/Gj2FI=;
 b=ehvGLPpWS1t3FTROiIFoieUGDsLIHUGqmyofte+kFAuDQ0xiMd1w8sa9J/mJ9SLnx3
 84hBu9PEcLK1FH3ERK8PXU2hHxVUcnVnu6X8w7yAddRUWTPt5lnVfIL7lpfhopADzNgm
 vx/djCKM9FN2EMivtsI7cK+koQd0TIiNERD+IgkcFhhPbdopJ1k5yltPywmgx7PZ6adz
 /7yPoSVBFR0Tmo5jqVNBgfClFZiI7HwwLp4mU7pgE4SgpknYBElWvnE4Mn+h+BXBJ9dx
 ftSBNQvn4gFoZrLNnF3lJzfEvF/l4fr1cQB+lEGAuqxebFbKIqVAE+rWS2Hxf7Dpi908
 jexw==
X-Gm-Message-State: AOAM530ZkfD1cY4DYyEa2CUQlKTAsRKM+yqrHCZGSo08VNahHE3o01d+
 5grc2EK8Ge67/2tjW3VmhDs=
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr1030594wmq.126.1631690508964; 
 Wed, 15 Sep 2021 00:21:48 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id d70sm3410615wmd.3.2021.09.15.00.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:21:48 -0700 (PDT)
Subject: Re: [PATCH v2 16/53] target/microblaze: convert to use format_state
 instead of dump_state
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-17-berrange@redhat.com>
 <21032bce-bdbb-1a0f-f5a5-71350ad79c85@amsat.org>
Message-ID: <7b38445c-5225-1d75-2b49-486af35a9e1c@amsat.org>
Date: Wed, 15 Sep 2021 09:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <21032bce-bdbb-1a0f-f5a5-71350ad79c85@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Te0uoFnRQgK6

On 9/15/21 9:18 AM, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  target/microblaze/cpu.c       |  2 +-
>>  target/microblaze/cpu.h       |  2 +-
>>  target/microblaze/translate.c | 45 ++++++++++++++++++-----------------
>>  3 files changed, 25 insertions(+), 24 deletions(-)
> 
>>      for (i = 0; i < 32; i++) {
>> -        qemu_fprintf(f, "r%2.2d=%08x%c",
>> -                     i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
>> +        g_string_append_printf(buf, "r%2.2d=%08x%c",
>> +                               i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
>>      }
>> -    qemu_fprintf(f, "\n");
>> +    g_string_append_printf(buf, "\n");
> 
> g_string_append_c(), otherwise:

Actually we don't need an extra newline.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>>  }
>>  
>>  void mb_tcg_init(void)
>>
> 
