Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3642040lft;
        Mon, 4 Jul 2022 20:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sO5upWoGRFeNg9DxYDYZs0xVVHwgTA8++JvfDfzsfuZ6qBqkiG3pVMz5X6rf9gKRbNjywy
X-Received: by 2002:a81:746:0:b0:31c:92db:3f43 with SMTP id 67-20020a810746000000b0031c92db3f43mr11177532ywh.425.1656991860295;
        Mon, 04 Jul 2022 20:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656991860; cv=none;
        d=google.com; s=arc-20160816;
        b=cAjULoZtyPamifWHHvdozl4FpVWB9eNfrFuEmbQOOCFT5pBgb6PsiqtdRr+ey4Qz6Y
         Vg2E3MfB3EUfHYNiLpt2b5oJcSZ6GctNatbMEShH8+zsmFOt/jbxo7Uwt8rQkWqxkg14
         jkKSrQWg1GoIYUMm0OPaVH5fpL+ydhHu1CJCo+4DnLQBSpCf8cdTozuQ5qSA9IxvI2yM
         Q+txTvEvIdQY1FQRTOobFKyoouwOvToU6t1lN8+SHtLxs0xCXf9d0jPQvrQlYFf08+Ow
         7/1ML21lacWKEYUug2Ji74+hBsbawR7/EOyRVq1OokV3jiMlnP1xC/DbspzG+tdY1FB9
         aLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Md8LNZoR4D2WEeNV53PRaAMbC7DrT8tsDMf/eYLSS+U=;
        b=t41blk73zIEN0XP1dfn5VivVCRQKDxfbgtf/wI6p2fDatXIGjtEzH4/Gr5JmvcNu/u
         dSRLDkuawmIVZPMcD9EjQzOXe5wgXYP9IQcsoXEbUUahesBcZ5z53iSMmJzkFtIgFz+7
         pbAIfaRdEpcowwT2NU3XNHW0ukZEZnC1yu1jjnfymBH5UxxZugEml9uu8kY8hDiXNio6
         jBx+w0OmTdjrnu3DR5BCfyhNka5+3ciUNLLmLeHzgQev14KpQkCpsrN5H+IpmEW8bwLZ
         F6YVhYcfSROKaCAL0uPPcN9IBq924Bk4iidzip70AfzSkJmztBIucHJ4IlO0aF5880Xc
         T+sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mBI8AePl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189-20020a8113c6000000b0031c8bce5015si8347181ywt.415.2022.07.04.20.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 20:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mBI8AePl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8ZH9-0001ai-OI
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 23:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZGd-0001Zr-CQ
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:30:28 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZGa-0004ZI-Ob
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:30:27 -0400
Received: by mail-pg1-x52e.google.com with SMTP id v126so10283397pgv.11
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 20:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Md8LNZoR4D2WEeNV53PRaAMbC7DrT8tsDMf/eYLSS+U=;
 b=mBI8AePlRgTpIYc+MvVuM5OwG4q3KfDIKlfSWd+VTMr3RdLw5bui9LYq/YJ5BKXZS+
 /FmRW1NV6Q1n7lIbQtXlXvgN2AFOSJBmGDZsmyB/nU/4GJBx7zQDXcwBaPPiYne+9Pld
 PArcTCbBfLH2wDgskfT793JM1JWVCka68Q2cBFchRfVTqnS4R0O1lTI19XyaodU2gZZp
 j7s2Tm1DYZUkv7H+q9ajLqYSg6+Oc3muVIAOTk0fWKf7Zt526GY7abJFcq5T8KktebZR
 Cjq7ltxoZ0olluVlkkE2VzeX6zfeccBBskhqr/6xy9BR5nUfU8vVZy+qxnAr6Q1mx9M7
 wBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Md8LNZoR4D2WEeNV53PRaAMbC7DrT8tsDMf/eYLSS+U=;
 b=NBjz1x5d6SKYlh1jZbeqDBhG8RebpXkgOwbfJWiyFd6fHUvBr6QHOdhrI6N/j/JxBg
 HVINhPIG/0szK6LdGwi/qDyE9oc6umdaB7rnJo7CVuJa63rPChUQC77rp3YSsg+whV0E
 /K3J+Aojtp6sYKCKrQsuzvaTnXeubY9kztV8nQ+jF8IJCiTV49b727drwUFzn5YWr+Fb
 mKVAJVwdmEDMf1gWmbRnaMow2G/3eSCJOq/7E/jkH2sVFQIaW8lbZJSHmvxBiq7FrPHh
 AGbNY7jRoYPo3yZQd6/uOidD5qMgD07AMnQZMDZbGZYRoFnQ/VTFLV3JurhnQWelG/Um
 Y85Q==
X-Gm-Message-State: AJIora/gthNvIFj5KWvqT6MJTlmAjDE8b9K66BPqlWXGxDwu5tX4ZV0h
 kS1qbKi7Svz6Z4N6zpgHkudmKQ==
X-Received: by 2002:a63:195d:0:b0:412:50b8:c410 with SMTP id
 29-20020a63195d000000b0041250b8c410mr6015056pgz.520.1656991823280; 
 Mon, 04 Jul 2022 20:30:23 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a170902934a00b0016a11b9aeaasm21900255plp.225.2022.07.04.20.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:30:22 -0700 (PDT)
Message-ID: <1dcf1ad6-eb4e-5c20-b8f7-254eca7f58df@linaro.org>
Date: Tue, 5 Jul 2022 09:00:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
 <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: eoDZ6wxEufDj

On 7/4/22 17:38, Peter Maydell wrote:
>>           case TARGET_SVE_MAGIC:
>> +            if (sve || size < sizeof(struct target_sve_context)) {
>> +                goto err;
>> +            }
>>               if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>>                   vq = sve_vq(env);
>>                   sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
>> -                if (!sve && size == sve_size) {
>> +                if (size == sve_size) {
>>                       sve = (struct target_sve_context *)ctx;
>>                       break;
>>                   }
> 
> On the other hand, the kernel seems to happily allow records
> which are larger than the SVE_SIG_CONTEXT_SIZE, whereas we
> ignore the record unless there's an exact size match.

Yeah, this gets fixed properly in patch 39.
Perhaps I should simply squash this with that?


r~
