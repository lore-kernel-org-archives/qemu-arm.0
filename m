Received: by 2002:a17:906:5814:b0:a6f:8e2c:4d9d with SMTP id m20csp355299ejq;
        Fri, 21 Jun 2024 02:44:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtdrdIgBNvfwFZ0xLXEWjM7F1i3DTFH/Z/ij7V+AFun2pBza2gWRj1blxf69kVFHKWcTjvWONzQ6AZPE0f9xBwWDII9wqt
X-Google-Smtp-Source: AGHT+IGMZC+6xiEFLrFsDQJ7382+mTb3qnMBp2fhV8HFAZKpaPDC62UfKJvi9G9z+FdPhTSNWXQY
X-Received: by 2002:a05:6808:f8b:b0:3d2:2aa8:3b2c with SMTP id 5614622812f47-3d51b9e2b73mr8775749b6e.33.1718963076679;
        Fri, 21 Jun 2024 02:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718963076; cv=none;
        d=google.com; s=arc-20160816;
        b=h54fzOVwVAPrpTJTkepmVArTcr84SNZ9gLxa6AthXHddyxug+3ihG51PhNcPwcv7Mj
         Jaq6Ady5Yma7KOtAWPQraEFgeSNd7pb6A4mNCxDtLfkkw+NXpKtm8jYIkgYoYDNc7hSu
         HuTtwFDrJ9T9NKScvg4QSAindv/KgaPKRId99/+JW8s931mrbDJqVdLj0924q1D5KxYv
         KFrK0kWL00A4QzB1LhV383CZWlkvUOVd0gkeLB+gx+/lGDalp5kbjz9SFhuguYM7W4hr
         tq5A2PrTDrWXOQxfkJkZc7/325ZLifPLt7pQo4vA9HeEUIoOu36w0H9SeOtpm4kJ0sr1
         eX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=giND5ZqoCuA5kAoC9wsVR4KinqQC2QGq888+RQsQI2w=;
        fh=mqGGZYQPurfMOh+BacL0K7YYqsvZzpRuVdkc00tSJgo=;
        b=UT42nKCq1xhQTM8XTBLxzD/jxIBaOpfYy+Az7Zc/QruqMzkrQr6SuTOkGqsJkWJqI2
         cNcuthuMUOfqy+V7RtcJowaBwar8IzDJKrCwA273/qcgl86GbubImg6/5u4UsUDy6vh0
         yJk2xhrvzaStFaGosgQBQnqX/t5wOuPOOAkxDB4y38+woE+lWfvBi8FIMmMIjItGdQ5a
         vd1m2RTIvpjSa3VzTG/punnF7hndbiQwYs7kvvRyniJl1fXzcfmYQMPauROASeo2mhAE
         wBgrbhVeQCb2ZZf8r5cNIjVG4MTHJsFJChU+1TwTPSteEqXJiZdkkxNns8yKfLaVl5U1
         yqEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJPCwb8n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9147d9si141595485a.337.2024.06.21.02.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 02:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJPCwb8n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKaok-0006YT-Un; Fri, 21 Jun 2024 05:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKaoj-0006Xy-WA
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 05:44:26 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sKaoh-0001Aw-Tj
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 05:44:25 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so294544e87.2
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718963062; x=1719567862; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=giND5ZqoCuA5kAoC9wsVR4KinqQC2QGq888+RQsQI2w=;
 b=wJPCwb8nLEEJJpwYKvsWwMHzvR0z3EPmDHRDundkPiZWtbifCoBXkhTsZKT8B1o+qb
 EWHbvKVJnzw3ssIc7ZhZN4z6JhoA1BIZeDXb1DTHH1TPaIP8LMu5aXPKiqhjUamo3H/v
 QTjszBm0cpE2FANrD8QzkKgTLe76hvXpMoa2Rm4ITs3T9OLBAgJGe7Z+JpBh2JVjtQIQ
 Q5wSWm2sCraKTC/7pIpNNL0KGpffDkJr+8ucwCluzo6L4IHzscZxBFmGmeat/zqMBzuk
 zvFQweZ/fHII9+q6tfHPWD+KWASo49O+JQ1m1PqCjvCx4flSiGlKGyD8or6+1z4yDR3H
 VRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718963062; x=1719567862;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=giND5ZqoCuA5kAoC9wsVR4KinqQC2QGq888+RQsQI2w=;
 b=hZbXT95QNXY9a4fZpiTVzgRnX6dlb+YzaLYmOEt5yoiGe3IrfDihCLijIKR6lBOUZ+
 Pf5DLpMRU6+z/CwMrEpcp+Ftqi9aAPl6wsna7kQTfuKs6kCT9tD7MoiSQd79slKTkSSP
 haTAYnU/RDXsMQfvEww6atHI/Z+Xwm+CcfMZ2ByODcoBuZuIsHI3ovz4Iwtj1k4VkdAV
 W3qMOXceORXHpDhqB/LsEhD+6UCCuL3to8xx5LOE+U4aHzmYS3k1YCJR80SonXyhGMQE
 wEz3dpuwj90h969nT0rmdZiB6DG3UHTE+bU/IA8/WWxdjp0p9AtAzcj5eYHdVkppy276
 7nHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGSO8s3SgCl00b42NTcCiMVm27w4JxcPitAcBeZRRExFP+oAwwqo2N9RgkZRu87F+ZezHRziCMfuFnQDYLvhL8WycH
