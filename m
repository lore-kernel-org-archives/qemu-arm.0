Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1102933ejx;
        Wed, 30 Nov 2022 02:51:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6w+mt79XDvUDu6wWgUuVgKexJgfbK95FAjZSNB9LAN59+2spQ/3TfXw7VuAEXsfSi6/l8s
X-Received: by 2002:a05:6214:3d85:b0:4c6:b19a:10f8 with SMTP id om5-20020a0562143d8500b004c6b19a10f8mr39344736qvb.45.1669805519646;
        Wed, 30 Nov 2022 02:51:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669805519; cv=none;
        d=google.com; s=arc-20160816;
        b=KhwIdNFFHXYeG8jZ4eGV/e1BcPaAxTOmRm7I/sDYuZ2XB4Q3MF42nNllypMTcSsgJQ
         y1LBR0rcb27HfGrCiWD6PKnoK9Bc9xHVsg9SRsf1jZArmZwFWLguUSy+6Vfp2SS82/Ul
         7HHOx8gwATFmY9wWTIs3TpbeaXCntM14kgL3cXq+qGZhZcby0xuKxzvZkard/9JiT4pO
         lTGMGTp/nQjWblKPnr24olb4WbvwOnJ2YIDnqyj2ScgyzkegjayAYwLMXZFcs9Uq9/6t
         cFvbQ722VlHXLOvhuO33OdWKW5L+ZVzgeo9S/NRxVQ91aajCFdyqJ3UYEu7IZY8hwrjS
         qhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F/QMPNnwC1L8+xAh/udqpCveipXq509FkVBevq44/ek=;
        b=E5X+Wfw1HiU1bVQYptYwVHgRNkcpAjNhhZ1ZsL9Ze+S2/vHDAng8e61ccpHxBPGaPe
         7rqjEyCctI79Z57HdxL7arCk2OPUdejd+sI0OIrmt7WoFh+TZoMxf6Kc79kbQ8pnMH2t
         LKOyNDgi9BSiB7QONb/cD8W37eFPpKQZJZM+8yaS8I8y+ouvjhFc74nu/rWcNMuABafN
         mYMV0CjGntTIfhwI5GoeRyUnm9su6PK3ffy6QodwjyDI3yUwk2f58gkVHpb8PehzPxS4
         wIoCI8UNI0tr+thfarphWa3Gv/KTCQDwfvHfP7WKhTZkDTLAXVp+SggLPgztNHqLzoxD
         XnqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qfpI/fE3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020ad45c8b000000b004c6dd169a6bsi596793qvh.364.2022.11.30.02.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:51:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qfpI/fE3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0Kgy-0004tn-W2; Wed, 30 Nov 2022 05:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kgq-0004sD-A2
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:51:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kgm-0007Cj-GW
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:51:43 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1082361wmo.1
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 02:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F/QMPNnwC1L8+xAh/udqpCveipXq509FkVBevq44/ek=;
 b=qfpI/fE348EkLunToe/74s0Ag4OPVMOdbm5kGQXiOAFyxp+/epyrH2WrxE6uZDi2ON
 JfH5i/Pp0vCX73MlpQM5HIMBSpTKqaha5KM4mXdTji/udBtJ/ETX6gd/AzKtp8J6xF9t
 GvzJ/qmhD3NTE+cpV+Ad0Sn0YWQ/qFCdBfUKg8qT1eBy+1HUp7jAydYt1iUEJVRrPTDT
 BCDFiNAFykHLSGteIxHusadzLaAB0VFAn6F4sKTm3zhj2r0Sr4BwdRsU+sMmmsn+0zRj
 ST1kER3d2QiRJ4Bt1PwTH7wAXu8qICF7j+R4L17UMrwTzg0yWznn6YD2s9kvsmxltpQ1
 CuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/QMPNnwC1L8+xAh/udqpCveipXq509FkVBevq44/ek=;
 b=YrQcz4VzdLtO3IOJxp1fBBOY+66lqTyGAtgEH3Y/XihYUzKdXfZrcqcTVerHEOa3/G
 S0avC9ZBbHlZ/5M4xN8cN/uN0iBpAyXyN7Mdd6T5wgAYQ9c5lqLgEL9Jddzb0s9a8Fr2
 w1FdCXmuoQT5XuhNX7e/W3KjJ9+TQHEkybzieSWNX7khUJeUSzikkxSt0aa7kiNp9saP
 8miUkX6ieps8/7si4kBlQ6yxQMO81Rul50gk/MmnV5NipAjwi2W+g3F9sxIRNJYkPElf
 KRyzcqAh8ZMyiXhuUTdeX+H2VDdeT0gudUMSuQ2DyowVPlJFoRfjzqxYmqoAWLwCw7mw
 pHEg==
X-Gm-Message-State: ANoB5plpG2iYtg5EyQ6D98nSywiLkQFyoUHDvxMRyL/zTH3afxwR9drT
 ZNv0/AZUYTvqzKcMhNukX0AzZw==
X-Received: by 2002:a1c:2b81:0:b0:3b4:88ba:a74c with SMTP id
 r123-20020a1c2b81000000b003b488baa74cmr30873431wmr.77.1669805498330; 
 Wed, 30 Nov 2022 02:51:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfce12000000b00242271fd2besm1134448wrn.89.2022.11.30.02.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:51:37 -0800 (PST)
Message-ID: <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
Date: Wed, 30 Nov 2022 11:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
In-Reply-To: <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OYZfjxA9Gqc8

On 24/11/22 14:46, Philippe Mathieu-Daudé wrote:
> On 24/11/22 12:50, Peter Maydell wrote:
>> This patchset converts the TYPE_CPU base class and most subclasses
>> to use 3-phase reset. (The exception is s390, which is doing
>> something a bit odd with its reset, so the conversion there isn't
>> going to be simple like these others. So I'll do that one
>> separately.)
Note, we can then remove scripts/coccinelle/cpu-reset.cocci.
