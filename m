Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp30063lfk;
        Mon, 31 Jan 2022 15:22:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjVjwCIoXqNTLkcVniZwN3Em7PvO51cXdXpr7B77HRcWspwn39Sd9p1mKq0Lje72V/fhuA
X-Received: by 2002:a05:6902:721:: with SMTP id l1mr18491551ybt.636.1643671323124;
        Mon, 31 Jan 2022 15:22:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643671323; cv=none;
        d=google.com; s=arc-20160816;
        b=YfDOJfgtmAUJxg+yK6+9ai0N0949dwIQdBEsm/e2HhPKKW7albpsmklTxNwDYMIp8i
         Y9ElgkBd+u2QCAkji19naaYZY0plBJRBKD7TpeU1+W3I24pR/HbkBFnvkZxrD51RDXIM
         EDRWjo9tb9vDtntaOSpibftfnfU8TVyZqLW6Fj2HBj8+90NvqSHBIx6y0hf+Ovyr8O7f
         bHvmcHNfUvCuCQggwDbhXU7Wd1um/kC5PGPwsfNvdakOg9zOEA9jJwh/BqTyELMpM27W
         G1fH1qinxlv8yq3LTddnqpKeXFDCQkqZEmSvtDs9Rzy42KXb8mha/N70mKesGc61F2Vp
         8qig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cLkjlkZDQKxUgZ4qhm6Im4nNBukeTMwsITVuFiLt+zk=;
        b=t4jVinjmsSU8MBBtEhU9ywCZtvEMYOHbPavfQYqsyFQRauGB0H8r6G9o2eJqEHQVAm
         ReqLOmC9y0TuYjAlG1wfrdZLO6AsivHdMbMGDPQqm07Pt+TJMf4Q33/17MbVAG16u4oh
         1dLZXWvZtBPUtcHbtAjYxL3tfGh1TsGs4iCK8lkjBWw0iNbGnXTMes2KBNg2Wn7VaZnK
         Jqr7JhZ+y1z4EXGXO8bV7sQ/tvANDPjlAyLXlouh504fAya9QNFzR6VsgeXb8Pxad3gV
         1rR+6Wm/A+X2Gkvw/4xU7Bw0ZthZTup+U3c6ZquFazJxhl3ihVJ7+ceO31VCBCVIHmhV
         K7kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Lp83HdD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v73si31145628ybb.178.2022.01.31.15.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 15:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Lp83HdD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEfzm-00010M-Io
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 18:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEfz7-0000Ok-3m; Mon, 31 Jan 2022 18:21:21 -0500
Received: from [2607:f8b0:4864:20::52a] (port=35453
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEfz5-00071X-GS; Mon, 31 Jan 2022 18:21:20 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p125so13672901pga.2;
 Mon, 31 Jan 2022 15:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLkjlkZDQKxUgZ4qhm6Im4nNBukeTMwsITVuFiLt+zk=;
 b=Lp83HdD0reqhrOyCQB/M3B5CJ4qn2o0Q+yyrKskrfSPgkQUZMHbFoxUBTW6GX90JSo
 3NDak5QvsurwcoT0T61TzkaEgoaqV3xf+X2FiOl5MzIAIbkg70Bf95BXiBiBDlb74o52
 LTiqIPZXTyL4Wu8vsnJhQU7r9JyWqe5vtIqYOeeRg0id+y9y5VSK1LUTLOt2tMonBDE2
 ikImZojsqYyuXzMAg3urGvubhIsg2qK9g6DGl1uZPqE6kXvcjHsUvbyeURUuO+EsCpLP
 RR1cHgYGp6c+ZU0Dcc+Q/LRh72J/SqutHfrlmJf1wrQBaXuscmYm21coKOMi1ymtKILh
 IG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLkjlkZDQKxUgZ4qhm6Im4nNBukeTMwsITVuFiLt+zk=;
 b=ORzlNF/yW7VIyfqNOLj922FmUz73SPse3g7y/NZx7UxlSFBi/7UpDvRBk9qllfDH47
 fp9IlUyKxigBK6RVe57hQUNxCHQEU2hJHX7mF6ZtYezs4UsEhFk7upjdYZYCVXUjh0Er
 EEEj7WRN6I/Y3PFQsM1jb/bFx/08JMrDsqIixF08/FggbUHvFjMLB+FymERf3EB0PI0f
 H3HPn5YgKh1ybGDeM4pkIo5ublDcly7GqYtr1Cjemd+mqLVH4YuB5273pMrBoBV63nSd
 /Otwg/bMJqa8nOouaeDFkY7j3TmZprhhMpgikImRQ0sK1qr2PCRdaBHZdoKhxlEuChos
 HPig==
X-Gm-Message-State: AOAM532+LwkjDvJUShiu6m0Q0Jrl+Y+UsWjEm8Wghc037XO2Iv2hD6sn
 hDYBI17S44Owe5X441L+dCE=
X-Received: by 2002:a63:e04a:: with SMTP id n10mr18848537pgj.487.1643671273059; 
 Mon, 31 Jan 2022 15:21:13 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mz23sm378396pjb.2.2022.01.31.15.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:21:12 -0800 (PST)
Message-ID: <18c91f53-56b9-76d0-dd83-73c48d35bad1@amsat.org>
Date: Tue, 1 Feb 2022 00:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU
 Control
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com,
 peter.maydell@linaro.org, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-6-edgar.iglesias@gmail.com>
 <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
 <20220131121720.GS3586016@toto>
In-Reply-To: <20220131121720.GS3586016@toto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: slGNaY/LUuh1

On 31/1/22 13:17, Edgar E. Iglesias wrote:
> On Mon, Jan 31, 2022 at 12:35:54AM +0100, Philippe Mathieu-Daudé wrote:
>> On 31/1/22 00:12, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>>
>>> Add a model of the Xilinx ZynqMP APU Control.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>> ---
>>>    include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
>>>    hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++++
>>>    hw/misc/meson.build                    |   1 +
>>>    3 files changed, 349 insertions(+)
>>>    create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
>>>    create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c

>>> +
>>> +#define NUM_CPUS 4
>>
>> Hmm isn't it APU_MAX_CPU?
>>
> 
> 
> Thanks Philippe. Yes, this was a little confusing. The values happen to be the
> same but they belong to different models. For example, the apu-ctrl model will be
> reused in Versal.
> 
> Anyways, for v2 I've renamed the macros to CRF_MAX_CPU and APU_MAX_CPU respectevly.
> I hope that makes things clearer.

Thanks!
