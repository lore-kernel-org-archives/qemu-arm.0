Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp181873ejb;
        Thu, 7 Sep 2023 01:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF27mSkGG8hIj/cmbzgSvVQ5CF0e79jF0FmTtVt6JgmvZIqAe87lm5u+ADrNb+Yc9CqUBqo
X-Received: by 2002:ac8:7c53:0:b0:412:916:bee5 with SMTP id o19-20020ac87c53000000b004120916bee5mr25534632qtv.7.1694076931866;
        Thu, 07 Sep 2023 01:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694076931; cv=none;
        d=google.com; s=arc-20160816;
        b=o13LQVA8FTGBZfaoJcwBoVh2BsviVYgFePg5LmRJlDmYx1HEZKtpNmd4l1GIvqoxNn
         bA477ZPWf9C0yKpa+5NXILVKZkHhDCSH9pSWo6tXOqtky3XcdQDcrgcj6BYjDj/qsVvx
         LAqFr8Ld/KMoYAq/zx+YLbbDi+g/HTAezLWOX+ZO3r53DHjm3E/6wjIzTwhjA+j9RL6o
         nFBKOlaB8q4uhDJDGpD08Ya/hkmd3U0B3EiQzZxOR2wJuW9REM1xPfMAJlLGPN10POqQ
         iBzl/X1CPaHFaWFxscvBHp8gIzE7/tsm/8+7CLL7ttiToO8veWwWBuN8hnOcKVbK/vyW
         HJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a0TqEG6zDRSkYYAUrJKaEhEYdZdOL/5N4fBUkiY/+fo=;
        fh=IgOkjrcilc0xkoP5YFLtGNcQdAFJIcpaUjEHlrWyehA=;
        b=Rz6pkU+l0DFIfHpu5V8yi+n2pwdQB8MFI0bysGPQfbegFJT/eFyZSh7cwpKMQMZb4/
         ajP+IqIa3Q0mGaJAj23znHePUnRNkkmw3rKLSudvS2ey/BQJOrS9zDBcMipubykbF4jw
         HLuUFfaCckyCvPUQIoMvMVAsIOUliQX+oXaI5EKIkqm/pQi8Be6549nXvu8XCWH8BCSP
         /QFHJeoWT5NXmSQvKdydgLcKVC+QyDLOH9s/pHGerTLnwd9Euj4lqfV3Aa65T98Hd52f
         UmdeSGj9TsNY2perJhuw50ysP/Z1ciAUW8vVKyB+F95PsTcD2OBFt+qfJbDofrvPthnm
         5eIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bc7LOQSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20-20020a05622a13d400b00403aa809bf9si10870289qtk.381.2023.09.07.01.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 01:55:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bc7LOQSw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeAml-0004DZ-KP; Thu, 07 Sep 2023 04:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAmj-0004DA-IS
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 04:54:45 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeAmh-0005AN-8B
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 04:54:45 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso12494051fa.1
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694076881; x=1694681681; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0TqEG6zDRSkYYAUrJKaEhEYdZdOL/5N4fBUkiY/+fo=;
 b=bc7LOQSwIZCZmrHgMKwrWrWZljhLAw+B3PQ/PaKQ2eA1flMEN4XgYHFB3M6Jse7XDS
 3ims3L9opjgOgwHE4zgm7K7ZhS0Bcdi3P82uxbjd6OVEEUJls9uh6izJxhZKn38VISyi
 9qx8PWx0ZxXQFLwyoO15tJ5n6DJxrRMVUs7va+N0gzlKibZm4rljOMperW3E4Vso7Pk6
 c7j/cDbGO59P9eGwsuu5YMpLHxKQgitiqEffTuHYvJTcHxq5dujEpB0tSkqpIrdPx2cU
 Er/m3mSQvM1LjlusvmGo6sUIsBha9ZYWI/pZwgB6RVj9ygjzoe4wfOs5LP+76mRtqHY7
 dFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694076881; x=1694681681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0TqEG6zDRSkYYAUrJKaEhEYdZdOL/5N4fBUkiY/+fo=;
 b=Xkod1HdszfFfb2VPBEJCG5ze81fY2o85OsC9i7JF8O5R2oepCF/F7TB6MlV/J1SVfw
 faux69ceCimo1D9Z/slT4XjF8BMeIen3hIejkZ56qmuUzO2KqZU7kkHV+vlrdWQG5sE6
 wyvN9J58KD4mPX27ioEkF4asyUjL/utJqs1bzhEt4zb1T/pfMFDp9F/aVUfvSi/LabDT
 KX7aPa95Xv8unJUQ5Ix0pGtk/LZhk1g179g3fKcnpzQeudWm2iINv80hH+pxH3bxo4Vh
 BPgxfF2FTIuX7vwvKBqdPR4eHzYd8vD4Fn1bXJd46ohCpo5szPrzHx4Sn65dv0Ya900+
 AivA==
X-Gm-Message-State: AOJu0Yw0jwjZK+2n0o2SPJ3RUWXizPhy9o0KpJ0SWanAy+EkKmw/IVzr
 SVYdUiUJqK6gKXiSqy8FGenHQHwUtjnlbgeiIHM=
X-Received: by 2002:a2e:9303:0:b0:2bc:f252:6cc4 with SMTP id
 e3-20020a2e9303000000b002bcf2526cc4mr3365753ljh.10.1694076881150; 
 Thu, 07 Sep 2023 01:54:41 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 lj17-20020a170906f9d100b009829dc0f2a0sm10129733ejb.111.2023.09.07.01.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:54:40 -0700 (PDT)
Message-ID: <923ad3bf-4663-248a-aaf2-cd596d5ec0b2@linaro.org>
Date: Thu, 7 Sep 2023 10:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 01/32] cpu: Add helper cpu_model_from_type()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-2-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907003553.1636896-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: KY6LiBx/whwd

On 7/9/23 02:35, Gavin Shan wrote:
> Add helper cpu_model_from_type() to extract the CPU model name from
> the CPU type name in two circumstances: (1) The CPU type name is the
> combination of the CPU model name and suffix. (2) The CPU type name
> is same to the CPU model name.
> 
> The helper will be used in the subsequent patches to conver the

"patches to conver" -> "commits to convert"

> CPU type name to the CPU model name.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   cpu.c                 | 16 ++++++++++++++++
>   include/hw/core/cpu.h | 12 ++++++++++++
>   2 files changed, 28 insertions(+)