X-Gm-Message-State: AOJu0YzGDtKlU5bNPeOcXbmTnZMINY7zvrcv93GKiPdie6QbZIhIfz2d
 W/nT7gNt6CRta5pGWdPM0M39EP1nzQMLOuPo3IO+lJbvcdJi9LqQM/rtbenV2+c=
X-Received: by 2002:a05:6512:1053:b0:52c:9e51:c3f with SMTP id
 2adb3069b0e04-52ccaa919aemr6475614e87.42.1718963061778; 
 Fri, 21 Jun 2024 02:44:21 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.128.209])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b445sm64272066b.82.2024.06.21.02.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 02:44:21 -0700 (PDT)
Message-ID: <37f83be9-deb5-42a1-b704-14984351d803@linaro.org>
Date: Fri, 21 Jun 2024 11:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/23] hw/sd/sdcard: Generate random RCA value
To: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shengtan Mao <stmao@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bmeng.cn@gmail.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, qemu-block@nongnu.org
References: <20240621080554.18986-1-philmd@linaro.org>
 <20240621080554.18986-10-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240621080554.18986-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5H8gok0u/Bos

On 21/6/24 10:05, Philippe Mathieu-Daudé wrote:
> Rather than using the obscure 0x4567 magic value,
> use a real random one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/sd/sd.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 30239b28bc..e1f13e316a 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -46,6 +46,7 @@
>   #include "qemu/error-report.h"
>   #include "qemu/timer.h"
>   #include "qemu/log.h"
> +#include "qemu/guest-random.h"
>   #include "qemu/module.h"
>   #include "sdmmc-internal.h"
>   #include "trace.h"
> @@ -469,11 +470,6 @@ static void sd_set_csd(SDState *sd, uint64_t size)
>       sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
>   }
>   
> -static void sd_set_rca(SDState *sd)
> -{
> -    sd->rca += 0x4567;
> -}
> -
>   FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
>   FIELD(CSR, APP_CMD,                     5,  1)
>   FIELD(CSR, FX_EVENT,                    6,  1)
> @@ -1055,7 +1051,7 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
>       case sd_identification_state:
>       case sd_standby_state:
>           sd->state = sd_standby_state;
> -        sd_set_rca(sd);
> +        qemu_guest_getrandom_nofail(&sd->rca, sizeof(sd->rca));
>           return sd_r6;

Hmm the NPCM7xx test is failing:

▶  58/450 ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read: 
assertion failed: (!memcmp(rmsg, msg, len)) ERROR

But booting various Linux / FreeBSD guests on SD cards works,
so I suppose the test (or TYPE_NPCM7XX_SDHCI model) need some
rework.

$ git grep 0x4567
tests/qtest/npcm7xx_sdhci-test.c:47:    sdhci_cmd_regs(qts, 
NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
tests/qtest/npcm7xx_sdhci-test.c-48- 
SDHC_SELECT_DESELECT_CARD);

In tests/qtest/libqos/sdhci-cmd.h:

/* CMD Reg */
#define SDHC_SEND_RELATIVE_ADDR (3 << 8)
#define SDHC_SELECT_DESELECT_CARD (7 << 8)

IIUC setup_sd_card():

card address is queried ...:

     sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0,
                    SDHC_SEND_RELATIVE_ADDR);

... but then ignored and magic 0x4567 is used instead:

     sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
                    SDHC_SELECT_DESELECT_CARD);

OK, so this test need rework. I see the sdhci_read_cmd()
method but it reads the SDHC_BDATA FIFO register, not sure
this is what should be used to read the RCA from R6 command
response.

Shengtan, Nuvoton folks, what do you think?

Thanks,

Phil.
