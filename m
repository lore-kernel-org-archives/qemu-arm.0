Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp13689lfq;
        Fri, 11 Sep 2020 07:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvx03WjpC+naaUY109pKydS3H7tWb0laghcQdh4LfM6CPGEs03UlUl5dpmO7X1E9jBjCyc
X-Received: by 2002:a25:d2d1:: with SMTP id j200mr2773272ybg.258.1599834944905;
        Fri, 11 Sep 2020 07:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599834944; cv=none;
        d=google.com; s=arc-20160816;
        b=0Bb0urSVWTsYE1VGQpU3jAaGfAJHbGIWFxfVqGbk/s5r7zqu4TArautHpH92skEY9I
         mdqZWwunMsWb93Mn+RSjs966+ugJTcFuUAhZQwzZFvtFHjkibLzYXO6+J/XGAKHLbOdx
         IGXQU/aINDaQllGF8pi5he2lk6sCMBnSSq6/Aa3RSjOrMg4IVLZpqUrhrsstFP6GpKG1
         3lYC3qX5CrpTttQJxmWGlyNktel+5j6H2+4tqzyjJh3SEELSHchfyBjd5w9brw9Dr1pz
         Y8GgiyrncrJsJ4Yi+UB2iChyf0oBbh9KcQzlmkVc9PwVgH/B8h+LxGyxQ0EpQxzo4VIc
         QgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2eYQpOd3x0Q9Yh5498CMZbfDCFLE5K2oSaR634+ivvQ=;
        b=YkQIg9lS0bBQMh6bdwsSGEyi5J6OZxrFHUrLilYMy9uKov+6cJyXMZV+JkHCk/Ojmd
         FGhisuCGD5Ub9myXF+/zFdRBRyj4Mt+U0JAW4RlEt0zSJwytaq5nDNPhWhGSttDccAnS
         EVU/xCEvESMq4h8jJXVp7bBCc+7tFmd9YqT+ZuYAaoPgi9LWO2kMy6h5eCw7lrNCXxH7
         3RFPMsqzgyTRUn5SnGgEWmWxjbG1//0idcM2ax4bzCdcwoAHNFN4oGxR53T8JBbL/M18
         /6/l/9baD4bS/bl2kos9yqD7TfCJ8lr/ayyuUayR6PX7XdzSLsVGRpjmiPSugXK/UWbA
         uhDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="o0Wk/Sd1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n205si2243280ybb.462.2020.09.11.07.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 07:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="o0Wk/Sd1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGk9Q-00021S-8C
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 10:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGk9A-0001mI-7Y; Fri, 11 Sep 2020 10:35:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGk97-000584-W3; Fri, 11 Sep 2020 10:35:27 -0400
Received: by mail-wr1-x442.google.com with SMTP id j2so11718795wrx.7;
 Fri, 11 Sep 2020 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2eYQpOd3x0Q9Yh5498CMZbfDCFLE5K2oSaR634+ivvQ=;
 b=o0Wk/Sd1KbBD6my2VYfb4zpOqSpUuE2UpBJjTZV8duqHxS+NrMK3g08dRpClc1dJAv
 dsg0ahhQEVSCmsSL2fr+qvKeNdyzESaic1OMHTndsvRi/iVEv1vFAqfB2LCPT79pkdsn
 OllGLb1+WJvH/esDnMK4lYsc07ybLSnHvIj5b5vgplLfZHohHjJQ2xA7w++lUIH+l6fa
 udf6WGawEAasjkOCH+UmGCKanRp22jCkpEEKgscUJehqtXVg2ypZHWibOs9G3SV5a1lC
 IpwEgBHcwq7UkwiLgSqceiqXRUAeozm9A+NddrEkWtA/zyQiG9514Tmd2eJJOsJM/oDy
 5oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2eYQpOd3x0Q9Yh5498CMZbfDCFLE5K2oSaR634+ivvQ=;
 b=UxEVlH60BZEGxvRl52FDSKwZ699wUmv5HlEQJiRY/n1NbeL8xoyf+pkRi3bY9p2Z5W
 1JUKD9ObsvKI6Hi4om/U77WIay5nQT4Hi+EWb//Y4wsnbOb1MVFzDtq/VZno0bGPCOcu
 q0EMdaZxYr8wKlGeF2jW6OZxWf2h5rTO7O71o/9pesQ0O0mst5BU43KjUKVa/v4MkZz0
 Dbp338vNHgQ515EzkbHuAm3dLVuygMUJRzfVi/+7Vqg4SB+MddTpOozLjgBKKCJo8lFQ
 WBvgI9ctWlUEsbE/hcdsNL2TWNjN2c3nZkDNa6W8+Teybf8V3ru2Qsr5tmBkUVRHxe8s
 pP6w==
X-Gm-Message-State: AOAM532e/LIocMSkOBKLiJ1t5dspnSKoccnukXyH4J9y/uh2r7FhDBIf
 P4B8Bb8SByAtsT4u7H2F27WBdiOVrP8=
X-Received: by 2002:adf:f24f:: with SMTP id b15mr2544132wrp.301.1599834921121; 
 Fri, 11 Sep 2020 07:35:21 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id p9sm4537370wma.42.2020.09.11.07.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 07:35:20 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20200822180950.1343963-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d91cbe5f-9a24-dbc7-c726-2e3eda8e980a@amsat.org>
Date: Fri, 11 Sep 2020 16:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200822180950.1343963-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Zhang Chen <chen.zhang@intel.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IC0YV3f/mzUD

Hi Laurent,

On 8/22/20 8:09 PM, Philippe Mathieu-Daudé wrote:
> - Pass const void* buffer
> - Reorder arguments
> 
> Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   util/hexdump: Convert to take a void pointer argument
>   util/hexdump: Reorder qemu_hexdump() arguments

This series is fully reviewed, can it go via
your qemu-trivial tree?

Thanks,

Phil.
